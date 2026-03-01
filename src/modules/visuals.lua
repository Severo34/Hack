-- C.R V1.0 | VISUALS FIX
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
-- ... (fungsi createESP lo yang lama) ...

RunService.RenderStepped:Connect(function()
    for _, player in pairs(Players:GetPlayers()) do
        -- Pastiin pengecekan _G.ESPEnabled ada di sini
        if _G.ESPEnabled then
            -- Jalankan logika update box/tracer lo
        else
            -- Sembunyikan semua box/tracer
        end
    end
end)