# OmakGnome

A GNOME theme automation tool. Switch your entire desktop theme directly from the **GNOME Quick Settings** panel — no terminal needed.

This project is a fork of [Omakub](https://github.com/basecamp/omakub) by Basecamp, stripped down to focus exclusively on theme management via GNOME Quick Settings.

## Requirements

- GNOME desktop environment (42+)
- `git`
- `curl`

## Installation

```bash
curl -fsSL https://raw.githubusercontent.com/burno-lima/omakgnome/master/boot.sh | bash
```

After installation, log out and back in for the extension to load.

## Usage

Click the **Theme** button in the GNOME Quick Settings panel (top-right corner of the screen) and pick a theme from the dropdown menu. The theme is applied instantly across: GNOME desktop (wallpaper, GTK, accent color), Alacritty, Zellij, btop, Neovim, and VS Code.

## Available Themes

| Theme | Color | Style |
|-------|-------|-------|
| Tokyo Night | Purple | Dark, vibrant |
| Catppuccin | Mauve | Warm pastel |
| Nord | Blue | Arctic cool |
| Everforest | Green | Soft nature |
| Gruvbox | Orange | Retro warm |
| Kanagawa | Blue | Japanese wave |
| Ristretto | Brown | Coffee tones |
| Rose Pine | Pink | Elegant muted |
| Matte Black | Dark | Minimal dark |
| Solarized Osaka | Viridian | Solarized dark |

## Updating

```bash
cd ~/.local/share/omakgnome && git pull && bash install.sh
```

## License

This project is released under the [MIT License](https://opensource.org/licenses/MIT), same as the original [Omakub](https://github.com/basecamp/omakub) project by Basecamp.
