require("hyprland.variables")

local function load_keybinds(name)
	local path = HOME .. "/.config/hypr/hyprland/keybinds-" .. name .. ".lua"
	if is_file_exists(path) then
		dofile(path)
	else
		dofile(HOME .. "/.config/hypr/hyprland/keybinds-ii.lua")
	end
end

local statefile = io.open(HOME .. "/.switch_state", "r")
if statefile then
	local flavour = statefile:read("*l"):gsub("%s+", "")
	statefile:close()
	load_keybinds(flavour)
else
	load_keybinds("ii")
end
