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

	-- override the error handler to break and debug the program at
	-- the location the error occured
	function love.errorhandler(msg)
		error(msg, 2)
	end
end

local Block = require("block")
local blocks = {} -- list of all blocks
table.insert(blocks, Block.new(20, 20)) -- create a new block

-- variables used for block dragging state
-- currently, there is only one block, so this could
-- be represented as a boolean. but obviously in the future,
-- there will be more than one block
local dragged_block = nil -- the block that is currently being dragged

-- the following two variables are only valid if dragged_block
-- is not equal to nil
local block_drag_x = 0 -- the mouse X offset from the origin of dragged_block
local block_drag_y = 0 -- the Y offset

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

-- font for drawing help that (that should
-- be removed later)
local font_12px = love.graphics.newFont(12)
function love.draw()
	--love.graphics.print(v,50,50) --old code
	love.graphics.clear(0.95, 0.98, 0.9, 0) -- refresh screen

	-- draw help text
	love.graphics.setColor(0, 0, 0)
	love.graphics.setFont(font_12px)
	love.graphics.print("press rmb to create a new block", 1, 1)

	-- draw all blocks
	for _, block in ipairs(blocks) do
		block:draw()
	end
end

function love.update()
	local mx, my = love.mouse.getPosition() -- get mouse position

	-- if user is currently dragging a block, update
	-- the position to the mouse
	if dragged_block then
		dragged_block.x = mx - block_drag_x
		dragged_block.y = my - block_drag_y
	end
end

function love.mousepressed(mx, my, button)
	-- if left mouse button was pressed
	if button == 1 then
		-- if mouse is hovering over a block, begin drag
		-- iterate through array backwards, as the block
		-- that is situated later in the array is the
		-- block that is rendered in front
		for i=#blocks, 1, -1 do
			local block = blocks[i]

			if block:is_intersecting_point(mx, my) then
				-- found a block under the user's cursor
				dragged_block = block
				block_drag_x = mx - block.x
				block_drag_y = my - block.y

				-- move block to the end of the blocks array
				-- so that it gets rendered in front
				table.remove(blocks, i)
				table.insert(blocks, dragged_block)
				break
			end
		end
	
	-- right mouse button pressed, so create a new block at mouse position
	elseif button == 2 then
		table.insert(blocks, Block.new(mx, my))
	end
end

function love.mousereleased(mx, my, button)
	-- if lmb was pressed
	if button == 1 then
		-- end the current drag
		-- if there is no drag, dragged_block
		-- is already nil so this has no effect
		if dragged_block then
			dragged_block = nil
		end
	end
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

--[[function love.keyreleased(key, scancode)
	if key == "r" then
		love.graphics.print(v)
	else
		love.graphics.print("press R to refresh.")
	end
end]] --old code