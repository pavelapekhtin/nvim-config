This repository is a fork of [DreamNvim](https://github.com/dreamsofcode-io/DreamNvim) with some additional plugins.

## Installation

### Backup

if you have an existing neovim configuration, first back this up and clean out your neovim cache.

```
mv ~/.config/nvim ~/.config/nvim-backup
rm -rf ~/.local/share/nvim
```

### Install

To install this configuration on Linux & macOS, run the following command:

```
git clone git@github.com:pavelapekhtin/nvim-config.git ~/.config/nvim
```

Then, open up neovim in order to download and install the base configuration packages.

## VSCode / Cursor Integration

This configuration supports integration with VSCode and Cursor editors through the [VSCode Neovim](https://github.com/vscode-neovim/vscode-neovim) extension.

### Setup for VSCode

1. Install the "VSCode Neovim" extension from the marketplace
2. Copy the settings from `.vscode/settings.json` to your VSCode settings:
   - Press `Cmd+Shift+P` (or `Ctrl+Shift+P` on Windows/Linux)
   - Type "settings json" and select "Preferences: Open Settings (JSON)"
   - Copy the relevant settings
3. **Important**: Make sure the Neovim executable path is correct:
   - Run `which nvim` in your terminal to find the correct path
   - Update the `vscode-neovim.neovimExecutablePaths.darwin` setting with your path
   - On macOS with Homebrew, the path is typically `/opt/homebrew/bin/nvim`

### Setup for Cursor

1. Cursor already includes the "VSCode Neovim" extension
2. Copy the settings from `.vscode/settings.json` to your Cursor settings file
3. **Important**: Set the correct path to Neovim in the settings:
   - Run `which nvim` in your terminal to find the correct path
   - Update the `vscode-neovim.neovimExecutablePaths.darwin` setting with your path
   - On macOS with Homebrew, the path is typically `/opt/homebrew/bin/nvim`

### Leader Key

The leader key is set to Space. Make sure the Space key is properly handled by copying the keybindings from `.vscode/keybindings.json` to your VS Code or Cursor keybindings.

#### Testing the Leader Key

To verify that your leader key (Space) is working correctly, try these commands:

- `Space` + `x` - Shows a notification message confirming the leader key works
- `Space` + `z` - Toggles Zen Mode in VSCode
- `Space` + `k` - Opens the keyboard shortcuts menu
- `Space` + `test` - Shows another test notification
- `Space` + `t` - Toggles the terminal
- `Space` + `e` - Opens the explorer sidebar

If these commands work, your leader key is configured correctly. If not, check your keybindings settings.

## Modifying

### Custom Plugins

All custom plugins shown in videos should be added to the `lua/custom/plugins.lua` file.

## Backwards Compatibility

Each video will have a branch associated with it that will lock the configuration to the time that video was released. 

There is no guarantee that these will work forever, especially as neovim develops.

## Language Support

This configuration includes full support for:

### C/C++/Objective-C/Objective-C++
- **LSP**: clangd for code completion, diagnostics, and navigation
- **Syntax Highlighting**: Tree-sitter parsers for C, C++, and Objective-C
- **Formatting**: clang-format integration with custom configuration
- **File Types**: Automatic detection of `.mm` files as Objective-C++
- **Features**:
  - Header/source file switching with `<leader>ch`
  - Quick compile and run with `<leader>cc`
  - Code formatting with `<leader>cf`
  - Header guard generation for C++ (headers only)
  - Interface/implementation skeletons for Objective-C/C++

### Other Languages
- **Lua**: Full LSP, formatting, and completion support
- **Go**: LSP with gopls, formatting with gofumpt/goimports
- **Rust**: LSP with rust-analyzer, formatting with rustfmt
- **Python**: LSP support configured
- **Markdown**: Enhanced rendering and LSP support

For detailed C/C++/Objective-C setup information, see `C_CPP_OBJC_SETUP.md`.

## Contribution

Please feel free to contribute to this configuration.
