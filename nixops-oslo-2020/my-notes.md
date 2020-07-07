

https://nixos.org/download.html


https://nixos.org/nixos/manual/index.html#sec-installation


`curl -L https://nixos.org/nix/install | sh`


`nix-env --install --attr nixpkgs.nixops`


`nixops --version`




`git clone https://github.com/PedroRegisPOAR/presentations.git`


`cd presentations/nixops-oslo-2020/demos`


`nixops create --deployment demo webserver.nix`


`nixops info --deployment demo`


`nixops deploy --deployment demo`


`nix-env --install --attr nixpkgs.virtualbox`


https://nixos.wiki/wiki/Virtualbox


Tentei seguir o caminho:

https://logs.nix.samueldr.com/nixos/2019-11-25#2817230;

https://nixos.org/nixos/manual/index.html#sec-installing-from-other-distro

Deveria ter um link, ou alguma forma de automagicamente se determinar a ultima versão estável!

`nix-channel --add https://nixos.org/channels/nixos-20.03 nixpkgs`

`nix-channel --update`

`nix-env -iE "_: with import <nixpkgs/nixos> { configuration = {}; }; with config.system.build; [ nixos-generate-config nixos-install nixos-enter manual.manpages ]"`


Muitas infos importantes:
https://github.com/NixOS/nixops/issues/1324