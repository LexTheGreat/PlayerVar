Players = {}
Player = {}
Player.__index = Player

setmetatable(Player, {
  __call = function (cls, ...)
    return cls.new(...)
  end,
})

function Player.new(PlayerName, PlayerID)
  local self = setmetatable({}, Player)
  self.Name = PlayerName
  self.Vars = {}
  self.Id = PlayerID
  return self
end

function Player:SetVar(Name, Value)
	self.Vars[Name] = Value
	TriggerEvent('PV:updatePlayer', self.Id, Name, Value)
end

function Player:GetVar(Name)
	return self.Vars[Name]
end

function Player:delete()
	Players[self.Id] = nil
end