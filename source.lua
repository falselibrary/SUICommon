local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local SoundService = game:GetService("SoundService")
local Stats = game:GetService("Stats")

local LocalPlayer = Players.LocalPlayer
local UserId = LocalPlayer.UserId
local AvatarContent, IsAvatarReady = Players:GetUserThumbnailAsync(UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)

local FONT_PRIMARY = Enum.Font.Ubuntu
local FONT_BOLD = Enum.Font.Ubuntu
local FONT_MONO = Enum.Font.Ubuntu

local Themes = {
    Dark = {
        Main = Color3.fromRGB(22, 22, 28),
        Sidebar = Color3.fromRGB(16, 16, 20),
        TopBar = Color3.fromRGB(19, 19, 24),
        Stroke = Color3.fromRGB(40, 40, 50),
        Accent = Color3.fromRGB(110, 130, 255),
        Text = Color3.fromRGB(240, 240, 245),
        DimText = Color3.fromRGB(150, 150, 165),
        Card = Color3.fromRGB(28, 28, 34),
        ElementBg = Color3.fromRGB(32, 32, 40),
        SliderFill = Color3.fromRGB(110, 130, 255),
        ToggleOn = Color3.fromRGB(110, 130, 255),
        ToggleOff = Color3.fromRGB(55, 55, 65),
        Hover = Color3.fromRGB(38, 38, 48),
        Glow = Color3.fromRGB(0, 0, 0),
        TabActive = Color3.fromRGB(35, 35, 45),
    },
    Cyber = {
        Main = Color3.fromRGB(8, 8, 8),
        Sidebar = Color3.fromRGB(3, 3, 3),
        TopBar = Color3.fromRGB(10, 10, 5),
        Stroke = Color3.fromRGB(255, 255, 0),
        Accent = Color3.fromRGB(255, 255, 0),
        Text = Color3.fromRGB(255, 255, 0),
        DimText = Color3.fromRGB(180, 180, 0),
        Card = Color3.fromRGB(18, 18, 0),
        ElementBg = Color3.fromRGB(22, 22, 8),
        SliderFill = Color3.fromRGB(255, 255, 0),
        ToggleOn = Color3.fromRGB(255, 255, 0),
        ToggleOff = Color3.fromRGB(45, 45, 0),
        Hover = Color3.fromRGB(28, 28, 8),
        Glow = Color3.fromRGB(0, 0, 0),
        TabActive = Color3.fromRGB(35, 35, 0),
    },
    Sakura = {
        Main = Color3.fromRGB(255, 240, 245),
        Sidebar = Color3.fromRGB(255, 225, 235),
        TopBar = Color3.fromRGB(255, 230, 240),
        Stroke = Color3.fromRGB(255, 180, 200),
        Accent = Color3.fromRGB(255, 100, 150),
        Text = Color3.fromRGB(100, 50, 70),
        DimText = Color3.fromRGB(160, 100, 120),
        Card = Color3.fromRGB(255, 255, 255),
        ElementBg = Color3.fromRGB(255, 245, 248),
        SliderFill = Color3.fromRGB(255, 100, 150),
        ToggleOn = Color3.fromRGB(255, 100, 150),
        ToggleOff = Color3.fromRGB(230, 210, 215),
        Hover = Color3.fromRGB(255, 230, 238),
        Glow = Color3.fromRGB(255, 200, 220),
        TabActive = Color3.fromRGB(255, 220, 230),
    },
    Ocean = {
        Main = Color3.fromRGB(12, 22, 32),
        Sidebar = Color3.fromRGB(8, 18, 28),
        TopBar = Color3.fromRGB(10, 20, 30),
        Stroke = Color3.fromRGB(35, 65, 95),
        Accent = Color3.fromRGB(0, 180, 255),
        Text = Color3.fromRGB(200, 240, 255),
        DimText = Color3.fromRGB(120, 170, 200),
        Card = Color3.fromRGB(22, 37, 52),
        ElementBg = Color3.fromRGB(18, 32, 47),
        SliderFill = Color3.fromRGB(0, 180, 255),
        ToggleOn = Color3.fromRGB(0, 180, 255),
        ToggleOff = Color3.fromRGB(32, 52, 67),
        Hover = Color3.fromRGB(22, 42, 57),
        Glow = Color3.fromRGB(0, 10, 20),
        TabActive = Color3.fromRGB(18, 38, 58),
    },
    Forest = {
        Main = Color3.fromRGB(18, 28, 18),
        Sidebar = Color3.fromRGB(12, 22, 12),
        TopBar = Color3.fromRGB(14, 24, 14),
        Stroke = Color3.fromRGB(45, 65, 45),
        Accent = Color3.fromRGB(100, 255, 100),
        Text = Color3.fromRGB(220, 255, 220),
        DimText = Color3.fromRGB(140, 180, 140),
        Card = Color3.fromRGB(28, 38, 28),
        ElementBg = Color3.fromRGB(22, 34, 22),
        SliderFill = Color3.fromRGB(100, 255, 100),
        ToggleOn = Color3.fromRGB(100, 255, 100),
        ToggleOff = Color3.fromRGB(38, 52, 38),
        Hover = Color3.fromRGB(30, 44, 30),
        Glow = Color3.fromRGB(5, 10, 5),
        TabActive = Color3.fromRGB(25, 38, 25),
    },
    Gold = {
        Main = Color3.fromRGB(22, 22, 22),
        Sidebar = Color3.fromRGB(17, 17, 17),
        TopBar = Color3.fromRGB(20, 19, 14),
        Stroke = Color3.fromRGB(255, 180, 0),
        Accent = Color3.fromRGB(255, 180, 0),
        Text = Color3.fromRGB(255, 220, 150),
        DimText = Color3.fromRGB(180, 150, 100),
        Card = Color3.fromRGB(32, 32, 32),
        ElementBg = Color3.fromRGB(30, 27, 22),
        SliderFill = Color3.fromRGB(255, 180, 0),
        ToggleOn = Color3.fromRGB(255, 180, 0),
        ToggleOff = Color3.fromRGB(52, 47, 32),
        Hover = Color3.fromRGB(40, 37, 27),
        Glow = Color3.fromRGB(0, 0, 0),
        TabActive = Color3.fromRGB(37, 32, 22),
    },
    Light = {
        Main = Color3.fromRGB(248, 248, 252),
        Sidebar = Color3.fromRGB(238, 238, 242),
        TopBar = Color3.fromRGB(242, 242, 247),
        Stroke = Color3.fromRGB(215, 215, 225),
        Accent = Color3.fromRGB(80, 100, 255),
        Text = Color3.fromRGB(30, 30, 40),
        DimText = Color3.fromRGB(100, 100, 120),
        Card = Color3.fromRGB(255, 255, 255),
        ElementBg = Color3.fromRGB(244, 244, 249),
        SliderFill = Color3.fromRGB(80, 100, 255),
        ToggleOn = Color3.fromRGB(80, 100, 255),
        ToggleOff = Color3.fromRGB(205, 205, 215),
        Hover = Color3.fromRGB(238, 238, 245),
        Glow = Color3.fromRGB(200, 200, 210),
        TabActive = Color3.fromRGB(228, 228, 238),
    }
}

local AngryPhrases = {
    "HEY! STOP POKING ME!", "QUIT IT!!", "I SAID STOP!", "DO THAT AGAIN, I DARE YOU",
    "IM GETTING ANGRY >:(", "SERIOUSLY?!", "THATS IT IM LEAVING", "STOP TOUCHING MY FACE",
    "YOU THINK THIS IS FUNNY?", "ONE MORE TIME AND IM DONE", "AAAARGH!!", "WHY DO YOU KEEP CLICKING ME",
    "GO AWAY!!", "IM NOT A BUTTON", "PLEASE... JUST STOP", "OK FINE WHATEVER",
    "YOU HAVE NO LIFE DO YOU", "*INTERNAL SCREAMING*", "THATS THE LAST STRAW", "IM TELLING MOM",
}

local SFXEnabled = true
local SFXIds = {
    Click = "rbxassetid://6895079853",
    Toggle = "rbxassetid://6895079853",
    Slider = "rbxassetid://6895079853",
    TabSwitch = "rbxassetid://6895079853",
    Notify = "rbxassetid://6895079853",
    Error = "rbxassetid://6895079853",
    Success = "rbxassetid://6895079853",
}

local function PlaySound(soundType, volume)
    if not SFXEnabled then return end
    pcall(function()
        local sound = Instance.new("Sound")
        sound.SoundId = SFXIds[soundType] or SFXIds.Click
        sound.Volume = volume or 0.3
        sound.PlaybackSpeed = soundType == "Error" and 0.8 or (soundType == "Success" and 1.2 or 1)
        sound.Parent = SoundService
        sound:Play()
        game:GetService("Debris"):AddItem(sound, 2)
    end)
end

local function Tween(obj, props, duration)
    if type(duration) ~= "number" then duration = 0.3 end
    return TweenService:Create(obj, TweenInfo.new(duration, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), props)
end

local function PlayTween(obj, props, duration)
    if type(duration) ~= "number" then duration = 0.3 end
    Tween(obj, props, duration):Play()
end

local function CreateCorner(parent, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius or 10)
    c.Parent = parent
    return c
end

local function CreateStroke(parent, color, thickness)
    local s = Instance.new("UIStroke")
    s.Color = color or Color3.fromRGB(45, 45, 55)
    s.Thickness = thickness or 1
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    s.Parent = parent
    return s
end

local function CreatePadding(parent, top, bottom, left, right)
    local p = Instance.new("UIPadding")
    p.PaddingTop = UDim.new(0, top or 0)
    p.PaddingBottom = UDim.new(0, bottom or 0)
    p.PaddingLeft = UDim.new(0, left or 0)
    p.PaddingRight = UDim.new(0, right or 0)
    p.Parent = parent
    return p
end

local function GetTimeGreeting()
    local h = os.date("*t").hour
    if h >= 5 and h < 12 then return "GOOD MORNING"
    elseif h >= 12 and h < 18 then return "GOOD AFTERNOON"
    elseif h >= 18 and h < 22 then return "GOOD EVENING"
    else return "GOOD NIGHT" end
end

local Nebula = {}
Nebula.__index = Nebula

