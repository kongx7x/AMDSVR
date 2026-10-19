-- BENCH MOBILE // FULL TOUCH v8.3 (Completo e Original)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local CoreGui = game:GetService("CoreGui")
local SoundService = game:GetService("SoundService")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

local OriginalLighting = {
    Brightness = Lighting.Brightness,
    ClockTime = Lighting.ClockTime,
    FogEnd = Lighting.FogEnd,
    GlobalShadows = Lighting.GlobalShadows,
    OutdoorAmbient = Lighting.OutdoorAmbient,
    Ambient = Lighting.Ambient
}

local Config = {
    Aimbot = false,
    WallCheck = true,
    TeamCheck = false,
    TargetNPCs = true,
    AimPart = "Head",
    FOVSize = 110,
    ShowFOV = false,
    MagicBullet = false,
    MagicRange = 600,
    HitboxSize = 14,
    DamageBoost = false,
    DamageMultiplier = 4,
    ESP = false,
    SkeletonESP = true,
    Fullbright = false,
    GodMode = false,
    InfJump = false,
    Fly = false,
    FlySpeed = 55,
    FlyVertical = 0,
    Speed = false,
    WalkSpeed = 48,
    Noclip = false,
    DesyncBody = false,      -- Corpo no céu, câmera fica no chão
    InstantPrompts = false,  -- Abre baús e portas instantaneamente
    AnimRemover = false,     -- Remove delay de animação de facas/ferramentas
    AttachBack = false,
    Flinging = false,
    UISounds = true,
    SelectedPlayer = nil,
    CopiedCoordString = ""
}

local function getGuiParent()
    local ok, res = pcall(function()
        return (gethui and gethui()) or CoreGui
    end)
    if ok and res then return res end
    return LocalPlayer:WaitForChild("PlayerGui")
end

local parentGui = getGuiParent()
if parentGui:FindFirstChild("OllieMobileHub") then
    parentGui.OllieMobileHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "OllieMobileHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = parentGui

-- ==========================================
-- MOTOR DE EFEITOS SONOROS DA UI (SFX)
-- ==========================================
local SoundFolder = Instance.new("Folder")
SoundFolder.Name = "BenchAudioBank"
SoundFolder.Parent = ScreenGui

local SoundBank = {
    Tab     = {Id = "rbxassetid://6895079853", Pitch = 1.05, Volume = 0.55},
    ToggleOn= {Id = "rbxassetid://6895079853", Pitch = 1.25, Volume = 0.65},
    ToggleOff={Id = "rbxassetid://6895079853", Pitch = 0.85, Volume = 0.55},
    Step    = {Id = "rbxassetid://6042053626", Pitch = 1.15, Volume = 0.50},
    Action  = {Id = "rbxassetid://4590662766", Pitch = 1.00, Volume = 0.65},
    Error   = {Id = "rbxassetid://4590657391", Pitch = 0.90, Volume = 0.65},
    Menu    = {Id = "rbxassetid://6042053626", Pitch = 0.95, Volume = 0.60}
}

local LoadedSounds = {}
for name, data in pairs(SoundBank) do
    local s = Instance.new("Sound")
    s.Name = "SFX_" .. name
    s.SoundId = data.Id
    s.PlaybackSpeed = data.Pitch
    s.Volume = data.Volume
    s.Parent = SoundFolder
    LoadedSounds[name] = s
end

local function playSFX(sfxName)
    if not Config.UISounds then return end
    local s = LoadedSounds[sfxName]
    if s then
        pcall(function() SoundService:PlayLocalSound(s) end)
    end
end

-- ==========================================
-- ARRASTE TOUCH
-- ==========================================
local function makeDraggable(dragHandle, targetFrame, onTapCallback)
    local dragging = false
    local dragInput = nil
    local dragStart = Vector3.zero
    local startPos = UDim2.new()
    local movedDistance = 0

    dragHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = targetFrame.Position
            movedDistance = 0
            dragInput = input
        end
    end)

    dragHandle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input == dragInput then
            local delta = input.Position - dragStart
            movedDistance = delta.Magnitude
            if movedDistance > 4 then
                targetFrame.Position = UDim2.new(
                    startPos.X.Scale, startPos.X.Offset + delta.X,
                    startPos.Y.Scale, startPos.Y.Offset + delta.Y
                )
            end
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if dragging and input == dragInput then
            dragging = false
            if movedDistance <= 6 and onTapCallback then onTapCallback() end
            dragInput = nil
        end
    end)
end

-- Círculo de FOV
local FOVCircle = Instance.new("Frame")
FOVCircle.Name = "FOVRing"
FOVCircle.AnchorPoint = Vector2.new(0.5, 0.5)
FOVCircle.Position = UDim2.new(0.5, 0, 0.5, 0)
FOVCircle.Size = UDim2.new(0, Config.FOVSize * 2, 0, Config.FOVSize * 2)
FOVCircle.BackgroundTransparency = 1
FOVCircle.Visible = Config.ShowFOV
FOVCircle.Parent = ScreenGui

Instance.new("UICorner", FOVCircle).CornerRadius = UDim.new(1, 0)
local FOVStroke = Instance.new("UIStroke", FOVCircle)
FOVStroke.Color = Color3.fromRGB(255, 70, 70)
FOVStroke.Thickness = 1.8
FOVStroke.Transparency = 0.15

-- Botão Flutuante Mobile
local FloatBtn = Instance.new("ImageButton")
FloatBtn.Name = "FloatingToggle"
FloatBtn.Size = UDim2.new(0, 50, 0, 50)
FloatBtn.Position = UDim2.new(0, 25, 0.45, 0)
FloatBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
FloatBtn.Image = "rbxassetid://6031280882"
FloatBtn.ImageColor3 = Color3.fromRGB(255, 90, 90)
FloatBtn.AutoButtonColor = false
FloatBtn.Parent = ScreenGui

Instance.new("UICorner", FloatBtn).CornerRadius = UDim.new(1, 0)
local FloatStroke = Instance.new("UIStroke", FloatBtn)
FloatStroke.Color = Color3.fromRGB(255, 90, 90)
FloatStroke.Thickness = 2

-- FlyPad
local FlyPad = Instance.new("Frame")
FlyPad.Name = "MobileFlyPad"
FlyPad.Size = UDim2.new(0, 54, 0, 116)
FlyPad.Position = UDim2.new(0.88, -20, 0.55, -58)
FlyPad.BackgroundTransparency = 1
FlyPad.Visible = false
FlyPad.Parent = ScreenGui

local UpBtn = Instance.new("TextButton")
UpBtn.Size = UDim2.new(1, 0, 0, 52)
UpBtn.Position = UDim2.new(0, 0, 0, 0)
UpBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
UpBtn.BackgroundTransparency = 0.2
UpBtn.Text = "SUBIR"
UpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
UpBtn.Font = Enum.Font.GothamBold
UpBtn.TextSize = 11
UpBtn.Parent = FlyPad
Instance.new("UICorner", UpBtn).CornerRadius = UDim.new(0, 8)
Instance.new("UIStroke", UpBtn).Color = Color3.fromRGB(90, 90, 110)

local DownBtn = Instance.new("TextButton")
DownBtn.Size = UDim2.new(1, 0, 0, 52)
DownBtn.Position = UDim2.new(0, 0, 0, 62)
DownBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
DownBtn.BackgroundTransparency = 0.2
DownBtn.Text = "DESCER"
DownBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DownBtn.Font = Enum.Font.GothamBold
DownBtn.TextSize = 11
DownBtn.Parent = FlyPad
Instance.new("UICorner", DownBtn).CornerRadius = UDim.new(0, 8)
Instance.new("UIStroke", DownBtn).Color = Color3.fromRGB(90, 90, 110)

UpBtn.InputBegan:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.Touch or inp.UserInputType == Enum.UserInputType.MouseButton1 then
        Config.FlyVertical = 1
        playSFX("Step")
    end
end)
UpBtn.InputEnded:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.Touch or inp.UserInputType == Enum.UserInputType.MouseButton1 then
        if Config.FlyVertical == 1 then Config.FlyVertical = 0 end
    end
end)

