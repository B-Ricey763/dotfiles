local opts = {}

function opts.setup()
  -- Gives you inlay diagnostics
  vim.diagnostic.config { virtual_text = true }
  -- Set <space> as the leader key
  -- NOTE: Make sure to set this before plugins are loaded
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '

  -- Make line numbers default
  vim.opt.number = true
  vim.opt.relativenumber = true

  -- Enable mouse mode, can be useful for resizing splits for example!
  vim.opt.mouse = 'a'

  -- Don't show the mode, since it's already in status line
  vim.opt.showmode = false

  -- Enable break indent
  vim.opt.breakindent = true

  -- Make vim use system keyboard
  vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
  end)

  -- Save undo history
  vim.opt.undofile = true

  -- Case-insensitive searching UNLESS \C or capital in search
  vim.opt.ignorecase = true
  vim.opt.smartcase = true

  -- Keep signcolumn on by default
  -- The signcolumn is where breakpoints, git suff (with plugins like gitsigns)
  -- are shown
  -- vim.opt.signcolumn = 'yes'

  -- Decrease update time
  vim.opt.updatetime = 250
  vim.opt.timeoutlen = 300

  -- Configure how new splits should be opened
  vim.opt.splitright = true
  vim.opt.splitbelow = true

  -- Sets how neovim will display certain whitespace in the editor.
  --  See `:help 'list'`
  --  and `:help 'listchars'`
  -- vim.opt.list = true
  -- vim.opt.listchars = { trail = '·', nbsp = '␣' }

  -- Preview substitutions live, as you type!
  vim.opt.inccommand = 'split'

  -- Show which line your cursor is on
  vim.opt.cursorline = true

  -- Use a higher conceal level for markdown files
  -- especially stuff like obsidian
  -- vim.opt.conceallevel = 2

  -- Minimal number of screen lines to keep above and below the cursor.
  vim.opt.scrolloff = 10

  -- Enable autoident for new lines (inherit the indent)
  vim.opt.autoindent = true
  -- Set highlight on search, but clear on pressing <Esc> in normal mode
  -- see corresponding keymap in keymap.lua
  vim.opt.hlsearch = true

  -- Set tab display width to a sensible value
  vim.opt.tabstop = 4
  vim.opt.shiftwidth = 4
end

return opts
