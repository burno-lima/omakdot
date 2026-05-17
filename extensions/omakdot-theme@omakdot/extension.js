import GObject from 'gi://GObject';
import GLib from 'gi://GLib';
import * as Main from 'resource:///org/gnome/shell/ui/main.js';
import * as QuickSettings from 'resource:///org/gnome/shell/ui/quickSettings.js';
import {Extension} from 'resource:///org/gnome/shell/extensions/extension.js';

const THEMES = [
    {name: 'Tokyo Night', id: 'tokyo-night'},
    {name: 'Catppuccin', id: 'catppuccin'},
    {name: 'Nord', id: 'nord'},
    {name: 'Everforest', id: 'everforest'},
    {name: 'Gruvbox', id: 'gruvbox'},
    {name: 'Kanagawa', id: 'kanagawa'},
    {name: 'Ristretto', id: 'ristretto'},
    {name: 'Rose Pine', id: 'rose-pine'},
    {name: 'Matte Black', id: 'matte-black'},
    {name: 'Solarized Osaka', id: 'solarized-osaka'},
];

const ThemeMenuToggle = GObject.registerClass(
class ThemeMenuToggle extends QuickSettings.QuickMenuToggle {
    _init() {
        super._init({
            title: 'Theme',
            iconName: 'applications-graphics-symbolic',
            toggleMode: false,
        });

        this.menu.setHeader('applications-graphics-symbolic', 'OmakDot Themes');

        for (const theme of THEMES) {
            this.menu.addAction(theme.name, () => {
                this._applyTheme(theme.id, theme.name);
            });
        }

        this._loadCurrentTheme();
    }

    _loadCurrentTheme() {
        const path = GLib.build_filenamev([
            GLib.get_home_dir(), '.config', 'omakdot', 'current-theme',
        ]);
        try {
            const [ok, contents] = GLib.file_get_contents(path);
            if (ok) {
                const themeId = new TextDecoder().decode(contents).trim();
                const theme = THEMES.find(t => t.id === themeId);
                if (theme) {
                    this.subtitle = theme.name;
                }
            }
        } catch (_e) {
            // No saved theme yet
        }
    }

    _applyTheme(themeId, themeName) {
        this.subtitle = themeName;

        const scriptPath = GLib.build_filenamev([
            GLib.get_home_dir(), '.local', 'share', 'omakdot', 'bin', 'apply-theme.sh',
        ]);

        try {
            GLib.spawn_command_line_async(`/bin/bash ${scriptPath} ${themeId}`);
        } catch (e) {
            logError(e, 'OmakDot: Failed to apply theme');
        }
    }
});

const ThemeIndicator = GObject.registerClass(
class ThemeIndicator extends QuickSettings.SystemIndicator {
    _init() {
        super._init();
        this._toggle = new ThemeMenuToggle();
        this.quickSettingsItems.push(this._toggle);
    }
});

export default class OmakDotThemeExtension extends Extension {
    enable() {
        this._indicator = new ThemeIndicator();
        Main.panel.statusArea.quickSettings.addExternalIndicator(this._indicator);
    }

    disable() {
        this._indicator.quickSettingsItems.forEach(item => item.destroy());
        this._indicator.destroy();
        this._indicator = null;
    }
}
