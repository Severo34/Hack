local ConfigSystem = {}
local HttpService = game:GetService("HttpService")
local FILE_NAME = "CR_Settings.json"

function ConfigSystem.Save()
    local data = {
        ESP = _G.ESPEnabled,
        Aim = _G.AimbotEnabled,
        Key = tostring(_G.AimbotKey or Enum.KeyCode.LeftShift)
    }
    writefile(FILE_NAME, HttpService:JSONEncode(data))
end

function ConfigSystem.Load()
    if isfile(FILE_NAME) then
        local data = HttpService:JSONDecode(readfile(FILE_NAME))
        _G.ESPEnabled = data.ESP
        _G.AimbotEnabled = data.Aim
        _G.AimbotKey = Enum.KeyCode[data.Key:gsub("Enum.KeyCode.", "")]
    end
end

return ConfigSystem --