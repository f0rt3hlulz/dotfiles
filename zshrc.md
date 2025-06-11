# Zsh and .zshrc Configuration

This document provides an overview of Zsh (Z Shell), the purpose of the `.zshrc` configuration file, an explanation of this project's `.zshrc`, and tips for usage and further customization.

## What is Zsh?

Zsh is a powerful and highly customizable Unix shell that extends the capabilities of traditional shells like Bash. It offers features such as:

*   Advanced tab completion
*   Improved globbing (wildcard expansion)
*   Spelling correction
*   Themeable prompts
*   A rich plugin and framework ecosystem (e.g., Oh My Zsh, Prezto)

## The `.zshrc` File

The `.zshrc` file is a script that Zsh executes whenever you start an interactive shell session. It's the primary place to customize your Zsh environment, including:

*   Setting environment variables.
*   Defining aliases (shortcuts for longer commands).
*   Writing custom functions.
*   Configuring shell options (`setopt`, `unsetopt`).
*   Loading plugins and themes.
*   Setting up your command prompt.

## Current `.zshrc` File Explained

This project's `.zshrc` file includes several common Zsh customizations:

### 1. Oh My Zsh Initialization
```zsh
export ZSH="$HOME/.oh-my-zsh"
# ... Oh My Zsh might be more fully initialized by its own scripts if present
```
*   Sets the `ZSH` environment variable, which points to the Oh My Zsh installation directory. Oh My Zsh is a popular framework for managing Zsh configurations, providing a vast library of plugins, themes, and helper functions.
*   *(Note: Typically, Oh My Zsh itself is sourced via `source $ZSH/oh-my-zsh.sh`. This line is missing here, which might mean Oh My Zsh is not fully active or is loaded differently, or this line is just setting a variable for other scripts to use.)*

### 2. Loading `.env` File
```zsh
[ -f ~/.env ] && export $(grep -v '^#' ~/.env | xargs)
```
*   This command checks for the existence of a `~/.env` file in the user's home directory.
*   If found, it reads the file, filters out any lines starting with `#` (comments), and then exports the remaining lines as environment variables. This is a common way to load personal or sensitive environment variables (like API keys) without committing them to version control.

### 3. Zsh Options and Completions
```zsh
setopt prompt_subst
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
autoload bashcompinit && bashcompinit
autoload -Uz compinit
compinit
source <(kubectl completion zsh)
```
*   `setopt prompt_subst`: Enables variable expansion and command substitution in the prompt, necessary for dynamic prompts like Starship.
*   `zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'`: Configures Zsh's powerful tab completion system to be case-insensitive for lowercase input.
*   `autoload bashcompinit && bashcompinit`: Initializes compatibility with Bash completion scripts.
*   `autoload -Uz compinit; compinit`: Initializes Zsh's native completion system.
*   `source <(kubectl completion zsh)`: Loads completion definitions for `kubectl`, the Kubernetes command-line tool.

### 4. Zsh Autosuggestions
```zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^w' autosuggest-execute
bindkey '^e' autosuggest-accept
bindkey '^u' autosuggest-toggle
```
*   Loads the `zsh-autosuggestions` plugin (likely installed via Homebrew). This plugin provides command suggestions as you type, based on your history.
*   Custom keybindings are set:
    *   `Ctrl+W`: Execute the current suggestion.
    *   `Ctrl+E`: Accept the current suggestion.
    *   `Ctrl+U`: Toggle autosuggestions on/off.

### 5. Custom Keybindings
```zsh
bindkey '^L' vi-forward-word
bindkey '^k' up-line-or-search
bindkey '^j' down-line-or-search
```
*   Provides some Vim-like navigation and history search capabilities:
    *   `Ctrl+L`: Move forward one word.
    *   `Ctrl+K`: Move up a line or search history.
    *   `Ctrl+J`: Move down a line or search history.

