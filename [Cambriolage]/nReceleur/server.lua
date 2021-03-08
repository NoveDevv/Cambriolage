ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('Lampe:BuyTorche')
AddEventHandler('Lampe:BuyTorche', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 200
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addWeapon('weapon_flashlight', 10)
    end  
end)

RegisterNetEvent('Biche:BuyBiche')
AddEventHandler('Biche:BuyBiche', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 400
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addWeapon('weapon_crowbar', 10)
    end  
end)

RegisterNetEvent('Hache:BuyHache')
AddEventHandler('Hache:BuyHache', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 600
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addWeapon('weapon_hatchet', 10)
    end  
end)

RegisterNetEvent('Pack:BuyPack')
AddEventHandler('Pack:BuyPack', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 10000
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addWeapon('weapon_flashlight', 10) 
        xPlayer.addWeapon('weapon_hatchet', 10)
        xPlayer.addWeapon('weapon_crowbar', 10)
        xPlayer.addWeapon('weapon_pistol', 10)
    end  
end)