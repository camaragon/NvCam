# NvCam

A personalized Neovim configuration built on top of [NvChad v2.5](https://nvchad.com/), optimized for full-stack development with enhanced navigation, formatting, and development tools.

## Features

### Language Support
- **LSP Servers**: Bash, CSS, GraphQL, HTML, JSON, Lua, Prisma, Python, Rust, Tailwind CSS, TypeScript, Vim, YAML
- **Formatters**: Biome, Prettier, Stylua, Ruff (Python), and language-specific formatters
- **Linting**: ESLint for JavaScript/TypeScript projects
- **Syntax Highlighting**: Comprehensive Treesitter support for web development, systems programming, and configuration files

### Development Tools
- **GitHub Copilot**: AI-powered code completion
- **DAP (Debug Adapter Protocol)**: Full debugging support with UI
- **Auto-formatting**: Smart formatter selection based on project configuration
- **UFO**: Advanced code folding with LSP integration
- **Crates.nvim**: Cargo.toml dependency management for Rust projects
- **Tailwind Tools**: Enhanced Tailwind CSS development experience

### Enhanced Navigation
- **Hop.nvim**: Lightning-fast cursor movement with character/word jumping
- **Oil.nvim**: File directory navigation (replaces netrw)
- **Tmux Integration**: Seamless pane navigation between Neovim and tmux
- **nvim-surround**: Easy manipulation of surrounding characters
- **nvim-ts-autotag**: Auto-close and rename HTML/JSX tags

### Git Integration
- **vim-fugitive**: Comprehensive Git commands within Neovim
- **Gitsigns**: Git blame, diff, and hunk navigation

## Installation

### Prerequisites
- Neovim 0.10+
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (recommended: JetBrainsMono Nerd Font)
- Node.js (for LSP servers and formatters)
- Ripgrep (for telescope grep)

### Quick Install

```bash
# Backup your existing config (if any)
mv ~/.config/nvim ~/.config/nvim.backup

# Clone NvCam
git clone https://github.com/camaragon/NvCam ~/.config/nvim

# Start Neovim (plugins will install automatically)
nvim
```

### Post-Install

After first launch, run:
```vim
:MasonInstallAll
```

This will install all configured LSP servers, formatters, and linters.

## Configuration Structure

```
~/.config/nvim/
├── init.lua                 # Main entry point
├── lua/
│   ├── options.lua          # Vim options and settings
│   ├── mappings.lua         # Custom keybindings
│   ├── autocmds.lua         # Auto commands
│   ├── chadrc.lua           # NvChad configuration
│   ├── configs/
│   │   ├── conform.lua      # Formatter configuration
│   │   ├── lspconfig.lua    # LSP server setup
│   │   └── linting.lua      # Linting configuration
│   └── plugins/
│       └── init.lua         # Plugin specifications
└── lazy-lock.json           # Locked plugin versions
```

## Key Mappings

### General
| Mapping | Action |
|---------|--------|
| `<Space>` | Leader key |
| `;` | Enter command mode |
| `jk` | Exit insert mode |
| `<leader>s` | Save file |
| `<leader>q` | Force quit |

### File Navigation
| Mapping | Action |
|---------|--------|
| `-` | Open Oil file browser |
| `<leader>ff` | Find files (Telescope) |
| `<leader>fg` | Live grep (Telescope) |

### LSP & Code
| Mapping | Action |
|---------|--------|
| `<leader>fm` | Format file |
| `<leader>ca` | Code actions |
| `<leader>l` | Trigger linting |
| `K` | Show hover documentation |
| `gd` | Go to definition |
| `gr` | Show references |

### Hop Navigation
| Mapping | Action |
|---------|--------|
| `<leader>w` | Hop to words |
| `<leader>g` | Hop vertically |
| `f/F/t/T` | Enhanced character navigation |

### Git
| Mapping | Action |
|---------|--------|
| `<leader>gl` | Git blame all lines |
| `<leader>gg` | Toggle current line blame |
| `<leader>di` | Vertical Git diff |
| `<leader>gs` | Git status |

### Debugging (DAP)
| Mapping | Action |
|---------|--------|
| `<leader>db` | Toggle breakpoint |
| `<leader>dc` | Continue |
| `<leader>ds` | Step over |
| `<leader>di` | Step into |
| `<leader>do` | Step out |

### Tmux Integration
| Mapping | Action |
|---------|--------|
| `<leader>h` | New horizontal tmux pane |
| `<leader>v` | New vertical tmux pane |
| `<C-h/j/k/l>` | Navigate between Neovim/tmux panes |

## Formatter Configuration

NvCam intelligently selects formatters based on your project:

- **Biome**: Used automatically if `biome.json` exists in project root
- **Prettier**: Fallback for web technologies (JS/TS/JSX/HTML/CSS)
- **Stylua**: Lua formatting
- **Ruff**: Python formatting and import organization
- **Language-specific**: Rust Analyzer for Rust, etc.

Format on save can be enabled by uncommenting in `lua/plugins/init.lua`:
```lua
{
  "stevearc/conform.nvim",
  event = 'BufWritePre', -- uncomment for format on save
  ...
}
```

## Editor Settings

- **Indentation**: 4-space tabs (hard tabs, not spaces)
- **Column Guide**: 80 characters
- **Line Numbers**: Absolute (relative disabled)
- **Folding**: Tree-sitter based with UFO
- **Cursor Line**: Highlighted

## Plugins

### Core
- **NvChad/NvChad**: Base configuration framework
- **folke/lazy.nvim**: Plugin manager

### LSP & Completion
- **neovim/nvim-lspconfig**: LSP configurations
- **williamboman/mason.nvim**: LSP/formatter installer

### Formatting & Linting
- **stevearc/conform.nvim**: Formatter manager
- **mfussenegger/nvim-lint**: Linting engine

### Navigation
- **smoka7/hop.nvim**: Fast cursor movement
- **stevearc/oil.nvim**: File browser
- **christoomey/vim-tmux-navigator**: Tmux integration

### Git
- **tpope/vim-fugitive**: Git commands
- **lewis6991/gitsigns.nvim**: Git decorations

### Editing
- **kylechui/nvim-surround**: Surround manipulation
- **windwp/nvim-ts-autotag**: Auto-close tags
- **numToStr/Comment.nvim**: Smart commenting
- **JoosepAlviste/nvim-ts-context-commentstring**: Context-aware comments

### Development
- **github/copilot.vim**: AI code completion
- **mfussenegger/nvim-dap**: Debug adapter protocol
- **mfussenegger/nvim-dap-python**: Python debugging
- **saecki/crates.nvim**: Rust dependency management
- **luckasRanarison/tailwind-tools.nvim**: Tailwind CSS tools

### UI Enhancements
- **kevinhwang91/nvim-ufo**: Advanced folding
- **nvim-treesitter/nvim-treesitter**: Syntax highlighting
- **nvim-treesitter/playground**: Treesitter exploration

## Updating

```bash
# Update plugins
:Lazy sync

# Update NvChad base
:NvChadUpdate

# Update all Mason packages
:MasonUpdate
```

## Troubleshooting

### Theme not loading
If you see errors about missing base46 cache files, regenerate them:
```vim
:lua require('base46').load_all_highlights()
```

### LSP server not working
Check if the server is installed:
```vim
:Mason
```

Install missing servers:
```vim
:MasonInstall <server-name>
```

### Formatter not working
1. Check if formatter is installed via Mason
2. Verify formatter configuration in `lua/configs/conform.lua`
3. Check for project-specific config files (e.g., `biome.json`, `.prettierrc`)

## Credits

- [NvChad](https://nvchad.com/) - Base configuration framework
- [LazyVim](https://github.com/LazyVim/LazyVim) - Inspiration for starter structure
- All plugin authors and contributors

## License

MIT License - see [LICENSE](LICENSE) for details
