export ZSH="$HOME/.oh-my-zsh"
[ -f ~/.env ] && export $(grep -v '^#' ~/.env | xargs)

setopt prompt_subst
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
autoload bashcompinit && bashcompinit
autoload -Uz compinit
compinit
source <(kubectl completion zsh)

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^w' autosuggest-execute
bindkey '^e' autosuggest-accept
bindkey '^u' autosuggest-toggle
bindkey '^L' vi-forward-word
bindkey '^k' up-line-or-search
bindkey '^j' down-line-or-search

eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
# zstyle ':omz:update' mode auto      # update automatically without asking

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR=/opt/homebrew/bin/nvim

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# export PATH="/opt/homebrew/opt/qt@5/bin:$PATH"
# export LDFLAGS="-L/opt/homebrew/opt/qt@5/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/qt@5/include"
# export PKG_CONFIG_PATH="/opt/homebrew/opt/qt@5/lib/pkgconfig"
# export PATH="/opt/homebrew/bin/qmake:$PATH"
# printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "zsh" }}\x9c'
export PATH="/Users/ftl/.cargo/bin:$PATH"
# PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"
# export PATH
# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/ftl/.lmstudio/bin"
# End of LM Studio CLI section

alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"
alias ltree="eza --tree --level=2  --icons --git"
alias la=tree
alias cat=bat

