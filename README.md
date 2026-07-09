# NvCam

A personalized Neovim configuration built on top of [NvChad v2.5](https://nvchad.com/), optimized for full-stack TypeScript and Rust development.

Requires **Neovim 0.11+** (uses `vim.lsp.config` API).

## Features

### Language Support
- **LSP**: Bash, Biome, CSS, GraphQL, HTML, JSON, Lua, Prisma, Python (Pyright), Rust Analyzer, Tailwind CSS, TypeScript, Vim, YAML
- **Formatters**: Biome (auto-detected via `biome.json`), Prettier, Stylua, Ruff, Sleek (SQL), latexindent, xmlformat
- **Linting**: ESLint (auto-detected via config files), Ruff for Python
- **Treesitter**: Full syntax highlighting for web dev, systems programming, and config files

### Development Tools
- **GitHub Copilot** — AI code completion
- **DAP** — Debug Adapter Protocol with UI (Python, extensible)
- **Conform.nvim** — Format on save with smart formatter selection
- **UFO** — Advanced code folding (LSP + indent providers)
- **Crates.nvim** — Cargo.toml dependency management
- **Tailwind Tools** — Enhanced Tailwind CSS DX

### Navigation
- **Hop.nvim** — Fast cursor movement (words, lines, characters)
- **Oil.nvim** — File browser that replaces netrw
- **Tmux Navigator** — Seamless `<C-h/j/k/l>` between Neovim and tmux panes
- **nvim-surround** — Manipulate surrounding characters
- **nvim-ts-autotag** — Auto-close and rename HTML/JSX tags

### Git
- **vim-fugitive** — Git commands (`:Git`, blame, diff)
- **Gitsigns** — Inline blame, hunk navigation

### Clipboard
- **OSC 52** — System clipboard works over SSH (no X11/Wayland needed). Requires terminal support (iTerm2, Alacritty, kitty, WezTerm). For tmux, add `set -g set-clipboard on` to your `~/.tmux.conf`.

## Installation

### Prerequisites
- Neovim 0.11+ (`brew install neovim --HEAD` or [unstable PPA](https://launchpad.net/~neovim-ppa/+archive/ubuntu/unstable))
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (recommended: JetBrainsMono)
- Node.js (for LSP servers and formatters)
- Ripgrep (`rg`, for Telescope grep)

### Quick Install

```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.backup

# Clone
git clone https://github.com/camaragon/NvCam ~/.config/nvim

# Launch (plugins auto-install via lazy.nvim)
nvim
```

After first launch:
```vim
:MasonInstallAll
```

## Structure

```
~/.config/nvim/
├── init.lua                  # Entry point (OSC 52 clipboard, lazy.nvim bootstrap)
├── lua/
│   ├── options.lua           # Editor settings
│   ├── mappings.lua          # Keybindings
│   ├── autocmds.lua          # Auto commands (lint, format, yank highlight)
│   ├── chadrc.lua            # NvChad theme config (ayu_dark)
│   ├── configs/
│   │   ├── conform.lua       # Formatter config (Biome/Prettier auto-detect)
│   │   ├── lspconfig.lua     # LSP servers (vim.lsp.config API)
│   │   └── linting.lua       # Linter config (ESLint auto-detect)
│   └── plugins/
│       └── init.lua          # Plugin specs
└── lazy-lock.json            # Locked plugin versions
```

## Key Mappings

Leader: `<Space>`

### General
| Key | Action |
|-----|--------|
| `;` | Command mode |
| `jk` | Exit insert mode |
| `<leader>s` | Save |
| `<leader>q` | Force quit |
| `<leader>rp` | Copy relative file path |

### Navigation
| Key | Action |
|-----|--------|
| `-` | Oil file browser |
| `<leader>ff` | Find files (Telescope) |
| `<leader>fg` | Live grep (Telescope) |
| `<leader>w` | Hop to word |
| `<leader>g` | Hop vertical |
| `f/F/t/T` | Hop character (current line) |
| `<C-h/j/k/l>` | Navigate Neovim/tmux panes |

### Code
| Key | Action |
|-----|--------|
| `<leader>fm` | Format file |
| `<leader>ca` | Code actions |
| `<leader>l` | Trigger linting |
| `<leader>f` | Open diagnostic float |
| `K` | Hover docs |
| `gd` | Go to definition |
| `gD` | Go to declaration |

### Folding (UFO)
| Key | Action |
|-----|--------|
| `zR` | Open all folds |
| `zM` | Close all folds |
| `zK` | Peek fold |

### Git
| Key | Action |
|-----|--------|
| `<leader>gs` | Git status |
| `<leader>gl` | Git blame (all lines) |
| `<leader>gg` | Toggle inline blame |
| `<leader>di` | Vertical diff |

### Debug (DAP)
| Key | Action |
|-----|--------|
| `<leader>db` | Toggle breakpoint |
| `<leader>dc` | Continue |
| `<leader>ds` | Step over |
| `<leader>dsi` | Step into |
| `<leader>do` | Step out |
| `<leader>dr` | Open debug REPL |
| `<leader>dt` | Terminate debug session |
| `<leader>dus` | Open debug sidebar |

### Java / Spring Boot Debugging

Java debugging uses `nvim-jdtls` with Mason's `jdtls`, `java-debug-adapter`, and `java-test` packages.

1. Open a `.java` file from the Spring Boot project root.
2. Wait for JDTLS to import the Maven/Gradle project.
3. Set a breakpoint with `<leader>db`.
4. Start with `<leader>dc`; JDTLS will discover Spring Boot main classes and prompt for a launch configuration.

Java helpers:

| Key | Action |
|-----|--------|
| `<leader>jtc` | Test current class |
| `<leader>jtn` | Test nearest method |
| `<leader>jor` | Organize imports |

### Terminal
| Key | Action |
|-----|--------|
| `<leader>h` | Horizontal tmux split |
| `<leader>v` | Vertical tmux split |
| `<leader>ft` | Floating terminal |

## Formatter Auto-Detection

Formatters are selected per-project:

- **`biome.json` exists** → Biome for JS/TS/CSS/JSON/GraphQL
- **No biome.json** → Prettier (via prettierd) as fallback
- **Rust** → rust-analyzer format on save
- **Python** → Ruff format + import organization
- **Lua** → Stylua

## Editor Settings

| Setting | Value |
|---------|-------|
| Indentation | 4-space hard tabs |
| Column guide | 80 chars |
| Line numbers | Absolute |
| Scroll offset | 8 lines |
| Whitespace | Visible (tabs: `→`, trailing: `·`) |
| Theme | ayu_dark (italic comments) |
| Folding | UFO (LSP + indent) |
| Clipboard | System (OSC 52 over SSH) |

## Updating

```vim
:Lazy sync          " Update plugins
:NvChadUpdate       " Update NvChad base
:MasonUpdate        " Update LSP servers and formatters
```

## Troubleshooting

**Theme not loading:**
```vim
:lua require('base46').load_all_highlights()
```

**LSP server missing:**
```vim
:Mason              " Check installed servers
:MasonInstall <name>
```

**Clipboard not working over SSH:**
1. Ensure your terminal supports OSC 52 (iTerm2, kitty, Alacritty, WezTerm)
2. iTerm2: Settings → General → Selection → ✅ "Applications in terminal may access clipboard"
3. tmux: Add `set -g set-clipboard on` to `~/.tmux.conf`

## Credits

- [NvChad](https://nvchad.com/) — Base configuration framework
- All plugin authors

## License

MIT
