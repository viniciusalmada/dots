#!/usr/bin/env python
import blocks
import subprocess
from string import Template

mem_used = float(subprocess.run('free -m | grep Mem | awk \'{ print $3 }\'',shell=True, capture_output=True, text=True).stdout)

fgColor = blocks.textBgColor
bgColor = blocks.colorMemory
span = blocks.span

print(span.substitute(fgIc=fgColor, icon='  ', bgIc=bgColor, fgTx=bgColor, bgTx=fgColor, text=' {:.0f} MB '.format(mem_used)))