MY DOTFILES
-----------

### Introduction
Not all of my dotfiles are available yet, I'm working on it. Most of these
programs are not used, like screen, and so they won't be updated.

All of them are free to use you can to whatever you want with them I don't care,
I'll only be happy to see someone using them.

### Programs
+ [Alacritty](https://alacritty.org)
+ [Foot](https://codeberg.org/dnkl/foot)
+ [Hikari](https://hikari.acmelabs.space)
+ [MPV](https://mpv.io)
+ [Neofetch](https://github.com/dylanaraps/neofetch)
+ [Neovim](https://neovim.io)
+ [PipeWire](https://pipewire.org)
+ [GNU Screen](https://www.gnu.org/software/screen/manual/screen.html)
+ [Sway](https://swaywm.org)
+ [Tmux](https://github.com/tmux/tmux)
+ [Waybar](https://github.com/Alexays/Waybar)

### Configuration
To automatically manage my dotfiles in a safe way I wrote a makefile that uses
[GNU Stow](https://www.gnu.org/software/stow/manual/stow.html) to keep them all
grouped together in one place. To use it you must have GNU Stow installed.

To configure these dotfiles on your system run `make install`. By doing this the
makefile will link the content of all the directories in the repo, whose name
does not match home/, to $HOME/.config. The remaining paths will be stowed to $HOME.

To unstow all the configured dotfiles just run `make uninstall`.

You can also distribute them by creating a distribution archive using `make dist`.
