-- File: qb-drugs/server/main.lua
QBCore = exports['qb-core']:GetCoreObject()

local function sendToDiscord(name, message, color)
    local embed = {
        {
            ["color"] = color,
            ["title"] = "**".. name .."**",
            ["description"] = message,
            ["footer"] = {
                ["text"] = os.date("%Y-%m-%d %H:%M:%S")
            }
        }
    }

    PerformHttpRequest(Config.DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({username = "Drug Log", embeds = embed}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent('qb-drugs:server:Farm')
AddEventHandler('qb-drugs:server:Farm', function(drugType)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Config.Drugs[drugType] then
        local amount = math.random(Config.Drugs[drugType].farmAmount.min, Config.Drugs[drugType].farmAmount.max)
        Player.Functions.AddItem(Config.Drugs[drugType].raw, amount)
        TriggerClientEvent('QBCore:Notify', src, 'You have collected ' .. amount .. ' ' .. Config.Drugs[drugType].rawDisplayName, 'success')

        -- Send to Discord
        sendToDiscord("Drug Farmed", "Player **"..GetPlayerName(src).."** has farmed **"..amount.." "..Config.Drugs[drugType].rawDisplayName.."**.", 3066993)
    end
end)

RegisterServerEvent('qb-drugs:server:Process')
AddEventHandler('qb-drugs:server:Process', function(drugType)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Config.Drugs[drugType] then
        local rawItem = Player.Functions.GetItemByName(Config.Drugs[drugType].raw)
        if rawItem and rawItem.amount >= 1 then
            local processAmount = math.random(Config.Drugs[drugType].processAmount.min, Config.Drugs[drugType].processAmount.max)
            local actualProcessAmount = math.min(rawItem.amount, processAmount) -- Ensure we do not process more than we have
            Player.Functions.RemoveItem(Config.Drugs[drugType].raw, actualProcessAmount)
            Player.Functions.AddItem(Config.Drugs[drugType].processed, actualProcessAmount)
            TriggerClientEvent('QBCore:Notify', src, 'You have processed ' .. actualProcessAmount .. ' ' .. Config.Drugs[drugType].rawDisplayName .. ' into ' .. Config.Drugs[drugType].displayName, 'success')

            -- Send to Discord
            sendToDiscord("Drug Processed", "Player **"..GetPlayerName(src).."** has processed **"..actualProcessAmount.." "..Config.Drugs[drugType].rawDisplayName.."** into **"..Config.Drugs[drugType].displayName.."**.", 3066993)
        else
            TriggerClientEvent('QBCore:Notify', src, 'You don\'t have enough raw materials', 'error')
        end
    end
end)

RegisterServerEvent('qb-drugs:server:Sell')
AddEventHandler('qb-drugs:server:Sell', function(drugType)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Config.Drugs[drugType] then
        local processedItem = Player.Functions.GetItemByName(Config.Drugs[drugType].processed)
        if processedItem and processedItem.amount >= 1 then
            local sellAmount = math.random(Config.Drugs[drugType].sellAmount.min, Config.Drugs[drugType].sellAmount.max)
            local actualSellAmount = math.min(processedItem.amount, sellAmount) -- Ensure we do not sell more than we have
            local totalPrice = 0
            for i = 1, actualSellAmount do
                totalPrice = totalPrice + math.random(Config.Drugs[drugType].price.min, Config.Drugs[drugType].price.max)
            end
            Player.Functions.RemoveItem(Config.Drugs[drugType].processed, actualSellAmount)
            Player.Functions.AddMoney('cash', totalPrice) -- Add regular cash
            TriggerClientEvent('QBCore:Notify', src, 'You have sold ' .. actualSellAmount .. ' ' .. Config.Drugs[drugType].displayName .. ' for $' .. totalPrice, 'success')

            -- Send to Discord
            sendToDiscord("Drug Sold", "Player **"..GetPlayerName(src).."** has sold **"..actualSellAmount.." "..Config.Drugs[drugType].displayName.."** for **$"..totalPrice.."**.", 3066993)
        else
            TriggerClientEvent('QBCore:Notify', src, 'You don\'t have any ' .. Config.Drugs[drugType].displayName, 'error')
        end
    end
end)
