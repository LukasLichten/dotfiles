# Lukas "DerGeneralFluff" Lichten's dot files
Used by my Thinkpad and my Gaming PC. Contains configurations for Hyprland
(although can be used with any DE, I use KDE still heavily on my rig).  

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
- Thunderbird Scriptable Notification script (to receive email notification without it taking over the desktop)

## Hyprland Install
This is should be a mostly complete list of all software used:
```
hyprland
xdg-desktop-portal-hyprland
xdg-desktop-portal-gtk

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
dev.vencord.Vesktop
org.telegram.desktop
```

Additionally the config is setup to expect a config file in `~/.config/hypr/device-specific.conf`,
used for configuring monitors and device specific env.  
It is important that this file at minimum exist, hyprland will otherwise throw an error.
  
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
- `<Super>C`: Close focused window
- `<Super>F`: Toggle Fullscreen window
- `<Super>V`: Toggle Floating for focused window
- `<Super>J`: Switch Split Direction (Toggle Split)
- `<Super>M`: Opens/Closes Logout Prompt

Launching:
- `<Super>Q`: Terminal (kitty)
- `<Super>E`: Filemanager (thunar)
- `<Super>R`: Launcher (wofi)
- `<Super>W`: Calculator (speedcrunch)

Screenshot (hyprshot):
- `Print`: current monitor
- `<Super>Print`: focused window
- `<Shift>Print`: mark region to screenshot

## Deploying this dotfiles repo
I use `dotbare` to clone and update this repo

## Other Advice/etc configs
Set in `/usr/share/gvfs/mounts/network.mount` this to prevent thunar from locking up/unable to launch on unreachable filesystem:
```
AutoMount=false
```
  
Doas user `/etc/doas.conf`:
```
permit persist :wheel
```
  
Thurstmaster T-LCM pedalse to show up correctly create `/etc/udev/rules.d/71-simpedals.rules`:
```
SUBSYSTEMS=="input", ATTRS{id/product}=="b371", ATTRS{id/vendor}=="044f", ENV{ID_INPUT_JOYSTICK}="1", TAG+="uaccess"
```
  
## Thunderbird
Thunderbird uses it's own notification windows, 
not great on a tiling window managers as they tile and rearrange the entire desktop.  
  
Solution is to use the Scriptable Notifications Add-On, 
a script that converts new email into standard notifications for hyprnotify to handle is included.
  
You have to install the Add-on, then change the path in `~/.mozilla/native-messaging-hosts/scriptableNotifications.json`, as it includes a hardcoded home folder.

## Licensing
There are some images in `~/.config/hypr/lockscreen/` (consult the `credits.txt`) there, which are unlicensed.  
  
All configuration should be treated as licensed under `MIT`
