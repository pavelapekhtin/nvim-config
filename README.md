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
