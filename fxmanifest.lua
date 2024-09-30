-- File: fxmanifest.lua

fx_version 'cerulean'
game 'gta5'

author 'Playboii Driizzyy'
description 'Advanced Drug Farming and Selling Script for QBCore'
version '1.0.0'

-- Client Scripts
client_scripts {
    'client/main.lua'
}

-- Server Scripts
server_scripts {
    '@mysql-async/lib/MySQL.lua',  -- Ensure MySQL async is required if you're using a database
    'server/main.lua'
}

-- Shared Scripts
shared_scripts {
    'config.lua'
}

-- Dependencies
dependencies {
    'qb-core'
}

-- Files to be included in the resource
files {
    'config.lua',
    'server/main.lua',
    'client/main.lua'
}
