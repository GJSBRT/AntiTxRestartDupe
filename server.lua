ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 60 then
        CreateThread(function()

            Wait(57000) -- Wainting till the final 3 seconeds before restart 

            -- Sends message to console and saves all players
            print("3 seconds before restart... saving and kicking all players!")
            ESX.SavePlayers()

            Wait(2000) -- Waiting for all players to finish saving

            -- Kicks everyone from the server
            for i=1, #xPlayers, 1 do
                local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
                xPlayer.kick("The server is restarting, come back later.")
            end
        end)
    end
end)