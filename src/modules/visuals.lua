local function applyESP(player)
    local function update()
        local char = player.Character
        if not char then return end
        
        local highlight = char:FindFirstChild("CR_ESP") or Instance.new("Highlight")
        highlight.Name = "CR_ESP"
        highlight.Parent = char
        
        -- Logika Nyala/Mati
        if _G.ESPEnabled then
            if player.Team == LocalPlayer.Team then
                highlight.Enabled = _G.ESPShowTeam
                highlight.FillColor = Color3.fromRGB(0, 255, 0) -- Hijau buat teman
            else
                highlight.Enabled = true
                highlight.FillColor = Color3.fromRGB(255, 0, 0) -- Merah buat musuh
            end
        else
            highlight.Enabled = false
        end
    end
    
    game:GetService("RunService").RenderStepped:Connect(update)
end

game.Players.PlayerAdded:Connect(applyESP)
for _, p in pairs(game.Players:GetPlayers()) do applyESP(p) end