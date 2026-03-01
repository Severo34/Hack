-- C.R V1.0 | SILENT AIM MODULE
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera

-- Settingan (Biar nggak gampang kena ban)
local FOV_RADIUS = 150 -- Lingkaran area aim
local SMOOTHNESS = 0.5

-- Fungsi nyari musuh terdekat dari kursor
local function getClosestPlayer()
    local target = nil
    local dist = FOV_RADIUS

    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Team ~= LocalPlayer.Team and v.Character and v.Character:FindFirstChild("Head") then
            local pos, onScreen = Camera:WorldToViewportPoint(v.Character.Head.Position)
            if onScreen then
                local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                if magnitude < dist then
                    target = v
                    dist = magnitude
                end
            end
        end
    end
    return target
end

-- HOOKING: Bagian paling sakti biar nggak ketauan
local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}

    -- Cek apakah tombol di GUI lagi ON atau OFF
    if _G.AimbotEnabled and (method == "FindPartOnRayWithIgnoreList" or method == "Raycast") then
        local target = getClosestPlayer()
        if target and target.Character and target.Character:FindFirstChild("Head") then
            return oldNamecall(self, Ray.new(args[1].Origin, (target.Character.Head.Position - args[1].Origin).Unit * 1000), args[2])
        end
    end

    return oldNamecall(self, ...)
end)

setreadonly(mt, true)
print("C.R On - Silent Aim Active, User.")