local ConfigSystem = {}
local HttpService = game:GetService("HttpService")
local FILE_NAME = "CR_Settings.json"

function ConfigSystem.SaveSettings()
    local data = {
        AimbotEnabled = _G.AimbotEnabled or false,
        AimbotKey = tostring(_G.AimbotKey or Enum.KeyCode.LeftShift),
        ESPEnabled = _G.ESPEnabled or false,
        ESPShowTeam = _G.ESPShowTeam or false
    }
    writefile(FILE_NAME, HttpService:JSONEncode(data))
end

function ConfigSystem.LoadSettings()
    if isfile(FILE_NAME) then
        local data = HttpService:JSONDecode(readfile(FILE_NAME))
        _G.AimbotEnabled = data.AimbotEnabled
        _G.ESPEnabled = data.ESPEnabled
        _G.ESPShowTeam = data.ESPShowTeam
        _G.AimbotKey = Enum.KeyCode[data.AimbotKey:gsub("Enum.KeyCode.", "")]
    end
end

return ConfigSystem -- Berhenti di sini!