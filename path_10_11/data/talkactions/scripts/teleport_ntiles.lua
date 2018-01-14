function onSay(player, words, param)
	local isGmMode = getPlayerGroupId(cid) == 0
	player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("isGmMode: %s", isGmMode))
	if not player:getGroup():getAccess() and not isGmMode then
		return true
	end

	local steps = tonumber(param)
	if not steps then
		return false
	end

	local position = player:getPosition()
	position:getNextPosition(player:getDirection(), steps)

	position = player:getClosestFreePosition(position, false)
	if position.x == 0 then
		player:sendCancelMessage("You cannot teleport there.")
		return false
	end

	player:teleportTo(position)
	return false
end
