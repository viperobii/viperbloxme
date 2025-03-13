--[[BloxFruit Fully Fixed and Optimized Script]]--

local player = game:GetService("Players").LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui", playerGui)

-- UI Elements
local backgroundFrame = Instance.new("Frame", screenGui)
backgroundFrame.Size = UDim2.new(1, 0, 1, 0)
backgroundFrame.BackgroundColor3 = Color3.new(0, 0, 0)
backgroundFrame.BackgroundTransparency = 0.99

local textLabel = Instance.new("TextLabel", screenGui)
textLabel.Size = UDim2.new(0, 200, 0, 50)
textLabel.Position = UDim2.new(0.5, -100, 0, 0)
textLabel.BackgroundTransparency = 1
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.Text = "Viper Hub is Loaded"
textLabel.TextScaled = true
textLabel.TextWrapped = true
textLabel.TextXAlignment = Enum.TextXAlignment.Center
textLabel.TextYAlignment = Enum.TextYAlignment.Center
textLabel.Font = Enum.Font.SourceSansBold
textLabel.TextStrokeTransparency = 0
textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
textLabel.TextSize = 20
textLabel.TextTransparency = 0

wait(1)
textLabel:TweenPosition(UDim2.new(0.5, -100, 0.5, -25), "Out", "Quint", 1, true)

-- Detect Game Worlds
local placeId = game.PlaceId
local OldWorld, NewWorld, ThreeWorld, BloxFruit = false, false, false, false

if placeId == 2753915549 then
    OldWorld = true
elseif placeId == 4442272183 then
    NewWorld = true
elseif placeId == 7449423635 then
    ThreeWorld = true
end

if OldWorld or NewWorld or ThreeWorld then
    BloxFruit = true
end

-- Load Fluent UI
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Window = Fluent:CreateWindow({
    Title = "Viper Hub",
    SubTitle = "by Viper_",
    TabWidth = 130,
    Size = UDim2.fromOffset(500, 320),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl
})

-- Create Floating UI Toggle Button
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FloatingUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local floatingButton = Instance.new("ImageButton")
floatingButton.Name = "ToggleButton"
floatingButton.Image = "rbxassetid://7229442422" -- Crying Cat Image
floatingButton.Size = UDim2.new(0, 40, 0, 40)
floatingButton.Position = UDim2.new(0, 20, 0, 100)
floatingButton.BackgroundTransparency = 1
floatingButton.Active = true
floatingButton.Draggable = true
floatingButton.Parent = screenGui

-- Ensure UI is initially visible
Window.Root.Visible = true

-- Toggle UI visibility with floating button
local uiVisible = true
local function toggleUI()
    uiVisible = not uiVisible
    Window.Root.Visible = uiVisible
end

floatingButton.MouseButton1Click:Connect(toggleUI)


local Tabs = {
    Farm = Window:AddTab({ Title = "Tabs Main", Icon = "" }),
    Main = Window:AddTab({ Title = "Tabs Teleports & Events", Icon = "" }),
    Teleport = Window:AddTab({ Title = "Tabs V4 Races", Icon = "" }),
    Auto = Window:AddTab({ Title = "Tabs Items", Icon = "" }),
    Setting = Window:AddTab({ Title = "Tabs Main Settings", Icon = "" }),
    Visual = Window:AddTab({ Title = "Tabs Main Esp", Icon = "" }),
    Combat = Window:AddTab({ Title = "Tabs Main Combat", Icon = "" }),
}



-- TP
local OldWorld = game.PlaceId == 2753915549  -- First Sea
local NewWorld = game.PlaceId == 4442272183 -- Second Sea
local ThirdSea = game.PlaceId == 7449423635 -- Third Sea

local islands = {}

