fx_version 'adamant'
game 'gta5'
lua54 'yes'

name 'qtm-lib'
author 'Quantum Studios'
version '1.0.3'
repository 'https://github.com/FiveM-Quantum-Studios/qtm-lib'
description 'A library of shared functions to utilise in Quantum Studios resources.'

ui_page "web/index.html"

dependencies {
    '/server:7290',
    '/onesync',
    'ox_lib'
}

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    'shared/**/*.lua'
}

client_scripts {
    'client/client.lua'
}
server_script {
  'server/server.lua'
}

files {
    'client/**/*.lua',
    'imports.lua',
    "web/*"
}