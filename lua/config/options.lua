-- Enable faster startup by caching compiled Lua modules
vim.loader.enable()

-- Set leaders before plugins and keymaps are loaded.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- See `:help vim.o` and `:help option-list`.
vim.o.number = true
-- vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.showmode = false

-- Schedule clipboard setup to avoid slowing down startup.
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

vim.o.breakindent = true
vim.o.undofile = true

-- Case-insensitive searching unless the search contains capital letters or \C.
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true

-- Display whitespace characters. See `:help 'listchars'`.
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true

-- Diagnostic display and navigation behavior. See `:help vim.diagnostic.Opts`.
vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },
  virtual_text = true,
  virtual_lines = false,
  jump = {
    on_jump = function(_, bufnr)
      vim.diagnostic.open_float {
        bufnr = bufnr,
        scope = 'cursor',
        focus = false,
      }
    end,
  },
}
