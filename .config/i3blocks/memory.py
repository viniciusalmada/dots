#!/usr/bin/env python
import subprocess
from string import Template

mem_total = float(subprocess.run('free -m | grep Mem | awk \'{ print $2 }\'',shell=True, capture_output=True, text=True).stdout)
mem_used = float(subprocess.run('free -m | grep Mem | awk \'{ print $3 }\'',shell=True, capture_output=True, text=True).stdout)

span_icon = Template('<span foreground="$color" size="large">$icon</span>')
span_text = Template('<span foreground="$color">$text1 / $text2 MB</span>')

color = 'white'
if mem_used / mem_total >= 0.8:
    color = '#eb5050'
elif mem_used / mem_total >= 0.7:
    color = '#eb9350'

print(span_icon.substitute(color=color, icon=''), span_text.substitute(color=color, text1='{:.0f}'.format(mem_used), text2='{:.0f}'.format(mem_total)))
