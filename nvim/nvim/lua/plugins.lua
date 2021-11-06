-- plugins.lua

return require('packer').startup({function()
   -- Packer to manage itself
   use { 'wbthomason/packer.nvim' }

   -- My hundreds of colorschemes
   use { 'sjl/badwolf' }
   use { 'doums/darcula' }
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

   -- Tresitter
   --    Neovim plugin that improves highlighting. As far as I know it will be
   --    integrated in neovim in a future version.
   use {
      'nvim-treesitter/nvim-treesitter',
      --[[
      setup = function()
         local p = require('nvim-treesitter.parsers').get_parser_configs()
         p.racket = {
            install_info = {
               url = "tautologico/tree-sitter-racket",
               files = {"src/parser.c"}
            },
            filetype = "racket"
         }
      end,
]]
      run = "TSUpdate",
      config = require('nvim-treesitter.configs').setup({
         --Ensuring some languages are installed
         ensure_installed = {
            "c", "cpp", "java", "dockerfile", "lua",
            "latex", "python", "vim", "bash", "comment"
         },
         -- Configuring highlighting for all modules
         highlight = {
            enable = true,
            additional_vim_regex_highlighting = false
         },
         -- Enabling indentation
         indent = { enable = true}
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
   use 'wlangstroth/vim-racket'
end,
config = {
   display = {
      open_fn = function()
         return require('packer.util').float({ border = 'single' })
      end
   }
}})
