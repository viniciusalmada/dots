#!/usr/bin/env python
import subprocess
from string import Template

user = subprocess.run('echo "Vinicius Almada"',shell=True, capture_output=True, text=True).stdout

span_text = Template('<span foreground="$color" weight="medium">$text</span>')

color = 'white'

print(span_text.substitute(color=color, text=user.strip()),' ')
