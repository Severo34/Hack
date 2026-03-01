-- C.R V2.0 | CONFIG SYSTEM (SAVE/LOAD)
local ConfigSystem = {}
local HttpService = game:GetService("HttpService")
local FILE_NAME = "CR_Settings.json"

-- Fungsi Simpan: Dipanggil tiap kali tombol di GUI diklik
function ConfigSystem.SaveSettings()
    local data = {
        ESPEnabled = _G.ESPEnabled or false,
        ESPShowTeam = _G.ESPShowTeam or false,
        AimbotEnabled = _G.AimbotEnabled or false,
        AimbotKey = tostring(_G.AimbotKey or Enum.KeyCode.LeftShift)
    }
    
    local success, encoded = pcall(function()
        return HttpService:JSONEncode(data)
    end)
    
    if success then
        writefile(FILE_NAME, encoded)
    end
end

-- Fungsi Muat: Dipanggil pas script pertama kali jalan
function ConfigSystem.LoadSettings()
    if isfile(FILE_NAME) then
        local success, decoded = pcall(function()
            return HttpService:JSONDecode(readfile(FILE_NAME))
        end)
        
        if success then
            _G.ESPEnabled = decoded.ESPEnabled
            _G.ESPShowTeam = decoded.ESPShowTeam
            _G.AimbotEnabled = decoded.AimbotEnabled
            _G.AimbotKey = Enum.KeyCode[decoded.AimbotKey:gsub("Enum.KeyCode.", "")]
            print("C.R Utils: Settings Auto-Loaded!")
        end
    end
end

return ConfigSystem