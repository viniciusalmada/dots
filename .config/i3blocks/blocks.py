# blocks with global variable
# colors
textBgColor = "#282828"
colorMemory = "#98971a"
colorBrightness = "#98971a"
colorCPU = "#98971a"
colorTime = "#98971a"
colorUser = "#98971a"
#colorBrightness = "#98971a"
#colorCPU = "#458588"
#colorTime = "#b16286"
#colorUser = "#cc241d"

# template
from string import Template
span = Template('<span face="MesloLGS NF"\
foreground="$fgIc" background="$bgIc" size="large">$icon</span>\
<span face="Roboto" foreground="$fgTx" background="$bgTx" weight="medium">$text</span>')