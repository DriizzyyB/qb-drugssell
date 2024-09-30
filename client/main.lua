-- File: qb-drugs/client/main.lua
local QBCore = exports['qb-core']:GetCoreObject()

local function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
    local scale = 0.35
    if onScreen then
        SetTextScale(scale, scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
        local factor = (string.len(text)) / 370
        DrawRect(_x, _y + 0.0150, 0.015 + factor, 0.03, 0, 0, 0, 75)
    end
end

local function ShowProgressBar(time, text)
    QBCore.Functions.Progressbar("drug_action", text, time, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent('drug_action_complete')
    end, function() -- Cancel
        TriggerEvent('QBCore:Notify', 'Cancelled', 'error')
    end)
end

RegisterNetEvent('drug_action_complete')
AddEventHandler('drug_action_complete', function()
    -- Placeholder for completion logic
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        for drug, data in pairs(Config.Drugs) do
            local farmLoc = data.locations.farm
            local processLoc = data.locations.process
            local sellLoc = data.locations.sell

            if farmLoc and #(pos - vector3(farmLoc.x, farmLoc.y, farmLoc.z)) < 1.5 then
                DrawText3D(farmLoc.x, farmLoc.y, farmLoc.z, '[E] Farm ' .. data.rawDisplayName)
                if IsControlJustPressed(0, 38) then
                    ShowProgressBar(5000, "Farming...")
                    Citizen.Wait(5000)
                    TriggerServerEvent('qb-drugs:server:Farm', drug)
                end
            end

            if processLoc and #(pos - vector3(processLoc.x, processLoc.y, processLoc.z)) < 1.5 then
                DrawText3D(processLoc.x, processLoc.y, processLoc.z, '[E] Process ' .. data.rawDisplayName)
                if IsControlJustPressed(0, 38) then
                    ShowProgressBar(5000, "Processing...")
                    Citizen.Wait(5000)
                    TriggerServerEvent('qb-drugs:server:Process', drug)
                end
            end

            if sellLoc and #(pos - vector3(sellLoc.x, sellLoc.y, sellLoc.z)) < 1.5 then
                DrawText3D(sellLoc.x, sellLoc.y, sellLoc.z, '[E] Sell ' .. data.displayName)
                if IsControlJustPressed(0, 38) then
                    ShowProgressBar(5000, "Selling...")
                    Citizen.Wait(5000)
                    TriggerServerEvent('qb-drugs:server:Sell', drug)
                end
            end
        end
    end
end)