if OldWorld then
    islands = {"Pirate Starter", "Marine Starter", "Jungle", "Pirate Village", "Desert", "Frozen Village", "MarineFord", "Sky 1st Floor", "Prison", "Sky 2nd Floor", "Sky 3rd Floor"}

    function getCFrameForIsland(islandName)
        local positions = {
            ["Pirate Starter"] = CFrame.new(1071.2832, 16.3085976, 1426.86792),
            ["Marine Starter"] = CFrame.new(-2573.3374, 6.88881969, 2046.99817),
            ["Jungle"] = CFrame.new(-1249.77222, 11.8870859, 341.356476),
            ["Pirate Village"] = CFrame.new(-1122.34998, 4.78708982, 3855.91992),
            ["Desert"] = CFrame.new(1094.14587, 6.47350502, 4192.88721),
            ["Frozen Village"] = CFrame.new(1198.00928, 27.0074959, -1211.73376),
            ["MarineFord"] = CFrame.new(-4505.375, 20.687294, 4260.55908),
            ["Sky 1st Floor"] = CFrame.new(-4970.21875, 717.707275, -2622.35449),
            ["Prison"] = CFrame.new(4854.16455, 5.68742752, 740.194641),
            ["Sky 2nd Floor"] = CFrame.new(-4813.0249, 903.708557, -1912.69055),
            ["Sky 3rd Floor"] = CFrame.new(-7952.31006, 5545.52832, -320.704956)
        }
        return positions[islandName]
    end

elseif NewWorld then
    islands = {"Mansion", "Green Zone", "Graveyard", "Dark Arena", "Snow Mountain", "Hot and Cold", "Cursed Ship", "Ice Castle", "Forgotten Island", "Haunted Castle"}

    function getCFrameForIsland(islandName)
        local positions = {
            ["Mansion"] = CFrame.new(-12550, 335, -7500),
            ["Green Zone"] = CFrame.new(-2372, 72, -3160),
            ["Graveyard"] = CFrame.new(-5450, 8, -720),
            ["Dark Arena"] = CFrame.new(5223, 8, -25),
            ["Snow Mountain"] = CFrame.new(540, 427, -5297),
            ["Hot and Cold"] = CFrame.new(-5471, 15, -5047),
            ["Cursed Ship"] = CFrame.new(900, 124, 33030),
            ["Ice Castle"] = CFrame.new(5405, 28, -6238),
            ["Forgotten Island"] = CFrame.new(-3057, 238, -10191),
            ["Haunted Castle"] = CFrame.new(-9500, 142, 5535)
        }
        return positions[islandName]
    end

elseif ThirdSea then
    islands = {"Port Town", "Hydra Island", "Great Tree", "Floating Turtle", "Castle on the Sea", "Haunted Castle", "Sea of Treats"}

    function getCFrameForIsland(islandName)
        local positions = {
            ["Port Town"] = CFrame.new(-29740, 57, 2585),
            ["Hydra Island"] = CFrame.new(5227, 604, 345),
            ["Great Tree"] = CFrame.new(3020.11, 2330.64, -7321.3),
            ["Floating Turtle"] = CFrame.new(-11398, 400, -8221),
            ["Castle on the Sea"] = CFrame.new(-5021, 315, -3162),
            ["Haunted Castle"] = CFrame.new(-9515, 142, 5535),
            ["Sea of Treats"] = CFrame.new(-2066, 198, -12127)
        }
        return positions[islandName]
    end
end

function Tween(targetCFrame)
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local tweenService = game:GetService("TweenService")
        local tweenInfo = TweenInfo.new((player.Character.HumanoidRootPart.Position - targetCFrame.Position).Magnitude / 350, Enum.EasingStyle.Linear)
        local tween = tweenService:Create(player.Character.HumanoidRootPart, tweenInfo, {CFrame = targetCFrame})
        tween:Play()
    end
end

function is(land)
    local targetCFrame = getCFrameForIsland(land)
    if targetCFrame then
        Tween(targetCFrame)
    else
        print("Unknown island: " .. land)
    end
end

local section = Tabs.Main:AddSection("Island Teleport")
local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
    Title = "Select Island",
    Values = islands, -- Now correctly assigned based on world
    Multi = false,
    Default = 1,
})

local Toggle = Tabs.Main:AddToggle("TeleportToggle", {Title = "Enable Teleport", Default = false})

Toggle:OnChanged(function(Value)
    if Value then
        is(Dropdown.Value)  -- Teleport when toggle is enabled
    end
end)

-- Services & Player Info
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()

-- Race Door Positions
local RaceDoors = {
    ["Ghoul"] = CFrame.new(28673.27, 14890.43, 451.45),
    ["Shark"] = CFrame.new(28224.74, 14890.73, -211.14),
    ["Angel"] = CFrame.new(28967.98, 14919.37, 235.12),
    ["Cyborg"] = CFrame.new(28497.43, 14895.72, -422.1),
    ["Mink"] = CFrame.new(29016, 14891, -379),
    ["Human"] = CFrame.new(29234.06, 14890.73, -206.79)
}

