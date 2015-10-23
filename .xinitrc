#Start compton, my compositor. Disabled for now since vsync seems to apply for the 60hz monitor, then bottlenecks the 144hz monitor.
exec sh ~/.config/startCompton &

#Set the background.
exec sh ~/.fehbg &

#Get rid of mouse acceleration for the extra skillz in CS:GO
xset m 0 0 &

#Does some magic so that my fonts all actually work
xset +fp /usr/share/fonts/local
xset fp rehash

#And finally, i3 itself. This actually starts i3-gaps, not vanilla i3.
exec i3
#exec cinnamon-session
