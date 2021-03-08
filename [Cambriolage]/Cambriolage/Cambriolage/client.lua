         --------------------Déclaration ESX--------------------
         ESX = nil

         Citizen.CreateThread(function()
             while ESX == nil do
                 TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
                 Citizen.Wait(100)
             end
         end)

        --------------------Création menu--------------------

        RMenu.Add("cambriolage", "script_main", RageUI.CreateMenu("Cambriolage","Voici la maison à cambrioler !!"))
        RMenu:Get("cambriolage", 'script_main').Closed = function()end
        print("^1 La ressource cambriolage c'est lancer")

        --------------------Création marker--------------------

    Citizen.CreateThread(function()
        while true do 
            local playerPed = PlayerPedId() 
            local interval = 1
            local pos = GetEntityCoords(PlayerPedId())
            local dest = vector3(1289.5472, -1710.999, 55.4746)
            local distance = GetDistanceBetweenCoords(pos, dest, true)

            if distance > 20 then 
                interval = 200
            else
                interval = 1
                DrawMarker(22, 1289.5472, -1710.999, 55.4746, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.3, 255, 0, 0, 170, 0, 1, 2, 0, nil, nil, 0)
                if distance < 1 then
                    AddTextEntry("HELP", "Appuyer sur ~INPUT_CONTEXT~ pour cambrioler la maison")
                    DisplayHelpTextThisFrame("HELP", false)
                    if IsControlPressed(1, 51) then
                        RageUI.Visible(RMenu:Get("cambriolage","script_main"), true)

                    end
                end
            end

            Citizen.Wait(interval)
        end
    end)

    Citizen.CreateThread(function()
        local cooldown = false
        while true do 

        RageUI.IsVisible(RMenu:Get("cambriolage","script_main"),true,true,true,function() 

         --   if IsControlJustPressed(1,177) then 
          --      DoScreenFadeOut(1000)
          --      Wait(300)
          --      DisplayRadar(true)
           --     DestroyCam(cam, true)
           --     RenderScriptCams(0, 0, 1, 1, 1)
           --     RageUI.CloseAll()
           --     Wait(300)
           --     DoScreenFadeIn(1000) 
            --end

            
            RageUI.ButtonWithStyle("Regarder la camera de la maison", nil, {RightLabel = ""}, not cooldown ,function(h,a,s)
                if s then
                  --  cam = CreateCam("DEFAULT_SCRIPTED_Camera", 1)	
                 --   SetCamCoord(cam, 117.5098, 553.9363, 184.227, 0.0, 0.0, 200.455696105957, 15.0, false, 0)
                 --   RenderScriptCams(1000, 1000, 1000, 1000, 1000)
                  --  PointCamAtCoord(cam, 117.5098, 553.9363, 184.227)   
                 --   SetCamFov(cam, 63.0)


                    DoScreenFadeOut(500)
                    Wait(7000)
                    DisplayRadar(true)
                    DestroyCam(cam, true)
                    RenderScriptCams(0, 0, 1, 1, 1)
                    RageUI.CloseAll()
                    Wait(500)
                    DoScreenFadeIn(1000) 
                    ESX.ShowAdvancedNotification("Cambriolage ", "~r~Cameras !","Y a personne dans la maison vous pouvez rentrer" , "CHAR_LESTER_DEATHWISH", 24,5)
            end
        end)
    

                RageUI.ButtonWithStyle("Cambrioler la maison", "Forcer la porte !", {RightLabel = ""}, not cooldown ,function(h,a,s)
                    if s then
                        RageUI.CloseAll()
                        cooldown = true
                        Citizen.SetTimeout(50000,function()
                        end)
                        SetEntityCoords(GetPlayerPed(-1),117.4625, 559.5997, 184.3048, false, false, false, true)
                        ESX.ShowAdvancedNotification("Cambriolage ", "~r~Cambriolage !","Commence le cambriolage fais attention a pas te faire chopper et ramène le plus d'agent possible" , "CHAR_LESTER_DEATHWISH", 24,5)
                    end
                end)


        end, function()end, 1)

            Citizen.Wait(0)
        end
    end)

        
    ----------cam-----------

--f-unction deletecam()
  --  DeleteEntity(Entity)
  --  RenderScriptCams(0, 0, 0,0,0)
 --   DestroyCam(cam, 0)
  --  localVeh = nil
  --  Entity = nil
  --  cam = nil
--end

        ------------------Local position RageUI.Text------------------------

    local position = {
        {x = 117.4528 , y = 559.6033, z = 184.29, },
        {x = 118.3787, y = 554.5212, z = 184.299},
        {x = 125.3459, y = 541.3634, z = 183.9246},
        {x = 114.5241, y = 568.4594, z = 176.697},
        {x = 119.1355, y = 544.5460, z = 183.89}
    }
        
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
     
            for k in pairs(position) do
    
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
    
                if dist <= 5.5 then

                   RageUI.Text({
                        message = "Temps restant : ~b~5 minute~s~ | La police arrive dans : ~r~7 minute~s~ | Faite vite et attention ",
                        time_display = 1
                    })
                end
            end
        end
    end)