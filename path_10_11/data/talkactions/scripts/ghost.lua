function onSay(cid, words, param)
	local player = Player(cid)
	
	player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("Value: %s", player:hasCondition(CONDITION_INFIGHT)))
	if ((player:hasCondition(CONDITION_INFIGHT) and not Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE)) or isPlayerPzLocked(cid)) then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You cannot ghost while in combat.")
		return false
	end

	local position = player:getPosition()
	local isGhost = not player:isInGhostMode()

	player:setGhostMode(isGhost)
	if isGhost then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You are now invisible.")
		position:sendMagicEffect(7)
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You are visible again.")
		-- position.x = position.x + 1
		position:sendMagicEffect(67)
	end
	return false
end
