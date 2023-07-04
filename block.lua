-- class used to handle block data and methods

-- create a class
local Block = {}
Block.__index = Block

-- function to create a new Block, which holds an X/Y coordinate
-- and some text that can be drawn
function Block.new()
    -- create a new instance of Block
    local self = setmetatable({}, Block)
    
    self.text = "test block 1234567890 asdfghjklzxcvbnm"
    self.x = 0
    self.y = 0
    self.font = love.graphics.newFont(9)
    
    -- create block texture
    self.spritesheet = love.graphics.newImage("assets/blk_mot_spr.png")
    self.left_part = love.graphics.newQuad(0, 0, 10, 16, self.spritesheet)
    self.middle_part = love.graphics.newQuad(0, 16, 1, 14, self.spritesheet)
    self.right_part = love.graphics.newQuad(0, 30, 5, 14, self.spritesheet)
    
    return self
end
 
function Block:draw()
    -- draw left block of part
    love.graphics.draw(self.spritesheet ,self.left_part, self.x, self.y)

    -- procedure to draw middle part of block
    -- this draws a 1 pixel-wide slice for every pixel the middle
    -- part occupies... a bit unoptimized, as stretching the texture
    -- to fit the given width should give the same result.
	local str = love.graphics.newText(self.font, self.text) -- create block string
	local str_i = str:add(self.text) -- get block string index
	local text_len = str:getWidth(str_i) -- text's length in pixels

	for i=0, text_len do -- loop through text pixel length
		love.graphics.draw(self.spritesheet, self.middle_part, self.x+10 + i, self.y)	-- draw middle part
	end

	love.graphics.draw(self.spritesheet, self.right_part, self.x+10 + text_len, self.y)	-- draw right part	
	love.graphics.draw(str, self.x + 2, self.y + 2) -- draw block string
end

return Block