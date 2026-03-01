local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("C.R System V2", "BloodTheme")

-- Bikin variabel Tab yang unik biar gak bentrok sama internal library
local Tab1 = Window:NewTab("Combat & Visual")
local Section1 = Tab1:NewSection("Features")

Section1:NewToggle("Master ESP", "Tembus Tembok", function(state)
    _G.ESPEnabled = state
end)

Section1:NewToggle("Silent Aim", "Nembak Auto Kena", function(state)
    _G.AimbotEnabled = state
end)

Section1:NewKeybind("Aim Key", "Pilih Tombol", Enum.KeyCode.LeftShift, function(key)
    _G.AimbotKey = key
end) --