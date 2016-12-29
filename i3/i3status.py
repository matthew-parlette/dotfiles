from i3pystatus import Status
from i3pystatus.weather import weathercom

# For FontAwesome icons, use unicode: \uf0a0

status = Status(logfile='/home/matt/var/i3pystatus.log')

status.register(
    "clock",
    format="%Y-%m-%d %H:%M:%S",
    color="#fba922",
)

# Shows the average load of the last minute and the last 5 minutes
status.register(
    "load",
    color="#198844",
    critical_color="#969896",
)

status.register(
    "battery",
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
    },
    color="#c5c8c6",
    full_color="#198844",
    charging_color="#fba922",
    critical_color="#cc342b",
)

# Displays whether a DHCP client is running
# status.register("runwatch",
#                 name="DHCP",
#                 path="/var/run/dhclient*.pid",)

status.register("network",
                interface="eth0",
                format_up="\uf1e4",
                color_up="#198844",
                format_down="\uf1e4",
                color_down="#969896",)

status.register("network",
                interface="wlan0",
                format_up="\uf1eb",
                color_up="#198844",
                format_down="\uf1eb",
                color_down="#969896",)

# status.register(
#     "redshift",)

status.register(
    "disk",
    path="/",
    critical_limit=50,
    color="#198844",
    critical_color="#969896",
    format="\uf0a0",
)

status.register(
    "pulseaudio",
    format="♪ {volume}",
    color_muted="#cc342b",
    color_unmuted="#c5c8c6",
)

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
    color_icons={
        'Snow': ('☃', '#c5c8c6'),
        'Partly Cloudy': ('☁', '#969896'),
        'Rainy': ('⛈', '#3971ed'),
        'Fair': ('☼', '#198844'),
        'Thunderstorm': ('⚡', '#fba922'),
        'Sunny': ('☀', '#fba922'),
        'default': ('', None),
        'Cloudy': ('☁', '#969896'),
        'Fog': ('', '#969896')
    },
)

status.register(
    "pianobar",
    format="{songartist} - {songtitle}",
    songfile="/home/matt/.config/pianobar/song",
    ctlfile="/home/matt/.config/pianobar/ctl",
    color="#c5c8c6",
)

status.register(
    "pomodoro",
    sound="/home/matt/matthew.parlette@gmail.com/ringtones/SMW - Course Clear Fanfare.wav",
    format="\uf017 {time}",
)

status.run()
