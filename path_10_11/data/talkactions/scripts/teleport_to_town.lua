function onSay(player, words, param)
	local isGmMode = getPlayerGroupId(cid) == 0
	if not player:getGroup():getAccess() and not isGmMode then
		return true
	end

	local town = Town(param)
	if town == nil then
		player:sendCancelMessage("Town not found.")
		return false
	end

	player:teleportTo(town:getTemplePosition())
	return false
end
