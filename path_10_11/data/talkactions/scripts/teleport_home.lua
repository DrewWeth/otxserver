function onSay(player, words, param)
	local isGmMode = getPlayerGroupId(cid) == 0
	if not player:getGroup():getAccess() and not isGmMode then
		return true
	end

	player:teleportTo(player:getTown():getTemplePosition())
	return false
end
