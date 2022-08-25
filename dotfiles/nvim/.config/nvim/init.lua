-- init.lua

-- The thing about lua is that it has tables.. global tables and local tables.
-- Unfortunately global tables (accessed by vim.api in vim) are slower that
-- local tables. To gain speed (and speed means 30% faster response time) global
-- stuff should be referenced by local stuff.
-- For this specific reason the following variables have been assigned to local
-- copies. Also no need to write 'vim.'.
local cmd = vim.cmd --  To execute Vim commands
local opt = vim.opt --  To set options

-- Different terminals might have different support for colors.
-- Recently I have been using 24-bit enabled terminals like Alacritty and
-- tmux, but I've also tried non-24-bit enabled terminals like GNU Screen and
-- Unicode-rxvt.
--
-- On Alacritty this works both on pure terminal and in tmux.
-- For more on this type ':h term.txt'.
local env = vim.env
if env.COLORTERM == "truecolor" then
   -- This enables true colors
   opt.termguicolors = true
end

-- Saving changes automatically when executing things like ':make'
opt.autowrite = true

opt.number = true
opt.relativenumber = true
opt.hlsearch = true
opt.hlsearch = true
opt.ruler    = true
opt.confirm  = true
opt.textwidth = 80
opt.laststatus = 2
opt.shiftwidth  = 5
opt.softtabstop = 4
opt.expandtab   = true
opt.backup      = false
opt.writebackup = true
opt.wildignore = { '*.o', '*.ghc', '*.out', '__pycache__' }
opt.sessionoptions = { 'buffers', 'folds', 'globals', 'help', 'terminal',
                       'tabpages', 'winpos', 'winsize', 'options' }
opt.runtimepath:append( '~/.config/nvim/lua' )
opt.showmode = false

-- Loading plugins
require('plugins')

-- Luckily Neovim comes with most (if not all) of the optional features already
-- built in, therefore there is no need to check for feature availability.
require('user/autocmds')         -- Loading neovim autocmds
require('user/mappings')         -- neovim key mappings
require('core/colorscheme')      -- Setting colorscheme


-- Using notify plugin as notification manager
vim.notify = require('notify')

require('user/nvim-tree')        -- nvim-tree configuration
require('user/nvim-treesitter')  -- nvim-treesitter configuration
require('user/nvim-indent')      -- nvim-indentline configuration
