-- autocmds.lua

local api = vim.api

api.nvim_create_augroup("filetype", { clear = true })

-- GNU Standards for Makefile (also with spaces recipies will fail so..)
api.nvim_create_autocmd("FileType", {
   group = "filetype",
   pattern = "make",
   command = "setl tabstop=8 noexpandtab",
})

-- Bash Standards from ttps://lug.fh-swf.de/vim/vim-bash/StyleGuideShell.en.pdf
api.nvim_create_autocmd("FileType", {
   group = "filetype",
   pattern = { "sh", "lua" },
   command = "setl shiftwidth=2 softtabstop=2 expandtab",
})

-- Indentation for C and Header files
api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
   group = "filetype",
   pattern = { "*.c", "*.h" },
   command = "setl shiftwidth=3 softtabstop=3 expandtab",
})

api.nvim_create_autocmd({ "VimEnter" },
{
  callback = function()
    require("nvim-tree.api").tree.open()
  end,
})