function Nebula:KeySystem(config)
    config = config or {}
    local title = config.Title or "NEBULA // KEY SYSTEM"
    local subtitle = config.Subtitle or "Enter your key to continue"
    local note = config.Note or "Key required to access this script"
    local keys = config.Keys or {"defaultkey"}
    local themeName = config.Theme or "Dark"
    local saveKey = config.SaveKey or false
    local fileName = config.FileName or "NebulaKey.txt"
    local getKeyURL = config.GetKeyURL or nil
    local copyKeyURL = config.CopyKeyURL or nil
    local discordLink = config.DiscordLink or nil
    local maxAttempts = config.MaxAttempts or 0
    local attemptCount = 0
    local currentTheme = Themes[themeName] or Themes.Dark

    if saveKey and isfile and isfile(fileName) then
        local savedKey = readfile(fileName)
        for _, k in pairs(keys) do
            if savedKey == k then return true end
        end
    end

    local success = false
    local completed = false
    local avatarClickCount = 0

    local KeyGui = Instance.new("ScreenGui")
    KeyGui.Name = "NebulaKeySystem_" .. math.random(100000, 999999)
    KeyGui.Parent = CoreGui
    KeyGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    KeyGui.ResetOnSpawn = false

    local Backdrop = Instance.new("Frame")
    Backdrop.Parent = KeyGui
    Backdrop.Size = UDim2.new(1, 0, 1, 0)
    Backdrop.BackgroundColor3 = Color3.new(0, 0, 0)
    Backdrop.BackgroundTransparency = 1
    Backdrop.BorderSizePixel = 0
    Backdrop.ZIndex = 1

    local GlowFrame = Instance.new("Frame")
    GlowFrame.Parent = KeyGui
    GlowFrame.BackgroundColor3 = currentTheme.Glow
    GlowFrame.BackgroundTransparency = 0.7
    GlowFrame.Size = UDim2.new(0, 420, 0, 340)
    GlowFrame.Position = UDim2.new(0.5, -210, 0.5, -170)
    GlowFrame.ZIndex = 2
    CreateCorner(GlowFrame, 14)

    local KeyFrame = Instance.new("Frame")
    KeyFrame.Parent = GlowFrame
    KeyFrame.BackgroundColor3 = currentTheme.Main
    KeyFrame.Position = UDim2.new(0, 2, 0, 2)
    KeyFrame.Size = UDim2.new(1, -4, 1, -4)
    KeyFrame.ClipsDescendants = true
    KeyFrame.ZIndex = 3
    CreateCorner(KeyFrame, 12)
    CreateStroke(KeyFrame, currentTheme.Stroke, 1)

    local TopBar = Instance.new("Frame")
    TopBar.Parent = KeyFrame
    TopBar.Size = UDim2.new(1, 0, 0, 42)
    TopBar.BackgroundColor3 = currentTheme.TopBar
    TopBar.BorderSizePixel = 0
    TopBar.ZIndex = 4
    CreateCorner(TopBar, 12)

    local TopBarFix = Instance.new("Frame")
    TopBarFix.Parent = TopBar
    TopBarFix.Size = UDim2.new(1, 0, 0, 12)
    TopBarFix.Position = UDim2.new(0, 0, 1, -12)
    TopBarFix.BackgroundColor3 = currentTheme.TopBar
    TopBarFix.BorderSizePixel = 0
    TopBarFix.ZIndex = 4

    local TopBarLine = Instance.new("Frame")
    TopBarLine.Parent = KeyFrame
    TopBarLine.Size = UDim2.new(1, 0, 0, 1)
    TopBarLine.Position = UDim2.new(0, 0, 0, 42)
    TopBarLine.BackgroundColor3 = currentTheme.Stroke
    TopBarLine.BorderSizePixel = 0
    TopBarLine.ZIndex = 4

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Parent = TopBar
    TitleLabel.Size = UDim2.new(1, -50, 1, 0)
    TitleLabel.Position = UDim2.new(0, 15, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = title
    TitleLabel.Font = FONT_BOLD
    TitleLabel.TextSize = 15
    TitleLabel.TextColor3 = currentTheme.Accent
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.ZIndex = 5

    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Parent = TopBar
    CloseBtn.Size = UDim2.new(0, 30, 0, 30)
    CloseBtn.Position = UDim2.new(1, -35, 0, 6)
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Text = "×"
    CloseBtn.Font = FONT_PRIMARY
    CloseBtn.TextSize = 22
    CloseBtn.TextColor3 = currentTheme.DimText
    CloseBtn.ZIndex = 5
    CloseBtn.MouseEnter:Connect(function() PlayTween(CloseBtn, {TextColor3 = Color3.fromRGB(255, 80, 80)}, 0.2) end)
    CloseBtn.MouseLeave:Connect(function() PlayTween(CloseBtn, {TextColor3 = currentTheme.DimText}, 0.2) end)

    local AvatarHolder = Instance.new("Frame")
    AvatarHolder.Parent = KeyFrame
    AvatarHolder.Size = UDim2.new(0, 70, 0, 70)
    AvatarHolder.Position = UDim2.new(0.5, -35, 0, 55)
    AvatarHolder.BackgroundTransparency = 1
    AvatarHolder.ZIndex = 5

    local AvatarImage = Instance.new("ImageLabel")
    AvatarImage.Parent = AvatarHolder
    AvatarImage.Size = UDim2.new(1, 0, 1, 0)
    AvatarImage.Position = UDim2.new(0, 0, 0, 0)
    AvatarImage.AnchorPoint = Vector2.new(0, 0)
    AvatarImage.BackgroundColor3 = currentTheme.Card
    AvatarImage.Image = IsAvatarReady and AvatarContent or ""
    AvatarImage.ZIndex = 6
    AvatarImage.Rotation = 0
    CreateCorner(AvatarImage, 35)
    local avatarStroke = CreateStroke(AvatarImage, currentTheme.Accent, 2)

    local AvatarBtn = Instance.new("TextButton")
    AvatarBtn.Parent = AvatarHolder
    AvatarBtn.Size = UDim2.new(1, 0, 1, 0)
    AvatarBtn.BackgroundTransparency = 1
    AvatarBtn.Text = ""
    AvatarBtn.ZIndex = 7

    local AngrySpeech = Instance.new("TextLabel")
    AngrySpeech.Parent = KeyFrame
    AngrySpeech.Size = UDim2.new(0, 250, 0, 25)
    AngrySpeech.Position = UDim2.new(0.5, -125, 0, 130)
    AngrySpeech.BackgroundTransparency = 1
    AngrySpeech.Text = ""
    AngrySpeech.Font = FONT_PRIMARY
    AngrySpeech.TextSize = 11
    AngrySpeech.TextColor3 = Color3.fromRGB(255, 80, 80)
    AngrySpeech.ZIndex = 6
    AngrySpeech.TextWrapped = true

    local MoodLabel = Instance.new("TextLabel")
    MoodLabel.Parent = KeyFrame
    MoodLabel.Size = UDim2.new(1, 0, 0, 16)
    MoodLabel.Position = UDim2.new(0, 0, 0, 133)
    MoodLabel.BackgroundTransparency = 1
    MoodLabel.Text = ""
    MoodLabel.Font = FONT_PRIMARY
    MoodLabel.TextSize = 18
    MoodLabel.TextColor3 = currentTheme.DimText
    MoodLabel.ZIndex = 6

    AvatarBtn.MouseButton1Click:Connect(function()
        avatarClickCount = avatarClickCount + 1
        PlaySound("Click", 0.2)
        if avatarClickCount <= 3 then
            TweenService:Create(AvatarHolder, TweenInfo.new(0.5, Enum.EasingStyle.Quart), {Rotation = AvatarHolder.Rotation + 360}):Play()
            MoodLabel.Text = "😊"
            AngrySpeech.Text = ""
        elseif avatarClickCount <= 6 then
            TweenService:Create(AvatarHolder, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {Rotation = AvatarHolder.Rotation + 720}):Play()
            MoodLabel.Text = "😐"
            AngrySpeech.Text = "hmm..."
            AngrySpeech.TextColor3 = currentTheme.DimText
        elseif avatarClickCount <= 10 then
            TweenService:Create(AvatarHolder, TweenInfo.new(0.15, Enum.EasingStyle.Quart), {Rotation = AvatarHolder.Rotation + 1080}):Play()
            MoodLabel.Text = "😠"
            avatarStroke.Color = Color3.fromRGB(255, 150, 50)
            AngrySpeech.Text = AngryPhrases[math.random(1, #AngryPhrases)]
            AngrySpeech.TextColor3 = Color3.fromRGB(255, 150, 50)
            PlaySound("Error", 0.3)
            local origPos = AvatarHolder.Position
            for i = 1, 3 do
                PlayTween(AvatarHolder, {Position = origPos + UDim2.new(0, (i % 2 == 0 and -5 or 5), 0, 0)}, 0.04)
                task.wait(0.04)
            end
            PlayTween(AvatarHolder, {Position = origPos}, 0.04)
        elseif avatarClickCount <= 15 then
            TweenService:Create(AvatarHolder, TweenInfo.new(0.1, Enum.EasingStyle.Quart), {Rotation = AvatarHolder.Rotation + 2160}):Play()
            MoodLabel.Text = "🤬"
            avatarStroke.Color = Color3.fromRGB(255, 0, 0)
            AngrySpeech.Text = AngryPhrases[math.random(1, #AngryPhrases)]:upper() .. "!!!"
            AngrySpeech.TextColor3 = Color3.fromRGB(255, 50, 50)
            AngrySpeech.TextSize = 12
            PlaySound("Error", 0.5)
            local origPos = AvatarHolder.Position
            for i = 1, 6 do
                PlayTween(AvatarHolder, {Position = origPos + UDim2.new(0, (i % 2 == 0 and -10 or 10), 0, (i % 2 == 0 and -3 or 3))}, 0.03)
                task.wait(0.03)
            end
            PlayTween(AvatarHolder, {Position = origPos}, 0.04)
        else
            MoodLabel.Text = "💀"
            AngrySpeech.Text = "i am dead inside now. thanks."
            AngrySpeech.TextColor3 = currentTheme.DimText
            AngrySpeech.TextSize = 11
            avatarStroke.Color = Color3.fromRGB(80, 80, 80)
            PlayTween(AvatarImage, {ImageTransparency = 0.5}, 0.3)
            TweenService:Create(AvatarHolder, TweenInfo.new(0.5), {Rotation = AvatarHolder.Rotation + 180}):Play()
            task.delay(1.5, function()
                PlayTween(AvatarImage, {ImageTransparency = 0}, 0.5)
                TweenService:Create(AvatarHolder, TweenInfo.new(0.5), {Rotation = 0}):Play()
                avatarStroke.Color = currentTheme.Accent
                MoodLabel.Text = ""
                AngrySpeech.Text = ""
                avatarClickCount = 0
            end)
        end
    end)

    local SubtitleLabel = Instance.new("TextLabel")
    SubtitleLabel.Parent = KeyFrame
    SubtitleLabel.Size = UDim2.new(1, -30, 0, 20)
    SubtitleLabel.Position = UDim2.new(0, 15, 0, 160)
    SubtitleLabel.BackgroundTransparency = 1
    SubtitleLabel.Text = subtitle
    SubtitleLabel.Font = FONT_BOLD
    SubtitleLabel.TextSize = 14
    SubtitleLabel.TextColor3 = currentTheme.Text
    SubtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    SubtitleLabel.ZIndex = 5

    local NoteLabel = Instance.new("TextLabel")
    NoteLabel.Parent = KeyFrame
    NoteLabel.Size = UDim2.new(1, -30, 0, 16)
    NoteLabel.Position = UDim2.new(0, 15, 0, 180)
    NoteLabel.BackgroundTransparency = 1
    NoteLabel.Text = "› " .. note
    NoteLabel.Font = FONT_PRIMARY
    NoteLabel.TextSize = 11
    NoteLabel.TextColor3 = currentTheme.DimText
    NoteLabel.TextXAlignment = Enum.TextXAlignment.Left
    NoteLabel.ZIndex = 5

    local InputBg = Instance.new("Frame")
    InputBg.Parent = KeyFrame
    InputBg.Size = UDim2.new(1, -30, 0, 40)
    InputBg.Position = UDim2.new(0, 15, 0, 205)
    InputBg.BackgroundColor3 = currentTheme.ElementBg
    InputBg.ZIndex = 5
    CreateCorner(InputBg, 10)
    local inputStroke = CreateStroke(InputBg, currentTheme.Stroke, 1)

    local InputIcon = Instance.new("TextLabel")
    InputIcon.Parent = InputBg
    InputIcon.Size = UDim2.new(0, 25, 1, 0)
    InputIcon.Position = UDim2.new(0, 10, 0, 0)
    InputIcon.BackgroundTransparency = 1
    InputIcon.Text = "🔑"
    InputIcon.Font = FONT_PRIMARY
    InputIcon.TextSize = 14
    InputIcon.TextColor3 = currentTheme.DimText
    InputIcon.ZIndex = 6

    local InputBox = Instance.new("TextBox")
    InputBox.Parent = InputBg
    InputBox.Size = UDim2.new(1, -45, 1, 0)
    InputBox.Position = UDim2.new(0, 38, 0, 0)
    InputBox.BackgroundTransparency = 1
    InputBox.Text = ""
    InputBox.PlaceholderText = "Enter key here..."
    InputBox.PlaceholderColor3 = currentTheme.DimText
    InputBox.TextColor3 = currentTheme.Text
    InputBox.Font = FONT_PRIMARY
    InputBox.TextSize = 13
    InputBox.TextXAlignment = Enum.TextXAlignment.Left
    InputBox.ClearTextOnFocus = false
    InputBox.ZIndex = 6

    InputBox.Focused:Connect(function()
        PlayTween(inputStroke, {Color = currentTheme.Accent}, 0.2)
        PlayTween(InputIcon, {TextColor3 = currentTheme.Accent}, 0.2)
    end)
    InputBox.FocusLost:Connect(function()
        PlayTween(inputStroke, {Color = currentTheme.Stroke}, 0.2)
        PlayTween(InputIcon, {TextColor3 = currentTheme.DimText}, 0.2)
    end)

    local BtnContainer = Instance.new("Frame")
    BtnContainer.Parent = KeyFrame
    BtnContainer.Size = UDim2.new(1, -30, 0, 38)
    BtnContainer.Position = UDim2.new(0, 15, 0, 255)
    BtnContainer.BackgroundTransparency = 1
    BtnContainer.ZIndex = 5

    local btnLayout = Instance.new("UIListLayout")
    btnLayout.Parent = BtnContainer
    btnLayout.FillDirection = Enum.FillDirection.Horizontal
    btnLayout.Padding = UDim.new(0, 8)

    local function MakeKeyButton(text, primary)
        local Btn = Instance.new("TextButton")
        Btn.Parent = BtnContainer
        Btn.Size = UDim2.new(0, 95, 1, 0)
        Btn.BackgroundColor3 = primary and currentTheme.Accent or currentTheme.ElementBg
        Btn.Text = text
        Btn.Font = FONT_BOLD
        Btn.TextSize = 12
        Btn.TextColor3 = primary and currentTheme.Main or currentTheme.Text
        Btn.AutoButtonColor = false
        Btn.ZIndex = 6
        CreateCorner(Btn, 10)
        if not primary then CreateStroke(Btn, currentTheme.Stroke, 1) end
        Btn.MouseEnter:Connect(function()
            PlayTween(Btn, {BackgroundColor3 = primary and currentTheme.Text or currentTheme.Hover}, 0.2)
        end)
        Btn.MouseLeave:Connect(function()
            PlayTween(Btn, {BackgroundColor3 = primary and currentTheme.Accent or currentTheme.ElementBg}, 0.2)
        end)
        return Btn
    end

    local SubmitBtn = MakeKeyButton("SUBMIT", true)
    local GetKeyBtn = MakeKeyButton("GET KEY", false)
    local CopyLinkBtn = copyKeyURL and MakeKeyButton("COPY LINK", false) or nil
    local DiscordBtn = discordLink and MakeKeyButton("DISCORD", false) or nil

    local StatusLabel = Instance.new("TextLabel")
    StatusLabel.Parent = KeyFrame
    StatusLabel.Size = UDim2.new(1, -30, 0, 18)
    StatusLabel.Position = UDim2.new(0, 15, 0, 300)
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Text = ""
    StatusLabel.Font = FONT_PRIMARY
    StatusLabel.TextSize = 11
    StatusLabel.TextColor3 = currentTheme.DimText
    StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
    StatusLabel.ZIndex = 5

    local AttemptsLabel = Instance.new("TextLabel")
    AttemptsLabel.Parent = KeyFrame
    AttemptsLabel.Size = UDim2.new(1, -30, 0, 14)
    AttemptsLabel.Position = UDim2.new(0, 15, 1, -20)
    AttemptsLabel.BackgroundTransparency = 1
    AttemptsLabel.Text = maxAttempts > 0 and ("› ATTEMPTS: 0/" .. maxAttempts) or ""
    AttemptsLabel.Font = FONT_PRIMARY
    AttemptsLabel.TextSize = 10
    AttemptsLabel.TextColor3 = currentTheme.DimText
    AttemptsLabel.TextXAlignment = Enum.TextXAlignment.Right
    AttemptsLabel.ZIndex = 5

    local kDrag = false
    local kStart, kPos
    TopBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            kDrag = true
            kStart = input.Position
            kPos = GlowFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then kDrag = false end
            end)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if kDrag and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - kStart
            GlowFrame.Position = UDim2.new(kPos.X.Scale, kPos.X.Offset + delta.X, kPos.Y.Scale, kPos.Y.Offset + delta.Y)
        end
    end)

    GlowFrame.Size = UDim2.new(0, 0, 0, 0)
    GlowFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    PlayTween(Backdrop, {BackgroundTransparency = 0.5}, 0.3)
    PlayTween(GlowFrame, {Size = UDim2.new(0, 420, 0, 340), Position = UDim2.new(0.5, -210, 0.5, -170)}, 0.4)

    local function CloseKeyGui()
        completed = true
        PlayTween(Backdrop, {BackgroundTransparency = 1}, 0.3)
        PlayTween(GlowFrame, {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)}, 0.3)
        task.wait(0.35)
        KeyGui:Destroy()
    end

    local function ShakeWindow()
        local origPos = GlowFrame.Position
        for i = 1, 5 do
            PlayTween(GlowFrame, {Position = origPos + UDim2.new(0, (i % 2 == 0 and -10 or 10), 0, 0)}, 0.04)
            task.wait(0.04)
        end
        PlayTween(GlowFrame, {Position = origPos}, 0.04)
    end

    SubmitBtn.MouseButton1Click:Connect(function()
        local enteredKey = InputBox.Text
        local valid = false
        for _, k in pairs(keys) do
            if enteredKey == k then valid = true break end
        end
        if valid then
            success = true
            PlaySound("Success", 0.4)
            StatusLabel.Text = "✓ KEY ACCEPTED — LOADING..."
            StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 120)
            PlayTween(inputStroke, {Color = Color3.fromRGB(100, 255, 120)}, 0.2)
            if saveKey and writefile then pcall(writefile, fileName, enteredKey) end
            task.wait(0.8)
            CloseKeyGui()
        else
            attemptCount = attemptCount + 1
            PlaySound("Error", 0.4)
            if maxAttempts > 0 then
                AttemptsLabel.Text = "› ATTEMPTS: " .. attemptCount .. "/" .. maxAttempts
                if attemptCount >= maxAttempts then
                    StatusLabel.Text = "✗ MAX ATTEMPTS REACHED"
                    StatusLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
                    InputBox.TextEditable = false
                    SubmitBtn.Active = false
                    task.wait(2)
                    CloseKeyGui()
                    return
                end
            end
            StatusLabel.Text = "✗ INVALID KEY — TRY AGAIN"
            StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
            PlayTween(inputStroke, {Color = Color3.fromRGB(255, 80, 80)}, 0.2)
            ShakeWindow()
            task.delay(1.5, function()
                if not completed then
                    PlayTween(inputStroke, {Color = currentTheme.Stroke}, 0.3)
                end
            end)
        end
    end)

    GetKeyBtn.MouseButton1Click:Connect(function()
        PlaySound("Click", 0.2)
        if getKeyURL then
            if setclipboard then
                setclipboard(getKeyURL)
                StatusLabel.Text = "✓ KEY LINK COPIED"
                StatusLabel.TextColor3 = currentTheme.Accent
            else
                StatusLabel.Text = "› " .. getKeyURL
                StatusLabel.TextColor3 = currentTheme.Accent
            end
        end
    end)

    if CopyLinkBtn then
        CopyLinkBtn.MouseButton1Click:Connect(function()
            PlaySound("Click", 0.2)
            if setclipboard then
                setclipboard(copyKeyURL)
                StatusLabel.Text = "✓ LINK COPIED"
                StatusLabel.TextColor3 = currentTheme.Accent
            end
        end)
    end

    if DiscordBtn then
        DiscordBtn.MouseButton1Click:Connect(function()
            PlaySound("Click", 0.2)
            if setclipboard then
                setclipboard(discordLink)
                StatusLabel.Text = "✓ DISCORD COPIED"
                StatusLabel.TextColor3 = currentTheme.Accent
            end
        end)
    end

    CloseBtn.MouseButton1Click:Connect(function()
        PlaySound("Click", 0.2)
        CloseKeyGui()
    end)

    InputBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then SubmitBtn.MouseButton1Click:Fire() end
    end)

    while not completed do task.wait() end
    return success
end

function Nebula:CreateWindow(config)
    config = config or {}
    local title = config.Title or "NEBULA // SYSTEM"
    local themeName = config.Theme or "Dark"
    local sizeX = (config.Size and config.Size[1]) or 600
    local sizeY = (config.Size and config.Size[2]) or 420
    local minX = (config.MinSize and config.MinSize[1]) or 440
    local minY = (config.MinSize and config.MinSize[2]) or 320
    local toggleKey = config.ToggleKey or Enum.KeyCode.RightShift
    local searchKey = config.SearchKey or Enum.KeyCode.K
    local openBtnText = config.OpenButtonText or "OPEN MENU"
    local openBtnWidth = (config.OpenButtonSize and config.OpenButtonSize[1]) or 150
    local openBtnHeight = (config.OpenButtonSize and config.OpenButtonSize[2]) or 30

    local currentTheme = Themes[themeName] or Themes.Dark
    local Window = {}
    Window.Tabs = {}
    Window.TabButtons = {}
    Window.ThemeObjects = {}
    Window.CurrentThemeName = themeName
    Window.Visible = true
    Window.SearchableElements = {}
    Window.Keybinds = {}
    Window.SFXEnabled = true
    Window.QuickButtons = {}

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "NebulaUI_" .. tostring(math.random(100000, 999999))
    ScreenGui.Parent = CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    Window.ScreenGui = ScreenGui