DownBtn.InputBegan:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.Touch or inp.UserInputType == Enum.UserInputType.MouseButton1 then
        Config.FlyVertical = -1
        playSFX("Step")
    end
end)
DownBtn.InputEnded:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.Touch or inp.UserInputType == Enum.UserInputType.MouseButton1 then
        if Config.FlyVertical == -1 then Config.FlyVertical = 0 end
    end
end)

-- Janela Principal
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 490, 0, 320)
MainFrame.Position = UDim2.new(0.5, -245, 0.5, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)
local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Color3.fromRGB(50, 50, 62)
MainStroke.Thickness = 1.5

makeDraggable(FloatBtn, FloatBtn, function()
    MainFrame.Visible = not MainFrame.Visible
    playSFX("Menu")
end)

-- Barra Superior
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 38)
TopBar.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 10)

local HeaderIcon = Instance.new("ImageLabel")
HeaderIcon.Size = UDim2.new(0, 20, 0, 20)
HeaderIcon.Position = UDim2.new(0, 12, 0.5, -10)
HeaderIcon.BackgroundTransparency = 1
HeaderIcon.Image = "rbxassetid://6031075938"
HeaderIcon.ImageColor3 = Color3.fromRGB(255, 85, 85)
HeaderIcon.Parent = TopBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -90, 1, 0)
TitleLabel.Position = UDim2.new(0, 40, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "BENCH MOBILE // FULL TOUCH v8.3"
TitleLabel.TextColor3 = Color3.fromRGB(235, 235, 245)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 13
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TopBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 26)
CloseBtn.Position = UDim2.new(1, -36, 0.5, -13)
CloseBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 13
CloseBtn.Parent = TopBar
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)
CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    playSFX("Menu")
end)

makeDraggable(TopBar, MainFrame, nil)

-- Sidebar
local Sidebar = Instance.new("ScrollingFrame")
Sidebar.Size = UDim2.new(0, 130, 1, -46)
Sidebar.Position = UDim2.new(0, 6, 0, 42)
Sidebar.BackgroundColor3 = Color3.fromRGB(23, 23, 29)
Sidebar.BorderSizePixel = 0
Sidebar.ScrollBarThickness = 2
Sidebar.AutomaticCanvasSize = Enum.AutomaticSize.Y
Sidebar.CanvasSize = UDim2.new(0, 0, 0, 0)
Sidebar.Parent = MainFrame
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 8)

local SideList = Instance.new("UIListLayout", Sidebar)
SideList.Padding = UDim.new(0, 6)
SideList.HorizontalAlignment = Enum.HorizontalAlignment.Center
SideList.SortOrder = Enum.SortOrder.LayoutOrder

local SidePad = Instance.new("UIPadding", Sidebar)
SidePad.PaddingTop = UDim.new(0, 8)
SidePad.PaddingBottom = UDim.new(0, 8)

-- PagesHolder
local PagesHolder = Instance.new("Frame")
PagesHolder.Size = UDim2.new(1, -148, 1, -46)
PagesHolder.Position = UDim2.new(0, 142, 0, 42)
PagesHolder.BackgroundColor3 = Color3.fromRGB(23, 23, 29)
PagesHolder.BorderSizePixel = 0
PagesHolder.Parent = MainFrame
Instance.new("UICorner", PagesHolder).CornerRadius = UDim.new(0, 8)

local Pages = {}
local TabButtons = {}

