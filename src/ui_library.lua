local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("C.R System V2", "BloodTheme")

-- Global Settings
_G.AimbotEnabled = false
_G.AimbotKey = Enum.KeyCode.LeftShift -- Default Shift
_G.ESPEnabled = false
_G.ESPShowTeam = false

local Main = Window:NewTab("Main")
local Combat = Main:NewSection("Combat")

Combat:NewToggle("Silent Aim", "Aktifkan Aimbot", function(state)
    _G.AimbotEnabled = state
end)

Combat:NewKeybind("Aimbot Key", "Pilih tombol buat Aim", Enum.KeyCode.LeftShift, function(key)
    _G.AimbotKey = key
end)

local Visual = Main:NewTab("Visuals")
local ESPSection = Visual:NewSection("ESP Settings")

ESPSection:NewToggle("Master ESP", "Lihat nembus tembok", function(state)
    _G.ESPEnabled = state
end)

ESPSection:NewToggle("Show Team", "Lihat teman juga", function(state)
    _G.ESPShowTeam = state
end)