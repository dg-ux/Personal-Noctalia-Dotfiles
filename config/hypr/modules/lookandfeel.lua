-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
  general = {
    gaps_in          = 4,
    gaps_out         = 5,

    border_size      = 1,

    col              = {
      active_border   = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
      inactive_border = "rgba(595959aa)",
    },

    -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
    resize_on_border = false,

    -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
    allow_tearing    = false,

    layout           = "dwindle",
  },

  decoration = {
    rounding         = 15,
    rounding_power   = 8,

    -- Change transparency of focused and unfocused windows
    active_opacity   = 0.8,
    inactive_opacity = 0.8,

    shadow           = {
      enabled      = true,
      range        = 12,
      render_power = 4,
      color        = "0xee0a0a0a",
    },

    blur             = {
      enabled           = true,
      size              = 8,
      passes            = 2,
      vibrancy          = 0.0,
      noise             = 0.0,
      new_optimizations = true,
      ignore_opacity    = true,
      xray              = false,
      special           = false,
      input_methods     = false,
      brightness        = 1.5,
      popups            = true
    },
  },

  animations = {
    enabled = true,
  },
})
--------------------------------------------------------------------------------
-- Animation Curves (Bezier)
--------------------------------------------------------------------------------
hl.curve("overshot", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.curve("easeOutExpo", { type = "bezier", points = { { 0.16, 1 }, { 0.3, 1 } } })
hl.curve("easeOutBack", { type = "bezier", points = { { 0.34, 1.56 }, { 0.64, 1 } } })
hl.curve("easeInBack", { type = "bezier", points = { { 0.36, 0 }, { 0.66, -0.56 } } })
hl.curve("easeInOutBack", { type = "bezier", points = { { 0.68, -0.6 }, { 0.32, 1.6 } } })

--------------------------------------------------------------------------------
-- Animation Rules
--------------------------------------------------------------------------------
hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "overshot", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 100, bezier = "easeOutExpo" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 7, bezier = "easeOutBack" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 6, bezier = "easeInOutBack", style = "slide" })
hl.animation({ leaf = "border", enabled = true, speed = 5, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 5, bezier = "easeOutBack" })
hl.animation({ leaf = "fadeDim", enabled = true, speed = 5, bezier = "easeOutBack" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 10, bezier = "easeOutExpo" })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
  dwindle = {
    preserve_split = true, -- You probably want this
  },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
  master = {
    new_status = "master",
  },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
  scrolling = {
    fullscreen_on_one_column = true,
  },
})

hl.layer_rule({
  name = "noctalia",
  match = {
    namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd)$",
  },
  no_anim = true,
  ignore_alpha = 0.3,
  blur = true,
  blur_popups = true,
})

hl.window_rule({
  match = { fullscreen = true },
  opaque = true,
  no_blur = true,
})

--game mode

hl.bind("SUPER + G", hl.dsp.exec_cmd("~/.config/hypr/scripts/game-mode.sh"))
