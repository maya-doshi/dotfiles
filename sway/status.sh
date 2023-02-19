# Produces "21 days", for example
# uptime=$(uptime | cut -d ',' -f1  | cut -d ' ' -f4,5)⏳ 

# The abbreviated weekday (e.g., "Sat"), followed by the ISO-formatted date
# like 2018-10-06 and the time (e.g., 14:01)
date_formatted=$(date "+%m-%d %H:%M")

# Returns the battery status: "Full", "Discharging", or "Charging".
battery_status=$(cat /sys/class/power_supply/BAT0/status)
battery_percent=$(cat /sys/class/power_supply/BAT0/capacity)

# if [ "$battery_status" = "Discharging" ]; then
if [ "$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "state" | cut -d ' ' -f20)" = "discharging" ]; then
  bat_emoji="🔋" 
else
  bat_emoji="🔌"
fi


if [ "$(pactl get-sink-mute @DEFAULT_SINK@ | cut -d ' ' -f2)" = "yes" ]; then
  # volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep "Volume:" | cut -d '/' -f2 | cut -d '%' -f1)%🔇
  vol_emoji="🔇"
else
  # volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep "Volume:" | cut -d '/' -f2 | cut -d '%' -f1)%🔊
  vol_emoji="🔊"
fi

volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep "Volume:" | cut -d '/' -f2 | cut -d '%' -f1)%

# brightness=$(brightnessctl | cut -d ')' -f1 | cut -d '(' -f2 -s)☀️  
brightness=$(brightnessctl get)☀️  

# ↑ 🔌 
# echo $uptime $brightness $volume $battery_percent%$bat_emoji $date_formatted
echo $volume$vol_emoji $brightness $battery_percent%$bat_emoji $date_formatted
