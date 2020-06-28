#!/usr/bin/env python
import subprocess
from string import Template

cpu_temp = float(subprocess.run('/bin/cat /sys/devices/platform/coretemp.0/hwmon/hwmon*/temp1_input',shell=True, capture_output=True, text=True).stdout) / 1000

span_icon = Template('<span foreground="$color" size="large">$icon</span>')
span_text = Template('<span foreground="$color">$text°C</span>')

color = 'white'
if cpu_temp >= 85:
    color = '#eb5050'
elif cpu_temp >= 70:
    color = '#eb9350'

print(span_icon.substitute(color=color, icon=''),span_text.substitute(color=color, text='{:.0f}'.format(cpu_temp)))
