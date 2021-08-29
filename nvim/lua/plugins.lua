-- plugins.lua

vim.cmd('packadd packer.nvim')

return require('packer').startup({function()
    -- Packer to manage itself
    use 'wbthomason/packer.nvim'

    -- My hundreds of colorschemes
    use 'cocopon/iceberg.vim'
    use 'kadekillary/Turtles'
    use 'nightsense/cosmic_latte'
    use 'doums/darcula'
    use 'Mofiqul/dracula.nvim'
    use 'glepnir/zephyr-nvim'
    use 'whatyouhide/vim-gotham'

    -- Telescope and its requirments
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{ 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' }}
    }

    -- Popup library
    use 'nvim-lua/popup.nvim'
end,
config = {
   display = {
      open_fn = function()
         return require('packer.util').float({ border = 'single' })
      end
   }
}})
