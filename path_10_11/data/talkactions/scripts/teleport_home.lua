function onSay(player, words, param)
	local isGmMode = player:getGroup():getId() == 0
	if not player:getGroup():getAccess() and not isGmMode then
		return true
	end

	player:teleportTo(player:getTown():getTemplePosition())
	return false
end
