-------------------------
--- BadgerBankRobbery ---
-------------------------
NDCore = exports["ND_Core"]:GetCoreObject()

RegisterNetEvent("BadgerBankRobbery:GiveRewardBank")
AddEventHandler("BadgerBankRobbery:GiveRewardBank", function(player)
	local player = source
	NDCore.Functions.AddMoney(config.payoutBanks, player, "cash")
end)

RegisterNetEvent("BadgerBankRobbery:GiveRewardAmmo")
AddEventHandler("BadgerBankRobbery:GiveRewardAmmo", function(player)
	local player = source
	NDCore.Functions.AddMoney(config.payoutAmmunations, player, "cash")
end)

RegisterNetEvent("BadgerBankRobbery:GiveRewardLTD")
AddEventHandler("BadgerBankRobbery:GiveRewardLTD", function(player)
	local player = source
	NDCore.Functions.AddMoney(config.payoutGasStations, player, "cash")
end)

RegisterNetEvent("BadgerBankRobbery:GiveReward247")
AddEventHandler("BadgerBankRobbery:GiveReward247", function(player)
	local player = source
	NDCore.Functions.AddMoney(config.payout247, player, "cash")
end)

RegisterNetEvent("BadgerBankRobbery:GiveRewardLiq")
AddEventHandler("BadgerBankRobbery:GiveRewardLiq", function(player)
	local player = source
	NDCore.Functions.AddMoney(config.payoutLiquor, player, "cash")
end)

--- Server ---
robberyActive = false
RegisterNetEvent('BadgerBankRobbery:IsActive')
AddEventHandler('BadgerBankRobbery:IsActive', function()
	-- Check if active or not
	if robberyActive then
		-- One is active
		TriggerClientEvent('BadgerBankRobbery:IsActive:Return', source, true)
	else
		-- One is not active
		TriggerClientEvent('BadgerBankRobbery:IsActive:Return', source, false)
	end
end)

RegisterNetEvent('BadgerBankRobbery:SetActive')
AddEventHandler('BadgerBankRobbery:SetActive', function(bool)
	robberyActive = bool
	if bool then
		Wait((1000 * 60 * config.robberyCooldown)) -- Wait 15 minutes
		robberyActive = false
	end
end)

RegisterNetEvent('Print:PrintDebug')
AddEventHandler('Print:PrintDebug', function(msg)
	print(msg)
	TriggerClientEvent('chatMessage', -1, "^7[^1Badger's Scripts^7] ^1DEBUG ^7" .. msg)
end)
RegisterNetEvent('PrintBR:PrintMessage')
AddEventHandler('PrintBR:PrintMessage', function(msg)
	TriggerClientEvent('chatMessage', -1, msg)
end)