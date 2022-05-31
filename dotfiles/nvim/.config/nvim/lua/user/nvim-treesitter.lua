require('nvim-treesitter.configs').setup({
   -- Ensuring some languages are installed
   ensure_installed = {
      "c", "cpp", "dockerfile", "lua", "go", "gomod", "yaml", "json",
      "html", "latex", "python", "vim", "comment", "make"
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
