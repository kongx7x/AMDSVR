--!native
--!optimize 2
-- BENCH MOBILE // FULL TOUCH v8.3 + OVERRIDE V6 (UNIFICADO + OFFSETS DUMP)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local CoreGui = game:GetService("CoreGui")
local SoundService = game:GetService("SoundService")
local VirtualUser = game:GetService("VirtualUser")
local ProximityPromptService = game:GetService("ProximityPromptService")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

local OriginalLighting = {
    Brightness = Lighting.Brightness,
    ClockTime = Lighting.ClockTime,
    FogEnd = Lighting.FogEnd,
    GlobalShadows = Lighting.GlobalShadows,
    OutdoorAmbient = Lighting.OutdoorAmbient,
    Ambient = Lighting.Ambient
}

-- ==========================================
-- BANCO DE DADOS DE OFFSETS (393 OFFSETS)
-- ==========================================
local RobloxDumpInfo = {
    Game = "roblox",
    Version = "version-5a21b87bbc2641cf",
    UpdatedAt = "22:19 26/10/2026",
    Total = 393,
    Offsets = {
        ["TaskScheduler.Pointer"] = "147445400",
        ["TaskScheduler.JobStart"] = "200",
        ["TaskScheduler.JobEnd"] = "208",
        ["TaskScheduler.JobName"] = "24",
        ["TaskScheduler.MaxFPS"] = "176",
        ["VisualEngine.Pointer"] = "142189080",
        ["VisualEngine.Dimensions"] = "2832",
        ["VisualEngine.ViewMatrix"] = "432",
        ["VisualEngine.RenderView"] = "3136",
        ["VisualEngine.FakeDataModel"] = "2800",
        ["FakeDataModel.Pointer"] = "147875328",
        ["FakeDataModel.RealDataModel"] = "504",
        ["RenderView.LightingValid"] = "0",
        ["RenderView.SkyValid"] = "0",
        ["RenderView.VisualEngine"] = "0",
        ["RenderView.DeviceD3D11"] = "0",
        ["ScriptContext.RequireBypass"] = "0",
        ["ModuleScript.IsCoreScript"] = "0",
        ["ModuleScript.GUID"] = "184",
        ["ModuleScript.Hash"] = "840",
        ["ModuleScript.ByteCode"] = "0",
        ["MouseService.SensitivityPointer"] = "0",
        ["MouseService.InputObject"] = "232",
        ["MouseService.InputObject2"] = "248",
        ["MouseService.MousePosition"] = "188",
        ["PlayerConfigurer.Pointer"] = "0",
        ["Instance.This"] = "8",
        ["Instance.NameContainer"] = "104",
        ["Instance.Name"] = "0",
        ["Instance.ChildrenStart"] = "112",
        ["Instance.ChildrenEnd"] = "8",
        ["Instance.Parent"] = "96",
        ["Instance.ClassDescriptor"] = "24",
        ["Instance.ClassName"] = "8",
        ["Instance.ClassBase"] = "432",
        ["Misc.StringLength"] = "16",
        ["Misc.Adornee"] = "216",
        ["Misc.Value"] = "160",
        ["Misc.AnimationId"] = "168",
        ["DataModel.PlaceId"] = "384",
        ["DataModel.GameId"] = "376",
        ["DataModel.CreatorId"] = "368",
        ["DataModel.GameLoaded"] = "1416",
        ["DataModel.JobId"] = "264",
        ["DataModel.Workspace"] = "328",
        ["DataModel.ScriptContext"] = "1088",
        ["DataModel.PlaceVersion"] = "412",
        ["DataModel.ServerIP"] = "1392",
        ["DataModel.ToRenderView1"] = "440",
        ["DataModel.ToRenderView2"] = "8",
        ["DataModel.ToRenderView3"] = "40",
        ["DataModel.PrimitiveCount"] = "1040",
        ["RunService.HeartbeatTask"] = "38504",
        ["RunService.HeartbeatFPS"] = "244",
        ["RenderJob.RenderView"] = "480",
        ["RenderJob.FakeDataModel"] = "56",
        ["RenderJob.RealDataModel"] = "496",
        ["Workspace.World"] = "1016",
        ["Workspace.ReadOnlyGravity"] = "2496",
        ["Workspace.DistributedGameTime"] = "1216",
        ["Workspace.CurrentCamera"] = "1184",
        ["World.Gravity"] = "536",
        ["World.worldStepsPerSec"] = "2136",
        ["World.FallenPartsDestroyHeight"] = "524",
        ["World.AirProperties"] = "560",
        ["World.Primitives"] = "672",
        ["AirProperties.AirDensity"] = "24",
        ["AirProperties.GlobalWind"] = "60",
        ["Terrain.GrassLength"] = "472",
        ["Terrain.WaterReflectance"] = "480",
        ["Terrain.WaterTransparency"] = "484",
        ["Terrain.WaterWaveSize"] = "488",
        ["Terrain.WaterWaveSpeed"] = "492",
        ["Terrain.WaterColor"] = "456",
        ["Terrain.MaterialColors"] = "1184",
        ["MaterialColors.Asphalt"] = "48",
        ["MaterialColors.Basalt"] = "39",
        ["MaterialColors.Brick"] = "15",
        ["MaterialColors.Cobblestone"] = "51",
        ["MaterialColors.Concrete"] = "12",
        ["MaterialColors.CrackedLava"] = "45",
        ["MaterialColors.Glacier"] = "27",
        ["MaterialColors.Grass"] = "6",
        ["MaterialColors.Ground"] = "42",
        ["MaterialColors.Ice"] = "54",
        ["MaterialColors.LeafyGrass"] = "57",
        ["MaterialColors.Limestone"] = "63",
        ["MaterialColors.Mud"] = "36",
        ["MaterialColors.Pavement"] = "66",
        ["MaterialColors.Rock"] = "24",
        ["MaterialColors.Salt"] = "60",
        ["MaterialColors.Sand"] = "18",
        ["MaterialColors.Sandstone"] = "33",
        ["MaterialColors.Slate"] = "9",
        ["MaterialColors.Snow"] = "30",
        ["MaterialColors.WoodPlanks"] = "21",
        ["Sound.SoundId"] = "176",
        ["Sound.RollOffMaxDistance"] = "264",
        ["Sound.RollOffMinDistance"] = "268",
        ["Sound.PlaybackSpeed"] = "260",
        ["Sound.Volume"] = "280",
        ["Sound.SoundGroup"] = "208",
        ["Sound.IsPlaying"] = "296",
        ["Sound.Looped"] = "293",
        ["SpawnLocation.AllowTeamChangeOnTouch"] = "472",
        ["SpawnLocation.Enabled"] = "473",
        ["SpawnLocation.Neutral"] = "474",
        ["SpawnLocation.ForcefieldDuration"] = "464",
        ["SpawnLocation.TeamColor"] = "468",
        ["SurfaceAppearance.AlphaMode"] = "472",
        ["SurfaceAppearance.Color"] = "448",
        ["SurfaceAppearance.ColorMap"] = "176",
        ["SurfaceAppearance.EmissiveMaskContent"] = "224",
        ["SurfaceAppearance.EmissiveStrength"] = "476",
        ["SurfaceAppearance.EmissiveTint"] = "460",
        ["SurfaceAppearance.MetalnessMap"] = "272",
        ["SurfaceAppearance.NormalMap"] = "320",
        ["SurfaceAppearance.RoughnessMap"] = "368",
        ["ParticleEmitter.Brightness"] = "516",
        ["ParticleEmitter.LightEmission"] = "544",
        ["ParticleEmitter.LightInfluence"] = "548",
        ["ParticleEmitter.Texture"] = "424",
        ["ParticleEmitter.ZOffset"] = "588",
        ["ParticleEmitter.Lifetime"] = "476",
        ["ParticleEmitter.Rate"] = "560",
        ["ParticleEmitter.Rotation"] = "492",
        ["ParticleEmitter.RotSpeed"] = "484",
        ["ParticleEmitter.Speed"] = "500",
        ["ParticleEmitter.SpreadAngle"] = "508",
        ["ParticleEmitter.Acceleration"] = "456",
        ["ParticleEmitter.Drag"] = "520",
        ["ParticleEmitter.TimeScale"] = "580",
        ["ParticleEmitter.VelocityInheritance"] = "584",
        ["Beam.Brightness"] = "360",
        ["Beam.LightEmission"] = "372",
        ["Beam.LightInfluence"] = "376",
        ["Beam.Texture"] = "296",
        ["Beam.TextureLength"] = "388",
        ["Beam.TextureSpeed"] = "396",
        ["Beam.ZOffset"] = "408",
        ["Beam.Attachment0"] = "328",
        ["Beam.Attachment1"] = "344",
        ["Beam.CurveSize0"] = "364",
        ["Beam.CurveSize1"] = "368",
        ["Beam.Width0"] = "400",
        ["Beam.Width1"] = "404",
        ["Player.LocalPlayer"] = "280",
        ["Player.UserId"] = "184",
        ["Player.DisplayName"] = "288",
        ["Player.HealthDisplayDistance"] = "928",
        ["Player.NameDisplayDistance"] = "944",
        ["Player.ModelInstance"] = "672",
        ["Player.Team"] = "736",
        ["Player.TeamColor"] = "952",
        ["Player.LocaleId"] = "256",
        ["Player.AccountAge"] = "868",
        ["Player.MinZoomDistance"] = "884",
        ["Player.MaxZoomDistance"] = "880",
        ["Player.CameraMode"] = "888",
        ["Player.Mouse"] = "4592",
        ["Team.BrickColor"] = "160",
        ["Humanoid.Health"] = "388",
        ["Humanoid.MaxHealth"] = "412",
        ["Humanoid.Walkspeed"] = "452",
        ["Humanoid.WalkspeedCheck"] = "924",
        ["Humanoid.JumpPower"] = "408",
        ["Humanoid.JumpHeight"] = "404",
        ["Humanoid.HipHeight"] = "392",
        ["Humanoid.MaxSlopeAngle"] = "416",
        ["Humanoid.SeatPart"] = "240",
        ["Humanoid.HumanoidRootPart"] = "1120",
        ["Humanoid.CameraOffset"] = "272",
        ["Humanoid.HealthDisplayDistance"] = "380",
        ["Humanoid.NameDisplayDistance"] = "420",
        ["Humanoid.DisplayDistanceType"] = "372",
        ["Humanoid.HealthDisplayType"] = "384",
        ["Humanoid.NameOcclusion"] = "424",
        ["Humanoid.DisplayName"] = "160",
        ["Humanoid.MoveDirection"] = "308",
        ["Humanoid.RigType"] = "436",
        ["Humanoid.Jump"] = "464",
        ["Humanoid.Sit"] = "467",
        ["Humanoid.PlatformStand"] = "466",
        ["Humanoid.UseJumpPower"] = "470",
        ["Humanoid.AutomaticScalingEnabled"] = "458",
        ["Humanoid.BreakJointsOnDeath"] = "460",
        ["Humanoid.EvaluateStateMachine"] = "461",
        ["Humanoid.RequiresNeck"] = "467",
        ["Humanoid.AutoJumpEnabled"] = "456",
        ["Humanoid.AutoRotate"] = "457",
        ["Humanoid.IsWalking"] = "2606",
        ["Humanoid.MoveToPoint"] = "344",
        ["Humanoid.MoveToPart"] = "256",
        ["Humanoid.WalkTimer"] = "0",
        ["Humanoid.HumanoidState"] = "2216",
        ["Humanoid.HumanoidStateID"] = "32",
        ["Humanoid.FloorMaterial"] = "376",
        ["Humanoid.TargetPoint"] = "320",
        ["Humanoid.PlatformStatePointer"] = "2585611404",
        ["Seat.Occupant"] = "512",
        ["VehicleSeat.MaxSpeed"] = "528",
        ["VehicleSeat.SteerFloat"] = "532",
        ["VehicleSeat.ThrottleFloat"] = "536",
        ["VehicleSeat.Torque"] = "540",
        ["VehicleSeat.TurnSpeed"] = "544",
        ["StatsItem.Value"] = "82474",
        ["Tool.Tooltip"] = "1104",
        ["Tool.TextureId"] = "840",
        ["Tool.Grip"] = "1172",
        ["Tool.Enabled"] = "1185",
        ["Tool.CanBeDropped"] = "1184",
        ["Tool.ManualActivationOnly"] = "1186",
        ["Tool.RequiresHandle"] = "1187",
        ["Clothing.Template"] = "232",
        ["Clothing.Color3"] = "264",
        ["CharacterMesh.BaseTextureId"] = "176",
        ["CharacterMesh.OverlayTextureId"] = "272",
        ["CharacterMesh.MeshId"] = "224",
        ["CharacterMesh.BodyPart"] = "304",
        ["Camera.Position"] = "228",
        ["Camera.Rotation"] = "192",
        ["Camera.CameraSubject"] = "176",
        ["Camera.FieldOfView"] = "296",
        ["Camera.ImagePlaneDepth"] = "724",
        ["Camera.CameraType"] = "288",
        ["Camera.Viewport"] = "644",
        ["Camera.ViewportSize"] = "708",
        ["BasePart.Primitive"] = "376",
        ["BasePart.Transparency"] = "280",
        ["BasePart.Color3"] = "284",
        ["BasePart.Shape"] = "416",
        ["BasePart.Massless"] = "290",
        ["BasePart.CastShadow"] = "288",
        ["BasePart.Locked"] = "289",
        ["BasePart.Reflectance"] = "244",
        ["Primitive.Position"] = "212",
        ["Primitive.Validate"] = "6",
        ["Primitive.Owner"] = "536",
        ["Primitive.Size"] = "452",
        ["Primitive.Rotation"] = "176",
        ["Primitive.Flags"] = "446",
        ["Primitive.Material"] = "0",
        ["Primitive.AssemblyLinearVelocity"] = "224",
        ["Primitive.AssemblyAngularVelocity"] = "236",
        ["PrimitiveFlags.Anchored"] = "2",
        ["PrimitiveFlags.CanCollide"] = "8",
        ["PrimitiveFlags.CanTouch"] = "16",
        ["PrimitiveFlags.CanQuery"] = "32",
        ["MeshPart.MeshId"] = "760",
        ["MeshPart.Texture"] = "808",
        ["Model.PrimaryPart"] = "576",
        ["Model.Scale"] = "300",
        ["SpecialMesh.Scale"] = "172",
        ["SpecialMesh.MeshId"] = "224",
        ["Attachment.Position"] = "172",
        ["Weld.Part0"] = "256",
        ["Weld.Part1"] = "272",
        ["WeldConstraint.Part0"] = "160",
        ["WeldConstraint.Part1"] = "176",
        ["UnionOperation.AssetId"] = "760",
        ["PlayerMouse.Workspace"] = "312",
        ["PlayerMouse.Icon"] = "176",
        ["GuiObject.ScreenGui_Enabled"] = "1164",
        ["GuiObject.Position"] = "1240",
        ["GuiObject.Size"] = "1272",
        ["GuiObject.Visible"] = "1397",
        ["GuiObject.Image"] = "2472",
        ["GuiObject.Text"] = "3592",
        ["GuiObject.RichText"] = "2976",
        ["GuiObject.BackgroundColor3"] = "1288",
        ["GuiObject.BorderColor3"] = "1300",
        ["GuiObject.TextColor3"] = "3768",
        ["GuiObject.LayoutOrder"] = "1348",
        ["GuiObject.ZIndex"] = "1388",
        ["GuiObject.BackgroundTransparency"] = "1300",
        ["GuiObject.Rotation"] = "208",
        ["GuiBase2D.AbsoluteSize"] = "0",
        ["GuiBase2D.AbsolutePosition"] = "244",
        ["GuiBase2D.AbsoluteRotation"] = "208",
        ["UserInputService.WindowInputState"] = "648",
        ["WindowInputState.CurrentTextBox"] = "72",
        ["WindowInputState.CapsLock"] = "64",
        ["Textures.Decal_Texture"] = "456",
        ["Textures.Texture_Texture"] = "456",
        ["Lighting.ClockTime"] = "176",
        ["Lighting.Brightness"] = "256",
        ["Lighting.EnvironmentDiffuseScale"] = "260",
        ["Lighting.EnvironmentSpecularScale"] = "264",
        ["Lighting.FogStart"] = "280",
        ["Lighting.FogEnd"] = "276",
        ["Lighting.FogColor"] = "220",
        ["Lighting.Ambient"] = "184",
        ["Lighting.OutdoorAmbient"] = "232",
        ["Lighting.ColorShift_Top"] = "196",
        ["Lighting.ColorShift_Bottom"] = "208",
        ["Lighting.ExposureCompensation"] = "268",
        ["Lighting.GeographicLatitude"] = "284",
        ["Lighting.LightColor"] = "324",
        ["Lighting.GradientTop"] = "312",
        ["Lighting.LightDirection"] = "336",
        ["Lighting.GradientBottom"] = "376",
        ["Lighting.GlobalShadows"] = "300",
        ["Lighting.MoonPosition"] = "364",
        ["Lighting.SunPosition"] = "352",
        ["Lighting.Source"] = "348",
        ["Lighting.Sky"] = "432",
        ["Sky.SkyboxBk"] = "224",
        ["Sky.SkyboxDn"] = "272",
        ["Sky.SkyboxFt"] = "320",
        ["Sky.SkyboxLf"] = "368",
        ["Sky.SkyboxRt"] = "416",
        ["Sky.SkyboxUp"] = "464",
        ["Sky.SunAngularSize"] = "548",
        ["Sky.MoonAngularSize"] = "556",
        ["Sky.SunTextureId"] = "512",
        ["Sky.MoonTextureId"] = "176",
        ["Sky.SkyboxOrientation"] = "544",
        ["Sky.StarCount"] = "560",
        ["Atmosphere.Density"] = "184",
        ["Atmosphere.Offset"] = "196",
        ["Atmosphere.Color"] = "160",
        ["Atmosphere.Decay"] = "172",
        ["Atmosphere.Glare"] = "188",
        ["Atmosphere.Haze"] = "192",
        ["BloomEffect.Intensity"] = "160",
        ["BloomEffect.Size"] = "164",
        ["BloomEffect.Threshold"] = "168",
        ["BloomEffect.Enabled"] = "152",
        ["DepthOfFieldEffect.FocusDistance"] = "164",
        ["DepthOfFieldEffect.FarIntensity"] = "160",
        ["DepthOfFieldEffect.NearIntensity"] = "172",
        ["DepthOfFieldEffect.InFocusRadius"] = "168",
        ["DepthOfFieldEffect.Enabled"] = "152",
        ["SunRaysEffect.Intensity"] = "160",
        ["SunRaysEffect.Spread"] = "164",
        ["SunRaysEffect.Enabled"] = "152",
        ["ColorCorrectionEffect.Brightness"] = "172",
        ["ColorCorrectionEffect.Contrast"] = "176",
        ["ColorCorrectionEffect.TintColor"] = "160",
        ["ColorCorrectionEffect.Enabled"] = "152",
        ["ColorGradingEffect.TonemapperPreset"] = "160",
        ["ColorGradingEffect.Enabled"] = "152",
        ["BlurEffect.Size"] = "160",
        ["BlurEffect.Enabled"] = "152",
        ["ProximityPrompt.ActionText"] = "152",
        ["ProximityPrompt.ObjectText"] = "184",
        ["ProximityPrompt.HoldDuration"] = "264",
        ["ProximityPrompt.MaxActivationDistance"] = "272",
        ["ProximityPrompt.KeyCode"] = "268",
        ["ProximityPrompt.GamepadKeyCode"] = "260",
        ["ProximityPrompt.Enabled"] = "286",
        ["ProximityPrompt.RequiresLineOfSight"] = "287",
        ["ClickDetector.MaxActivationDistance"] = "208",
        ["ClickDetector.MouseIcon"] = "176",
        ["DragDetector.ReferenceInstance"] = "440",
        ["DragDetector.MaxActivationDistance"] = "208",
        ["DragDetector.MaxDragAngle"] = "624",
        ["DragDetector.MaxDragTranslation"] = "564",
        ["DragDetector.MinDragAngle"] = "636",
        ["DragDetector.MinDragTranslation"] = "576",
        ["DragDetector.ActivatedCursorIcon"] = "392",
        ["DragDetector.CursorIcon"] = "176",
        ["DragDetector.MaxForce"] = "628",
        ["DragDetector.MaxTorque"] = "632",
        ["DragDetector.Responsiveness"] = "648",
        ["AnimationTrack.Animation"] = "160",
        ["AnimationTrack.Animator"] = "248",
        ["AnimationTrack.Speed"] = "188",
        ["AnimationTrack.TimePosition"] = "192",
        ["AnimationTrack.Looped"] = "205",
        ["AnimationTrack.IsPlaying"] = "2576",
        ["Animator.ActiveAnimations"] = "2304",
        ["LocalScript.GUID"] = "184",
        ["LocalScript.Hash"] = "392",
        ["LocalScript.ByteCode"] = "0",
        ["ByteCode.Size"] = "40",
        ["ByteCode.Pointer"] = "16",
        ["Script.GUID"] = "184",
        ["Script.Hash"] = "392",
        ["Script.ByteCode"] = "0",
        ["MeshContentProvider.LRUHolder"] = "192",
        ["LRUHolder.MemEnforcedLRUCache"] = "32",
        ["MemEnforcedLRUCache.Head"] = "8",
        ["LRUNode.Next"] = "0",
        ["LRUNode.AssetID"] = "16",
        ["LRUNode.CachedItem"] = "64",
        ["CachedItem.FileMeshData"] = "64",
        ["FileMeshData.AABBMin"] = "384",
        ["FileMeshData.AABBMax"] = "396",
        ["FileMeshData.Vertices"] = "0",
        ["FileMeshData.VerticesEnd"] = "8",
        ["FileMeshData.Faces"] = "48",
        ["FileMeshData.FacesEnd"] = "56"
    }
}

