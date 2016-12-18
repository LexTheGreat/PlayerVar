-- Players[] from Player.lua

AddEventHandler('playerActivated', function()
    Players[source] = Player(GetPlayerName(source), source)
	TriggerEvent('PV:playerAdded', Players[source])
end)

AddEventHandler('playerDropped', function(reason)
    Players[source] = nil
	TriggerEvent('PV:playerRemoved', source)
end)

RegisterServerEvent("PV:RequestPlayers")
AddEventHandler('PV:RequestPlayers', function()
	TriggerEvent('PV:playerListUpdate', Players)
end)

function getPlayerByName(name)
	for i, v in pairs(Players) do
		if v.Name == name then
			return v.Id
		end
	end
	return false
end

function Count(t)
	count = 0
	for k,v in pairs(t) do
		 count = count + 1
	end
	
	return count
end

function AllPlayers()
	local pls = {}
	-- GetPlayerServerId(i)
    for i = 0, 31 do
        if (GetPlayerName(i) ~= nil) then
            table.insert(pls, i)
        end
    end
    return pls
end

-- GetPlayers() Is broken duck me
local ptable = AllPlayers()
for i,v in pairs(ptable) do
	Players[i] = Player(GetPlayerName(v), v)
	print("[PV] Adding " .. Players[i].Name .. " with ID " .. Players[i].Id)
end