local TopButtonsHolder = Instance.new("Frame")
TopButtonsHolder.Name = "TopButtonsHolder"
TopButtonsHolder.Parent = ScreenGui
TopButtonsHolder.AnchorPoint = Vector2.new(0.5, 0)
TopButtonsHolder.Position = UDim2.new(0.5, 0, 0, 10)
TopButtonsHolder.Size = UDim2.new(0, 0, 0, 34)
TopButtonsHolder.BackgroundTransparency = 1
TopButtonsHolder.ZIndex = 10
TopButtonsHolder.AutomaticSize = Enum.AutomaticSize.X

local topButtonsLayout = Instance.new("UIListLayout")
topButtonsLayout.Parent = TopButtonsHolder
topButtonsLayout.FillDirection = Enum.FillDirection.Horizontal
topButtonsLayout.Padding = UDim.new(0, 8)
topButtonsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
topButtonsLayout.VerticalAlignment = Enum.VerticalAlignment.Center
topButtonsLayout.SortOrder = Enum.SortOrder.LayoutOrder

local tbDrag = false
local tbDragStart, tbStartPos
TopButtonsHolder.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        tbDrag = true
        tbDragStart = input.Position
        tbStartPos = TopButtonsHolder.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then tbDrag = false end
        end)
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if tbDrag and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - tbDragStart
        TopButtonsHolder.Position = UDim2.new(tbStartPos.X.Scale, tbStartPos.X.Offset + delta.X, tbStartPos.Y.Scale, tbStartPos.Y.Offset + delta.Y)
    end
end)

local OpenButton = Instance.new("TextButton")
OpenButton.Name = "OpenButton"
OpenButton.Parent = TopButtonsHolder
OpenButton.Size = UDim2.new(0, openBtnWidth, 0, openBtnHeight)
OpenButton.BackgroundColor3 = currentTheme.Main
OpenButton.Text = openBtnText
OpenButton.Font = FONT_BOLD
OpenButton.TextSize = 13
OpenButton.TextColor3 = currentTheme.Accent
OpenButton.AutoButtonColor = false
OpenButton.Visible = false
OpenButton.ZIndex = 11
OpenButton.LayoutOrder = 0
CreateCorner(OpenButton, 9)
local OpenStroke = CreateStroke(OpenButton, currentTheme.Accent, 1.5)
Window.OpenButton = OpenButton
Window.OpenStroke = OpenStroke

OpenButton.MouseEnter:Connect(function()
    PlayTween(OpenButton, {BackgroundColor3 = currentTheme.Accent, TextColor3 = currentTheme.Main}, 0.2)
end)
OpenButton.MouseLeave:Connect(function()
    PlayTween(OpenButton, {BackgroundColor3 = currentTheme.Main, TextColor3 = currentTheme.Accent}, 0.2)
end)
OpenButton.MouseButton1Click:Connect(function()
    PlaySound("Click", 0.2)
    Window:Toggle()
end)

    function Window:SetOpenButtonText(text)
        OpenButton.Text = text
    end

    function Window:SetOpenButtonSize(width, height)
        OpenButton.Size = UDim2.new(0, width, 0, height)
    end

    function Window:SetOpenButtonColors(bgColor, textColor, strokeColor)
        if bgColor then OpenButton.BackgroundColor3 = bgColor end
        if textColor then OpenButton.TextColor3 = textColor end
        if strokeColor then OpenStroke.Color = strokeColor end
    end

function Window:AddQuickButton(cfg)
    cfg = cfg or {}
    local qName = cfg.Name or "Action"
    local qWidth = cfg.Width or 80
    local qHeight = cfg.Height or 34
    local qCallback = cfg.Callback
    local qBgColor = cfg.BackgroundColor or currentTheme.Main
    local qTextColor = cfg.TextColor or currentTheme.Accent
    local qStrokeColor = cfg.StrokeColor or currentTheme.Accent
    local qEnabled = true

    local QBtn = Instance.new("TextButton")
    QBtn.Name = "QuickButton_" .. qName
    QBtn.Parent = TopButtonsHolder
    QBtn.Size = UDim2.new(0, qWidth, 0, qHeight)
    QBtn.BackgroundColor3 = qBgColor
    QBtn.Text = qName
    QBtn.Font = FONT_BOLD
    QBtn.TextSize = 13
    QBtn.TextColor3 = qTextColor
    QBtn.AutoButtonColor = false
    QBtn.ZIndex = 11
    QBtn.LayoutOrder = #Window.QuickButtons + 1
    CreateCorner(QBtn, 9)
    local QStroke = CreateStroke(QBtn, qStrokeColor, 1.5)

    QBtn.MouseEnter:Connect(function()
        if qEnabled then
            PlayTween(QBtn, {BackgroundColor3 = qStrokeColor, TextColor3 = currentTheme.Main}, 0.2)
        end
    end)
    QBtn.MouseLeave:Connect(function()
        if qEnabled then
            PlayTween(QBtn, {BackgroundColor3 = qBgColor, TextColor3 = qTextColor}, 0.2)
        else
            PlayTween(QBtn, {BackgroundColor3 = Color3.fromRGB(40, 40, 40), TextColor3 = Color3.fromRGB(80, 80, 80)}, 0.2)
        end
    end)
    QBtn.MouseButton1Click:Connect(function()
        if not qEnabled then return end
        PlaySound("Click", 0.2)
        PlayTween(QBtn, {BackgroundColor3 = qStrokeColor}, 0.1)
        task.delay(0.15, function()
            if qEnabled then
                PlayTween(QBtn, {BackgroundColor3 = qBgColor}, 0.3)
            end
        end)
        if qCallback then qCallback() end
    end)

    local qData = {Button = QBtn, Stroke = QStroke, BgColor = qBgColor, TextColor = qTextColor, StrokeColor = qStrokeColor, Enabled = true}
    table.insert(Window.QuickButtons, qData)

    local API = {}
    function API:SetText(newText) QBtn.Text = newText end
    function API:SetSize(w, h) QBtn.Size = UDim2.new(0, w or qWidth, 0, h or qHeight) end
    function API:SetColors(bg, txt, stroke)
        if bg then QBtn.BackgroundColor3 = bg qBgColor = bg qData.BgColor = bg end
        if txt then QBtn.TextColor3 = txt qTextColor = txt qData.TextColor = txt end
        if stroke then QStroke.Color = stroke qStrokeColor = stroke qData.StrokeColor = stroke end
    end
    function API:SetCallback(fn) qCallback = fn end
    function API:SetVisible(visible) QBtn.Visible = visible end
    function API:SetEnabled(enabled)
        qEnabled = enabled
        qData.Enabled = enabled
        if enabled then
            PlayTween(QBtn, {BackgroundColor3 = qBgColor, TextColor3 = qTextColor}, 0.3)
            QStroke.Color = qStrokeColor
        else
            PlayTween(QBtn, {BackgroundColor3 = Color3.fromRGB(40, 40, 40), TextColor3 = Color3.fromRGB(80, 80, 80)}, 0.3)
            QStroke.Color = Color3.fromRGB(60, 60, 60)
        end
    end
    function API:IsEnabled() return qEnabled end
    function API:Destroy() QBtn:Destroy() end
    return API
