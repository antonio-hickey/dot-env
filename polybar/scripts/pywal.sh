#!/usr/bin/env bash

# color files
pfile="$home/.config/polybar/grayblocks/colors.ini"
rfile="$home/.config/polybar/grayblocks/scripts/rofi/colors.rasi"

# get colors
pywal_get() {
	wal -i "$1" -q -t
}

# change colors
change_color() {
	# polybar
	sed -i -e "s/background = #.*/background = $bg/g" $pfile
	sed -i -e "s/background-alt = #.*/background-alt = $bga/g" $pfile
	sed -i -e "s/foreground = #.*/foreground = $fg/g" $pfile
	sed -i -e "s/foreground-alt = #.*/foreground-alt = $fga/g" $pfile
	sed -i -e "s/primary = #.*/primary = $ac/g" $pfile
	sed -i -e 's/red = #.*/red = #b71c1c/g' $pfile
	sed -i -e 's/yellow = #.*/yellow = #f57f17/g' $pfile
	
	# rofi
	cat > $rfile <<- eof
	/* colors */

	* {
	  al:   #00000000;
	  bg:   ${bg}ff;
	  bga:  ${bga}ff;
	  fga:  ${fga}ff;
	  fg:   ${fg}ff;
	  ac:   ${ac}ff;
	}
	eof
}

# main
if [[ -f "/usr/bin/wal" ]]; then
	if [[ "$1" ]]; then
		pywal_get "$1"

		# source the pywal color file
		. "$home/.cache/wal/colors.sh"

		bg=`printf "%s\n" "$background"`
		fg=`printf "%s\n" "$background"`
		bga=`printf "%s\n" "$color7"`
		fga=`printf "%s\n" "$color7"`
		ac=`printf "%s\n" "$color1"`

		change_color
	else
		echo -e "[!] please enter the path to wallpaper. \n"
		echo "usage : ./pywal.sh path/to/image"
	fi
else
	echo "[!] 'pywal' is not installed."
fi
