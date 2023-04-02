require('nvim-treesitter.configs').setup({
   -- Ensuring some languages are installed
   ensure_installed = {
      "awk", "c", "cpp", "dockerfile", "lua", "go", "scheme",
      "yaml", "json", "gitcommit", "gitattributes", "markdown_inline",
      "html", "latex", "python", "vim", "comment", "make", "c_sharp",
      "markdown", "bash", "toml", "todotxt", "rust"
   },
   -- Configuring highlighting for all modules
   highlight = {
      enable = true,
      additional_vim_regex_highlighting = false
   },
   -- Disabling indentation
   indent = { enable = false }
})

vim.notify('Treesitter configuration loaded.')
