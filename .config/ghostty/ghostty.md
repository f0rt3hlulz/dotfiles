# Ghostty Terminal Emulator Configuration

Ghostty is a modern, GPU-accelerated terminal emulator focused on speed and simplicity. It provides a highly configurable experience through a plain text file.

This document provides an overview of the current Ghostty configuration and some general tips.

## Current Configuration (`config` file)

The primary configuration for Ghostty is stored in `~/.config/ghostty/config`. The current settings are:

*   **`theme = catppuccin-mocha`**:
    *   Sets the visual theme to "Catppuccin Mocha". Themes control the colors of text, background, cursor, etc.
*   **`font-size = 19`**:
    *   Sets the default font size to 19 points.
*   **`background-blur-radius = 20`**:
    *   Applies a blur effect to the window background with a radius of 20. This can create a stylish "frosted glass" effect if your desktop environment supports it. Set to `0` to disable.
*   **`mouse-hide-while-typing = true`**:
    *   Automatically hides the mouse cursor when you start typing in the terminal, reducing visual clutter.
*   **`window-decoration = true`**:
    *   Enables standard window decorations (title bar, minimize/maximize/close buttons). If you use a tiling window manager that provides its own decorations, you might set this to `false`.
*   **`macos-option-as-alt = true`**:
    *   Configures the Option (⌥) key on macOS to behave as an Alt key. This is crucial for many terminal applications and shortcuts that rely on Alt key combinations (e.g., in Emacs, Vim, or for shell readline shortcuts like Alt+B, Alt+F).
*   **`background-opacity = 0.8`**:
    *   Makes the terminal window background 80% opaque (20% transparent). This allows you to see content behind the terminal window.

## Tips and Useful Information

*   **Finding Themes:** Ghostty supports various theming options. You can find collections of Ghostty themes online, often in GitHub repositories dedicated to terminal themes (e.g., Catppuccin, Gruvbox, Solarized). To use a new theme, you'd typically download its Ghostty version and update the `theme` value in your config file.
*   **Font Selection:** While not explicitly set in this configuration (meaning Ghostty is using its default or system-fallback font), you can usually specify a preferred font family using a `font-family = "Your Font Name"` setting in the config file. Ensure the font is installed on your system.
*   **macOS Option Key:** The `macos-option-as-alt = true` setting is highly recommended for users who work with command-line tools that use Alt-key shortcuts. Without it, the Option key would produce special characters (e.g., Option+f = ƒ) instead of sending the Alt+f key combination to the application.
*   **Transparency and Blur:** The `background-opacity` and `background-blur-radius` settings can be adjusted to your liking. Performance of blur can vary depending on your system's GPU and desktop environment. If you experience performance issues, try reducing the blur radius or disabling it.
*   **Configuration Reloading:** Ghostty typically requires a restart to apply changes made to its configuration file. Some terminals offer live reloading, but it's good practice to close and reopen Ghostty after editing the `config` file to ensure all changes take effect.
*   **Further Customization:** Ghostty has many other configuration options that are not present in this specific file. These can include settings for:
    *   Custom keybindings
    *   Cursor style
    *   Scrollback buffer size
    *   Padding around the text
    *   And more.

    Refer to the official Ghostty documentation (usually found on its website or GitHub repository) for a complete list of available configuration options and their usage.

## Useful Commands (General Terminal Usage)

While Ghostty itself is configured via its file, here are some general command-line tips that are enhanced by a well-configured terminal:

*   **Shell Navigation (often using Alt if `macos-option-as-alt = true`):**
    *   `Alt + B`: Move cursor back one word.
    *   `Alt + F`: Move cursor forward one word.
    *   `Ctrl + A`: Move cursor to the beginning of the line.
    *   `Ctrl + E`: Move cursor to the end of the line.
    *   `Ctrl + U`: Clear the line before the cursor.
    *   `Ctrl + K`: Clear the line after the cursor.
    *   `Ctrl + W`: Delete the word before the cursor.
*   **Searching History:**
    *   `Ctrl + R`: Search command history (reverse search).
*   **Tab Completion:**
    *   Press `Tab` to autocomplete commands, filenames, and paths.

A comfortable and well-configured terminal like Ghostty makes using these and other command-line tools a more pleasant and efficient experience.
