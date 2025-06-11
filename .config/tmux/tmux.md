# Tmux Configuration Overview

Tmux is a terminal multiplexer. It lets you create, manage, and switch between multiple virtual terminals (or "sessions") within a single terminal window or console. This is extremely useful for running multiple command-line programs simultaneously, detaching from sessions and reattaching later, and organizing your workflow.

This document details the Tmux setup found in `~/.config/tmux/`, including main configuration, reset bindings, installed plugins, and key usage tips.

## Configuration Files

### 1. `tmux.conf`

This is the main configuration file for Tmux. It defines global settings, keybindings, plugin configurations, and appearance settings.

**Key Configurations in `tmux.conf`:**

*   **Source `tmux.reset.conf`**: Loads a baseline keybinding configuration first.
*   **Terminal Enhancements**:
    *   `default-terminal 'screen-256color'`: Sets the default terminal type to support 256 colors.
    *   `terminal-overrides ',xterm-256color:RGB'`: Enables RGB color support for compatible terminals.
*   **Prefix Key**:
    *   `set -g prefix ^A`: Changes the default prefix key from `Ctrl+B` to `Ctrl+A`.
*   **Indexing**:
    *   `base-index 1`, `pane-base-index 1`: Starts window and pane numbering from 1 instead of 0.
*   **Behavior**:
    *   `automatic-rename on`: Automatically renames windows based on the running program.
    *   `detach-on-destroy off`: Prevents Tmux from exiting if a session is closed.
    *   `escape-time 0`: Reduces input delay.
    *   `history-limit 1000000`: Increases scrollback history.
    *   `renumber-windows on`: Keeps window numbering contiguous.
    *   `set-clipboard on`: Integrates with the system clipboard.
*   **Appearance and Layout**:
    *   `status-position top`: Places the status bar at the top.
    *   `mode-keys vi`: Uses Vi keybindings in Tmux modes (like copy mode).
    *   `pane-active-border-style 'fg=magenta,bg=default'`: Sets the active pane border to magenta.
    *   `pane-border-style 'fg=brightblack,bg=default'`: Sets inactive pane borders to bright black.
*   **Theme**: The configuration specifies settings for `omerxx/catppuccin-tmux` and also includes a "Tokyo Night" theme section. The Catppuccin plugin is listed in TPM, suggesting it's the primary theme, but the Tokyo Night settings directly manipulate status bar colors and elements. This results in a customized appearance drawing from both, with Tokyo Night styles likely taking precedence for the status bar elements it explicitly defines.
*   **Custom Popups**:
    *   `bind g` and `bind G`: Custom keybindings to create directory-specific and global popup/scratchpad windows, respectively. These are powerful for quick access to persistent or project-specific terminal environments.

### 2. `tmux.reset.conf`

This file is sourced by `tmux.conf` and its primary purpose is to establish a known set of keybindings. While it doesn't `unbind-key -a` (remove all bindings) in this configuration, it redefines many common Tmux actions. This can be useful for:
*   Ensuring a consistent base regardless of Tmux version defaults.
*   Overriding default bindings with preferred keys (e.g., `H`/`L` for previous/next window, Vim-style pane navigation `h`/`j`/`k`/`l`).
*   Setting up repeatable resize commands.

Keybindings redefined here include navigation, window/pane management, session choosing, and a custom `K` binding to clear the screen.

## Installed Tmux Plugins

