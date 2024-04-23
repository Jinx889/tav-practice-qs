--flashQ

local image = game:NewImage()
image:Draw(Player.spriteID)

local surface = Surface:newSurface() -- Creating a new surface object
image:copyToSurface(surface) 

image:setAlpha(0.1) 

function redraw()
    surface:draw(image) 
end

local redrawer = newQTimer(1000/25) -- Creating a QTimer object with a timeout of 40ms (25 FPS)
redrawer:connect("timer", redraw) 
redrawer:start() 

-- Increase player's movement speed by 20 over default speed
local player = getPlayer()
local defaultSpeed = player:getSpeed()
local increaseSpeed = defaultSpeed + 20
player:SetMoveSpeed(increaseSpeed)
