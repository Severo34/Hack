local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

local function applyESP(player)
    -- Tunggu karakternya bener-bener ada
    player.CharacterAdded:Connect(function(char)
        task.wait(0.5) -- Kasih jeda biar Arsenal selesai load bajunya
        
        local highlight = char:FindFirstChild("CR_Highlight") or Instance.new("Highlight")
        highlight.Name = "CR_Highlight"
        highlight.Parent = char
        highlight.Adornee = char -- MAKSA nempel ke badan
        
        -- SETTINGAN TEMBUS TEMBOK PALING SAKTI
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop -- WAJIB ADA
        highlight.FillTransparency = 0.4 
        highlight.OutlineTransparency = 0
        
        -- Update Warna & Status tiap frame
        RunService.RenderStepped:Connect(function()
            if _G.ESPEnabled and char and char:Parent then
                if player.Team == LocalPlayer.Team then
                    highlight.Enabled = _G.ESPShowTeam or false
                    highlight.FillColor = Color3.fromRGB(0, 255, 0) -- Hijau (Teman)
                else
                    highlight.Enabled = true
                    highlight.FillColor = Color3.fromRGB(255, 0, 0) -- Merah (Musuh)
                end
            else
                highlight.Enabled = false
            end
        end)
    end)
end

-- Jalankan buat yang udah di dalem game
for _, p in pairs(Players:GetPlayers()) do
    if p ~= LocalPlayer then applyESP(p) end
end
Players.PlayerAdded:Connect(applyESP)