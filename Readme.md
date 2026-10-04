# Lukas "DerGeneralFluff" Lichten's dot files
Used by my Thinkpad and my Gaming PC. Contains configurations for Hyprland

## Features/Oddities
- En and De keyboard bindings
  - This extends to nvim bindings (although these are only generated if `NVIM_ISO_GERMAN` env is set)
  - Layout switch in Hyprland is `<Alt><Shift>`
- nvim is largely kickstart-nvim
  - Uses lazy
  - `telescope-ui-selector` so we have a proper selector (for example for mason filter selection)
  - `oil` as a file explorer (accessible through `<leader>-`)
  - `hex` as a hexeditor (toggle hex view through `<leader>b`)
  - LSPs `rust_analyzer`, `gopls`, `pyright`, `texlab`, `clangd`, `yamlls`, `cssls`, `marksman` and `lua_ls` are being installed
- htop config with small appearence tweaks
- My gitconfig that sets the default branch to master (you can't kinkshame me out of it)
- The hyprland quirks:
  - config manual sets the `XDG` directory variables, and for this uses a variable in the config `$home = /home/Lukas` (so would require changing for you likely)
  - requires a device-specific.conf (see below)
  - Uses `follow_mouse = 2` (cursor does not change focused window, only clicking in the window, more familar imo), default is 1 (always focus the window under the cursor)
  - Will show wlogout prompt on pressing the power button (but requires disabling systemd's handling)
  - Media/Brightness buttons are mapped
  - Highlight color is purple, no window rounding
- `.bashrc` only extends the `PATH` to include `~/go/bin` for using go tools during development
- `go-hass-agent` (a tool for Home Assistant) launched without tray icon

## Hyprland Install
This is should be a mostly complete list of all software used:
```
hyprland
xdg-desktop-portal-hyprland
xdg-desktop-portal-gtk
hyprshutdown

otf-font-awesome
noto-fonts

hypridle
hyprlock
hyprpaper
polkit-kde-agent
hyprnotify
network-manager-applet
blueman
waybar
kdeconnect
go-hass-agent-bin

pamixer
pavucontrol

kitty
thunar
wofi
wlogout
hyprshot
speedcrunch
```

From flatpak these apps are autolaunched:
```
com.discordapp.Discord
org.telegram.desktop
```

Additionally the config will read a config file in `~/.config/hypr/device-specific.conf`,
used for configuring monitors and device specific env.  
Thanks to Hyprland Lua you can run the config without creating the file, but it is highly adviced to do so.
  
The hyprland config includes a hardcoded `$home` variable that you will likely need to change.

## Hyprland shotcuts
Window Management:
- `<Super>[1-0]`: Switch to Workspace 1-10
- `<Super><Shift>[1-0]`: Move focused window to workspace 1-10 (and swap there too)
- `<Super>S`: Open/Close Magic workspace
- `<Super><Shift>S`: Shift focused Window to Magic workspace
- `<Super><Alt/AltGr>[1-0]`: Moves workspace 1-10 to your focused montior, and switches to that workspace
- `<Super>Left-Mouse`: Move Window
- `<Super>Right-Mouse`: Resize Window
- `<Super>[Arrowkeys]`: Move focus in that direction
- `<Super><Shift>[Arrowkeys]`: Move window in that direction
- `<Super>C`: Close focused window
- `<Super>F`: Toggle "Maximize" on focused window
- `<Super><Shift>F`: Toggle True Fullscreen on focused window
- `<Super>V`: Toggle Floating for focused window
- `<Super>J`: Switch Split Direction (Toggle Split)
- `<Super><Shift>[Page Up/Down]`: Shifts the Split Ratio
- `<Super>M`: Opens/Closes Logout Prompt

Launching:
- `<Super>Q`: Terminal (kitty)
- `<Super>E`: Filemanager (thunar)
- `<Super>R`: Launcher (wofi)
- `<Super>W`: Calculator (speedcrunch)

Screenshot (hyprshot):
- `<Ctrl>Print`: current monitor
- `<Super>Print`: focused window
- `<Shift>Print`: mark region to screenshot
*All binds also avialable with `Home`, as my Laptop's print key failed, and my 75% keyboard also has no dedicated key*

Gestures:
- `<3-Finger><Horizontal>` Changes Workspace

## Deploying this dotfiles repo
I use `dotbare` to clone and update this repo

## Other Advice/etc configs
Doas user `/etc/doas.conf`:
```
permit persist :wheel
```

## Licensing
There are some images in `~/.config/hypr/lockscreen/` (consult the `credits.txt`) there, which are unlicensed.  
  
All configuration should be treated as licensed under `MIT`
