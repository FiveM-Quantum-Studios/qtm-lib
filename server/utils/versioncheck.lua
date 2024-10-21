local githubURL         = "https://raw.githubusercontent.com/%s/%s/main/%s"
local downloadURL       = "https://keymaster.fivem.net/"
local coloredName       = ("[^2%s^0]").format("qtm-lib")
local renameWarning     = coloredName .. "^3 [WARNING] Resource must be named ^0%s^3 to prevent errors."
local checkFailed       = coloredName .. "^1 [ERROR] Version check failed! HTTP Error: %s^0. ^3Update to the latest version.^0"
local betaVersion       = coloredName .. "^3 [WARNING] Beta version detected. ^5Current:^0 %s - ^5Latest:^0 %s"
local updateAvailable   = coloredName .. "^3 [Update Available] ^5Current:^0 %s - ^5Latest:^0 %s\n" .. coloredName .. "^5 Download:^4 %s ^0"
local currentResName

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

    ---comment: Check version callback
    ---@param status number
    ---@param response string
    ---@param headers table
    CheckVersionCallback = function(status, response, headers)
        if status ~= 200 then
            print(checkFailed:format(status))
            return
        end
        
        local decodedResponse = json.decode(response)
        local latestVersion = decodedResponse[1].version
        local currentVersion = GetResourceMetadata(currentResName, "version", 0)

        if currentVersion == latestVersion then return end

        local currentParts = Versioncheck.splitString(currentVersion, '.')
        local latestParts = Versioncheck.splitString(latestVersion, '.')
        for i = 1, #currentParts do
            if currentParts[i] > latestParts[i] then
                --print(betaVersion:format(currentVersion, latestVersion))
                print(string.format(betaVersion, currentVersion, latestVersion))
                break
            elseif currentParts[i] < latestParts[i] then
                --print(updateAvailable:format(currentVersion, latestVersion, downloadURL:format(RESOURCE_NAME, latestVersion)))
                print(string.format(updateAvailable, currentVersion, latestVersion, string.format(downloadURL, RESOURCE_NAME, latestVersion)))

                for _, versionInfo in ipairs(decodedResponse) do
                    if versionInfo.version == currentVersion then break end
                    --print(("%s ^3[Changelog v%s]^0"):format(coloredName, versionInfo.version))
                    print(string.format("%s ^3[Changelog v%s]^0", coloredName, versionInfo.version))

                    for _, changelog in ipairs(versionInfo.changelogs) do
                        qtm.Logging('debug', changelog)
                    end
                end
                break
            end
        end
    end,

    ---comment: Version checker
    ---@param resourceName string
    VersionChecker = function(resourceName)
        currentResName      = GetInvokingResource()
        coloredName = string.format("[^2%s^0]", currentResName)
        if currentResName ~= resourceName then
            print(renameWarning.format(resourceName))
        end
        PerformHttpRequest(string.format(githubURL, "FiveM-Quantum-Studios", "VERSIONS", resourceName..".json"), Versioncheck.CheckVersionCallback)
    end
}

return Versioncheck.VersionChecker