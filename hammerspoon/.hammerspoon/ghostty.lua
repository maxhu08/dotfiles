local bundleID = "com.mitchellh.ghostty"
local appName = "Ghostty"

-- center newly created Ghostty windows
local function positionWindow(win)
  if not win:isStandard() or win:isFullScreen() then return end
  win:centerOnScreen(nil, true, 0)
end

-- show or hide Ghostty
local function toggleWindow()
  if not hs.application.pathForBundleID(bundleID) then return end

  -- find an existing Ghostty window
  local app = hs.application.get(bundleID)
  local win = app and (app:mainWindow() or app:allWindows()[1])

  if app and app:isFrontmost() and win and win:isVisible() then
    -- hide Ghostty when its window is already focused
    app:hide()
  elseif win then
    -- restore and focus the existing Ghostty window
    app:unhide()
    win:unminimize()
    win:focus()
  else
    -- launch Ghostty if no window exists
    hs.application.launchOrFocusByBundleID(bundleID)
  end
end

ghosttyWindowFilter = hs.window.filter.new(appName)
ghosttyWindowFilter:subscribe(hs.window.filter.windowCreated, positionWindow)

-- bind Ghostty to Alt + Space
hs.hotkey.bind({"alt"}, "space", toggleWindow)
