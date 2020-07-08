

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


Erro ao rodar:
```sudo `which nixos-generate-config` --root /```

```
perl: warning: Setting locale failed.
perl: warning: Please check that your locale settings:
        LANGUAGE = "en_US:en",
        LC_ALL = "en_US.UTF-8",
        LANG = "en_US.UTF-8"
    are supported and installed on your system.
perl: warning: Falling back to the standard locale ("C").
writing /etc/nixos/hardware-configuration.nix...
warning: not overwriting existing /etc/nixos/configuration.nix
```

[https://github.com/NixOS/nixpkgs/issues/8398](https://github.com/NixOS/nixpkgs/issues/8398)

Teste que talvez seja util:
echo -e "$LANGUAGE \n$LANG \n$LC_ALL"


Tentei `export LC_ALL=en_US.UTF-8`, pois estava vazia.

`nix-env --install --attr nixpkgs.glibcLocales`

Acho q o Nix é capaz disso:
https://stackoverflow.com/questions/10376206/what-is-the-preferred-bash-shebang#comment85369403_10383546

Salvar para depois
https://stackoverflow.com/questions/10376206/what-is-the-preferred-bash-shebang#comment72209991_10383546


nix-env --help 2>&1 | grep "| \-e"
https://superuser.com/a/243614

nix-env --uninstall


LOCALE_ARCHIVE_2_27=$(nix-build --no-out-link "<nixpkgs>" -A glibcLocales)
  
LOCALE_ARCHIVE_2_11=$(which locale)


https://superuser.com/a/243614
https://github.com/NixOS/nixpkgs/issues/38991
https://gist.github.com/peti/2c818d6cb49b0b0f2fd7c300f8386bc3
https://github.com/NixOS/nix/issues/599
https://unix.stackexchange.com/questions/187402/nix-package-manager-perl-warning-setting-locale-failed
