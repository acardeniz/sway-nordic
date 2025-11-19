# Sway Nordic Configuration

Sway/Wayland configuration with Nordic/Nord color scheme.

## Features

- **Sway** - Wayland compositor with opacity and blur support
- **Waybar** - Customized status bar with Nordic theme
- **Rofi** - Application launcher
- **Kitty** - Terminal emulator with transparency
- **Nordic Color Palette** - Consistent theming across all components
- **Lockscreen** - Custom lock screen with blur effects
- **Power Profile** - Power profile indicator and switcher
- **Spotify Integration** - Music controls in Waybar
- **Dual Monitor Support** - Dual screen support (eDP-1 + HDMI-A-1)

## Requirements

### Core Components
```bash
# For Fedora
sudo dnf install sway waybar rofi kitty swaylock-effects swayidle
sudo dnf install brightnessctl playerctl pavucontrol
sudo dnf install grim slurp wl-clipboard
sudo dnf install thunar firefox
```

### Fonts
```bash
# JetBrains Mono Nerd Font
sudo dnf install jetbrains-mono-fonts
# or manual installation:
# https://www.nerdfonts.com/font-downloads
```

### Optional Packages
```bash
# System monitoring
sudo dnf install htop

# Notifications (choose one)
sudo dnf install dunst
# or
sudo dnf install mako

# Power management
sudo dnf install power-profiles-daemon

# Spotify (via Flathub)
flatpak install flathub com.spotify.Client
```

### Script Dependencies
- `playerctl` - Spotify controls
- `brightnessctl` - Brightness control
- `power-profiles-daemon` - Power profile management
- `jq` - JSON processing
- `imagemagick` - Lock screen blur effect

```bash
sudo dnf install playerctl brightnessctl power-profiles-daemon jq ImageMagick
```

## Installation

1. Clone the repository:
```bash
git clone https://github.com/acardeniz/sway-nordic.git
cd sway-nordic
```

2. Backup your existing configurations:
```bash
cp -r ~/.config/sway ~/.config/sway.backup
cp -r ~/.config/waybar ~/.config/waybar.backup
```

3. Copy configuration files:
```bash
cp -r .config/sway ~/.config/
cp -r .config/waybar ~/.config/
```

4. Make scripts executable:
```bash
chmod +x ~/.config/sway/scripts/*.sh
chmod +x ~/.config/waybar/scripts/*.sh
```

5. Create wallpaper directory and add wallpaper:
```bash
mkdir -p ~/Pictures/Wallpapers
# Add your wallpaper as ~/Pictures/Wallpapers/winter3.jpg
# or update wallpaper path in sway config
```

6. Reload Sway:
```bash
swaymsg reload
```

## Nordic Color Palette

| Color | Hex Code | Usage |
|------|----------|----------|
| Background | `#2e3440` | Background |
| Foreground | `#d8dee9` | Foreground |
| Primary | `#81a1c1` | Primary accent |
| Accent | `#88c0d0` | Accent color |
| Success | `#a3be8c` | Success messages |
| Warning | `#ebcb8b` | Warnings |
| Error | `#bf616a` | Errors |
| Inactive | `#4c566a` | Inactive elements |

## Keyboard Shortcuts

### Basic Shortcuts
| Shortcut | Description |
|---------|----------|
| `Alt + T` | Open terminal |
| `Alt + B` | Open browser (Firefox) |
| `Alt + F` | Open file manager (Thunar) |
| `Alt + D` | Rofi launcher |
| `Alt + Q` | Close focused window |
| `Alt + L` | Lock screen (with blur effect) |
| `Alt + H` | Hide/show Waybar |

### Window Management
| Shortcut | Description |
|---------|----------|
| `Alt + Arrow Keys` | Switch between windows |
| `Alt + Shift + Arrow Keys` | Move window |
| `Alt + 1-0` | Switch workspaces |
| `Alt + Shift + 1-0` | Move window to workspace |
| `Alt + V` | Toggle floating mode |
| `Alt + Shift + F` | Fullscreen |
| `Alt + R` | Resize mode |

