#!/bin/bash

HIGHLIGHT="#F0F01b"
BACKGROUND="#262626"
LIGHT='#A0A0A0'
FORTUNE=$(fortune -sn 150 art cookie work | tr "\n\t" " ")

clock(){
	date "+The time is %I:%M on %A, %B %d."
}

info(){
    echo "$FORTUNE" | head -n 1
}

battery(){
    STATE=''
    GREEN='#5DDD6E'
    YELLOWGREEN='#A1E03C'
    YELLOW='#DDDA23'
    RED='#D80808'
    URGENT='#980808'
    BATT=$(acpi | awk -F ',' '{print $2}' | awk -F '%' '{print $1}')
    if [[ $(acpi) =~ Charging ]]; then
        STATE='Charging:'
    fi
    if [ $BATT -ge 80 ]; then
        echo -n "%{B$GREEN}%{F$BACKGROUND} $STATE $BATT % "
    elif [ $BATT -ge 60 ]; then
        echo -n "%{B$YELLOWGREEN}%{F$BACKGROUND} $STATE $BATT% "
    elif [ $BATT -ge 40 ]; then
        echo -n "%{B$YELLOW}%{F$BACKGROUND} $STATE $BATT% "
    elif [ $BATT -ge 20 ]; then
        echo -n "%{B$RED}%{F$BACKGROUND} $STATE $BATT% "
    else
        echo -n "%{B$URGENT}%{F$BACKGROUND} $STATE $BATT% "
    fi
}

wifi(){
	NETWORK=$(netctl list | grep \\*)
	if [ -z "$NETWORK" ]; then
		echo -n "Disconnected from network"
	fi
		#echo -n $(echo -n $NETWORK | cut -c 42-72)
		echo -n $NETWORK | gawk -v ORS=' ' '{print $NF}' | cut -c 8-32
}

# Regex black magic copied from /u/Dylan112
workspace() {
	workspacenext="A4:i3-msg workspace next_on_output:"
    workspaceprevious="A5:i3-msg workspace prev_on_output:"
    wslist=$(\
       wmctrl -d \
       | awk '/ / {print $2 $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20}' ORS=''\
       | sed -e 's/\s*  //g' \
       -e 's/\*[ 0-9A-Za-z]*[^ -~]*/  &  /g' \
       -e "s/\-[ 0-9A-Za-z]*[^ -~]*/%{F#6b6b6b}%{A:i3-msg workspace &:}  &  %{A}%{F$LIGHT}/g" \
       -e 's/\*//g' \
       -e 's/ -/ /g' \
       )
    echo -n "%{$workspacenext}%{$workspaceprevious}$wslist%{A}%{A}"
}

while true; do
	echo \
        "%{c}"\
            "$(clock) $(info) " \
        "%{l}"\
            "$(workspace)%{B$BACKGROUND}" \
        "%{r}" \
            "%{B$LIGHT}%{F#101010} $(wifi)%{F-}" \
            "%{B$BACKGROUND}%{F#a0a0a0}$(battery)%{B-}%{F-}"
    sleep .1;
done |
lemonbar -f '-xos4-terminus-*-*-*-*-12-120-*-*-*-*-*-*' \
    -p -b -d -B$BACKGROUND -F$LIGHT -g 1366x25+0+0 | bash
