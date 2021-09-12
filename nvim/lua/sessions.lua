-- Plugin that handles sessions

-- Declares module
local M = {}

-- Sessions' path
local sessions_path = string.format('%s%s', vim.env.HOME, '/.local/share/nvim/sessions/')

-- Printing functions
local del_print = vim.api.nvim_del_current_line
local echo = vim.api.nvim_out_write
local err = vim.api.nvim_err_writeln

-- Creates a session based on the user's input for a file name.
M.create_session = (function ()
   local name, file

   -- Asks for a name and checks if it already exists
   name = string.format('%s%s.vim', sessions_path, vim.fn['input']('Session name: '))
   file = io.open(name)

   -- Checking if the file already exists
   if file == nil then
      -- Writes new session
      vim.cmd(':mksession! '..name)
      return true
   end

   -- Printing an error message
   err('File already exists')
   io.close(file)
   return false
end)

-- This function lists all the sessions' names
M.list_sessions = (function () vim.cmd('!ls '..sessions_path) end)

-- TODO: delete_session, load_session, autoupdate
return M
