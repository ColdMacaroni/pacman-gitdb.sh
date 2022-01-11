#!/bin/sh
# Root doesnt have xdg stuff :sob: Creates it on /
# GIT_PATH="$(echo $XDG_DATA_DIRS | cut -d: -f 1)/pacman_pkgs"
GIT_PATH="/usr/local/share/pacman_pkgs"

ARCH_PKGS_FILE=arch
AUR_PKGS_FILE=aur

if ! [ -r "$GIT_PATH" -a -w "$GIT_PATH" ]
then
    >&2 echo "No read or write permissions on '$GIT_PATH' for user '$USER'"
    exit 1
fi

# Make sure it exists
mkdir -p $GIT_PATH
cd $GIT_PATH

if git -C . rev-parse  2>/dev/null
then
    # This is a git repo, no need to do much
    true;
else
    # Not a git repo, bad!
    echo Not a git repo. Creating one now...

    git init

    # In case there are pre-existing files
    git add "$ARCH_PKGS_FILE"
    git add "$AUR_PKGS_FILE"
    git commit -m "Pre-existing files."
fi

# Add current packages
pacman -Qenq > "$ARCH_PKGS_FILE"
pacman -Qemq > "$AUR_PKGS_FILE"

# Track the new packages
git add "$ARCH_PKGS_FILE"
git add "$AUR_PKGS_FILE"

# Let the user explain themselves
git commit -v -e
