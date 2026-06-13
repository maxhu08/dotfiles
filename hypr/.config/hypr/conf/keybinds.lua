-- See https://wiki.hyprland.org/Configuring/Keywords/ for more

mainMod = "SUPER"

-- Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo()) -- dwindle
hl.bind(mainMod .. " + T", hl.dsp.layout("togglesplit")) -- dwindle
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("wlogout -p layer-shell"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-waybar.sh"))
hl.bind(mainMod .. " + backslash", hl.dsp.exec_cmd("${HOME}/.config/hypr/scripts/layout.sh"))
hl.bind(mainMod .. " + SHIFT + backslash", hl.dsp.exec_cmd("${HOME}/.config/hypr/scripts/layout2.sh"))
hl.bind(mainMod .. " + period", hl.dsp.exec_cmd("wofi-emoji"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move focus with mainMod + hjkl 
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))

-- screenshot keybind
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd([[bash -c 'grim -o DP-1 "${HOME}/Pictures/screenshots/SS$(date +%Y-%m-%d_%H-%M-%S).png" && wl-copy < "${HOME}/Pictures/screenshots/SS$(date +%Y-%m-%d_%H-%M-%S).png"']]))

-- screenshot + crop keybind
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd([[bash -c 'grim -g "$(slurp)" "${HOME}/Pictures/screenshots/SS$(date +%Y-%m-%d_%H-%M-%S).png" && wl-copy < "${HOME}/Pictures/screenshots/SS$(date +%Y-%m-%d_%H-%M-%S).png"']]))

-- toggle no border, no gaps, no border radius
hl.bind(mainMod .. " + SHIFT + CTRL + B", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-compact.sh"))

-- Example special workspace (scratchpad) COMMENTED OUT FOR SCREENSHOT KEYBIND
-- hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
-- hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
