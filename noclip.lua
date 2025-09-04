-- ScreenGui erstellen
local gui = Instance.new("ScreenGui")
gui.Name = "NoclipGUI"
gui.ResetOnSpawn = false
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Frame (Fenster)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Active = true
frame.Draggable = true
frame.Parent = gui

-- Button
local button = Instance.new("TextButton")
button.Size = UDim2.new(1, -20, 0, 40)
button.Position = UDim2.new(0, 10, 0, 30)
button.Text = "Noclip: OFF"
button.TextColor3 = Color3.new(1,1,1)
button.BackgroundColor3 = Color3.fromRGB(200,0,0)
button.Parent = frame

-- Noclip Logik (Platzhalter!)
local noclip = false
button.MouseButton1Click:Connect(function()
    noclip = not noclip
    button.Text = "Noclip: " .. (noclip and "ON" or "OFF")
    button.BackgroundColor3 = noclip and Color3.fromRGB(0,200,0) or Color3.fromRGB(200,0,0)

    if noclip then
        print("✅ Noclip aktiviert (Platzhalter)")
        -- Hier würdest du später die Noclip-Logik einsetzen
    else
        print("❌ Noclip deaktiviert")
    end
end)
