local gmOutfit = {lookType = 75}
local groupIdStorageValue = 17293
local outfitStorageValue = 17294

function onSay(cid, words, param)
	local player = Player(cid)
	local position = player:getPosition()

	if ((player:hasCondition(CONDITION_INFIGHT) and not Tile(position):hasFlag(TILESTATE_PROTECTIONZONE)) or isPlayerPzLocked(cid)) then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You cannot change to GM mode while in combat.")
		return false
	end

	local playerGroupId = getPlayerGroupId(cid)
	local isGmMode = playerGroupId == 0

	if not isGmMode then
		setPlayerStorageValue(cid, groupIdStorageValue, playerGroupId)
		local currentLooktype = getCreatureOutfit(cid).lookType
		setPlayerStorageValue(cid, outfitStorageValue, currentLooktype)
		doCreatureChangeOutfit(cid, gmOutfit)
		setPlayerGroupId(cid, 0)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You are infused with the power of GM mode.")
		position:sendMagicEffect(7)
	else
		setPlayerGroupId(cid, getPlayerStorageValue(cid, groupIdStorageValue))
		local oldLookType = getPlayerStorageValue(cid, outfitStorageValue)
		doCreatureChangeOutfit(cid, {lookType = oldLookType})
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You feel normal again.")
		position:sendMagicEffect(67)
	end
	return false
end
