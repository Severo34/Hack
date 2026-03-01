-- Load Library dengan pelindung pcall
local status, Library = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
end)

if not status or not Library then
    warn("C.R System: Gagal memuat UI Library!")
    return
end

local Window = Library.CreateLib("C.R System V2", "BloodTheme")

-- Global Settings (Pastiin nilainya ada default-nya)
_G.AimbotEnabled = _G.AimbotEnabled or false
_G.AimbotKey = _G.AimbotKey or Enum.KeyCode.LeftShift
_G.ESPEnabled = _G.ESPEnabled or false
_G.ESPShowTeam = _G.ESPShowTeam or false

-- Gunakan variabel 'Tab' biar lebih aman
local MainTab = Window:NewTab("Main")
local CombatSection = MainTab:NewSection("Combat")

CombatSection:NewToggle("Silent Aim", "Aktifkan Aimbot", function(state)
    _G.AimbotEnabled = state
    print("Aimbot Status:", state) -- Buat cek di F9
end)

CombatSection:NewKeybind("Aimbot Key", "Pilih tombol buat Aim", Enum.KeyCode.LeftShift, function(key)
    _G.AimbotKey = key
end)

local VisualTab = Window:NewTab("Visuals")
local ESPSection = VisualTab:NewSection("ESP Settings")

ESPSection:NewToggle("Master ESP", "Lihat nembus tembok", function(state)
    _G.ESPEnabled = state
end)

ESPSection:NewToggle("Show Team", "Lihat teman juga", function(state)
    _G.ESPShowTeam = state
end)