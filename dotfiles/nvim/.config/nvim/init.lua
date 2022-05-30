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

--  Color scheme
cmd 'colorscheme everforest'

-- Loading mappings
local map = require('config').map

--  Setting mappings
map ('i', 'sd', '<ESC>:w<CR>',     { silent = true })
map ('v', 'sd', '<ESC>:w<CR>',     { silent = true })
map ('n', 'sd', ':w<CR>',          { silent = true })
map ('n', 'se', ':e $MYVIMRC<CR>', { silent = true })
map ('n', '<C-S>', ':SessionCreate<CR>',  { silent = true })
map ('n', '<C-L>', ':SessionList<CR>',    { silent = true })
map ('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true })
map ('n', 'so', ':source $MYVIMRC<CR>',  { silent = true })
map ('n', 'tf', ':Telescope find_files<CR>', { silent = true })

-- Managing buffers
map ('n', 'tb', ':Telescope buffers<CR>', { silent = true })
map ('n', 'tl', ':bnext<CR>', { silent = true })
map ('n', 'th', ':bprev<CR>', { silent = true })
map ('n', 'tq', ':bdelete<CR>', { silent = true })

-- Managing windows
map ('n', '<C-T>q', ':tabclose<CR>')
map ('n', '<C-T>n', ':tabnew<CR>'  )
map ('n', '<C-T>l', ':tabnext<CR>' )
map ('n', '<C-T>h', ':tabprev<CR>' )

-- As far as I know most of this configuration is tied to NeoVim that comes with
-- all features enabled by default, therefore checking for autocmd feature is
-- useless.
require('user/autocmds')
require('user/nvim-tree')     -- nvim-tree configuration
