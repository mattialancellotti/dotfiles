local cmd = vim.cmd

-- Trying to load the colorscheme, if unsuccessful load the default one
local status_ok, _ = pcall(cmd, 'colorscheme melange')
if not status_ok then
   cmd [[colorscheme lunaperche]]
end
