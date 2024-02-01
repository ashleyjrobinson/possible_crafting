local config = require('shared.config')
local QBCore = exports['qb-core']:GetCoreObject()

-- Function to get the players crafting level from their metadata
local function getPlayerCraftingLevel(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local craftingrep = Player.PlayerData.metadata["craftingrep"]
    if config.Debug then
        print("Crafting Level:", craftingrep)
    end
    return craftingrep or 0
end

-- Fucntion to handle registering the crafting hook for each item defined in the config
local function registerCraftingHook(config)
    return exports.ox_inventory:registerHook('craftItem', function(payload)
        local src = payload.source
        local Player = QBCore.Functions.GetPlayer(src)
        local playerCraftingLevel = getPlayerCraftingLevel(src)
        local requiredCraftingLevel = config.requiredCraftingLevel
        local addCraftingXP = config.addCraftingXP

        local dataRequired = {
            title = 'Crafting Requirement',
            description = string.format('You do not have the required crafting level (%d) to craft this item.', requiredCraftingLevel / 10),
            type = 'error',
            position = 'top',
            icon = 'hammer'
        }
        local dataLevelMet = {
            title = 'Crafting Experience',
            description = string.format('You earned (%d) crafting experience.', addCraftingXP),
            type = 'success',
            position = 'top',
            icon = 'hammer'
        }
        
        if playerCraftingLevel < requiredCraftingLevel then
            if config.Debug then
                print("Crafting level requirement not met. Item cannot be crafted.")
            end
            TriggerClientEvent('ox_lib:notify', src, dataRequired)
            return false
        end

        Player.Functions.SetMetaData("craftingrep", playerCraftingLevel + addCraftingXP)
        TriggerClientEvent('ox_lib:notify', src, dataLevelMet)

        return true
    end, {
        print = true,
        itemFilter = config.itemFilter,
    })
end

-- loop through the config to create a crafting hook for each item
for _, craftingItem in ipairs(config.CraftingItems) do
    registerCraftingHook(craftingItem)
end