require('nvim-tree').setup({
   disable_netrw = true,         -- Disabling the default file browser
   open_on_setup = true,         -- Opening nvim-tree if current buf is empty
   hijack_cursor = true,         -- Keep cursor on first letter
   renderer = {
      highlight_opened_files = "name",
      icons = {
         -- Do not show icons for files and git events
         show = {
            file = false,
            git = false
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
               empty = "<>",
               empty_open = "<>",
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