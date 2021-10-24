-- Purpose: Autostart applications for awesome

local spawnWithShell = require("awful").spawn.with_shell

-- compositor (picom)
spawnWithShell("picom &")

-- set wallpaper
spawnWithShell("feh --bg-scale ~/Pictures/wallpapers/Calm-space-person.png &")

-- set key repeat to be faster
spawnWithShell("xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' &")
-- call polybar
-- spawnWithShell("~/.config/polybar/launch.sh")
