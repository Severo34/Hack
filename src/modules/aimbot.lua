-- C.R V1.0 | SILENT AIM (SHIFT TO AIM)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera
local UserInputService = game:GetService("UserInputService")

local FOV_RADIUS = 150 
local isShifting = false

-- Cek apakah Shift ditekan
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.LeftShift then
        isShifting = true
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.LeftShift then
        isShifting = false
    end
end)

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

local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}

    -- SYARAT: Tombol di GUI ON DAN lagi pencet SHIFT
    if _G.AimbotEnabled and isShifting and (method == "FindPartOnRayWithIgnoreList" or method == "Raycast") then
        local target = getClosestPlayer()
        if target and target.Character and target.Character:FindFirstChild("Head") then
            return oldNamecall(self, Ray.new(args[1].Origin, (target.Character.Head.Position - args[1].Origin).Unit * 1000), args[2])
        end
    end
    return oldNamecall(self, ...)
end)
setreadonly(mt, true)