#!/usr/bin/env python
import subprocess
from string import Template

caps = subprocess.run('xset -q | grep Caps | awk \'{ print $4 }\'',shell=True, capture_output=True, text=True).stdout.strip()

span_icon = Template('<span foreground="$color" size="large">$icon</span>')
span_text = Template('<span foreground="$color">$text</span>')

color = 'white'
if caps == "on":
    print(span_icon.substitute(color=color, icon=''), span_text.substitute(color=color, text='CAPS'))
elif caps == "off":
    print()

