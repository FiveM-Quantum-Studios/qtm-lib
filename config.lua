Config = {}

Config.Debug = true -- Adds additional prints and enables all other resource debug options | true or false
Config.PoliceJobs = {"police", "sherrif"}
Config.Notifications = 'ox_lib' -- ox_lib / qb / esx / okok / mythic - The notification system that your're using
Config.NotificationsResource = 'qtm' -- The notification system folder name that you're using
Config.NotificationsTime = 5000 -- The notification duration in ms
Config.Logging = 'ox_lib' -- ox_lib | discord
Config.TextUI = {
    resource = 'qtm', -- qtm | jg-textui | okokTextUI | ox_lib 
    defaultPosition = 'right-center' -- 'right-center' | 'left-center' | 'top-center' | 'bottom-center' 
}

Config.Minigames = {
    Drill = "VAULT_DRILL" -- "VAULT_DRILL" or "VAULT_LAZER"
}

Config.DisableIdleCam = true