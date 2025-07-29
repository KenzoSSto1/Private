-- Aktifkan LoadstringEnabled
game:GetService("ServerScriptService").LoadStringEnabled = true
print("[Kenzo Executor] LoadstringEnabled berhasil diaktifkan!")

-- Buat RemoteEvent di ReplicatedStorage
local server = Instance.new("RemoteEvent")
server.Name = "KenzoRemote"
server.Parent = game.ReplicatedStorage

-- Event untuk menerima script dari client
server.OnServerEvent:Connect(function(player, SS)
    -- Proteksi: hanya UserId kamu yang bisa eksekusi
    if player.UserId == 123456789 then -- Ganti dengan UserId kamu
        print("[Kenzo Executor] Eksekusi script dari:", player.Name)
        local func = loadstring(SS)
        if func then
            func()
        else
            warn("[Kenzo Executor] Gagal loadstring script!")
        end
    else
        warn("[Kenzo Executor] Peringatan! " .. player.Name .. " mencoba eksekusi script!")
    end
end)
