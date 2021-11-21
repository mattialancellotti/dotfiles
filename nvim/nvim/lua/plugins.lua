-- plugins.lua

return require('packer').startup({function()
   -- Packer to manage itself
   use { 'wbthomason/packer.nvim' }

   -- My hundreds of colorschemes
   use { 'sjl/badwolf' }
   use { 'savq/melange' }
   use { 'doums/darcula' }
   use { 'brettbar/siena.vim' }
   use { 'cocopon/iceberg.vim' }
   use { 'kadekillary/Turtles' }
   use { 'arcticicestudio/nord-vim' }
   use { 'haystackandroid/cosmic_latte' }

   -- Session manager
   use {
      'mattialancellotti/simple-session-manager',
      branch = 'popups'
   }

   -- Galaxy theme for status line
   use { 'itchyny/lightline.vim' }
   
   -- Telescope:
   --   A plugin for fuzzy finding stuff (especially files). It's written in
   --   lua and requires 2 libraries from the nvim-lua git repository:
   --      - popup for drawing windows;
   --      - plenary for useful functions.
   use {
      'nvim-telescope/telescope.nvim',
      requires = {{ 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' }}
   }

   -- Fugitive
   --    The best vim plugin for using git from the editor. Compatible with
   --    Neovim too. Apparently it's called Fugitive because it's so good that
   --    it's illegal.
   use { 'tpope/vim-fugitive' }

   -- Tresitter
   --    Neovim plugin that improves highlighting, indentation and some other
   --    thing. As far as I know it will be integrated in neovim in a future
   --    version. Unfortunately as for 2021-11-06 it does not support some
   --    languages like racket or haskell.
   --
   --    BUG: Unable to install custom (not mine) parser for racket. (See setup
   --         function)
   use {
      'nvim-treesitter/nvim-treesitter',
      run = "TSUpdate",
      setup = function()
         local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
         parser_config.make = {
            install_info = {
               url = "~/code/tree-sitter-make",
               files = {"src/parser.c"}
            },
            filetype = "make",
            used_by = {"make"}
         }
      end,
      config = require('nvim-treesitter.configs').setup({
         --Ensuring some languages are installed
         ensure_installed = {
            "c", "cpp", "java", "dockerfile", "lua", "go",
            "latex", "python", "vim", "bash", "comment", "make"
         },
         -- Configuring highlighting for all modules
         highlight = {
            enable = true,
            additional_vim_regex_highlighting = false
         },
         -- Disabling indentation
         indent = { enable = false }
      })
   }

   -- Popup library
   use {
      'nvim-lua/popup.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      module = 'popup.nvim'
   }

   -- Vim-Racket
   --    This plugin sets some usefull options automatically when a racket file
   --    get loaded. Because of this you must not lazy-load this on filetype
   --    'racket', since it won't be installed anyways and also it won't be
   --    recognized without this plugin.
   use { 'wlangstroth/vim-racket' }
end,
config = {
   display = {
      open_fn = function()
         return require('packer.util').float({border = 'single'})
      end
   }
}})
