-- Modifier shortcuts
local cmd_ctrl = {"ctrl", "cmd"}

-- Reload (auto) hotkey script
hs.hotkey.bind(cmd_ctrl, "a", function()
  hs.reload()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 10
  win:setFrame(f)
end)

-- Don't perform animations when resizing
hs.window.animationDuration = 0

-- Get list of screens and refresh that list whenever screens are plugged or
-- unplugged i.e initiate watcher
local screens = hs.screen.allScreens()
local screenwatcher = hs.screen.watcher.new(function()
                                                screens = hs.screen.allScreens()
                                            end)
screenwatcher:start()
-- }}}
-- Window handling {{{
-- Resize window for chunk of screen (this deprecates Spectable)
-- For x and y: use 0 to expand fully in that dimension, 0.5 to expand halfway
-- For w and h: use 1 for full, 0.5 for half
function resize_win(x, y, w, h)
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()
	f.x = max.x + (max.w * x)
	f.y = max.y + (max.h * y)
	f.w = max.w * w
	f.h = max.h * h
	win:setFrame(f)
end

hs.hotkey.bind({"cmd"}, "1", function()
  resize_win(0, 0, 0.5, 1) 
end) -- left
hs.hotkey.bind({"cmd"}, "2", function()
  resize_win(0.5, 0, 0.5, 1)
end) -- right
hs.hotkey.bind({"cmd"}, "3", function()
  resize_win(0,0,1,1)
end) -- full
hs.hotkey.bind({"cmd"}, "4", function()
  resize_win(0,0,1,0.5) 
end) -- top
hs.hotkey.bind({"cmd"}, "5", function()
  resize_win(0,0.5,1,0.5)
end) -- bottom
hs.hotkey.bind({"cmd"}, "6", function()
                resize_win(0,0,0.5,0.5) end) -- Top left quarter
hs.hotkey.bind({"cmd"}, "7", function()
                resize_win(0,0.5,0.5,0.5) end) -- Bottom left quarter
hs.hotkey.bind({"cmd"}, "8", function()
                resize_win(0.5,0,0.5,0.5) end) -- Top right quarter
hs.hotkey.bind({"cmd"}, "9", function()
                resize_win(0.5,0.5,0.5,0.5) end) -- Bottom right quarter
hs.hotkey.bind(cmd_ctrl, "5", function()
                resize_win(0.25,0.25,0.5,0.5) end) -- Center