-- Tween function for smooth teleport
local function TweenToTarget(targetCFrame)
    if Character and Character:FindFirstChild("HumanoidRootPart") then
        local HRP = Character.HumanoidRootPart
        local distance = (HRP.Position - targetCFrame.Position).Magnitude
        local TweenInfo = TweenInfo.new(distance / 350, Enum.EasingStyle.Linear)
        local Tween = TweenService:Create(HRP, TweenInfo, {CFrame = targetCFrame})
        Tween:Play()
    else
        warn("HumanoidRootPart not found!")
    end
end

-- Fluent UI Implementation
local Section = Tabs.Teleport:AddSection("Race Door Teleport")

-- Dropdown to select race door
local RaceDropdown = Tabs.Teleport:AddDropdown("RaceDropdown", {
    Title = "Select Race Door",
    Values = {"Ghoul", "Shark", "Angel", "Cyborg", "Mink", "Human"},
    Multi = false,
    Default = 1,
})

-- Toggle for teleportation
local TeleportToggle = Tabs.Teleport:AddToggle("RaceTeleportToggle", {Title = "Enable Teleport", Default = false})

-- Debounce system to prevent multiple executions
local Teleporting = false

local function TeleportToRace()
    if Teleporting then return end
    Teleporting = true
    
    local SelectedRace = RaceDropdown.Value
    local TargetCFrame = RaceDoors[SelectedRace]

    if TargetCFrame then
        TweenToTarget(TargetCFrame)
    else
        warn("Invalid race selected.")
    end

    -- Delay to prevent spam
    task.wait(2)
    Teleporting = false
end

-- Trigger teleport when toggle is enabled
TeleportToggle:OnChanged(function(Value)
    if Value then
        TeleportToRace()
    end
end)

-- Update teleport when dropdown value changes while toggle is active
RaceDropdown:OnChanged(function()
    if TeleportToggle.Value then
        TeleportToRace()
    end
end)

local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")

-- Remove Fog Button
local RemoveFogToggle = Tabs.Setting:AddToggle("RemoveFog", { Title = "Remove Fog", Default = false })

RemoveFogToggle:OnChanged(function(Value)
    _G.RemoveFog = Value
    if Value then
        Fluent:Notify({
            Title = "Cat Hub",
            Content = "Fog Removed!",
            Duration = 5
        })
        game:GetService("Lighting").FogEnd = 100000
        for _, v in pairs(game:GetService("Lighting"):GetDescendants()) do
            if v:IsA("Atmosphere") then
                v:Destroy()
            end
        end
    else
        Fluent:Notify({
            Title = "Notification",
            Content = "Fog Restored!",
            Duration = 5
        })
        game:GetService("Lighting").FogEnd = 1000 -- Default value (adjust if needed)
        local Atmosphere = Instance.new("Atmosphere", game:GetService("Lighting")) -- Restores atmosphere
        Atmosphere.Density = 0.3 -- Adjust default density
    end
end)

-- FullBright Toggle
local isFullBrightEnabled = false
local defaultBrightness = Lighting.Brightness
local defaultClockTime = Lighting.ClockTime
local defaultGlobalShadows = Lighting.GlobalShadows
local defaultOutdoorAmbient = Lighting.OutdoorAmbient

local function applyFullBright()
    Lighting.Brightness = 2
    Lighting.ClockTime = 14
    Lighting.GlobalShadows = false
    Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
end

local function resetLighting()
    Lighting.Brightness = defaultBrightness
    Lighting.ClockTime = defaultClockTime
    Lighting.GlobalShadows = defaultGlobalShadows
    Lighting.OutdoorAmbient = defaultOutdoorAmbient
end

local Toggle = Tabs.Setting:AddToggle("MyTeleport", { Title = "FullBright", Default = false })

Toggle:OnChanged(function(Value)
    isFullBrightEnabled = Value

    if isFullBrightEnabled then
        applyFullBright()
        RunService:BindToRenderStep("FullBright", Enum.RenderPriority.Camera.Value, applyFullBright)
    else
        RunService:UnbindFromRenderStep("FullBright")
        resetLighting()
    end
end)


