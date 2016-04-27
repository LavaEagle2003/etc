ghclone() {
  git clone https://github.com/${1}.git
}

pclean() {
  sudo pacman -Rns $(pacman -Qdtq)
}

testnet() {
  ping duckduckgo.com
}

haste() { 
a=$(cat); curl -X POST -s -d "$a" http://hastebin.com/documents | awk -F '"' '{print "http://hastebin.com/"$4}';
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

prompt () {
  _ERR=$?
  exit_color=6
  if [[ $_ERR -ne 0 ]]; then
    exit_color=1
  fi
  dir="$(tput setaf 8)$(pwd | sed -e "s/\/home\/$USER/~/")"
  arrow="$(tput setaf $exit_color)───"
  echo -n "${dir}\n${arrow}$(tput sgr0) "
}

PS1=$(prompt)



PATH="$HOME/bin:$PATH"
PATH="$HOME/.scripts:$HOME/.local/bin:$PATH"

# vim: set ft=sh:
