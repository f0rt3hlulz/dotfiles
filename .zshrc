# Zsh Configuration File (~/.zshrc)

# --- Oh My Zsh Configuration ---
# Sets the installation directory for Oh My Zsh.
# Oh My Zsh is a community-driven framework for managing Zsh configuration.
# It provides themes, plugins, and helper functions.
export ZSH="$HOME/.oh-my-zsh"

# --- Load Environment Variables from .env file ---
# Checks if a file named '.env' exists in the home directory.
# If it does, it sources this file to load environment variables.
# `grep -v '^#'` filters out comments.
# `xargs` constructs arguments for the `export` command.
# This is a common way to load sensitive or machine-specific variables without
# hardcoding them into version-controlled dotfiles.
[ -f ~/.env ] && export $(grep -v '^#' ~/.env | xargs)
# This command is for codex, to continue previous session.
codex() {
      if [[ $1 == continue ]]; then
        shift
        # reopen most‑recent session, passing along any extra args if you like
        command codex -v "$(command codex --history | head -n1 | awk '{print
$1}')" "$@"
      else
        command codex "$@"
      fi
}


# --- Zsh Options and Completions ---
# `setopt prompt_subst`: Enables parameter expansion, command substitution,
# and arithmetic expansion in the prompt. Essential for dynamic prompts like Starship.
setopt prompt_subst

# `zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'`: Configures Zsh's completion system.
# This specific rule makes tab completion case-insensitive for lowercase input by default.
# e.g., typing 'doc' and pressing Tab could complete to 'Documents'.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# `autoload bashcompinit && bashcompinit`: Loads and initializes Bash completion compatibility.
# This allows Zsh to use completion scripts written for Bash.
autoload bashcompinit && bashcompinit

# `autoload -Uz compinit` and `compinit`: Loads and initializes Zsh's own powerful completion system.
# `-U` allows loading insecure files (common for user-installed completions).
# `-z` checks if compinit has already been initialized.
autoload -Uz compinit
compinit

# --- Kubectl Completion ---
# Sources the Zsh completion script for kubectl (Kubernetes command-line tool).
# This provides tab completion for kubectl commands and arguments.
# The `<(kubectl completion zsh)` part uses process substitution to run the command
# and feed its output directly to `source`.
source <(kubectl completion zsh)

# --- Zsh Autosuggestions ---
# Sources the zsh-autosuggestions plugin, which suggests commands as you type
# based on your history and completions.
# Assumes zsh-autosuggestions was installed via Homebrew, as it uses `brew --prefix`.
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# Custom keybindings for zsh-autosuggestions:
bindkey '^w' autosuggest-execute  # Ctrl+W: Execute the current suggestion.
bindkey '^e' autosuggest-accept   # Ctrl+E: Accept the current suggestion (same as right arrow or End).
bindkey '^u' autosuggest-toggle   # Ctrl+U: Toggle autosuggestions on/off for the current session.

# --- Custom Keybindings (Vim-like word navigation and history search) ---
bindkey '^L' vi-forward-word     # Ctrl+L: Move forward one word (Vim style).
bindkey '^k' up-line-or-search    # Ctrl+K: Move up a line or search history if at the prompt.
bindkey '^j' down-line-or-search  # Ctrl+J: Move down a line or search history if at the prompt.

# --- Starship Prompt ---
# Initializes Starship, a highly customizable cross-shell prompt.
# `eval "$(starship init zsh)"` sets up Starship to take over the Zsh prompt.
eval "$(starship init zsh)"
# Explicitly sets the path to the Starship configuration file.
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# --- Oh My Zsh Update Setting (Commented Out) ---
# `zstyle ':omz:update' mode auto`: If uncommented, Oh My Zsh would update automatically
# without prompting the user.
# zstyle ':omz:update' mode auto

# --- Language Environment (Commented Out) ---
# `export LANG=en_US.UTF-8`: Example of how to set the language and character encoding
# for the terminal session. This is often necessary for correct display of special characters.
# export LANG=en_US.UTF-8

# --- Default Editor ---
# Sets the default text editor to Neovim (nvim), installed via Homebrew.
# This is used by various command-line tools when they need to open a file for editing.
export EDITOR=/opt/homebrew/bin/nvim

# --- NVM (Node Version Manager) ---
# Sets the directory for NVM.
export NVM_DIR="$HOME/.nvm"
# Loads NVM if it's installed. This line sources the nvm.sh script.
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# Loads NVM's bash completion if it's installed.
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# --- Qt Paths (Commented Out) ---
# These lines are commented out but show how one might configure PATH and other
# environment variables for a specific version of Qt (a cross-platform application framework)
# installed via Homebrew.
# export PATH="/opt/homebrew/opt/qt@5/bin:$PATH"
# export LDFLAGS="-L/opt/homebrew/opt/qt@5/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/qt@5/include"
# export PKG_CONFIG_PATH="/opt/homebrew/opt/qt@5/lib/pkgconfig"
# export PATH="/opt/homebrew/bin/qmake:$PATH"

# --- Warp Terminal Hook (Commented Out or Inactive) ---
# This line appears to be a hook or special escape sequence for the Warp terminal emulator.
# It might be used by Warp to identify that the .zshrc has been sourced.
# printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "zsh" }}\x9c'

# --- Cargo (Rust Package Manager) Path ---
# Adds the Cargo bin directory (`~/.cargo/bin`) to the PATH.
# This is where Rust binaries installed via `cargo install` are placed.
export PATH="/Users/ftl/.cargo/bin:$PATH"

# --- WezTerm Path (Commented Out) ---
# Example of adding WezTerm's MacOS application bundle's binary directory to PATH.
# PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"
# export PATH

# --- LM Studio CLI Path ---
# This section was added by the LM Studio CLI installer.
# It adds the LM Studio binary directory to the PATH.
# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/ftl/.lmstudio/bin"
# End of LM Studio CLI section

# --- Aliases ---
# Custom shortcuts for common commands.

# `l`: Lists files with eza (a modern replacement for `ls`) using long format, icons,
#      Git status, and showing all files (including hidden).
alias l="eza -l --icons --git -a"

# `lt`: Displays a tree view of files using eza, up to 2 levels deep,
#       with long format, icons, and Git status.
alias lt="eza --tree --level=2 --long --icons --git"

# `ltree`: Similar to `lt`, displays a tree view with eza, 2 levels deep, icons, and Git status.
alias ltree="eza --tree --level=2  --icons --git"

# `la`: Alias for `tree` (a standard command-line directory tree viewer).
#       This might be a personal preference if `eza --tree` is not always desired,
#       or if `tree` offers different options.
alias la=tree

# `cat`: Replaces the standard `cat` command with `bat`.
#        `bat` is a `cat` clone with syntax highlighting and Git integration.
alias cat=bat

# ──────────────────────────────────────────────────────────────────────────────
# Persist and enlarge Zsh’s own command history
# (this has no effect on tmux’s scrollback buffer)
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Immediately append each typed command to the history file,
# and share it across all running Zsh sessions.
setopt inc_append_history     # append commands as they are entered
setopt share_history          # share history across sessions
setopt hist_ignore_dups       # ignore duplicate commands
setopt hist_reduce_blanks     # remove superfluous blanks from history entries

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/ftl/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