-- ==========================================
-- CONFIGURAÇÃO UNIFICADA (v8.3 + OVERRIDE V6)
-- ==========================================
local Config = {
    -- Combate
    Aimbot = false,
    WallCheck = true,
    TeamCheck = false,
    TargetNPCs = true,
    AimPart = "Head",
    AimSmoothing = 1.0, -- 1.0 = Trava Direta (v8.3), menor = Suavizado (V6)
    FOVSize = 110,
    ShowFOV = false,
    FOVColor = Color3.fromRGB(255, 70, 70),
    FOVThickness = 1.8,
    MagicBullet = false,
    MagicRange = 600,
    HitboxExpander = false,
    HitboxSize = 14,
    ReachEnabled = false,
    ReachSize = 15,
    DamageBoost = false,
    DamageMultiplier = 4,
    GodMode = false,

    -- Visuais & ESP
    ESP = false,
    ESPBoxes = true,
    ESPNames = true,
    ESPHealth = true,
    ESPDistance = true,
    ESPChams = true,
    SkeletonESP = true,
    Fullbright = false,
    FullbrightIntensity = 2.5,
    UISounds = true,

    -- Movimento
    Noclip = false,
    DesyncBody = false,
    InstantPrompts = false,
    AnimRemover = false,
    InfJump = false,
    InfJumpMultiplier = 1.0,
    Fly = false,
    FlySpeed = 55,
    FlyVertical = 0,
    Speed = false,
    WalkSpeed = 48,
    JumpPowerEnabled = false,
    JumpPower = 75,

    -- Jogadores & Teleporte
    SelectedPlayer = nil,
    AttachBack = false,
    AttachDistance = 2.2,
    Flinging = false,
    CopiedCoordString = "",

    -- Extras & Ajustes (V6)
    ThirdPersonInfinite = false,
    AntiAFK = true,
    ClickTP = false,
    Freecam = false,
    FreecamSpeed = 50,
    HitSoundEnabled = false,
    HitSoundId = "rbxassetid://160432334",
    FPSBooster = false,
    SpectatorList = false,
    Crosshair = false,
    CrosshairColor = Color3.fromRGB(255, 50, 80),
    CrosshairSize = 14,
    ToggleKey = Enum.KeyCode.RightShift,
    Connections = {},
    ESPObjects2D = {}
}

