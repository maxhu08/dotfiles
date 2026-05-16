-- Keep a fixed 10-workspace block per monitor so `r~N` resolves to the expected
-- local slot, while Waybar can remap the displayed labels back to 1-10.

-- Order matters here: first monitor gets 1-10, second gets 11-20, third gets 21-30.
local monitorOutputs = { "DP-1", "DP-2", "DP-3" }

for monitorIndex, output in ipairs(monitorOutputs) do
  for slot = 1, 10 do
    local workspaceId = tostring((monitorIndex - 1) * 10 + slot)

    hl.workspace_rule({
      workspace = workspaceId,
      monitor = output,
      default = slot == 1,
    })
  end
end

for i = 1, 9 do
  local key = tostring(i)
  local workspace = string.format("r~%d", i)

  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = workspace }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = workspace }))
end

hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = "r~10" }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = "r~10" }))
