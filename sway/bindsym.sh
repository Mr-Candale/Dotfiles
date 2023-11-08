sh

bindsym --to-code {


# Screenshots using grim and slurp
Print exec grim ~/Pictures/Screenshots/screenshot-$(date '+%Y-%m-%d-%H-%M-%S').png
Shift+Print exec slurp | grim -g - ~/Pictures/Screenshots/screenshot-$(date '+%Y-%m-%d-%H-%M-%S').png

# Volume Control
XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5% && $refresh_i3status
XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5% && $refresh_i3status
XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status

# Start a terminal
Mod1+Return exec xfce4-terminal

# Kill the focused window
Mod1+Shift+q kill

# Start rofi (a program launcher)
Mod1+d exec rofi -show drun

# Change focus
Mod1+$left focus left
Mod1+$down focus down
Mod1+$up focus up
Mod1+$right focus right

# Move focused window
Mod1+Shift+$left move left
Mod1+Shift+$down move down
Mod1+Shift+$up move up
Mod1+Shift+$right move right

# Split containers vertically/horizontally
Mod1+a split h
Mod1+s split v

# Enter fullscreen mode for the focused container
Mod1+f fullscreen toggle

# Change container layout (stacked, tabbed, toggle split)
Mod1+s layout stacking
Mod1+w layout tabbed
Mod1+e layout toggle split

# Toggle tiling / floating
Mod1+Shift+space floating toggle

# Change focus between tiling / floating windows
Mod1+space focus mode_toggle


# Start some programs
Mod1+p exec aegisub
Mod1+m exec subl4

Mod4+Space input type:keyboard xkb_switch_layout next
#Mod1+d exec j4-dmenu-desktop --dmenu="dmenu -i -nb '#000000' -nf '#FFFFFF' -sb '#FF6C00' -sf '#FFFFFF'" --term="cool-retro-term"


# Switch to workspace
Mod1+1 workspace $ws1
Mod1+2 workspace $ws2
Mod1+3 workspace $ws3
Mod1+4 workspace $ws4
Mod1+5 workspace $ws5
Mod1+6 workspace $ws6
Mod1+7 workspace $ws7
Mod1+8 workspace $ws8
Mod1+9 workspace $ws9
Mod1+0 workspace $ws10
Mod1+z workspace $ws11
Mod1+x workspace $ws12
Mod1+t workspace $ws13
Mod1+g workspace $ws14


# Move focused container to workspace
Mod1+Shift+1 move container to workspace $ws1
Mod1+Shift+2 move container to workspace $ws2
Mod1+Shift+3 move container to workspace $ws3
Mod1+Shift+4 move container to workspace $ws4
Mod1+Shift+5 move container to workspace $ws5
Mod1+Shift+6 move container to workspace $ws6
Mod1+Shift+7 move container to workspace $ws7
Mod1+Shift+8 move container to workspace $ws8
Mod1+Shift+9 move container to workspace $ws9
Mod1+Shift+0 move container to workspace $ws10
Mod1+Shift+z move container to workspace $ws11
Mod1+Shift+x move container to workspace $ws12
Mod1+Shift+t move container to workspace $ws13
Mod1+Shift+g move container to workspace $ws14

# Configuration Reloading and Exiting
Mod1+Shift+r reload
Mod1+Shift+e exec swaymsg exit


Mod1+r mode "resize"
}