# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal Neovim configuration based on a fork of DreamNvim. It's a modular Lua-based configuration using the Lazy.nvim plugin manager.

## Architecture

### Core Structure
- `init.lua` - Main entry point with basic Vim settings, keymaps, and Lazy.nvim setup
- `lua/plugins/` - Plugin specifications organized by category:
  - `init.lua` - Core dependencies (lazy.nvim, plenary, tmux-navigator)
  - `code.lua` - LSP, completion, and coding-related plugins
  - `ui.lua` - UI enhancements, themes, and visual plugins
  - `edit.lua` - Text editing enhancements
  - `colorscheme.lua` - Color scheme configuration
  - `configs/` - Plugin-specific configurations (lspconfig, mason, cmp, etc.)
- `after/ftplugin/` - Language-specific configurations (C, C++, Objective-C, Objective-C++)

### Plugin Management
- Uses Lazy.nvim for plugin management
- Plugins are auto-loaded based on file types and events
- All plugins import from the `plugins` module in `init.lua`

### Language Support Architecture
The configuration provides comprehensive support for multiple languages:
- **C/C++/Objective-C/C++**: Full LSP (clangd), formatting (clang-format), and custom ftplugin configurations
- **Lua**: LSP with lua_ls and lazydev for Neovim API completion
- **Go, Rust, Python**: LSP servers configured via Mason

## Common Development Commands

### Plugin Management
```bash
# Open Lazy plugin manager interface
:Lazy

# Update all plugins
:Lazy update

# Install missing plugins
:Lazy install
```

### LSP and Mason
```bash
# Open Mason interface to manage LSP servers and tools
:Mason

# LSP-related commands are handled automatically via keymaps (see Keymaps section)
```

### Language-Specific Commands (C/C++/Objective-C)

The configuration includes custom ftplugin files that provide language-specific keymaps:

#### C++ Development (`after/ftplugin/cpp.lua`)
- `<leader>cc` - Compile and run C++ file (g++ -Wall -Wextra -std=c++17)
- `<leader>cf` - Format with clang-format
- `<leader>ch` - Switch between header/source files (.cpp/.hpp/.h)
- `<leader>cg` - Generate header guards (header files only)

#### Similar support exists for C, Objective-C, and Objective-C++ files

## Key Configuration Details

### Plugin Categories
1. **Code Plugins** (`code.lua`): LSP (lspconfig, mason), completion (nvim-cmp), and development tools
2. **UI Plugins** (`ui.lua`): Status line, file explorer, fuzzy finder, and visual enhancements
3. **Edit Plugins** (`edit.lua`): Text editing improvements and utilities

### Leader Key
- Leader key is set to `<space>` (space bar)
- Most custom keymaps use the leader key prefix

### Performance Optimizations
- Lua bytecode caching enabled (`vim.loader.enable()`)
- Lazy loading for most plugins based on file types and events
- Performance-focused options like `lazyredraw = true`

## File Detection and Types
- Custom file type detection in `ftdetect/`
- Objective-C++ files (`.mm`) are properly detected
- Language-specific settings applied via `after/ftplugin/` files

## Formatting and Code Style
- clang-format integration for C/C++/Objective-C with custom `.clang-format` configuration
- Automatic formatting available via `<leader>cf` keymaps in C/C++ files
- Mason manages formatter installation automatically

## Health Check and Diagnostics

### Critical Missing Dependencies
Based on `:checkhealth`, these tools should be installed for full functionality:

```bash
# Essential for Telescope live-grep functionality
brew install ripgrep

# Recommended for enhanced file finding in Telescope
brew install fd

# For tmux true color support, add to ~/.tmux.conf:
set-option -a terminal-features 'xterm-256color:RGB'
```

### Optional Missing Tools
These are not essential but provide enhanced functionality:
- `tree-sitter` CLI (only needed for `:TSInstallFromGrammar`)
- `wget` (curl is available as alternative)
- Go, Java, PHP, Julia (only needed if developing in those languages)

### Health Check Commands
```bash
# Check overall Neovim health
:checkhealth

# Check specific plugin health
:checkhealth telescope
:checkhealth mason
:checkhealth vim.lsp
```

## Installation Dependencies
The configuration automatically installs required tools via Mason, but assumes:
- Git is available for plugin installation
- A Nerd Font is installed for proper icon display (`vim.g.have_nerd_font = true`)
- Language-specific compilers/tools for full functionality (clang, g++, etc.)

## Known Issues
- Some keymap overlaps exist (reported by which-key) but don't affect functionality
- render-markdown plugin shows warnings for unused latex/yaml parsers (can be disabled if not needed)
- Provider warnings for Node.js, Python, Perl, Ruby (only affect plugin development in those languages)