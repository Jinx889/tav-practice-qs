--Q1 Combined releaseStorage and onLogout as releaseStorage was declared as a local function.
--Made some Syntax changes based off of best practices.
function onLogout(player)
    local function releaseStorage(player)
        player:setStorageValue(1000, -1)
    end
    if player:getStorageValue(1000) == 1 
        then addEvent(releaseStorage, 1000, player)
        return true
    end
end

--Q2 Removed the String Concatenate and created a for loop to iterate and print through the guild list
function printSmallGuildNames(memberCount)
    -- this method is supposed to print names of all guilds that have less than memberCount max members
    local selectguildquery = "SELECT name FROM guilds WHERE max_members < %d AND NOT IN (SELECT name FROM guilds WHERE max_members = %d);"
    local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))
    local guildName = result.getString("name")
    for i in ipairs(result) do
        print(i.guildName)
    end  
end

--Q3 Changed the loop for efficency purposes, changed the name to removeSamePlayerName and the membername variable to memberName in all instances
function removeSamePlayerName (playerId, memberName)
    player = Player(playerId)
    local party = player:getParty()
    
    for i, member in pairs(party:getMembers()) do
        if member == Player(memberName) then
            party:removeMember(member)
        end
    end
end

