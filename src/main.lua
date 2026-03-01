local baseUrl = "https://raw.githubusercontent.com/Severo34/Hack/main/src/"

-- 1. Inisialisasi Variabel Global
_G.ESPEnabled = false
_G.AimbotEnabled = false
_G.AimbotKey = Enum.KeyCode.LeftShift

-- 2. Load UI dulu
loadstring(game:HttpGet(baseUrl .. "ui_library.lua"))()

-- 3. Load Modul Fitur
loadstring(game:HttpGet(baseUrl .. "modules/visuals.lua"))()
loadstring(game:HttpGet(baseUrl .. "modules/aimbot.lua"))()

print("C.R System V2: Struktur Folder Berhasil Dimuat!") --