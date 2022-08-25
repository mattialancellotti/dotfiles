local opts = vim.opt

opts.list = true
opts.listchars:append("space:⋅")
opts.listchars:append("eol:↴")

require('indent_blankline').setup({
   space_char_blankline = " ",
   show_current_context = true,
   show_current_context_start = true,
   indent_blankline_use_treesitter = true,
})
