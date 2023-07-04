-- main sabraLUA code file
-- created 30 june 2023			sabra55/luna
-- last updated 30 june 2023	sabra55/luna

function love.load()
	fmstring = "File"
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
	h3string = "Help menu item 3"
end

function love.draw()
	love.graphics.print(v,50,50)
end

function randstr()
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
end

function love.update(dt)
	randstr()
end

function love.keyreleased(key, scancode)
	if key == "r" then
		love.graphics.print(v)
	else
		love.graphics.print("press R to refresh.")
	end
end