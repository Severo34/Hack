-- C.R V1.0 | VISUALS MODULE (ESP)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local function createESP(player)
    local box = Drawing.new("Square")
    box.Visible = false
    box.Color = Color3.fromRGB(255, 0, 0) -- Merah biar gampang liat target
    box.Thickness = 1
    box.Filled = false

    local tracer = Drawing.new("Line")
    tracer.Visible = false
    tracer.Color = Color3.fromRGB(255, 255, 255)
    tracer.Thickness = 1

    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.ESPEnabled and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player ~= LocalPlayer and player.Team ~= LocalPlayer.Team then
            local rootPart = player.Character.HumanoidRootPart
            local pos, onScreen = Camera:WorldToViewportPoint(rootPart.Position)

            if onScreen then
                -- Logika Bikin Kotak (Box ESP)
                local size = 1000 / pos.Z
                box.Size = Vector2.new(size, size * 1.5)
                box.Position = Vector2.new(pos.X - size / 2, pos.Y - size / 2)
                box.Visible = true

                -- Logika Garis (Tracers) dari bawah layar lo
                tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                tracer.To = Vector2.new(pos.X, pos.Y)
                tracer.Visible = true
            else
                box.Visible = false
                tracer.Visible = false
            end
        else
            box.Visible = false
            tracer.Visible = false
        end
    end)
end

-- Scan pemain yang udah ada dan yang baru masuk
for _, v in pairs(Players:GetPlayers()) do createESP(v) end
Players.PlayerAdded:Connect(createESP)

print("C.R On - Visuals Loaded, User.")