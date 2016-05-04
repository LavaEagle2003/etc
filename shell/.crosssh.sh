ghclone() {
  git clone https://github.com/${1}.git
}

pclean() {
  sudo pacman -Rns $(pacman -Qdtq)
}

testnet() {
  ping duckduckgo.com
}

sprunge() {
    cat $1 | curl -F 'sprunge=<-' http://sprunge.us
}

pio() {
  case $1 in
    -f) curl -sT- https://p.iotek.org < $2 ;;
  esac
}

up() {
    test -z '$1' && cd .. && pwd && return 0
    for i in $(seq 1 $1); do up=../$up; done
    cd $up
    pwd
}




export EDITOR=nvim
export LESS='-F -g -i -M -R -S -w -X -z-4'
alias tls="tmux ls"
alias tswitch="tmux switch -t"
alias tkill="tmux kill-session -t"
alias rm="rm -I"
alias :q=exit
alias py='python'
alias py2='python2'
alias code='nvim /usr/lib/python3.5/'
alias l='ls --color'
alias ll='ls -l'

#man() {
#   env LESS_TERMCAP_mb=$'\E[01;31m' \
#    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
#    LESS_TERMCAP_me=$'\E[0m' \
#    LESS_TERMCAP_se=$'\E[0m' \
#    LESS_TERMCAP_so=$'\E[38;5;246m' \
#    LESS_TERMCAP_ue=$'\E[0m' \
#    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
#    man "$@"
#}


prompt () {
  _ERR=$?
  exit_color=6
  if [[ $_ERR -ne 0 ]]; then
    exit_color=1
  fi
  dir="$(tput setaf 2)$(pwd | sed -e "s/\/home\/$USER/~/")"
  arrow="$(tput setaf $exit_color)───"
  echo -n "${dir}\n${arrow}$(tput sgr0) "
}

PS1='$(prompt) '

ex() {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2) tar xvjf $1 ;;
            *.tar.gz) tar xvzf $1 ;;
            *.bz2) bunzip2 $1 ;;
            *.gz) gunzip $1 ;;
            *.tar) tar xvf $1 ;;
            *.tbz2) tar xvjf $1 ;;
            *.tgz) tar xvzf $1 ;;
            *.xz) unxz $1 ;;
            *.zip) unzip $1 ;;
            *.Z) uncompress $1 ;;
            *) echo 'cannot be extracted' ;;
        esac
    else
        echo 'not valid file'
    fi
}




PATH="$HOME/bin:$PATH"
PATH="$HOME/.scripts:$HOME/.local/bin:$PATH"

bind ^L=clear-screen

# vim: set ft=sh:
