         --------------------Déclaration ESX--------------------
         ESX = nil

         Citizen.CreateThread(function()
             while ESX == nil do
                 TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
                 Citizen.Wait(0)
             end
            end)

        --------------------Création menu--------------------

        RMenu.Add("pc", "script_main", RageUI.CreateMenu("Cambriolage","Prendre le pc !!"))
        RMenu:Get("pc", 'script_main').Closed = function()end

        --------------------Création marker--------------------

    Citizen.CreateThread(function()
        while true do 
            local interval = 1
            local pos = GetEntityCoords(PlayerPedId())
            local dest = vector3(114.743, 569.1204, 176.6999)
            local distance = GetDistanceBetweenCoords(pos, dest, true)

            if distance > 20 then 
                interval = 200
            else
                interval = 1
                DrawMarker(22, 114.743, 569.1204, 176.6999, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 0, 0, 170, 0, 1, 2, 0, nil, nil, 0)
                if distance < 1 then
                    AddTextEntry("HELP", "Appuyer sur ~INPUT_CONTEXT~ pour recupere l'objet")
                    DisplayHelpTextThisFrame("HELP", false)
                    if IsControlPressed(1, 51) then
                        RageUI.Visible(RMenu:Get("pc","script_main"), true)

                    end
                end
            end

            Citizen.Wait(interval)
        end
    end)

    Citizen.CreateThread(function()
        local cooldown = false
        while true do 

        RageUI.IsVisible(RMenu:Get("pc","script_main"),true,true,true,function() 

            RageUI.ButtonWithStyle("Prendre l'objet", nil, {RightLabel = "Récompense : ~g~2000$"}, not cooldown,function(h,a,s)
                if s then
                    cooldown = true
                   Citizen.SetTimeout(20000,function()
                    cooldown = false
                   end)
                    FreezeEntityPosition(PlayerPedId(), true)
                    Citizen.SetTimeout(10000,function()
                        FreezeEntityPosition(PlayerPedId(), false)
                       end)
                    TriggerServerEvent("Pc:buyPc")
                    SetEntityCoordsNoOffset(playerPed, -103.8, -921.06, 287.29, false, false, false, true)
                    ESX.ShowAdvancedNotification("Cambriolage ", "~r~Cambriolage !","Gg tu a recupere ~g~2000 $~s~, continue comme sa !" , "CHAR_LESTER_DEATHWISH", 24,5)
                end
            end)

        end, function()end, 1)

            Citizen.Wait(0)
        end
    end)