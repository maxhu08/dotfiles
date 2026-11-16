local bundleID = "com.superlogical.rex"
local appName = "Rex Beta"

-- center newly created Rex windows
local function positionWindow(win)
  if not win:isStandard() or win:isFullScreen() then return end
  win:centerOnScreen(nil, true, 0)
end

-- show or hide Rex
local function toggleWindow()
  if not hs.application.pathForBundleID(bundleID) then return end

  -- find an existing Rex window
  local app = hs.application.get(bundleID)
  local win = app and (app:mainWindow() or app:allWindows()[1])

  if app and app:isFrontmost() and win and win:isVisible() then
    -- hide Rex when its window is already focused
    app:hide()
  elseif win then
    -- restore and focus the existing Rex window
    app:unhide()
    win:unminimize()
    win:focus()
  else
    -- launch Rex if no window exists
    hs.application.launchOrFocusByBundleID(bundleID)
  end
end

rexWindowFilter = hs.window.filter.new(appName)
rexWindowFilter:subscribe(hs.window.filter.windowCreated, positionWindow)

-- bind Rex to Option/Alt + Space
hs.hotkey.bind({"alt"}, "space", toggleWindow)
