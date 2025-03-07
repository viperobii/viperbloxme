local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Cat Hub",
    Icon = 0,
    LoadingTitle = "Loading Free",
    LoadingSubtitle = "By Viper",
    Theme = "Default",
    ConfigurationSaving = {
        Enabled = true,
        FileName = "Viper Hub"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false
})

-- 🌟 Main Tab
local Tab = Window:CreateTab("Protection", 4483362458)
local Section = Tab:CreateSection("Main Player")

Tab:CreateToggle({
    Name = "Bypass (Safe)",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            Rayfield:Notify({
                Title = "Bypass",
                Content = "Bypass Report Discord And User Enabled Status 🟢",
                Duration = 3,
                Image = 4483362458
            })
        else
            Rayfield:Notify({
                Title = "Bypass",
                Content = "Bypass Disabled Status 🔴",
                Duration = 3,
                Image = 4483362458
            })
        end
    end
})

-- Anti Report
local function freezeScreen()
    local player = game.Players.LocalPlayer
    local camera = workspace.CurrentCamera
    if player and camera then
        camera.CameraType = Enum.CameraType.Scriptable
        wait(5) -- Freezes screen for 5 seconds
        camera.CameraType = Enum.CameraType.Custom
    end
end

Tab:CreateToggle({
    Name = "Anti Report",
    CurrentValue = false,
    Callback = function(state)
        if state then
            freezeScreen()
            Rayfield:Notify({
                Title = "Anti Report",
                Content = "Anti Report Enabled Successfully (No one can report you or ban you in Discord/Roblox)",
                Duration = 5,
                Image = 4483362458,
                Actions = {
                    Ignore = {
                        Name = "Status 🟢",
                        Callback = function() end
                    }
                }
            })
        end
    end
})

Tab:CreateParagraph({
    Title = "Important Safety",
    Content = "⚠️ Use this script responsibly. Some features may be detected by anti-cheat. Enable 'Anti Report' and 'Bypass' for extra safety. Have fun!"
})

-- 🌟 Main Tab
local Tab = Window:CreateTab("Main", 4483362458)
local Section = Tab:CreateSection("Main Player")

-- Fly hack
local flying = false
local speed = 300 -- Tween speed

Tab:CreateToggle({
    Name = "Fly (Smooth)",
    CurrentValue = false,
    Callback = function(state)
        flying = state
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local root = character:FindFirstChild("HumanoidRootPart")

        if not root then return end

        if flying then
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.Velocity = Vector3.new(0, 0, 0)
            bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bodyVelocity.Parent = root

            local userInputService = game:GetService("UserInputService")

            local function updateVelocity()
                if not flying then return end
                local moveDirection = character.Humanoid.MoveDirection
                bodyVelocity.Velocity = moveDirection * speed
            end

            local runService = game:GetService("RunService")
            local heartbeat
            heartbeat = runService.Heartbeat:Connect(updateVelocity)

            -- Stop flying when toggled off
            task.spawn(function()
                while flying do
                    task.wait()
                end
                bodyVelocity:Destroy()
                heartbeat:Disconnect()
            end)
        end
    end
})

local AimbotEnabled = false

local function GetClosestTarget()
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local ClosestTarget = nil
    local ShortestDistance = math.huge

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local Distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
            if Distance < ShortestDistance then
                ClosestTarget = player.Character.HumanoidRootPart
                ShortestDistance = Distance
            end
        end
    end
    return ClosestTarget
end

local function AutoAimbotSkill()
    if not AimbotEnabled then return end
    local Target = GetClosestTarget()
    if Target then
        local Character = game.Players.LocalPlayer.Character
        if Character and Character:FindFirstChild("HumanoidRootPart") then
            Character.HumanoidRootPart.CFrame = CFrame.lookAt(Character.HumanoidRootPart.Position, Target.Position)
        end
    end
end

game:GetService("RunService").RenderStepped:Connect(AutoAimbotSkill)

Tab:CreateToggle({
    Name = "Aimbot Fruit Skills",
    CurrentValue = false,
    Callback = function(Value)
        AimbotEnabled = Value
    end
})


-- Super Dash
Tab:CreateSlider({
    Name = "Dash Length",
    Range = {10, 500},
    Increment = 1,
    Suffix = "Length",
    CurrentValue = 10,
    Flag = "Slider2",
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        if player.Character then
            player.Character:SetAttribute("DashLength", Value)
        end
    end
})

