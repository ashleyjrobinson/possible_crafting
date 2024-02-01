return {
    Debug = true, -- Set to true to enable debugging, false to disable
    CraftingItems = {
        {
            requiredCraftingLevel = 0, -- This is the required rep requirementd to craft the item (The setup presumes 100 rep is 1 level)
            addCraftingXP = 2, -- This is the amount of meta data to increment the players rep by for crafting this item
            itemFilter = { lockpick = true }, -- This is the item name of the item the hook is checking for
        },
        {
            requiredCraftingLevel = 100,
            addCraftingXP = 2,
            itemFilter = { advancedlockpick = true },
        },
        {
            requiredCraftingLevel = 300,
            addCraftingXP = 2,
            itemFilter = { copperwire = true },
        },
    }
}
