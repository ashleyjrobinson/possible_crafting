# Possible Crafting
#### Utilises player metadata in qbx-core and qb-core to allow you to level lock crafts and add xp/rep for crafting items.

[Discord/ Support](https://discord.gg/Gnb2S7uAdG)

## Install:

This script just utilises ox_inventory crafting hooks to handle checks when crafting, you still need to setup your items and benches accordingly in ox_inventory.

- Drag and drop into resources folder
- Ensure the items are defined in ox_inventory/data/items.lua
- Ensure you create your crafting benches correctly in ox_inventory/data/crafting.lua
- Go through the config and edit to your needs

## NOTE

In order for this not to be exploitable (currently - without players can just cancel progress and farm xp), you must set the crafting progress bar in ox_inventory to ```canCancel = false```.

ox_inventory/client.lua

locate the ```ox_inventory:startCrafting``` callback and change canCancel from true to false.

## Dependencies:

- QBOX/ QBCore
- ox_inventory
- ox_lib

## Support:

Join my Discord for support and roles.

https://discord.gg/5VU8MA7Tkz

## Buy Me a Coffee:
If you enjoy my work feel free to buy me a coffee :)

https://www.buymeacoffee.com/possible
