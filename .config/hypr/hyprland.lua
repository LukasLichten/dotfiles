pcall(require, "device-specific")

hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

-------------------
--- MY PROGRAMS ---
-------------------

-- See https://wiki.hyprland.org/Configuring/Keywords/

-- Set programs that you use
local terminal = "kitty"
local fileManager = "thunar"
local menu = "wofi --show drun"
local home = "/home/Lukas"
local calc = "speedcrunch"

-----------------
--- AUTOSTART ---
-----------------

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

hl.on("hyprland.start", function ()
	-- Necessary
	hl.exec_cmd("hypridle")
	hl.exec_cmd("waybar")
	hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
	hl.exec_cmd("nm-applet --indicator")
	hl.exec_cmd("blueman-applet")
	hl.exec_cmd("hyprnotify")
	hl.exec_cmd("kdeconnectd")
	hl.exec_cmd(fileManager .. " --daemon")
	hl.exec_cmd("go-hass-agent --terminal run")
	-- If you just enable it, then it will fail to launch for reasons
	hl.exec_cmd("systemctl --user restart opentabletdriver.service")

	hl.exec_cmd("hyprpaper")

	-- Nice to have
	hl.exec_cmd(terminal, { workspace = 1  })
	hl.exec_cmd("flatpak run com.discordapp.Discord" , { workspace = "3 silent" })
	hl.exec_cmd("flatpak run org.telegram.desktop", { workspace = "3 silent" })
end)

-----------------------------
--- ENVIRONMENT VARIABLES ---
-----------------------------

-- See https://wiki.hyprland.org/Configuring/Environment-variables/
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
-- env = XCURSOR_THEME,Breeze
hl.env("XCURSOR_SIZE", "24")
-- env = HYPRCURSOR_THEME,Breeze
hl.env("HYPRCURSOR_SIZE", "24")
-- env = GDK_SCALE,1.2 # Moved to device specific
hl.env("MOZ_ENABLE_WAYLAND", "1")

hl.env("XDG_DOWNLOAD_DIR",  home .. "/Downloads")
hl.env("XDG_PICTURES_DIR",  home .. "/Pictures")
hl.env("XDG_VIDEOS_DIR",  home .. "/Videos")
hl.env("XDG_MUSIC_DIR",  home .. "/Music")
hl.env("XDG_CONFIG_HOME",  home .. "/.config")
hl.env("XDG_CACHE_HOME",  home .. "/.cache")
hl.env("XDG_DATA_HOME",  home .. "/.local/share")

hl.env("PRESSURE_VESSEL_IMPORT_OPENXR_1_RUNTIMES",  "1")



-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


---------------------
--- LOOK AND FEEL ---
---------------------

-- Refer to https://wiki.hyprland.org/Configuring/Variables/

-- https://wiki.hyprland.org/Configuring/Variables/#general
hl.config({
	general = {
		gaps_in = 4,
		gaps_out = 8,

		border_size = 2,

		-- https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
		col = {
			active_border = "rgba(cb00b5ee)",
			inactive_border = "rgba(595959aa)",
		},

		-- Set to true enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
		allow_tearing = true,

		layout = "dwindle",
	},

	-- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
	dwindle = {
		preserve_split = true -- You probably want this
	},
	-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
	master = {
		new_status = "master",
	},
	-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
	scrolling = {
		fullscreen_on_one_column = true,
	},

	xwayland = {
		force_zero_scaling = true
	},

	-- https://wiki.hyprland.org/Configuring/Variables/#decoration
	decoration = {
		rounding = 0,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)"
		},

		-- https://wiki.hyprland.org/Configuring/Variables/#blur
		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696
		}
	},
	-- https://wiki.hyprland.org/Configuring/Variables/#misc
	misc = {
		force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(

		key_press_enables_dpms = true,
		--    vfr = true

		render_unfocused_fps = 60,
	},
	-- https://wiki.hyprland.org/Configuring/Variables/#animations
	animations = {
		enabled = true
	},
})


hl.curve("myBezier", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05}}})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 238.1191, dampening = 24.21279333 })

-- Animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
hl.animation({ leaf = "global", enabled = false,  speed = 10, bezier = "default" })
hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%"})
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })

-------------
--- INPUT ---
-------------

-- https://wiki.hyprland.org/Configuring/Variables/#input
hl.config({
	input = {
		numlock_by_default = false,

		-- kb_file =
		kb_layout = "us,de",
		-- kb_variant = ,
		-- kb_model = ,
		kb_options = "grp:alt_shift_toggle",

		-- 0 - Cursor movement will not change focus.
		-- 1 - Cursor movement will always change focus to the window under the cursor.
		-- *2 - Cursor focus will be detached from keyboard focus. Clicking on a window will move keyboard focus to that window.
		-- 3 - Cursor focus will be completely separate from keyboard focus. Clicking on a window will not change keyboard focus.
		follow_mouse = 2,

		sensitivity = -0.25, -- -1.0 - 1.0, 0 means no modification

		touchpad = {
			disable_while_typing = true,
			natural_scroll = false,
			drag_lock = false,
			scroll_factor = 1.0, -- Styling on Gnome
		}
	},
})

-- See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
-- Map wacom tablet to only the current monitor, we can afterall easily switch monitor
hl.device({
	name = "wacom-intuos-s-pen",
	output = "current"
})

hl.device({
	name = "opentabletdriver-virtual-artist-tablet",
	output = "current"
})

-- https://wiki.hyprland.org/Configuring/Variables/#gestures
hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

--------------------
--- KEYBINDINGSS ---
--------------------

local mainMod = "SUPER"

-- Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(calc))

hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("kill $(pidof wlogout) || wlogout"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized"}))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen"}))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))

