# pacman-gitdb.sh
Script to keep track of your pacman packages through git

Run this program and boom there it is. The git folder will be created by default in `/usr/local/share/pacman_pkgs` but you can change that by editing the `GIT_PATH` variable.

You'll probably want to run it as sudo (or doas??) But ig changing permission works too?

The first time you run it it'll commit every single package you have so yeah.

## Pacman Hook
I tried making a pacman hook but they don't allow user input ([intentionally!](https://bbs.archlinux.org/viewtopic.php?id=255944))

I'll put it here anyways in case someone feels like doing something with it.
