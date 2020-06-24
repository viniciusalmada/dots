#!/usr/bin/env python
import subprocess
from string import Template

fan = float(subprocess.run('/bin/cat /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon2/fan1_input',shell=True, capture_output=True, text=True).stdout)

span_icon = Template('<span foreground="$color" size="large">$icon</span>')
span_text = Template('<span foreground="$color">$text RPM</span>')

color = 'white'
if fan >= 4000:
    color = '#eb5050'
elif fan >= 3800:
    color = '#eb9350'

print(span_icon.substitute(color=color, icon=''),span_text.substitute(color=color, text='{:.0f}'.format(fan)))
