local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local Mouse = LocalPlayer:GetMouse()

local function getClosestPlayer()
    local target = nil
    local dist = math.huge
    
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Head") then
            -- Cek Tim (kalau bukan teman atau jika setting show team aktif)
            if v.Team ~= LocalPlayer.Team then
                local pos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(v.Character.Head.Position)
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

local mt = getrawmetatable(game)
setreadonly(mt, false)
local old = mt.__namecall

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    
    -- Cek apakah Aimbot ON dan Tombol Keybind lagi ditekan
    if _G.AimbotEnabled and UserInputService:IsKeyDown(_G.AimbotKey) then
        if method == "FindPartOnRayWithIgnoreList" or method == "Raycast" then
            local target = getClosestPlayer()
            if target then
                -- Arahkan peluru langsung ke kepala (Silent Aim)
                return old(self, Ray.new(args[1].Origin, (target.Character.Head.Position - args[1].Origin).Unit * 1000), args[2])
            end
        end
    end
    return old(self, ...)
end)
setreadonly(mt, true)