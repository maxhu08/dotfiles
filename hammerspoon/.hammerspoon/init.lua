-- change default finder window dimensions
local width = 1200
local height = 800

finderWindowFilter = hs.window.filter.new("Finder")

finderWindowFilter:subscribe(
  hs.window.filter.windowCreated,
  function(win)
    if not win:isStandard() then return end

    local screen = win:screen()
    local frame = screen:frame()

    local x = frame.x + (frame.w - width) / 2
    local y = frame.y + (frame.h - height) / 2

    win:setFrameInScreenBounds({
      x = x,
      y = y,
      w = width,
      h = height
    }, 0)
  end
)