end
    
    local WatermarkFrame = Instance.new("Frame")
    WatermarkFrame.Name = "Watermark"
    WatermarkFrame.Parent = ScreenGui
    WatermarkFrame.Size = UDim2.new(0, 340, 0, 36)
    WatermarkFrame.Position = UDim2.new(0, 15, 0, 12)
    WatermarkFrame.BackgroundColor3 = currentTheme.Main
    WatermarkFrame.BackgroundTransparency = 0.1
    WatermarkFrame.Visible = false
    WatermarkFrame.ZIndex = 15
    CreateCorner(WatermarkFrame, 10)
    local wmStroke = CreateStroke(WatermarkFrame, currentTheme.Stroke, 1)

    local WmAccentBar = Instance.new("Frame")
    WmAccentBar.Parent = WatermarkFrame
    WmAccentBar.Size = UDim2.new(1, 0, 0, 2)
    WmAccentBar.Position = UDim2.new(0, 0, 0, 0)
    WmAccentBar.BackgroundColor3 = currentTheme.Accent
    WmAccentBar.BorderSizePixel = 0
    WmAccentBar.ZIndex = 16
    CreateCorner(WmAccentBar, 10)

    local WmGradient = Instance.new("UIGradient")
    WmGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 100, 100)),
        ColorSequenceKeypoint.new(0.25, Color3.fromRGB(255, 255, 100)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(100, 255, 100)),
        ColorSequenceKeypoint.new(0.75, Color3.fromRGB(100, 100, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 100, 255)),
    })
    WmGradient.Parent = WmAccentBar

    local wmGradOffset = 0
    RunService.RenderStepped:Connect(function(dt)
        wmGradOffset = (wmGradOffset + dt * 0.3) % 1
        WmGradient.Offset = Vector2.new(wmGradOffset, 0)
    end)

    local WmText = Instance.new("TextLabel")
    WmText.Parent = WatermarkFrame
    WmText.Size = UDim2.new(1, -35, 1, -4)
    WmText.Position = UDim2.new(0, 10, 0, 3)
    WmText.BackgroundTransparency = 1
    WmText.Font = FONT_PRIMARY
    WmText.TextSize = 12
    WmText.TextColor3 = currentTheme.Text
    WmText.TextXAlignment = Enum.TextXAlignment.Left
    WmText.Text = ""
    WmText.ZIndex = 16

    local WmMinBtn = Instance.new("TextButton")
    WmMinBtn.Parent = WatermarkFrame
    WmMinBtn.Size = UDim2.new(0, 20, 0, 20)
    WmMinBtn.Position = UDim2.new(1, -25, 0, 8)
    WmMinBtn.BackgroundTransparency = 1
    WmMinBtn.Text = "—"
    WmMinBtn.Font = FONT_PRIMARY
    WmMinBtn.TextSize = 12
    WmMinBtn.TextColor3 = currentTheme.DimText
    WmMinBtn.ZIndex = 17

    local wmMinimized = false
    local wmOrigSize = WatermarkFrame.Size

    WmMinBtn.MouseButton1Click:Connect(function()
        wmMinimized = not wmMinimized
        if wmMinimized then
            PlayTween(WatermarkFrame, {Size = UDim2.new(0, 36, 0, 36)}, 0.25)
            WmText.Visible = false
            WmMinBtn.Text = "+"
        else
            PlayTween(WatermarkFrame, {Size = wmOrigSize}, 0.25)
            task.delay(0.25, function() WmText.Visible = true end)
            WmMinBtn.Text = "—"
        end
    end)

    local wmDrag = false
    local wmDragStart, wmStartPos
    WatermarkFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            wmDrag = true
            wmDragStart = input.Position
            wmStartPos = WatermarkFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then wmDrag = false end
            end)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if wmDrag and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - wmDragStart
            WatermarkFrame.Position = UDim2.new(wmStartPos.X.Scale, wmStartPos.X.Offset + delta.X, wmStartPos.Y.Scale, wmStartPos.Y.Offset + delta.Y)
        end
    end)

    Window.WatermarkFrame = WatermarkFrame
    Window.WmText = WmText
    Window.WmAccentBar = WmAccentBar

    local wmStartTime = tick()
    local wmCustomText = nil
    RunService.RenderStepped:Connect(function()
        if WatermarkFrame.Visible and not wmMinimized then
            local fps = math.floor(1 / RunService.RenderStepped:Wait())
            local ping = 0
            pcall(function() ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue()) end)
            local elapsed = math.floor(tick() - wmStartTime)
            local hrs = math.floor(elapsed / 3600)
            local mins = math.floor((elapsed % 3600) / 60)
            local secs = elapsed % 60
            local timeStr = string.format("%02d:%02d:%02d", hrs, mins, secs)
            local baseText = (wmCustomText or title) .. "  •  " .. LocalPlayer.DisplayName .. "  •  " .. fps .. " FPS  •  " .. ping .. "ms  •  " .. timeStr
            WmText.Text = baseText
        end
    end)

    function Window:SetWatermarkText(text) wmCustomText = text end
    function Window:ShowWatermark() WatermarkFrame.Visible = true end
    function Window:HideWatermark() WatermarkFrame.Visible = false end

    local GlowFrame = Instance.new("Frame")
    GlowFrame.Name = "GlowFrame"
    GlowFrame.Parent = ScreenGui
    GlowFrame.BackgroundColor3 = currentTheme.Glow
    GlowFrame.BackgroundTransparency = 0.7
    GlowFrame.Position = UDim2.new(0.5, -math.floor(sizeX / 2), 0.5, -math.floor(sizeY / 2))
    GlowFrame.Size = UDim2.new(0, sizeX, 0, sizeY)
    CreateCorner(GlowFrame, 14)
    Window.GlowFrame = GlowFrame

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = GlowFrame
    MainFrame.BackgroundColor3 = currentTheme.Main
    MainFrame.Position = UDim2.new(0, 2, 0, 2)
    MainFrame.Size = UDim2.new(1, -4, 1, -4)
    MainFrame.ClipsDescendants = true
    CreateCorner(MainFrame, 12)
    local mainStroke = CreateStroke(MainFrame, currentTheme.Stroke, 1)
    Window.MainFrame = MainFrame
    Window.MainStroke = mainStroke

    local TopBar = Instance.new("Frame")
    TopBar.Parent = MainFrame
    TopBar.Size = UDim2.new(1, 0, 0, 44)
    TopBar.BackgroundColor3 = currentTheme.TopBar
    TopBar.BorderSizePixel = 0
    Window.TopBar = TopBar

    local TopBarCornerFix = Instance.new("Frame")
    TopBarCornerFix.Parent = TopBar
    TopBarCornerFix.Size = UDim2.new(1, 0, 0, 12)
    TopBarCornerFix.Position = UDim2.new(0, 0, 1, -12)
    TopBarCornerFix.BackgroundColor3 = currentTheme.TopBar
    TopBarCornerFix.BorderSizePixel = 0

    local TopBarLine = Instance.new("Frame")
    TopBarLine.Parent = MainFrame
    TopBarLine.Size = UDim2.new(1, 0, 0, 1)
    TopBarLine.Position = UDim2.new(0, 0, 0, 44)
    TopBarLine.BackgroundColor3 = currentTheme.Stroke
    TopBarLine.BorderSizePixel = 0
    Window.TopBarLine = TopBarLine

    local Sidebar = Instance.new("Frame")
    Sidebar.Parent = MainFrame
    Sidebar.BackgroundColor3 = currentTheme.Sidebar
    Sidebar.Position = UDim2.new(0, 0, 0, 45)
    Sidebar.Size = UDim2.new(0, 170, 1, -45)
    Sidebar.BorderSizePixel = 0
    Window.Sidebar = Sidebar

    local SidebarLine = Instance.new("Frame")
    SidebarLine.Parent = MainFrame
    SidebarLine.Size = UDim2.new(0, 1, 1, -45)
    SidebarLine.Position = UDim2.new(0, 170, 0, 45)
    SidebarLine.BackgroundColor3 = currentTheme.Stroke
    SidebarLine.BorderSizePixel = 0
    Window.SidebarLine = SidebarLine

    local SidebarList = Instance.new("ScrollingFrame")
    SidebarList.Parent = Sidebar
    SidebarList.Size = UDim2.new(1, 0, 1, -68)
    SidebarList.Position = UDim2.new(0, 0, 0, 12)
    SidebarList.BackgroundTransparency = 1
    SidebarList.BorderSizePixel = 0
    SidebarList.ScrollBarThickness = 0
    SidebarList.CanvasSize = UDim2.new(0, 0, 0, 0)
    SidebarList.AutomaticCanvasSize = Enum.AutomaticSize.Y

    local sidebarLayout = Instance.new("UIListLayout")
    sidebarLayout.Parent = SidebarList
    sidebarLayout.Padding = UDim.new(0, 5)
    sidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
    CreatePadding(SidebarList, 0, 0, 10, 10)

    local SidebarFooter = Instance.new("Frame")
    SidebarFooter.Parent = Sidebar
    SidebarFooter.Size = UDim2.new(1, 0, 0, 58)
    SidebarFooter.Position = UDim2.new(0, 0, 1, -58)
    SidebarFooter.BackgroundTransparency = 1

    local FooterLine = Instance.new("Frame")
    FooterLine.Parent = SidebarFooter
    FooterLine.Size = UDim2.new(1, -20, 0, 1)
    FooterLine.Position = UDim2.new(0, 10, 0, 0)
    FooterLine.BackgroundColor3 = currentTheme.Stroke
    FooterLine.BorderSizePixel = 0

    local FooterAvatarHolder = Instance.new("Frame")
    FooterAvatarHolder.Parent = SidebarFooter
    FooterAvatarHolder.Size = UDim2.new(0, 34, 0, 34)
    FooterAvatarHolder.Position = UDim2.new(0, 10, 0, 12)
    FooterAvatarHolder.BackgroundTransparency = 1

    local FooterAvatar = Instance.new("ImageLabel")
    FooterAvatar.Parent = FooterAvatarHolder
    FooterAvatar.Size = UDim2.new(1, 0, 1, 0)
    FooterAvatar.Position = UDim2.new(0, 0, 0, 0)
    FooterAvatar.BackgroundColor3 = currentTheme.Main
    FooterAvatar.Image = IsAvatarReady and AvatarContent or ""
    FooterAvatar.Rotation = 0
    CreateCorner(FooterAvatar, 17)
    local footerAvStroke = CreateStroke(FooterAvatar, currentTheme.Accent, 1.5)

    local FooterAvatarBtn = Instance.new("TextButton")
    FooterAvatarBtn.Parent = FooterAvatarHolder
    FooterAvatarBtn.Size = UDim2.new(1, 0, 1, 0)
    FooterAvatarBtn.BackgroundTransparency = 1
    FooterAvatarBtn.Text = ""
    FooterAvatarBtn.ZIndex = 5

    local footerClickCount = 0
    local FooterAngrySpeech = Instance.new("TextLabel")
    FooterAngrySpeech.Parent = SidebarFooter
    FooterAngrySpeech.Size = UDim2.new(1, -10, 0, 12)
    FooterAngrySpeech.Position = UDim2.new(0, 5, 1, -12)
    FooterAngrySpeech.BackgroundTransparency = 1
    FooterAngrySpeech.Text = ""
    FooterAngrySpeech.Font = FONT_PRIMARY
    FooterAngrySpeech.TextSize = 9
    FooterAngrySpeech.TextColor3 = Color3.fromRGB(255, 80, 80)
    FooterAngrySpeech.TextWrapped = true
    FooterAngrySpeech.TextXAlignment = Enum.TextXAlignment.Left

    FooterAvatarBtn.MouseButton1Click:Connect(function()
        footerClickCount = footerClickCount + 1
        PlaySound("Click", 0.2)
        if footerClickCount <= 3 then
            TweenService:Create(FooterAvatarHolder, TweenInfo.new(0.4), {Rotation = FooterAvatarHolder.Rotation + 360}):Play()
            FooterAngrySpeech.Text = ""
        elseif footerClickCount <= 8 then
            TweenService:Create(FooterAvatarHolder, TweenInfo.new(0.2), {Rotation = FooterAvatarHolder.Rotation + 720}):Play()
            footerAvStroke.Color = Color3.fromRGB(255, 150, 50)
            FooterAngrySpeech.Text = AngryPhrases[math.random(1, #AngryPhrases)]
            FooterAngrySpeech.TextColor3 = Color3.fromRGB(255, 150, 50)
            PlaySound("Error", 0.3)
            local origPos = FooterAvatarHolder.Position
            for i = 1, 3 do
                PlayTween(FooterAvatarHolder, {Position = origPos + UDim2.new(0, (i % 2 == 0 and -4 or 4), 0, 0)}, 0.03)
                task.wait(0.03)
            end
            PlayTween(FooterAvatarHolder, {Position = origPos}, 0.03)
        elseif footerClickCount <= 12 then
            TweenService:Create(FooterAvatarHolder, TweenInfo.new(0.1), {Rotation = FooterAvatarHolder.Rotation + 1440}):Play()
            footerAvStroke.Color = Color3.fromRGB(255, 0, 0)
            FooterAngrySpeech.Text = AngryPhrases[math.random(1, #AngryPhrases)]:upper() .. "!!!"
            FooterAngrySpeech.TextColor3 = Color3.fromRGB(255, 50, 50)
            PlaySound("Error", 0.5)
            local origPos = FooterAvatarHolder.Position
            for i = 1, 5 do
                PlayTween(FooterAvatarHolder, {Position = origPos + UDim2.new(0, (i % 2 == 0 and -6 or 6), 0, (i % 2 == 0 and -2 or 2))}, 0.03)
                task.wait(0.03)
            end
            PlayTween(FooterAvatarHolder, {Position = origPos}, 0.03)
        else
            FooterAngrySpeech.Text = "💀 im done"
            FooterAngrySpeech.TextColor3 = currentTheme.DimText
            footerAvStroke.Color = Color3.fromRGB(80, 80, 80)
            PlayTween(FooterAvatar, {ImageTransparency = 0.5}, 0.3)
            task.delay(1.5, function()
                PlayTween(FooterAvatar, {ImageTransparency = 0}, 0.5)
                TweenService:Create(FooterAvatarHolder, TweenInfo.new(0.5), {Rotation = 0}):Play()
                footerAvStroke.Color = currentTheme.Accent
                FooterAngrySpeech.Text = ""
                footerClickCount = 0
            end)
        end
    end)

    local FooterName = Instance.new("TextLabel")
    FooterName.Parent = SidebarFooter
    FooterName.Size = UDim2.new(1, -60, 0, 18)
    FooterName.Position = UDim2.new(0, 52, 0, 10)
    FooterName.BackgroundTransparency = 1
    FooterName.Text = LocalPlayer.DisplayName
    FooterName.Font = FONT_BOLD
    FooterName.TextSize = 13
    FooterName.TextColor3 = currentTheme.Text
    FooterName.TextXAlignment = Enum.TextXAlignment.Left
    FooterName.TextTruncate = Enum.TextTruncate.AtEnd

    local FooterTag = Instance.new("TextLabel")
    FooterTag.Parent = SidebarFooter
    FooterTag.Size = UDim2.new(1, -60, 0, 14)
    FooterTag.Position = UDim2.new(0, 52, 0, 28)
    FooterTag.BackgroundTransparency = 1
    FooterTag.Text = "@" .. LocalPlayer.Name
    FooterTag.Font = FONT_PRIMARY
    FooterTag.TextSize = 11
    FooterTag.TextColor3 = currentTheme.DimText
    FooterTag.TextXAlignment = Enum.TextXAlignment.Left
    FooterTag.TextTruncate = Enum.TextTruncate.AtEnd

    local Logo = Instance.new("TextLabel")
    Logo.Parent = TopBar
    Logo.Text = title
    Logo.Font = FONT_BOLD
    Logo.TextSize = 15
    Logo.TextColor3 = currentTheme.Accent
    Logo.Position = UDim2.new(0, 18, 0, 0)
    Logo.Size = UDim2.new(0, 300, 1, 0)
    Logo.BackgroundTransparency = 1
    Logo.TextXAlignment = Enum.TextXAlignment.Left
    Window.Logo = Logo

    local VersionLabel = Instance.new("TextLabel")
    VersionLabel.Parent = TopBar
    VersionLabel.Size = UDim2.new(0, 40, 1, 0)
    VersionLabel.Position = UDim2.new(1, -125, 0, 0)
    VersionLabel.BackgroundTransparency = 1
    VersionLabel.Text = "v2.4"
    VersionLabel.Font = FONT_PRIMARY
    VersionLabel.TextSize = 11
    VersionLabel.TextColor3 = currentTheme.DimText
    VersionLabel.TextXAlignment = Enum.TextXAlignment.Right

    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Parent = TopBar
    CloseBtn.Size = UDim2.new(0, 32, 0, 32)
    CloseBtn.Position = UDim2.new(1, -38, 0, 6)
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Text = "×"
    CloseBtn.Font = FONT_PRIMARY
    CloseBtn.TextSize = 22
    CloseBtn.TextColor3 = currentTheme.DimText
    CloseBtn.MouseEnter:Connect(function() PlayTween(CloseBtn, {TextColor3 = Color3.fromRGB(255, 80, 80)}, 0.2) end)
    CloseBtn.MouseLeave:Connect(function() PlayTween(CloseBtn, {TextColor3 = currentTheme.DimText}, 0.2) end)
    CloseBtn.MouseButton1Click:Connect(function() PlaySound("Click", 0.2) Window:Toggle() end)

    local MinBtn = Instance.new("TextButton")
    MinBtn.Parent = TopBar
    MinBtn.Size = UDim2.new(0, 32, 0, 32)
    MinBtn.Position = UDim2.new(1, -72, 0, 6)
    MinBtn.BackgroundTransparency = 1
    MinBtn.Text = "—"
    MinBtn.Font = FONT_PRIMARY
    MinBtn.TextSize = 16
    MinBtn.TextColor3 = currentTheme.DimText
    MinBtn.MouseEnter:Connect(function() PlayTween(MinBtn, {TextColor3 = currentTheme.Accent}, 0.2) end)
    MinBtn.MouseLeave:Connect(function() PlayTween(MinBtn, {TextColor3 = currentTheme.DimText}, 0.2) end)
    MinBtn.MouseButton1Click:Connect(function() PlaySound("Click", 0.2) Window:Toggle() end)

    local PageContainer = Instance.new("Frame")
    PageContainer.Parent = MainFrame
    PageContainer.BackgroundTransparency = 1
    PageContainer.Position = UDim2.new(0, 171, 0, 45)
    PageContainer.Size = UDim2.new(1, -171, 1, -45)
    Window.PageContainer = PageContainer

    local ResizeBtn = Instance.new("TextButton")
    ResizeBtn.Parent = MainFrame
    ResizeBtn.Size = UDim2.new(0, 20, 0, 20)
    ResizeBtn.Position = UDim2.new(1, -20, 1, -20)
    ResizeBtn.BackgroundTransparency = 1
    ResizeBtn.Text = "⋰"
    ResizeBtn.Font = FONT_PRIMARY
    ResizeBtn.TextColor3 = currentTheme.DimText
    ResizeBtn.TextSize = 14

    local isResizing = false
    ResizeBtn.MouseButton1Down:Connect(function() isResizing = true end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then isResizing = false end
    end)
    RunService.RenderStepped:Connect(function()
        if isResizing then
            local mousePos = UserInputService:GetMouseLocation()
            local framePos = GlowFrame.AbsolutePosition
            GlowFrame.Size = UDim2.new(0, math.max(minX, mousePos.X - framePos.X), 0, math.max(minY, mousePos.Y - framePos.Y - 36))
        end
    end)

    local isDragging = false
    local dragStart, startPos
    TopBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 and not isResizing then
            isDragging = true
            dragStart = input.Position
            startPos = GlowFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then isDragging = false end
            end)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            GlowFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    local SearchOverlay = Instance.new("Frame")
    SearchOverlay.Parent = ScreenGui
    SearchOverlay.Size = UDim2.new(1, 0, 1, 0)
    SearchOverlay.BackgroundColor3 = Color3.new(0, 0, 0)
    SearchOverlay.BackgroundTransparency = 1
    SearchOverlay.Visible = false
    SearchOverlay.ZIndex = 50

    local SearchFrame = Instance.new("Frame")
    SearchFrame.Parent = SearchOverlay
    SearchFrame.Size = UDim2.new(0, 420, 0, 52)
    SearchFrame.Position = UDim2.new(0.5, -210, 0.3, 0)
    SearchFrame.BackgroundColor3 = currentTheme.Main
    SearchFrame.ZIndex = 51
    CreateCorner(SearchFrame, 12)
    local searchStroke = CreateStroke(SearchFrame, currentTheme.Accent, 1.5)

    local SearchIcon = Instance.new("TextLabel")
    SearchIcon.Parent = SearchFrame
    SearchIcon.Size = UDim2.new(0, 30, 1, 0)
    SearchIcon.Position = UDim2.new(0, 12, 0, 0)
    SearchIcon.BackgroundTransparency = 1
    SearchIcon.Text = "🔍"
    SearchIcon.Font = FONT_PRIMARY
    SearchIcon.TextSize = 16
    SearchIcon.TextColor3 = currentTheme.Accent
    SearchIcon.ZIndex = 52

    local SearchInput = Instance.new("TextBox")
    SearchInput.Parent = SearchFrame
    SearchInput.Size = UDim2.new(1, -52, 1, 0)
    SearchInput.Position = UDim2.new(0, 44, 0, 0)
    SearchInput.BackgroundTransparency = 1
    SearchInput.Text = ""
    SearchInput.PlaceholderText = "Search elements, tabs..."
    SearchInput.PlaceholderColor3 = currentTheme.DimText
    SearchInput.TextColor3 = currentTheme.Text
    SearchInput.Font = FONT_PRIMARY
    SearchInput.TextSize = 14
    SearchInput.TextXAlignment = Enum.TextXAlignment.Left
    SearchInput.ClearTextOnFocus = true
    SearchInput.ZIndex = 52

    local SearchResults = Instance.new("ScrollingFrame")
    SearchResults.Parent = SearchFrame
    SearchResults.Size = UDim2.new(1, 0, 0, 0)
    SearchResults.Position = UDim2.new(0, 0, 1, 6)
    SearchResults.BackgroundColor3 = currentTheme.Main
    SearchResults.BorderSizePixel = 0
    SearchResults.ScrollBarThickness = 2
    SearchResults.ScrollBarImageColor3 = currentTheme.Accent
    SearchResults.Visible = false
    SearchResults.ZIndex = 51
    SearchResults.AutomaticCanvasSize = Enum.AutomaticSize.Y
    SearchResults.CanvasSize = UDim2.new(0, 0, 0, 0)
    CreateCorner(SearchResults, 10)
    CreateStroke(SearchResults, currentTheme.Stroke, 1)

    local searchResultLayout = Instance.new("UIListLayout")
    searchResultLayout.Parent = SearchResults
    searchResultLayout.Padding = UDim.new(0, 3)
    CreatePadding(SearchResults, 5, 5, 5, 5)

    local searchOpen = false

    local function CloseSearch()
        searchOpen = false
        PlayTween(SearchOverlay, {BackgroundTransparency = 1}, 0.2)
        PlayTween(SearchFrame, {Position = UDim2.new(0.5, -210, 0.25, 0)}, 0.2)
        task.delay(0.2, function()
            SearchOverlay.Visible = false
            SearchResults.Visible = false
        end)
    end

    local function OpenSearch()
        searchOpen = true
        SearchOverlay.Visible = true
        SearchInput.Text = ""
        SearchResults.Visible = false
        for _, c in pairs(SearchResults:GetChildren()) do
            if c:IsA("TextButton") or c:IsA("TextLabel") then c:Destroy() end
        end
        SearchFrame.Position = UDim2.new(0.5, -210, 0.25, 0)
        SearchOverlay.BackgroundTransparency = 1
        PlayTween(SearchOverlay, {BackgroundTransparency = 0.6}, 0.2)
        PlayTween(SearchFrame, {Position = UDim2.new(0.5, -210, 0.3, 0)}, 0.2)
        task.delay(0.1, function() SearchInput:CaptureFocus() end)
    end

    SearchOverlay.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            local mx = input.Position.X
            local my = input.Position.Y
            local sfPos = SearchFrame.AbsolutePosition
            local sfSize = SearchFrame.AbsoluteSize
            if mx < sfPos.X or mx > sfPos.X + sfSize.X or my < sfPos.Y or my > sfPos.Y + sfSize.Y + 250 then
                CloseSearch()
            end
        end
    end)

    SearchInput:GetPropertyChangedSignal("Text"):Connect(function()
        local query = SearchInput.Text:lower()
        for _, c in pairs(SearchResults:GetChildren()) do
            if c:IsA("TextButton") or c:IsA("TextLabel") then c:Destroy() end
        end
        if query == "" then
            SearchResults.Visible = false
            SearchResults.Size = UDim2.new(1, 0, 0, 0)
            return
        end
        local results = {}
        for _, elem in pairs(Window.SearchableElements) do
            if elem.Name:lower():find(query) then
                table.insert(results, elem)
            end
        end
        for _, tab in pairs(Window.Tabs) do
            if tab.Name:lower():find(query) then
                table.insert(results, {Name = "Tab: " .. tab.Name, Type = "tab", Tab = tab})
            end
        end
        if #results > 0 then
            SearchResults.Visible = true
            local height = math.min(#results * 32 + 10, 220)
            SearchResults.Size = UDim2.new(1, 0, 0, height)
            for _, res in pairs(results) do
                local rb = Instance.new("TextButton")
                rb.Parent = SearchResults
                rb.Size = UDim2.new(1, 0, 0, 30)
                rb.BackgroundColor3 = currentTheme.Card
                rb.Font = FONT_PRIMARY
                rb.TextSize = 13
                rb.Text = "  " .. (res.Type or "element") .. " › " .. res.Name
                rb.TextColor3 = currentTheme.Text
                rb.TextXAlignment = Enum.TextXAlignment.Left
                rb.ZIndex = 53
                CreateCorner(rb, 8)
                rb.MouseEnter:Connect(function() PlayTween(rb, {BackgroundColor3 = currentTheme.Hover}, 0.15) end)
                rb.MouseLeave:Connect(function() PlayTween(rb, {BackgroundColor3 = currentTheme.Card}, 0.15) end)
                rb.MouseButton1Click:Connect(function()
                    PlaySound("Click", 0.2)
                    CloseSearch()
                    if res.Type == "tab" and res.Tab and res.Tab.Activate then
                        res.Tab.Activate()
                    elseif res.TabName then
                        for _, t in pairs(Window.Tabs) do
                            if t.Name == res.TabName and t.Activate then
                                t.Activate()
                                break
                            end
                        end
                    end
                end)
            end
        else
            SearchResults.Visible = true
            SearchResults.Size = UDim2.new(1, 0, 0, 42)
            local noRes = Instance.new("TextLabel")
            noRes.Parent = SearchResults
            noRes.Size = UDim2.new(1, 0, 0, 32)
            noRes.BackgroundTransparency = 1
            noRes.Text = "  No results found"
            noRes.Font = FONT_PRIMARY
            noRes.TextSize = 13
            noRes.TextColor3 = currentTheme.DimText
            noRes.TextXAlignment = Enum.TextXAlignment.Left
            noRes.ZIndex = 53
        end
    end)

    local KeyboardFrame = Instance.new("Frame")
    KeyboardFrame.Name = "KeyboardVisualizer"
    KeyboardFrame.Parent = ScreenGui
    KeyboardFrame.Size = UDim2.new(0, 640, 0, 240)
    KeyboardFrame.Position = UDim2.new(0.5, -320, 1, -255)
    KeyboardFrame.BackgroundColor3 = currentTheme.Main
    KeyboardFrame.BackgroundTransparency = 0.05
    KeyboardFrame.Visible = false
    KeyboardFrame.ZIndex = 30
    CreateCorner(KeyboardFrame, 12)
    local kbStroke = CreateStroke(KeyboardFrame, currentTheme.Stroke, 1)

    local KbTitle = Instance.new("TextLabel")
    KbTitle.Parent = KeyboardFrame
    KbTitle.Size = UDim2.new(1, -200, 0, 25)
    KbTitle.Position = UDim2.new(0, 12, 0, 5)
    KbTitle.BackgroundTransparency = 1
    KbTitle.Text = "KEYBOARD VISUALIZER"
    KbTitle.Font = FONT_BOLD
    KbTitle.TextSize = 11
    KbTitle.TextColor3 = currentTheme.Accent
    KbTitle.TextXAlignment = Enum.TextXAlignment.Left
    KbTitle.ZIndex = 31

    local KbBindsLabel = Instance.new("TextLabel")
    KbBindsLabel.Parent = KeyboardFrame
    KbBindsLabel.Size = UDim2.new(0, 180, 0, 25)
    KbBindsLabel.Position = UDim2.new(1, -190, 0, 5)
    KbBindsLabel.BackgroundTransparency = 1
    KbBindsLabel.Text = "BINDS"
    KbBindsLabel.Font = FONT_BOLD
    KbBindsLabel.TextSize = 11
    KbBindsLabel.TextColor3 = currentTheme.Accent
    KbBindsLabel.TextXAlignment = Enum.TextXAlignment.Left
    KbBindsLabel.ZIndex = 31

    local KbBindsList = Instance.new("ScrollingFrame")
    KbBindsList.Parent = KeyboardFrame
    KbBindsList.Size = UDim2.new(0, 175, 1, -35)
    KbBindsList.Position = UDim2.new(1, -185, 0, 30)
    KbBindsList.BackgroundColor3 = currentTheme.Card
    KbBindsList.BackgroundTransparency = 0.5
    KbBindsList.BorderSizePixel = 0
    KbBindsList.ScrollBarThickness = 2
    KbBindsList.ScrollBarImageColor3 = currentTheme.Accent
    KbBindsList.AutomaticCanvasSize = Enum.AutomaticSize.Y
    KbBindsList.CanvasSize = UDim2.new(0, 0, 0, 0)
    KbBindsList.ZIndex = 31
    CreateCorner(KbBindsList, 8)

    local kbBindsLayout = Instance.new("UIListLayout")
    kbBindsLayout.Parent = KbBindsList
    kbBindsLayout.Padding = UDim.new(0, 3)
    CreatePadding(KbBindsList, 5, 5, 5, 5)

    local KbKeysContainer = Instance.new("Frame")
    KbKeysContainer.Parent = KeyboardFrame
    KbKeysContainer.Size = UDim2.new(1, -195, 1, -35)
    KbKeysContainer.Position = UDim2.new(0, 8, 0, 30)
    KbKeysContainer.BackgroundTransparency = 1
    KbKeysContainer.ZIndex = 31

    local keyboardLayout = {
        {"Esc","F1","F2","F3","F4","F5","F6","F7","F8","F9","F10","F11","F12"},
        {"`","1","2","3","4","5","6","7","8","9","0","-","=","Back"},
        {"Tab","Q","W","E","R","T","Y","U","I","O","P","[","]","\\"},
        {"Caps","A","S","D","F","G","H","J","K","L",";","'","Enter"},
        {"Shift","Z","X","C","V","B","N","M",",",".","/","RShift"},
        {"Ctrl","Win","Alt","Space","RAlt","Fn","Menu","RCtrl"},
    }

    local keyNameToEnum = {
        ["Esc"] = Enum.KeyCode.Escape, ["F1"] = Enum.KeyCode.F1, ["F2"] = Enum.KeyCode.F2,
        ["F3"] = Enum.KeyCode.F3, ["F4"] = Enum.KeyCode.F4, ["F5"] = Enum.KeyCode.F5,
        ["F6"] = Enum.KeyCode.F6, ["F7"] = Enum.KeyCode.F7, ["F8"] = Enum.KeyCode.F8,
        ["F9"] = Enum.KeyCode.F9, ["F10"] = Enum.KeyCode.F10, ["F11"] = Enum.KeyCode.F11,
        ["F12"] = Enum.KeyCode.F12, ["`"] = Enum.KeyCode.Backquote, ["1"] = Enum.KeyCode.One,
        ["2"] = Enum.KeyCode.Two, ["3"] = Enum.KeyCode.Three, ["4"] = Enum.KeyCode.Four,
        ["5"] = Enum.KeyCode.Five, ["6"] = Enum.KeyCode.Six, ["7"] = Enum.KeyCode.Seven,
        ["8"] = Enum.KeyCode.Eight, ["9"] = Enum.KeyCode.Nine, ["0"] = Enum.KeyCode.Zero,
        ["-"] = Enum.KeyCode.Minus, ["="] = Enum.KeyCode.Equals, ["Back"] = Enum.KeyCode.Backspace,
        ["Tab"] = Enum.KeyCode.Tab, ["Q"] = Enum.KeyCode.Q, ["W"] = Enum.KeyCode.W,
        ["E"] = Enum.KeyCode.E, ["R"] = Enum.KeyCode.R, ["T"] = Enum.KeyCode.T,
        ["Y"] = Enum.KeyCode.Y, ["U"] = Enum.KeyCode.U, ["I"] = Enum.KeyCode.I,
        ["O"] = Enum.KeyCode.O, ["P"] = Enum.KeyCode.P, ["["] = Enum.KeyCode.LeftBracket,
        ["]"] = Enum.KeyCode.RightBracket, ["\\"] = Enum.KeyCode.BackSlash,
        ["Caps"] = Enum.KeyCode.CapsLock, ["A"] = Enum.KeyCode.A, ["S"] = Enum.KeyCode.S,
        ["D"] = Enum.KeyCode.D, ["F"] = Enum.KeyCode.F, ["G"] = Enum.KeyCode.G,
        ["H"] = Enum.KeyCode.H, ["J"] = Enum.KeyCode.J, ["K"] = Enum.KeyCode.K,
        ["L"] = Enum.KeyCode.L, [";"] = Enum.KeyCode.Semicolon, ["'"] = Enum.KeyCode.Quote,
        ["Enter"] = Enum.KeyCode.Return, ["Shift"] = Enum.KeyCode.LeftShift,
        ["Z"] = Enum.KeyCode.Z, ["X"] = Enum.KeyCode.X, ["C"] = Enum.KeyCode.C,
        ["V"] = Enum.KeyCode.V, ["B"] = Enum.KeyCode.B, ["N"] = Enum.KeyCode.N,
        ["M"] = Enum.KeyCode.M, [","] = Enum.KeyCode.Comma, ["."] = Enum.KeyCode.Period,
        ["/"] = Enum.KeyCode.Slash, ["RShift"] = Enum.KeyCode.RightShift,
        ["Ctrl"] = Enum.KeyCode.LeftControl, ["Win"] = Enum.KeyCode.LeftSuper,
        ["Alt"] = Enum.KeyCode.LeftAlt, ["Space"] = Enum.KeyCode.Space,
        ["RAlt"] = Enum.KeyCode.RightAlt, ["Fn"] = Enum.KeyCode.Unknown,
        ["Menu"] = Enum.KeyCode.Menu, ["RCtrl"] = Enum.KeyCode.RightControl,
    }

    local wideKeys = {
        ["Back"] = 55, ["Tab"] = 50, ["\\"] = 35, ["Caps"] = 55,
        ["Enter"] = 60, ["Shift"] = 70, ["RShift"] = 70,
        ["Space"] = 200, ["Ctrl"] = 45, ["RCtrl"] = 45,
    }

    local keyButtons = {}

    for rowIdx, row in ipairs(keyboardLayout) do
        local xOffset = 0
        for _, keyName in ipairs(row) do
            local width = wideKeys[keyName] or 28
            local kb = Instance.new("Frame")
            kb.Parent = KbKeysContainer
            kb.Size = UDim2.new(0, width, 0, 28)
            kb.Position = UDim2.new(0, xOffset, 0, (rowIdx - 1) * 32)
            kb.BackgroundColor3 = currentTheme.Card
            kb.ZIndex = 32
            CreateCorner(kb, 6)
            CreateStroke(kb, currentTheme.Stroke, 1)

            local kl = Instance.new("TextLabel")
            kl.Parent = kb
            kl.Size = UDim2.new(1, 0, 1, 0)
            kl.BackgroundTransparency = 1
            kl.Text = keyName
            kl.Font = FONT_PRIMARY
            kl.TextSize = width > 40 and 10 or 11
            kl.TextColor3 = currentTheme.DimText
            kl.ZIndex = 33

            local keyEnum = keyNameToEnum[keyName]
            if keyEnum then
                keyButtons[keyEnum] = {Frame = kb, Label = kl, Name = keyName}
            end

            xOffset = xOffset + width + 3
        end
    end

    UserInputService.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Keyboard then
            local kb = keyButtons[input.KeyCode]
            if kb and KeyboardFrame.Visible then
                PlayTween(kb.Frame, {BackgroundColor3 = currentTheme.Accent}, 0.08)
                PlayTween(kb.Label, {TextColor3 = currentTheme.Main}, 0.08)
            end
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Keyboard then
            local kb = keyButtons[input.KeyCode]
            if kb and KeyboardFrame.Visible then
                PlayTween(kb.Frame, {BackgroundColor3 = currentTheme.Card}, 0.2)
                PlayTween(kb.Label, {TextColor3 = currentTheme.DimText}, 0.2)
            end
        end
    end)

    local function UpdateBindsList()
        for _, c in pairs(KbBindsList:GetChildren()) do
            if c:IsA("Frame") then c:Destroy() end
        end
        for _, bind in pairs(Window.Keybinds) do
            local bf = Instance.new("Frame")
            bf.Parent = KbBindsList
            bf.Size = UDim2.new(1, 0, 0, 24)
            bf.BackgroundColor3 = currentTheme.ElementBg
            bf.ZIndex = 32
            CreateCorner(bf, 6)

            local bKey = Instance.new("TextLabel")
            bKey.Parent = bf
            bKey.Size = UDim2.new(0, 40, 1, 0)
            bKey.Position = UDim2.new(0, 5, 0, 0)
            bKey.BackgroundTransparency = 1
            bKey.Text = "[" .. bind.Key .. "]"
            bKey.Font = FONT_BOLD
            bKey.TextSize = 10
            bKey.TextColor3 = currentTheme.Accent
            bKey.TextXAlignment = Enum.TextXAlignment.Left
            bKey.ZIndex = 33

            local bName = Instance.new("TextLabel")
            bName.Parent = bf
            bName.Size = UDim2.new(1, -48, 1, 0)
            bName.Position = UDim2.new(0, 46, 0, 0)
            bName.BackgroundTransparency = 1
            bName.Text = bind.Name
            bName.Font = FONT_PRIMARY
            bName.TextSize = 10
            bName.TextColor3 = currentTheme.Text
            bName.TextXAlignment = Enum.TextXAlignment.Left
            bName.TextTruncate = Enum.TextTruncate.AtEnd
            bName.ZIndex = 33
        end
    end

    function Window:ShowKeyboard()
        KeyboardFrame.Visible = true
        UpdateBindsList()
    end

    function Window:HideKeyboard() KeyboardFrame.Visible = false end

    function Window:RegisterKeybind(name, keyCode)
        table.insert(Window.Keybinds, {Name = name, Key = keyCode.Name})
        if KeyboardFrame.Visible then UpdateBindsList() end
    end

    local kbDrag = false
    local kbDragStart, kbStartPos
    KeyboardFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            kbDrag = true
            kbDragStart = input.Position
            kbStartPos = KeyboardFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then kbDrag = false end
            end)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if kbDrag and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - kbDragStart
            KeyboardFrame.Position = UDim2.new(kbStartPos.X.Scale, kbStartPos.X.Offset + delta.X, kbStartPos.Y.Scale, kbStartPos.Y.Offset + delta.Y)
        end
    end)

    UserInputService.InputBegan:Connect(function(input, processed)
        if not processed and input.KeyCode == toggleKey then
            Window:Toggle()
        end
        if input.KeyCode == searchKey and (UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or UserInputService:IsKeyDown(Enum.KeyCode.RightControl)) then
            if searchOpen then CloseSearch() else OpenSearch() end
        end
    end)

