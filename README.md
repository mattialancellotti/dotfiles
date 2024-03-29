MY DOTFILES
-----------

### Introduction
Not all of my dotfiles are available yet, some of them are a work in
progress.  
All of them are free to use you can do whatever you want with them I don't care,
I'll only be happy to see someone using them.  
In case you want to understand how the whole automating dotfiles deployment thingy
works, the Makefile is basically just comments and explainations I'd suggest you
read it.

### Programs
Category | Programs
--- | ----
Core System  | [FontConfig](https://www.freedesktop.org/wiki/Software/fontconfig/), [PipeWire](https://pipewire.org)
Terminals | [Alacritty](https://alacritty.org), [Foot](https://codeberg.org/dnkl/foot)
Waland Desktop | [Hikari](https://hikari.acmelabs.space), [Sway](https://swaywm.org), [Yambar](https://codeberg.org/dnkl/yambar), [Wofi](https://hg.sr.ht/~scoopta/wofi), [Waybar](https://github.com/Alexays/Waybar)
Terminal Multiplexers | [Tmux](https://github.com/tmux/tmux), [GNU Screen](https://www.gnu.org/software/screen/manual/screen.html)
Editors | [Neovim](https://neovim.io)
Useful Programs | [Neofetch](https://github.com/dylanaraps/neofetch), [MPV](https://mpv.io)

### Configuration
To automatically manage my dotfiles in a safe way I wrote a makefile that uses
[GNU Stow](https://www.gnu.org/software/stow/manual/stow.html) to keep them all
grouped together in one place. To use it you must have GNU Stow installed.  
The following commands are the basics instructions you need to use the Makefile:
+ To configure these dotfiles on your system run `make install`;
+ To unstow all the configured dotfiles just run `make uninstall`.

There is also a selective installation using the 'programs' variables. Below there are
some examples you can try to better understand this functionality:
+ To install alacritty and tmux (install is the default recipy) `make programs="alacritty tmux"`;
+ This will unstow neovim's configuration `make uninstall programs="nvim"`.

If you want to distribute your dotfiles once you've modified them, you can run `make dist`.
