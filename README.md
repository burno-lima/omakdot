# OmakDot

One command to set up your entire Linux development environment — terminal tools, desktop apps, fonts, and a theme system that switches everything at once.

> Supports **Ubuntu** and **Fedora** with GNOME 42+.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/burno-lima/omakdot/master/boot.sh | bash
```

After installation, log out and back in for the GNOME extension to load.

## Themes

Switch your entire desktop theme from the **Theme** button in the GNOME Quick Settings panel (top-right corner). One click syncs: GNOME desktop, Alacritty, Zellij, btop, Neovim, VS Code, Fish, and Chrome.

| Theme | Accent | Style |
|-------|--------|-------|
| Tokyo Night | Purple | Dark, vibrant |
| Catppuccin | Mauve | Warm pastel |
| Nord | Blue | Arctic cool |
| Everforest | Green | Soft nature |
| Gruvbox | Orange | Retro warm |
| Kanagawa | Blue | Japanese wave |
| Ristretto | Brown | Coffee tones |
| Rose Pine | Pink | Elegant muted |
| Matte Black | Slate | Minimal dark |
| Solarized Osaka | Teal | Solarized dark |

| Catppuccin | Everforest | Ristretto |
|------------|------------|-----------|
| ![Catppuccin](images/catppuccin.png) | ![Everforest](images/everforest.png) | ![Ristretto](images/ristretto.png) |

## Updating

```bash
# Full update (tools + themes)
cd ~/.local/share/omakdot && git pull && bash install.sh

# Themes only (faster)
cd ~/.local/share/omakdot && git pull && bash install.sh --themes-only
```

## Requirements

- GNOME 42+
- `git`
- `curl`

## License

[MIT License](https://opensource.org/licenses/MIT) — based on [Omakub](https://github.com/basecamp/omakub) by Basecamp.
