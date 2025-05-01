local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("FX messes with Rocitizens", "BloodTheme")

-- Speed settings
getgenv().WalkSpeedValue = 50
local Player = game:GetService("Players").LocalPlayer

-- Main tab
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Some universal stuff")

MainSection:NewButton("Noclip", "Enable to enable noclip", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/F4Xwastaken/Scripts/main/Noclip.lua"))();
end)

MainSection:NewButton("CTRL + Click tp", "Hold down left ctrl and click to teleport", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/F4Xwastaken/Scripts/main/ClickTeam.lua"))()
end)

MainSection:NewButton("Leftalt + click delete", "If you hold down left alt and click you delete", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/F4Xwastaken/Scripts/main/leftaltdelete.lua"))();
end)

-- WalkSpeed slider
MainSection:NewSlider("WalkSpeed", "Adjust your walk speed", 400, 16, function(value)
    getgenv().WalkSpeedValue = value
    if Player.Character and Player.Character:FindFirstChild("Humanoid") then
        Player.Character.Humanoid.WalkSpeed = value
    end
end)

-- Maintain speed if game tries to change it
local function applyWalkSpeed()
    if Player.Character and Player.Character:FindFirstChild("Humanoid") then
        Player.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue
    end
end

local function setupCharacter(char)
    local hum = char:WaitForChild("Humanoid")
    hum:GetPropertyChangedSignal("WalkSpeed"):Connect(applyWalkSpeed)
    applyWalkSpeed()
end

if Player.Character then setupCharacter(Player.Character) end
Player.CharacterAdded:Connect(setupCharacter)

-- ESP for other players
local espEnabled = false
local espBoxes = {}  -- To store all ESP boxes for updating

local function updateDistanceLabel(player, box, label)
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        -- Calculate the distance
        local distance = (Player.Character.HumanoidRootPart.Position - character.HumanoidRootPart.Position).Magnitude
        label.Text = player.Name .. " | Team: " .. (player.Team and player.Team.Name or "No Team") .. " | Distance: " .. math.floor(distance) .. "m"
    end
end

local function showESP()
    for _, otherPlayer in pairs(game:GetService("Players"):GetPlayers()) do
        if otherPlayer ~= Player then
            local character = otherPlayer.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                -- ESP box
                local box = Instance.new("BillboardGui")
                box.Parent = character.HumanoidRootPart
                box.Size = UDim2.new(0, 100, 0, 50)
                box.Adornee = character.HumanoidRootPart
                box.AlwaysOnTop = true

                local label = Instance.new("TextLabel")
                label.Parent = box
                label.Size = UDim2.new(1, 0, 1, 0)
                label.BackgroundTransparency = 1
                label.Text = otherPlayer.Name .. " | Team: " .. (otherPlayer.Team and otherPlayer.Team.Name or "No Team") .. " | Distance: Calculating..."
                label.TextColor3 = Color3.fromRGB(255, 0, 0)
                label.TextStrokeTransparency = 0.8
                label.TextScaled = true

                -- Save the box and label to the espBoxes table
                espBoxes[otherPlayer] = { box = box, label = label }
            end
        end
    end
end

-- Update all ESP boxes
local function updateESP()
    for player, espInfo in pairs(espBoxes) do
        updateDistanceLabel(player, espInfo.box, espInfo.label)
    end
end

-- Remove ESP boxes
local function removeESP()
    for _, otherPlayer in pairs(game:GetService("Players"):GetPlayers()) do
        if otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
            for _, child in pairs(otherPlayer.Character.HumanoidRootPart:GetChildren()) do
                if child:IsA("BillboardGui") then
                    child:Destroy()
                end
            end
        end
    end
    espBoxes = {}  -- Clear the table when ESP is removed
end

