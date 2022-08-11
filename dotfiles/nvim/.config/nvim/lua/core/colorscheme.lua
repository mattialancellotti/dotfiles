local cmd = vim.cmd

-- Trying to load the colorscheme, if unsuccessful load the default one
local status_ok, _ = pcall(cmd, 'colorscheme gruvbox')
if not status_ok then
   cmd [[colorscheme default]]
end
