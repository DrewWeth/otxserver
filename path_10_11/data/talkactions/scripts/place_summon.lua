function onSay(player, words, param)
	local isGmMode = getPlayerGroupId(cid) == 0
	if not player:getGroup():getAccess() and not isGmMode then
		return true
	end

	if not isGmMode then
		return false
	end

	local position = player:getPosition()
	local monster = Game.createMonster(param, position)
	if monster ~= nil then
		player:addSummon(monster)
		position:sendMagicEffect(CONST_ME_MAGIC_RED)
	else
		player:sendCancelMessage("There is not enough room.")
		position:sendMagicEffect(CONST_ME_POFF)
	end
	return false
end
