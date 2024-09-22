# add dir auto completion
zstyle ":completion:*" special-dirs true
autoload -Uz compinit
compinit

# add execution time
function pre_exec() {
  timer=${timer:-$SECONDS}
}

function pre_cmd() {
  if [ $timer ]; then
    timer_show=$(($SECONDS - $timer))
    export RPROMPT="%F{cyan}${timer_show}s %{$reset_color%}"
    unset timer
  fi
}

zmodload zsh/datetime
autoload -Uz add-zsh-hook
add-zsh-hook precmd pre_cmd
add-zsh-hook preexec pre_exec

# change navigation keys
bindkey "^[[1;5C" forward-word # ctrl + arrow right
bindkey "^[[1;5D" backward-word # ctrl + arrow right
