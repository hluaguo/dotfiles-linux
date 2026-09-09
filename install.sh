#!/usr/bin/env bash
# Symlink dotfiles from this repo into $HOME.
# Idempotent: re-running is safe. Existing files are backed up, never deleted.
set -euo pipefail

DOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

LINKS=(
  ".config/niri"
  ".config/alacritty"
  ".config/nvim"
  ".config/gtk-3.0"
  ".config/gtk-4.0"
  ".local/state/noctalia/settings.toml"
  ".zshrc"
  ".tmux.conf"
  ".gitconfig"
)

echo "Dotfiles: $DOTDIR"

for link in "${LINKS[@]}"; do
  src="$DOTDIR/$link"
  dst="$HOME/$link"

  if [[ ! -e $src ]]; then
    echo "  ! missing in repo, skipping: $link"
    continue
  fi

  mkdir -p "$(dirname "$dst")"

  # Already linked correctly? Nothing to do.
  if [[ -L $dst && $(readlink "$dst") == "$src" ]]; then
    echo "  = ok: $link"
    continue
  fi

  # Back up whatever is currently there (unless it's a symlink we own).
  if [[ -e $dst || -L $dst ]]; then
    mkdir -p "$BACKUP/$(dirname "$link")"
    mv "$dst" "$BACKUP/$link"
    echo "  ~ backed up: $link"
  fi

  ln -s "$src" "$dst"
  echo "  + linked: $link"
done

echo
echo "Done. Backups (if any): $BACKUP"
echo "Dependencies to install manually: niri, noctalia, alacritty, nvim (AstroNvim), oh-my-zsh, tmux, quickshell"
