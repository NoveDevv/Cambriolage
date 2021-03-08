ESX = nil

local position = {
    {x = 781.1395,   y = 1274.7325,  z = 361.28 }, 
}

local MenuOpen = false

local Menu = {
    checkbox = false,
}

DecorRegister("Female", 4)
pedHash = "csb_g"
zone = vector3(781.1395, 1274.7325, 360.28)
Heading = 270.62
Ped = nil
HeadingSpawn = 1.62

Citizen.CreateThread(function()
    LoadModel(pedHash)
    Ped = CreatePed(2, GetHashKey(pedHash), zone, Heading, 0, 0)
    DecorSetInt(Ped, "Female", 5431)
    FreezeEntityPosition(Ped, 1)
    SetEntityInvincible(Ped, true)
    SetBlockingOfNonTemporaryEvents(Ped, 1)
end)

function LoadModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Wait(1)
    end
end

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
    end

RMenu.Add('Receleur', 'main', RageUI.CreateMenu("Receleur", "Voici le Receleur"))
RMenu:Get('Receleur', 'main').Closed = function()
    MenuOpen = false
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(position) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
            if dist <= 1.0 then

               RageUI.Text({
                    message = "Appuyez sur [~r~E~w~] pour parler à ~r~Receleur",
                    time_display = 100,
                })

                if IsControlJustPressed(1,51) then
                    openTourisme()
                    end
                end
            end
        end
    end)
end)

function openTourisme()
    if not MenuOpen then

        MenuOpen = true
        local cooldown = false

        RageUI.Visible(RMenu:Get('Receleur', 'main'), true)
        
    Citizen.CreateThread(function()
        while MenuOpen do
            Citizen.Wait(1)
        RageUI.IsVisible(RMenu:Get('Receleur', 'main'), true, true, true, function()

            RageUI.Separator("↓↓↓ Voici Le Receleur ilegal ↓↓↓")

            RageUI.ButtonWithStyle("Cambriolage Misérable", nil, {RightLabel = ""},true,function(h,a,s)
            if s then
            SetNewWaypoint(1289.5472, -1710.999, 55.4746)
            ESX.ShowAdvancedNotification("Receleur ", "~r~Receleur !","Voici l'emplacement de la misérable maison a cambrioler !" , "CHAR_LESTER_DEATHWISH", 24,5)
                end
            end)

            RageUI.ButtonWithStyle("Cambriolage intermédiaire", nil, {RightLabel = ""}, true,function(h,a,s)
            if s then
            SetNewWaypoint(-29.99, -1104.84, 26.41)
            ESX.ShowAdvancedNotification("Receleur ", "~r~Receleur !","Voici l'emplacement de la maison intermédiaire a cambrioler !" , "CHAR_LESTER_DEATHWISH", 24,5)
                end
            end)

            RageUI.ButtonWithStyle("Cambriolage luxueux", "Afin d'accéder a se cambriolage il vous faut plus d'exprerience, et aussi débloquer les cambriolages d'en haut !", {RightLabel = ""}, cooldown,function(h,a,s)
            if s then
              --  Citizen.SetTimeout(5000,function()
               --  cooldown = true
               -- end)
            SetNewWaypoint(215.8, -810.07, 30.73)
            ESX.ShowAdvancedNotification("Receleur ", "~r~Receleur !","Voici l'emplacement de la luxueuse maison a cambrioler !" , "CHAR_LESTER_DEATHWISH", 24,5)
                    end
                end)

    RageUI.Separator("↓↓↓ Outils pour cambrioler ↓↓↓")

    RageUI.ButtonWithStyle("Lampe Torche", nil, {RightLabel = "~g~200 $"}, true,function(h,a,s)
        if s then
            TriggerServerEvent('Lampe:BuyTorche')
        ESX.ShowAdvancedNotification("Receleur ", "~r~Receleur !","Ta acheter une lampe torche !" , "CHAR_LESTER_DEATHWISH", 24,5)
                end
            end)

    RageUI.ButtonWithStyle("Pied de biche", nil, {RightLabel = "~g~400 $"}, true,function(h,a,s)
        if s then
            TriggerServerEvent('Biche:BuyBiche')
        ESX.ShowAdvancedNotification("Receleur ", "~r~Receleur !","Ta acheter un pieds de biche !" , "CHAR_LESTER_DEATHWISH", 24,5)
                end
            end)
    RageUI.ButtonWithStyle("Hache", nil, {RightLabel = "~g~600 $"}, true,function(h,a,s)
        if s then
            TriggerServerEvent('Hache:BuyHache')
        ESX.ShowAdvancedNotification("Receleur ", "~r~Receleur !","Ta acheter une hache !" , "CHAR_LESTER_DEATHWISH", 24,5)
                end
            end)

            RageUI.ButtonWithStyle("Pack", "Ce pack contient une lampe torche, un pieds de biche, une hach, et un pistolet", {RightLabel = "~g~10 000 $"}, true,function(h,a,s)
                if s then
                    TriggerServerEvent('Pack:BuyPack')
                ESX.ShowAdvancedNotification("Receleur ", "~r~Receleur !","Ta acheter le pack !" , "CHAR_LESTER_DEATHWISH", 24,5)
            end
        end)
    end)
end

        end, function()
        end, 1)

        Citizen.Wait(0)
    end
end