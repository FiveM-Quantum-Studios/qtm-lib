local githubURL         = "https://raw.githubusercontent.com/%s/%s/main/%s"
local downloadURL       = "https://keymaster.fivem.net"
local checkFailed       = "[^2%s^0] ^1 [ERROR] Version check failed! HTTP Error: %s^0. ^3Update to the latest version.^0"
local updateAvailable   = "[^2%s^0] ^3 [Update Available] ^5Current:^0 %s - ^5Latest:^0 %s\n  ^3[Changelog v%s]^0\n%s^5 Download:^4 %s ^0"
local uptoDate          = "[^2%s^0] ^3 [Up to Date] ^5Current:^0 %s"

Versioncheck = {
    ---comment: Split string
    ---@param str string
    ---@param delimiter string
    ---@return table
    splitString = function(str, delimiter)
        local result = {}
        for match in str:gmatch("([^"..delimiter.."]+)") do
            result[#result + 1] = match
        end
        return result
    end,
    ---comment: Version checker
    ---@param resourceName string
    VersionChecker = function(resourceName)
        Citizen.CreateThread(function()
            local resourceName = resourceName
            PerformHttpRequest(string.format(githubURL, "FiveM-Quantum-Studios", "VERSIONS", resourceName .. ".json"), function (status, response, headers)
                if status ~= 200 then
                    print(string.format(checkFailed, status))
                    return
                end
                local decodedResponse = json.decode(response)
                local latestVersion = decodedResponse[1].version
                local currentVersion = GetResourceMetadata(resourceName, "version", 0)
        
                if currentVersion == latestVersion then
                    print(string.format(uptoDate, resourceName, currentVersion))
                end
        
                local currentParts = Versioncheck.splitString(currentVersion, '.')
                local latestParts = Versioncheck.splitString(latestVersion, '.')
                for i = 1, #currentParts do
                    if tonumber(currentParts[i]) < tonumber(latestParts[i]) then
                        local changelogString = "" 
                        for _, versionInfo in ipairs(decodedResponse) do
                            if versionInfo.version == currentVersion then break end
                            for _, changelog in ipairs(versionInfo.changelogs) do
                                changelogString = changelogString .. string.format("%s\n", changelog)
                            end
                        end
                        print(string.format(updateAvailable, resourceName, currentVersion, latestVersion, latestVersion, changelogString, downloadURL))
                    end
                end
            end)
        end)
    end
}

return Versioncheck.VersionChecker