-- Automatic
local section = Tabs.Auto:AddSection("Claim Codes")
Tabs.Auto:AddButton({
    Title = "RedeemAllCode",
    Callback = function()
        local codes = {
            "CODESLIDE", "NOOB2ADMIN", "fruitconcepts", "ADMINDARES", "ADMINHACKED",
            "TRIPLEABUSE", "SEATROLLING", "24NOADMIN", "REWARDFUN", "NEWTROLL", 
            "SECRET_ADMIN", "KITT_RESET", "CHANDLER", "Sub2CaptainMaui", "kittgaming", 
            "Sub2Fer999", "Enyu_is_Pro", "Magicbus", "JCWK", "Starcodeheo", "Bluxxy", 
            "fudd10_v2", "SUB2GAMERROBOT_EXP1", "SUB2GAMERROBOT_RESET1", "Sub2UncleKizaru", 
            "Axiore", "Sub2Daigrock", "Bignews", "Sub2NoobMaster123", "StrawHatMaine", 
            "TantaiGaming", "Fudd10", "TheGreatAce", "Sub2OfficialNoobie", "krazydares"
        }
        local remote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Redeem")
        for _, code in ipairs(codes) do
            remote:InvokeServer(code)
        end
    end
})

-- Auto Buy SuperHuman Fighting Style
local SuperHumanToggle = Tabs.Auto:AddToggle("AutoSuperHuman", { Title = "Auto Buy SuperHuman", Default = false })
SuperHumanToggle:OnChanged(function(Value)
    _G.AutoSuperHuman = Value
    if Value then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
    end
end)

-- AutoBuy Electro
local ElectroToggle = Tabs.Auto:AddToggle("AutoElectro", { Title = "Auto Buy Electro", Default = false })
ElectroToggle:OnChanged(function(Value)
    _G.AutoElectro = Value
    if Value then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
    end
end)

-- Auto Buy Water Kung Fu
local WaterKungFuToggle = Tabs.Auto:AddToggle("AutoWaterKungFu", { Title = "Auto Buy Water Kung Fu", Default = false })
WaterKungFuToggle:OnChanged(function(Value)
    _G.AutoWaterKungFu = Value
    if Value then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
    end
end)

-- Auto Buy Sharkman Karate
local SharkmanKarateToggle = Tabs.Auto:AddToggle("AutoSharkmanKarate", { Title = "Auto Buy Sharkman Karate", Default = false })
SharkmanKarateToggle:OnChanged(function(Value)
    _G.AutoSharkmanKarate = Value
    if Value then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
    end
end)

-- Auto Buy Dragon Talon (Requires Dragon Breath First)
local DragonTalonToggle = Tabs.Auto:AddToggle("AutoDragonTalon", { Title = "Auto Buy Dragon Talon", Default = false })
DragonTalonToggle:OnChanged(function(Value)
    _G.AutoDragonTalon = Value
    if Value then
        local remote = game:GetService("ReplicatedStorage").Remotes.CommF_
        remote:InvokeServer("BuyDragonTalon") -- Corrected to directly buy Dragon Talon
    end
end)

-- Auto Buy Electric Claw
local ElectricClawToggle = Tabs.Auto:AddToggle("AutoElectricClaw", { Title = "Auto Buy Electric Claw", Default = false })
ElectricClawToggle:OnChanged(function(Value)
    _G.AutoElectricClaw = Value
    if Value then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
    end
end)

-- Auto Buy God Human
local GodHumanToggle = Tabs.Auto:AddToggle("AutoGodHuman", { Title = "Auto Buy God Human (Fixing)", Default = false })
GodHumanToggle:OnChanged(function(Value)
    _G.AutoGodHuman = Value
    if Value then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodHuman")
    end
end)

local AntiAFKToggle = Tabs.Setting:AddToggle("AntiAFK", { Title = "Anti AFK", Default = false })
AntiAFKToggle:OnChanged(function(Value)
    _G.AntiAFK = Value
    if Value then
        if not _G.AntiAFKConnection then
            _G.AntiAFKConnection = game:GetService("Players").LocalPlayer.Idled:Connect(function()
                game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                wait(1)
                game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            end)
        end
    else
        if _G.AntiAFKConnection then
            _G.AntiAFKConnection:Disconnect()
            _G.AntiAFKConnection = nil
        end
    end
end)

-- 
local MirageIslandESPToggle = Tabs.Visual:AddToggle("MirageIslandESP", { 
    Title = "Mirage Island ESP", 
    Default = false 
})

