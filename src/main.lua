local baseUrl = "https://raw.githubusercontent.com/Severo34/Hack/main/src/"

-- Load Utils dulu
local Config = loadstring(game:HttpGet(baseUrl .. "utils/config_system.lua"))()

-- Load GUI
loadstring(game:HttpGet(baseUrl .. "ui_library.lua"))()

-- Coba load settingan lama kalau ada
Config.LoadSettings()

-- Load Modul Tempur
loadstring(game:HttpGet(baseUrl .. "modules/aimbot.lua"))()
loadstring(game:HttpGet(baseUrl .. "modules/visuals.lua"))()

-- (Opsional) Bikin auto-save tiap 30 detik
task.spawn(function()
    while task.wait(30) do
        Config.SaveSettings()
    end
end)