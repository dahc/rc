# I don't like feature-packed shells really... the main reason I use zsh
# is that I like this prompt, and expressing the same thing in bash is a
# bloody nightmare.
PROMPT='%B%F{white}[%n@%m %F{blue}%(4~|.../|)%3~%F{white}]$ %f%b'
RPROMPT='%B%F{white}[%(?.%F{green}.%F{red})%?%F{white}|%D{%H:%M %Z}]%f%b'

# An example of why I don't like some of zsh's "features": It will notice
# that my EDITOR environment variable is set to vim and magically switch to
# vi mode, so to use the shell like a normal damn person I have to
# explicitly say I want it to stay in emacs mode.
bindkey -e

# Since I seem to be establishing myself as an old curmudgeon anyway, I'll
# say that for the most part I'm not a fan of aliases, except for purely
# aesthetic ones like these. I switch machines a lot, so it behooves me to
# actually remember which flags I want/need, and I will certainly forget
# such things if I don't type them on a regular basis. I have a similar
# philosophy about shell history (if it's important, it should be written
# down somewhere that isn't lost/clobbered so easily).
alias tree="tree -C"
alias ls="ls --color=auto"

export VAGRANT_DEFAULT_PROVIDER="libvirt"
export EDITOR="/usr/bin/vim"
export PAGER="/usr/bin/less -F"
export PATH="$HOME/go/bin:$HOME/.local/bin:$PATH"
