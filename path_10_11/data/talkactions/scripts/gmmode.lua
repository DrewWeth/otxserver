local gmOutfit = {lookType = 75, lookHead = 10, lookLegs = 10, lookBody = 10, lookFeet = 10, lookAddons = 0}
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
		setPlayerStorageValue(cid, outfitStorageValue, getCreatureOutfit(cid))
		doCreatureChangeOutfit(cid, gmOutfit)
		setPlayerGroupId(cid, 0)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You are infused with the power of GM mode.")
		position:sendMagicEffect(7)
	else
		setPlayerGroupId(cid, getPlayerStorageValue(cid, groupIdStorageValue))
		doCreatureChangeOutfit(cid, getPlayerStorageValue(cid, outfitStorageValue))
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You feel normal again.")
		position:sendMagicEffect(67)
	end
	return false
end
