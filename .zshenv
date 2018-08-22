typeset -U path
path=(~/.bin $path)

export EDITOR='vim'
export VISUAL='vim'
# export BROWSER='qutebrowser'
export BROWSER='firefox'
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/bin/openssl-1.0
# export XDG_CONFIG_HOME='~/.config'

export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'

#Coloring less command
export LESS=-R
export LESS_TERMCAP_me=$(printf '\e[0m')
export LESS_TERMCAP_se=$(printf '\e[0m')
export LESS_TERMCAP_ue=$(printf '\e[0m')
export LESS_TERMCAP_mb=$(printf '\e[1;32m')
export LESS_TERMCAP_md=$(printf '\e[1;34m')
export LESS_TERMCAP_us=$(printf '\e[1;32m')
export LESS_TERMCAP_so=$(printf '\e[1;44;1m')




