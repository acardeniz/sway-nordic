# Nord Dotfiles

Sway/Wayland configuration with Nord color scheme.

## Components

- **Sway** - Wayland compositor with opacity settings
- **Waybar** - Status bar
- **Rofi** - Application launcher
- **Kitty** - Terminal emulator
- **htop** - System monitor

## Installation
```bash
git clone https://github.com/YOUR_USERNAME/dotfiles.git
cd dotfiles
cp -r .config/* ~/.config/
swaymsg reload
```

## Requirements
```bash
sudo pacman -S sway waybar rofi kitty htop
yay -S ttf-jetbrains-mono-nerd
```

## Color Palette

- Background: `#2E3440`
- Foreground: `#D8DEE9`
- Primary: `#81A1C1`
- Accent: `#88C0D0`

## License

MIT
