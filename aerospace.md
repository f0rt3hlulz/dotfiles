# AeroSpace Window Manager Configuration

AeroSpace is a tiling window manager for macOS, designed to be configured via a simple TOML file. It allows for extensive customization of window layouts, keybindings, and application-specific behaviors.

This document provides an overview of the current AeroSpace configuration, along with tips and useful commands.

## Key Configuration Areas in `.aerospace.toml`

The `.aerospace.toml` file is the heart of AeroSpace's customization. Here are some of the key sections:

*   **Startup and Event Hooks:**
    *   `after-startup-command`: Executes commands when AeroSpace starts. Useful for launching status bars or other helper applications.
    *   `exec-on-workspace-change`: Triggers commands when you switch workspaces. This is handy for updating workspace indicators or window border colors.
    *   `after-login-command`: Runs commands after you log into your macOS user session (requires `start-at-login = true`).
*   **General Settings:**
    *   `start-at-login`: Set to `true` to have AeroSpace launch automatically when you log in.
    *   `enable-normalization-flatten-containers`: Simplifies complex nested window structures.
    *   `enable-normalization-opposite-orientation-for-nested-containers`: Automatically adjusts the orientation of newly created splits.
*   **Layout Configuration:**
    *   `accordion-padding`: Defines the padding around windows in accordion layout.
    *   `default-root-container-layout`: Sets the default layout for new workspaces (e.g., `tiles` or `accordion`).
    *   `default-root-container-orientation`: Determines the default split direction (e.g., `horizontal`, `vertical`, or `auto`).
*   **Window Behavior:**
    *   `on-focused-monitor-changed`: Defines actions when focus moves to a different monitor (e.g., moving the mouse cursor).
    *   `automatically-unhide-macos-hidden-apps`: Prevents applications from being hidden by the standard macOS hide command (Cmd+H).
    *   `on-window-detected`: Allows you to set rules for specific applications, such as making certain app windows always float.
*   **Key Mappings & Modes:**
    *   `[key-mapping]`: Sets your preferred keyboard layout (e.g., `qwerty`).
    *   `[gaps]`: Configures the spacing between windows and screen edges.
    *   `[mode.main.binding]`: Defines your primary set of keybindings for everyday window management.
    *   `[mode.<custom_mode>.binding]`: Allows you to create additional modes with specialized keybindings (e.g., the `service` mode in the current config).
*   **Workspace Management:**
    *   `[workspace-to-monitor-force-assignment]`: Assigns specific workspaces to particular monitors.

## Tips and Useful Commands (Based on Current Configuration)

This section highlights some useful functionalities and commands enabled by the current `.aerospace.toml` configuration.

### General Workflow:

*   **Reloading Configuration:** If you make changes to `.aerospace.toml`, you can reload the configuration without restarting AeroSpace.
    *   Enter **Service Mode**: `alt + shift + ;`
    *   Press `esc` (this is bound to `reload-config` and then switches back to `main` mode).
*   **Switching Workspaces:**
    *   `alt + 1` through `alt + 4` to switch to workspaces 1 through 4 respectively.
*   **Moving Windows to Workspaces:**
    *   `alt + shift + 1` through `alt + shift + 4` to move the focused window to the respective workspace.
*   **Navigating Between Previous Workspace:**
    *   `alt + tab`: Quickly switch back and forth between the current and previously focused workspace.
*   **Moving Current Workspace to Another Monitor:**
    *   `alt + shift + tab`: Moves the entire current workspace to the next available monitor.

### Window Layout and Management:

*   **Changing Layout Style:**
    *   `alt + /`: Cycle through tiling layouts (horizontal/vertical).
    *   `alt + ,`: Cycle through accordion layouts.
*   **Toggle Floating/Tiling for a Window:**
    *   `alt + ctrl + f`: Make the focused window float or revert it to tiling.
*   **Toggle Fullscreen:**
    *   `alt + ctrl + shift + f`: Make the focused window fullscreen.
*   **Focusing Windows (like Vim):**
    *   `alt + h`: Focus window to the left.
    *   `alt + j`: Focus window down.
    *   `alt + k`: Focus window up.
    *   `alt + l`: Focus window to the right.
*   **Moving Windows (Swapping):**
    *   `alt + shift + h`: Move (swap) focused window to the left.
    *   `alt + shift + j`: Move (swap) focused window down.
    *   `alt + shift + k`: Move (swap) focused window up.
    *   `alt + shift + l`: Move (swap) focused window to the right.
*   **Resizing Windows:**
    *   `alt + -`: Decrease focused window size.
    *   `alt + =`: Increase focused window size.
*   **Joining Windows (Merging into one container):**
    *   `alt + shift + left/down/up/right`: Join the focused window with the window in the specified direction. This is useful for creating more complex layouts within a single container.

### Application Shortcuts:

The configuration includes shortcuts to quickly launch specific applications:

*   `alt + t`: Open Telegram.
*   `alt + a`: Open Arc browser.
*   `alt + o`: Open Obsidian.
*   `alt + g`: Open Ghostty terminal.
*   `alt + b`: Open Google Chrome.

### Service Mode (`alt + shift + ;`):

This mode provides access to less frequently used but powerful commands:

*   `esc`: Reload configuration and return to `main` mode.
*   `r`: Reset the layout of the current workspace (flattens the window tree) and return to `main` mode.
*   `f`: Toggle floating/tiling for the focused window and return to `main` mode.
*   `backspace`: Close all windows on the current workspace except the focused one and return to `main` mode.
*   **Volume Control (while in Service Mode):**
    *   `down`: Decrease volume.
    *   `up`: Increase volume.
    *   `shift + down`: Mute volume and return to `main` mode.
*   **Join Windows (while in Service Mode, then returns to `main`):**
    *   `alt + shift + h/j/k/l`: Join windows, similar to main mode.

### Floating Windows by Default:

The following applications are configured to open in floating mode automatically:

*   Telegram
*   Transmission
*   Finder
*   Discord
*   Outline

This is useful for applications that don't tile well or are typically used as standalone utility windows.

## Further Customization

Refer to the official AeroSpace documentation for a complete list of commands and configuration options: [https://nikitabobko.github.io/AeroSpace/](https://nikitabobko.github.io/AeroSpace/)

You can further customize keybindings, define new modes, and create more sophisticated rules for window handling based on your specific needs. Remember to reload the configuration after making changes to your `.aerospace.toml` file.
