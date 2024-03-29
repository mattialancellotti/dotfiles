-- plugins.lua

-- This checks whether the given path (packer's installation path) is empty or
-- not. If there is nothing in there than the script proceeds with the
-- installation.
local exe = vim.fn
local cmd = vim.cmd
local install_path = exe.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if exe.empty(exe.glob(install_path)) > 0 then
   packer_bootstrap = exe.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
   print('Installing packer')
   cmd [[packadd packer.nvim]]
end

-- Using protected call to not fail on first call
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
   return
end

-- Initiating packer using a custom popup window with rounded borders
packer.init({
   display = {
      open_fn = function()
         return require('packer.util').float({border = 'rounded'})
      end
   }
})

return packer.startup(function(use)
   -- Packer to manage itself
   use { 'wbthomason/packer.nvim' }

   -- My hundreds of colorschemes
   use { 'catppuccin/nvim' }
   use { 'ellisonleao/gruvbox.nvim' }
   use { 'savq/melange' }
   use { 'rebelot/kanagawa.nvim' }

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

   -- Nvim-lsp:
   --    Configurations for Nvim LSP
   use { 'neovim/nvim-lspconfig' }

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
   use {
     'nvim-treesitter/nvim-treesitter',
     run = function()
       local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
       ts_update()
     end,
   }

   use { 'lukas-reineke/indent-blankline.nvim' }

   if packer_bootstrap then
      require('packer').sync()
   end
end)
