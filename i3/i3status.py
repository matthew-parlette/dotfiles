from i3pystatus import Status
from i3pystatus.weather import weathercom

# For FontAwesome icons, use unicode: \uf0a0

status = Status(logfile='/home/matt/var/i3pystatus.log')

status.register("clock", format="%Y-%m-%d %H:%M:%S",)

# Shows the average load of the last minute and the last 5 minutes
status.register("load")

status.register("battery",
                format="{status}/{consumption:.2f}W "
                       "{percentage:.2f}% "
                       "[{percentage_design:.2f}%] "
                       "{remaining:%E%hh:%Mm}",
                not_present_text='',
                alert=True,
                alert_percentage=5,
                status={
                    "DIS": "↓",
                    "CHR": "↑",
                    "FULL": "=",
                },)

# Displays whether a DHCP client is running
# status.register("runwatch",
#                 name="DHCP",
#                 path="/var/run/dhclient*.pid",)

status.register("network",
                interface="eth0",
                format_up="\uf1e4",
                format_down="\uf1e4",
                color_down="#444444",)

status.register("network",
                interface="wlan0",
                format_up="\uf1eb",
                format_down="\uf1eb",
                color_down="#444444",)

# status.register(
#     "redshift",)

status.register("disk",
                path="/",
                critical_limit=50,
                color="#00FF00",
                format="\uf0a0",)

status.register("pulseaudio",
                format="♪ {volume}",)

status.register(
    "weather",
    format="{current_temp}{temp_unit}[ {icon}]",
    interval=900,
    colorize=True,
    hints={'markup': 'pango'},
    backend=weathercom.Weathercom(
        location_code='21012:4:US',
        units='imperial',
    ),
)

status.register(
    "pianobar",
    format="{songartist} - {songtitle}",
    songfile="/home/matt/.config/pianobar/song",
    ctlfile="/home/matt/.config/pianobar/ctl")

status.register(
    "pomodoro",
    sound="/home/matt/matthew.parlette@gmail.com/ringtones/SMW - Course Clear Fanfare.wav",
    format="\uf017 {time}",
)

status.run()