local function createTab(tabName, iconId)
    local Page = Instance.new("ScrollingFrame")
    Page.Name = tabName .. "Page"
    Page.Size = UDim2.new(1, -14, 1, -14)
    Page.Position = UDim2.new(0, 7, 0, 7)
    Page.BackgroundTransparency = 1
    Page.ScrollBarThickness = 3
    Page.ScrollBarImageColor3 = Color3.fromRGB(255, 85, 85)
    Page.Visible = false
    Page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    Page.CanvasSize = UDim2.new(0, 0, 0, 0)
    Page.Parent = PagesHolder

    local Layout = Instance.new("UIListLayout", Page)
    Layout.Padding = UDim.new(0, 7)
    Layout.SortOrder = Enum.SortOrder.LayoutOrder

    local TabBtn = Instance.new("TextButton")
    TabBtn.Size = UDim2.new(1, -12, 0, 38)
    TabBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
    TabBtn.Text = ""
    TabBtn.AutoButtonColor = false
    TabBtn.Parent = Sidebar
    Instance.new("UICorner", TabBtn).CornerRadius = UDim.new(0, 6)

    local Icon = Instance.new("ImageLabel")
    Icon.Size = UDim2.new(0, 20, 0, 20)
    Icon.Position = UDim2.new(0, 8, 0.5, -10)
    Icon.BackgroundTransparency = 1
    Icon.Image = iconId
    Icon.ImageColor3 = Color3.fromRGB(180, 180, 195)
    Icon.Parent = TabBtn

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -34, 1, 0)
    Label.Position = UDim2.new(0, 34, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = tabName
    Label.TextColor3 = Color3.fromRGB(180, 180, 195)
    Label.Font = Enum.Font.GothamSemibold
    Label.TextSize = 12
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = TabBtn

    TabBtn.MouseButton1Click:Connect(function()
        playSFX("Tab")
        for _, p in pairs(Pages) do p.Visible = false end
        for _, b in pairs(TabButtons) do
            b.Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
            b.Icon.ImageColor3 = Color3.fromRGB(180, 180, 195)
            b.Label.TextColor3 = Color3.fromRGB(180, 180, 195)
        end
        Page.Visible = true
        TabBtn.BackgroundColor3 = Color3.fromRGB(255, 75, 75)
        Icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
        Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)

    Pages[tabName] = Page
    table.insert(TabButtons, {Btn = TabBtn, Icon = Icon, Label = Label})
    return Page
end

local CombatPage = createTab("Combate", "rbxassetid://6031265976")
local VisualPage = createTab("Visuais", "rbxassetid://6031075931")
local MovePage   = createTab("Movimento", "rbxassetid://6034754445")
local PlayerPage = createTab("Jogadores", "rbxassetid://6034287594")
local CoordsPage = createTab("Coords", "rbxassetid://6034509993")

TabButtons[1].Btn.BackgroundColor3 = Color3.fromRGB(255, 75, 75)
TabButtons[1].Icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
TabButtons[1].Label.TextColor3 = Color3.fromRGB(255, 255, 255)
CombatPage.Visible = true

local function addToggle(parentPage, labelText, iconId, defaultState, callback)
    local Row = Instance.new("TextButton")
    Row.Size = UDim2.new(1, -6, 0, 40)
    Row.BackgroundColor3 = defaultState and Color3.fromRGB(40, 95, 65) or Color3.fromRGB(32, 32, 42)
    Row.Text = ""
    Row.AutoButtonColor = false
    Row.Parent = parentPage
    Instance.new("UICorner", Row).CornerRadius = UDim.new(0, 7)

    local Icon = Instance.new("ImageLabel")
    Icon.Size = UDim2.new(0, 20, 0, 20)
    Icon.Position = UDim2.new(0, 10, 0.5, -10)
    Icon.BackgroundTransparency = 1
    Icon.Image = iconId
    Icon.ImageColor3 = Color3.fromRGB(230, 230, 240)
    Icon.Parent = Row

    local Text = Instance.new("TextLabel")
    Text.Size = UDim2.new(1, -95, 1, 0)
    Text.Position = UDim2.new(0, 38, 0, 0)
    Text.BackgroundTransparency = 1
    Text.Text = labelText
    Text.TextColor3 = Color3.fromRGB(235, 235, 245)
    Text.Font = Enum.Font.GothamSemibold
    Text.TextSize = 12
    Text.TextXAlignment = Enum.TextXAlignment.Left
    Text.Parent = Row

    local Status = Instance.new("TextLabel")
    Status.Size = UDim2.new(0, 46, 0, 24)
    Status.Position = UDim2.new(1, -54, 0.5, -12)
    Status.BackgroundColor3 = defaultState and Color3.fromRGB(60, 165, 105) or Color3.fromRGB(48, 48, 60)
    Status.Text = defaultState and "ON" or "OFF"
    Status.TextColor3 = Color3.fromRGB(255, 255, 255)
    Status.Font = Enum.Font.GothamBold
    Status.TextSize = 11
    Status.Parent = Row
    Instance.new("UICorner", Status).CornerRadius = UDim.new(0, 5)

    local state = defaultState
    Row.MouseButton1Click:Connect(function()
        state = not state
        playSFX(state and "ToggleOn" or "ToggleOff")
        Row.BackgroundColor3 = state and Color3.fromRGB(40, 95, 65) or Color3.fromRGB(32, 32, 42)
        Status.BackgroundColor3 = state and Color3.fromRGB(60, 165, 105) or Color3.fromRGB(48, 48, 60)
        Status.Text = state and "ON" or "OFF"
        callback(state)
    end)
end

local function addStepper(parentPage, labelText, currentVal, step, minVal, maxVal, callback)
    local Row = Instance.new("Frame")
    Row.Size = UDim2.new(1, -6, 0, 40)
    Row.BackgroundColor3 = Color3.fromRGB(32, 32, 42)
    Row.Parent = parentPage
    Instance.new("UICorner", Row).CornerRadius = UDim.new(0, 7)

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.6, 0, 1, 0)
    Label.Position = UDim2.new(0, 12, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = labelText .. ": " .. tostring(currentVal)
    Label.TextColor3 = Color3.fromRGB(235, 235, 245)
    Label.Font = Enum.Font.GothamSemibold
    Label.TextSize = 12
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Row

    local Minus = Instance.new("TextButton")
    Minus.Size = UDim2.new(0, 36, 0, 28)
    Minus.Position = UDim2.new(1, -84, 0.5, -14)
    Minus.BackgroundColor3 = Color3.fromRGB(48, 48, 62)
    Minus.Text = "-"
    Minus.TextColor3 = Color3.fromRGB(255, 255, 255)
    Minus.Font = Enum.Font.GothamBold
    Minus.TextSize = 15
    Minus.Parent = Row
    Instance.new("UICorner", Minus).CornerRadius = UDim.new(0, 6)

    local Plus = Instance.new("TextButton")
    Plus.Size = UDim2.new(0, 36, 0, 28)
    Plus.Position = UDim2.new(1, -42, 0.5, -14)
    Plus.BackgroundColor3 = Color3.fromRGB(48, 48, 62)
    Plus.Text = "+"
    Plus.TextColor3 = Color3.fromRGB(255, 255, 255)
    Plus.Font = Enum.Font.GothamBold
    Plus.TextSize = 15
    Plus.Parent = Row
    Instance.new("UICorner", Plus).CornerRadius = UDim.new(0, 6)

    local val = currentVal
    Minus.MouseButton1Click:Connect(function()
        val = math.clamp(val - step, minVal, maxVal)
        Label.Text = labelText .. ": " .. tostring(val)
        playSFX("Step")
        callback(val)
    end)
    Plus.MouseButton1Click:Connect(function()
        val = math.clamp(val + step, minVal, maxVal)
        Label.Text = labelText .. ": " .. tostring(val)
        playSFX("Step")
        callback(val)
    end)
end

-- ==========================================
-- GERENCIADOR DE HITBOX
-- ==========================================
local ModifiedHitboxes = {}

local function expandTargetHitbox(part, sizeVal)
    if not part or not part.Parent then return end
    if not ModifiedHitboxes[part] then
        ModifiedHitboxes[part] = {
            Size = part.Size,
            Transparency = part.Transparency,
            CanCollide = part.CanCollide,
            Massless = part.Massless
        }
    end
    pcall(function()
        part.Size = Vector3.new(sizeVal, sizeVal, sizeVal)
        part.Transparency = 0.82
        part.CanCollide = false
        part.Massless = true
    end)
end

local function restoreSingleHitbox(part)
    local orig = ModifiedHitboxes[part]
    if orig then
        if part and part.Parent then
            pcall(function()
                part.Size = orig.Size
                part.Transparency = orig.Transparency
                part.CanCollide = orig.CanCollide
                part.Massless = orig.Massless
            end)
        end
        ModifiedHitboxes[part] = nil
    end
end

local function restoreAllHitboxes()
    for part, _ in pairs(ModifiedHitboxes) do
        restoreSingleHitbox(part)
    end
end

-- ==========================================
-- GOD MODE
-- ==========================================
local godConnection = nil

local function applyGodMode(char)
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end

    if Config.GodMode then
        hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
        hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        hum:SetStateEnabled(Enum.HumanoidStateType.Physics, false)

        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") then part.CanTouch = false end
        end

        if hum.Health < hum.MaxHealth then hum.Health = hum.MaxHealth end
        if godConnection then godConnection:Disconnect() end
        godConnection = hum.HealthChanged:Connect(function(newHealth)
            if Config.GodMode and newHealth < hum.MaxHealth and newHealth > 0 then
                hum.Health = hum.MaxHealth
            end
        end)
    else
        if godConnection then godConnection:Disconnect() godConnection = nil end
        hum:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
        hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
        hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
        hum:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") then part.CanTouch = true end
        end
    end
end

LocalPlayer.CharacterAdded:Connect(function(newChar)
    task.wait(0.3)
    if Config.GodMode then applyGodMode(newChar) end
end)

-- ==========================================
-- NOCLIP BACKUP
-- ==========================================
local OriginalCanCollide = {}

local function disableNoclipAndRestore()
    for part, origState in pairs(OriginalCanCollide) do
        if part and part.Parent then part.CanCollide = origState end
    end
    table.clear(OriginalCanCollide)
end

-- ==========================================
-- ESP CLEAR & SKELETON DRAWS
-- ==========================================
local SkeletonDrawings = {}

local function clearAllESP()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.Character then
            local hl = plr.Character:FindFirstChild("BenchMobileHL")
            if hl then hl:Destroy() end
            local head = plr.Character:FindFirstChild("Head")
            local tag = head and head:FindFirstChild("BenchMobileTag")
            if tag then tag:Destroy() end
        end
    end
    for _, lines in pairs(SkeletonDrawings) do
        for _, line in pairs(lines) do
            pcall(function() line:Remove() end)
        end
    end
    table.clear(SkeletonDrawings)
end

-- ==========================================
-- PREENCHIMENTO DAS ABAS
-- ==========================================
addToggle(CombatPage, "Aimbot Mobile (Trava Centro)", "rbxassetid://6031265976", Config.Aimbot, function(v)
    Config.Aimbot = v
end)
addToggle(CombatPage, "WallCheck (Ignorar Atrás de Parede)", "rbxassetid://6031075931", Config.WallCheck, function(v)
    Config.WallCheck = v
end)
addToggle(CombatPage, "Bala Mágica (Hitbox + Reach)", "rbxassetid://6031265976", Config.MagicBullet, function(v)
    Config.MagicBullet = v
    if not v then restoreAllHitboxes() end
end)
addStepper(CombatPage, "Tamanho da Hitbox Mágica", Config.HitboxSize, 2, 4, 30, function(v)
    Config.HitboxSize = v
end)
addToggle(CombatPage, "Causar Mais Dano (Inimigo/NPC)", "rbxassetid://6034754445", Config.DamageBoost, function(v)
    Config.DamageBoost = v
end)
addStepper(CombatPage, "Multiplicador de Dano", Config.DamageMultiplier, 1, 2, 15, function(v)
    Config.DamageMultiplier = v
end)
addToggle(CombatPage, "Focar em NPCs / Bots também", "rbxassetid://6034287594", Config.TargetNPCs, function(v)
    Config.TargetNPCs = v
    if not v then restoreAllHitboxes() end
end)
addToggle(CombatPage, "GodMode + Anti-Touch Local", "rbxassetid://6034287525", Config.GodMode, function(v)
    Config.GodMode = v
    applyGodMode(LocalPlayer.Character)
end)
addToggle(CombatPage, "Team Check (Ignorar Aliados)", "rbxassetid://6034287525", Config.TeamCheck, function(v)
    Config.TeamCheck = v
end)
addToggle(CombatPage, "Exibir Círculo FOV", "rbxassetid://6031075931", Config.ShowFOV, function(v)
    Config.ShowFOV = v
    FOVCircle.Visible = v
end)
addStepper(CombatPage, "Tamanho do FOV", Config.FOVSize, 15, 35, 350, function(v)
    Config.FOVSize = v
    FOVCircle.Size = UDim2.new(0, v * 2, 0, v * 2)
end)

addToggle(VisualPage, "ESP Completo (Distância + Vida)", "rbxassetid://6031075931", Config.ESP, function(v)
    Config.ESP = v
    if not v then clearAllESP() end
end)
addToggle(VisualPage, "Esqueleto Branco Sincronizado", "rbxassetid://6031075931", Config.SkeletonESP, function(v)
    Config.SkeletonESP = v
    if not v then
        for _, lines in pairs(SkeletonDrawings) do
            for _, line in pairs(lines) do pcall(function() line:Remove() end) end
        end
        table.clear(SkeletonDrawings)
    end
end)
addToggle(VisualPage, "Clarear Cenário (Fullbright)", "rbxassetid://6031075938", Config.Fullbright, function(v)
    Config.Fullbright = v
    if not v then
        Lighting.Brightness = OriginalLighting.Brightness
        Lighting.ClockTime = OriginalLighting.ClockTime
        Lighting.FogEnd = OriginalLighting.FogEnd
        Lighting.GlobalShadows = OriginalLighting.GlobalShadows
        Lighting.OutdoorAmbient = OriginalLighting.OutdoorAmbient
        Lighting.Ambient = OriginalLighting.Ambient
    end
end)
addToggle(VisualPage, "Efeitos Sonoros da UI (SFX)", "rbxassetid://6034754445", Config.UISounds, function(v)
    Config.UISounds = v
end)

addToggle(MovePage, "Atravessar Paredes (Noclip)", "rbxassetid://6034287525", Config.Noclip, function(v)
    Config.Noclip = v
    if not v then disableNoclipAndRestore() end
end)
addToggle(MovePage, "Desync Body (Corpo no Céu/Invisível)", "rbxassetid://6034754445", Config.DesyncBody, function(v)
    Config.DesyncBody = v
    local char = LocalPlayer.Character
    if char then
        for _, p in ipairs(char:GetDescendants()) do
            if p:IsA("BasePart") then
                p.LocalTransparencyModifier = v and 0.95 or 0
            end
        end
    end
end)
addToggle(MovePage, "Instant Prompts (Zera Hold Baús)", "rbxassetid://6034754445", Config.InstantPrompts, function(v)
    Config.InstantPrompts = v
end)
addToggle(MovePage, "Animation Remover (Sem Delay Facada)", "rbxassetid://6034754445", Config.AnimRemover, function(v)
    Config.AnimRemover = v
end)
addToggle(MovePage, "Pulo Infinito (Inf Jump)", "rbxassetid://6034754445", Config.InfJump, function(v)
    Config.InfJump = v
end)
addToggle(MovePage, "Fly Mobile 3D (Analog Fix + Altura)", "rbxassetid://6034754445", Config.Fly, function(v)
    Config.Fly = v
    FlyPad.Visible = v
    if not v then Config.FlyVertical = 0 end
end)
addStepper(MovePage, "Velocidade do Fly", Config.FlySpeed, 15, 15, 250, function(v)
    Config.FlySpeed = v
end)
addToggle(MovePage, "Speed Hack", "rbxassetid://6034754445", Config.Speed, function(v)
    Config.Speed = v
    if not v and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 16
    end
end)
addStepper(MovePage, "WalkSpeed", Config.WalkSpeed, 8, 16, 220, function(v)
    Config.WalkSpeed = v
end)

-- ==========================================
-- ABA JOGADORES
-- ==========================================
local SearchBarFrame = Instance.new("Frame")
SearchBarFrame.Size = UDim2.new(1, -6, 0, 36)
SearchBarFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 42)
SearchBarFrame.Parent = PlayerPage
Instance.new("UICorner", SearchBarFrame).CornerRadius = UDim.new(0, 7)

