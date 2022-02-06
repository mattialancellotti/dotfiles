-- autocmds.lua

-- Here are all the autocmds NeoViM will execute if they are enabled.
-- Unfortunately due to missing functions autocmds must be expressed in
-- VimLanguage, but to maintain consistency they will be passed to a lua
-- function.
local cmd = vim.cmd -- This executes ViM commands

cmd [[
augroup filetype
   au!
   autocmd FileType sh,racket setl shiftwidth=2 softtabstop=2 expandtab
   autocmd FileType c,lua     setl shiftwidth=3 softtabstop=3 expandtab
   autocmd BufEnter *.h       setl shiftwidth=3 softtabstop=3 expandtab
   autocmd FileType make      setl tabstop=8 noexpandtab
augroup END
]]
