ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 60 then
        CreateThread(function()
            Wait(57000)
            print("3 seconds before restart... saving all players!")
            ESX.SavePlayers()
        end)
    end
end)