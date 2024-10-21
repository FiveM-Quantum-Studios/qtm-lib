local githubURL         = "https://raw.githubusercontent.com/%s/%s/main/%s"
local downloadURL       = "https://keymaster.fivem.net/"
local coloredName       = string.format("[^2%s^0]", "qtm-lib")
local renameWarning     = string.format("%s^3 [WARNING] Resource must be named ^0%s^3 to prevent errors.", coloredName, "%s")
local checkFailed       = string.format("%s^1 [ERROR] Version check failed! HTTP Error: %%s^0. ^3Update to the latest version.^0", coloredName)
local betaVersion       = string.format("%s^3 [WARNING] Beta version detected. ^5Current:^0 %%s - ^5Latest:^0 %%s", coloredName)
local updateAvailable   = string.format("%s^3 [Update Available] ^5Current:^0 %%s - ^5Latest:^0 %%s\n%s^5 Download:^4 %%s ^0", coloredName, coloredName)
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
            print(string.format(checkFailed, status))
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
                print(string.format(betaVersion, currentVersion, latestVersion))
                break
            elseif currentParts[i] < latestParts[i] then
                print(string.format(updateAvailable, currentVersion, latestVersion, string.format(downloadURL, RESOURCE_NAME, latestVersion)))

                for _, versionInfo in ipairs(decodedResponse) do
                    if versionInfo.version == currentVersion then break end
                    print(string.format("%s ^3[Changelog v%s]^0", coloredName, versionInfo.version))

                    for _, changelog in ipairs(versionInfo.changelogs) do
                        qtm.Logging('info', changelog)
                    end
                end
                break
            end
        end
    end,

    ---comment: Version checker
    ---@param resourceName string
    VersionChecker = function(resourceName)
        currentResName = GetInvokingResource()
        coloredName = string.format("[^2%s^0]", currentResName or "qtm-lib")
        if currentResName ~= resourceName then
            print(string.format(renameWarning, resourceName))
        end
        PerformHttpRequest(string.format(githubURL, "FiveM-Quantum-Studios", "VERSIONS", resourceName..".json"), Versioncheck.CheckVersionCallback)
    end
}

return Versioncheck.VersionChecker
