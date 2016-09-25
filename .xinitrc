# Set the background
exec sh ~/.fehbg &

# Disable mouse acceleration
xset m 0 0 &

# Setup fonts
xset +fp /usr/share/fonts/local
xset fp rehash

# Start wm
exec i3