local function getGuiParent()
    local ok, res = pcall(function()
        return (gethui and gethui()) or CoreGui:FindFirstChild("RobloxGui") or CoreGui
    end)
    if ok and res then return res end
    return LocalPlayer:WaitForChild("PlayerGui")
end

local parentGui = getGuiParent()
if parentGui:FindFirstChild("OllieMobileHub") then
    parentGui.OllieMobileHub:Destroy()
end
if parentGui:FindFirstChild("OllieBenchHub_V6") then
    parentGui.OllieBenchHub_V6:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "OllieMobileHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = parentGui

-- ==========================================
-- MOTOR DE EFEITOS SONOROS DA UI & HIT SOUND
-- ==========================================
local SoundFolder = Instance.new("Folder")
SoundFolder.Name = "BenchAudioBank"
SoundFolder.Parent = ScreenGui

local SoundBank = {
    Tab       = {Id = "rbxassetid://6895079853", Pitch = 1.05, Volume = 0.55},
    ToggleOn  = {Id = "rbxassetid://6895079853", Pitch = 1.25, Volume = 0.65},
    ToggleOff = {Id = "rbxassetid://6895079853", Pitch = 0.85, Volume = 0.55},
    Step      = {Id = "rbxassetid://6042053626", Pitch = 1.15, Volume = 0.50},
    Action    = {Id = "rbxassetid://4590662766", Pitch = 1.00, Volume = 0.65},
    Error     = {Id = "rbxassetid://4590657391", Pitch = 0.90, Volume = 0.65},
    Menu      = {Id = "rbxassetid://6042053626", Pitch = 0.95, Volume = 0.60}
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

local function playCustomSound(soundId, volume, pitch)
    task.spawn(function()
        pcall(function()
            local sfx = Instance.new("Sound")
            sfx.SoundId = soundId
            sfx.Volume = volume or 0.8
            sfx.PlaybackSpeed = pitch or 1
            sfx.Parent = SoundFolder
            sfx:Play()
            sfx.Ended:Connect(function() sfx:Destroy() end)
        end)
    end)
end

-- ==========================================
-- ARRASTE TOUCH & MOUSE
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

-- ==========================================
-- ELEMENTOS DE TELA (FOV, CROSSHAIR, BADGES)
-- ==========================================
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
FOVStroke.Color = Config.FOVColor
FOVStroke.Thickness = Config.FOVThickness
FOVStroke.Transparency = 0.15

-- Crosshair Customizada (V6)
local CrosshairFrame = Instance.new("Frame")
CrosshairFrame.Name = "CustomCrosshair"
CrosshairFrame.AnchorPoint = Vector2.new(0.5, 0.5)
CrosshairFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
CrosshairFrame.Size = UDim2.new(0, 2, 0, 2)
CrosshairFrame.BackgroundTransparency = 1
CrosshairFrame.Visible = false
CrosshairFrame.Parent = ScreenGui

local CrossH = Instance.new("Frame")
CrossH.AnchorPoint = Vector2.new(0.5, 0.5)
CrossH.Position = UDim2.new(0.5, 0, 0.5, 0)
CrossH.Size = UDim2.new(0, Config.CrosshairSize, 0, 2)
CrossH.BackgroundColor3 = Config.CrosshairColor
CrossH.BorderSizePixel = 0
CrossH.Parent = CrosshairFrame

local CrossV = Instance.new("Frame")
CrossV.AnchorPoint = Vector2.new(0.5, 0.5)
CrossV.Position = UDim2.new(0.5, 0, 0.5, 0)
CrossV.Size = UDim2.new(0, 2, 0, Config.CrosshairSize)
CrossV.BackgroundColor3 = Config.CrosshairColor
CrossV.BorderSizePixel = 0
CrossV.Parent = CrosshairFrame

-- Status Overlay: Noclip Badge & Spectator List (V6)
local StatusOverlay = Instance.new("Frame")
StatusOverlay.Position = UDim2.new(0, 15, 0.32, 0)
StatusOverlay.Size = UDim2.new(0, 190, 0, 140)
StatusOverlay.BackgroundTransparency = 1
StatusOverlay.Parent = ScreenGui

local NoclipBadge = Instance.new("TextLabel")
NoclipBadge.Size = UDim2.new(1, 0, 0, 24)
NoclipBadge.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
NoclipBadge.TextColor3 = Color3.fromRGB(255, 85, 85)
NoclipBadge.Font = Enum.Font.GothamBold
NoclipBadge.TextSize = 11
NoclipBadge.Text = " [NOCLIP: ATIVO] "
NoclipBadge.Visible = false
NoclipBadge.Parent = StatusOverlay
Instance.new("UICorner", NoclipBadge).CornerRadius = UDim.new(0, 6)
local NoclipStroke = Instance.new("UIStroke", NoclipBadge)
NoclipStroke.Color = Color3.fromRGB(255, 85, 85)
NoclipStroke.Thickness = 1

local SpecFrame = Instance.new("Frame")
SpecFrame.Position = UDim2.new(0, 0, 0, 30)
SpecFrame.Size = UDim2.new(1, 0, 0, 100)
SpecFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
SpecFrame.BackgroundTransparency = 0.2
SpecFrame.Visible = false
SpecFrame.Parent = StatusOverlay
Instance.new("UICorner", SpecFrame).CornerRadius = UDim.new(0, 6)
local SpecStroke = Instance.new("UIStroke", SpecFrame)
SpecStroke.Color = Color3.fromRGB(255, 85, 85)
SpecStroke.Thickness = 1

local SpecTitle = Instance.new("TextLabel")
SpecTitle.Size = UDim2.new(1, 0, 0, 22)
SpecTitle.BackgroundTransparency = 1
SpecTitle.TextColor3 = Color3.fromRGB(255, 110, 110)
SpecTitle.Font = Enum.Font.GothamBold
SpecTitle.TextSize = 11
SpecTitle.Text = "ESPECTADORES (0)"
SpecTitle.Parent = SpecFrame

local SpecListLabel = Instance.new("TextLabel")
SpecListLabel.Position = UDim2.new(0, 6, 0, 22)
SpecListLabel.Size = UDim2.new(1, -12, 1, -26)
SpecListLabel.BackgroundTransparency = 1
SpecListLabel.TextColor3 = Color3.fromRGB(230, 230, 240)
SpecListLabel.Font = Enum.Font.Gotham
SpecListLabel.TextSize = 11
SpecListLabel.TextXAlignment = Enum.TextXAlignment.Left
SpecListLabel.TextYAlignment = Enum.TextYAlignment.Top
SpecListLabel.TextWrapped = true
SpecListLabel.Text = "Nenhum"
SpecListLabel.Parent = SpecFrame
makeDraggable(SpecFrame, StatusOverlay, nil)

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

-- FlyPad Mobile
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

-- ==========================================
-- JANELA PRINCIPAL (BENCH MOBILE v8.3)
-- ==========================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 530, 0, 340)
MainFrame.Position = UDim2.new(0.5, -265, 0.5, -170)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)
local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Color3.fromRGB(50, 50, 62)
MainStroke.Thickness = 1.5