-- Toggle ESP
MainSection:NewButton("Toggle ESP", "Toggle ESP on/off", function()
    espEnabled = not espEnabled  -- Toggle ESP
    if espEnabled then
        showESP()
        -- Update the distance every 0.5 seconds (or adjust as needed)
        while espEnabled do
            updateESP()
            wait(0.5)  -- Update every 0.5 seconds
        end
    else
        removeESP()
    end
end)

-- Teleports tab
local Teleports = Window:NewTab("Teleports")
local TeleportSection = Teleports:NewSection("Teleport Options")

-- Bank: Outside teleport button
TeleportSection:NewButton("Bank: Outside", "Teleport to Bank: Outside", function()
    local bankPosition = Vector3.new(-5170.17, 6.58, 5228.09)
    if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(bankPosition)
    end
end)

-- Bank: Inside teleport button
TeleportSection:NewButton("Bank: Inside", "Teleport to Bank: Inside", function()
    local bankInsidePosition = Vector3.new(-5169.56, -24.92, 5307.29)
    if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(bankInsidePosition)
    end
end)

-- Robber HideOut teleport button
TeleportSection:NewButton("Robber HideOut", "Teleport to Robber HideOut", function()
    local robberHideoutPosition = Vector3.new(-3634.03, 9.25, 5653.90)
    if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(robberHideoutPosition)
    end
end)

-- Airport teleport button
TeleportSection:NewButton("Airport", "Teleport to Airport", function()
    local airportPosition = Vector3.new(-1550.05, 5.98, 5103.49)
    if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(airportPosition)
    end
end)

-- Desert Gas Station teleport button
TeleportSection:NewButton("Desert Gas Station", "Teleport to Desert Gas Station", function()
    local desertGasPosition = Vector3.new(212.87, 5.82, 5143.59)
    if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(desertGasPosition)
    end
end)

-- Powerplant teleport button
TeleportSection:NewButton("Powerplant", "Teleport to Powerplant", function()
    local powerplantPosition = Vector3.new(586.95, 13.26, 3116.13)
    if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(powerplantPosition)
    end
end)

-- Lighthouse teleport button
TeleportSection:NewButton("Lighthouse", "Teleport to Lighthouse", function()
    local lighthousePosition = Vector3.new(178.13, 199.42, -345.10)
    if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(lighthousePosition)
    end
end)

-- Beach Gas Station teleport button
TeleportSection:NewButton("Beach Gas Station", "Teleport to Beach Gas Station", function()
    local beachGasStationPosition = Vector3.new(-2687.73, 38.84, 122.45)
    if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(beachGasStationPosition)
    end
end)

-- Spencer Auto teleport button
TeleportSection:NewButton("Spencer Auto", "Teleport to Spencer Auto", function()
    local spencerAutoPosition = Vector3.new(-5092.62, 6.08, 4973.90)
    if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(spencerAutoPosition)
    end
end)

-- Spawn teleport button
TeleportSection:NewButton("Spawn", "Teleport to Spawn", function()
    local spawnPosition = Vector3.new(-4800.70, 5.97, 4964.75)
    if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(spawnPosition)
    end
end)

-- Super Mart teleport button
TeleportSection:NewButton("Super Mart", "Teleport to Super Mart", function()
    local superMartPosition = Vector3.new(-4284.98, 6.58, 4683.82)
    if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(superMartPosition)
    end
end)

-- Marina Dock teleport button
TeleportSection:NewButton("Marina Dock", "Teleport to Marina Dock", function()
    local marinaDockPosition = Vector3.new(-5701.96, -43.53, 6475.84)
    if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(marinaDockPosition)
    end
end)

-- Settings tab
local Settings = Window:NewTab("Settings")
local Settings = Settings:NewSection("Settings")
Settings:NewKeybind("Toggle UI", "KeybindInfo", Enum.KeyCode.RightControl, function()
    Library:ToggleUI()
end)

-- Credits tab
local Credits = Window:NewTab("Credits")
local Credits = Credits:NewSection("Made By gitgudnuub")
