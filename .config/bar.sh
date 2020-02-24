#!/bin/bash
HIGHLIGHT="#ffffff"
clock() {
	TIME=$(date "+%l:%M")
	DATE=$(date "+%a %D")
    echo -n " %{F$HIGHLIGHT}$(printf('%b' "Time: ")%{F-}$TIME\
        %{F$HIGHLIGHT}$(printf '%b' "Date: ")%{F-} $DATE "
}
volume() {
	VOL=$(amixer get Master | grep % | sed -n 1p | awk -F '[' '{print $2}' | awk -F ']' '{print $1}')
	if [ $VOL = '0%' ]; then
		echo -n " %{F$HIGHLIGHT}$(printf '%b' "Vol: ")%{F-} Mute "
	else
		echo -n " %{F$HIGHLIGHT}$(printf '%b' "Vol: ")%{F-} $VOL "
	fi
}
#Copied from /u/Dylan112
workspace() {
	workspacenext="A4:i3-msg workspace next_on_output:"
        workspaceprevious="A5:i3-msg workspace prev_on_output:"
        wslist=$(\
                wmctrl -d \
                | awk '/ / {print $2 $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20}' ORS=''\
                | sed -e 's/\s*  //g' \
                -e 's/\*[ 0-9A-Za-z]*[^ -~]*/  &  /g' \
                -e 's/\-[ 0-9A-Za-z]*[^ -~]*/%{F#3b3b4b}%{A:i3-msg workspace &:}  &  %{A}%{F#A0A0A0}/g' \
                -e 's/\*//g' \
                -e 's/ -/ /g' \
                )
        echo -n "%{$workspacenext}%{$workspaceprevious}$wslist%{A}%{A}"
}
windowtitle(){
	# Grabs focused window's title
	# The echo "" at the end displays when no windows are focused.
	TITLE=$(xdotool getactivewindow getwindowname 2>/dev/null | sed -n 1p || echo "")
	TITLECUT=$(xdotool getactivewindow getwindowname 2>/dev/null | sed -n 1p | sed 's/\///g;s/-//g;s/ /\\/g' | cut -c 1-6 || echo "")

    if [ $TITLECUT = "glenn@" ]; then
		echo "$(printf '%b' "Active: ") $(echo "$TITLE" | cut -c 15-50)"
	else
		echo "$TITLE" | cut -c 1-50
	fi
}

while true; do
	echo "%{B\#c0303048}$(clock) $(volume) %{B-}%{c} $(workspace) %{r}%{B\#c0303048} $(windowtitle) %{B-}"
	sleep .1;
done |
#old one was '-g 1690x20+2035+1019'
lemonbar -p -b -d -B#c0262626 -F#A0A0A0 -g 1366x20+0+0\
 | bash
