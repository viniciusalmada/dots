#!/usr/bin/env python
import blocks
import subprocess
from string import Template

cpu_speed = float(subprocess.run('lscpu | grep "CPU MHz" | awk \'{ print $3 }\'',shell=True, capture_output=True, text=True).stdout)

#span_icon = Template('<span face="Roboto" foreground="$color" size="large">$icon</span>')
#span_text = Template('<span face="Roboto" foreground="$color">$text MHz</span>')

#color = 'white'
#if cpu_speed >= 3000:
#     color = '#eb5050'
# elif cpu_speed >= 2600:
#     color = '#eb9350'

# print(span_icon.substitute(color=color, icon='﬙'),span_text.substitute(color=color, text='{:.1f}'.format(cpu_speed)))


fgColor = blocks.textBgColor
bgColor = blocks.colorCPU
span = blocks.span

print(span.substitute(fgIc=fgColor, icon=' ﬙ ', bgIc=bgColor, fgTx=bgColor, bgTx=fgColor, text=' {:1.2f} GHz '.format(cpu_speed/1000)))