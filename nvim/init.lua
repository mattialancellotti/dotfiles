-- init.lua

-- Neovim variables
local g = vim.g
local api = vim.api --  To access Vim's lua api
local cmd = vim.cmd --  To execute Vim commands
local opt = vim.opt --  To set options
local fun = vim.fn  --  To call Vim functions

--  Setting options
--  TODO need to compact those
opt.termguicolors  = true
opt.number         = true
opt.relativenumber = true
opt.hlsearch = true
opt.ruler    = true
opt.confirm  = true
opt.textwidth = 80
opt.laststatus = 2
opt.shiftwidth  = 4
opt.softtabstop = 4
opt.expandtab   = true
opt.backup      = false
opt.writebackup = true
opt.wildignore = { '*.o', '*.ghc', '*.out', '__pycache__' }
opt.sessionoptions = { 'buffers', 'folds', 'globals', 'help', 'terminal',
                       'tabpages', 'winpos', 'winsize', 'options' }
opt.runtimepath:append( '~/.config/nvim/lua' )

-- Loading plugins
require('plugins')

--  Color scheme
cmd 'colorscheme nord'

-- Loading mappings
local map = require('config').map

--  Setting mappings
map ('i', 'sd', '<ESC>:w<CR>',     { silent = true })
map ('v', 'sd', '<ESC>:w<CR>',     { silent = true })
map ('n', 'sd', ':w<CR>',          { silent = true })
map ('n', 'se', ':e $MYVIMRC<CR>', { silent = true })
map ('n', '<C-S>', ':SessionCreate<CR>', { silent = true })
map ('n', '<C-L>', ':SessionList<CR>',   { silent = true })
map ('n', 'so', ':source $MYVIMRC<CR>',  { silent = true })
map ('n', 'tf', ':Telescope find_files<CR>', { silent = true })

-- Managing buffers
map ('n', 'tb', ':Telescope buffers<CR>', { silent = true })
map ('n', 'tl', ':bnext<CR>', { silent = true })
map ('n', 'th', ':bprev<CR>'  )
map ('n', 'tq', ':bdelete<CR>')

-- Managing windows
map ('n', '<C-T>q', ':tabclose<CR>')
map ('n', '<C-T>n', ':tabnew<CR>'  )
map ('n', '<C-T>l', ':tabnext<CR>' )
map ('n', '<C-T>h', ':tabprev<CR>' )

-- Creating autocmds
cmd [[
augroup filetype
   au!
   autocmd FileType sh    setl shiftwidth=2 softtabstop=2 expandtab
   autocmd FileType c,lua,*.h setl shiftwidth=3 softtabstop=3 expandtab
   autocmd BufEnter *.h setl shiftwidth=3 softtabstop=3 expandtab
   autocmd FileType make  setl tabstop=8 noexpandtab
augroup END
]]
