local lspconfig = require('lspconfig')

lspconfig.gopls.setup({
  cmd = {'gopls'},
})