### Layout
| Shortcut | Description |
|---------|----------|
| `Alt + S` | Stacking layout |
| `Alt + W` | Tabbed layout |
| `Alt + E` | Toggle split layout |

### System
| Shortcut | Description |
|---------|----------|
| `Alt + Shift + C` | Reload Sway config |
| `Alt + Shift + E` | Exit menu |

## Waybar Features

### Modules

**Left Side:**
- Workspace indicator
- Mode indicator
- Power profile (performance/balanced/power-saver)
- Spotify player (click: play/pause, scroll: next/prev)

**Center:**
- Clock (with seconds precision)

**Right Side:**
- Volume (click: open pavucontrol)
- Brightness (scroll to adjust)
- CPU usage
- RAM usage
- Battery status
- System tray

### Waybar Interactions
- **Spotify Widget**: Click (play/pause), Scroll up/down (next/prev track)
- **Power Profile**: Click (cycle profiles: performance → balanced → power-saver)
- **Volume**: Click (open pavucontrol)
- **Brightness**: Scroll (adjust brightness)

## File Structure

```
~/.config/
├── sway/
│   ├── config              # Main sway configuration
│   ├── config.d/           # Additional config files
│   └── scripts/
│       └── lock-blur.sh    # Lockscreen script with blur
└── waybar/
    ├── config              # Waybar configuration
    ├── style.css           # Nordic themed CSS
    └── scripts/
        ├── spotify.sh              # Spotify info
        ├── power-profile.sh        # Power profile display
        └── power-profile-switch.sh # Power profile switcher
```

## Customization

### Changing Wallpaper
In `~/.config/sway/config`:
```bash
output * bg /home/homer/Pictures/Wallpapers/winter3.jpg fill
```

### Opacity Settings
Individual opacity settings per application in sway config:
```bash
for_window [app_id="kitty"] opacity 0.90
for_window [class="firefox"] opacity 0.98
```

### Dual Monitor Layout
Monitor positions in config:
```bash
output eDP-1 pos 0 0
output HDMI-A-1 pos 1920 0
```

### Waybar Height
In `~/.config/waybar/config`:
```json
"height": 16
```

### Font Change
In `~/.config/waybar/style.css`:
```css
font-family: "Courier New", "Courier", monospace;
font-size: 12px;
```

## Troubleshooting

### Waybar not visible
```bash
killall waybar
waybar &
```

### Lockscreen blur not working
Make sure ImageMagick is installed:
```bash
sudo dnf install ImageMagick
```

### Spotify widget not working
Ensure playerctl and Spotify are installed:
```bash
sudo dnf install playerctl
flatpak install flathub com.spotify.Client
```

### Power profile not changing
Check power-profiles-daemon service:
```bash
systemctl status power-profiles-daemon
sudo systemctl start power-profiles-daemon
```

### Font not displaying correctly
Check Nerd Font installation:
```bash
fc-list | grep -i "jetbrains"
```

## Auto-started Applications

Applications started automatically in config:
- Firefox (workspace 5, hidden)
- Spotify (workspace 5)

## Notes

- This configuration has been tested on **Fedora**
- Optimized for **dual monitors** (eDP-1 + HDMI-A-1)
- All workspaces are mapped to primary display (eDP-1)
- Lockscreen blur effect creates temporary files in `/tmp`
- Waybar can be hidden/shown with `Alt + H`

## Contributing

Pull requests are welcome. For major changes, please open an issue first.

## License

[MIT](LICENSE)

## Credits

- [Nord Theme](https://www.nordtheme.com/) - Color palette
- [Sway](https://swaywm.org/) - Wayland compositor
- [Waybar](https://github.com/Alexays/Waybar) - Status bar