hl.bind("XF86PowerOff", hl.dsp.exec_cmd("kill $(pidof wlogout) || wlogout"))
-- Keep in mind to switch systemd handling of the power button off:
-- create a new file in /etc/systemd/logind.conf.d/ignore-power-button.conf with content
-- [Login]
-- HandlePowerKey=ignore
-- 
-- Then restart systemd-logind (or restart the machine, restarting the service will crash Hyprland anyway)

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Moves/Swaps the active window via mainMod + Shift + arrow keys
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

-- Modifies the splitratio 
hl.bind(mainMod .. " + SHIFT + Page_Up",  hl.dsp.layout("splitratio -0.05"), { locked = true, repeating = true })
hl.bind(mainMod .. " + SHIFT + Page_Down", hl.dsp.layout("splitratio +0.05"), { locked = true, repeating = true })

-- Workspace Actions
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	-- Switch workspaces with mainMod + [0-9]
	hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))

	-- Move active window to a workspace with mainMod + SHIFT + [0-9]
	hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))

	-- Move workspace to active monitor
	local moveWorkspace = function ()
		hl.dispatch(hl.dsp.workspace.move({ workspace = i, monitor = "current" }))
		hl.dispatch(hl.dsp.focus({ workspace = i }))
	end
	hl.bind(mainMod .. " + ALT + " .. key, moveWorkspace)
	hl.bind(mainMod .. " + MOD5 + " .. key, moveWorkspace) -- ISO Layout
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Volume and Media Control
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pamixer -i 5"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer -d 5"), { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("pamixer -t"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("pamixer --default-source -m"),   { locked = true, repeating = true })
hl.bind("XF86AudioPlay",     hl.dsp.exec_cmd("playerctl play-pause"),   { locked = true, repeating = true })
hl.bind("XF86AudioPause",     hl.dsp.exec_cmd("playerctl play-pause"),   { locked = true, repeating = true })
hl.bind("XF86AudioNext",     hl.dsp.exec_cmd("playerctl next"),   { locked = true, repeating = true })
hl.bind("XF86AudioPrev",     hl.dsp.exec_cmd("playerctl previous"),   { locked = true, repeating = true })

-- Screen brightness
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Screenshot a window
local screenshotWindow = function ()
	hl.dispatch(hl.dsp.exec_cmd("hyprshot -m active -m window -o ~/Pictures/Screenshots"))
end

hl.bind(mainMod .. " + PRINT", screenshotWindow)
hl.bind(mainMod .. " + HOME", screenshotWindow)
-- Screenshot a monitor
local screenshotMonitor = function ()
	hl.dispatch(hl.dsp.exec_cmd("hyprshot -m active -m output -o ~/Pictures/Screenshots"))
end

hl.bind("CTRL + PRINT", screenshotMonitor)
hl.bind("CTRL + HOME", screenshotMonitor)
-- Screenshot a region
local screenshotRegion = function ()
	hl.dispatch(hl.dsp.exec_cmd("hyprshot -m region -o ~/Pictures/Screenshots"))
end
hl.bind("SHIFT + PRINT", screenshotRegion)
hl.bind("SHIFT + HOME", screenshotRegion)

------------------------------
--- WINDOWS AND WORKSPACES ---
------------------------------

-- See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
-- See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules
--
-- You'll probably like this
hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize"
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})
-- Preventing firefox untitled pop-ups from tiling (SimpleTab Groups is a big offender)
hl.window_rule({
	name = "firefox-popup-floating",
	match = {
		class  = "firefox|florp",
		title = "^(\\s*)$",
	},
	move = "100%-monitor_w-8 2%",
	float = true

})

-- Fullscreening the Warudo Vtubing software
hl.window_rule({
	name = "warudo-fullscreen-editor",
	match = {
		class  = "steam_app_2079120",
		title = "Warudo Editor",
	},
	workspace = 4,
	tile = true

})
hl.window_rule({
	name = "warudo-fullscreen-main",
	match = {
		class  = "steam_app_2079120",
		title = "Warudo",
	},
	workspace = 8,
	tile = true
})

-- Fullscreens OpenTTD
hl.window_rule({
	name = "openttd-fullscreen",
	match = {
		class  = "openttd",
	},
	fullscreen = true

})

-- Make Gimp Open/Save/Export Dialogs tile
-- These dialogs occasionally spawn half off screen and baddly sized, tiling them makes them
-- more predictable
hl.window_rule({
	name = "gimp-tile-open-dialogs",
	match = {
		class  = "gimp",
		title = "(Open Image as Layers|Save Image|Open Image|Export Image)"
	},
	tile = true
})
-- But not the DDS import option, and not the export option dialog
-- Reasoning for me is that these take their time to pop up, and cause bad layout shuffles
hl.window_rule({
	name = "gimp-float-dds-option-dialogs",
	match = {
		class  = "dds",
		title = "Open DDS"
	},
	float = true
})
hl.window_rule({
	name = "gimp-float-export-file-dialogs",
	match = {
		class  = "file-.*",
		title = "Export Image as .*"
	},
	float = true
})

-- Changing Border for all fullscreen windows (so I might not forget that a window was fullscreened when launching anything else)
hl.window_rule({
	name = "thicc-fullscreen-border",
	match = {
		fullscreen = true
	},
	border_size = 4,
})

-- Structorizer
hl.window_rule({
	name = "structorizer-tile",
	match = {
		title = "Structorizer*."
	},
	tile = true
})

-- Inhibiting Idle when using OBS
hl.window_rule({
	name = "structorizer-tile",
	match = {
		class = "com.obsproject.Studio",
	},
	idle_inhibit = "always"
})

-- Steam
hl.window_rule({
    name = "tile-steam",
    match = {
	class = "steam"
    },
    tile = true
})