local SearchIcon = Instance.new("ImageLabel")
SearchIcon.Size = UDim2.new(0, 18, 0, 18)
SearchIcon.Position = UDim2.new(0, 10, 0.5, -9)
SearchIcon.BackgroundTransparency = 1
SearchIcon.Image = "rbxassetid://6031154871"
SearchIcon.ImageColor3 = Color3.fromRGB(180, 180, 200)
SearchIcon.Parent = SearchBarFrame

local SearchBox = Instance.new("TextBox")
SearchBox.Size = UDim2.new(1, -38, 1, 0)
SearchBox.Position = UDim2.new(0, 34, 0, 0)
SearchBox.BackgroundTransparency = 1
SearchBox.PlaceholderText = "Pesquisar jogador (Nome ou @)..."
SearchBox.PlaceholderColor3 = Color3.fromRGB(130, 130, 145)
SearchBox.Text = ""
SearchBox.TextColor3 = Color3.fromRGB(240, 240, 250)
SearchBox.Font = Enum.Font.GothamSemibold
SearchBox.TextSize = 12
SearchBox.TextXAlignment = Enum.TextXAlignment.Left
SearchBox.ClearTextOnFocus = false
SearchBox.Parent = SearchBarFrame

local ActionCard = Instance.new("Frame")
ActionCard.Size = UDim2.new(1, -6, 0, 96)
ActionCard.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
ActionCard.Parent = PlayerPage
Instance.new("UICorner", ActionCard).CornerRadius = UDim.new(0, 7)

local SelectedLabel = Instance.new("TextLabel")
SelectedLabel.Size = UDim2.new(1, -16, 0, 22)
SelectedLabel.Position = UDim2.new(0, 10, 0, 4)
SelectedLabel.BackgroundTransparency = 1
SelectedLabel.Text = "Alvo Selecionado: Nenhum"
SelectedLabel.TextColor3 = Color3.fromRGB(220, 220, 235)
SelectedLabel.Font = Enum.Font.GothamBold
SelectedLabel.TextSize = 11
SelectedLabel.TextXAlignment = Enum.TextXAlignment.Left
SelectedLabel.TextTruncate = Enum.TextTruncate.AtEnd
SelectedLabel.Parent = ActionCard

local TeleportBtn = Instance.new("TextButton")
TeleportBtn.Size = UDim2.new(0.48, -8, 0, 30)
TeleportBtn.Position = UDim2.new(0, 8, 0, 28)
TeleportBtn.BackgroundColor3 = Color3.fromRGB(255, 75, 75)
TeleportBtn.Text = "TELEPORTAR"
TeleportBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportBtn.Font = Enum.Font.GothamBold
TeleportBtn.TextSize = 11
TeleportBtn.Parent = ActionCard
Instance.new("UICorner", TeleportBtn).CornerRadius = UDim.new(0, 6)

local AttachBackBtn = Instance.new("TextButton")
AttachBackBtn.Size = UDim2.new(0.52, -8, 0, 30)
AttachBackBtn.Position = UDim2.new(0.48, 4, 0, 28)
AttachBackBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 58)
AttachBackBtn.Text = "GRUDAR COSTAS: OFF"
AttachBackBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AttachBackBtn.Font = Enum.Font.GothamBold
AttachBackBtn.TextSize = 11
AttachBackBtn.Parent = ActionCard
Instance.new("UICorner", AttachBackBtn).CornerRadius = UDim.new(0, 6)

local FlingBtn = Instance.new("TextButton")
FlingBtn.Size = UDim2.new(1, -16, 0, 28)
FlingBtn.Position = UDim2.new(0, 8, 0, 62)
FlingBtn.BackgroundColor3 = Color3.fromRGB(185, 55, 140)
FlingBtn.Text = "JOGAR ALVO PARA FORA DO MAPA (FLING)"
FlingBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FlingBtn.Font = Enum.Font.GothamBold
FlingBtn.TextSize = 11
FlingBtn.Parent = ActionCard
Instance.new("UICorner", FlingBtn).CornerRadius = UDim.new(0, 6)

local PlayerListContainer = Instance.new("Frame")
PlayerListContainer.Size = UDim2.new(1, -6, 0, 10)
PlayerListContainer.AutomaticSize = Enum.AutomaticSize.Y
PlayerListContainer.BackgroundTransparency = 1
PlayerListContainer.Parent = PlayerPage

local PlayerListLayout = Instance.new("UIListLayout", PlayerListContainer)
PlayerListLayout.Padding = UDim.new(0, 5)
PlayerListLayout.SortOrder = Enum.SortOrder.LayoutOrder

