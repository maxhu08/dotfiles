hl.config({
  general = {
    -- See https://wiki.hyprland.org/Configuring/Variables/ for more

    gaps_in = 5,
    gaps_out = 10,

    border_size = 2,
    col = {
      active_border = { colors = { "rgba(7dd3fcee)", "rgba(0369a1ee)" }, angle = 45 },
      inactive_border = "rgba(262626ee)",
    },

    -- layout = dwindle
    layout = "master",

    -- Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
    allow_tearing = false,
  },

  decoration = {
    -- See https://wiki.hyprland.org/Configuring/Variables/ for more

    rounding = 10,
    
    blur = {
      enabled = true,
      size = 3,
      passes = 6,
    },

    -- drop_shadow = no 
    -- shadow_range = 4
    -- shadow_render_power = 3
    -- col.shadow = rgba(1a1a1aee)
  },

  animations = {
    enabled = true,
  },
})

hl.curve("defaultBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "defaultBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "defaultBezier" })
