########################################################################

########################################################################

import os
import subprocess

from libqtile import hook

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

# Autostart hook

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.Popen([home])

mod = "mod4"
terminal = "alacritty"
browser = "firefox"

# █▄▀ █▀▀ █▄█ █▄▄ █ █▄░█ █▀▄ █▀
# █░█ ██▄ ░█░ █▄█ █ █░▀█ █▄▀ ▄█

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "Left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "Right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "Down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "Up", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod], "l", lazy.spawn("betterlockscreen -l"), desc="Launch the lockscreen."),
    Key([mod], "w", lazy.spawn(browser), desc="Launch browser"),
    Key([mod], "e", lazy.spawn("alacritty -e fff"), desc="Launch text file manager"),
    Key([mod], "m", lazy.spawn("alacritty -e cmus"), desc="Launch text music player"),
    Key([mod], "c", lazy.spawn("alacritty -e calcurse"), desc="Open Calendar"),
    Key([mod], "p", lazy.spawn("keepassxc"), desc="Open Password manager"),
    Key([mod], "y", lazy.spawn(os.path.expanduser("~/.config/qtile/power_menu.sh")), desc="Launch the power menu."),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume 0 +5%"), desc='Volume Up'),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume 0 -5%"), desc='volume down'),
    Key([], "XF86AudioMute", lazy.spawn("pulsemixer --toggle-mute"), desc='Volume Mute'),
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl s 10%+"), desc='brightness UP'),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl s 10%-"), desc='brightness Down'),
    Key([mod], "r", lazy.spawn("dmenu_run -nf '#D3D3D3' -nb '#222222' -sb '#36454F' -sf '#D3D3D3' -fn 'Monofur Nerd Font Mono'-10"), desc="Spawn a command using a prompt widget"),
    Key([mod], "s", lazy.spawn("flameshot gui"), desc='Screenshot'),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    # Dunst Shortuts
    Key(["control"], "space",  lazy.spawn("dunstctl close")), # Clear Last Notification
    Key(["control", "shift"], "space",  lazy.spawn("dunstctl close-all")), # Clear All Notifications
    Key(["control", "shift"], "n",  lazy.spawn("dunstctl  history-pop")), # Show Notificaction history
]

# █▀▀ █▀█ █▀█ █░█ █▀█ █▀
# █▄█ █▀▄ █▄█ █▄█ █▀▀ ▄█

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layout_theme = {"border_width": 4,
                "margin": 8,
                "border_focus": "D3D3D3",
                "border_normal": "000000"
                }

layouts = [
    #layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
    #layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    layout.MonadTall(**layout_theme),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="Monofur Nerd Font Mono Bold",
    fontsize=16,
    padding=3,
)
extension_defaults = widget_defaults.copy()

# █▄▄ ▄▀█ █▀█
# █▄█ █▀█ █▀▄

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
				highlight_color = "#C0C0C0",
				highlight_method = "line",
				),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#36454F", "#D3D3D3"),
                    },
                    name_transform=lambda name: name.upper(),
                ),

		# Network Information               
		#widget.TextBox(font="Monofur Nerd Font Mono Bold", text=" ", foreground="#44c419", padding=0, fontsize=30),
                #widget.TextBox(font="Monofur Nerd Font Mono Bold", text="", foreground="#44c419", padding=0, fontsize=30),
                #widget.Net(interface=None, format='{down} ↓↑ {up}'), # None = it will show traffic on all interfaces combined
		
		# CPU Freq
		#widget.TextBox(font="Monofur Nerd Font Mono Bold", text="", foreground='#cd1f3f', padding=0, fontsize=32),
                #widget.CPUGraph(border_color='#c0c5ce',  fill_color='#6790eb', graph_color='#6790eb', border_width=1, line_width=1, core="all", type="box"),
                #widget.Sep(linewidth=0, padding=5),
		
		# Thermal Sensor
		#widget.TextBox(font="Monofur Nerd Font Mono Bold", text="", foreground="#bc5a03", padding=0, fontsize=20),
                #widget.ThermalSensor(foreground_alert="#cd1f3f", metric=True, padding=3, threshold=80),
                #widget.Sep(padding=10),
		    
		widget.CheckUpdates (
			background='#5c5d63',
			colour_have_updates='#d979fc',
			colour_no_updates='#38f23b',
			display_format='Updates: {updates}',
			distro = "Arch",
			execute='alacritty -e /usr/bin/pacman -Syu',
			foreground='#8be9fd',
			no_update_string = 'No Updates',
			padding = 4,
			update_interval='60'
		),

                widget.Clock(format="%a %I:%M %p"),
                widget.Systray(),
            ],
            24,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = None
wl_xcursor_size = 24

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "Qtile"
