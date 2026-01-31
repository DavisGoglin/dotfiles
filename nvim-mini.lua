-- only deviations from mini.basics
vim.o.winborder = 'rounded'
vim.o.mouse = i -- only insert
vim.o.scrolloff = 2
vim.o.visualbell = true
vim.wo.relativenumber = true
-- what was this for?
-- vim.wo.conceallevel=2
-- vim.wo.concealcursor = 'niv'
vim.o.hlsearch = false
vim.g.mapleader=","

function map(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

map('n', '<space>', 'za')
-- https://www.jackfranklin.co.uk/blog/code-folding-in-vim-neovim/
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""
vim.opt.foldlevelstart = 3
vim.opt.foldlevel = 99
vim.opt.foldnestmax = 4

-- TODO: Replace these splits and navigation with mini.pick?
-- leader directions splits that direction
map('n', '<leader>l', ':vsp<CR><C-w>l')
map('n', '<leader>h', ':vsp<CR>')
map('n', '<leader>j', ':sp<CR><C-w>j')
map('n', '<leader>k', ':sp<CR>')
-- tab navigation
map('n', '<leader>f', 'gt')
map('n', '<leader>d', 'gT')

-- edit/reload vimrc
map('n', '<leader>ev', ':e '..vim.env.MYVIMRC..'<CR>')
map('n', '<leader>sv', ':so '..vim.env.MYVIMRC..'<CR>')

-- save
map('n', '<leader>w', ':w<CR>')

-- escape terminal
map('t', '<leader>x', '<C-\\><C-n>')

-- hack python format
map('n', '<leader>af', '<cmd>silent !black %<cr>')


--------
--- mini
--------

local path_package = vim.fn.stdpath('data') .. '/site'
local mini_path = path_package .. '/pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    -- '--branch', 'stable',
    'https://github.com/nvim-mini/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

require('mini.deps').setup({ path = { package = path_package } })

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- https://jacksmith.xyz/blog/setting-up-neovim-tree-sitter-and-built-in-lsp/
add({
  source = 'nvim-treesitter/nvim-treesitter',
  -- Use 'master' while monitoring updates in 'main'
  checkout = 'master',
  monitor = 'main',
  hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
})
require('nvim-treesitter.configs').setup({
  ensure_installed = { 'lua', 'python', 'rust' },
  highlight = { enable = true },
})

add({source = 'neovim/nvim-lspconfig'})
vim.lsp.enable({'basedpyright', 'rust_analyzer'})

add({source = 'vim-autoformat/vim-autoformat'})
map('n', '<F3>', ':Autoformat<CR>')

add({source = 'folke/tokyonight.nvim'}) -- color scheme
vim.cmd('colorscheme tokyonight-night')

add({source = 'folke/trouble.nvim'})
require("trouble").setup({})
map('n', "<leader>td", "<cmd>Trouble diagnostics toggle<cr>")
map('n', "<leader>tD", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")
map('n', "<leader>tl", "<cmd>Trouble loclist toggle<cr>")
map('n', "<leader>tq", "<cmd>Trouble qflist toggle<cr>")
map('n', "<leader>ts", "<cmd>Trouble symbols toggle<cr>")

-- https://nvim-mini.org/mini.nvim/
-- reviewed 2025-10

-- text editing
--
require('mini.ai').setup()
require('mini.align').setup()
require('mini.comment').setup()
require('mini.completion').setup()
-- require('mini.keymap').setup()
require('mini.move').setup()
require('mini.operators').setup()
require('mini.pairs').setup()
-- require('mini.snippets').setup()
-- require('mini.splitjoin').setup()
require('mini.surround').setup()

-- Workflow
--
require('mini.basics').setup({
	mappings = {
		windows = true,
	}
})
require('mini.bracketed').setup()
-- require('mini.bufremove').setup()
-- require('mini.clue').setup()
-- require('mini.deps').setup()
require('mini.diff').setup()
-- require('mini.extra').setup()
-- require('mini.files').setup() -- later
require('mini.git').setup()
require('mini.jump').setup()
-- require('mini.jump2d').setup()
-- require('mini.misc').setup()
require('mini.pick').setup() -- TODO: add hotkey later
map('n', '<leader>mf', '<cmd>Pick files<cr>')
map('n', '<leader>mg', '<cmd>Pick grep_live<cr>')
map('n', '<leader>mG', '<cmd>Pick grep<cr>')
-- require('mini.sessions').setup()
-- require('mini.visits').setup()

-- Appearance
--
-- require('mini.animate').setup()
-- require('mini.base16').setup()
-- require('mini.colors').setup()
-- require('mini.cursorword').setup()
require('mini.hipatterns').setup({
  highlighters = {
    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
    todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
    note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },
  },
})
-- require('mini.hues').setup()
-- require('mini.indentscope').setup()
-- require('mini.map').setup()
require('mini.icons').setup()
require('mini.notify').setup()
-- require('mini.starter').setup()
require('mini.statusline').setup()
require('mini.tabline').setup()
require('mini.trailspace').setup()

-- Other
-- require('mini.doc').setup()
-- require('mini.fuzzy').setup()
-- require('mini.test').setup()
