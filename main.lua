-- main sabraLUA code file
-- created 30 june 2023			sabra55/luna
-- last updated 04 july 2023	sabra55/luna

-- this piece of code is to get a lua debugger to work
-- if you do not have the vscode local lua debugger
-- extension installed, this shouldn't affect anything
if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
	require("lldebugger").start()

	-- for some reason, assertion errors point to a lldebugger internal file
	-- so i'm redefining assert to fix that
	function assert(a, b)
		return a or error(b or "assertion failed!", 2)
	end
end

local Block = require("block")
local block = Block.new() -- create a new block

function love.load()
	--[[fmstring = "File"
	omstring = "Options"
	hmstring = "Help"
	f1string = "File menu item 1"
	f2string = "File menu item 2"
	f3string = "File menu item 3"
	o1string = "Opts menu item 1"
	o2string = "Opts menu item 2"
	o3string = "Opts menu item 3"
	h1string = "Help menu item 1"
	h2string = "Help menu item 2"
	h3string = "Help menu item 3"]] --old code
end

function love.draw()
	--love.graphics.print(v,50,50) --old code
	love.graphics.clear(0.95, 0.98, 0.9, 0) -- refresh screen
	block.x, block.y = love.mouse.getPosition() -- get mouse position and make the block go there
	block:draw() -- draw the block at its new position
end

--[[function randstr()
	x = math.random(0,11)
	if x == 0 then
		v=fmstring
	elseif x == 1 then
		v=omstring
	elseif x == 2 then
		v=hmstring
	elseif x == 3 then
		v=f1string
	elseif x == 4 then
		v=f2string
	elseif x == 5 then
		v=f3string
	elseif x == 6 then
		v=o1string
	elseif x == 7 then
		v=o2string
	elseif x == 8 then
		v=o3string
	elseif x == 9 then
		v=h1string
	elseif x == 10 then
		v=h2string
	elseif x == 11 then
		v=h3string
	else
		v="it should not be possible to receive this error."
	end
end ]] --old code

function love.update(dt)
	-- randstr() --old code
end

--[[function love.keyreleased(key, scancode)
	if key == "r" then
		love.graphics.print(v)
	else
		love.graphics.print("press R to refresh.")
	end
end]] --old code