# sabraLUA
my code repository for sabraLUA https://scratch.mit.edu/discuss/topic/693608/

### requires LÖVE2D 0.10.0 or above!

contributours: sabra55 (creatour), pkhead

assets\blk_mot_spr.png - short for "block Motion spritesheet". temporary, will replace with a white version (for hueing) after the blocks are fully implemented.

build.bat - opens a LÖVE2D window with main.lua running

main.lua - main code

blocks.lua - block drawing (pkhead)

changelog:

version 0.2 (pkhead) (6 july 2023):
* made red border around every block (why?)
* now able to spawn new blocks by clicking right mouse button
* made a new block class
* split blocks code from main.lua
* now able to drag blocks, but don't follow around the mouse by default

version 0.1 (4 july 2023):
* added drawblock function
* made the window refresh itself
* changed background to a white-ish colour
* made the block draw itself in the same position as the mouse cursour

functionality: when a window is opened there will be a block called "test block 1234567890 asdfghjklzxcvbnm" that will follow the mouse cursour around.

functions:

drawblock( x , y , text ):

a nonefficient way to draw a block

x - x position to draw the block in

y - y position to draw the block in

text - text to display on the block
