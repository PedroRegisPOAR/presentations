#!/usr/bin/env bash

curl -L https://nixos.org/nix/install | sh


nix-channel --list

nix-channel --add https://nixos.org/channels/nixos-20.03 nixpkgs

nix-channel --update

nix-env --install --from-expression \
"_: with import <nixpkgs/nixos> { configuration = {}; }; with config.system.build; [ nixos-generate-config nixos-install nixos-enter manual.manpages ]"
# short form
# nix-env -iE

# nix-env --install --attr nixpkgs.glibcLocales

# https://unix.stackexchange.com/a/187727
export LC_ALL=C

nix-env --install --attr nixpkgs.glibcLocales


export LOCALE_ARCHIVE="$(nix-env --installed --no-name --out-path --query glibc-locales)/lib/locale/locale-archive"


sudo `which nixos-generate-config` --root /


sudo chown -R 0.0 /nix


sudo touch /etc/NIXOS

sudo touch /etc/NIXOS_LUSTRATE

echo etc/nixos | sudo tee -a /etc/NIXOS_LUSTRATE

sudo mv -v /boot /boot.bak &&
sudo /nix/var/nix/profiles/system/bin/switch-to-configuration boot
