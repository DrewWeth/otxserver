function onSay(player, words, param)
	local isGmMode = player:getGroup():getId() == 0
	if not player:getGroup():getAccess() and not isGmMode then
		return true
	end

	if not isGmMode then
		return false
	end

	local position = player:getPosition()
	local monster = Game.createMonster(param, position)
	if monster ~= nil then
		if monster:getType():isRewardBoss() then
			monster:setReward(true)
		end
		monster:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		position:sendMagicEffect(CONST_ME_MAGIC_RED)
	else
		player:sendCancelMessage("There is not enough room.")
		position:sendMagicEffect(CONST_ME_POFF)
	end
	return false
end
