# Direnv and .envrc Configuration

This document provides an overview of Direnv, the purpose of `.envrc` files, and an explanation of the specific `.envrc` file used in this project.

## What is Direnv?

[Direnv](https://direnv.net/) is an extension for your shell (like Bash, Zsh, Fish, etc.). It automatically loads and unloads environment variables depending on your current directory. This is incredibly useful for managing project-specific configurations without cluttering your global shell profile or manually sourcing files.

When you `cd` into a directory containing an `.envrc` file, Direnv (if allowed) will execute the commands in that file, typically setting environment variables. When you `cd` out of that directory, Direnv automatically unloads those same variables.

## The `.envrc` File

An `.envrc` file is a shell script that Direnv executes. You can use it to:

*   Export environment variables (`export MY_VARIABLE="value"`).
*   Load variables from other files (`source .env`).
*   Set up paths (`PATH_add ./node_modules/.bin`).
*   Activate virtual environments for languages like Python.
*   Essentially, run any shell commands needed for your project's environment.

**Security Note:** Because `.envrc` files can execute arbitrary code, Direnv requires you to explicitly "allow" an `.envrc` file before it will run it for the first time in a directory.

## Current `.envrc` File Explained

The `.envrc` file in this project has the following content:

```shell
# This is an .envrc file, used by Direnv (https://direnv.net/).
# Direnv automatically loads and unloads environment variables depending on the current directory.

# Check if a file named '.env' exists in the current directory.
# The '.env' file is a common convention for storing project-specific environment variables.
if [ -f .env ]; then
  # If '.env' exists:
  # `set -a`: Mark all variables created or modified from this point forward for automatic export.
  # This means any variables defined in the '.env' file will be exported to the environment.
  set -a
  # `source .env`: Execute the commands in the '.env' file in the current shell context.
  # This loads the variables defined in '.env'.
  source .env
  # `set +a`: Stop automatically exporting variables.
  set +a
else
  # If '.env' does not exist, print a message to standard output.
  # This can be helpful for developers to know that a potential configuration file is missing.
  echo ".env file not found."
fi
```

**Functionality:**

1.  **Checks for `.env`**: It first looks to see if a file named `.env` exists in the same directory.
2.  **Sources `.env`**:
    *   If `.env` is found, it uses `set -a` to ensure that any variables defined within the `.env` file are automatically exported to the environment (made available to subprocesses).
    *   It then `source`s the `.env` file, which means it loads any variables and executes any commands within `.env`.
    *   Finally, `set +a` stops the automatic export behavior for subsequent commands within the `.envrc` itself (though variables from `.env` are already marked for export).
3.  **Handles Missing `.env`**: If `.env` is not found, it prints a message ".env file not found." to the console. This is a helpful notification for developers setting up the project.

**Purpose:** This `.envrc` script provides a convenient way to automatically load project-specific environment variables from a standard `.env` file (which is often gitignored) without needing to manually source it every time you work on the project.

## Tips for Using Direnv Effectively

*   **`direnv allow`**: When you first `cd` into a directory with a new or modified `.envrc`, Direnv will show a warning and not execute it. You must run `direnv allow` in that directory to approve its content. This is a security measure.
*   **`direnv deny`**: If you no longer trust an `.envrc` or want to disable it for a directory, run `direnv deny`. This will also unload any environment variables previously set by it for that directory.
*   **`direnv reload`**: If you modify an already allowed `.envrc` file, you might need to run `direnv reload` to force Direnv to re-evaluate and apply the changes. Often, just `cd`ing out and back in also works.
*   **`.gitignore .env`**: It's common practice to add `.env` files (which often contain secrets or user-specific settings) to your project's `.gitignore` file to avoid committing them to version control. The `.envrc` itself, being just a loader, is usually safe to commit.
*   **Standard Library**: Direnv provides a [standard library](https://direnv.net/man/direnv-stdlib.1.html) of helper functions you can use in your `.envrc`, such as:
    *   `PATH_add <path>`: Prepends a path to the `PATH` environment variable.
    *   `layout <type>`: A common one is `layout python` for activating Python virtual environments.
    *   `dotenv`: A more robust way to load `.env` files (can handle comments and more complex syntax than simple `source`). The current script uses a basic `source` for simplicity.
*   **Editing**: Use `direnv edit` to open the `.envrc` in your editor and automatically `direnv allow` it upon saving.

## Setting Up Direnv

If Direnv is not already installed on your system, here's how to set it up:

1.  **Installation**:
    *   **macOS (Homebrew)**: `brew install direnv`
    *   **Linux (most package managers)**: e.g., `sudo apt-get install direnv` (Debian/Ubuntu), `sudo dnf install direnv` (Fedora), `sudo pacman -S direnv` (Arch).
    *   **Other methods**: Check the [Direnv installation guide](https://direnv.net/docs/installation.html) for more options.

2.  **Hook into your shell**: After installing, you need to hook Direnv into your shell's configuration file. Add the appropriate line to your shell's rc file (e.g., `~/.bashrc`, `~/.zshrc`, `~/.config/fish/config.fish`):
    *   **Bash**: `eval "$(direnv hook bash)"`
    *   **Zsh**: `eval "$(direnv hook zsh)"`
    *   **Fish**: `direnv hook fish | source`
    *   **Other shells**: Refer to `direnv hook <shell_name>` and the Direnv documentation.

3.  **Restart your shell**: Close and reopen your terminal or source your shell's configuration file (e.g., `source ~/.bashrc`) for the changes to take effect.

Once set up, Direnv will automatically manage environment variables for directories containing `.envrc` files that you have allowed.
