-- plugins.lua

--vim.cmd('packadd packer.nvim')

return require('packer').startup({function()
   -- Packer to manage itself
   use 'wbthomason/packer.nvim'

   -- My hundreds of colorschemes
   use 'cocopon/iceberg.vim'
   use 'kadekillary/Turtles'
   use 'haystackandroid/cosmic_latte'
   use 'doums/darcula'
   use 'arcticicestudio/nord-vim'
   use 'sjl/badwolf'

   -- Session manager
   use 'mattialancellotti/simple-session-manager'

   -- Galaxy theme for status line
   use 'itchyny/lightline.vim'
   
   -- Telescope:
   --   A plugin for fuzzy finding stuff (especially files). It's written in
   --   lua and requires 2 libraries from the nvim-lua git repository:
   --      - popup for drawing windows;
   --      - plenary for useful functions.
   use {
      'nvim-telescope/telescope.nvim',
      requires = {{ 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' }},
   }

   -- Popup library
   use {
      'nvim-lua/popup.nvim',
      requires = { 'nvim-lua/plenary.nvim' }
   }

   -- Specific plugin for racket
   use 'wlangstroth/vim-racket'
end,
config = {
   display = {
      open_fn = function()
         return require('packer.util').float({ border = 'single' })
      end
   }
}})
