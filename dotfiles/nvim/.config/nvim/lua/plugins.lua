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
   use { 'sjl/badwolf' }
   use { 'savq/melange' }
   use { 'doums/darcula' }
   use { 'sainnhe/everforest' }
   use { 'brettbar/siena.vim' }
   use { 'cocopon/iceberg.vim' }
   use { 'kadekillary/Turtles' }
   use { 'arcticicestudio/nord-vim' }
   use { 'haystackandroid/cosmic_latte' }

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

   -- Nvim-Tree
   --    File explorer for neovim written entirely in lua.
   --    This is going to replace netrw
   --
   use {
      'kyazdani42/nvim-tree.lua',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function()
         require('nvim-tree').setup({
            disable_netrw = true,
            hijack_netrw  = true
         })
      end
   }

   -- Tresitter
   --    Neovim plugin that improves highlighting, indentation and some other
   --    thing. As far as I know it will be integrated in neovim in a future
   --    version.
   use {
      'nvim-treesitter/nvim-treesitter',
      run = "TSUpdate",
      config = function()
         return require('nvim-treesitter.configs').setup({
            --Ensuring some languages are installed
            ensure_installed = {
               "c", "cpp", "dockerfile", "lua", "go", "yaml", "json", "html",
               "latex", "python", "vim", "bash", "comment", "make", "commonlisp"
            },
            -- Configuring highlighting for all modules
            highlight = {
               enable = true,
               additional_vim_regex_highlighting = false
            },
            -- Disabling indentation
            indent = { enable = false }
         })
      end
   }
end,
config = {
   display = {
      open_fn = function()
         return require('packer.util').float({border = 'single'})
      end
   }
}})