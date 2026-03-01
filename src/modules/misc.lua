-- C.R V1.0 | MISC MODULE
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

-- Fungsi buat modifikasi senjata (Arsenal khusus)
local function modifyGuns()
    for _, v in pairs(getgc(true)) do
        if type(v) == "table" and rawget(v, "RecoilControl") then
            -- Bikin recoil jadi nol
            v.RecoilControl = 0
            v.MaxRecoil = 0
            v.RecoilSpeed = 0
            -- Opsional: Bikin peluru gak terbatas (hati-hati, ini rawan kick)
            if v.Ammo then
                v.Ammo = 999
            end
        end
    end
end

-- Jalanin fungsi tiap detik biar kalau ganti senjata tetep aktif
RunService.Stepped:Connect(function()
    if _G.NoRecoilEnabled then
        pcall(modifyGuns)
    end
end)
print("C.R On - Misc (No Recoil) Loaded, User.")