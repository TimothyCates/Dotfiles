#  ╭────────────────────╮
#  │ Kill all instances │
#  ╰────────────────────╯
killall swaybg

#  ╭──────────────────────────────────╮
#  │ set each monitor to random image │
#  ╰──────────────────────────────────╯
wloutput=$(hyprctl monitors | grep 'Monitor ' | cut -d' ' -f2)
readarray -t displays <<< "$wloutput"
for index in "${!displays[@]}"
do
   swaybg -o ${displays[index]} -i $(find ~/Pictures/Wallpapers/ -type f | shuf -n1) -m fill & done
