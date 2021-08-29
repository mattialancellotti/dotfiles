-- popup.lua
require('plenary.reload').reload_module('popup')

local popup = require('popup')

vim.cmd [[highlight PopupColor1 ctermbg=lightblue guibg=lightblue]]

-- Creating popup
popup.create('Hello there', {
   line = 3,
   col = 11,
   minwidth = 20,
   highlight = 'PopupColor1'
})
