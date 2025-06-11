# Starship Prompt Configuration

Starship is a minimal, blazing-fast, and infinitely customizable prompt for any shell! It displays the information you need while you're working, keeping your prompt clean and unobtrusive.

This document outlines the current Starship configuration found in `starship.toml` and provides tips for further customization.

## Current `starship.toml` Configuration Explained

The `~/.config/starship/starship.toml` file dictates how your prompt looks and what information it displays.

### Global Settings:

*   **`add_newline = false`**: The prompt will appear on the same line as the previous command's output, saving vertical space.
*   **`format = """$directory$character"""`**: This defines the main (left) layout of the prompt. It's configured to be minimal:
    *   `$directory`: Shows the current working directory.
    *   `$character`: Displays the prompt character (e.g., `➜`).
*   **`palette = "catppuccin_mocha"`**: Sets the overall color scheme to "Catppuccin Mocha." The actual color definitions for this palette are provided at the end of the `starship.toml` file.
*   **`right_format = """$all"""`**: This crucial setting moves all other enabled modules (like Git status, programming language versions, AWS profile, etc.) to the right-hand side of the prompt. This keeps the left side minimal while still providing rich information on the right.
*   **`command_timeout = 1000`**: Sets a 1-second timeout for commands Starship runs to get information (e.g., `git status`). If a command takes longer, that module won't be displayed, preventing a slow prompt.

### Key Module Configurations:

*   **`[character]`**:
    *   `success_symbol = '[➜](bold green)'`: Sets the symbol for a successful command to a green bold arrow (`➜`).

*   **`[directory.substitutions]`**:
    *   `'~/tests/starship-custom' = 'work-project'`: If you are in the `~/tests/starship-custom` directory, the prompt will display `work-project` instead of the full path, making it shorter and more readable.

*   **`[git_branch]`**:
    *   `format = '[$symbol$branch(:$remote_branch)]($style)'`: Customizes the display of the Git branch, showing an icon (`$symbol`), the local branch name (`$branch`), and optionally the remote tracking branch (`:$remote_branch`).

*   **`[aws]`**:
    *   `format = '[$symbol(profile: "$profile" )(\(region: $region\) )]($style)'`: Shows the AWS icon (`$symbol`), current AWS profile, and region.
    *   `disabled = false`: Ensures the module is active.
    *   `style = 'bold blue'`: Styles the AWS information in bold blue.
    *   `symbol = " "`: Uses a Nerd Font icon for AWS.

*   **`[golang]`**:
    *   `format = '[ ](bold cyan)'`: If a Go project is detected, it displays a Go language icon (``) in bold cyan.

*   **`[kubernetes]`**:
    *   `disabled = true`: This module is currently turned off.
    *   If enabled, it would show the Kubernetes icon (`symbol = '☸ '`), the current context, and namespace.
    *   `detect_files = ['Dockerfile']`: It's configured to activate if a `Dockerfile` is present (though this might be overly broad for Kubernetes context detection alone).
    *   `contexts`: Allows aliasing and styling specific Kubernetes cluster contexts (e.g., making "omerxx" appear for a long AWS EKS ARN).

*   **`[docker_context]`**:
    *   `disabled = true`: This module, which would show the current Docker context, is also turned off.

*   **`[palettes.catppuccin_mocha]`**:
    *   This section defines all the named colors (e.g., `rosewater`, `flamingo`, `green`, `blue`, `base`) used in the "Catppuccin Mocha" theme. Modules can reference these colors for their `style` property (e.g., `bold green`).

## Tips for Customizing Starship Further

*   **Explore Modules:** Starship has a vast array of modules for different programming languages, tools, cloud providers, and system statuses. Check the [Starship documentation](https://starship.rs/config/#prompt) to see what's available.
*   **Enable/Disable Modules:**
    *   To enable a disabled module (like `kubernetes` or `docker_context` in the current config), change `disabled = true` to `disabled = false`.
    *   To disable an active module, add `disabled = true` to its section (e.g., under `[aws]`).
*   **Fine-tune Formats:** Each module has a `format` string that you can customize. You can add static text, reorder variables, or change styling. For example, you could make the Git branch show only the branch name without the symbol.
*   **Styling:** Use `style` attributes with [Starship's styling syntax](https://starship.rs/config/#styling). You can use palette colors (e.g., `mauve`), basic colors (`red`, `blue`), or attributes like `bold`, `italic`, `underline`. Example: `style = "bold lavender"`.
*   **Conditional Formatting:** Some modules allow you to change their format or style based on their state (e.g., different colors for a Git branch if it's ahead or behind the remote).
*   **Create Custom Palettes:** Define your own color palettes if you don't want to use a predefined one.
*   **Directory Aliases:** Add more `[directory.substitutions]` for frequently visited long paths to keep your prompt tidy.
*   **Nerd Fonts:** Many symbols (like `` for AWS or `` for Go) come from Nerd Fonts. Ensure you have a Nerd Font installed and configured in your terminal for these symbols to render correctly.
*   **Testing Changes:** After editing `starship.toml`, you don't need to restart your shell. Simply start a new shell session, or in some shells, even just pressing Enter to get a new prompt might reflect the changes.

## Useful Starship Commands

*   **Applying Changes:** Starship automatically picks up changes to `~/.config/starship/starship.toml` when it generates a new prompt. There isn't a specific "reload" command you need to run for Starship itself. Just ensure your shell is configured to use Starship.
*   **Installation (if not already done):**
    *   Follow the instructions on the [Starship website](https://starship.rs/#getting-started). This usually involves:
        1.  Installing the Starship binary (e.g., via Homebrew, curl, etc.).
        2.  Adding an initialization script to your shell's configuration file (e.g., `.bashrc`, `.zshrc`, `config.fish`).
            *   Example for Zsh: `eval "$(starship init zsh)"`
            *   Example for Bash: `eval "$(starship init bash)"`
            *   Example for Fish: `starship init fish | source`
*   **Debugging your Prompt:**
    *   `starship prompt`: This command prints what your prompt would look like in the current directory. Useful for seeing changes without affecting your current session's history or waiting for a new prompt line.
    *   `starship explain`: Shows how Starship is parsing your configuration and which modules are active and why. This is very helpful for troubleshooting why a module isn't appearing or is appearing unexpectedly.
    *   `starship config`: Prints the default configuration.
    *   `starship config <module_name>`: Prints the default configuration for a specific module (e.g., `starship config git_branch`).

By understanding the structure of `starship.toml` and utilizing these tips and commands, you can tailor Starship to create a prompt that is both informative and aesthetically pleasing.
