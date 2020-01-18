var siteConfig = {
    site_name: "",
    site_logo: "集装箱",
    menu_list: [
        {
            title: "集装箱",
            icon: "addon-icon icon-0023",
            list: [
                {
                    title: "插件信息",
                    url: "/page/jzx/info.html",
                    name: "jzx_info"
                }
            ]
        },
        {
            title: "科学上网",
            icon: "addon-icon icon-1f1f3",
            list: [
                {
                    title: "谷歌助手",
                    url: "/page/kxsw/ggzs.html",
                    name: "kxsw_ggzs"
                },
                {
                    title: "代理列表",
                    url: "/page/kxsw/dllb.html",
                    name: "kxsw_dllb"
                }
            ]
        },
        {
            title: "网盘助手",
            icon: "addon-icon icon-1f1f5",
            list: [
                {
                    title: "插件信息",
                    url: "/page/wpzs/info.html",
                    name: "wpzs_info"
                },
                {
                    title: "功能配置",
                    url: "/page/wpzs/option.html",
                    name: "wpzs_option"
                },
                {
                    title: "我的分享",
                    url: "/page/wpzs/share.html",
                    name: "wpzs_share"
                }
            ]
        },
        {
            title: "优惠购",
            icon: "addon-icon icon-1f1ed",
            url: "javascript:;",
            list: [
                {
                    title: "插件信息",
                    url: "/page/yhg/info.html",
                    name: "yhg_info"
                },
                {
                    title: "功能配置",
                    url: "/page/yhg/option.html",
                    name: "yhg_option"
                },
                {
                    title: "天天省钱",
                    url: "/page/yhg/ttsq.html",
                    name: "yhg_ttsq"
                }
            ]
        },
        {
            title: "增益功能",
            icon: "addon-icon icon-1f1f9",
            url: "javascript:;",
            list: [
                {
                    title: "下载卫士",
                    url: "/page/gain/xzws.html",
                    name: "gain_xzws"
                }
            ]
        }
    ]
};
var siteUi = (function () {
    var obj = {};

    obj.initTitle = function () {
        if (siteConfig.site_name) {
            document.title = document.title + " - " + siteConfig.site_name;
        }
    };

    obj.initLogo = function () {
        $(".layui-logo").html(siteConfig.site_logo);
    };

    obj.initMenu = function (menuCurrent) {
        new Vue({
            el: "#sider-menu",
            data: {
                menu_current: menuCurrent,
                menu_list: siteConfig.menu_list
            }
        });
    };

    obj.addonReady = function (callback) {
        var readyInt = setInterval(function () {
            if ($("body").hasClass("nd-addon-ready")) {
                callback && callback();
                clearInterval(readyInt);
            }
        }, 500);
    };

    obj.init = function () {
        obj.initTitle();
        obj.initLogo();
    };

    return obj.init(), obj;
})();