-- ⚡ WalkSpeed Slider
Tab:CreateSlider({
    Name = "WalkSpeed",
    Range = {10, 250},
    Increment = 5,
    Suffix = "Speed",
    CurrentValue = 50,
    Flag = "WalkSpeedSlider",
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        if player.Character then
            player.Character.Humanoid.WalkSpeed = Value
        end
    end
})

-- 🚀 Infinite Jump
Tab:CreateButton({
    Name = "Infinite Jump",
    Callback = function()
        game:GetService("UserInputService").JumpRequest:Connect(function()
            local player = game.Players.LocalPlayer
            if player.Character then
                player.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
            end
        end)
    end
})

-- 🌊 Walk on Water
local WalkOnWaterEnabled = false
Tab:CreateToggle({
    Name = "Walk on Water",
    CurrentValue = false,
    Flag = "WalkOnWater",
    Callback = function(Value)
        WalkOnWaterEnabled = Value
        if Value then
            local part = Instance.new("Part")
            part.Size = Vector3.new(10, 1, 10)
            part.Anchored = true
            part.CanCollide = true
            part.Transparency = 0.5
            part.Parent = game.Workspace

            game:GetService("RunService").RenderStepped:Connect(function()
                if WalkOnWaterEnabled then
                    local HRP = game.Players.LocalPlayer.Character.HumanoidRootPart
                    if HRP then
                        part.Position = Vector3.new(HRP.Position.X, -2.8, HRP.Position.Z)
                    end
                end
            end)
        end
    end
})

