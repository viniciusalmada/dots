#!/usr/bin/env python
import blocks
import subprocess
from string import Template

bright = float(subprocess.run('/bin/cat ~/.config/brightness',shell=True, capture_output=True, text=True).stdout)

#span = Template('<span face="Roboto" foreground="$color" size="large">$icon</span> <span foreground="$color">$text%</span>')

#color = 'white'

#print(span.substitute(color=color, icon='',text='{:.0f}'.format(bright)))


fgColor = blocks.textBgColor
bgColor = blocks.colorBrightness
span = blocks.span

print(span.substitute(fgIc=fgColor, icon='  ', bgIc=bgColor, fgTx=bgColor, bgTx=fgColor, text=' {:.0f}% '.format(bright)))