MirageIslandESPToggle:OnChanged(function(Value)
    _G.MirageIslandESP = Value
    if Value then
        Fluent:Notify({
            Title = "Cat Hub",
            Content = "Mirage Island ESP Enabled!",
            Duration = 4
        })
        while _G.MirageIslandESP do
            UpdateMirageIslandESP()
            wait(1) -- Update ESP every second
        end
    else
        Fluent:Notify({
            Title = "Cat Hub",
            Content = "Mirage Island ESP Disabled!",
            Duration = 4
        })
        -- Remove existing ESP markers
        for _, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            if v.Name == "Mirage Island" and v:FindFirstChild("NameEsp") then
                v:FindFirstChild("NameEsp"):Destroy()
            end
        end
    end
end)

function UpdateMirageIslandESP() 
    for _, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        pcall(function()
            if _G.MirageIslandESP and v.Name == "Mirage Island" then
                if not v:FindFirstChild("NameEsp") then
                    local bill = Instance.new("BillboardGui", v)
                    bill.Name = "NameEsp"
                    bill.ExtentsOffset = Vector3.new(0, 2, 0)
                    bill.Size = UDim2.new(0, 200, 0, 50)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true

                    local name = Instance.new("TextLabel", bill)
                    name.Font = Enum.Font.GothamBold
                    name.TextSize = 14
                    name.TextWrapped = true
                    name.Size = UDim2.new(1, 0, 1, 0)
                    name.TextYAlignment = Enum.TextYAlignment.Top
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(80, 245, 245)
                    name.Text = v.Name .. " - Loading..."
                else
                    v["NameEsp"].TextLabel.Text = v.Name .. " - " .. math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude) .. "m"
                end
            elseif v:FindFirstChild("NameEsp") then
                v:FindFirstChild("NameEsp"):Destroy()
            end
        end)
    end
end






-- ESP
local IslandESPToggle = Tabs.Visual:AddToggle("IslandESP", { Title = "Island ESP", Default = false })

IslandESPToggle:OnChanged(function(Value)
    _G.IslandESP = Value
    if Value then
        Fluent:Notify({
            Title = "Cat Hub",
            Content = "Island ESP Enabled!",
            Duration = 4
        })
        while _G.IslandESP do
            UpdateIslandESP()
            wait(1) -- Adjust if needed to update ESP frequently
        end
    else
        Fluent:Notify({
            Title = "Cat Hub",
            Content = "Island ESP Disabled!",
            Duration = 4
        })
        -- Remove existing ESP markers
        for _, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            if v:FindFirstChild('NameEsp') then
                v:FindFirstChild('NameEsp'):Destroy()
            end
        end
    end
end)

function UpdateIslandESP() 
    for _, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        pcall(function()
            if _G.IslandESP then 
                if v.Name ~= "Sea" then
                    if not v:FindFirstChild('NameEsp') then
                        local bill = Instance.new('BillboardGui', v)
                        bill.Name = 'NameEsp'
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1, 200, 1, 30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel', bill)
                        name.Font = Enum.Font.GothamBold
                        name.TextSize = 14
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = Enum.TextYAlignment.Top
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(135, 206, 250)
                        name.Text = (v.Name .. '   \n' .. math.floor((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude / 3) .. ' Distance')
                    else
                        v['NameEsp'].TextLabel.Text = (v.Name .. '   \n' .. math.floor((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude / 3) .. ' Distance')
                    end
                end
            else
                if v:FindFirstChild('NameEsp') then
                    v:FindFirstChild('NameEsp'):Destroy()
                end
            end
        end)
    end
end

-- Fruit Esp
local DevilFruitESP_Toggle = Tabs.Visual:AddToggle("DevilFruitESP", {Title = "Devil Fruit ESP", Default = false})

function UpdateDevilChams() 
    for i, v in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if DevilFruitESP_Toggle.Value then -- Check toggle state
                if string.find(v.Name, "Fruit") then   
                    if not v.Handle:FindFirstChild('NameEsp'..Number) then
                        local bill = Instance.new('BillboardGui', v.Handle)
                        bill.Name = 'NameEsp'..Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1, 200, 1, 30)
                        bill.Adornee = v.Handle
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel', bill)
                        name.Font = Enum.Font.GothamSemibold
                        name.TextSize = 14 -- Corrected from FontSize
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = Enum.TextYAlignment.Top
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(255, 255, 255)
                        name.Text = (v.Name .. ' \n' .. math.round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) .. ' Distance')
                    else
                        v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name .. ' \n' .. math.round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) .. ' Distance')
                    end
                end
            else
                if v.Handle:FindFirstChild('NameEsp'..Number) then
                    v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end
        end)
    end
