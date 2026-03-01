local baseUrl = "https://raw.githubusercontent.com/Severo34/Hack/main/src/"

-- Ambil fungsinya
local success, Config = pcall(function()
    return loadstring(game:HttpGet(baseUrl .. "utils/config_system.lua"))()
end)

-- Jalankan sisanya
loadstring(game:HttpGet(baseUrl .. "ui_library.lua"))()
if success then Config.LoadSettings() end

loadstring(game:HttpGet(baseUrl .. "modules/aimbot.lua"))()
loadstring(game:HttpGet(baseUrl .. "modules/visuals.lua"))()

print("C.R V2 Ready!")