local function toggleMainMenu()
    MainFrame.Visible = not MainFrame.Visible
    playSFX("Menu")
end

makeDraggable(FloatBtn, FloatBtn, toggleMainMenu)

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
TitleLabel.Text = "BENCH MOBILE // FULL TOUCH v8.3 + V6"
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
CloseBtn.MouseButton1Click:Connect(toggleMainMenu)

makeDraggable(TopBar, MainFrame, nil)

-- Sidebar
local Sidebar = Instance.new("ScrollingFrame")
Sidebar.Size = UDim2.new(0, 135, 1, -46)
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
PagesHolder.Size = UDim2.new(1, -153, 1, -46)
PagesHolder.Position = UDim2.new(0, 147, 0, 42)
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
    TabBtn.Size = UDim2.new(1, -12, 0, 36)
    TabBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
    TabBtn.Text = ""
    TabBtn.AutoButtonColor = false
    TabBtn.Parent = Sidebar
    Instance.new("UICorner", TabBtn).CornerRadius = UDim.new(0, 6)

    local Icon = Instance.new("ImageLabel")
    Icon.Size = UDim2.new(0, 18, 0, 18)
    Icon.Position = UDim2.new(0, 8, 0.5, -9)
    Icon.BackgroundTransparency = 1
    Icon.Image = iconId
    Icon.ImageColor3 = Color3.fromRGB(180, 180, 195)
    Icon.Parent = TabBtn

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -32, 1, 0)
    Label.Position = UDim2.new(0, 32, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = tabName
    Label.TextColor3 = Color3.fromRGB(180, 180, 195)
    Label.Font = Enum.Font.GothamSemibold
    Label.TextSize = 11
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

local CombatPage  = createTab("Combate", "rbxassetid://6031265976")
local VisualPage  = createTab("Visuais", "rbxassetid://6031075931")
local MovePage    = createTab("Movimento", "rbxassetid://6034754445")
local PlayerPage  = createTab("Jogadores", "rbxassetid://6034287594")
local CoordsPage  = createTab("Coords", "rbxassetid://6034509993")
local ExtrasPage  = createTab("Extras V6", "rbxassetid://6034287525")
local OffsetsPage = createTab("Info/Offsets", "rbxassetid://6031075938")
local ConfigPage  = createTab("Ajustes", "rbxassetid://6031280882")

TabButtons[1].Btn.BackgroundColor3 = Color3.fromRGB(255, 75, 75)
TabButtons[1].Icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
TabButtons[1].Label.TextColor3 = Color3.fromRGB(255, 255, 255)
CombatPage.Visible = true

-- ==========================================
-- COMPONENTES DE UI (TOGGLE, STEPPER, SLIDER, CYCLE, BUTTON)
-- ==========================================
local function addSection(parentPage, titleText)
    local Sec = Instance.new("TextLabel")
    Sec.Size = UDim2.new(1, -6, 0, 22)
    Sec.BackgroundTransparency = 1
    Sec.Text = " // " .. string.upper(titleText)
    Sec.TextColor3 = Color3.fromRGB(255, 95, 95)
    Sec.Font = Enum.Font.GothamBold
    Sec.TextSize = 11
    Sec.TextXAlignment = Enum.TextXAlignment.Left
    Sec.Parent = parentPage
end

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
        val = math.floor((math.clamp(val - step, minVal, maxVal)) * 100) / 100
        Label.Text = labelText .. ": " .. tostring(val)
        playSFX("Step")
        callback(val)
    end)
    Plus.MouseButton1Click:Connect(function()
        val = math.floor((math.clamp(val + step, minVal, maxVal)) * 100) / 100
        Label.Text = labelText .. ": " .. tostring(val)
        playSFX("Step")
        callback(val)
    end)
end

local function addButton(parentPage, labelText, callback)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, -6, 0, 36)
    Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 54)
    Btn.Text = labelText
    Btn.TextColor3 = Color3.fromRGB(255, 110, 110)
    Btn.Font = Enum.Font.GothamBold
    Btn.TextSize = 12
    Btn.Parent = parentPage
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 7)

    local Stroke = Instance.new("UIStroke", Btn)
    Stroke.Color = Color3.fromRGB(255, 75, 75)
    Stroke.Thickness = 1

    Btn.MouseButton1Click:Connect(function()
        playSFX("Action")
        task.spawn(callback)
    end)
    return Btn
end

