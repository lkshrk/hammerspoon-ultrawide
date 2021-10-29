--- === HammerspoonUltrawide ===
---
--- Window management configuration focused on usage with ultrawide monitors and keybinds.
---
--- Download: [https://github.com/lkshrk/hammerspoon-ultrawide/releases/latest/download/hammerspoon-ultrawide.zip](https://github.com/peterklijn/hammerspoon-shiftit/raw/master/Spoons/HammerspoonShiftIt.spoon.zip)

local obj = {}
obj.__index = obj

-- Metadata
obj.name = "HammerspoonUltrawide"
obj.version = "0.9"
obj.author = "Lukas Harke"
obj.homepage = "https://github.com/lkshrk/hammerspoon-ultrawide"
obj.license = ""

obj.mash = { 'ctrl', 'alt', 'cmd', 'shift' }
obj.mapping = {
  left = { obj.mash, 'left' },
  right = { obj.mash, 'right' },
  up = { obj.mash, 'up' },
  down = { obj.mash, 'down' },
  upleft = { obj.mash, '1' },
  upright = { obj.mash, '3' },
  botleft = { obj.mash, '2' },
  botright = { obj.mash, '4' },
  maximum = { obj.mash, 'm' },

  toggleZoom = { obj.mash, 'z' },
  center = { obj.mash, 'c' },

  nextScreen = { obj.mash, 'n' },
  previousScreen = { obj.mash, 'p' }
}

local units = {
  right25       = { x = 0.75, y = 0.00, w = 0.25, h = 1.00 },
  left25        = { x = 0.00, y = 0.00, w = 0.25, h = 1.00 },
  
  upleft25      = { x = 0.00, y = 0.00, w = 0.25, h = 0.50 },
  upright25     = { x = 0.75, y = 0.00, w = 0.25, h = 0.50 },
  botleft25     = { x = 0.00, y = 0.50, w = 0.25, h = 0.50 },
  botright25    = { x = 0.75, y = 0.50, w = 0.25, h = 0.50 },
  
  maximum       = { x = 0.25, y = 0.00, w = 0.50, h = 1.00 },
}

function move(unit) hs.window.focusedWindow():move(unit, nil, true, 0) end

function calculateSplit(isUp)
  screen = hs.window.focusedWindow():screen():frame()
  window = hs.window.focusedWindow():frame():toUnitRect(screen)
  
  x = window.x
  if isUp then
    y = 0.00
  else
    y = 0.50
  end

  h = 0.50
  w = window.w

  move({x = x, y = y, w = w, h = h})
end

function obj:left() move(units.left25) end
function obj:right() move(units.right25) end
function obj:up() calculateSplit(true) end
function obj:down() calculateSplit(false) end
function obj:upleft() move(units.upleft25) end
function obj:upright() move(units.upright25) end
function obj:botleft() move(units.botleft25) end
function obj:botright() move(units.botright25) end
function obj:maximum() move(units.maximum) end

function obj:toggleZoom() hs.window.focusedWindow():toggleZoom() end
function obj:center() hs.window.focusedWindow():centerOnScreen(nil, true, 0) end

function obj:nextScreen() hs.window.focusedWindow():moveToScreen(hs.window.focusedWindow():screen():next(),false, true, 0) end
function obj:previousScreen() hs.window.focusedWindow():moveToScreen(hs.window.focusedWindow():screen():previous(),false, true, 0) end


function obj:bindHotkeys(mapping)

  if (mapping) then
    for k,v in pairs(mapping) do self.mapping[k] = v end
  end

  hs.hotkey.bind(self.mapping.left[1], self.mapping.left[2], function() self:left() end)
  hs.hotkey.bind(self.mapping.right[1], self.mapping.right[2], function() self:right() end)
  hs.hotkey.bind(self.mapping.up[1], self.mapping.up[2], function() self:up() end)
  hs.hotkey.bind(self.mapping.down[1], self.mapping.down[2], function() self:down() end)
  hs.hotkey.bind(self.mapping.upleft[1], self.mapping.upleft[2], function() self:upleft() end)
  hs.hotkey.bind(self.mapping.upright[1], self.mapping.upright[2], function() self:upright() end)
  hs.hotkey.bind(self.mapping.botleft[1], self.mapping.botleft[2], function() self:botleft() end)
  hs.hotkey.bind(self.mapping.botright[1], self.mapping.botright[2], function() self:botright() end)
  hs.hotkey.bind(self.mapping.maximum[1], self.mapping.maximum[2], function() self:maximum() end)
  hs.hotkey.bind(self.mapping.center[1], self.mapping.center[2], function() self:center() end)
  hs.hotkey.bind(self.mapping.nextScreen[1], self.mapping.nextScreen[2], function() self:nextScreen() end)
  hs.hotkey.bind(self.mapping.previousScreen[1], self.mapping.previousScreen[2], function() self:previousScreen() end)

  return self
end

return obj
