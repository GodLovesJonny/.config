set -g -x RANGER_LOAD_DEFAULT_RC FALSE

export PATH="$PATH:/home/godlovesjonny/Jonny/Installs/flutter/bin"
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
export PATH="/home/godlovesjonny/Jonny/Installs/flutter/bin:$PATH"

alias ra='ranger'
alias cl='clear'
alias ipy='ipython'
alias jn='jupyter notebook'
alias utd='sudo pacman -Syu'
alias dop='sudo pacman -R (pacman -Qdtq)'
alias condapip='/opt/anaconda/bin/pip'
alias qb='qutebrowser'
alias msf='msfconsole'
alias v2r='/usr/bin/v2rayL/v2rayLui'
alias le='exa'
alias lel='exa -l'
alias startsun='systemctl start runsunloginclient'
alias cdt='cd ~/Jonny/Open-Source/Translation-Scripts/Linux-cn-Translation/todo/'
alias dblog='hugo server -D > ~/hugo_log.log &'

thefuck --alias | source
