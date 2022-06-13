-- plugins.lua

-- This checks whether the given path (packer's installation path) is empty or
-- not. If there is nothing in there than the script proceeds with the
-- installation.
local exe = vim.fn
local install_path = exe.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if exe.empty(exe.glob(install_path)) > 0 then
   packer_bootstrap = exe.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup({function()
   -- Packer to manage itself
   use { 'wbthomason/packer.nvim' }

   -- My hundreds of colorschemes
   use { 'sainnhe/edge' }
   use { 'rafamadriz/neon' }
   use { 'embark-theme/vim' }
   use { 'sainnhe/everforest' }
   use { 'cocopon/iceberg.vim' }
   use { 'arcticicestudio/nord-vim' }
   --use { 'sainnhe/gruvbox-material' }
   use { 'ellisonleao/gruvbox.nvim' }
   use { 'haystackandroid/cosmic_latte' }
   use { 'frenzyexists/aquarium-vim' }
   use { 'catppuccin/nvim' }

   -- Galaxy theme for status line
   use { 'itchyny/lightline.vim' }
   use { 'nvim-lualine/lualine.nvim' }

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

   -- Nvim-Tree
   --    File explorer for neovim written entirely in lua.
   --    This is going to replace netrw
   use { 'kyazdani42/nvim-tree.lua' }

   -- TODO: Need to configure LSP
   use { 'simrat39/symbols-outline.nvim' }

   -- Notify
   --    Notification plug-in for neovim.
   use { 'rcarriga/nvim-notify' }

   -- Tresitter
   --    Neovim plugin that improves highlighting, indentation and some other
   --    thing. As far as I know it will be integrated in neovim in a future
   --    version.
   use { 'nvim-treesitter/nvim-treesitter', run = "TSUpdate" }
end,
config = {
   display = {
      open_fn = function()
         return require('packer.util').float({border = 'single'})
      end
   }
}})
