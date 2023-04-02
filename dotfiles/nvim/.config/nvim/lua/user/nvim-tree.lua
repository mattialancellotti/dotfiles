require('nvim-tree').setup({
   disable_netrw = true,         -- Disabling the default file browser
   hijack_cursor = true,         -- Keep cursor on first letter
   view = {
      mappings = {
         custom_only = false,
         -- Custom mappings
         list = {
            { key = 'l', action = "edit" },
            { key = 'h', aciton = "close_node" }
         }
      }
   },
   renderer = {
      highlight_opened_files = "name",
      icons = {
         -- Do not show icons for files and git events
         show = {
            file = false,
            git = true
         },

         -- Since I can't figure out how to install and configure a font on
         -- Gentoo, I'll be configuring custom ASCII characters that'll work
         -- anyway.
         glyphs = {
            folder = {
               arrow_closed = "+",
               open = "<",
               arrow_open = "-",
               default = ">",
               empty = "E",
               empty_open = "E",
               symlink = "->",
               symlink_open = "->"
            },
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


vim.notify('nvim-tree configuration loaded.')