function Window:Toggle()
    Window.Visible = not Window.Visible
    PlaySound("Click", 0.2)
    if Window.Visible then
        GlowFrame.Visible = true
        MainFrame.BackgroundTransparency = 1
        GlowFrame.BackgroundTransparency = 1
        PlayTween(MainFrame, {BackgroundTransparency = 0}, 0.3)
        PlayTween(GlowFrame, {BackgroundTransparency = 0.7}, 0.3)
        OpenButton.Visible = false
        for _, qd in pairs(Window.QuickButtons) do
            qd.Button.Visible = false
        end
    else
        PlayTween(MainFrame, {BackgroundTransparency = 1}, 0.3)
        PlayTween(GlowFrame, {BackgroundTransparency = 1}, 0.3)
        task.delay(0.3, function()
            if not Window.Visible then
                GlowFrame.Visible = false
                OpenButton.Visible = true
                for _, qd in pairs(Window.QuickButtons) do
                    qd.Button.Visible = true
                end
            end
        end)
    end
end

function Window:ShowQuickButtons()
    for _, qd in pairs(Window.QuickButtons) do
        qd.Button.Visible = true
    end
end

function Window:HideQuickButtons()
    for _, qd in pairs(Window.QuickButtons) do
        qd.Button.Visible = false
    end