local function refreshPlayerList()
    for _, child in ipairs(PlayerListContainer:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    local query = string.lower(SearchBox.Text or "")
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            local uName = string.lower(plr.Name)
            local dName = string.lower(plr.DisplayName)
            if query == "" or string.find(uName, query, 1, true) or string.find(dName, query, 1, true) then
                local isSelected = (Config.SelectedPlayer == plr)
                local PlrBtn = Instance.new("TextButton")
                PlrBtn.Size = UDim2.new(1, 0, 0, 34)
                PlrBtn.BackgroundColor3 = isSelected and Color3.fromRGB(55, 95, 145) or Color3.fromRGB(34, 34, 44)
                PlrBtn.Text = ""
                PlrBtn.AutoButtonColor = false
                PlrBtn.Parent = PlayerListContainer
                Instance.new("UICorner", PlrBtn).CornerRadius = UDim.new(0, 6)

                local UserIcon = Instance.new("ImageLabel")
                UserIcon.Size = UDim2.new(0, 18, 0, 18)
                UserIcon.Position = UDim2.new(0, 8, 0.5, -9)
                UserIcon.BackgroundTransparency = 1
                UserIcon.Image = "rbxassetid://6034287594"
                UserIcon.ImageColor3 = isSelected and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(175, 175, 190)
                UserIcon.Parent = PlrBtn

                local NameText = Instance.new("TextLabel")
                NameText.Size = UDim2.new(1, -34, 1, 0)
                NameText.Position = UDim2.new(0, 32, 0, 0)
                NameText.BackgroundTransparency = 1
                NameText.Text = plr.DisplayName .. " (@" .. plr.Name .. ")"
                NameText.TextColor3 = Color3.fromRGB(235, 235, 245)
                NameText.Font = Enum.Font.GothamSemibold
                NameText.TextSize = 12
                NameText.TextXAlignment = Enum.TextXAlignment.Left
                NameText.TextTruncate = Enum.TextTruncate.AtEnd
                NameText.Parent = PlrBtn

                PlrBtn.MouseButton1Click:Connect(function()
                    Config.SelectedPlayer = plr
                    SelectedLabel.Text = "Alvo Selecionado: " .. plr.DisplayName
                    playSFX("Step")
                    refreshPlayerList()
                end)
            end
        end
    end
end

SearchBox:GetPropertyChangedSignal("Text"):Connect(refreshPlayerList)
Players.PlayerAdded:Connect(refreshPlayerList)
Players.PlayerRemoving:Connect(function(plr)
    if Config.SelectedPlayer == plr then
        Config.SelectedPlayer = nil
        Config.AttachBack = false
        AttachBackBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 58)
        AttachBackBtn.Text = "GRUDAR COSTAS: OFF"
        SelectedLabel.Text = "Alvo Selecionado: Nenhum"
        disableNoclipAndRestore()
    end
    task.defer(refreshPlayerList)
end)

TeleportBtn.MouseButton1Click:Connect(function()
    local targetPlr = Config.SelectedPlayer
    if targetPlr and targetPlr.Character then
        local targetRoot = targetPlr.Character:FindFirstChild("HumanoidRootPart")
        local myChar = LocalPlayer.Character
        local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
        if targetRoot and myRoot then
            myRoot.CFrame = targetRoot.CFrame * CFrame.new(0, 2, 3)
            playSFX("Action")
            return
        end
    end
    playSFX("Error")
end)

AttachBackBtn.MouseButton1Click:Connect(function()
    if not Config.SelectedPlayer then playSFX("Error") return end
    Config.AttachBack = not Config.AttachBack
    playSFX(Config.AttachBack and "ToggleOn" or "ToggleOff")
    if Config.AttachBack then
        AttachBackBtn.BackgroundColor3 = Color3.fromRGB(45, 130, 80)
        AttachBackBtn.Text = "GRUDAR COSTAS: ON"
    else
        AttachBackBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 58)
        AttachBackBtn.Text = "GRUDAR COSTAS: OFF"
        if not Config.Noclip then disableNoclipAndRestore() end
    end
end)

FlingBtn.MouseButton1Click:Connect(function()
    if Config.Flinging then return end
    local targetPlr = Config.SelectedPlayer
    if not targetPlr or not targetPlr.Character then playSFX("Error") return end
    local targetRoot = targetPlr.Character:FindFirstChild("HumanoidRootPart")
    local myChar = LocalPlayer.Character
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
    local myHum = myChar and myChar:FindFirstChildOfClass("Humanoid")
    if not targetRoot or not myRoot or not myHum then playSFX("Error") return end

    playSFX("Action")
    Config.Flinging = true
    FlingBtn.Text = "ARREMESSANDO ALVO..."
    FlingBtn.BackgroundColor3 = Color3.fromRGB(230, 120, 40)

    local savedCFrame = myRoot.CFrame
    local wasAttach = Config.AttachBack
    Config.AttachBack = false

    task.spawn(function()
        local bav = Instance.new("BodyAngularVelocity")
        bav.Name = "BenchFlingSpin"
        bav.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        bav.P = math.huge
        bav.AngularVelocity = Vector3.new(9e5, 9e5, 9e5)
        bav.Parent = myRoot

        for _, part in ipairs(myChar:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
                part.Massless = true
            end
        end

        local startTime = os.clock()
        while os.clock() - startTime < 1.8 and targetPlr and targetPlr.Character and targetRoot.Parent do
            if targetRoot.AssemblyLinearVelocity.Magnitude > 450 then break end
            local predictedPos = targetRoot.Position + (targetRoot.AssemblyLinearVelocity * 0.04)
            local jitter = Vector3.new(math.random(-1, 1) * 0.4, 0, math.random(-1, 1) * 0.4)
            myRoot.CFrame = CFrame.new(predictedPos + jitter) * CFrame.Angles(math.rad(math.random(0, 360)), math.rad(math.random(0, 360)), 0)
            myRoot.AssemblyLinearVelocity = Vector3.new(9e4, 9e4, 9e4)
            myRoot.AssemblyAngularVelocity = Vector3.new(9e5, 9e5, 9e5)
            RunService.Heartbeat:Wait()
        end

        if bav then bav:Destroy() end
        myRoot.AssemblyLinearVelocity = Vector3.zero
        myRoot.AssemblyAngularVelocity = Vector3.zero
        for _, part in ipairs(myChar:GetDescendants()) do
            if part:IsA("BasePart") then
                part.AssemblyLinearVelocity = Vector3.zero
                part.AssemblyAngularVelocity = Vector3.zero
                part.Massless = false
            end
        end

        myRoot.CFrame = savedCFrame
        Config.AttachBack = wasAttach
        Config.Flinging = false
        if not Config.Noclip and not Config.AttachBack then disableNoclipAndRestore() end
        FlingBtn.Text = "JOGAR ALVO PARA FORA DO MAPA (FLING)"
        FlingBtn.BackgroundColor3 = Color3.fromRGB(185, 55, 140)
    end)
end)

refreshPlayerList()

-- ==========================================
-- ABA COORDS
-- ==========================================
local CurrentCoordCard = Instance.new("Frame")
CurrentCoordCard.Size = UDim2.new(1, -6, 0, 82)
CurrentCoordCard.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
CurrentCoordCard.Parent = CoordsPage
Instance.new("UICorner", CurrentCoordCard).CornerRadius = UDim.new(0, 7)

local LiveCoordLabel = Instance.new("TextLabel")
LiveCoordLabel.Size = UDim2.new(1, -20, 0, 32)
LiveCoordLabel.Position = UDim2.new(0, 10, 0, 6)
LiveCoordLabel.BackgroundTransparency = 1
LiveCoordLabel.Text = "Sua Posição (X, Y, Z): 0, 0, 0"
LiveCoordLabel.TextColor3 = Color3.fromRGB(120, 230, 160)
LiveCoordLabel.Font = Enum.Font.GothamBold
LiveCoordLabel.TextSize = 12
LiveCoordLabel.TextXAlignment = Enum.TextXAlignment.Left
LiveCoordLabel.Parent = CurrentCoordCard

local CopyCoordBtn = Instance.new("TextButton")
CopyCoordBtn.Size = UDim2.new(1, -20, 0, 34)
CopyCoordBtn.Position = UDim2.new(0, 10, 0, 40)
CopyCoordBtn.BackgroundColor3 = Color3.fromRGB(50, 105, 165)
CopyCoordBtn.Text = "CLICAR E COPIAR MINHA COORDENADA"
CopyCoordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyCoordBtn.Font = Enum.Font.GothamBold
CopyCoordBtn.TextSize = 11
CopyCoordBtn.Parent = CurrentCoordCard
Instance.new("UICorner", CopyCoordBtn).CornerRadius = UDim.new(0, 6)

local InputCoordCard = Instance.new("Frame")
InputCoordCard.Size = UDim2.new(1, -6, 0, 130)
InputCoordCard.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
InputCoordCard.Parent = CoordsPage
Instance.new("UICorner", InputCoordCard).CornerRadius = UDim.new(0, 7)

local InputTitle = Instance.new("TextLabel")
InputTitle.Size = UDim2.new(1, -20, 0, 24)
InputTitle.Position = UDim2.new(0, 10, 0, 6)
InputTitle.BackgroundTransparency = 1
InputTitle.Text = "Coloque a Coordenada de Destino (X, Y, Z):"
InputTitle.TextColor3 = Color3.fromRGB(220, 220, 235)
InputTitle.Font = Enum.Font.GothamSemibold
InputTitle.TextSize = 11
InputTitle.TextXAlignment = Enum.TextXAlignment.Left
InputTitle.Parent = InputCoordCard

local CoordInputBox = Instance.new("TextBox")
CoordInputBox.Size = UDim2.new(1, -20, 0, 36)
CoordInputBox.Position = UDim2.new(0, 10, 0, 32)
CoordInputBox.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
CoordInputBox.PlaceholderText = "Ex: 125.4, 45.0, -310.8"
CoordInputBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 135)
CoordInputBox.Text = ""
CoordInputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
CoordInputBox.Font = Enum.Font.GothamSemibold
CoordInputBox.TextSize = 12
CoordInputBox.ClearTextOnFocus = false
CoordInputBox.Parent = InputCoordCard
Instance.new("UICorner", CoordInputBox).CornerRadius = UDim.new(0, 6)

