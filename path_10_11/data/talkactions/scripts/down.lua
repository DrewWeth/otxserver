function onSay(player, words, param)
	local isGmMode = player:getGroup():getId() == 0
	if not player:getGroup():getAccess() and not isGmMode then
		return true
	end

	local position = player:getPosition()
	position.z = position.z + 1
	player:teleportTo(position)
	return false
end
