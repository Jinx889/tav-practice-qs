-- Abigail Lopez
-- jumpQ.lua is meant to have a UI element that once selected takes to a menu where the goal is to press the Jump button

-- Load the LuaQT5 library
local qt5 = require("luaqt5")

-- Create a QWidget (UI container)
local ui = qt5.QWidget()

local config = {
    buttonText = "Jump", -- Button text
    buttonX = 50, 
    buttonY = 50, 
    buttonWidth = 80, 
    buttonHeight = 30,
    moveSpeed = 1, 
}

local function moveButton(button)
    local newX = button:getX() + config.moveSpeed
    -- Reverse direction if the button reaches the edge of the window
    if newX <= 0 or newX + config.buttonWidth >= g_window.getWidth() then
        config.moveSpeed = -config.moveSpeed
    end
    button:setPosition(newX, button:getY())
end

local function createButton(parentWidget)
    local button = createWidget("Button", parentWidget, nil, nil, nil, config.buttonText)
    button:setId("jumpButton")
    button:setSize(config.buttonWidth, config.buttonHeight)
    button:setPosition(config.buttonX, config.buttonY)
    button.onClick = function() moveButton(button) end
    button:show()
end

local function createMainWindow(player)
    local window = g_ui.createWidget('GameWindow', rootWidget)
    window:setText("Game Window")
    window:setWidth(400)
    window:setHeight(300)
    window:setPosition({x = 100, y = 100})

    local vBoxLayout = UIVerticalLayout.create(window)
    vBoxLayout:setSizePolicy(SizePolicy.Expanding, SizePolicy.Expanding)

    createButton(window)
end

function onLogin(player)
    displayInfoBox("Welcome", "Click OK to open the game window.", function()
        createMainWindow(player)
    end)
end
