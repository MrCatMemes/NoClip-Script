-- NoClip Script by MrCatMemes 🚀

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Button = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Name = "NoClipGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Frame.Size = UDim2.new(0, 200, 0, 100)
Frame.Position = UDim2.new(0.5, -100, 0.5, -50)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Active = true                 -- wichtig für Drag
Frame.Draggable = true              -- macht das Fenster verschiebbar
Frame.Parent = ScreenGui

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Frame

Button.Size = UDim2.new(1, -20, 0, 40)
Button.Position = UDim2.new(0, 10, 0, 30)
Button.Text = "NoClip OFF"
Button.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
Button.TextColor3 = Color3.new(1, 1, 1)
Button.Font = Enum.Font.GothamBold
Button.TextSize = 16
Button.Parent = Frame

-- NoClip Funktion
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local noclipEnabled = false
local connection

local function enableNoClip()
    connection = RunService.Stepped:Connect(function()
        if LocalPlayer.Character then
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") and part.CanCollide then
                    part.CanCollide = false
                end
            end
        end
    end)
end

local function disableNoClip()
    if connection then
        connection:Disconnect()
        connection = nil
    end
end

-- Button Toggle
Button.MouseButton1Click:Connect(function()
    noclipEnabled = not noclipEnabled
    if noclipEnabled then
        Button.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        Button.Text = "NoClip ON"
        print("[NoClip] aktiviert ✅")
        enableNoClip()
    else
        Button.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        Button.Text = "NoClip OFF"
        print("[NoClip] deaktiviert ❌")
        disableNoClip()
    end
end)
