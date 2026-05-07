# Dotfiles de Gerard

Fitxers de configuració per a macOS amb [Zsh](https://www.zsh.org), [Oh My Zsh](https://ohmyz.sh), [Git](https://git-scm.com) i [Ghostty](https://ghostty.org).

## Instal·lació

```sh
git clone https://github.com/gerardag/dotfiles ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

L'script admet tres modes:

| Comanda | Què fa |
|---|---|
| `./install.sh` o `./install.sh all` | Tot: Homebrew + dotfiles |
| `./install.sh homebrew` | Només Homebrew i el Brewfile |
| `./install.sh dotfiles` | Només Oh My Zsh i els symlinks |

L'script crea enllaços simbòlics des del directori d'inici cap als fitxers del repositori. Obre un terminal nou per veure els canvis.

## Estructura

```
dotfiles/
├── brew/
│   └── Brewfile               # Paquets Homebrew
├── git/
│   ├── gitconfig              # Configuració global de Git
│   ├── gitconfig.work.secret  # Configuració de feina (xifrat amb git-secret)
│   ├── gitconfig.personal.secret # Configuració personal (xifrat amb git-secret)
│   └── gitignore              # Fitxers ignorats globalment
├── ghostty/
│   └── config                 # Configuració del terminal Ghostty
├── zsh/
│   ├── zshrc                  # Configuració principal de Zsh
│   ├── git.zsh                # Àlies de Git
│   └── general.zsh            # Àlies generals
└── install.sh                 # Script d'instal·lació
```

## Dades personals

Les configuracions de Git amb dades personals (`gitconfig.personal`, `gitconfig.work`) estan xifrades amb [git-secret](https://git-secret.io). Per desxifrar-les cal tenir la clau GPG autoritzada:

```sh
git secret reveal
```

## Desinstal·lació

```sh
unlink ~/.zshrc
unlink ~/.gitconfig
unlink ~/.gitignore
unlink ~/.config/ghostty/config
rm -rf ~/.dotfiles
```
