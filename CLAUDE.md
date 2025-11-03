# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration called "NvCam" based on NvChad v2.5. It uses the Lazy.nvim plugin manager and follows a modular architecture with separate configuration files for different aspects of the editor setup.

## Architecture

### Core Structure
- `init.lua` - Main entry point that bootstraps Lazy.nvim, loads NvChad base, and requires core modules
- `lua/options.lua` - Global Vim options and settings (extends NvChad defaults)
- `lua/mappings.lua` - Custom keybindings and hotkeys (extends NvChad mappings)
- `lua/autocmds.lua` - Auto commands and event handlers
- `lua/chadrc.lua` - NvChad specific configuration

### Plugin Management
- Uses Lazy.nvim as package manager
- `lua/configs/lazy.lua` - Lazy.nvim configuration with performance optimizations
- `lua/plugins/init.lua` - Plugin specifications and configurations
- `lazy-lock.json` - Locked plugin versions (similar to package-lock.json)

### LSP and Development Tools
- `lua/configs/lspconfig.lua` - Language server configurations for multiple languages
- `lua/configs/conform.lua` - Code formatting setup with multiple formatters
- `lua/configs/linting.lua` - Linting configuration for JavaScript/TypeScript

## Key Features

### Language Support
- **LSP Servers**: bash, CSS, GraphQL, HTML, JSON, Lua, Prisma, Rust, Tailwind CSS, TypeScript, Vim, YAML
- **Formatters**: Biome, Prettier, Stylua, and language-specific formatters
- **Linting**: ESLint for JS/TS projects
- **Treesitter**: Syntax highlighting for web dev, systems programming, and config files

### Navigation and Movement
- **Hop.nvim**: Advanced cursor movement with character/word jumping
- **Oil.nvim**: File directory navigation (replaces netrw)
- **Tmux integration**: Seamless pane navigation between Neovim and tmux
- **Git integration**: Fugitive for Git commands, Gitsigns for blame and diff

### Development Workflow
- **GitHub Copilot**: AI code completion
- **DAP**: Debug Adapter Protocol for debugging
- **UFO**: Advanced code folding with LSP integration
- **Crates.nvim**: Cargo.toml dependency management for Rust

## Important Settings

### Indentation
- Uses 4-space tabs (`tabstop=4`, `softtabstop=4`, `shiftwidth=4`)
- Tabs are NOT expanded to spaces (`expandtab=false`)
- Auto-indent and smart-indent enabled

### Editor Behavior  
- 80-character column guide
- Tree-sitter based code folding
- Relative line numbers disabled
- Cursor line highlighting enabled

## Key Mappings

### Essential Shortcuts
- `<leader>` = Space
- `;` = Enter command mode
- `jk` = Exit insert mode
- `<leader>fm` = Format file with Conform
- `<leader>s` = Save file
- `<leader>q` = Force quit
- `-` = Open Oil file browser

### Development
- `<leader>ca` = LSP code actions
- `<leader>f` = Open LSP diagnostics float
- `K` = Show hover documentation
- `<leader>l` = Trigger linting
- `<leader>db` = Toggle DAP breakpoint

### Git Workflow
- `<leader>gl` = Git blame all lines
- `<leader>gg` = Toggle current line blame
- `<leader>di` = Vertical Git diff
- `<leader>gs` = Git status

### Navigation
- `<C-h/j/k/l>` = Tmux-aware window navigation
- `<leader>w` = Hop to words
- `<leader>g` = Hop vertically
- `f/F/t/T` = Enhanced character navigation with Hop

### Terminal
- `<leader>h` = New horizontal tmux pane
- `<leader>v` = New vertical tmux pane
- `<leader>ft` = Toggle floating terminal

## Development Workflow

### Formatting
Files are automatically formatted on save using Conform. The configuration intelligently chooses formatters:
- Uses Biome if `biome.json` exists in project root
- Falls back to Prettier for web technologies
- Language-specific formatters (stylua for Lua, ruff for Python)

### Plugin Development
When adding new plugins:
1. Add plugin specification to `lua/plugins/init.lua`
2. Create config file in `lua/configs/` if complex setup needed
3. Add any required tools to Mason's `ensure_installed` list
4. Update LSP server list in `lspconfig.lua` if adding language support

### Configuration Changes
- Edit `lua/options.lua` for Vim settings
- Edit `lua/mappings.lua` for new keybindings  
- Use `lua/chadrc.lua` for NvChad-specific theming/UI changes