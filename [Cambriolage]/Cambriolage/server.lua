ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('Livre:buyLivre')
AddEventHandler('Livre:buyLivre', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.addMoney(50)
    end  
end)


RegisterNetEvent('Pc:buyPc')
AddEventHandler('Pc:buyPc', function() 

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.addMoney(2000)
    end  
end)

RegisterNetEvent('Tele:buyTele')
AddEventHandler('Tele:buyTele', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.addMoney(5000)
    end  
end)

RegisterNetEvent('Telescope:buyTelescope')
AddEventHandler('Telescope:buyTelescope', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.addMoney(700)
    end  
end)

RegisterNetEvent('Vase:buyVase')
AddEventHandler('Vase:buyVase', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.addMoney(200)
    end  
end)