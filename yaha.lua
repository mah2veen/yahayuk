-- LocalScript di StarterGui

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

if playerGui:FindFirstChild("YahayukTeleport") then return end

local positions = {
    ["Start"]   = CFrame.new(-674.25, 909.50, -481.76),
    ["Camp 1"]  = CFrame.new(-429.05, 265.50, 788.27),
    ["Camp 2"]  = CFrame.new(-359.93, 405.13, 541.62),
    ["Camp 3"]  = CFrame.new(288.24, 446.13, 506.28),
    ["Camp 4"]  = CFrame.new(336.31, 507.13, 348.97),
    ["Camp 5"]  = CFrame.new(224.20, 331.13, -144.73),
    ["Summit"]  = CFrame.new(-614.06, 904.50, -551.25),
}

-- GUI Setup
local gui = Instance.new("ScreenGui")
gui.Name = "YahayukTeleport"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 220, 0, 320)
frame.Position = UDim2.new(0, 20, 0.5, -160)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.Parent = gui

local layout = Instance.new("UIListLayout", frame)
layout.Padding = UDim.new(0, 6)
layout.FillDirection = Enum.FillDirection.Vertical
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- RGB Animation Function
local function animateRGB(button)
    local hue = 0
    while true do
        hue = (hue + 0.01) % 1
        button.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
        wait(0.03)
    end
end

-- Create Buttons
for name, cf in pairs(positions) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 200, 0, 32)
    btn.Text = name
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.BorderSizePixel = 0
    btn.Parent = frame

    coroutine.wrap(function() animateRGB(btn) end)()

    btn.MouseButton1Click:Connect(function()
        local char = player.Character or player.CharacterAdded:Wait()
        local root = char:FindFirstChild("HumanoidRootPart")
        if root then
            root.CFrame = cf + Vector3.new(0, 5, 0)
        end
    end)
end

-- Watermark Mahveen
local watermark = Instance.new("TextLabel")
watermark.Size = UDim2.new(0, 200, 0, 20)
watermark.Position = UDim2.new(0, 10, 1, -25)
watermark.Text = "Mahveen ✦"
watermark.TextColor3 = Color3.fromRGB(255, 255, 255)
watermark.Font = Enum.Font.GothamSemibold
watermark.TextSize = 14
watermark.BackgroundTransparency = 1
watermark.TextXAlignment = Enum.TextXAlignment.Right
watermark.Parent = frame
