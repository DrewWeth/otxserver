function onSay(cid, words, param)
	local player = Player(cid)
	local position = player:getPosition()


	if not player:getGroup():getAccess() then
		return true
	end

	if ((player:hasCondition(CONDITION_INFIGHT) and not Tile(position):hasFlag(TILESTATE_PROTECTIONZONE)) or isPlayerPzLocked(cid)) then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You cannot ghost while in combat.")
		return false
	end

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
