#!/bin/bash
set -e

DOTFILES="$HOME/.dotfiles"

install_homebrew() {
  echo "==> Dotfiles: $DOTFILES"

  if ! command -v brew &>/dev/null; then
    echo "==> Instal·lant Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  echo "==> brew bundle..."
  brew bundle --file "$DOTFILES/brew/Brewfile" --no-upgrade
}

install_dotfiles() {
  echo "==> Dotfiles: $DOTFILES"

  # ── Oh My Zsh ───────────────────────────────────────────────────────────────
  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "==> Instal·lant Oh My Zsh..."
    RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi

  # ── Symlinks ─────────────────────────────────────────────────────────────────
  echo "==> Creant symlinks..."

  mkdir -p "$HOME/.zsh"
  ln -sf "$DOTFILES/zsh/zshrc"        "$HOME/.zshrc"
  ln -sf "$DOTFILES/zsh/git.zsh"      "$HOME/.zsh/git.zsh"
  ln -sf "$DOTFILES/zsh/general.zsh"  "$HOME/.zsh/general.zsh"

  ln -sf "$DOTFILES/git/gitconfig"    "$HOME/.gitconfig"
  ln -sf "$DOTFILES/git/gitignore"    "$HOME/.gitignore"

  [ -f "$DOTFILES/git/gitconfig.work" ]     && ln -sf "$DOTFILES/git/gitconfig.work"     "$HOME/.gitconfig.work"
  [ -f "$DOTFILES/git/gitconfig.personal" ] && ln -sf "$DOTFILES/git/gitconfig.personal" "$HOME/.gitconfig.personal"

  mkdir -p "$HOME/.config/ghostty"
  ln -sf "$DOTFILES/ghostty/config" "$HOME/.config/ghostty/config"

  echo "==> Fet!"
}

case "${1:-all}" in
  homebrew)  install_homebrew ;;
  dotfiles)  install_dotfiles ;;
  all)       install_homebrew && install_dotfiles ;;
  *)
    echo "Ús: $0 [all|homebrew|dotfiles]"
    exit 1
    ;;
esac