local function addCycle(parentPage, labelPrefix, options, defaultIdx, callback)
    local idx = defaultIdx or 1
    local Btn = addButton(parentPage, labelPrefix .. ": " .. tostring(options[idx]), function() end)
    Btn.MouseButton1Click:Connect(function()
        idx = (idx % #options) + 1
        Btn.Text = labelPrefix .. ": " .. tostring(options[idx])
        playSFX("Step")
        callback(options[idx])
    end)
end

-- ==========================================
-- GERENCIADOR DE HITBOX & GOD MODE & NOCLIP
-- ==========================================
local ModifiedHitboxes = {}

local function expandTargetHitbox(part, sizeVal)
    if not part or not part.Parent then return end
    if not ModifiedHitboxes[part] then
        ModifiedHitboxes[part] = {
            Size = part.Size,
            Transparency = part.Transparency,
            CanCollide = part.CanCollide,
            Massless = part.Massless,
            Color = part.Color
        }
    end
    pcall(function()
        part.Size = Vector3.new(sizeVal, sizeVal, sizeVal)
        part.Transparency = 0.78
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
                part.Color = orig.Color
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

table.insert(Config.Connections, LocalPlayer.CharacterAdded:Connect(function(newChar)
    task.wait(0.3)
    if Config.GodMode then applyGodMode(newChar) end
end))

local OriginalCanCollide = {}
local function disableNoclipAndRestore()
    for part, origState in pairs(OriginalCanCollide) do
        if part and part.Parent then part.CanCollide = origState end
    end
    table.clear(OriginalCanCollide)
end

-- ==========================================
-- ESP CLEAR & SKELETON DRAWS & 2D BOXES
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

    for _, esp2d in pairs(Config.ESPObjects2D) do
        pcall(function()
            if esp2d.Gui then esp2d.Gui.Visible = false end
        end)
    end
end

-- ==========================================
-- 1. ABA COMBATE (v8.3 + V6)
-- ==========================================
addSection(CombatPage, "Aimbot & Alvo")
addToggle(CombatPage, "Aimbot Mobile/PC (Trava Centro)", "rbxassetid://6031265976", Config.Aimbot, function(v)
    Config.Aimbot = v
end)
addToggle(CombatPage, "WallCheck (Ignorar Atrás de Parede)", "rbxassetid://6031075931", Config.WallCheck, function(v)
    Config.WallCheck = v
end)
addToggle(CombatPage, "Team Check (Ignorar Aliados)", "rbxassetid://6034287525", Config.TeamCheck, function(v)
    Config.TeamCheck = v
end)
addToggle(CombatPage, "Focar em NPCs / Bots também", "rbxassetid://6034287594", Config.TargetNPCs, function(v)
    Config.TargetNPCs = v
    if not v then restoreAllHitboxes() end
end)
addCycle(CombatPage, "Parte do Alvo (AimPart)", {"Head", "HumanoidRootPart", "UpperTorso"}, 1, function(opt)
    Config.AimPart = opt
end)
addStepper(CombatPage, "Suavidade Aimbot (1 = Instant)", Config.AimSmoothing, 0.05, 0.05, 1.0, function(v)
    Config.AimSmoothing = v
end)

addSection(CombatPage, "Bala Mágica, Hitbox & Reach")
addToggle(CombatPage, "Bala Mágica (Hitbox + Reach Alvo)", "rbxassetid://6031265976", Config.MagicBullet, function(v)
    Config.MagicBullet = v
    if not v and not Config.HitboxExpander then restoreAllHitboxes() end
end)
addToggle(CombatPage, "Hitbox Expander Geral (Todos Inimigos)", "rbxassetid://6031265976", Config.HitboxExpander, function(v)
    Config.HitboxExpander = v
    if not v and not Config.MagicBullet then restoreAllHitboxes() end
end)
addStepper(CombatPage, "Tamanho da Hitbox", Config.HitboxSize, 2, 4, 45, function(v)
    Config.HitboxSize = v
end)
addToggle(CombatPage, "Reach de Armas Contínuo (V6)", "rbxassetid://6034754445", Config.ReachEnabled, function(v)
    Config.ReachEnabled = v
end)
addStepper(CombatPage, "Raio do Reach (Studs)", Config.ReachSize, 5, 5, 45, function(v)
    Config.ReachSize = v
end)
addToggle(CombatPage, "Causar Mais Dano (Inimigo/NPC)", "rbxassetid://6034754445", Config.DamageBoost, function(v)
    Config.DamageBoost = v
end)
addStepper(CombatPage, "Multiplicador de Dano", Config.DamageMultiplier, 1, 2, 15, function(v)
    Config.DamageMultiplier = v
end)
addToggle(CombatPage, "GodMode + Anti-Touch Local", "rbxassetid://6034287525", Config.GodMode, function(v)
    Config.GodMode = v
    applyGodMode(LocalPlayer.Character)
end)

addSection(CombatPage, "Círculo de FOV")
addToggle(CombatPage, "Exibir Círculo FOV", "rbxassetid://6031075931", Config.ShowFOV, function(v)
    Config.ShowFOV = v
    FOVCircle.Visible = v
end)
addStepper(CombatPage, "Tamanho do FOV", Config.FOVSize, 15, 35, 400, function(v)
    Config.FOVSize = v
    FOVCircle.Size = UDim2.new(0, v * 2, 0, v * 2)
end)
addStepper(CombatPage, "Espessura do FOV", Config.FOVThickness, 0.5, 1, 6, function(v)
    Config.FOVThickness = v
    FOVStroke.Thickness = v
end)
addCycle(CombatPage, "Cor do FOV", {"Vermelho Bench", "Ciano Neon", "Roxo Cyber", "Verde Matrix"}, 1, function(opt)
    local map = {
        ["Vermelho Bench"] = Color3.fromRGB(255, 70, 70),
        ["Ciano Neon"]     = Color3.fromRGB(0, 255, 200),
        ["Roxo Cyber"]     = Color3.fromRGB(170, 80, 255),
        ["Verde Matrix"]   = Color3.fromRGB(50, 255, 80)
    }
    Config.FOVColor = map[opt]
    FOVStroke.Color = map[opt]
end)

-- ==========================================
-- 2. ABA VISUAIS (v8.3 + V6)
-- ==========================================
addSection(VisualPage, "Sensores ESP & Filtros")
addToggle(VisualPage, "ESP Mestre (Ativar ESP)", "rbxassetid://6031075931", Config.ESP, function(v)
    Config.ESP = v
    if not v then clearAllESP() end
end)
addToggle(VisualPage, "Box ESP 2D + Barra de HP (V6)", "rbxassetid://6031075931", Config.ESPBoxes, function(v)
    Config.ESPBoxes = v
end)
addToggle(VisualPage, "Exibir Nome do Jogador", "rbxassetid://6031075931", Config.ESPNames, function(v)
    Config.ESPNames = v
end)
addToggle(VisualPage, "Exibir Vida (HP)", "rbxassetid://6031075931", Config.ESPHealth, function(v)
    Config.ESPHealth = v
end)
addToggle(VisualPage, "Exibir Distância (m)", "rbxassetid://6031075931", Config.ESPDistance, function(v)
    Config.ESPDistance = v
end)
addToggle(VisualPage, "Chams 3D (Highlight)", "rbxassetid://6031075931", Config.ESPChams, function(v)
    Config.ESPChams = v
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

addSection(VisualPage, "Mundo & Áudio UI")
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
addStepper(VisualPage, "Intensidade Fullbright", Config.FullbrightIntensity, 0.5, 1, 10, function(v)
    Config.FullbrightIntensity = v
end)
addToggle(VisualPage, "Efeitos Sonoros da UI (SFX)", "rbxassetid://6034754445", Config.UISounds, function(v)
    Config.UISounds = v
end)

-- ==========================================
-- 3. ABA MOVIMENTO (v8.3 + V6)
-- ==========================================
addSection(MovePage, "Física, Colisão & Desync")
addToggle(MovePage, "Atravessar Paredes (Noclip)", "rbxassetid://6034287525", Config.Noclip, function(v)
    Config.Noclip = v
    NoclipBadge.Visible = v
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
addToggle(MovePage, "Instant Prompts (Zera Hold + FirePrompt)", "rbxassetid://6034754445", Config.InstantPrompts, function(v)
    Config.InstantPrompts = v
end)
addToggle(MovePage, "Animation Remover (Sem Delay Facada)", "rbxassetid://6034754445", Config.AnimRemover, function(v)
    Config.AnimRemover = v
end)

addSection(MovePage, "Voo, Velocidade & Pulo")
addToggle(MovePage, "Fly Mobile/PC 3D (Analog Fix + Altura)", "rbxassetid://6034754445", Config.Fly, function(v)
    Config.Fly = v
    FlyPad.Visible = v
    if not v then Config.FlyVertical = 0 end
end)
addStepper(MovePage, "Velocidade do Fly", Config.FlySpeed, 15, 15, 250, function(v)
    Config.FlySpeed = v
end)
addToggle(MovePage, "Speed Hack (WalkSpeed)", "rbxassetid://6034754445", Config.Speed, function(v)
    Config.Speed = v
    if not v and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 16
    end
end)
addStepper(MovePage, "Valor WalkSpeed", Config.WalkSpeed, 8, 16, 220, function(v)
    Config.WalkSpeed = v
end)
addToggle(MovePage, "Pulo Infinito (Inf Jump)", "rbxassetid://6034754445", Config.InfJump, function(v)
    Config.InfJump = v
end)
addStepper(MovePage, "Multiplicador Altura InfJump", Config.InfJumpMultiplier, 0.25, 0.5, 3.5, function(v)
    Config.InfJumpMultiplier = v
end)
addToggle(MovePage, "JumpPower Customizado (V6)", "rbxassetid://6034754445", Config.JumpPowerEnabled, function(v)
    Config.JumpPowerEnabled = v
    if not v and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = 50
    end
end)
addStepper(MovePage, "Valor JumpPower", Config.JumpPower, 15, 50, 300, function(v)
    Config.JumpPower = v
end)

-- ==========================================
-- 4. ABA JOGADORES (v8.3 + V6 FLING ALL)
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
ActionCard.Size = UDim2.new(1, -6, 0, 128)
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

local FlingAllBtn = Instance.new("TextButton")
FlingAllBtn.Size = UDim2.new(1, -16, 0, 28)
FlingAllBtn.Position = UDim2.new(0, 8, 0, 94)
FlingAllBtn.BackgroundColor3 = Color3.fromRGB(145, 40, 190)
FlingAllBtn.Text = "FLING ALL (EXPULSAR TODOS DA SALA)"
FlingAllBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FlingAllBtn.Font = Enum.Font.GothamBold
FlingAllBtn.TextSize = 11
FlingAllBtn.Parent = ActionCard
Instance.new("UICorner", FlingAllBtn).CornerRadius = UDim.new(0, 6)

addStepper(PlayerPage, "Distância Grudar Costas", Config.AttachDistance, 0.5, 1, 12, function(v)
    Config.AttachDistance = v
end)

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
table.insert(Config.Connections, Players.PlayerAdded:Connect(refreshPlayerList))
table.insert(Config.Connections, Players.PlayerRemoving:Connect(function(plr)
    if Config.SelectedPlayer == plr then
        Config.SelectedPlayer = nil
        Config.AttachBack = false
        AttachBackBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 58)
        AttachBackBtn.Text = "GRUDAR COSTAS: OFF"
        SelectedLabel.Text = "Alvo Selecionado: Nenhum"
        disableNoclipAndRestore()
    end
    if Config.ESPObjects2D[plr] then
        pcall(function() Config.ESPObjects2D[plr].Gui:Destroy() end)
        Config.ESPObjects2D[plr] = nil
    end
    task.defer(refreshPlayerList)
end))

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

local function flingSingleTarget(targetPlr, duration)
    if not targetPlr or not targetPlr.Character then return end
    local targetRoot = targetPlr.Character:FindFirstChild("HumanoidRootPart")
    local myChar = LocalPlayer.Character
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not targetRoot or not myRoot then return end

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
    while os.clock() - startTime < (duration or 1.6) and targetPlr and targetPlr.Character and targetRoot.Parent do
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
end

FlingBtn.MouseButton1Click:Connect(function()
    if Config.Flinging then return end
    local targetPlr = Config.SelectedPlayer
    if not targetPlr or not targetPlr.Character then playSFX("Error") return end
    local myChar = LocalPlayer.Character
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not myRoot then playSFX("Error") return end

    playSFX("Action")
    Config.Flinging = true
    FlingBtn.Text = "ARREMESSANDO ALVO..."
    FlingBtn.BackgroundColor3 = Color3.fromRGB(230, 120, 40)

    local savedCFrame = myRoot.CFrame
    local wasAttach = Config.AttachBack
    Config.AttachBack = false

    task.spawn(function()
        flingSingleTarget(targetPlr, 1.8)
        myRoot.CFrame = savedCFrame
        Config.AttachBack = wasAttach
        Config.Flinging = false
        if not Config.Noclip and not Config.AttachBack then disableNoclipAndRestore() end
        FlingBtn.Text = "JOGAR ALVO PARA FORA DO MAPA (FLING)"
        FlingBtn.BackgroundColor3 = Color3.fromRGB(185, 55, 140)
    end)
end)

FlingAllBtn.MouseButton1Click:Connect(function()
    if Config.Flinging then return end
    local myChar = LocalPlayer.Character
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not myRoot then playSFX("Error") return end

    playSFX("Action")
    Config.Flinging = true
    FlingAllBtn.Text = "ARREMESSANDO TODOS..."
    FlingAllBtn.BackgroundColor3 = Color3.fromRGB(230, 120, 40)

    local savedCFrame = myRoot.CFrame
    local wasAttach = Config.AttachBack
    Config.AttachBack = false

    task.spawn(function()
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                flingSingleTarget(plr, 1.25)
                task.wait(0.08)
            end
        end
        myRoot.CFrame = savedCFrame
        Config.AttachBack = wasAttach
        Config.Flinging = false
        if not Config.Noclip and not Config.AttachBack then disableNoclipAndRestore() end
        FlingAllBtn.Text = "FLING ALL (EXPULSAR TODOS DA SALA)"
        FlingAllBtn.BackgroundColor3 = Color3.fromRGB(145, 40, 190)
    end)
end)

refreshPlayerList()

-- ==========================================
-- 5. ABA COORDS (v8.3)
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
-- 6. ABA EXTRAS V6 (OS 10 SISTEMAS DO OVERRIDE V6)
-- ==========================================
addSection(ExtrasPage, "Câmera, Teleporte & Anti-AFK")
addToggle(ExtrasPage, "ThirdPerson (Zoom Infinito Câmera)", "rbxassetid://6031075931", Config.ThirdPersonInfinite, function(v)
    Config.ThirdPersonInfinite = v
    LocalPlayer.CameraMaxZoomDistance = v and 99999 or 128
    LocalPlayer.CameraMode = Enum.CameraMode.Classic
end)
addToggle(ExtrasPage, "Anti-AFK Nativo (Impedir Kick Idle)", "rbxassetid://6034287525", Config.AntiAFK, function(v)
    Config.AntiAFK = v
end)
addToggle(ExtrasPage, "Click TP (Segure Ctrl + Clique no Mapa)", "rbxassetid://6034509993", Config.ClickTP, function(v)
    Config.ClickTP = v
end)
addToggle(ExtrasPage, "Freecam (Câmera Livre Exploradora)", "rbxassetid://6031075931", Config.Freecam, function(v)
    Config.Freecam = v
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.Anchored = v
    end
end)
addStepper(ExtrasPage, "Velocidade da Freecam", Config.FreecamSpeed, 10, 10, 200, function(v)
    Config.FreecamSpeed = v
end)

addSection(ExtrasPage, "Áudio Combate, HUD & Performance")
addToggle(ExtrasPage, "Hit Sound / Kill Sound (Rust Headshot)", "rbxassetid://6034754445", Config.HitSoundEnabled, function(v)
    Config.HitSoundEnabled = v
end)
addToggle(ExtrasPage, "Lista de Espectadores (Quem Olha p/ Você)", "rbxassetid://6034287594", Config.SpectatorList, function(v)
    Config.SpectatorList = v
    SpecFrame.Visible = v
end)
addToggle(ExtrasPage, "Crosshair Customizada na Tela", "rbxassetid://6031265976", Config.Crosshair, function(v)
    Config.Crosshair = v
    CrosshairFrame.Visible = v
end)
addStepper(ExtrasPage, "Tamanho da Crosshair", Config.CrosshairSize, 2, 6, 36, function(v)
    Config.CrosshairSize = v
    CrossH.Size = UDim2.new(0, v, 0, 2)
    CrossV.Size = UDim2.new(0, 2, 0, v)
end)
addButton(ExtrasPage, "ATIVAR FPS BOOSTER / LOW GRAPHICS", function()
    Config.FPSBooster = true
    pcall(function()
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 9e9
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("BasePart") then
                obj.Material = Enum.Material.SmoothPlastic
                obj.Reflectance = 0
                obj.CastShadow = false
            elseif obj:IsA("Decal") or obj:IsA("Texture") then
                obj.Transparency = 1
            elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
                obj.Enabled = false
            end
        end
    end)
end)

-- ==========================================
-- 7. ABA INFO / OFFSETS (393 OFFSETS INTEGRADOS)
-- ==========================================
local DumpHeaderCard = Instance.new("Frame")
DumpHeaderCard.Size = UDim2.new(1, -6, 0, 92)
DumpHeaderCard.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
DumpHeaderCard.Parent = OffsetsPage
Instance.new("UICorner", DumpHeaderCard).CornerRadius = UDim.new(0, 7)

local DumpMetaText = Instance.new("TextLabel")
DumpMetaText.Size = UDim2.new(1, -16, 0, 44)
DumpMetaText.Position = UDim2.new(0, 8, 0, 4)
DumpMetaText.BackgroundTransparency = 1
DumpMetaText.Text = string.format(
    "Roblox Dump: %s\nAtualizado: %s | Total: %d offsets",
    RobloxDumpInfo.Version, RobloxDumpInfo.UpdatedAt, RobloxDumpInfo.Total
)
DumpMetaText.TextColor3 = Color3.fromRGB(120, 230, 160)
DumpMetaText.Font = Enum.Font.GothamBold
DumpMetaText.TextSize = 11
DumpMetaText.TextXAlignment = Enum.TextXAlignment.Left
DumpMetaText.Parent = DumpHeaderCard

local CopyAllOffsetsBtn = Instance.new("TextButton")
CopyAllOffsetsBtn.Size = UDim2.new(1, -16, 0, 32)
CopyAllOffsetsBtn.Position = UDim2.new(0, 8, 0, 52)
CopyAllOffsetsBtn.BackgroundColor3 = Color3.fromRGB(50, 105, 165)
CopyAllOffsetsBtn.Text = "COPIAR TODOS OS 393 OFFSETS"
CopyAllOffsetsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyAllOffsetsBtn.Font = Enum.Font.GothamBold
CopyAllOffsetsBtn.TextSize = 11
CopyAllOffsetsBtn.Parent = DumpHeaderCard
Instance.new("UICorner", CopyAllOffsetsBtn).CornerRadius = UDim.new(0, 6)

local OffsetSearchBox = Instance.new("TextBox")
OffsetSearchBox.Size = UDim2.new(1, -6, 0, 34)
OffsetSearchBox.BackgroundColor3 = Color3.fromRGB(32, 32, 42)
OffsetSearchBox.PlaceholderText = "Pesquisar Offset (ex: Humanoid, Camera, ViewMatrix)..."
OffsetSearchBox.PlaceholderColor3 = Color3.fromRGB(130, 130, 145)
OffsetSearchBox.Text = ""
OffsetSearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
OffsetSearchBox.Font = Enum.Font.GothamSemibold
OffsetSearchBox.TextSize = 11
OffsetSearchBox.ClearTextOnFocus = false
OffsetSearchBox.Parent = OffsetsPage
Instance.new("UICorner", OffsetSearchBox).CornerRadius = UDim.new(0, 7)

local OffsetListContainer = Instance.new("Frame")
OffsetListContainer.Size = UDim2.new(1, -6, 0, 10)
OffsetListContainer.AutomaticSize = Enum.AutomaticSize.Y
OffsetListContainer.BackgroundTransparency = 1
OffsetListContainer.Parent = OffsetsPage

local OffsetListLayout = Instance.new("UIListLayout", OffsetListContainer)
OffsetListLayout.Padding = UDim.new(0, 4)
OffsetListLayout.SortOrder = Enum.SortOrder.LayoutOrder

local SortedOffsetKeys = {}
for k, _ in pairs(RobloxDumpInfo.Offsets) do
    table.insert(SortedOffsetKeys, k)
end
table.sort(SortedOffsetKeys)

CopyAllOffsetsBtn.MouseButton1Click:Connect(function()
    local lines = {
        "# Roblox Offsets - " .. RobloxDumpInfo.Version,
        "# Atualizado: " .. RobloxDumpInfo.UpdatedAt .. " | Total: " .. tostring(RobloxDumpInfo.Total)
    }
    for _, k in ipairs(SortedOffsetKeys) do
        table.insert(lines, string.format("%s = %s", k, RobloxDumpInfo.Offsets[k]))
    end
    local fullText = table.concat(lines, "\n")
    pcall(function()
        if setclipboard then setclipboard(fullText)
        elseif toclipboard then toclipboard(fullText) end
    end)
    playSFX("Action")
    CopyAllOffsetsBtn.Text = "393 OFFSETS COPIADOS!"
    CopyAllOffsetsBtn.BackgroundColor3 = Color3.fromRGB(45, 140, 85)
    task.delay(1.5, function()
        CopyAllOffsetsBtn.Text = "COPIAR TODOS OS 393 OFFSETS"
        CopyAllOffsetsBtn.BackgroundColor3 = Color3.fromRGB(50, 105, 165)
    end)
end)

local function refreshOffsetsView()
    for _, child in ipairs(OffsetListContainer:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    local q = string.lower(OffsetSearchBox.Text or "")
    local shown = 0
    for _, key in ipairs(SortedOffsetKeys) do
        local val = RobloxDumpInfo.Offsets[key]
        if q == "" or string.find(string.lower(key), q, 1, true) or string.find(val, q, 1, true) then
            shown = shown + 1
            if shown > 80 and q == "" then break end -- Otimização visual ao abrir sem filtro
            local ItemBtn = Instance.new("TextButton")
            ItemBtn.Size = UDim2.new(1, 0, 0, 28)
            ItemBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
            ItemBtn.Text = string.format("  %s = %s ( Toque p/ Copiar )", key, val)
            ItemBtn.TextColor3 = Color3.fromRGB(230, 230, 240)
            ItemBtn.Font = Enum.Font.Code
            ItemBtn.TextSize = 11
            ItemBtn.TextXAlignment = Enum.TextXAlignment.Left
            ItemBtn.Parent = OffsetListContainer
            Instance.new("UICorner", ItemBtn).CornerRadius = UDim.new(0, 5)

            ItemBtn.MouseButton1Click:Connect(function()
                local entry = string.format("%s = %s", key, val)
                pcall(function()
                    if setclipboard then setclipboard(entry)
                    elseif toclipboard then toclipboard(entry) end
                end)
                playSFX("Step")
                ItemBtn.Text = "  [COPIADO!] " .. entry
                ItemBtn.BackgroundColor3 = Color3.fromRGB(45, 115, 75)
                task.delay(1.0, function()
                    if ItemBtn and ItemBtn.Parent then
                        ItemBtn.Text = string.format("  %s = %s ( Toque p/ Copiar )", key, val)
                        ItemBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
                    end
                end)
            end)
        end
    end
end

OffsetSearchBox:GetPropertyChangedSignal("Text"):Connect(refreshOffsetsView)
refreshOffsetsView()

-- ==========================================
-- 8. ABA AJUSTES (ATALHO PC & DESTRUIR HUB)
-- ==========================================
addSection(ConfigPage, "Preferências do Hub")
addCycle(ConfigPage, "Tecla de Atalho no PC", {"RightShift", "Insert", "RightControl", "Home"}, 1, function(opt)
    Config.ToggleKey = Enum.KeyCode[opt]
end)

addButton(ConfigPage, "DESTRUIR HUB & LIMPAR CONEXÕES", function()
    restoreAllHitboxes()
    disableNoclipAndRestore()
    clearAllESP()
    for _, conn in ipairs(Config.Connections) do
        pcall(function() conn:Disconnect() end)
    end
    for _, esp2d in pairs(Config.ESPObjects2D) do
        pcall(function() esp2d.Gui:Destroy() end)
    end
    ScreenGui:Destroy()
end)

-- ==========================================
-- EVENTOS DE INPUT, PULO INFINITO & PROMPTS
-- ==========================================
table.insert(Config.Connections, UserInputService.JumpRequest:Connect(function()
    if Config.InfJump and LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hum then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
            if hrp and Config.InfJumpMultiplier ~= 1.0 then
                hrp.AssemblyLinearVelocity = Vector3.new(
                    hrp.AssemblyLinearVelocity.X,
                    50 * Config.InfJumpMultiplier,
                    hrp.AssemblyLinearVelocity.Z
                )
            end
        end
    end
end))

table.insert(Config.Connections, ProximityPromptService.PromptButtonHoldBegan:Connect(function(prompt)
    if Config.InstantPrompts then
        pcall(function()
            if typeof(fireproximityprompt) == "function" then
                fireproximityprompt(prompt)
            else
                prompt.HoldDuration = 0
            end
        end)
    end
end))

table.insert(Config.Connections, Workspace.DescendantAdded:Connect(function(descendant)
    if descendant:IsA("ProximityPrompt") and Config.InstantPrompts then
        descendant.HoldDuration = 0
    end
end))

table.insert(Config.Connections, UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Config.ToggleKey then
        toggleMainMenu()
    end

    if Config.ClickTP and input.UserInputType == Enum.UserInputType.MouseButton1 then
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or UserInputService:IsKeyDown(Enum.KeyCode.RightControl) then
            local hitPos = Mouse.Hit.Position
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(hitPos + Vector3.new(0, 3.5, 0))
                playSFX("Action")
            end
        end
    end
end))

table.insert(Config.Connections, LocalPlayer.Idled:Connect(function()
    if Config.AntiAFK then
        pcall(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.zero)
        end)
    end
end))

-- ==========================================
-- CACHE DE NPCS & RAYCAST WALLCHECK
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
table.insert(Config.Connections, Workspace.DescendantAdded:Connect(tryRegisterNPC))
table.insert(Config.Connections, Workspace.DescendantRemoving:Connect(function(obj)
    if obj:IsA("Model") and CachedNPCs[obj] then CachedNPCs[obj] = nil
    elseif obj:IsA("Humanoid") and obj.Parent and CachedNPCs[obj.Parent] then CachedNPCs[obj.Parent] = nil end
end))

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
-- BALA MÁGICA + REACH + DANO + ANIM REMOVER
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
    while ScreenGui and ScreenGui.Parent do
        task.wait(0.08)
        for part, _ in pairs(ModifiedHitboxes) do
            local model = part and part.Parent
            local hum = model and model:FindFirstChildOfClass("Humanoid")
            if not model or not hum or hum.Health <= 0 or (not Config.MagicBullet and not Config.HitboxExpander) then
                restoreSingleHitbox(part)
            end
        end

        if Config.InstantPrompts then
            for _, prompt in ipairs(Workspace:GetDescendants()) do
                if prompt:IsA("ProximityPrompt") and prompt.HoldDuration > 0 then
                    prompt.HoldDuration = 0
                end
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
                        local tName = string.lower(track.Name)
                        if string.find(tName, "tool") or string.find(tName, "slash") or string.find(tName, "stab") or string.find(tName, "attack") then
                            track:AdjustSpeed(5.0)
                        end
                    end
                end
            end)
        end

        if not myChar or not myRoot then continue end

        local equippedTool = myChar:FindFirstChildOfClass("Tool")
        local handle = equippedTool and (equippedTool:FindFirstChild("Handle") or equippedTool:FindFirstChildWhichIsA("BasePart"))

        if Config.HitboxExpander then
            for _, model in ipairs(getAllValidTargetModels()) do
                local hrp = model:FindFirstChild("HumanoidRootPart")
                if hrp then expandTargetHitbox(hrp, Config.HitboxSize) end
            end
        end

        if Config.MagicBullet or Config.DamageBoost or Config.ReachEnabled then
            local targetPart = getClosestTargetToCenter()
            if not targetPart and (Config.MagicBullet or Config.ReachEnabled) then
                local minDist = Config.MagicBullet and Config.MagicRange or Config.ReachSize
                for _, model in ipairs(getAllValidTargetModels()) do
                    local p = model:FindFirstChild(Config.AimPart) or model:FindFirstChild("HumanoidRootPart")
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
                    if not Config.HitboxExpander then
                        for modPart, _ in pairs(ModifiedHitboxes) do
                            if modPart ~= enemyRoot then restoreSingleHitbox(modPart) end
                        end
                    end
                    expandTargetHitbox(enemyRoot, Config.HitboxSize)
                    if handle and dist <= 45 then
                        triggerDamageOnPart(handle, targetPart, pulses)
                        triggerDamageOnPart(handle, enemyRoot, pulses)
                    end
                end

                if Config.ReachEnabled and handle and dist <= Config.ReachSize then
                    triggerDamageOnPart(handle, targetPart, pulses)
                    triggerDamageOnPart(handle, enemyRoot, pulses)
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
-- ESP COMPLETO (2D BOX + BARRA HP + TAG + CHAMS + SKELETON)
-- ==========================================
local function ensure2DESP(plr)
    if Config.ESPObjects2D[plr] then return Config.ESPObjects2D[plr] end

    local container = Instance.new("Frame")
    container.Name = "Box2D_" .. plr.Name
    container.BackgroundTransparency = 1
    container.Visible = false
    container.Parent = ScreenGui

    local boxStroke = Instance.new("UIStroke", container)
    boxStroke.Color = Color3.fromRGB(255, 65, 65)
    boxStroke.Thickness = 1.4

    local hpBack = Instance.new("Frame")
    hpBack.Position = UDim2.new(0, -6, 0, 0)
    hpBack.Size = UDim2.new(0, 3, 1, 0)
    hpBack.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    hpBack.BorderSizePixel = 0
    hpBack.Parent = container

    local hpFill = Instance.new("Frame")
    hpFill.AnchorPoint = Vector2.new(0, 1)
    hpFill.Position = UDim2.new(0, 0, 1, 0)
    hpFill.Size = UDim2.new(1, 0, 1, 0)
    hpFill.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
    hpFill.BorderSizePixel = 0
    hpFill.Parent = hpBack

    Config.ESPObjects2D[plr] = {
        Gui = container,
        Stroke = boxStroke,
        HPBack = hpBack,
        HPFill = hpFill,
        LastHealth = nil
    }
    return Config.ESPObjects2D[plr]
end

local lastESPUpdate = 0

local function updateESP()
    local myChar = LocalPlayer.Character
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
    local myPos = myRoot and myRoot.Position or Camera.CFrame.Position

    -- Atualização contínua da Box 2D & Hit Sound
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            local esp2d = ensure2DESP(plr)
            local char = plr.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            local isAlly = (Config.TeamCheck and plr.Team == LocalPlayer.Team and plr.Team ~= nil)

            if char and root and hum and hum.Health > 0 then
                if Config.HitSoundEnabled and esp2d.LastHealth and hum.Health < esp2d.LastHealth then
                    if myRoot and (root.Position - myRoot.Position).Magnitude < 250 then
                        playCustomSound(Config.HitSoundId, 0.85, hum.Health <= 0 and 0.8 or 1.05)
                    end
                end
                esp2d.LastHealth = hum.Health

                if Config.ESP and Config.ESPBoxes and not isAlly then
                    local pos, onScreen = Camera:WorldToViewportPoint(root.Position)
                    if onScreen then
                        local scale = 1 / (pos.Z * math.tan(math.rad(Camera.FieldOfView * 0.5)) * 2) * 1000
                        local boxH = math.clamp(scale * 4.5, 24, 300)
                        local boxW = math.clamp(scale * 2.8, 16, 200)
                        esp2d.Gui.Position = UDim2.new(0, pos.X - boxW * 0.5, 0, pos.Y - boxH * 0.5)
                        esp2d.Gui.Size = UDim2.new(0, boxW, 0, boxH)
                        esp2d.Gui.Visible = true

                        if Config.ESPHealth then
                            local ratio = math.clamp(hum.Health / math.max(hum.MaxHealth, 1), 0, 1)
                            esp2d.HPBack.Visible = true
                            esp2d.HPFill.Size = UDim2.new(1, 0, ratio, 0)
                            esp2d.HPFill.BackgroundColor3 = Color3.fromHSV(ratio * 0.33, 1, 1)
                        else
                            esp2d.HPBack.Visible = false
                        end
                    else
                        esp2d.Gui.Visible = false
                    end
                else
                    esp2d.Gui.Visible = false
                end
            else
                esp2d.Gui.Visible = false
            end
        end
    end

    if not Config.ESP and not Config.SkeletonESP then return end
    if os.clock() - lastESPUpdate < 0.06 then return end
    lastESPUpdate = os.clock()

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
                        tag.Size = UDim2.new(0, 170, 0, 32)
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
                        local parts = {}
                        if Config.ESPNames then table.insert(parts, plr.DisplayName) end
                        if Config.ESPHealth then table.insert(parts, string.format("[%d HP]", math.floor(hum.Health))) end
                        if Config.ESPDistance then table.insert(parts, string.format("(%dm)", math.floor(dist))) end
                        infoLabel.Text = table.concat(parts, " ")
                    end
                end

                if Config.SkeletonESP and Drawing then
                    if not SkeletonDrawings[plr] then
                        SkeletonDrawings[plr] = {
                            Head_Neck = Drawing.new("Line"),
                            Neck_Chest = Drawing.new("Line"),
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

                        if onHead and onUpper then
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
                            if onH and onUpper then
                                sLines.LeftArm.From = Vector2.new(upperPos.X, upperPos.Y)
                                sLines.LeftArm.To = Vector2.new(handPos.X, handPos.Y)
                                sLines.LeftArm.Visible = true
                            else sLines.LeftArm.Visible = false end
                        else sLines.LeftArm.Visible = false end

                        if pRHand then
                            local handPos, onH = Camera:WorldToViewportPoint(pRHand.Position)
                            if onH and onUpper then
                                sLines.RightArm.From = Vector2.new(upperPos.X, upperPos.Y)
                                sLines.RightArm.To = Vector2.new(handPos.X, handPos.Y)
                                sLines.RightArm.Visible = true
                            else sLines.RightArm.Visible = false end
                        else sLines.RightArm.Visible = false end

                        if pLFoot then
                            local footPos, onF = Camera:WorldToViewportPoint(pLFoot.Position)
                            if onF and onLower then
                                sLines.LeftLeg.From = Vector2.new(lowerPos.X, lowerPos.Y)
                                sLines.LeftLeg.To = Vector2.new(footPos.X, footPos.Y)
                                sLines.LeftLeg.Visible = true
                            else sLines.LeftLeg.Visible = false end
                        else sLines.LeftLeg.Visible = false end

                        if pRFoot then
                            local footPos, onF = Camera:WorldToViewportPoint(pRFoot.Position)
                            if onF and onLower then
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
            if Config.ESPChams and idx <= 28 then
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
-- LOOPS STEPPED & RENDERSTEPPED
-- ==========================================
table.insert(Config.Connections, RunService.Stepped:Connect(function()
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

    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then
        if Config.GodMode then
            hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
            if hum.Health < hum.MaxHealth and hum.Health > 0 then hum.Health = hum.MaxHealth end
        end
        if Config.JumpPowerEnabled then
            hum.UseJumpPower = true
            hum.JumpPower = Config.JumpPower
        end
    end

    if Config.SpectatorList and char:FindFirstChild("HumanoidRootPart") then
        local myPos = char.HumanoidRootPart.Position
        local specs = {}
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("Head") then
                local head = plr.Character.Head
                local dirToMe = (myPos - head.Position).Unit
                if head.CFrame.LookVector:Dot(dirToMe) > 0.85 then
                    table.insert(specs, "• " .. plr.DisplayName)
                end
            end
        end
        SpecTitle.Text = string.format("ESPECTADORES (%d)", #specs)
        SpecListLabel.Text = (#specs > 0) and table.concat(specs, "\n") or "Nenhum olhando"
    end
end))

local flyActivePrev = false
local lockedY = nil
local desyncGroundPos = nil
local FreecamAngles = Vector2.zero

table.insert(Config.Connections, RunService.RenderStepped:Connect(function(dt)
    Camera = Workspace.CurrentCamera

    if Config.Aimbot then
        local target = getClosestTargetToCenter()
        if target then
            local targetCF = CFrame.new(Camera.CFrame.Position, target.Position)
            if Config.AimSmoothing >= 0.98 then
                Camera.CFrame = targetCF
            else
                Camera.CFrame = Camera.CFrame:Lerp(targetCF, math.clamp(Config.AimSmoothing, 0.05, 1))
            end
        end
    end

    updateESP()

    if Config.Fullbright then
        Lighting.Brightness = Config.FullbrightIntensity
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = false
        Lighting.OutdoorAmbient = Color3.fromRGB(180, 180, 180)
        Lighting.Ambient = Color3.fromRGB(180, 180, 180)
    end

    if Config.Freecam then
        local move = Vector3.zero
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum and hum.MoveDirection.Magnitude > 0 then
            move = move + (Camera.CFrame.LookVector * hum.MoveDirection.Magnitude)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then move = move + Camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then move = move - Camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then move = move + Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then move = move - Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.E) then move = move + Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.Q) then move = move - Vector3.new(0, 1, 0) end

        local delta = UserInputService:GetMouseDelta()
        FreecamAngles = FreecamAngles + Vector2.new(-delta.Y * 0.004, -delta.X * 0.004)
        local rot = CFrame.Angles(0, FreecamAngles.Y, 0) * CFrame.Angles(FreecamAngles.X, 0, 0)
        Camera.CFrame = CFrame.new(Camera.CFrame.Position + (move * Config.FreecamSpeed * dt)) * rot
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
                root.CFrame = targetRoot.CFrame * CFrame.new(0, 0, Config.AttachDistance)
            end
        end

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

                local vInput = Config.FlyVertical
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then vInput = 1 end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then vInput = -1 end

                if vInput ~= 0 then
                    lockedY = lockedY + (vInput * Config.FlySpeed * dt)
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
end))
