if status is-interactive

if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

fundle plugin 'pure-fish/pure'
fundle plugin 'PatrickF1/fzf.fish'
fundle plugin 'justinmayer/virtualfish'

fundle init

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
export HELM_EXPERIMENTAL_OCI="1"
export PASSWORD_STORE_DIR="$HOME/Git/store"
export LANG=en_US.UTF-8

fish_config theme choose "Mono Smoke"

end
