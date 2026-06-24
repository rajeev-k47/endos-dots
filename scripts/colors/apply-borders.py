#!/usr/bin/env python3
import re
import sys

scss_path = sys.argv[1]
out_path = sys.argv[2]

with open(scss_path) as f:
    scss = f.read()

colors = {}
for m in re.finditer(r'^\$([a-zA-Z_]\w*):\s*#([0-9A-Fa-f]+)', scss, re.M):
    name, val = m.group(1), m.group(2).lower()
    colors[name] = val

primary = colors.get("primary", "ADC7FF")
tertiary = colors.get("tertiary", "DEBCDF")
surface = colors.get("surfaceDim", colors.get("surface", "111318"))
onSurface = colors.get("onSurface", "E9E1DE")

lua = f'''hl.config({{
    general = {{
        col = {{
            active_border   = {{ colors = {{ "rgba({primary.upper()}EE)", "rgba({tertiary.upper()}EE)" }} }},
            inactive_border = {{ colors = {{ "rgba({surface[:6]}66)" }} }},
        }},
    }},
    misc = {{
        background_color = "rgba({surface[:6]}FF)",
    }},
}})

hl.window_rule({{
    match        = {{ pin = 1 }},
    border_color = {{ colors = {{ "rgba({primary.upper()}AA)", "rgba({primary.upper()}77)" }} }},
}})
'''

with open(out_path, 'w') as f:
    f.write(lua)