Plugins are managed using [TPM (Tmux Plugin Manager)](https://github.com/tmux-plugins/tpm). They are listed in `tmux.conf` and installed in `~/.config/tmux/plugins/`.

Here's a list of the installed plugins and their functions:

1.  **`tmux-plugins/tpm`**:
    *   **Purpose**: The Tmux Plugin Manager itself. Essential for installing and managing other plugins.
2.  **`tmux-plugins/tmux-sensible`**:
    *   **Purpose**: Provides a set of sensible Tmux settings that serve as a good default baseline.
3.  **`tmux-plugins/tmux-yank`**:
    *   **Purpose**: Enables yanking (copying) text from Tmux panes to the system clipboard. Works seamlessly with Vi mode selections.
4.  **`tmux-plugins/tmux-resurrect`**:
    *   **Purpose**: Persists Tmux environments (sessions, windows, panes, working directories) across Tmux server restarts (e.g., after a reboot).
    *   **Config**: `@resurrect-strategy-nvim 'session'` is set to ensure Neovim sessions are saved and restored correctly.
5.  **`tmux-plugins/tmux-continuum`**:
    *   **Purpose**: Automates the saving of Tmux environments for `tmux-resurrect`.
    *   **Config**: `@continuum-restore 'on'` automatically restores the last saved environment when Tmux starts.
6.  **`fcsonline/tmux-thumbs`**:
    *   **Purpose**: Allows for quick selection and copying of on-screen text (like URLs, file paths, or any regex match) by displaying "thumbs" (hints) that you can type to select.
7.  **`sainnhe/tmux-fzf`**:
    *   **Purpose**: Integrates [fzf](https://github.com/junegunn/fzf) (a command-line fuzzy finder) into Tmux for actions like switching sessions, windows, panes, and more, using an interactive fuzzy search interface.
8.  **`wfxr/tmux-fzf-url`**:
    *   **Purpose**: Specifically uses fzf to quickly find and open URLs present in the visible text of your Tmux panes.
    *   **Config**: Bound to `Prefix + u`, with custom fzf options for the popup.
9.  **`omerxx/catppuccin-tmux`**:
    *   **Purpose**: A Tmux theme using the [Catppuccin](https://github.com/catppuccin) color palette. This fork by `omerxx` is noted to include a custom script for meetings (likely displayed in the status bar).
    *   **Config**: Numerous `@catppuccin_...` variables in `tmux.conf` customize the appearance of window tabs, status bar modules (session, directory, date/time, meetings), and separators.
10. **`omerxx/tmux-sessionx`**:
    *   **Purpose**: A session management plugin, likely enhancing Tmux's default session handling.
    *   **Config**: Includes keybindings (`Prefix + o`, `Ctrl+Y` for zoxide new window), custom paths for project discovery (`/Users/omerxx/dotfiles`), fzf window dimensions, and zoxide integration for quick directory navigation.
11. **`omerxx/tmux-floax`**:
    *   **Purpose**: Manages floating windows within Tmux, allowing panes to appear overlaid on the current layout.
    *   **Config**: Defines width (`80%`), height (`80%`), border color (`magenta`), text color (`blue`), keybinding (`Prefix + p`), and path behavior for these floating windows.

## Tips for Using Tmux

*   **Prefix Key**: Remember your prefix is `Ctrl+A`. Most Tmux commands follow `Prefix + <key>`.
*   **Plugin Management (TPM)**:
    *   Install new plugins: Add `set -g @plugin 'author/plugin_name'` to `tmux.conf`, then press `Prefix + I` (capital i) to fetch and install.
    *   Update plugins: `Prefix + U`.
    *   Uninstall plugins: Remove the `@plugin` line, then `Prefix + Alt + u`.
*   **Copy Mode**:
    *   Enter copy mode: `Prefix + [` (if using default bindings, this config might have alternatives via `tmux-sensible` or custom bindings).
    *   Navigate with Vi keys (`h,j,k,l,w,b,e,gg,G`).
    *   Start selection: `v` (as per `tmux.reset.conf`).
    *   Yank selection: `y` (if `tmux-yank` is active, this often copies to system clipboard).
*   **Session Management**:
    *   `tmux ls`: List current sessions.
    *   `tmux attach -t <session_name>`: Attach to a session.
    *   `Prefix + d`: Detach from the current session.
    *   `Prefix + S` (from `tmux.reset.conf`): Interactively choose a session.
    *   Utilize `tmux-sessionx` (`Prefix + o`) for enhanced session management.
*   **Pane Splitting**:
    *   `Prefix + s`: Split vertically (new pane below).
    *   `Prefix + v`: Split horizontally (new pane to the right).
    *   (These are custom bindings from `tmux.reset.conf`. Defaults are `Prefix + %` and `Prefix + "`.)

## Keybindings from Configuration

Many default bindings are preserved or slightly modified by `tmux.reset.conf`. Some notable ones from the combined configuration:

*   **`Prefix ^A`** (Ctrl+A is the prefix)
*   **Window Management**:
    *   `Prefix + c` (or `Prefix + ^C` from reset): New window.
    *   `Prefix + ,` (from default, not explicitly in reset): Rename window (though `Prefix + r` is in reset).
    *   `Prefix + w` (or `Prefix + ^W`): List windows.
    *   `Prefix + H`: Previous window.
    *   `Prefix + L`: Next window.
    *   `Prefix + &` (default): Kill window.
*   **Pane Management**:
    *   `Prefix + s`: Split vertically (custom).
    *   `Prefix + v`: Split horizontally (custom).
    *   `Prefix + x`: Swap pane (custom, default is kill-pane).
    *   `Prefix + c`: Kill pane (custom).
    *   `Prefix + z`: Zoom/unzoom pane.
    *   `Prefix + h/j/k/l`: Navigate panes (Vim style).
    *   `Prefix + ,/.` / `Prefix + -/=` : Resize panes (custom repeatable).
*   **Session Control**:
    *   `Prefix + d` (or `Prefix + ^D`): Detach session.
    *   `Prefix + S`: Choose session.
*   **Configuration Reload**:
    *   `Prefix + R`: Reload `tmux.conf`.
*   **Plugin Specific**:
    *   `Prefix + u`: Open URL with fzf (`tmux-fzf-url`).
    *   `Prefix + p`: Toggle floating window (`tmux-floax`).
    *   `Prefix + o`: Open sessionx manager (`tmux-sessionx`).
    *   `Ctrl + Y` (no prefix, if in a tmux pane): New window with zoxide via sessionx.
*   **Popups**:
    *   `Prefix + g`: Directory-specific popup.
    *   `Prefix + G`: Global popup.
*   **Other**:
    *   `Prefix + K`: Clear screen (custom).

This Tmux setup is highly customized with a focus on efficient navigation, session persistence, fzf integration, and a specific visual theme (Catppuccin/Tokyo Night hybrid). Refer to individual plugin repositories for more detailed commands and options related to them.All the necessary information has been gathered and processed. The `tmux.conf` and `tmux.reset.conf` files have been commented, plugins identified, and their general purposes noted. I am now ready to submit the subtask report.
