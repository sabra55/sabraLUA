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
    love.graphics.setFont(self.font) -- set active part
	local text_len = self.font:getWidth(self.text) -- text's length in pixels

    -- draw the middle part stretched to fit the text
    love.graphics.draw(
        self.spritesheet, self.middle_part,
        self.x + 10, self.y,
        0, text_len * 1, 1 -- orientation, scalex, scaley
    )

	love.graphics.draw(self.spritesheet, self.right_part, self.x+10 + text_len, self.y)	-- draw right part	
	love.graphics.print(self.text, self.x + 2, self.y + 2) -- draw block text
end

return Block