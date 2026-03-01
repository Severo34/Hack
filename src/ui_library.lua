local status, Library = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
end)

if not status then return end

local Window = Library.CreateLib("C.R System V2", "BloodTheme")
local VisualTab = Window:NewTab("Visuals")
local ESPSection = VisualTab:NewSection("ESP Settings")

-- Tombol yang lo minta
ESPSection:NewToggle("Master ESP", "Lihat nembus tembok", function(state)
    _G.ESPEnabled = state
    print("Wallhack Status: ", state) -- Cek di F9 buat pastiin tombol kerja
end)

ESPSection:NewToggle("Show Team", "Lihat teman juga", function(state)
    _G.ESPShowTeam = state
end)