Config = {}

Config.Debug = false -- Adds additional prints and enables all other resource debug options | true or false

Config.Framework = 'esx' -- esx / qb / qbx (Uncomment qbx_core export in fxmanifest.lua file) / ox (Uncomment ox_core imports in fxmanifest.lua file) - The framework your server is based on
Config.IsOldESX = false --This option is needed if you are running an older version of ESX
Config.FrameworkResource = 'es_extended' -- Framework resource name

Config.Inventory = 'ox_inventory' -- ox_inventory / qs-inventory - The inventory system that you're using
Config.InventoryResource = 'ox_inventory' -- The inventory system folder name that you're using

Config.Notifications = 'ox_lib' -- peuren_notify / ps-ui / ox_lib (Uncomment ox_lib export in fxmanifest.lua file) / qb / esx / okok / mythic - The notification system that your're using
Config.NotificationsResource = 'ox_lib' -- The notification system folder name that you're using

Config.WeatherSync = 'qb-cd_easytime'-- renewed-weathersync / qb-weathersync / cd_easytime - The weathersync system thet you're using

Config.Dispatch = 'cd_dispatch' -- fea-dispatch / origen_police / rcore_dispatch / cd_dispatch / core_dispatch / default / outwalter / ps-dispatch / qs-dispatch - The dispatch system that you are using for alerts
Config.DispatchResource = 'cd_dispatch' -- The dispatch system resource folder name

Config.Fuel = 'ox_fuel' -- okokGasStation / LegacyFuel / ox_fuel / lj-fuel / ti-fuel / ND_fuel / ps-fuel / esx-sna-fuel / cdn-fuel / FRFuel -- The fuel system that you're using
Config.FuelResource = 'ox_fuel' -- The fuel system resource folder name