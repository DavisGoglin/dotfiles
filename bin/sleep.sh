# timeout 300 'swaylock -f -c 000000' \
#timeout 900 'systemctl suspend' \
#before-sleep 'swaylock -f -c 000000' &
swayidle -w timeout 600 'hyprctl dispatch dpms off' \
            resume 'hyprctl dispatch dpms on' &
