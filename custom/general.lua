-- This file will not be overwritten across dots-hyprland updates.
-- The file name is for the sake of organization and does not matter
-- See the corresponding files in ~/.config/hypr/hyprland for examples

-- Virtual display for Sunshine/Moonlight extended desktop
-- hl.monitor({
--   output = "HEADLESS-2",
--   mode = "1920x1080@60",
--   position = "1920x0",
--   scale = "1",
-- })

hl.config({
  decoration = {
    active_opacity = window_opacity,
    inactive_opacity = window_opacity,
  },
})