end

-- Auto-update function
game:GetService("RunService").RenderStepped:Connect(UpdateDevilChams)

-- Aimbot
local SkillAimbotToggle = Tabs.Combat:AddToggle("SkillAimbot", {Title = "Aimbot Fruit Skill (Fixing Bugs)", Default = false})

-- Function to find the closest target (Mobs & Players, Excluding NPCs)
local function GetClosestTarget()
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return nil end

    local closestTarget = nil
    local shortestDistance = math.huge
    local myPosition = character.HumanoidRootPart.Position

    -- Check for players (excluding local player)
    for _, target in pairs(game:GetService("Players"):GetPlayers()) do
        if target ~= player and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            local targetPosition = target.Character.HumanoidRootPart.Position
            local distance = (myPosition - targetPosition).Magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                closestTarget = target.Character.HumanoidRootPart.Position
            end
        end
    end

    -- Check for mobs only (exclude NPCs)
    for _, mob in pairs(game.Workspace:GetChildren()) do
        if mob:IsA("Model") and mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChildOfClass("Humanoid") then
            -- Exclude neutral NPCs (non-enemy)
            if mob:FindFirstChild("EnemyTag") or mob:FindFirstChild("Health") then
                local targetPosition = mob.HumanoidRootPart.Position
                local distance = (myPosition - targetPosition).Magnitude
                if distance < shortestDistance then
                    shortestDistance = distance
                    closestTarget = targetPosition
                end
            end
        end
    end

    return closestTarget
end

-- Hook into the game's remote event system
spawn(function()
    local gg = getrawmetatable(game)
    local old = gg.__namecall
    setreadonly(gg, false)
    
    gg.__namecall = newcclosure(function(...)
        local method = getnamecallmethod()
        local args = {...}

        if tostring(method) == "FireServer" then
            if tostring(args[1]) == "RemoteEvent" then
                if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                    if SkillAimbotToggle.Value then -- Only works if toggle is enabled
                        local closestTarget = GetClosestTarget()
                        if closestTarget then
                            if type(args[2]) == "vector" then
                                args[2] = closestTarget
                            else
                                args[2] = CFrame.new(closestTarget)
                            end
                            return old(unpack(args))
                        end
                    end
                end
            end
        end
        return old(...)
    end)
end)


-- Check if player is in Second or Third Sea
local Third_Sea = game.PlaceId == 7449423635
local Second_Sea = game.PlaceId == 4442272183

-- Chest Farm Variables
local ChestFarmSea3 = false
local ChestFarmSea2 = false
local AutoFarmChest = false

-- Function to teleport to chests smoothly
local function TPchest(P1)          
    local Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    local Speed = 500 -- Lowered speed for smoothness
    local tween = game:GetService("TweenService"):Create(
        game.Players.LocalPlayer.Character.HumanoidRootPart, 
        TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear), 
        {CFrame = P1}
    )
    tween:Play()                                    
end

