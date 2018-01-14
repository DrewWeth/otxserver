function onSay(player, words, param)
	local isGmMode = player:getGroup():getId() == 0
	if not player:getGroup():getAccess() and not isGmMode then
		return true
	end

	local target = Creature(param)
	if target == nil then
		player:sendCancelMessage("Creature not found.")
		return false
	end

	player:teleportTo(target:getPosition())
	return false
end
