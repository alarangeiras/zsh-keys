zstyle ":completion:*" special-dirs true
autoload -Uz compinit
compinit

bindkey "^[[1;5C" forward-word # ctrl + arrow right
bindkey "^[[1;5D" backward-word # ctrl + arrow right
