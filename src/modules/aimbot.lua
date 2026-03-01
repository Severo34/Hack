local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local Mouse = LocalPlayer:GetMouse()

-- Fungsi cari musuh terdekat (Tanpa cek tembok)
local function getClosest()
    local target = nil
    local mag = math.huge
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Team ~= LocalPlayer.Team and v.Character and v.Character:FindFirstChild("Head") then
            local pos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(v.Character.Head.Position)
            if onScreen then
                local diff = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                if diff < mag then
                    mag = diff
                    target = v
                end
            end
        end
    end
    return target
end

-- Bypass Namecall (Teknik paling stabil buat Arsenal)
local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}

    -- Cek: Tombol GUI ON dan Keybind (Shift) ditekan
    if _G.AimbotEnabled and UserInputService:IsKeyDown(_G.AimbotKey or Enum.KeyCode.LeftShift) then
        if method == "FindPartOnRayWithIgnoreList" or method == "Raycast" then
            local t = getClosest()
            if t then
                -- Belokkan peluru langsung ke kepala musuh
                args[1] = Ray.new(args[1].Origin, (t.Character.Head.Position - args[1].Origin).Unit * 1000)
                return old(self, unpack(args))
            end
        end
    end
    return old(self, ...)
end)
setreadonly(mt, true)