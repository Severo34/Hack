local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function applyESP(player)
    player.CharacterAdded:Connect(function(char)
        task.wait(0.5)
        local highlight = Instance.new("Highlight")
        highlight.Name = "CR_Highlight"
        highlight.Parent = char
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop -- TEMBUS OBJEK
        
        game:GetService("RunService").RenderStepped:Connect(function()
            if _G.ESPEnabled and char and char:Parent then
                highlight.Enabled = (player.Team ~= LocalPlayer.Team) or _G.ESPShowTeam
                highlight.FillColor = (player.Team == LocalPlayer.Team) and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
            else
                highlight.Enabled = false
            end
        end)
    end)
    if player.Character then -- Jalankan jika player sudah spawn
        -- Panggil ulang fungsi char added secara manual jika perlu
    end
end

for _, p in pairs(Players:GetPlayers()) do if p ~= LocalPlayer then applyESP(p) end end
Players.PlayerAdded:Connect(applyESP) --