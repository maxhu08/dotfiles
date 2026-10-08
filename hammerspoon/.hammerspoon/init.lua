-- change default finder window dimensions
local width = 1200
local height = 800
local cascadeOffset = 30

finderWindowFilter = hs.window.filter.new("Finder")

finderWindowFilter:subscribe(
  hs.window.filter.windowCreated,
  function(win)
    if not win:isStandard() or win:isFullScreen() then return end

    local screen = win:screen()
    if not screen then return end
    local frame = screen:frame()
    local windowWidth = math.min(width, frame.w)
    local windowHeight = math.min(height, frame.h)

    local x = frame.x + (frame.w - windowWidth) / 2
    local y = frame.y + (frame.h - windowHeight) / 2

    -- cascade from the frontmost existing Finder window on this screen
    for _, existing in ipairs(hs.window.orderedWindows()) do
      local app = existing:application()
      if existing:id() ~= win:id() and app and app:bundleID() == "com.apple.finder"
        and existing:isStandard() and not existing:isFullScreen()
        and existing:screen() == screen then
        local existingFrame = existing:frame()
        x = math.max(frame.x, existingFrame.x + cascadeOffset)
        y = math.max(frame.y, existingFrame.y + cascadeOffset)

        -- wrap at screen edges instead of piling up against them
        if x + windowWidth > frame.x + frame.w then x = frame.x end
        if y + windowHeight > frame.y + frame.h then y = frame.y end
        break
      end
    end

    win:setFrameInScreenBounds({
      x = x,
      y = y,
      w = windowWidth,
      h = windowHeight
    }, 0)
  end
)
