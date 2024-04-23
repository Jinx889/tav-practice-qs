-- The code that would summon windstorms on the chat word 'frigo' (in a server)
-- The variable 'player' is the player that issued the spell.

function spellCast(player)
    -- Function to cast the windstorm spell
    game:setSpell("windstorm")
end

function onChatMessage(player, message)
    -- Function to handle chat messages
    if message == "frigo" then
        -- If the message is "frigo", cast the windstorm spell around the player
        spellCast(player)
    end
end

-- Assuming game is a global object representing the player
local player = game -- Assuming game represents the player object

-- Define the positions of the triangles around the player
local triangle = {x=player.x+1, y=player.y-1}
local triangle2 = {x=player.x-1, y=player.y+1}
local triangle3 = {x=player.x-1, y=player.y-1}

-- Call the function to set the spell initially
spellCast(player)