local PasteHelperBtn = Instance.new("TextButton")
PasteHelperBtn.Size = UDim2.new(0.45, -12, 0, 36)
PasteHelperBtn.Position = UDim2.new(0, 10, 0, 78)
PasteHelperBtn.BackgroundColor3 = Color3.fromRGB(48, 48, 62)
PasteHelperBtn.Text = "COLAR COPIADA"
PasteHelperBtn.TextColor3 = Color3.fromRGB(235, 235, 245)
PasteHelperBtn.Font = Enum.Font.GothamBold
PasteHelperBtn.TextSize = 11
PasteHelperBtn.Parent = InputCoordCard
Instance.new("UICorner", PasteHelperBtn).CornerRadius = UDim.new(0, 6)

local GoCoordBtn = Instance.new("TextButton")
GoCoordBtn.Size = UDim2.new(0.55, -12, 0, 36)
GoCoordBtn.Position = UDim2.new(0.45, 2, 0, 78)
GoCoordBtn.BackgroundColor3 = Color3.fromRGB(255, 75, 75)
GoCoordBtn.Text = "TELEPORTAR ATÉ ELA"
GoCoordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
GoCoordBtn.Font = Enum.Font.GothamBold
GoCoordBtn.TextSize = 11
GoCoordBtn.Parent = InputCoordCard
Instance.new("UICorner", GoCoordBtn).CornerRadius = UDim.new(0, 6)

CopyCoordBtn.MouseButton1Click:Connect(function()
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then
        local pos = root.Position
        local formatted = string.format("%.1f, %.1f, %.1f", pos.X, pos.Y, pos.Z)
        Config.CopiedCoordString = formatted
        pcall(function()
            if setclipboard then setclipboard(formatted)
            elseif toclipboard then toclipboard(formatted) end
        end)
        playSFX("Action")
        CopyCoordBtn.Text = "COPIADO: " .. formatted
        CopyCoordBtn.BackgroundColor3 = Color3.fromRGB(45, 140, 85)
        task.delay(1.5, function()
            CopyCoordBtn.Text = "CLICAR E COPIAR MINHA COORDENADA"
            CopyCoordBtn.BackgroundColor3 = Color3.fromRGB(50, 105, 165)
        end)
    else
        playSFX("Error")
    end
end)

PasteHelperBtn.MouseButton1Click:Connect(function()
    if Config.CopiedCoordString ~= "" then
        CoordInputBox.Text = Config.CopiedCoordString
        playSFX("Step")
    else
        playSFX("Error")
    end
end)

GoCoordBtn.MouseButton1Click:Connect(function()
    local rawText = CoordInputBox.Text or ""
    local nums = {}
    for numStr in string.gmatch(rawText, "[+-]?%d+%.?%d*") do
        table.insert(nums, tonumber(numStr))
    end
    if #nums >= 3 then
        local myChar = LocalPlayer.Character
        local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
        if myRoot then
            myRoot.CFrame = CFrame.new(nums[1], nums[2], nums[3])
            playSFX("Action")
            GoCoordBtn.Text = "TELEPORTADO!"
            GoCoordBtn.BackgroundColor3 = Color3.fromRGB(45, 140, 85)
            task.delay(1.2, function()
                GoCoordBtn.Text = "TELEPORTAR ATÉ ELA"
                GoCoordBtn.BackgroundColor3 = Color3.fromRGB(255, 75, 75)
            end)
        end
    else
        playSFX("Error")
        GoCoordBtn.Text = "FORMATO INVÁLIDO!"
        task.delay(1.2, function()
            GoCoordBtn.Text = "TELEPORTAR ATÉ ELA"
        end)
    end
end)

