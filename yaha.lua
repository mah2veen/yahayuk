-- LocalScript di StarterGui

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Cek apakah GUI sudah ada
if playerGui:FindFirstChild("YahayukTeleport") then return end

-- Data posisi teleport
local positions = {
    ["Start"]   = CFrame.new(-674.25, 909.50, -481.76),
    ["Camp 1"]  = CFrame.new(-429.05, 265.50, 788.27),
    ["Camp 2"]  = CFrame.new(-359.93, 405.13, 541.62),
    ["Camp 3"]  = CFrame.new(288.24, 446.13, 506.28),
    ["Camp 4"]  = CFrame.new(336.31, 507.13, 348.97),
    ["Camp 5"]  = CFrame.new(224.20, 331.13, -144.73),
    ["Summit"]  = CFrame.new(-614.06, 904.50, -551.25),
}

-- Buat GUI
local gui = Instance.new("ScreenGui")
gui.Name = "YahayukTeleport"
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- Frame utama
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 280)
frame.Position = UDim2.new(0, 20, 0.5, -140)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.Parent = gui

-- Layout tombol
local layout = Instance.new("UIListLayout", frame)
layout.Padding = UDim.new(0, 5)
layout.FillDirection = Enum.FillDirection.Vertical
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- Fungsi buat tombol teleport
local function createButton(name, cf)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 180, 0, 30)
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.Parent = frame

    btn.MouseButton1Click:Connect(function()
        local char = player.Character or player.CharacterAdded:Wait()
        local root = char:FindFirstChild("HumanoidRootPart")
        if root then
            root.CFrame = cf + Vector3.new(0, 5, 0)
        end
    end)
end

-- Buat semua tombol dari data
for name, cf in pairs(positions) do
    createButton(name, cf)
end

-- Pastikan GUI tetap muncul saat respawn
player.CharacterAdded:Connect(function()
    if not playerGui:FindFirstChild("YahayukTeleport") then
        gui.Parent = playerGui
    end
end)
