local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

local function applyESP(player)
    local highlight = Instance.new("Highlight")
    highlight.Name = "CR_Highlight"
    highlight.Parent = nil -- Mulai dari mati

    RunService.RenderStepped:Connect(function()
        local char = player.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            highlight.Parent = char
            
            -- Logika ON/OFF dari Tombol GUI
            if _G.ESPEnabled then
                if player.Team == LocalPlayer.Team then
                    highlight.Enabled = _G.ESPShowTeam or false
                    highlight.FillColor = Color3.fromRGB(0, 255, 0)
                else
                    highlight.Enabled = true
                    highlight.FillColor = Color3.fromRGB(255, 0, 0)
                end
            else
                highlight.Enabled = false
            end
            
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop -- Tembus Tembok
            highlight.FillTransparency = 0.5
        end
    end)
end

for _, p in pairs(Players:GetPlayers()) do if p ~= LocalPlayer then applyESP(p) end end
Players.PlayerAdded:Connect(applyESP)