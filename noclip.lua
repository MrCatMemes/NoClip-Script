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

-- Dragging System (modern)
local UserInputService = game:GetService("UserInputService")
local dragging = false
local dragInput, dragStart, startPos

Frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        Frame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

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
