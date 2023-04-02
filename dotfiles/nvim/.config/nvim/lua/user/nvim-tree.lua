require('nvim-tree').setup({
   disable_netrw = true,         -- Disabling the default file browser
   hijack_cursor = true,         -- Keep cursor on first letter
   view = {
      mappings = {
         custom_only = false,
         -- Custom mappings
         list = {
            { key = 'l', action = "edit" },
            { key = 'h', action = "close_node" }
         }
      }
   },
   renderer = {
      highlight_opened_files = "name",
      icons = {
         show = {
            file = true,
            git = true
         },
         webdev_colors = false
      },

      -- List of special files to highlight
      special_files = {
         "Makefile", "README.md", ".gitignore", "go.mod", "Dockerfile",
         "composer.json", "LICENSE.md"
      }
   }
})
