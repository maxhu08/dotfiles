-- Native monitor-scoped workspace slots.
-- `r~N` targets the Nth workspace slot on the current monitor, including empty slots.

for i = 1, 9 do
  local key = tostring(i)
  local workspace = string.format("r~%d", i)

  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = workspace }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = workspace }))
end

hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = "r~10" }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = "r~10" }))
