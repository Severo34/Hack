-- C.R V1.0 | MASTER LOADER
-- GANTI LINK DI BAWAH DENGAN LINK REPO GITHUB LO!
local GITHUB_USER = "Severo34"
local REPO_NAME = "HACK"
local BRANCH = "main"

local baseUrl = "https://raw.githubusercontent.com/Severo34/Hack/main/src/"

local function fastLoad(path)
    local success, content = pcall(function()
        return game:HttpGet(baseUrl .. path .. ".lua")
    end)
    if success then
        return loadstring(content)()
    else
        warn("C.R Error: Gagal ambil file " .. path)
    end
end

-- 1. Inisialisasi GUI (Pusat Kendali)
fastLoad("ui_library")

-- 2. Inject Modul (Akan aktif sesuai toggle di GUI)
fastLoad("modules/aimbot")
fastLoad("modules/visuals")
fastLoad("modules/misc")

-- 3. Tambahan: Anti-AFK (Biar gak di-kick pas lo asik nge-cheat)
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    print("C.R: Anti-AFK Triggered.")
end)

print("---------------------------------")
print("   C.R V1.0 - STATUS: ONLINE   ")
print("   USER: "..game.Players.LocalPlayer.Name)
print("---------------------------------")