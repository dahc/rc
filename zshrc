PROMPT='%B%F{white}[%n@%m %F{blue}%(4~|.../|)%3~%F{white}]$ %f%b'
RPROMPT='%B%F{white}[%(?.%F{green}.%F{red})%?%F{white}|%D{%H:%M %Z}]%f%b'
set -o vi
bindkey -M vicmd '?' history-incremental-search-backward
bindkey '^R' history-incremental-search-backward
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
