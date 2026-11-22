# ok
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Load pure theme
zinit ice pick"async.zsh" src"pure.zsh" # with zsh-async library that's bundled with it.
zinit light sindresorhus/pure

zinit light zsh-users/zsh-autosuggestions
#zinit light zsh-users/zsh-syntax-highlighting
zinit light zdharma-continuum/fast-syntax-highlighting

source <(fzf --zsh)

# setup keys

bindkey '^ ' autosuggest-accept
bindkey '^E' end-of-line

my-backward-delete-word() {
    local WORDCHARS=""
    zle backward-delete-word
}
zle -N my-backward-delete-word
bindkey '^W' my-backward-delete-word

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

zstyle ':completion:*' menu select

# env vars and aliases

alias vim="nvim"
alias ff='vim $(fzf)'
alias ls="eza"
alias :wq!="exit"

export VISUAL="nvim"
export EDITOR="nvim"
export NNN_OPENER="nvim"
export FZF_DEFAULT_OPTS="--color=bg+:-1,bg:-1,spinner:0,hl:51"
export FZF_DEFAULT_COMMAND="rg --files --hidden -g !.git"
export GOPATH="$HOME/.go"
export PATH="$PATH:$HOME/.go/bin"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:/usr/local/bin"
export HELM_EXPERIMENTAL_OCI="1"
export PASSWORD_STORE_DIR="$HOME/Git/store"
export LANG=en_US.UTF-8

# setup select and autocorrect

# 1. Initialize the Zsh completion system
autoload -Uz compinit && compinit

# 2. Enable completion menu selection (use arrow keys to navigate matches)
zstyle ':completion:*' menu select

# 3. Configure completers: standard completion, then approximate matching (autocorrect)
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# 4. Allow case-insensitive, partial-word, and substring path matching
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# 5. Optional: Prompt to autocorrect mistyped commands and path arguments on Enter
setopt CORRECT
setopt CORRECT_ALL

# fix ../

setopt AUTO_CD
