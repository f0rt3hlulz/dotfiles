# Raycast Configuration and Usage

Raycast is a fast, extensible launcher for macOS. It allows you to perform tasks, search files, launch applications, control your system, and much more, often without lifting your fingers from the keyboard. Raycast's functionality can be significantly expanded with extensions.

## General Preferences (`config.json`)

The main Raycast configuration file located at `~/.config/raycast/config.json` primarily stores authentication tokens for your Raycast account and any integrated services. It typically does not contain user-facing preferences, as those are managed within the Raycast application itself.

The current `config.json` contains:
*   `accesstoken`: An access token for Raycast services.
*   `token`: A general token, likely also for Raycast services.

*It's important not to share these token values publicly.*

## Installed Extensions

Extensions enhance Raycast's capabilities. They can be installed from the Raycast Store or developed privately. The following extensions are currently installed (identified from the `~/.config/raycast/extensions/` directory):

### 1. Notion

*   **Directory ID:** `5f2e08d5-fdf1-4171-b252-aa53065621b4`
*   **Description:** "The fastest way to search, create and update Notion pages."
*   **Key Commands:**
    *   **Create Database Page:** Create a new page within a specific Notion database.
    *   **Search Notion:** Search for Notion databases and pages.
        *   *Preference*: Can choose to open results in Notion or preview in Raycast.
    *   **Quick Capture:** Quickly jot down notes and send them to a Notion page.
    *   **Add Text to Page:** Append or prepend text (optionally with a date) to an existing Notion page.
*   **Preferences within Raycast:**
    *   Requires an "Internal Integration Secret" (Notion token) for API access.
    *   Allows choosing which application (e.g., Notion desktop app, browser) to open pages in.

### 2. Visual Studio Code

*   **Directory ID:** `95e41a2e-a943-4d49-b0df-152c3db2f7e0`
*   **Description:** "Control Visual Studio Code, Cursor & Codium directly from Raycast - Search and open recent projects, handle extensions and commands."
*   **Key Commands:**
    *   **Search Recent Projects:** Search and open projects recently accessed in VS Code.
    *   **Open with Visual Studio Code:** Opens the currently selected Finder item in VS Code.
    *   **Open New Window:** Launches a new, empty VS Code window.
    *   **Show Installed Extensions:** View and manage your installed VS Code extensions.
    *   **Install Extension:** Search and install new extensions from the VS Code Marketplace.
    *   **Commands:** Access and run commands from the VS Code Command Palette (disabled by default).
*   **Preferences within Raycast:**
    *   **Build:** Select which VS Code build to target (Stable, Insiders, Codium, Cursor, Windsurf).
    *   **View Layout:** Choose list or grid view for displaying projects.
    *   **Keep Section Order:** Advanced option for maintaining search result order.
    *   **Close Other Windows:** Option to close other VS Code windows when opening a new project.
    *   **Terminal App:** Select a preferred terminal application for commands that open a terminal.

## Tips and Useful Raycast Commands

*   **Raycast Hotkey:** The primary way to activate Raycast is via its global hotkey (commonly `Option + Space`). This is configurable in Raycast's preferences.
*   **Search Syntax:**
    *   Simply type the name of an app, command, or file to search.
    *   Use keywords for specific extensions (e.g., "notion search", "vscode open").
*   **Clipboard History:** A powerful built-in feature. Search "Clipboard History" in Raycast to access and search through text you've copied.
*   **Snippets:** Create text snippets that you can quickly paste. Search "Snippets" in Raycast.
*   **Calculator:** Type mathematical expressions directly into Raycast.
*   **File Search:** A robust way to find files and folders. Search "File Search".
*   **System Commands:** Control macOS settings like volume, brightness, sleep, quit applications, etc. (e.g., "Sleep", "Quit Chrome").
*   **Extension Store:** Search "Store" in Raycast to browse and install new extensions.

### Tips for Installed Extensions:

*   **Notion:**
    *   Configure your Notion integration token in the Raycast extension preferences for full functionality.
    *   The "Quick Capture" command is excellent for quickly saving thoughts or tasks to a designated Notion page without context switching.
    *   "Add Text to Page" is useful for maintaining logs or journals in Notion.
*   **Visual Studio Code:**
    *   Ensure the correct "Build" (VS Code, Codium, etc.) is selected in preferences for the extension to find your projects.
    *   "Search Recent Projects" is a very fast way to jump back into your work.
    *   "Open with Visual Studio Code" (often used from Finder via Raycast's selection context) is handy for quickly editing files.
    *   If you frequently use the VS Code command palette, consider enabling the "Commands" feature in the extension's Raycast settings.

## Further Customization

Raycast's true power comes from its extensive library of extensions and its customizability. Explore the Raycast Store for more extensions that fit your workflow. Many extensions also have their own specific settings that can be configured within Raycast's preferences panel (usually by selecting the extension and clicking the settings icon or using a command like "Manage Extension Settings").
