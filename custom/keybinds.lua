-- This file will not be overwritten across dots-hyprland updates.
-- The file name is for the sake of organization and does not matter
-- See the corresponding files in ~/.config/hypr/hyprland for examples

hl.bind(
	"SUPER + Z",
	hl.dsp.exec_cmd(HOME .. "/.config/hypr/custom/scripts/toggle-overlay.sh"),
	{ description = "Coding: Toggle floating overlay (semi-transparent)" }
)
