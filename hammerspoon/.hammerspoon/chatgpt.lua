local bundleID = "com.openai.codex"

-- insert two spaces when pressing tab in chatgpt input
local function insertTabSpaces(event)
  if event:getKeyCode() ~= hs.keycodes.map.tab
    or not event:getFlags():containExactly({}) then
    return false
  end

  local app = hs.application.frontmostApplication()
  if not app or app:bundleID() ~= bundleID then return false end

  local focused = hs.axuielement.systemWideElement():attributeValue("AXFocusedUIElement")
  if not focused or focused:attributeValue("AXRole") ~= "AXTextArea"
    or focused:attributeValue("AXEditable") == false then
    return false
  end

  hs.eventtap.keyStrokes("  ", app)
  return true
end

chatGPTTabSpaces = hs.eventtap.new({hs.eventtap.event.types.keyDown}, insertTabSpaces):start()
