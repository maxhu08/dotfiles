local tolerance = 24

-- move window to display (see karabiner config)
local function moveWindowToDisplay(direction)
  local win = hs.window.focusedWindow()
  if not win or not win:isStandard() or win:isFullScreen() then return end

  local screen = win:screen()
  if not screen then return end
  local target
  if direction == "left" then
    target = screen:toWest()
  else
    target = screen:toEast()
  end
  if not target then return end

  -- allow the small margins used by native macOS window tiling
  local frame, bounds = win:frame(), screen:frame()
  local wasMaximized = math.abs(frame.x - bounds.x) <= tolerance
    and math.abs(frame.y - bounds.y) <= tolerance
    and math.abs(frame.x + frame.w - bounds.x - bounds.w) <= tolerance
    and math.abs(frame.y + frame.h - bounds.y - bounds.h) <= tolerance

  if wasMaximized then
    win:setFrame(target:frame(), 0)
  else
    -- preserve ordinary window sizes, fitting smaller destination displays
    win:moveToScreen(target, true, true, 0)
  end
  win:focus()
end

hs.urlevent.bind("move-window-left", function() moveWindowToDisplay("left") end)
hs.urlevent.bind("move-window-right", function() moveWindowToDisplay("right") end)
