#!/usr/bin/env python3
import re
import sys

scss_file = sys.argv[1]
out_file = sys.argv[2]

with open(scss_file) as f:
    data = f.read()

def get(name, default="aacae9"):
    m = re.search(r'^\$' + name + r':\s*#([0-9A-Fa-f]+)', data, re.M)
    return m.group(1) if m else default

primary = get("primary")
tertiary = get("tertiary")
secondary = get("secondary")
surface = get("surface")

lua = f'''hl.config({{
    general = {{
        col = {{
            active_border   = {{ colors = {{ "rgba({primary}EE)", "rgba({tertiary}EE)" }} }},
            inactive_border = {{ colors = {{ "rgba({surface}66)" }} }},
        }},
    }},
    misc = {{
        background_color = "rgba({surface}FF)",
    }},
}})

hl.window_rule({{
    match        = {{ pin = 1 }},
    border_color = {{ colors = {{ "rgba({secondary}AA)", "rgba({secondary}77)" }} }},
}})
'''

with open(out_file, 'w') as f:
    f.write(lua)
