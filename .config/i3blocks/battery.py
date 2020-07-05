#!/usr/bin/env python
import blocks
import subprocess
from string import Template

bat = subprocess.run('acpi -b | grep -E -o \'[0-9][0-9][0-9]?%\'',shell=True, capture_output=True, text=True).stdout.strip()
isCharging = subprocess.run('acpi -b | grep -E -o \'Charging\'',shell=True, capture_output=True, text=True).stdout.strip()

if isCharging == "Charging":
    bat = "+" + bat
elif isCharging == "Discharging":
    bat = "-" + bat
else:
    bat = bat

fgColor = blocks.textBgColor
bgColor = blocks.colorMemory
span = blocks.span

print(span.substitute(fgIc=fgColor, icon='  ', bgIc=bgColor, fgTx=bgColor, bgTx=fgColor, text=' ' + bat))
