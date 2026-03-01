-- C.R V2.0 | CONFIG SYSTEM UTILS
local ConfigSystem = {}
local HttpService = game:GetService("HttpService")

-- Nama file yang bakal muncul di folder 'workspace' executor lo
local FILE_NAME = "CR_Settings.json"

-- Fungsi buat nyimpen settingan ke file JSON
function ConfigSystem.SaveSettings()
    local data = {
        AimbotEnabled = _G.AimbotEnabled,
        AimbotKey = tostring(_G.AimbotKey), -- KeyCode harus jadi string biar bisa di-save
        ESPEnabled = _G.ESPEnabled,
        ESPShowTeam = _G.ESPShowTeam
    }
    
    local success, encoded = pcall(function()
        return HttpService:JSONEncode(data)
    end)
    
    if success then
        writefile(FILE_NAME, encoded)
        print("C.R Utils: Settings Saved!")
    end
end

-- Fungsi buat ngebaca settingan pas script baru nyala
function ConfigSystem.LoadSettings()
    if isfile(FILE_NAME) then
        local content = readfile(FILE_NAME)
        local success, decoded = pcall(function()
            return HttpService:JSONDecode(content)
        end)
        
        if success then
            _G.AimbotEnabled = decoded.AimbotEnabled
            _G.ESPEnabled = decoded.ESPEnabled
            _G.ESPShowTeam = decoded.ESPShowTeam
            -- Balikin string ke Enum KeyCode
            _G.AimbotKey = Enum.KeyCode[decoded.AimbotKey:gsub("Enum.KeyCode.", "")]
            print("C.R Utils: Settings Loaded!")
        end
    end
end

return ConfigSystem