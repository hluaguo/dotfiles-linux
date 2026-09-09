# dotfiles

Fedora + [niri](https://github.com/YaLTeR/niri) (scrollable-tiling Wayland compositor) + [Noctalia](https://github.com/noctalia-dev/noctalia-shell) shell.

Theme: Tokyo Night / Oxocarbon palette, glass panel, dank GTK colors.

## Layout

```
.config/niri/       compositor config (KDL)
.config/alacritty/  terminal + themes
.config/nvim/       AstroNvim config
.config/gtk-3.0/    GTK3 colors
.config/gtk-4.0/    GTK4 colors
.local/state/noctalia/settings.toml   Noctalia shell settings
.zshrc  .tmux.conf  .gitconfig
```

> Noctalia stores its settings under `~/.local/state/noctalia/`, not `~/.config/` —
> only `settings.toml` is tracked here; the rest of that directory is runtime state.

## Install

```bash
git clone git@github.com:hluaguo/dotfiles.git
cd dotfiles
./install.sh
```

`install.sh` symlinks everything into `$HOME`, backing up any existing files to
`~/.dotfiles-backup-<timestamp>`. Re-running it is safe.

### Fedora packages

```bash
sudo dnf install niri alacritty tmux git zsh
```

Noctalia and oh-my-zsh install separately (see their upstream READMEs). Neovim
is AstroNvim — it bootstraps itself from `lazy-lock.json` on first launch.
