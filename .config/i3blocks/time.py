#!/usr/bin/env python
import blocks
import subprocess
from string import Template

date = subprocess.run('date +"%a %b %e"',shell=True, capture_output=True, text=True).stdout
hour = subprocess.run('date +"%I:%m:%S %p"',shell=True, capture_output=True, text=True).stdout

#span_text = Template('<span face="Roboto" foreground="$color">$text</span>')

#color = 'white'

#print(span_text.substitute(color=color, text=date.strip()),'',span_text.substitute(color=color, text=hour.strip()))

fgColor = blocks.textBgColor
bgColor = blocks.colorTime
span = blocks.span

print(span.substitute(fgIc=fgColor, icon='  ', bgIc=bgColor, fgTx=bgColor, bgTx=fgColor, text=' ' + date.strip() + ' ' + hour.strip()))
