-- C.R V1.0 | UI CONTROL CENTER
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("C.R V1.0 - Arsenal Control", "BloodTheme")

-- Variabel Status (Default Mati)
_G.AimbotEnabled = false
_G.ESPEnabled = false
_G.NoRecoilEnabled = false

-- TAB COMBAT
local Combat = Window:NewTab("Combat")
local CombatSection = Combat:NewSection("Weapon Hacks")

CombatSection:NewToggle("Silent Aim", "Peluru ngejar kepala musuh", function(state)
    _G.AimbotEnabled = state
    print("Aimbot:", state and "ON" or "OFF")
end)

CombatSection:NewToggle("No Recoil & Inf Ammo", "Senjata lurus & peluru tak terbatas", function(state)
    _G.NoRecoilEnabled = state
end)

-- TAB VISUALS
local Visuals = Window:NewTab("Visuals")
local VisualSection = Visuals:NewSection("ESP Settings")

VisualSection:NewToggle("Player ESP", "Liat musuh nembus tembok", function(state)
    _G.ESPEnabled = state
end)

print("C.R On - GUI Loaded, User.")