-- ==========================================
-- PULO INFINITO & INSTANT PROMPTS
-- ==========================================
UserInputService.JumpRequest:Connect(function()
    if Config.InfJump and LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

Workspace.DescendantAdded:Connect(function(descendant)
    if descendant:IsA("ProximityPrompt") then
        if Config.InstantPrompts then
            descendant.HoldDuration = 0
        end
    end
end)

task.spawn(function()
    while task.wait(1) do
        if Config.InstantPrompts then
            for _, prompt in ipairs(Workspace:GetDescendants()) do
                if prompt:IsA("ProximityPrompt") and prompt.HoldDuration > 0 then
                    prompt.HoldDuration = 0
                end
            end
        end
    end
end)

-- ==========================================
-- CACHE DE NPCS
-- ==========================================
local CachedNPCs = {}
local function tryRegisterNPC(inst)
    if inst:IsA("Humanoid") then
        local model = inst.Parent
        if model and model:IsA("Model") and model ~= LocalPlayer.Character then
            if not Players:GetPlayerFromCharacter(model) then
                CachedNPCs[model] = inst
            end
        end
    end
end

for _, obj in ipairs(Workspace:GetDescendants()) do tryRegisterNPC(obj) end
Workspace.DescendantAdded:Connect(function(obj) tryRegisterNPC(obj) end)
Workspace.DescendantRemoving:Connect(function(obj)
    if obj:IsA("Model") and CachedNPCs[obj] then CachedNPCs[obj] = nil
    elseif obj:IsA("Humanoid") and obj.Parent and CachedNPCs[obj.Parent] then CachedNPCs[obj.Parent] = nil end
end)

-- ==========================================
-- RAYCAST WALLCHECK
-- ==========================================
local rayParams = RaycastParams.new()
rayParams.FilterType = Enum.RaycastFilterType.Exclude
rayParams.IgnoreWater = true

local function hasLineOfSight(targetPart, targetModel)
    if not Config.WallCheck then return true end
    local myChar = LocalPlayer.Character
    if not myChar then return false end
    rayParams.FilterDescendantsInstances = {myChar, Camera}
    local origin = Camera.CFrame.Position
    local direction = targetPart.Position - origin
    local result = Workspace:Raycast(origin, direction, rayParams)
    if not result then return true end
    return result.Instance:IsDescendantOf(targetModel)
end

local function getAllValidTargetModels()
    local targets = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            if not (Config.TeamCheck and plr.Team == LocalPlayer.Team and plr.Team ~= nil) then
                local hum = plr.Character:FindFirstChildOfClass("Humanoid")
                if hum and hum.Health > 0 then table.insert(targets, plr.Character) end
            end
        end
    end
    if Config.TargetNPCs then
        for npcModel, hum in pairs(CachedNPCs) do
            if npcModel and npcModel.Parent and hum and hum.Health > 0 then
                if not Players:GetPlayerFromCharacter(npcModel) then table.insert(targets, npcModel)
                else CachedNPCs[npcModel] = nil end
            else CachedNPCs[npcModel] = nil end
        end
    end
    return targets
end

local function getClosestTargetToCenter()
    local closestPart = nil
    local shortestDist = Config.FOVSize
    local viewportCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    for _, model in ipairs(getAllValidTargetModels()) do
        local part = model:FindFirstChild(Config.AimPart) or model:FindFirstChild("HumanoidRootPart")
        if part then
            local pos, onScreen = Camera:WorldToViewportPoint(part.Position)
            if onScreen then
                local dist = (Vector2.new(pos.X, pos.Y) - viewportCenter).Magnitude
                if dist < shortestDist and hasLineOfSight(part, model) then
                    shortestDist = dist
                    closestPart = part
                end
            end
        end
    end
    return closestPart
end

-- ==========================================
-- BALA MÁGICA + DANO + ANIM REMOVER
-- ==========================================
local function triggerDamageOnPart(handle, targetPart, pulses)
    if not handle or not targetPart then return end
    pcall(function()
        if firetouchinterest then
            for _ = 1, pulses do
                firetouchinterest(handle, targetPart, 0)
                firetouchinterest(handle, targetPart, 1)
            end
        end
    end)
end

task.spawn(function()
    while task.wait(0.08) do
        for part, _ in pairs(ModifiedHitboxes) do
            local model = part and part.Parent
            local hum = model and model:FindFirstChildOfClass("Humanoid")
            if not model or not hum or hum.Health <= 0 or not Config.MagicBullet then
                restoreSingleHitbox(part)
            end
        end

        local myChar = LocalPlayer.Character
        local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
        local myHum = myChar and myChar:FindFirstChildOfClass("Humanoid")

        if Config.AnimRemover and myHum then
            pcall(function()
                local animator = myHum:FindFirstChildOfClass("Animator")
                if animator then
                    for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
                        if string.find(string.lower(track.Name), "tool") or string.find(string.lower(track.Name), "slash") or string.find(string.lower(track.Name), "stab") or string.find(string.lower(track.Name), "attack") then
                            track:AdjustSpeed(5.0)
                        end
                    end
                end
            end)
        end

        if not myChar or not myRoot then continue end

        local equippedTool = myChar:FindFirstChildOfClass("Tool")
        local handle = equippedTool and (equippedTool:FindFirstChild("Handle") or equippedTool:FindFirstChildWhichIsA("BasePart"))

        if Config.MagicBullet or Config.DamageBoost then
            local targetPart = getClosestTargetToCenter()
            if not targetPart and Config.MagicBullet then
                local minDist = Config.MagicRange
                for _, model in ipairs(getAllValidTargetModels()) do
                    local p = model:FindFirstChild("Head") or model:FindFirstChild("HumanoidRootPart")
                    if p then
                        local d = (p.Position - myRoot.Position).Magnitude
                        if d < minDist then minDist = d targetPart = p end
                    end
                end
            end

            if targetPart and targetPart.Parent then
                local enemyRoot = targetPart.Parent:FindFirstChild("HumanoidRootPart") or targetPart
                local dist = (enemyRoot.Position - myRoot.Position).Magnitude
                local pulses = Config.DamageBoost and Config.DamageMultiplier or 1

                if Config.MagicBullet then
                    for modPart, _ in pairs(ModifiedHitboxes) do
                        if modPart ~= enemyRoot then restoreSingleHitbox(modPart) end
                    end
                    expandTargetHitbox(enemyRoot, Config.HitboxSize)
                    if handle and dist <= 45 then
                        triggerDamageOnPart(handle, targetPart, pulses)
                        triggerDamageOnPart(handle, enemyRoot, pulses)
                    end
                end

                if Config.DamageBoost and handle and dist <= 35 then
                    triggerDamageOnPart(handle, targetPart, Config.DamageMultiplier)
                    triggerDamageOnPart(handle, enemyRoot, Config.DamageMultiplier)
                end
            end
        end
    end
end)

-- ==========================================
-- ESP COMPLETO + SKELETON BRANCO SINCRONIZADO
-- ==========================================
local lastESPUpdate = 0

local function updateESP()
    if not Config.ESP and not Config.SkeletonESP then return end
    if os.clock() - lastESPUpdate < 0.08 then return end
    lastESPUpdate = os.clock()

    local myChar = LocalPlayer.Character
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
    local myPos = myRoot and myRoot.Position or Camera.CFrame.Position
    local activePlayers = {}

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local char = plr.Character
            local head = char:FindFirstChild("Head")
            local root = char:FindFirstChild("HumanoidRootPart")
            local hum = char:FindFirstChildOfClass("Humanoid")

            if head and root and hum and hum.Health > 0 then
                local dist = (root.Position - myPos).Magnitude
                local isAlly = (Config.TeamCheck and plr.Team == LocalPlayer.Team and plr.Team ~= nil)
                local espColor = isAlly and Color3.fromRGB(60, 220, 90) or Color3.fromRGB(255, 65, 65)

                if Config.ESP then
                    local tag = head:FindFirstChild("BenchMobileTag")
                    if not tag then
                        tag = Instance.new("BillboardGui")
                        tag.Name = "BenchMobileTag"
                        tag.Size = UDim2.new(0, 160, 0, 32)
                        tag.StudsOffset = Vector3.new(0, 2.8, 0)
                        tag.AlwaysOnTop = true
                        tag.Parent = head

                        local txt = Instance.new("TextLabel")
                        txt.Name = "Info"
                        txt.Size = UDim2.new(1, 0, 1, 0)
                        txt.BackgroundTransparency = 1
                        txt.TextStrokeTransparency = 0.15
                        txt.Font = Enum.Font.GothamBold
                        txt.TextSize = 11
                        txt.Parent = tag
                    end
                    local infoLabel = tag:FindFirstChild("Info")
                    if infoLabel then
                        infoLabel.TextColor3 = espColor
                        infoLabel.Text = string.format("%s [%d HP] (%dm)", plr.DisplayName, math.floor(hum.Health), math.floor(dist))
                    end
                end

                if Config.SkeletonESP and Drawing then
                    if not SkeletonDrawings[plr] then
                        SkeletonDrawings[plr] = {
                            Head_Neck = Drawing.new("Line"),
                            Neck_Chest = Drawing.new("Line"),
                            Chest_Hip = Drawing.new("Line"),
                            LeftArm = Drawing.new("Line"),
                            RightArm = Drawing.new("Line"),
                            LeftLeg = Drawing.new("Line"),
                            RightLeg = Drawing.new("Line")
                        }
                        for _, l in pairs(SkeletonDrawings[plr]) do
                            l.Visible = false
                            l.Color = Color3.fromRGB(255, 255, 255)
                            l.Thickness = 1.5
                        end
                    end

                    local sLines = SkeletonDrawings[plr]
                    local pHead = char:FindFirstChild("Head")
                    local pUpper = char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso")
                    local pLower = char:FindFirstChild("LowerTorso") or char:FindFirstChild("Torso")
                    local pLHand = char:FindFirstChild("LeftHand") or char:FindFirstChild("Left Arm")
                    local pRHand = char:FindFirstChild("RightHand") or char:FindFirstChild("Right Arm")
                    local pLFoot = char:FindFirstChild("LeftFoot") or char:FindFirstChild("Left Leg")
                    local pRFoot = char:FindFirstChild("RightFoot") or char:FindFirstChild("Right Leg")

                    if pHead and pUpper and pLower then
                        local headPos, onHead = Camera:WorldToViewportPoint(pHead.Position)
                        local upperPos, onUpper = Camera:WorldToViewportPoint(pUpper.Position)
                        local lowerPos, onLower = Camera:WorldToViewportPoint(pLower.Position)

                        if onHead or onUpper then
                            sLines.Head_Neck.From = Vector2.new(headPos.X, headPos.Y)
                            sLines.Head_Neck.To = Vector2.new(upperPos.X, upperPos.Y)
                            sLines.Head_Neck.Visible = true
                        else sLines.Head_Neck.Visible = false end

                        if onUpper and onLower then
                            sLines.Neck_Chest.From = Vector2.new(upperPos.X, upperPos.Y)
                            sLines.Neck_Chest.To = Vector2.new(lowerPos.X, lowerPos.Y)
                            sLines.Neck_Chest.Visible = true
                        else sLines.Neck_Chest.Visible = false end

                        if pLHand then
                            local handPos, onH = Camera:WorldToViewportPoint(pLHand.Position)
                            if onH then
                                sLines.LeftArm.From = Vector2.new(upperPos.X, upperPos.Y)
                                sLines.LeftArm.To = Vector2.new(handPos.X, handPos.Y)
                                sLines.LeftArm.Visible = true
                            else sLines.LeftArm.Visible = false end
                        else sLines.LeftArm.Visible = false end

                        if pRHand then
                            local handPos, onH = Camera:WorldToViewportPoint(pRHand.Position)
                            if onH then
                                sLines.RightArm.From = Vector2.new(upperPos.X, upperPos.Y)
                                sLines.RightArm.To = Vector2.new(handPos.X, handPos.Y)
                                sLines.RightArm.Visible = true
                            else sLines.RightArm.Visible = false end
                        else sLines.RightArm.Visible = false end

                        if pLFoot then
                            local footPos, onF = Camera:WorldToViewportPoint(pLFoot.Position)
                            if onF then
                                sLines.LeftLeg.From = Vector2.new(lowerPos.X, lowerPos.Y)
                                sLines.LeftLeg.To = Vector2.new(footPos.X, footPos.Y)
                                sLines.LeftLeg.Visible = true
                            else sLines.LeftLeg.Visible = false end
                        else sLines.LeftLeg.Visible = false end

                        if pRFoot then
                            local footPos, onF = Camera:WorldToViewportPoint(pRFoot.Position)
                            if onF then
                                sLines.RightLeg.From = Vector2.new(lowerPos.X, lowerPos.Y)
                                sLines.RightLeg.To = Vector2.new(footPos.X, footPos.Y)
                                sLines.RightLeg.Visible = true
                            else sLines.RightLeg.Visible = false end
                        else sLines.RightLeg.Visible = false end
                    end
                end

                table.insert(activePlayers, {Char = char, Dist = dist, Color = espColor})
            end
        end
    end

    for plr, lines in pairs(SkeletonDrawings) do
        if not plr.Character or not plr.Character.Parent then
            for _, l in pairs(lines) do pcall(function() l:Remove() end) end
            SkeletonDrawings[plr] = nil
        end
    end

    if Config.ESP then
        table.sort(activePlayers, function(a, b) return a.Dist < b.Dist end)
        for idx, data in ipairs(activePlayers) do
            local hl = data.Char:FindFirstChild("BenchMobileHL")
            if idx <= 28 then
                if not hl then
                    hl = Instance.new("Highlight")
                    hl.Name = "BenchMobileHL"
                    hl.FillTransparency = 0.55
                    hl.OutlineTransparency = 0.1
                    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    hl.Parent = data.Char
                end
                hl.FillColor = data.Color
                hl.OutlineColor = Color3.fromRGB(255, 255, 255)
            else
                if hl then hl:Destroy() end
            end
        end
    end
end

-- ==========================================
-- MOTORES (NOCLIP, DESYNC COM CÂMERA FIXA NO CHÃO, AIMBOT, FLY 3D)
-- ==========================================
RunService.Stepped:Connect(function()
    local char = LocalPlayer.Character
    if not char then return end

    if Config.Noclip or Config.AttachBack or Config.Flinging then
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                if OriginalCanCollide[part] == nil then OriginalCanCollide[part] = part.CanCollide end
                if part.CanCollide then part.CanCollide = false end
            end
        end
    end

    if Config.GodMode then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
            if hum.Health < hum.MaxHealth and hum.Health > 0 then hum.Health = hum.MaxHealth end
        end
    end
end)

local flyActivePrev = false
local lockedY = nil
local desyncGroundPos = nil

RunService.RenderStepped:Connect(function(dt)
    Camera = Workspace.CurrentCamera

    if Config.Aimbot then
        local target = getClosestTargetToCenter()
        if target then Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Position) end
    end

    if Config.ESP or Config.SkeletonESP then updateESP() end

    if Config.Fullbright then
        Lighting.Brightness = 2.5
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = false
        Lighting.OutdoorAmbient = Color3.fromRGB(160, 160, 160)
        Lighting.Ambient = Color3.fromRGB(160, 160, 160)
    end

    local char = LocalPlayer.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        local root = char:FindFirstChild("HumanoidRootPart")

        if root and CoordsPage.Visible then
            local p = root.Position
            LiveCoordLabel.Text = string.format("Sua Posição (X, Y, Z): %.1f, %.1f, %.1f", p.X, p.Y, p.Z)
        end

        if hum and Config.Speed then hum.WalkSpeed = Config.WalkSpeed end

        if Config.AttachBack and not Config.Flinging and Config.SelectedPlayer and Config.SelectedPlayer.Character then
            local targetRoot = Config.SelectedPlayer.Character:FindFirstChild("HumanoidRootPart")
            if root and targetRoot then
                root.AssemblyLinearVelocity = Vector3.zero
                root.AssemblyAngularVelocity = Vector3.zero
                root.CFrame = targetRoot.CFrame * CFrame.new(0, 0, 2.2)
            end
        end

        -- DESYNC BODY COM CÂMERA MANTIDA NO CHÃO
        if Config.DesyncBody and root and not Config.Fly and not Config.Flinging then
            if not desyncGroundPos then
                desyncGroundPos = root.Position
            end
            local currentCamCF = Camera.CFrame
            root.CFrame = CFrame.new(desyncGroundPos + Vector3.new(0, 180, 0)) * (currentCamCF - currentCamCF.Position)
            Camera.CFrame = currentCamCF
        else
            if desyncGroundPos then
                desyncGroundPos = nil
            end
        end

        -- FLY 3D COM ANALÓGICO CORRIGIDO E TRAVA DE ALTURA Y
        if root and hum then
            if Config.Fly and not Config.Flinging then
                if not flyActivePrev then
                    lockedY = root.Position.Y
                    flyActivePrev = true
                end

                hum.PlatformStand = true
                root.AssemblyLinearVelocity = Vector3.zero
                root.AssemblyAngularVelocity = Vector3.zero

                local moveDir = hum.MoveDirection
                local camCF = Camera.CFrame
                local flyVec = Vector3.zero

                if moveDir.Magnitude > 0 then
                    local flatLook = Vector3.new(camCF.LookVector.X, 0, camCF.LookVector.Z).Unit
                    local flatRight = Vector3.new(camCF.RightVector.X, 0, camCF.RightVector.Z).Unit
                    
                    local forwardDot = moveDir:Dot(camCF.LookVector)
                    local rightDot = moveDir:Dot(camCF.RightVector)
                    
                    flyVec = (flatLook * forwardDot) + (flatRight * rightDot)
                    if flyVec.Magnitude > 0 then flyVec = flyVec.Unit end
                end

                if Config.FlyVertical ~= 0 then
                    lockedY = lockedY + (Config.FlyVertical * Config.FlySpeed * dt)
                end

                local currentPos = root.Position
                local targetHorizontalPos = currentPos + Vector3.new(flyVec.X * Config.FlySpeed * dt, 0, flyVec.Z * Config.FlySpeed * dt)
                local finalPos = Vector3.new(targetHorizontalPos.X, lockedY, targetHorizontalPos.Z)

                root.CFrame = CFrame.new(finalPos, finalPos + camCF.LookVector)
            else
                if flyActivePrev then
                    flyActivePrev = false
                    lockedY = nil
                end
                if hum.PlatformStand and not Config.Flinging then
                    hum.PlatformStand = false
                end
            end
        end
    end
end)
