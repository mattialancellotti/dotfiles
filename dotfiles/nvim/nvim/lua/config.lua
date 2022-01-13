-- Module: mappings.lua
-- Contains the function usefull to map keys.
-- This file needs to be imported into the main init.

-- Declaring the module's global interface
local config = {}

-- This function takes a table, or list of mappings, and will configure them
-- through the pairs(..) function.
local function map(mode, lhs, rhs, opts)
   -- Configuring the options for every single mapping
   local options = { noremap = true }
   if opts then options = vim.tbl_extend('force', options, opts or {}) end

   -- Adding the keymap
   vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
config.map = map

return config
