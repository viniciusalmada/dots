#!/usr/bin/env python
import subprocess
from string import Template

date = subprocess.run('date +"%a %b %e"',shell=True, capture_output=True, text=True).stdout
hour = subprocess.run('date +"%I:%m %p"',shell=True, capture_output=True, text=True).stdout

span_text = Template('<span foreground="$color">$text</span>')

color = 'white'

print(span_text.substitute(color=color, text=date.strip()),'  ',span_text.substitute(color=color, text=hour.strip()))
