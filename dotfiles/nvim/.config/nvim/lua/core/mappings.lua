-- mappings.lua

-- Saving neovim's mapping function to the local 'mapping' for efficiency
-- and shortness
local mapping = vim.api.nvim_set_keymap

-- Common parameters among all the mappings
local mapping_options = { silent = true, noremap = true }

-- Common mappings go here
mapping ('i', 'sd', '<ESC>:w<CR>', mapping_options)
mapping ('v', 'sd', '<ESC>:w<CR>', mapping_options)
mapping ('n', 'sd', ':w<CR>', mapping_options)
mapping ('n', 'se', ':e $MYVIMRC<CR>', mapping_options)
mapping ('n', '<C-n>', ':NvimTreeToggle<CR>', mapping_options)
mapping ('n', 'so', ':source $MYVIMRC<CR>',   mapping_options)
mapping ('n', 'tf', ':Telescope find_files<CR>', mapping_options)

-- Managing buffers
mapping ('n', 'tb', ':Telescope buffers<CR>', mapping_options)
mapping ('n', 'tl', ':bnext<CR>',   mapping_options)
mapping ('n', 'th', ':bprev<CR>',   mapping_options)
mapping ('n', 'tq', ':bdelete<CR>', mapping_options)

-- Managing windows
mapping ('n', '<C-T>q', ':tabclose<CR>', mapping_options)
mapping ('n', '<C-T>n', ':tabnew<CR>',  mapping_options)
mapping ('n', '<C-T>l', ':tabnext<CR>', mapping_options)
mapping ('n', '<C-T>h', ':tabprev<CR>', mapping_options)