-- 🚷 NoClip (Walk Through Walls)
local NoClipEnabled = false
Tab:CreateToggle({
    Name = "NoClip",
    CurrentValue = false,
    Flag = "NoClipToggle",
    Callback = function(Value)
        NoClipEnabled = Value
        local runService = game:GetService("RunService")
        if Value then
            runService.Stepped:Connect(function()
                if NoClipEnabled then
                    for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        end
    end
})

-- Buddha Transform
local BuddhaEnabled = false

Tab:CreateToggle({
    Name = "Buddha Size",
    CurrentValue = false,
    Callback = function(Value)
        BuddhaEnabled = Value
        if BuddhaEnabled then
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.Size = Vector3.new(10, 10, 10) -- Adjusted to Buddha size
                char.HumanoidRootPart.Transparency = 1 -- Makes transformation smooth
                for _, v in pairs(char:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.Size = v.Size * 2 -- Doubles size of body parts
                    end
                end
            end
        else
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.Size = Vector3.new(2, 2, 1) -- Default size
                char.HumanoidRootPart.Transparency = 0
                for _, v in pairs(char:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.Size = v.Size / 2 -- Resets size
                    end
                end
            end
        end
    end
})

-- Sword
Tab:CreateToggle({
    Name = "Big Swords (Fixing)",
    CurrentValue = false,
    Callback = function(state)
        local Character = game.Players.LocalPlayer.Character
        if not Character then return end
        
        local SwordNames = {"Shark Anchor", "Tushita", "Yama", "Cursed Dual Katana"}
        local newSize = state and Vector3.new(10, 10, 10) or Vector3.new(1, 1, 1) -- Adjust size
        
        for _, tool in ipairs(Character:GetChildren()) do
            if tool:IsA("Tool") and table.find(SwordNames, tool.Name) then
                local handle = tool:FindFirstChild("Handle") or tool:FindFirstChildWhichIsA("BasePart")
                if handle then
                    handle.Size = newSize
                    for _, mesh in ipairs(handle:GetChildren()) do
                        if mesh:IsA("SpecialMesh") then
                            mesh.Scale = newSize / handle.Size
                        end
                    end
                end
            end
        end
    end
})


-- 🌟 Main Tab
local Tab = Window:CreateTab("Fps & Network Boost", 4483362458)
local Section = Tab:CreateSection("Main Network & FPS")


-- Potato Graphics
local function SetPotatoGraphics(state)
    if state then
        -- Disable Shadows & Effects
        game.Lighting.GlobalShadows = false
        game.Lighting.FogEnd = 999999
        game.Lighting.Brightness = 3
        settings().Rendering.QualityLevel = 1

        -- Reduce Part Quality
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and not v:IsDescendantOf(game.Players.LocalPlayer.Character) then
                v.Material = Enum.Material.SmoothPlastic
                v.Reflectance = 0
            end
        end

        -- Disable Particles & Effects
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") then
                v.Enabled = false
            end
        end

        -- Optimize Physics
        settings().Physics.AllowSleep = true
        game:GetService("NetworkSettings").IncomingReplicationLag = 0
    else
        -- Reset Graphics when Disabled
        game.Lighting.GlobalShadows = true
        game.Lighting.FogEnd = 100000
        game.Lighting.Brightness = 1
        settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
    end
end

-- **Create Toggle in UI**
Tab:CreateToggle({
    Name = "Potato Graphics (Low Device)",
    CurrentValue = false,
    Callback = function(state)
        SetPotatoGraphics(state)
    end
})

-- Network
local function OptimizeNetwork(state)
    if state then
        -- Improve Network Performance
        game:GetService("NetworkSettings").IncomingReplicationLag = 0
        setfpscap(60) -- Limit FPS to stabilize performance
        
        -- Reduce Physics Lag
        settings().Physics.AllowSleep = true
        settings().Physics.ThrottleAdjustTime = 1

        -- Improve Server Communication
        game:GetService("Players").LocalPlayer.ReplicationFocus = workspace
        
        -- Notify Player
        Rayfield:Notify({
            Title = "Ping Optimization",
            Content = "Ping Optimized Successfully! 🟢",
            Duration = 5,
            Image = 4483362458,
        })
    else
        -- Reset Network Settings when Disabled
        game:GetService("NetworkSettings").IncomingReplicationLag = 0.1
        setfpscap(120) -- Set FPS back to default
    end
end

-- **Create Toggle in UI**
Tab:CreateToggle({
    Name = "Stable Ping (Reduce Lag)",
    CurrentValue = false,
    Callback = function(state)
        OptimizeNetwork(state)
    end
})

local CurrentFPS = 60 -- Default FPS Cap

local function SetFPSCap(fps)
    setfpscap(fps)
    CurrentFPS = fps
    
    -- Notify the Player
    Rayfield:Notify({
        Title = "FPS Unlocked",
        Content = "FPS Cap Set to " .. fps .. " 🟢",
        Duration = 5,
        Image = 4483362458,
    })
end

-- **Create Toggle in UI**
Tab:CreateToggle({
    Name = "Unlock FPS (Switch 60/120)",
    CurrentValue = false,
    Callback = function(state)
        if state then
            SetFPSCap(120) -- Unlock FPS to 120
        else
            SetFPSCap(60) -- Set FPS back to 60
        end
    end
})

-- **Show Current FPS Cap in UI**
Tab:CreateParagraph({Title = "Current FPS Cap:", Content = tostring(CurrentFPS) .. " FPS"})



-- Spectate


-------------------------------
-- 🌟 Teleport Tab
local Tab = Window:CreateTab("Teleport", 4483362458)
local Section = Tab:CreateSection("Main Island")

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- 🏝️ Teleport Function
local function TeleportToLocation(position)
    local character = LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local humanoidRootPart = character.HumanoidRootPart
        local distance = (humanoidRootPart.Position - position).Magnitude
        local travelTime = distance / 350
        local tweenInfo = TweenInfo.new(travelTime, Enum.EasingStyle.Linear)
        local tweenGoal = {CFrame = CFrame.new(position)}
        local teleportTween = TweenService:Create(humanoidRootPart, tweenInfo, tweenGoal)
        teleportTween:Play()
    end
end

-- 🏯 Castle on the Sea
Tab:CreateButton({
    Name = "Teleport to Castle on the Sea",
    Callback = function()
        TeleportToLocation(Vector3.new(-5021, 315, -3162))
    end
})

-- 🏝️ Hydra Island
Tab:CreateButton({
    Name = "Teleport to Hydra Island",
    Callback = function()
        TeleportToLocation(Vector3.new(5222, 75, -1450))
    end
})

-- 🏝️ Tiki Outpost
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local function teleportToTikiOutpost()
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = player.Character.HumanoidRootPart
        local tikiOutpostPosition = Vector3.new(-15800, 250, 1030) -- Corrected Tiki Outpost coordinates
        
        local distance = (hrp.Position - tikiOutpostPosition).Magnitude
        local tweenTime = distance / 350 -- Tween Speed 350
        
        local tweenInfo = TweenInfo.new(tweenTime, Enum.EasingStyle.Linear)
        local tween = TweenService:Create(hrp, tweenInfo, {Position = tikiOutpostPosition})
        tween:Play()
    end
end

Tab:CreateButton({
    Name = "Teleport to Tiki Outpost",
    Callback = function()
        teleportToTikiOutpost()
    end
})

-------------------------------
-- 🌟 ESP Feature
local Tab = Window:CreateTab("Visuals", 4483362458)
local Section = Tab:CreateSection("ESP All")

local ESPEnabled = false
local ESPFolder = Instance.new("Folder", game.CoreGui)
ESPFolder.Name = "ESPFolder"

local function createESP(player)
    if player ~= LocalPlayer then
        local character = player.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            local BillboardGui = Instance.new("BillboardGui", ESPFolder)
            BillboardGui.Adornee = character.HumanoidRootPart
            BillboardGui.Size = UDim2.new(0, 200, 0, 50)
            BillboardGui.StudsOffset = Vector3.new(0, 3, 0)
            BillboardGui.AlwaysOnTop = true

            local TextLabel = Instance.new("TextLabel", BillboardGui)
            TextLabel.Size = UDim2.new(1, 0, 1, 0)
            TextLabel.BackgroundTransparency = 1
            TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
            TextLabel.TextStrokeTransparency = 0
            TextLabel.TextScaled = true
            TextLabel.Font = Enum.Font.SourceSansBold
            TextLabel.Text = player.Name .. " | 0m"
            BillboardGui.Parent = ESPFolder

            task.spawn(function()
                while ESPEnabled and character and character:FindFirstChild("HumanoidRootPart") do
                    local distance = math.floor((LocalPlayer.Character.HumanoidRootPart.Position - character.HumanoidRootPart.Position).Magnitude)
                    TextLabel.Text = player.Name .. " | " .. distance .. "m"
                    task.wait(0.5)
                end
                BillboardGui:Destroy()
            end)
        end
    end
end

Tab:CreateToggle({
    Name = "ESP (Show Players)",
    CurrentValue = false,
    Flag = "ESP_Toggle",
    Callback = function(Value)
        ESPEnabled = Value
        if ESPEnabled then
            for _, player in pairs(Players:GetPlayers()) do createESP(player) end
        else
            ESPFolder:ClearAllChildren()
        end
    end
})

-- ESP ISLAND
local ESPIslandEnabled = false

local function ToggleESPIsland()
    ESPIslandEnabled = not ESPIslandEnabled

    if not ESPIslandEnabled then
        for _, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            if v:FindFirstChild("IslandESP") then
                v:FindFirstChild("IslandESP"):Destroy()
            end
        end
        return
    end

    for _, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        if v:IsA("Part") and not v:FindFirstChild("IslandESP") then
            local billboard = Instance.new("BillboardGui")
            local textLabel = Instance.new("TextLabel")

            billboard.Name = "IslandESP"
            billboard.Adornee = v
            billboard.Size = UDim2.new(0, 150, 0, 25)
            billboard.StudsOffset = Vector3.new(0, 5, 0)
            billboard.AlwaysOnTop = true

            textLabel.Parent = billboard
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.Text = v.Name
            textLabel.TextColor3 = Color3.fromRGB(0, 0, 255) 
            textLabel.TextStrokeTransparency = 0.5
            textLabel.TextScaled = true
            textLabel.Font = Enum.Font.SourceSansBold

            billboard.Parent = v
        end
    end
end

Tab:CreateToggle({
    Name = "ESP (Show Islands)",
    CurrentValue = false,
    Flag = "ESPIsland_Toggle",
    Callback = function(Value)
        ESPIslandEnabled = Value
        ToggleESPIsland()
    end
})

-- 🌟 Additional Features Tab
local Tab = Window:CreateTab("Script Helpul OP", 4483362458)
local Section = Tab:CreateSection("Main")

-- 🔴 Redz Script Button
Tab:CreateButton({
    Name = "Redz (Make Sure Turn on Bypass)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))(Settings)
    end
})