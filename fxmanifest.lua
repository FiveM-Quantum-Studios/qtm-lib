fx_version 'adamant'
game 'gta5'
lua54 'yes'

name 'qtm-core'
author 'Quantum Studios'
version '1.0.0'
repository 'https://github.com/FiveM-Quantum-Studios/qtm-core'
description 'A library of shared functions to utilise in Quantum Studios resources.'

dependencies {
    '/server:7290',
    '/onesync',
}
files {
    'server/framework/*.lua'
}
shared_scripts {
    '@ox_lib/init.lua',
    'shared/**.lua',
    'config.lua'
}

client_scripts {
    'client/**.*'
}
server_script {
  'server/server.lua'
}

