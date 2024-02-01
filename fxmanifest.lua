fx_version 'cerulean'
game 'gta5'

author 'Possible'
description 'Possible Crafting - Giving the ability to handle ox_inventory crafting hooks, checking and setting qbx/ qbcore metadata.'
version '1.0.0'

client_scripts {
    -- '@qbx_core/modules/playerdata.lua'
}

shared_scripts {
    'shared/*',
    '@ox_lib/init.lua'
    -- '@qbx_core/modules/utils.lua'
}

server_scripts {
    'server/*'
}

lua54 'yes'
use_experimental_fxv2_oal 'yes'
