local ox_inventory = exports.ox_inventory

RegisterNetEvent('moneywash:washAmount', function(Amount)
    local src = source
    local Percentage = Amount * Config.Percentage
    local Total = Amount - Percentage
    local black_money = ox_inventory:Search(src, 'count','black_money')

    if black_money >= Amount then
        ox_inventory:RemoveItem(src, 'black_money', Amount)
        TriggerClientEvent('moneywash:startWashing', src)
        Wait(Config.WashDuration)
        ox_inventory:AddItem(src, 'money', Total)
    else
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Перачев',
            description = 'Нямате достатъчно маркирани пари!', 
            position = 'center-left',
            type = 'error'
        })
    end
end)
