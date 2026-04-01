# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture

This config uses `mini.nvim` as its foundation. `mini.deps` (bootstrapped in `init.lua`) is the plugin manager — all other plugins are declared via `MiniDeps.add()` inside the `plugin/` files.

Plugin files load in filename order:

| File | Purpose |
|---|---|
| `plugin/10_options.lua` | Core vim options, diagnostics config |
| `plugin/20_keymaps.lua` | All keymaps; defines `Config.leader_group_clues` |
| `plugin/30_mini.lua` | All `mini.*` module setup |
| `plugin/35_snacks.lua` | `folke/snacks.nvim` (lazygit, register picker) |
| `plugin/40_plugins.lua` | tree-sitter, nvim-lspconfig, conform.nvim, colorscheme |
| `after/lsp/<server>.lua` | Per-server LSP config overrides (optional) |
| `after/ftplugin/<ft>.lua` | Filetype-specific overrides |
| `after/snippets/<lang>.json` | Language snippets (mini.snippets format) |
| `snippets/global.json` | Snippets available in all buffers |

## Loading Strategy

`30_mini.lua` and `40_plugins.lua` use a three-tier pattern — always follow this when adding new setup:

- `MiniDeps.now()` — runs immediately at startup (UI-critical: statusline, tabline, icons, notifications)
- `MiniDeps.later()` — deferred after first draw (operators, pickers, git tools, colorscheme)
- `Config.now_if_args(fn)` — runs now if files were passed to `nvim`, else deferred (completion, LSP, treesitter)

## Keymaps Are Separated from Plugins

All keymaps live in `20_keymaps.lua`, which runs **before** plugins are configured in `30_mini.lua`/`40_plugins.lua`. This means keymaps cannot reference plugin globals directly — those don't exist yet at mapping time.

The solution: use `<Cmd>lua ...<CR>` strings as the RHS. The string is only evaluated at keypress time, by which point `later()` has already run and globals like `MiniFiles`, `MiniDiff`, `Snacks`, etc. exist.

```lua
-- CORRECT: string evaluated at keypress time
nmap_leader('ed', '<Cmd>lua MiniFiles.open()<CR>', 'Directory')

-- WRONG: function reference evaluated immediately at startup (MiniFiles doesn't exist yet)
nmap_leader('ed', MiniFiles.open, 'Directory')
```

When adding a new keymap that calls a plugin function, always use the `<Cmd>lua ...<CR>` string form.

## Adding Language Support

To add a new language (e.g. `rust`), two things are required in `40_plugins.lua`:

1. **Tree-sitter**: Add the language name to the `languages` table in the `now_if_args` treesitter block. After saving, restart Neovim once to install the parser.

2. **LSP**: Add the server name to the `vim.lsp.enable({...})` call. The server binary must be installed separately (e.g. `rust-analyzer`).

```lua
-- In the languages table:
'rust',

-- In vim.lsp.enable():
'rust_analyzer',
```

An `after/lsp/<server>.lua` file is **only needed** if you want to override the default nvim-lspconfig settings for that server. See `after/lsp/lua_ls.lua` as an example — it customizes completion trigger chars and adds the Neovim runtime to the workspace library.

## Keymap Conventions

Leader mappings follow two-key semantic grouping. First key = group, second key = action. Add new groups to `Config.leader_group_clues` in `20_keymaps.lua` so `mini.clue` can display them.

**Lowercase = global/workspace scope; Uppercase = local/buffer scope** (e.g. `<Leader>fd` workspace diagnostics, `<Leader>fD` buffer diagnostics).

Helper functions defined at the top of `20_keymaps.lua`: `nmap()`, `nmap_leader()`, `xmap_leader()`.

## Snippets

- Global snippets: `snippets/global.json`
- Language snippets: `after/snippets/<lang>.json`
- Format: VS Code-style JSON with `$1`/`$0` tabstops
- Loaders configured in `30_mini.lua` via `mini.snippets.gen_loader`

## Style

- Section headers use box-drawing comments: `-- ┌──────────┐` / `-- │ Title    │` / `-- └──────────┘`
- `-- stylua: ignore start` / `-- stylua: ignore end` around manually aligned tables
- Tab width: 2 spaces (enforced by stylua; format with `<Leader>lf`)
- `Config` global table used for cross-file communication (leader clues, autocommand helpers)
