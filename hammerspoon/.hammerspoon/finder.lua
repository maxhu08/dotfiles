local bundleID = "com.apple.finder"
local appName = "Finder"

-- set Finder window size and cascade spacing
local width = 1200
local height = 800
local cascadeOffset = 30

-- watch for new Finder windows
local function positionWindow(win)
  if not win:isStandard() or win:isFullScreen() then return end

  local screen = win:screen()
  if not screen then return end
  local frame = screen:frame()
  local windowWidth = math.min(width, frame.w)
  local windowHeight = math.min(height, frame.h)

  -- center Finder windows on their screen
  local x = frame.x + (frame.w - windowWidth) / 2
  local y = frame.y + (frame.h - windowHeight) / 2

  -- cascade Finder windows from the previous window
  for _, existing in ipairs(hs.window.orderedWindows()) do
    local app = existing:application()
    if existing:id() ~= win:id() and app and app:bundleID() == bundleID
      and existing:isStandard() and not existing:isFullScreen()
      and existing:screen() == screen then
      local existingFrame = existing:frame()
      x = math.max(frame.x, existingFrame.x + cascadeOffset)
      y = math.max(frame.y, existingFrame.y + cascadeOffset)

      -- wrap back when the next window reaches a screen edge
      if x + windowWidth > frame.x + frame.w then x = frame.x end
      if y + windowHeight > frame.y + frame.h then y = frame.y end
      break
    end
  end

  -- apply the Finder window size and position
  win:setFrameInScreenBounds({
    x = x,
    y = y,
    w = windowWidth,
    h = windowHeight
  }, 0)
end

finderWindowFilter = hs.window.filter.new(appName)
finderWindowFilter:subscribe(hs.window.filter.windowCreated, positionWindow)
