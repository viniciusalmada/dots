#!/usr/bin/env python
import subprocess
import blocks
from string import Template

user = subprocess.run('echo "Vinicius"',shell=True, capture_output=True, text=True).stdout.strip()

fgColor = blocks.textBgColor
bgColor = blocks.colorUser
span = blocks.span

print(span.substitute(fgIc=fgColor, icon='  ', bgIc=bgColor, fgTx=bgColor, bgTx=fgColor, text=' ' + user + ' '))
