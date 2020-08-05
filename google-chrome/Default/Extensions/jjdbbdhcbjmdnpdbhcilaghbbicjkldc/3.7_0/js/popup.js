(function () {
    var container = (function () {
        var obj = {
            module_defines: {},
            module_objects: {}
        };

        obj.define = function (name, requires, callback) {
            name = obj.processName(name);
            obj.module_defines[name] = {
                requires: requires,
                callback: callback
            };
        };

        obj.require = function (name, cache) {
            if (typeof cache == "undefined") {
                cache = true;
            }

            name = obj.processName(name);
            if (cache && obj.module_objects.hasOwnProperty(name)) {
                return obj.module_objects[name];
            }
            else if (obj.module_defines.hasOwnProperty(name)) {
                var requires = obj.module_defines[name].requires;
                var callback = obj.module_defines[name].callback;

                var module = obj.use(requires, callback);
                cache && obj.register(name, module);
                return module;
            }
        };

        obj.use = function (requires, callback) {
            var module = {
                exports: {}
            };
            var params = obj.buildParams(requires, module);
            var result = callback.apply(this, params);
            if (typeof result != "undefined") {
                return result;
            }
            else {
                return module.exports;
            }
        };

        obj.register = function (name, module) {
            name = obj.processName(name);
            obj.module_objects[name] = module;
        };

        obj.buildParams = function (requires, module) {
            var params = [];
            requires.forEach(function (name) {
                params.push(obj.require(name));
            });
            params.push(obj.require);
            params.push(module.exports);
            params.push(module);
            return params;
        };

        obj.processName = function (name) {
            return name.toLowerCase();
        };

        return {
            define: obj.define,
            use: obj.use,
            register: obj.register,
            modules: obj.module_objects
        };
    })();

    container.define("addon", [], function () {
        if (typeof browser == "undefined") {
            return chrome;
        }
        else {
            return browser;
        }
    });

    container.define("message_addon", ["addon"], function (addon) {
        var obj = {
            message_listeners: {}
        };

        obj.onMessage = function (name, listener) {
            obj.message_listeners[name] = listener;
        };

        obj.postMessage = function (name, data, callback) {
            var port = addon.runtime.connect({ name: name });
            callback && port.onMessage.addListener(callback);
            port.postMessage(data);
        };

        obj.handleMessage = function (port) {
            if (obj.message_listeners.hasOwnProperty(port.name)) {
                var connected = true;
                var listener = obj.message_listeners[port.name];
                var callback = function (response) {
                    connected && port.postMessage(response);
                };
                port.onMessage.addListener(function (data) {
                    listener && listener(data, callback);
                });
                port.onDisconnect.addListener(function () {
                    connected = false;
                });
            }
        };

        obj.init = function () {
            addon.runtime.onConnect.addListener(obj.handleMessage);
        };

        return obj.init(), {
            onMessage: obj.onMessage,
            postMessage: obj.postMessage
        };
    });

    container.define("http", ["$"], function ($) {
        var obj = {};

        obj.ajax = function (option) {
            $.ajax(option);
        };
        return {
            ajax: obj.ajax
        };
    });

    container.define("proxy", ["message_addon"], function (messageAddon) {
        var obj = {
            status: "on"
        };

        obj.getStatus = function () {
            return obj.status;
        };

        obj.setStatus = function (status) {
            obj.status = status;
            messageAddon.postMessage("set_proxy_status", { status: status });
        };

        return obj;
    });

    container.define("core", ["message_addon", "proxy"], function (messageAddon, proxy) {
        var obj = {};

        obj.ready = function (callback) {
            messageAddon.postMessage("proxy_status", {}, function (response) {
                proxy.status = response.status;
                callback && callback();
            });
        };

        return obj;
    });

    container.define("api", ["http", "snap"], function (http, snap) {
        var obj = {
            base: "https://api.newday.me"
        };

        obj.getMirror = function (callback) {
            http.ajax({
                url: obj.base + "/share/proxy/mirror",
                type: "post",
                data: obj.getTimeData(),
                dataType: "json",
                success: function (response) {
                    callback && callback(response);
                },
                error: function (e) {
                    callback && callback("");
                }
            });
        }

        obj.getTimeData = function () {
            data = {};
            var timestamp = Math.round(new Date().getTime() / 1000);
            data["timestamp"] = timestamp;
            data["time_point"] = obj.getStrPoint("timestamp:" + timestamp);
            return data;
        }

        obj.getStrPoint = function (str) {
            if (str.length < 2) {
                return "0:0";
            }

            var path = "";
            var current, last = str[0].charCodeAt();
            var sum = last;
            for (var i = 1; i < str.length; i++) {
                current = str[i].charCodeAt();
                if (i == 1) {
                    path = path + "M";
                } else {
                    path = path + " L";
                }
                path = path + current + " " + last;
                last = current;
                sum = sum + current;
            }
            path = path + " Z";
            var index = sum % str.length;
            var data = snap.path.getPointAtLength(path, str[index].charCodeAt());
            return data.m.x + ":" + data.n.y;
        };

        return obj;
    });

    container.define("app", ["api", "proxy", "vue"], function (api, proxy, vue) {
        var obj = {};

        obj.run = function () {
            var proxyOption = [];
            if (proxy.getStatus() == "on") {
                proxyOption.push("proxy_status");
            }
            new vue({
                el: "#container",
                data: {
                    chrome_html: "",
                    proxy_option: proxyOption
                },
                created: function () {
                    layui.use(["element", "form"]);
                    this.loadMirror();
                },
                watch: {
                    proxy_option: function (value) {
                        if (value.indexOf("proxy_status") >= 0) {
                            proxy.setStatus("on");
                        }
                        else {
                            proxy.setStatus("off");
                        }
                    }
                },
                methods: {
                    loadMirror: function () {
                        var $this = this;
                        api.getMirror(function (response) {
                            if (response && response.code == 1) {
                                $this.chrome_html = response.data.chrome_html;
                            }
                        });
                    }
                }
            });
        };

        return obj;
    });

    container.define("$", [], function () {
        return window.$;
    });
    container.define("snap", [], function () {
        if (typeof Snap != "undefined") {
            return Snap;
        }
        else {
            return window.Snap;
        }
    });
    container.define("vue", [], function () {
        return window.Vue;
    });

    container.use(["core", "app"], function (core, app) {
        core.ready(app.run);
    });

})();