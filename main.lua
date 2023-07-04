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
	tbs1 = "test block 1234567890 asdfghjklzxcvbnm"			-- text to be displayed on the test block
	mss = love.graphics.newImage("assets/blk_mot_spr.png")	-- motion block spritesheet. temporary, will be updated to be hue-able later.
	lpartblock = love.graphics.newQuad(0,0,10,16,mss)		-- left part
	mpartblock = love.graphics.newQuad(0,16,1,14,mss)		-- middle part (for scaling, so that the text won't go outside the block)
	rpartblock = love.graphics.newQuad(0,30,5,14,mss)		-- right part
	blf = love.graphics.newFont(9)							-- block's font
	bx, by = nil											-- block's position
end

-------------------------------------------------------------
-- FUNCTION drawblock( x , y , text )
-- a nonefficient way to draw a block
-- x - x position to draw the block in
-- y - y position to draw the block in
-- text - text to display on the block
-------------------------------------------------------------
function drawblock(x,y,text)
	love.graphics.draw(mss,lpartblock,x,y)		-- draw block's left part
	bst = love.graphics.newText(blf,text)		-- create block string
	bsi = bst:add(text)							-- get block string index
	tl = bst:getWidth(bsi)						-- text's length in pixels
	for i = 0,tl,1 do							-- loop through text pixel length
		love.graphics.draw(mss,mpartblock,x+10+i,y)	-- draw middle part
	end
	love.graphics.draw(mss,rpartblock,x+10+tl,y)	-- draw right part	
	love.graphics.draw(bst,x+2,y+2)				-- draw block string
end

function love.draw()
	--love.graphics.print(v,50,50) --old code
	love.graphics.clear(0.95,0.98,0.9,0)		-- refresh screen
	bx,by = love.mouse.getPosition()			-- get mouse position and make the block go there
	drawblock(bx,by,tbs1)						-- draw block at (X: bx Y: by) with the text (tbs1)
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