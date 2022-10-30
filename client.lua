local isHudVisible= false

Citizen.CreateThread(function()
    while true do
        Wait(1)
        if not IsPauseMenuActive() then
            if not isHudVisible then
                isHudVisible = true
                SendNUIMessage({display = true})
                SendNUIMessage({id = GetPlayerServerId(PlayerId())})
            end
        else
            if isHudVisible then
                isHudVisible = false
                SendNUIMessage({display = false})
            end
        end
    end
end)

RegisterCommand("fixwatermark", function(src,args,raw) 
    local p = PlayerId()
    local sId = GetPlayerServerId(p)
    
    isHudVisible = true
    SendNUIMessage({display = true})
    SendNUIMessage({id = sId})
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerData)
    CreateThread(function()
        while true do
            SendNUIMessage({id = GetPlayerServerId(PlayerId())})
            if playerId ~= 0 then return end

            Citizen.Wait(500)
        end

        SendNUIMessage({display = true})
        isHudVisible = true
    end)
end)