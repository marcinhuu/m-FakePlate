fx_version 'cerulean'
author 'marcinhu#0001'
Description 'FakePlate'
game 'gta5'

shared_scripts { 
    "config.lua",
}

server_script { 
    '@oxmysql/lib/MySQL.lua',
    "server/**.lua",
}

client_script {
    "client/**.lua",
}