-- Auto Farm Chest for Third Sea (God's Chalice)
if Third_Sea then
    game:GetService('RunService').RenderStepped:Connect(function()           
        if ChestFarmSea3 then
            if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("God's Chalice") then 
                ChestFarmSea3 = false
            else 
                for i = 1, 3 do
                    local chest = game:GetService("Workspace"):FindFirstChild("Chest" .. i)
                    if chest then
                        TPchest(chest.CFrame)
                        wait(1) -- Added wait to prevent spamming teleport
                    end
                end
            end
        end
    end)
end

-- Auto Farm Chest for Second Sea (Fist of Darkness)
if Second_Sea then
    game:GetService('RunService').RenderStepped:Connect(function()           
        if ChestFarmSea2 then
            if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") then 
                ChestFarmSea2 = false
            else 
                for i = 1, 3 do
                    local chest = game:GetService("Workspace"):FindFirstChild("Chest" .. i)
                    if chest then
                        TPchest(chest.CFrame)
                        wait(1)
                    end
                end
            end
        end
    end)
end

-- UI Toggle for Auto Chest Farm (Third Sea)
if Third_Sea then
    local ToggleChestSea3 = Tabs.Farm:AddToggle("ToggleChestSea3", {
        Title = "Auto Chest (Fixing Dont Use)",
        Description = "Stops when you get God's Chalice", 
        Default = false
    })
    ToggleChestSea3:OnChanged(function(Value)
        ChestFarmSea3 = Value
    end)
    Options.ToggleChestSea3:SetValue(false)
end

-- UI Toggle for Auto Chest Farm (Second Sea)
if Second_Sea then
    local ToggleChestSea2 = Tabs.Farm:AddToggle("ToggleChestSea2", {
        Title = "Auto Chest (Fixing Dont Use)",
        Description = "Stops when you get Fist of Darkness", 
        Default = false
    })
    ToggleChestSea2:OnChanged(function(Value)
        ChestFarmSea2 = Value
    end)
    Options.ToggleChestSea2:SetValue(false)
end

-- Auto Farm Chest Tween Toggle
local ToggleChestTween = Tabs.Farm:AddToggle("ToggleChestTween", {
    Title = "Auto Chest Tween (Fixing Dont Use)",
    Description = "Automatically moves to chests", 
    Default = false
})
ToggleChestTween:OnChanged(function(Value)
    AutoFarmChest = Value
end)
Options.ToggleChestTween:SetValue(false)

-- Auto Farm Chest Tween Function
spawn(function()
    while wait() do 
        if AutoFarmChest then
            for _, v in pairs(game:GetService("Workspace"):GetChildren()) do 
                if v.Name:find("Chest") then
                    if game:GetService("Workspace"):FindFirstChild(v.Name) then
                        local distance = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if distance <= 5000 then
                            repeat wait()
                                if game:GetService("Workspace"):FindFirstChild(v.Name) then
                                    TPchest(v.CFrame)
                                end
                            until not AutoFarmChest or not v.Parent
                            TPchest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                            break
                        end
                    end
                end
            end
        end
    end
end)

-- ki
if Third_Sea then
      local RoughSea = Tabs.Main:AddSection("Kitsune")


      local ToggleEspKitsune = Tabs.Main:AddToggle("ToggleEspKitsune", {Title = "Esp Kitsune Island",Description = "", Default = false })
      ToggleEspKitsune:OnChanged(function(Value)
        KitsuneIslandEsp = Value
        while KitsuneIslandEsp do wait()
            UpdateIslandKisuneESP() 
        end
    end)
      Options.ToggleEspKitsune:SetValue(false)

      function UpdateIslandKisuneESP() 
        for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            pcall(function()
                if KitsuneIslandEsp then 
                    if v.Name == "Kitsune Island" then
                        if not v:FindFirstChild('NameEsp') then
                            local bill = Instance.new('BillboardGui',v)
                            bill.Name = 'NameEsp'
                            bill.ExtentsOffset = Vector3.new(0, 1, 0)
                            bill.Size = UDim2.new(1,200,1,30)
                            bill.Adornee = v
                            bill.AlwaysOnTop = true
                            local name = Instance.new('TextLabel',bill)
                            name.Font = "Code"
                            name.FontSize = "Size14"
                            name.TextWrapped = true
                            name.Size = UDim2.new(1,0,1,0)
                            name.TextYAlignment = 'Top'
                            name.BackgroundTransparency = 1
                            name.TextStrokeTransparency = 0.5
                            name.TextColor3 = Color3.fromRGB(80, 245, 245)
                        else
                            v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                        end
                    end
                else
                    if v:FindFirstChild('NameEsp') then
                        v:FindFirstChild('NameEsp'):Destroy()
                    end
                end
            end)
        end
    end

      local ToggleTPKitsune = Tabs.Main:AddToggle("ToggleTPKitsune", {Title = "Tween To Kitsune Island",Description = "", Default = false })
      ToggleTPKitsune:OnChanged(function(Value)
        _G.TweenToKitsune = Value
      end)
      Options.ToggleTPKitsune:SetValue(false)
      spawn(function()
        local kitsuneIsland
        while not kitsuneIsland do
            kitsuneIsland = game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland")
            wait(1)
        end
        while wait() do
            if _G.TweenToKitsune then
                local shrineActive = kitsuneIsland:FindFirstChild("ShrineActive")
                if shrineActive then
                    for _, v in pairs(shrineActive:GetDescendants()) do
                        if v:IsA("BasePart") and v.Name:find("NeonShrinePart") then
                            Tween(v.CFrame)
                        end
                    end
                end
            end
        end
    end)