### 6. Starship Prompt
```zsh
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
```
*   Initializes [Starship](https://starship.rs/), a fast, minimal, and highly customizable cross-shell prompt.
*   Sets the `STARSHIP_CONFIG` environment variable to point to the custom Starship configuration file.

### 7. Default Editor
```zsh
export EDITOR=/opt/homebrew/bin/nvim
```
*   Sets the default command-line editor to Neovim (`nvim`), installed via Homebrew.

### 8. NVM (Node Version Manager)
```zsh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
```
*   Configures and loads NVM, allowing management of multiple Node.js versions.

### 9. PATH Modifications
```zsh
export PATH="/Users/ftl/.cargo/bin:$PATH"
export PATH="$PATH:/Users/ftl/.lmstudio/bin"
# Commented out Qt and WezTerm paths
```
*   Adds the Rust `~/.cargo/bin` directory to the `PATH`, making Rust binaries accessible.
*   Adds the LM Studio CLI binary directory to the `PATH`.
*   Includes commented-out examples for adding Qt and WezTerm to the `PATH`.

### 10. Aliases
```zsh
alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"
alias ltree="eza --tree --level=2  --icons --git"
alias la=tree
alias cat=bat
```
*   Defines several convenient aliases:
    *   `l`: Uses `eza` (a modern `ls` replacement) for detailed, iconified, Git-aware listings.
    *   `lt`, `ltree`: Use `eza` to display directory trees.
    *   `la`: Alias for the standard `tree` command.
    *   `cat`: Replaces `cat` with `bat` (a `cat` clone with syntax highlighting and Git integration).

## Zsh Frameworks and Plugins Used

*   **Oh My Zsh**: The `ZSH` variable is set, indicating its use, though the main sourcing script isn't explicitly present in this snippet.
*   **zsh-autosuggestions**: Loaded directly via its path (likely from Homebrew).
*   **Starship**: Used as the prompt, initialized via `starship init zsh`.
*   **kubectl completions**: Sourced for Kubernetes CLI enhancements.
*   **NVM**: Sourced for Node.js version management.

## Tips for Customizing Zsh Further

*   **Explore Oh My Zsh**: If you're using Oh My Zsh, browse its extensive list of [plugins](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins) and [themes](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes). Enable plugins in the `plugins=(...)` array in your Oh My Zsh section of `.zshrc`.
*   **More Aliases**: Add aliases for your frequently used long commands.
*   **Custom Functions**: For more complex tasks, write Zsh functions directly in your `.zshrc` or in separate files that you source.
*   **Keybindings (`bindkey`)**: Customize keybindings further to match your workflow. Zsh's `bindkey` is very powerful.
*   **Prompt Customization**: While Starship is used here, Zsh itself has powerful prompt customization features (using `PROMPT`, `RPROMPT`, and various prompt escapes).
*   **Completion System (`compinit`, `zstyle`)**: Fine-tune Zsh's completion behavior using `zstyle`. You can add completions for more commands or change how completions are displayed.
*   **Syntax Highlighting**: Consider adding `zsh-syntax-highlighting`, which highlights commands as you type, helping to catch errors.
*   **History**: Configure history options (size, sharing, etc.) using `HISTFILE`, `HISTSIZE`, `SAVEHIST`, and `setopt` options like `share_history` or `inc_append_history`.

## Useful Commands and Aliases from this `.zshrc`

*   **`l`**: Quick, detailed file listing.
*   **`lt` / `ltree`**: Easy-to-read directory tree view.
*   **`cat` (actually `bat`)**: View files with syntax highlighting.
*   **`Ctrl+W` (with autosuggestions)**: Execute the suggested command.
*   **`Ctrl+E` (with autosuggestions)**: Accept the suggested command.
*   **`Ctrl+U` (with autosuggestions)**: Toggle suggestions.
*   **`Ctrl+L` / `Ctrl+K` / `Ctrl+J`**: Custom navigation/history bindings.

Remember to `source ~/.zshrc` or open a new terminal session to apply any changes you make to your `.zshrc` file.
