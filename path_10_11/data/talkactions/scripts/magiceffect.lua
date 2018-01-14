function onSay(player, words, param)
	local isGmMode = player:getGroup():getId() == 0
	if not player:getGroup():getAccess() and not isGmMode then
		return true
	end

	player:getPosition():sendMagicEffect(tonumber(param))
	return false
end