end

    function Window:Destroy() ScreenGui:Destroy() end

    function Window:SetSFX(enabled)
        SFXEnabled = enabled
        Window.SFXEnabled = enabled
    end

    function Window:SetTheme(name)
        if not Themes[name] then return end
        currentTheme = Themes[name]
        Window.CurrentThemeName = name
        local d = 0.4
        PlayTween(MainFrame, {BackgroundColor3 = currentTheme.Main}, d)
        PlayTween(Sidebar, {BackgroundColor3 = currentTheme.Sidebar}, d)
        PlayTween(TopBar, {BackgroundColor3 = currentTheme.TopBar}, d)
        PlayTween(TopBarCornerFix, {BackgroundColor3 = currentTheme.TopBar}, d)
        PlayTween(TopBarLine, {BackgroundColor3 = currentTheme.Stroke}, d)
        PlayTween(SidebarLine, {BackgroundColor3 = currentTheme.Stroke}, d)
        PlayTween(FooterLine, {BackgroundColor3 = currentTheme.Stroke}, d)
        PlayTween(mainStroke, {Color = currentTheme.Stroke}, d)
        PlayTween(Logo, {TextColor3 = currentTheme.Accent}, d)
        PlayTween(VersionLabel, {TextColor3 = currentTheme.DimText}, d)
        PlayTween(GlowFrame, {BackgroundColor3 = currentTheme.Glow}, d)
        PlayTween(OpenButton, {BackgroundColor3 = currentTheme.Main, TextColor3 = currentTheme.Accent}, d)
        PlayTween(OpenStroke, {Color = currentTheme.Accent}, d)
        PlayTween(FooterAvatar, {BackgroundColor3 = currentTheme.Main}, d)
        PlayTween(footerAvStroke, {Color = currentTheme.Accent}, d)
        PlayTween(FooterName, {TextColor3 = currentTheme.Text}, d)
        PlayTween(FooterTag, {TextColor3 = currentTheme.DimText}, d)
        PlayTween(WatermarkFrame, {BackgroundColor3 = currentTheme.Main}, d)
        PlayTween(wmStroke, {Color = currentTheme.Stroke}, d)
        PlayTween(WmText, {TextColor3 = currentTheme.Text}, d)
        PlayTween(KeyboardFrame, {BackgroundColor3 = currentTheme.Main}, d)
        PlayTween(kbStroke, {Color = currentTheme.Stroke}, d)
        PlayTween(KbTitle, {TextColor3 = currentTheme.Accent}, d)
        PlayTween(SearchFrame, {BackgroundColor3 = currentTheme.Main}, d)
        PlayTween(searchStroke, {Color = currentTheme.Accent}, d)
        PlayTween(SearchInput, {TextColor3 = currentTheme.Text}, d)
        for _, kb in pairs(keyButtons) do
            PlayTween(kb.Frame, {BackgroundColor3 = currentTheme.Card}, d)
            PlayTween(kb.Label, {TextColor3 = currentTheme.DimText}, d)
        end
        for _, obj in pairs(Window.ThemeObjects) do
            if obj.Instance and obj.Instance.Parent then
                local props = {}
                for prop, themeKey in pairs(obj.Props) do
                    if currentTheme[themeKey] then props[prop] = currentTheme[themeKey] end
                end
                if next(props) then PlayTween(obj.Instance, props, d) end
                if obj.Direct then
                    for prop, themeKey in pairs(obj.Direct) do
                        if currentTheme[themeKey] then obj.Instance[prop] = currentTheme[themeKey] end
                    end
                end
            end
        end
    end

    function Window:RegisterThemeObject(instance, tweenProps, directProps)
        table.insert(Window.ThemeObjects, {Instance = instance, Props = tweenProps or {}, Direct = directProps or {}})
    end

    function Window:Notify(cfg)
        cfg = cfg or {}
        local text = cfg.Text or "Notification"
        local duration = cfg.Duration or 3
        local nType = cfg.Type or "info"
        local typeColors = {
            info = currentTheme.Accent,
            success = Color3.fromRGB(100, 255, 120),
            warning = Color3.fromRGB(255, 200, 50),
            error = Color3.fromRGB(255, 80, 80),
        }
        local typeIcons = {info = "ℹ", success = "✓", warning = "⚠", error = "✗"}
        local accentColor = typeColors[nType] or currentTheme.Accent
        local icon = typeIcons[nType] or "ℹ"

        PlaySound(nType == "success" and "Success" or (nType == "error" and "Error" or "Notify"), 0.3)

        local notif = Instance.new("Frame")
        notif.Parent = ScreenGui
        notif.Size = UDim2.new(0, 310, 0, 52)
        notif.Position = UDim2.new(1, 0, 1, -68)
        notif.BackgroundColor3 = currentTheme.Card
        notif.ZIndex = 20
        CreateCorner(notif, 10)
        CreateStroke(notif, accentColor, 1)

        local accentBar = Instance.new("Frame")
        accentBar.Parent = notif
        accentBar.Size = UDim2.new(0, 3, 1, -12)
        accentBar.Position = UDim2.new(0, 6, 0, 6)
        accentBar.BackgroundColor3 = accentColor
        accentBar.BorderSizePixel = 0
        accentBar.ZIndex = 21
        CreateCorner(accentBar, 2)

        local nIcon = Instance.new("TextLabel")
        nIcon.Parent = notif
        nIcon.Size = UDim2.new(0, 20, 1, 0)
        nIcon.Position = UDim2.new(0, 16, 0, 0)
        nIcon.BackgroundTransparency = 1
        nIcon.Text = icon
        nIcon.Font = FONT_PRIMARY
        nIcon.TextSize = 16
        nIcon.TextColor3 = accentColor
        nIcon.ZIndex = 21

        local nLabel = Instance.new("TextLabel")
        nLabel.Parent = notif
        nLabel.Size = UDim2.new(1, -48, 1, -10)
        nLabel.Position = UDim2.new(0, 42, 0, 0)
        nLabel.BackgroundTransparency = 1
        nLabel.Font = FONT_PRIMARY
        nLabel.TextSize = 13
        nLabel.Text = text
        nLabel.TextColor3 = currentTheme.Text
        nLabel.TextXAlignment = Enum.TextXAlignment.Left
        nLabel.TextWrapped = true
        nLabel.ZIndex = 21

        local progressBar = Instance.new("Frame")
        progressBar.Parent = notif
        progressBar.Size = UDim2.new(1, -12, 0, 2)
        progressBar.Position = UDim2.new(0, 6, 1, -6)
        progressBar.BackgroundColor3 = accentColor
        progressBar.BorderSizePixel = 0
        progressBar.ZIndex = 21
        CreateCorner(progressBar, 1)

        PlayTween(notif, {Position = UDim2.new(1, -325, 1, -68)}, 0.4)
        PlayTween(progressBar, {Size = UDim2.new(0, 0, 0, 2)}, duration)
        task.delay(duration, function()
            PlayTween(notif, {Position = UDim2.new(1, 10, 1, -68)}, 0.4)
            task.delay(0.45, function() notif:Destroy() end)
        end)
    end

    function Window:CreateTab(tabConfig)
        tabConfig = tabConfig or {}
        local tabName = tabConfig.Name or "Tab"
        local tabIcon = tabConfig.Icon or "•"
        local Tab = {}
        Tab.Name = tabName
        Tab.Elements = {}
        Tab.Active = false

        local Page = Instance.new("ScrollingFrame")
        Page.Name = tabName
        Page.Parent = PageContainer
        Page.BackgroundTransparency = 1
        Page.Size = UDim2.new(1, 0, 1, 0)
        Page.ScrollBarThickness = 3
        Page.ScrollBarImageColor3 = currentTheme.Accent
        Page.BorderSizePixel = 0
        Page.Visible = false
        Page.CanvasSize = UDim2.new(0, 0, 0, 0)
        Page.AutomaticCanvasSize = Enum.AutomaticSize.Y

        local pageLayout = Instance.new("UIListLayout")
        pageLayout.Parent = Page
        pageLayout.Padding = UDim.new(0, 10)
        pageLayout.SortOrder = Enum.SortOrder.LayoutOrder
        CreatePadding(Page, 15, 15, 18, 18)
        Tab.Page = Page

        local sideBtn = Instance.new("TextButton")
        sideBtn.Parent = SidebarList
        sideBtn.Size = UDim2.new(1, 0, 0, 40)
        sideBtn.BackgroundColor3 = currentTheme.ElementBg
        sideBtn.BackgroundTransparency = 0.6
        sideBtn.Text = ""
        sideBtn.AutoButtonColor = false
        CreateCorner(sideBtn, 10)

        local tabIconLabel = Instance.new("TextLabel")
        tabIconLabel.Parent = sideBtn
        tabIconLabel.Size = UDim2.new(0, 28, 1, 0)
        tabIconLabel.Position = UDim2.new(0, 10, 0, 0)
        tabIconLabel.BackgroundTransparency = 1
        tabIconLabel.Text = tabIcon
        tabIconLabel.Font = FONT_PRIMARY
        tabIconLabel.TextSize = 15
        tabIconLabel.TextColor3 = currentTheme.DimText
        tabIconLabel.TextXAlignment = Enum.TextXAlignment.Center

        local tabNameLabel = Instance.new("TextLabel")
        tabNameLabel.Parent = sideBtn
        tabNameLabel.Size = UDim2.new(1, -46, 1, 0)
        tabNameLabel.Position = UDim2.new(0, 42, 0, 0)
        tabNameLabel.BackgroundTransparency = 1
        tabNameLabel.Text = tabName
        tabNameLabel.Font = FONT_BOLD
        tabNameLabel.TextSize = 13
        tabNameLabel.TextColor3 = currentTheme.DimText
        tabNameLabel.TextXAlignment = Enum.TextXAlignment.Left

        Tab.SideBtn = sideBtn
        Tab.IconLabel = tabIconLabel
        Tab.NameLabel = tabNameLabel

        sideBtn.MouseEnter:Connect(function()
            if not Tab.Active then
                PlayTween(sideBtn, {BackgroundTransparency = 0.3, BackgroundColor3 = currentTheme.Hover}, 0.2)
                PlayTween(tabIconLabel, {TextColor3 = currentTheme.Text}, 0.2)
                PlayTween(tabNameLabel, {TextColor3 = currentTheme.Text}, 0.2)
            end
        end)
        sideBtn.MouseLeave:Connect(function()
            if not Tab.Active then
                PlayTween(sideBtn, {BackgroundTransparency = 0.6, BackgroundColor3 = currentTheme.ElementBg}, 0.2)
                PlayTween(tabIconLabel, {TextColor3 = currentTheme.DimText}, 0.2)
                PlayTween(tabNameLabel, {TextColor3 = currentTheme.DimText}, 0.2)
            end
        end)

        local function ActivateTab()
            PlaySound("TabSwitch", 0.2)
            for _, t in pairs(Window.Tabs) do
                t.Active = false
                t.Page.Visible = false
                PlayTween(t.SideBtn, {BackgroundTransparency = 0.6, BackgroundColor3 = currentTheme.ElementBg}, 0.2)
                PlayTween(t.IconLabel, {TextColor3 = currentTheme.DimText}, 0.2)
                PlayTween(t.NameLabel, {TextColor3 = currentTheme.DimText}, 0.2)
            end
            Tab.Active = true
            Page.Visible = true
            PlayTween(sideBtn, {BackgroundTransparency = 0, BackgroundColor3 = currentTheme.Accent}, 0.2)
            PlayTween(tabIconLabel, {TextColor3 = currentTheme.Main}, 0.2)
            PlayTween(tabNameLabel, {TextColor3 = currentTheme.Main}, 0.2)
        end

        Tab.Activate = ActivateTab
        sideBtn.MouseButton1Click:Connect(ActivateTab)

        if #Window.Tabs == 0 then
            Tab.Active = true
            Page.Visible = true
            sideBtn.BackgroundTransparency = 0
            sideBtn.BackgroundColor3 = currentTheme.Accent
            tabIconLabel.TextColor3 = currentTheme.Main
            tabNameLabel.TextColor3 = currentTheme.Main
        end

        table.insert(Window.Tabs, Tab)
        table.insert(Window.TabButtons, sideBtn)

        function Tab:AddWelcomeCard()
            local card = Instance.new("Frame")
            card.Parent = Page
            card.Size = UDim2.new(1, 0, 0, 82)
            card.BackgroundColor3 = currentTheme.Card
            CreateCorner(card, 12)
            local cs = CreateStroke(card, currentTheme.Stroke, 1)

            local avatarFrame = Instance.new("Frame")
            avatarFrame.Parent = card
            avatarFrame.Size = UDim2.new(0, 56, 0, 56)
            avatarFrame.Position = UDim2.new(0, 14, 0, 13)
            avatarFrame.BackgroundTransparency = 1

            local avatar = Instance.new("ImageLabel")
            avatar.Parent = avatarFrame
            avatar.Size = UDim2.new(1, 0, 1, 0)
            avatar.Position = UDim2.new(0, 0, 0, 0)
            avatar.BackgroundColor3 = currentTheme.Main
            avatar.Image = IsAvatarReady and AvatarContent or ""
            avatar.Rotation = 0
            CreateCorner(avatar, 28)
            local avStroke = CreateStroke(avatar, currentTheme.Accent, 2)

            local avatarClickBtn = Instance.new("TextButton")
            avatarClickBtn.Parent = avatarFrame
            avatarClickBtn.Size = UDim2.new(1, 0, 1, 0)
            avatarClickBtn.BackgroundTransparency = 1
            avatarClickBtn.Text = ""
            avatarClickBtn.ZIndex = 5

            local wcClickCount = 0
            local wcAngryLabel = Instance.new("TextLabel")
            wcAngryLabel.Parent = card
            wcAngryLabel.Size = UDim2.new(1, -80, 0, 14)
            wcAngryLabel.Position = UDim2.new(0, 78, 0, 62)
            wcAngryLabel.BackgroundTransparency = 1
            wcAngryLabel.Text = ""
            wcAngryLabel.Font = FONT_PRIMARY
            wcAngryLabel.TextSize = 10
            wcAngryLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
            wcAngryLabel.TextXAlignment = Enum.TextXAlignment.Left
            wcAngryLabel.TextWrapped = true

            avatarClickBtn.MouseButton1Click:Connect(function()
                wcClickCount = wcClickCount + 1
                PlaySound("Click", 0.2)
                if wcClickCount <= 3 then
                    TweenService:Create(avatarFrame, TweenInfo.new(0.4), {Rotation = avatarFrame.Rotation + 360}):Play()
                    wcAngryLabel.Text = ""
                elseif wcClickCount <= 7 then
                    TweenService:Create(avatarFrame, TweenInfo.new(0.2), {Rotation = avatarFrame.Rotation + 720}):Play()
                    avStroke.Color = Color3.fromRGB(255, 150, 50)
                    wcAngryLabel.Text = AngryPhrases[math.random(1, #AngryPhrases)]
                    wcAngryLabel.TextColor3 = Color3.fromRGB(255, 150, 50)
                    PlaySound("Error", 0.3)
                    local orig = avatarFrame.Position
                    for i = 1, 3 do
                        PlayTween(avatarFrame, {Position = orig + UDim2.new(0, (i % 2 == 0 and -4 or 4), 0, 0)}, 0.03)
                        task.wait(0.03)
                    end
                    PlayTween(avatarFrame, {Position = orig}, 0.03)
                elseif wcClickCount <= 11 then
                    TweenService:Create(avatarFrame, TweenInfo.new(0.1), {Rotation = avatarFrame.Rotation + 1440}):Play()
                    avStroke.Color = Color3.fromRGB(255, 0, 0)
                    wcAngryLabel.Text = AngryPhrases[math.random(1, #AngryPhrases)]:upper() .. "!!!"
                    wcAngryLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
                    PlaySound("Error", 0.5)
                    local orig = avatarFrame.Position
                    for i = 1, 5 do
                        PlayTween(avatarFrame, {Position = orig + UDim2.new(0, (i % 2 == 0 and -8 or 8), 0, (i % 2 == 0 and -3 or 3))}, 0.03)
                        task.wait(0.03)
                    end
                    PlayTween(avatarFrame, {Position = orig}, 0.03)
                else
                    wcAngryLabel.Text = "💀"
                    avStroke.Color = Color3.fromRGB(80, 80, 80)
                    PlayTween(avatar, {ImageTransparency = 0.5}, 0.3)
                    task.delay(1.5, function()
                        PlayTween(avatar, {ImageTransparency = 0}, 0.5)
                        TweenService:Create(avatarFrame, TweenInfo.new(0.5), {Rotation = 0}):Play()
                        avStroke.Color = currentTheme.Accent
                        wcAngryLabel.Text = ""
                        wcClickCount = 0
                    end)
                end
            end)

            local greeting = Instance.new("TextLabel")
            greeting.Parent = card
            greeting.Size = UDim2.new(1, -82, 0, 22)
            greeting.Position = UDim2.new(0, 78, 0, 14)
            greeting.BackgroundTransparency = 1
            greeting.Font = FONT_BOLD
            greeting.TextSize = 14
            greeting.Text = GetTimeGreeting()
            greeting.TextColor3 = currentTheme.Accent
            greeting.TextXAlignment = Enum.TextXAlignment.Left

            local playerName = Instance.new("TextLabel")
            playerName.Parent = card
            playerName.Size = UDim2.new(1, -82, 0, 20)
            playerName.Position = UDim2.new(0, 78, 0, 38)
            playerName.BackgroundTransparency = 1
            playerName.Font = FONT_BOLD
            playerName.TextSize = 14
            playerName.Text = LocalPlayer.DisplayName .. "  ›  @" .. LocalPlayer.Name
            playerName.TextColor3 = currentTheme.Text
            playerName.TextXAlignment = Enum.TextXAlignment.Left

            Window:RegisterThemeObject(card, {BackgroundColor3 = "Card"}, {})
            Window:RegisterThemeObject(cs, {}, {Color = "Stroke"})
            Window:RegisterThemeObject(avatar, {BackgroundColor3 = "Main"}, {})
            Window:RegisterThemeObject(avStroke, {}, {Color = "Accent"})
            Window:RegisterThemeObject(greeting, {TextColor3 = "Accent"}, {})
            Window:RegisterThemeObject(playerName, {TextColor3 = "Text"}, {})
            return card
        end

        function Tab:AddLabel(cfg)
            cfg = cfg or {}
            local label = Instance.new("TextLabel")
            label.Parent = Page
            label.Size = UDim2.new(1, 0, 0, 24)
            label.BackgroundTransparency = 1
            label.Font = FONT_PRIMARY
            label.TextSize = 13
            label.Text = cfg.Text or "Label"
            label.TextColor3 = currentTheme.DimText
            label.TextXAlignment = Enum.TextXAlignment.Left
            Window:RegisterThemeObject(label, {TextColor3 = "DimText"}, {})
            local LabelAPI = {}
            function LabelAPI:SetText(txt) label.Text = txt end
            return LabelAPI
        end

        function Tab:AddParagraph(cfg)
            cfg = cfg or {}
            local holder = Instance.new("Frame")
            holder.Parent = Page
            holder.Size = UDim2.new(1, 0, 0, 0)
            holder.BackgroundColor3 = currentTheme.Card
            holder.AutomaticSize = Enum.AutomaticSize.Y
            CreateCorner(holder, 10)
            local hs = CreateStroke(holder, currentTheme.Stroke, 1)

            local titleLabel = Instance.new("TextLabel")
            titleLabel.Parent = holder
            titleLabel.Size = UDim2.new(1, -24, 0, 24)
            titleLabel.Position = UDim2.new(0, 12, 0, 6)
            titleLabel.BackgroundTransparency = 1
            titleLabel.Font = FONT_BOLD
            titleLabel.TextSize = 14
            titleLabel.Text = cfg.Title or "Title"
            titleLabel.TextColor3 = currentTheme.Accent
            titleLabel.TextXAlignment = Enum.TextXAlignment.Left

            local contentLabel = Instance.new("TextLabel")
            contentLabel.Parent = holder
            contentLabel.Size = UDim2.new(1, -24, 0, 0)
            contentLabel.Position = UDim2.new(0, 12, 0, 30)
            contentLabel.BackgroundTransparency = 1
            contentLabel.Font = FONT_PRIMARY
            contentLabel.TextSize = 12
            contentLabel.Text = cfg.Content or ""
            contentLabel.TextColor3 = currentTheme.Text
            contentLabel.TextXAlignment = Enum.TextXAlignment.Left
            contentLabel.TextWrapped = true
            contentLabel.AutomaticSize = Enum.AutomaticSize.Y

            Instance.new("UIPadding", holder).PaddingBottom = UDim.new(0, 12)

            Window:RegisterThemeObject(holder, {BackgroundColor3 = "Card"}, {})
            Window:RegisterThemeObject(hs, {}, {Color = "Stroke"})
            Window:RegisterThemeObject(titleLabel, {TextColor3 = "Accent"}, {})
            Window:RegisterThemeObject(contentLabel, {TextColor3 = "Text"}, {})

            local API = {}
            function API:SetTitle(t) titleLabel.Text = t end
            function API:SetContent(t) contentLabel.Text = t end
            return API
        end

        function Tab:AddButton(cfg)
            cfg = cfg or {}
            local holder = Instance.new("Frame")
            holder.Parent = Page
            holder.Size = UDim2.new(1, 0, 0, 40)
            holder.BackgroundColor3 = currentTheme.ElementBg
            CreateCorner(holder, 10)
            local hs = CreateStroke(holder, currentTheme.Stroke, 1)

            local btn = Instance.new("TextButton")
            btn.Parent = holder
            btn.Size = UDim2.new(1, 0, 1, 0)
            btn.BackgroundTransparency = 1
            btn.Font = FONT_BOLD
            btn.TextSize = 13
            btn.Text = cfg.Name or "Button"
            btn.TextColor3 = currentTheme.Text

            btn.MouseEnter:Connect(function() PlayTween(holder, {BackgroundColor3 = currentTheme.Hover}, 0.2) end)
            btn.MouseLeave:Connect(function() PlayTween(holder, {BackgroundColor3 = currentTheme.ElementBg}, 0.2) end)
            btn.MouseButton1Click:Connect(function()
                PlaySound("Click", 0.3)
                PlayTween(holder, {BackgroundColor3 = currentTheme.Accent}, 0.1)
                task.delay(0.15, function() PlayTween(holder, {BackgroundColor3 = currentTheme.ElementBg}, 0.3) end)
                if cfg.Callback then cfg.Callback() end
            end)

            table.insert(Window.SearchableElements, {Name = cfg.Name or "Button", Type = "button", TabName = tabName})
            Window:RegisterThemeObject(holder, {BackgroundColor3 = "ElementBg"}, {})
            Window:RegisterThemeObject(hs, {}, {Color = "Stroke"})
            Window:RegisterThemeObject(btn, {TextColor3 = "Text"}, {})
        end

        function Tab:AddToggle(cfg)
            cfg = cfg or {}
            local state = cfg.Default or false
            local holder = Instance.new("Frame")
            holder.Parent = Page
            holder.Size = UDim2.new(1, 0, 0, 40)
            holder.BackgroundColor3 = currentTheme.ElementBg
            CreateCorner(holder, 10)
            local hs = CreateStroke(holder, currentTheme.Stroke, 1)

            local label = Instance.new("TextLabel")
            label.Parent = holder
            label.Size = UDim2.new(1, -60, 1, 0)
            label.Position = UDim2.new(0, 14, 0, 0)
            label.BackgroundTransparency = 1
            label.Font = FONT_PRIMARY
            label.TextSize = 13
            label.Text = cfg.Name or "Toggle"
            label.TextColor3 = currentTheme.Text
            label.TextXAlignment = Enum.TextXAlignment.Left

            local toggleFrame = Instance.new("Frame")
            toggleFrame.Parent = holder
            toggleFrame.Size = UDim2.new(0, 40, 0, 22)
            toggleFrame.Position = UDim2.new(1, -52, 0.5, -11)
            toggleFrame.BackgroundColor3 = state and currentTheme.ToggleOn or currentTheme.ToggleOff
            CreateCorner(toggleFrame, 11)

            local toggleCircle = Instance.new("Frame")
            toggleCircle.Parent = toggleFrame
            toggleCircle.Size = UDim2.new(0, 18, 0, 18)
            toggleCircle.Position = state and UDim2.new(1, -20, 0, 2) or UDim2.new(0, 2, 0, 2)
            toggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            CreateCorner(toggleCircle, 9)

            local toggleBtn = Instance.new("TextButton")
            toggleBtn.Parent = holder
            toggleBtn.Size = UDim2.new(1, 0, 1, 0)
            toggleBtn.BackgroundTransparency = 1
            toggleBtn.Text = ""

            local function UpdateToggle()
                PlayTween(toggleFrame, {BackgroundColor3 = state and currentTheme.ToggleOn or currentTheme.ToggleOff}, 0.25)
                PlayTween(toggleCircle, {Position = state and UDim2.new(1, -20, 0, 2) or UDim2.new(0, 2, 0, 2)}, 0.25)
            end

            toggleBtn.MouseButton1Click:Connect(function()
                state = not state
                PlaySound("Toggle", 0.2)
                UpdateToggle()
                if cfg.Callback then cfg.Callback(state) end
            end)
            toggleBtn.MouseEnter:Connect(function() PlayTween(holder, {BackgroundColor3 = currentTheme.Hover}, 0.2) end)
            toggleBtn.MouseLeave:Connect(function() PlayTween(holder, {BackgroundColor3 = currentTheme.ElementBg}, 0.2) end)

            table.insert(Window.SearchableElements, {Name = cfg.Name or "Toggle", Type = "toggle", TabName = tabName})
            Window:RegisterThemeObject(holder, {BackgroundColor3 = "ElementBg"}, {})
            Window:RegisterThemeObject(hs, {}, {Color = "Stroke"})
            Window:RegisterThemeObject(label, {TextColor3 = "Text"}, {})

            local ToggleAPI = {}
            function ToggleAPI:Set(val) state = val UpdateToggle() if cfg.Callback then cfg.Callback(state) end end
            function ToggleAPI:Get() return state end
            return ToggleAPI
        end

        function Tab:AddSlider(cfg)
            cfg = cfg or {}
            local min = cfg.Min or 0
            local max = cfg.Max or 100
            local value = math.clamp(cfg.Default or min, min, max)
            local suffix = cfg.Suffix or ""
            local increment = cfg.Increment or 1

            local holder = Instance.new("Frame")
            holder.Parent = Page
            holder.Size = UDim2.new(1, 0, 0, 54)
            holder.BackgroundColor3 = currentTheme.ElementBg
            CreateCorner(holder, 10)
            local hs = CreateStroke(holder, currentTheme.Stroke, 1)

            local label = Instance.new("TextLabel")
            label.Parent = holder
            label.Size = UDim2.new(1, -80, 0, 22)
            label.Position = UDim2.new(0, 14, 0, 4)
            label.BackgroundTransparency = 1
            label.Font = FONT_PRIMARY
            label.TextSize = 13
            label.Text = cfg.Name or "Slider"
            label.TextColor3 = currentTheme.Text
            label.TextXAlignment = Enum.TextXAlignment.Left

            local valLabel = Instance.new("TextLabel")
            valLabel.Parent = holder
            valLabel.Size = UDim2.new(0, 70, 0, 22)
            valLabel.Position = UDim2.new(1, -82, 0, 4)
            valLabel.BackgroundTransparency = 1
            valLabel.Font = FONT_BOLD
            valLabel.TextSize = 12
            valLabel.TextColor3 = currentTheme.Accent
            valLabel.TextXAlignment = Enum.TextXAlignment.Right

            local sliderBg = Instance.new("Frame")
            sliderBg.Parent = holder
            sliderBg.Size = UDim2.new(1, -28, 0, 6)
            sliderBg.Position = UDim2.new(0, 14, 0, 34)
            sliderBg.BackgroundColor3 = currentTheme.ToggleOff
            CreateCorner(sliderBg, 3)

            local sliderFill = Instance.new("Frame")
            sliderFill.Parent = sliderBg
            sliderFill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)
            sliderFill.BackgroundColor3 = currentTheme.SliderFill
            CreateCorner(sliderFill, 3)

            local sliderKnob = Instance.new("Frame")
            sliderKnob.Parent = sliderFill
            sliderKnob.Size = UDim2.new(0, 14, 0, 14)
            sliderKnob.Position = UDim2.new(1, -7, 0.5, -7)
            sliderKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            CreateCorner(sliderKnob, 7)
            sliderKnob.ZIndex = 5

            local function UpdateSlider(newVal)
                value = math.clamp(newVal, min, max)
                value = math.floor(value / increment + 0.5) * increment
                value = math.clamp(value, min, max)
                PlayTween(sliderFill, {Size = UDim2.new((value - min) / (max - min), 0, 1, 0)}, 0.08)
                valLabel.Text = tostring(value) .. suffix
            end
            UpdateSlider(value)

            local sliding = false
            local sliderButton = Instance.new("TextButton")
            sliderButton.Parent = sliderBg
            sliderButton.Size = UDim2.new(1, 0, 1, 12)
            sliderButton.Position = UDim2.new(0, 0, 0, -6)
            sliderButton.BackgroundTransparency = 1
            sliderButton.Text = ""
            sliderButton.ZIndex = 6

            sliderButton.MouseButton1Down:Connect(function() sliding = true PlaySound("Slider", 0.15) end)
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then sliding = false end
            end)
            RunService.RenderStepped:Connect(function()
                if sliding then
                    local mx = UserInputService:GetMouseLocation().X
                    local absX = sliderBg.AbsolutePosition.X
                    local absW = sliderBg.AbsoluteSize.X
                    local pct = math.clamp((mx - absX) / absW, 0, 1)
                    UpdateSlider(min + (max - min) * pct)
                    if cfg.Callback then cfg.Callback(value) end
                end
            end)

            table.insert(Window.SearchableElements, {Name = cfg.Name or "Slider", Type = "slider", TabName = tabName})
            Window:RegisterThemeObject(holder, {BackgroundColor3 = "ElementBg"}, {})
            Window:RegisterThemeObject(hs, {}, {Color = "Stroke"})
            Window:RegisterThemeObject(label, {TextColor3 = "Text"}, {})
            Window:RegisterThemeObject(valLabel, {TextColor3 = "Accent"}, {})
            Window:RegisterThemeObject(sliderBg, {BackgroundColor3 = "ToggleOff"}, {})
            Window:RegisterThemeObject(sliderFill, {BackgroundColor3 = "SliderFill"}, {})

            local SliderAPI = {}
            function SliderAPI:Set(val) UpdateSlider(val) if cfg.Callback then cfg.Callback(value) end end
            function SliderAPI:Get() return value end
            return SliderAPI
        end

        function Tab:AddDropdown(cfg)
            cfg = cfg or {}
            local options = cfg.Options or {}
            local selected = cfg.Default or (options[1] or "")
            local isOpen = false

            local holder = Instance.new("Frame")
            holder.Parent = Page
            holder.Size = UDim2.new(1, 0, 0, 40)
            holder.BackgroundColor3 = currentTheme.ElementBg
            holder.ClipsDescendants = true
            CreateCorner(holder, 10)
            local hs = CreateStroke(holder, currentTheme.Stroke, 1)

            local header = Instance.new("TextButton")
            header.Parent = holder
            header.Size = UDim2.new(1, 0, 0, 40)
            header.BackgroundTransparency = 1
            header.Font = FONT_PRIMARY
            header.TextSize = 13
            header.TextColor3 = currentTheme.Text
            header.Text = (cfg.Name or "Dropdown") .. "  ›  " .. tostring(selected)
            header.TextXAlignment = Enum.TextXAlignment.Left
            CreatePadding(header, 0, 0, 14, 14)

            local arrow = Instance.new("TextLabel")
            arrow.Parent = holder
            arrow.Size = UDim2.new(0, 20, 0, 40)
            arrow.Position = UDim2.new(1, -32, 0, 0)
            arrow.BackgroundTransparency = 1
            arrow.Font = FONT_PRIMARY
            arrow.TextSize = 12
            arrow.Text = "▼"
            arrow.TextColor3 = currentTheme.DimText

            local optionsContainer = Instance.new("Frame")
            optionsContainer.Parent = holder
            optionsContainer.Size = UDim2.new(1, -10, 0, #options * 30)
            optionsContainer.Position = UDim2.new(0, 5, 0, 42)
            optionsContainer.BackgroundTransparency = 1

            local optLayout = Instance.new("UIListLayout")
            optLayout.Parent = optionsContainer
            optLayout.Padding = UDim.new(0, 3)

            local function CreateOptionBtn(opt)
                local optBtn = Instance.new("TextButton")
                optBtn.Parent = optionsContainer
                optBtn.Size = UDim2.new(1, 0, 0, 28)
                optBtn.BackgroundColor3 = currentTheme.Card
                optBtn.Font = FONT_PRIMARY
                optBtn.TextSize = 12
                optBtn.TextColor3 = currentTheme.Text
                optBtn.Text = opt
                CreateCorner(optBtn, 8)
                optBtn.MouseEnter:Connect(function() PlayTween(optBtn, {BackgroundColor3 = currentTheme.Hover}, 0.15) end)
                optBtn.MouseLeave:Connect(function() PlayTween(optBtn, {BackgroundColor3 = currentTheme.Card}, 0.15) end)
                optBtn.MouseButton1Click:Connect(function()
                    PlaySound("Click", 0.2)
                    selected = opt
                    header.Text = (cfg.Name or "Dropdown") .. "  ›  " .. opt
                    isOpen = false
                    PlayTween(holder, {Size = UDim2.new(1, 0, 0, 40)}, 0.25)
                    PlayTween(arrow, {Rotation = 0}, 0.25)
                    if cfg.Callback then cfg.Callback(opt) end
                end)
                Window:RegisterThemeObject(optBtn, {BackgroundColor3 = "Card", TextColor3 = "Text"}, {})
            end

            for _, opt in pairs(options) do CreateOptionBtn(opt) end

            header.MouseButton1Click:Connect(function()
                PlaySound("Click", 0.2)
                isOpen = not isOpen
                PlayTween(holder, {Size = UDim2.new(1, 0, 0, isOpen and (42 + #options * 30 + 8) or 40)}, 0.25)
                PlayTween(arrow, {Rotation = isOpen and 180 or 0}, 0.25)
            end)

            table.insert(Window.SearchableElements, {Name = cfg.Name or "Dropdown", Type = "dropdown", TabName = tabName})
            Window:RegisterThemeObject(holder, {BackgroundColor3 = "ElementBg"}, {})
            Window:RegisterThemeObject(hs, {}, {Color = "Stroke"})
            Window:RegisterThemeObject(header, {TextColor3 = "Text"}, {})
            Window:RegisterThemeObject(arrow, {TextColor3 = "DimText"}, {})

            local DropAPI = {}
            function DropAPI:Set(val) selected = val header.Text = (cfg.Name or "Dropdown") .. "  ›  " .. val if cfg.Callback then cfg.Callback(val) end end
            function DropAPI:Get() return selected end
            function DropAPI:Refresh(newOptions, newDefault)
                for _, c in pairs(optionsContainer:GetChildren()) do if c:IsA("TextButton") then c:Destroy() end end
                options = newOptions or {}
                selected = newDefault or options[1] or ""
                header.Text = (cfg.Name or "Dropdown") .. "  ›  " .. selected
                optionsContainer.Size = UDim2.new(1, -10, 0, #options * 30)
                for _, opt in pairs(options) do CreateOptionBtn(opt) end
                if isOpen then isOpen = false holder.Size = UDim2.new(1, 0, 0, 40) end
            end
            return DropAPI
        end

        function Tab:AddTextbox(cfg)
            cfg = cfg or {}
            local holder = Instance.new("Frame")
            holder.Parent = Page
            holder.Size = UDim2.new(1, 0, 0, 40)
            holder.BackgroundColor3 = currentTheme.ElementBg
            CreateCorner(holder, 10)
            local hs = CreateStroke(holder, currentTheme.Stroke, 1)

            local label = Instance.new("TextLabel")
            label.Parent = holder
            label.Size = UDim2.new(0.4, 0, 1, 0)
            label.Position = UDim2.new(0, 14, 0, 0)
            label.BackgroundTransparency = 1
            label.Font = FONT_PRIMARY
            label.TextSize = 13
            label.Text = cfg.Name or "Input"
            label.TextColor3 = currentTheme.Text
            label.TextXAlignment = Enum.TextXAlignment.Left

            local inputBox = Instance.new("TextBox")
            inputBox.Parent = holder
            inputBox.Size = UDim2.new(0.55, -14, 0, 28)
            inputBox.Position = UDim2.new(0.45, 0, 0, 6)
            inputBox.BackgroundColor3 = currentTheme.Card
            inputBox.Font = FONT_PRIMARY
            inputBox.TextSize = 12
            inputBox.TextColor3 = currentTheme.Text
            inputBox.PlaceholderText = cfg.Placeholder or "..."
            inputBox.PlaceholderColor3 = currentTheme.DimText
            inputBox.Text = cfg.Default or ""
            inputBox.ClearTextOnFocus = cfg.ClearOnFocus or false
            CreateCorner(inputBox, 8)
            local inputStroke = CreateStroke(inputBox, currentTheme.Stroke, 1)

            inputBox.Focused:Connect(function() PlayTween(inputStroke, {Color = currentTheme.Accent}, 0.2) end)
            inputBox.FocusLost:Connect(function(enterPressed)
                PlayTween(inputStroke, {Color = currentTheme.Stroke}, 0.2)
                if cfg.Callback then cfg.Callback(inputBox.Text, enterPressed) end
            end)

            table.insert(Window.SearchableElements, {Name = cfg.Name or "Input", Type = "textbox", TabName = tabName})
            Window:RegisterThemeObject(holder, {BackgroundColor3 = "ElementBg"}, {})
            Window:RegisterThemeObject(hs, {}, {Color = "Stroke"})
            Window:RegisterThemeObject(label, {TextColor3 = "Text"}, {})
            Window:RegisterThemeObject(inputBox, {BackgroundColor3 = "Card", TextColor3 = "Text", PlaceholderColor3 = "DimText"}, {})
            Window:RegisterThemeObject(inputStroke, {}, {Color = "Stroke"})

            local TbAPI = {}
            function TbAPI:SetText(txt) inputBox.Text = txt end
            function TbAPI:GetText() return inputBox.Text end
            return TbAPI
        end

        function Tab:AddKeybind(cfg)
            cfg = cfg or {}
            local currentKey = cfg.Default or Enum.KeyCode.E
            local listening = false

            local holder = Instance.new("Frame")
            holder.Parent = Page
            holder.Size = UDim2.new(1, 0, 0, 40)
            holder.BackgroundColor3 = currentTheme.ElementBg
            CreateCorner(holder, 10)
            local hs = CreateStroke(holder, currentTheme.Stroke, 1)

            local label = Instance.new("TextLabel")
            label.Parent = holder
            label.Size = UDim2.new(1, -85, 1, 0)
            label.Position = UDim2.new(0, 14, 0, 0)
            label.BackgroundTransparency = 1
            label.Font = FONT_PRIMARY
            label.TextSize = 13
            label.Text = cfg.Name or "Keybind"
            label.TextColor3 = currentTheme.Text
            label.TextXAlignment = Enum.TextXAlignment.Left

            local keyBtn = Instance.new("TextButton")
            keyBtn.Parent = holder
            keyBtn.Size = UDim2.new(0, 66, 0, 26)
            keyBtn.Position = UDim2.new(1, -78, 0, 7)
            keyBtn.BackgroundColor3 = currentTheme.Card
            keyBtn.Font = FONT_BOLD
            keyBtn.TextSize = 11
            keyBtn.TextColor3 = currentTheme.Accent
            keyBtn.Text = "[" .. currentKey.Name .. "]"
            CreateCorner(keyBtn, 8)
            local keyStroke = CreateStroke(keyBtn, currentTheme.Stroke, 1)

            Window:RegisterKeybind(cfg.Name or "Keybind", currentKey)

            keyBtn.MouseButton1Click:Connect(function()
                PlaySound("Click", 0.2)
                listening = true
                keyBtn.Text = "[...]"
                PlayTween(keyBtn, {TextColor3 = Color3.fromRGB(255, 255, 100)}, 0.2)
            end)

            UserInputService.InputBegan:Connect(function(input, processed)
                if listening and input.UserInputType == Enum.UserInputType.Keyboard then
                    listening = false
                    currentKey = input.KeyCode
                    keyBtn.Text = "[" .. currentKey.Name .. "]"
                    PlayTween(keyBtn, {TextColor3 = currentTheme.Accent}, 0.2)
                    PlaySound("Success", 0.2)
                    for i, b in pairs(Window.Keybinds) do
                        if b.Name == (cfg.Name or "Keybind") then
                            Window.Keybinds[i].Key = currentKey.Name
                            break
                        end
                    end
                    if KeyboardFrame.Visible then UpdateBindsList() end
                    if cfg.Callback then cfg.Callback(currentKey) end
                elseif not processed and not listening and input.KeyCode == currentKey then
                    if cfg.OnPress then cfg.OnPress() end
                end
            end)

            table.insert(Window.SearchableElements, {Name = cfg.Name or "Keybind", Type = "keybind", TabName = tabName})
            Window:RegisterThemeObject(holder, {BackgroundColor3 = "ElementBg"}, {})
            Window:RegisterThemeObject(hs, {}, {Color = "Stroke"})
            Window:RegisterThemeObject(label, {TextColor3 = "Text"}, {})
            Window:RegisterThemeObject(keyBtn, {BackgroundColor3 = "Card", TextColor3 = "Accent"}, {})
            Window:RegisterThemeObject(keyStroke, {}, {Color = "Stroke"})

            local KbAPI = {}
            function KbAPI:SetKey(key)
                currentKey = key
                keyBtn.Text = "[" .. key.Name .. "]"
                for i, b in pairs(Window.Keybinds) do
                    if b.Name == (cfg.Name or "Keybind") then Window.Keybinds[i].Key = key.Name break end
                end
                if KeyboardFrame.Visible then UpdateBindsList() end
            end
            function KbAPI:GetKey() return currentKey end
            return KbAPI
        end

        function Tab:AddColorPicker(cfg)
            cfg = cfg or {}
            local currentColor = cfg.Default or Color3.fromRGB(255, 0, 0)
            local isOpen = false

            local holder = Instance.new("Frame")
            holder.Parent = Page
            holder.Size = UDim2.new(1, 0, 0, 40)
            holder.BackgroundColor3 = currentTheme.ElementBg
            holder.ClipsDescendants = true
            CreateCorner(holder, 10)
            local hs = CreateStroke(holder, currentTheme.Stroke, 1)

            local label = Instance.new("TextLabel")
            label.Parent = holder
            label.Size = UDim2.new(1, -60, 0, 40)
            label.Position = UDim2.new(0, 14, 0, 0)
            label.BackgroundTransparency = 1
            label.Font = FONT_PRIMARY
            label.TextSize = 13
            label.Text = cfg.Name or "Color"
            label.TextColor3 = currentTheme.Text
            label.TextXAlignment = Enum.TextXAlignment.Left

            local preview = Instance.new("TextButton")
            preview.Parent = holder
            preview.Size = UDim2.new(0, 32, 0, 24)
            preview.Position = UDim2.new(1, -46, 0, 8)
            preview.BackgroundColor3 = currentColor
            preview.Text = ""
            CreateCorner(preview, 6)
            local previewStroke = CreateStroke(preview, currentTheme.Stroke, 1)

            local canvasHolder = Instance.new("Frame")
            canvasHolder.Parent = holder
            canvasHolder.Size = UDim2.new(1, -24, 0, 125)
            canvasHolder.Position = UDim2.new(0, 12, 0, 45)
            canvasHolder.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            CreateCorner(canvasHolder, 8)

            local whiteGrad = Instance.new("UIGradient")
            whiteGrad.Color = ColorSequence.new(Color3.new(1, 1, 1), Color3.new(1, 1, 1))
            whiteGrad.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1)})
            whiteGrad.Parent = canvasHolder

            local blackOverlay = Instance.new("Frame")
            blackOverlay.Parent = canvasHolder
            blackOverlay.Size = UDim2.new(1, 0, 1, 0)
            blackOverlay.BackgroundColor3 = Color3.new(0, 0, 0)
            CreateCorner(blackOverlay, 8)

            local blackGrad = Instance.new("UIGradient")
            blackGrad.Color = ColorSequence.new(Color3.new(0, 0, 0), Color3.new(0, 0, 0))
            blackGrad.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0)})
            blackGrad.Rotation = 90
            blackGrad.Parent = blackOverlay

            local hueBar = Instance.new("Frame")
            hueBar.Parent = holder
            hueBar.Size = UDim2.new(1, -24, 0, 14)
            hueBar.Position = UDim2.new(0, 12, 0, 175)
            CreateCorner(hueBar, 5)

            Instance.new("UIGradient", hueBar).Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromHSV(0, 1, 1)),
                ColorSequenceKeypoint.new(0.167, Color3.fromHSV(0.167, 1, 1)),
                ColorSequenceKeypoint.new(0.333, Color3.fromHSV(0.333, 1, 1)),
                ColorSequenceKeypoint.new(0.5, Color3.fromHSV(0.5, 1, 1)),
                ColorSequenceKeypoint.new(0.667, Color3.fromHSV(0.667, 1, 1)),
                ColorSequenceKeypoint.new(0.833, Color3.fromHSV(0.833, 1, 1)),
                ColorSequenceKeypoint.new(1, Color3.fromHSV(1, 1, 1)),
            })

            local hueSlider = Instance.new("TextButton")
            hueSlider.Parent = hueBar
            hueSlider.Size = UDim2.new(1, 0, 1, 0)
            hueSlider.BackgroundTransparency = 1
            hueSlider.Text = ""
            hueSlider.ZIndex = 5

            local svButton = Instance.new("TextButton")
            svButton.Parent = canvasHolder
            svButton.Size = UDim2.new(1, 0, 1, 0)
            svButton.BackgroundTransparency = 1
            svButton.Text = ""
            svButton.ZIndex = 5

            local h, s, v = Color3.toHSV(currentColor)
            local draggingSV = false
            local draggingH = false

            local function UpdateColor()
                currentColor = Color3.fromHSV(h, s, v)
                preview.BackgroundColor3 = currentColor
                canvasHolder.BackgroundColor3 = Color3.fromHSV(h, 1, 1)
                if cfg.Callback then cfg.Callback(currentColor) end
            end

            svButton.MouseButton1Down:Connect(function() draggingSV = true end)
            hueSlider.MouseButton1Down:Connect(function() draggingH = true end)
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then draggingSV = false draggingH = false end
            end)
            RunService.RenderStepped:Connect(function()
                if draggingSV then
                    local mx = UserInputService:GetMouseLocation()
                    s = math.clamp((mx.X - canvasHolder.AbsolutePosition.X) / canvasHolder.AbsoluteSize.X, 0, 1)
                    v = 1 - math.clamp((mx.Y - canvasHolder.AbsolutePosition.Y) / canvasHolder.AbsoluteSize.Y, 0, 1)
                    UpdateColor()
                end
                if draggingH then
                    local mx = UserInputService:GetMouseLocation()
                    h = math.clamp((mx.X - hueBar.AbsolutePosition.X) / hueBar.AbsoluteSize.X, 0, 1)
                    UpdateColor()
                end
            end)

            preview.MouseButton1Click:Connect(function()
                PlaySound("Click", 0.2)
                isOpen = not isOpen
                PlayTween(holder, {Size = UDim2.new(1, 0, 0, isOpen and 200 or 40)}, 0.3)
            end)

            table.insert(Window.SearchableElements, {Name = cfg.Name or "Color", Type = "colorpicker", TabName = tabName})
            Window:RegisterThemeObject(holder, {BackgroundColor3 = "ElementBg"}, {})
            Window:RegisterThemeObject(hs, {}, {Color = "Stroke"})
            Window:RegisterThemeObject(label, {TextColor3 = "Text"}, {})
            Window:RegisterThemeObject(previewStroke, {}, {Color = "Stroke"})

            local CpAPI = {}
            function CpAPI:Set(color) h, s, v = Color3.toHSV(color) UpdateColor() end
            function CpAPI:Get() return currentColor end
            return CpAPI
        end

        function Tab:AddSeparator()
            local sep = Instance.new("Frame")
            sep.Parent = Page
            sep.Size = UDim2.new(1, 0, 0, 1)
            sep.BackgroundColor3 = currentTheme.Stroke
            sep.BorderSizePixel = 0
            Window:RegisterThemeObject(sep, {BackgroundColor3 = "Stroke"}, {})
        end

        function Tab:AddSection(cfg)
            cfg = cfg or {}
            local sec = Instance.new("TextLabel")
            sec.Parent = Page
            sec.Size = UDim2.new(1, 0, 0, 26)
            sec.BackgroundTransparency = 1
            sec.Font = FONT_BOLD
            sec.TextSize = 12
            sec.Text = (cfg.Name or "SECTION"):upper()
            sec.TextColor3 = currentTheme.Accent
            sec.TextXAlignment = Enum.TextXAlignment.Left
            Window:RegisterThemeObject(sec, {TextColor3 = "Accent"}, {})
        end

        return Tab
    end

    MainFrame.BackgroundTransparency = 1
    GlowFrame.BackgroundTransparency = 1
    local origSize = GlowFrame.Size
    local origPos = GlowFrame.Position
    GlowFrame.Size = UDim2.new(0, 0, 0, 0)
    GlowFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    PlayTween(GlowFrame, {Size = origSize, Position = origPos, BackgroundTransparency = 0.7}, 0.4)
    PlayTween(MainFrame, {BackgroundTransparency = 0}, 0.4)

    return Window
end

return Nebula
