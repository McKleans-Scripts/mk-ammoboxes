fx_version "cerulean"
game "gta5"
lua54 'yes'

name "MK-AmmoBoxes"
author "McKleans-Scripts - https://discord.gg/DEWp9TP7p6"
version "v1.1"
description "AmmoBoxes By McKleans-Scripts"

client_scripts { 'client/*.lua', }
server_scripts { 'server/*.lua', }
shared_scripts {
    '@qb-core/shared/locale.lua',
	'locales/en.lua',
    'config.lua',
}

dependency '/assetpacks'