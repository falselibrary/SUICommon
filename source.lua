local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local UserId = LocalPlayer.UserId
local AvatarContent, IsAvatarReady = Players:GetUserThumbnailAsync(UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)

local Themes = {
    Dark = {
        Main = Color3.fromRGB(18, 18, 22),
        Sidebar = Color3.fromRGB(12, 12, 15),
        Stroke = Color3.fromRGB(45, 45, 55),
        Accent = Color3.fromRGB(100, 120, 255),
        Text = Color3.fromRGB(240, 240, 240),
        DimText = Color3.fromRGB(160, 160, 170),
        Card = Color3.fromRGB(25, 25, 30),
        ElementBg = Color3.fromRGB(30, 30, 38),
        SliderFill = Color3.fromRGB(100, 120, 255),
        ToggleOn = Color3.fromRGB(100, 120, 255),
        ToggleOff = Color3.fromRGB(50, 50, 60),
        Hover = Color3.fromRGB(35, 35, 45),
        Glow = Color3.fromRGB(0, 0, 0),
    },
    Cyber = {
        Main = Color3.fromRGB(5, 5, 5),
        Sidebar = Color3.fromRGB(0, 0, 0),
        Stroke = Color3.fromRGB(255, 255, 0),
        Accent = Color3.fromRGB(255, 255, 0),
        Text = Color3.fromRGB(255, 255, 0),
        DimText = Color3.fromRGB(180, 180, 0),
        Card = Color3.fromRGB(15, 15, 0),
        ElementBg = Color3.fromRGB(20, 20, 5),
        SliderFill = Color3.fromRGB(255, 255, 0),
        ToggleOn = Color3.fromRGB(255, 255, 0),
        ToggleOff = Color3.fromRGB(40, 40, 0),
        Hover = Color3.fromRGB(25, 25, 5),
        Glow = Color3.fromRGB(0, 0, 0),
    },
    Sakura = {
        Main = Color3.fromRGB(255, 240, 245),
        Sidebar = Color3.fromRGB(255, 225, 235),
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
    },
    Ocean = {
        Main = Color3.fromRGB(10, 20, 30),
        Sidebar = Color3.fromRGB(5, 15, 25),
        Stroke = Color3.fromRGB(30, 60, 90),
        Accent = Color3.fromRGB(0, 180, 255),
        Text = Color3.fromRGB(200, 240, 255),
        DimText = Color3.fromRGB(120, 170, 200),
        Card = Color3.fromRGB(20, 35, 50),
        ElementBg = Color3.fromRGB(15, 30, 45),
        SliderFill = Color3.fromRGB(0, 180, 255),
        ToggleOn = Color3.fromRGB(0, 180, 255),
        ToggleOff = Color3.fromRGB(30, 50, 65),
        Hover = Color3.fromRGB(20, 40, 55),
        Glow = Color3.fromRGB(0, 10, 20),
    },
    Forest = {
        Main = Color3.fromRGB(15, 25, 15),
        Sidebar = Color3.fromRGB(10, 20, 10),
        Stroke = Color3.fromRGB(40, 60, 40),
        Accent = Color3.fromRGB(100, 255, 100),
        Text = Color3.fromRGB(220, 255, 220),
        DimText = Color3.fromRGB(140, 180, 140),
        Card = Color3.fromRGB(25, 35, 25),
        ElementBg = Color3.fromRGB(20, 32, 20),
        SliderFill = Color3.fromRGB(100, 255, 100),
        ToggleOn = Color3.fromRGB(100, 255, 100),
        ToggleOff = Color3.fromRGB(35, 50, 35),
        Hover = Color3.fromRGB(28, 42, 28),
        Glow = Color3.fromRGB(5, 10, 5),
    },
    Gold = {
        Main = Color3.fromRGB(20, 20, 20),
        Sidebar = Color3.fromRGB(15, 15, 15),
        Stroke = Color3.fromRGB(255, 180, 0),
        Accent = Color3.fromRGB(255, 180, 0),
        Text = Color3.fromRGB(255, 220, 150),
        DimText = Color3.fromRGB(180, 150, 100),
        Card = Color3.fromRGB(30, 30, 30),
        ElementBg = Color3.fromRGB(28, 25, 20),
        SliderFill = Color3.fromRGB(255, 180, 0),
        ToggleOn = Color3.fromRGB(255, 180, 0),
        ToggleOff = Color3.fromRGB(50, 45, 30),
        Hover = Color3.fromRGB(38, 35, 25),
        Glow = Color3.fromRGB(0, 0, 0),
    },
    Light = {
        Main = Color3.fromRGB(245, 245, 250),
        Sidebar = Color3.fromRGB(230, 230, 235),
        Stroke = Color3.fromRGB(210, 210, 220),
        Accent = Color3.fromRGB(80, 100, 255),
        Text = Color3.fromRGB(30, 30, 40),
        DimText = Color3.fromRGB(100, 100, 120),
        Card = Color3.fromRGB(255, 255, 255),
        ElementBg = Color3.fromRGB(240, 240, 245),
        SliderFill = Color3.fromRGB(80, 100, 255),
        ToggleOn = Color3.fromRGB(80, 100, 255),
        ToggleOff = Color3.fromRGB(200, 200, 210),
        Hover = Color3.fromRGB(235, 235, 242),
        Glow = Color3.fromRGB(200, 200, 210),
    }
}

local function Tween(obj, props, duration)
    if type(duration) ~= "number" then duration = 0.3 end
    return TweenService:Create(obj, TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), props)
end

local function PlayTween(obj, props, duration)
    if type(duration) ~= "number" then duration = 0.3 end
    Tween(obj, props, duration):Play()
end

local function CreateCorner(parent, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius or 6)
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

function Nebula:CreateWindow(config)
    config = config or {}
    local title = config.Title or "NEBULA // SYSTEM"
    local themeName = config.Theme or "Dark"
    local sizeX = (config.Size and config.Size[1]) or 550
    local sizeY = (config.Size and config.Size[2]) or 380
    local minX = (config.MinSize and config.MinSize[1]) or 400
    local minY = (config.MinSize and config.MinSize[2]) or 280
    local toggleKey = config.ToggleKey or Enum.KeyCode.RightShift

    local currentTheme = Themes[themeName] or Themes.Dark
    local Window = {}
    Window.Tabs = {}
    Window.TabButtons = {}
    Window.ThemeObjects = {}
    Window.CurrentThemeName = themeName
    Window.Visible = true

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "NebulaUI_" .. tostring(math.random(100000, 999999))
    ScreenGui.Parent = CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    Window.ScreenGui = ScreenGui

    local OpenButton = Instance.new("TextButton")
    OpenButton.Name = "OpenButton"
    OpenButton.Parent = ScreenGui
    OpenButton.Size = UDim2.new(0, 45, 0, 45)
    OpenButton.Position = UDim2.new(0, 20, 0, 20)
    OpenButton.BackgroundColor3 = currentTheme.Main
    OpenButton.Text = "N"
    OpenButton.Font = Enum.Font.Code
    OpenButton.TextSize = 20
    OpenButton.TextColor3 = currentTheme.Accent
    OpenButton.AutoButtonColor = false
    OpenButton.Visible = false
    OpenButton.ZIndex = 10

    local OpenCorner = Instance.new("UICorner")
    OpenCorner.CornerRadius = UDim.new(1, 0)
    OpenCorner.Parent = OpenButton

    local OpenStroke = Instance.new("UIStroke")
    OpenStroke.Color = currentTheme.Accent
    OpenStroke.Thickness = 1.5
    OpenStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    OpenStroke.Parent = OpenButton

    Window.OpenButton = OpenButton
    Window.OpenStroke = OpenStroke

    OpenButton.MouseEnter:Connect(function()
        PlayTween(OpenButton, {Size = UDim2.new(0, 50, 0, 50), BackgroundColor3 = currentTheme.Accent, TextColor3 = currentTheme.Main}, 0.2)
        PlayTween(OpenStroke, {Thickness = 2.5}, 0.2)
    end)
    OpenButton.MouseLeave:Connect(function()
        PlayTween(OpenButton, {Size = UDim2.new(0, 45, 0, 45), BackgroundColor3 = currentTheme.Main, TextColor3 = currentTheme.Accent}, 0.2)
        PlayTween(OpenStroke, {Thickness = 1.5}, 0.2)
    end)

    local openDragging = false
    local openDragStart, openStartPos
    OpenButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            openDragging = true
            openDragStart = input.Position
            openStartPos = OpenButton.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then openDragging = false end
            end)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if openDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - openDragStart
            OpenButton.Position = UDim2.new(openStartPos.X.Scale, openStartPos.X.Offset + delta.X, openStartPos.Y.Scale, openStartPos.Y.Offset + delta.Y)
        end
    end)
    OpenButton.MouseButton1Click:Connect(function()
        Window:Toggle()
    end)

    local GlowFrame = Instance.new("Frame")
    GlowFrame.Name = "GlowFrame"
    GlowFrame.Parent = ScreenGui
    GlowFrame.BackgroundColor3 = currentTheme.Glow
    GlowFrame.BackgroundTransparency = 0.7
    GlowFrame.Position = UDim2.new(0.5, -math.floor(sizeX / 2), 0.5, -math.floor(sizeY / 2))
    GlowFrame.Size = UDim2.new(0, sizeX, 0, sizeY)
    CreateCorner(GlowFrame, 10)
    Window.GlowFrame = GlowFrame

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = GlowFrame
    MainFrame.BackgroundColor3 = currentTheme.Main
    MainFrame.Position = UDim2.new(0, 2, 0, 2)
    MainFrame.Size = UDim2.new(1, -4, 1, -4)
    MainFrame.ClipsDescendants = true
    CreateCorner(MainFrame, 8)
    local mainStroke = CreateStroke(MainFrame, currentTheme.Stroke, 1.5)
    Window.MainFrame = MainFrame
    Window.MainStroke = mainStroke

    local Sidebar = Instance.new("Frame")
    Sidebar.Name = "Sidebar"
    Sidebar.Parent = MainFrame
    Sidebar.BackgroundColor3 = currentTheme.Sidebar
    Sidebar.Size = UDim2.new(0, 50, 1, 0)
    local sidebarStroke = CreateStroke(Sidebar, currentTheme.Stroke, 1)
    Window.Sidebar = Sidebar
    Window.SidebarStroke = sidebarStroke

    local TabIndicator = Instance.new("Frame")
    TabIndicator.Name = "TabIndicator"
    TabIndicator.Parent = Sidebar
    TabIndicator.BackgroundColor3 = currentTheme.Accent
    TabIndicator.Position = UDim2.new(0, 0, 0, 60)
    TabIndicator.Size = UDim2.new(0, 2, 0, 32)
    Window.TabIndicator = TabIndicator

    local Logo = Instance.new("TextLabel")
    Logo.Name = "Logo"
    Logo.Parent = MainFrame
    Logo.Text = title
    Logo.Font = Enum.Font.Code
    Logo.TextSize = 16
    Logo.TextColor3 = currentTheme.Accent
    Logo.Position = UDim2.new(0, 65, 0, 0)
    Logo.Size = UDim2.new(0, 300, 0, 50)
    Logo.BackgroundTransparency = 1
    Logo.TextXAlignment = Enum.TextXAlignment.Left
    Window.Logo = Logo

    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Name = "CloseBtn"
    CloseBtn.Parent = MainFrame
    CloseBtn.Size = UDim2.new(0, 30, 0, 30)
    CloseBtn.Position = UDim2.new(1, -40, 0, 10)
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Text = "×"
    CloseBtn.Font = Enum.Font.Code
    CloseBtn.TextSize = 22
    CloseBtn.TextColor3 = currentTheme.DimText
    CloseBtn.MouseEnter:Connect(function()
        PlayTween(CloseBtn, {TextColor3 = Color3.fromRGB(255, 80, 80)}, 0.2)
    end)
    CloseBtn.MouseLeave:Connect(function()
        PlayTween(CloseBtn, {TextColor3 = currentTheme.DimText}, 0.2)
    end)
    CloseBtn.MouseButton1Click:Connect(function()
        Window:Toggle()
    end)

    local MinBtn = Instance.new("TextButton")
    MinBtn.Name = "MinBtn"
    MinBtn.Parent = MainFrame
    MinBtn.Size = UDim2.new(0, 30, 0, 30)
    MinBtn.Position = UDim2.new(1, -70, 0, 10)
    MinBtn.BackgroundTransparency = 1
    MinBtn.Text = "—"
    MinBtn.Font = Enum.Font.Code
    MinBtn.TextSize = 16
    MinBtn.TextColor3 = currentTheme.DimText
    MinBtn.MouseEnter:Connect(function()
        PlayTween(MinBtn, {TextColor3 = currentTheme.Accent}, 0.2)
    end)
    MinBtn.MouseLeave:Connect(function()
        PlayTween(MinBtn, {TextColor3 = currentTheme.DimText}, 0.2)
    end)
    MinBtn.MouseButton1Click:Connect(function()
        Window:Toggle()
    end)

    local PageContainer = Instance.new("Frame")
    PageContainer.Name = "PageContainer"
    PageContainer.Parent = MainFrame
    PageContainer.BackgroundTransparency = 1
    PageContainer.Position = UDim2.new(0, 60, 0, 50)
    PageContainer.Size = UDim2.new(1, -72, 1, -60)
    Window.PageContainer = PageContainer

    local ResizeBtn = Instance.new("TextButton")
    ResizeBtn.Name = "ResizeBtn"
    ResizeBtn.Parent = MainFrame
    ResizeBtn.Size = UDim2.new(0, 20, 0, 20)
    ResizeBtn.Position = UDim2.new(1, -20, 1, -20)
    ResizeBtn.BackgroundTransparency = 1
    ResizeBtn.Text = "⋰"
    ResizeBtn.Font = Enum.Font.Code
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
            local newX = math.max(minX, mousePos.X - framePos.X)
            local newY = math.max(minY, mousePos.Y - framePos.Y - 36)
            GlowFrame.Size = UDim2.new(0, newX, 0, newY)
        end
    end)

    local isDragging = false
    local dragStart, startPos
    MainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 and not isResizing then
            local mouseY = input.Position.Y
            local frameY = MainFrame.AbsolutePosition.Y
            if mouseY - frameY <= 50 then
                isDragging = true
                dragStart = input.Position
                startPos = GlowFrame.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then isDragging = false end
                end)
            end
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            GlowFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    UserInputService.InputBegan:Connect(function(input, processed)
        if not processed and input.KeyCode == toggleKey then
            Window:Toggle()
        end
    end)

    local tabYOffset = 60

    function Window:Toggle()
        Window.Visible = not Window.Visible
        if Window.Visible then
            GlowFrame.Visible = true
            MainFrame.BackgroundTransparency = 1
            GlowFrame.BackgroundTransparency = 1
            PlayTween(MainFrame, {BackgroundTransparency = 0}, 0.3)
            PlayTween(GlowFrame, {BackgroundTransparency = 0.7}, 0.3)
            PlayTween(OpenButton, {Size = UDim2.new(0, 0, 0, 0)}, 0.25)
            task.delay(0.25, function()
                if Window.Visible then OpenButton.Visible = false end
            end)
        else
            PlayTween(MainFrame, {BackgroundTransparency = 1}, 0.3)
            PlayTween(GlowFrame, {BackgroundTransparency = 1}, 0.3)
            task.delay(0.3, function()
                if not Window.Visible then
                    GlowFrame.Visible = false
                    OpenButton.Visible = true
                    OpenButton.Size = UDim2.new(0, 0, 0, 0)
                    PlayTween(OpenButton, {Size = UDim2.new(0, 45, 0, 45)}, 0.3)
                end
            end)
        end
    end

    function Window:Destroy()
        ScreenGui:Destroy()
    end

    function Window:SetTheme(name)
        if not Themes[name] then return end
        currentTheme = Themes[name]
        Window.CurrentThemeName = name
        local d = 0.5
        PlayTween(MainFrame, {BackgroundColor3 = currentTheme.Main}, d)
        PlayTween(Sidebar, {BackgroundColor3 = currentTheme.Sidebar}, d)
        PlayTween(mainStroke, {Color = currentTheme.Stroke}, d)
        PlayTween(sidebarStroke, {Color = currentTheme.Stroke}, d)
        PlayTween(TabIndicator, {BackgroundColor3 = currentTheme.Accent}, d)
        PlayTween(Logo, {TextColor3 = currentTheme.Accent}, d)
        PlayTween(GlowFrame, {BackgroundColor3 = currentTheme.Glow}, d)
        PlayTween(OpenButton, {BackgroundColor3 = currentTheme.Main, TextColor3 = currentTheme.Accent}, d)
        PlayTween(OpenStroke, {Color = currentTheme.Accent}, d)
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
        local notif = Instance.new("Frame")
        notif.Parent = ScreenGui
        notif.Size = UDim2.new(0, 280, 0, 40)
        notif.Position = UDim2.new(1, 0, 1, -55)
        notif.BackgroundColor3 = currentTheme.Card
        CreateCorner(notif, 6)
        CreateStroke(notif, currentTheme.Accent, 1)
        local nLabel = Instance.new("TextLabel")
        nLabel.Parent = notif
        nLabel.Size = UDim2.new(1, -16, 1, 0)
        nLabel.Position = UDim2.new(0, 8, 0, 0)
        nLabel.BackgroundTransparency = 1
        nLabel.Font = Enum.Font.Code
        nLabel.TextSize = 12
        nLabel.Text = text
        nLabel.TextColor3 = currentTheme.Text
        nLabel.TextXAlignment = Enum.TextXAlignment.Left
        nLabel.TextWrapped = true
        PlayTween(notif, {Position = UDim2.new(1, -295, 1, -55)}, 0.4)
        task.delay(duration, function()
            PlayTween(notif, {Position = UDim2.new(1, 10, 1, -55)}, 0.4)
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

        local Page = Instance.new("ScrollingFrame")
        Page.Name = tabName
        Page.Parent = PageContainer
        Page.BackgroundTransparency = 1
        Page.Size = UDim2.new(1, 0, 1, 0)
        Page.ScrollBarThickness = 2
        Page.ScrollBarImageColor3 = currentTheme.Accent
        Page.BorderSizePixel = 0
        Page.Visible = false
        Page.CanvasSize = UDim2.new(0, 0, 0, 0)
        Page.AutomaticCanvasSize = Enum.AutomaticSize.Y

        local pageLayout = Instance.new("UIListLayout")
        pageLayout.Parent = Page
        pageLayout.Padding = UDim.new(0, 8)
        pageLayout.SortOrder = Enum.SortOrder.LayoutOrder
        CreatePadding(Page, 5, 5, 10, 10)
        Tab.Page = Page

        local yPos = tabYOffset
        tabYOffset = tabYOffset + 40

        local sideBtn = Instance.new("TextButton")
        sideBtn.Parent = Sidebar
        sideBtn.Size = UDim2.new(0, 32, 0, 32)
        sideBtn.Position = UDim2.new(0.5, -16, 0, yPos)
        sideBtn.BackgroundColor3 = currentTheme.Main
        sideBtn.BackgroundTransparency = 0.96
        sideBtn.Text = tabIcon
        sideBtn.Font = Enum.Font.Code
        sideBtn.TextColor3 = currentTheme.DimText
        sideBtn.TextSize = 14
        CreateCorner(sideBtn, 6)
        sideBtn.MouseEnter:Connect(function()
            PlayTween(sideBtn, {BackgroundTransparency = 0.85}, 0.2)
        end)
        sideBtn.MouseLeave:Connect(function()
            PlayTween(sideBtn, {BackgroundTransparency = 0.96}, 0.2)
        end)
        sideBtn.MouseButton1Click:Connect(function()
            PlayTween(TabIndicator, {Position = UDim2.new(0, 0, 0, yPos)}, 0.3)
            for _, t in pairs(Window.Tabs) do t.Page.Visible = false end
            Page.Visible = true
        end)

        if #Window.Tabs == 0 then
            Page.Visible = true
            TabIndicator.Position = UDim2.new(0, 0, 0, yPos)
        end

        table.insert(Window.Tabs, Tab)
        table.insert(Window.TabButtons, sideBtn)
        Window:RegisterThemeObject(sideBtn, {BackgroundColor3 = "Main", TextColor3 = "DimText"}, {})

        function Tab:AddWelcomeCard()
            local card = Instance.new("Frame")
            card.Name = "WelcomeCard"
            card.Parent = Page
            card.Size = UDim2.new(1, 0, 0, 70)
            card.BackgroundColor3 = currentTheme.Card
            CreateCorner(card, 6)
            local cs = CreateStroke(card, currentTheme.Stroke, 1)

            local avatar = Instance.new("ImageLabel")
            avatar.Parent = card
            avatar.Size = UDim2.new(0, 50, 0, 50)
            avatar.Position = UDim2.new(0, 10, 0, 10)
            avatar.BackgroundColor3 = currentTheme.Main
            avatar.Image = IsAvatarReady and AvatarContent or ""
            CreateCorner(avatar, 25)
            local avStroke = CreateStroke(avatar, currentTheme.Accent, 2)

            local greeting = Instance.new("TextLabel")
            greeting.Parent = card
            greeting.Size = UDim2.new(1, -75, 0, 25)
            greeting.Position = UDim2.new(0, 70, 0, 12)
            greeting.BackgroundTransparency = 1
            greeting.Font = Enum.Font.Code
            greeting.TextSize = 14
            greeting.Text = GetTimeGreeting()
            greeting.TextColor3 = currentTheme.Accent
            greeting.TextXAlignment = Enum.TextXAlignment.Left

            local playerName = Instance.new("TextLabel")
            playerName.Parent = card
            playerName.Size = UDim2.new(1, -75, 0, 20)
            playerName.Position = UDim2.new(0, 70, 0, 34)
            playerName.BackgroundTransparency = 1
            playerName.Font = Enum.Font.GothamBold
            playerName.TextSize = 13
            playerName.Text = LocalPlayer.DisplayName
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
            label.Name = "Label"
            label.Parent = Page
            label.Size = UDim2.new(1, 0, 0, 25)
            label.BackgroundTransparency = 1
            label.Font = Enum.Font.Code
            label.TextSize = 13
            label.Text = cfg.Text or "Label"
            label.TextColor3 = currentTheme.DimText
            label.TextXAlignment = Enum.TextXAlignment.Left
            Window:RegisterThemeObject(label, {TextColor3 = "DimText"}, {})
            local LabelAPI = {}
            function LabelAPI:SetText(txt) label.Text = txt end
            return LabelAPI
        end

        function Tab:AddButton(cfg)
            cfg = cfg or {}
            local holder = Instance.new("Frame")
            holder.Name = "ButtonHolder"
            holder.Parent = Page
            holder.Size = UDim2.new(1, 0, 0, 36)
            holder.BackgroundColor3 = currentTheme.ElementBg
            CreateCorner(holder, 6)
            local hs = CreateStroke(holder, currentTheme.Stroke, 1)

            local btn = Instance.new("TextButton")
            btn.Name = "Button"
            btn.Parent = holder
            btn.Size = UDim2.new(1, 0, 1, 0)
            btn.BackgroundTransparency = 1
            btn.Font = Enum.Font.Code
            btn.TextSize = 13
            btn.Text = cfg.Name or "Button"
            btn.TextColor3 = currentTheme.Text

            btn.MouseEnter:Connect(function()
                PlayTween(holder, {BackgroundColor3 = currentTheme.Hover}, 0.2)
            end)
            btn.MouseLeave:Connect(function()
                PlayTween(holder, {BackgroundColor3 = currentTheme.ElementBg}, 0.2)
            end)
            btn.MouseButton1Click:Connect(function()
                PlayTween(holder, {BackgroundColor3 = currentTheme.Accent}, 0.1)
                task.delay(0.15, function()
                    PlayTween(holder, {BackgroundColor3 = currentTheme.ElementBg}, 0.3)
                end)
                if cfg.Callback then cfg.Callback() end
            end)

            Window:RegisterThemeObject(holder, {BackgroundColor3 = "ElementBg"}, {})
            Window:RegisterThemeObject(hs, {}, {Color = "Stroke"})
            Window:RegisterThemeObject(btn, {TextColor3 = "Text"}, {})
        end

        function Tab:AddToggle(cfg)
            cfg = cfg or {}
            local state = cfg.Default or false
            local holder = Instance.new("Frame")
            holder.Name = "ToggleHolder"
            holder.Parent = Page
            holder.Size = UDim2.new(1, 0, 0, 36)
            holder.BackgroundColor3 = currentTheme.ElementBg
            CreateCorner(holder, 6)
            local hs = CreateStroke(holder, currentTheme.Stroke, 1)

            local label = Instance.new("TextLabel")
            label.Parent = holder
            label.Size = UDim2.new(1, -60, 1, 0)
            label.Position = UDim2.new(0, 12, 0, 0)
            label.BackgroundTransparency = 1
            label.Font = Enum.Font.Code
            label.TextSize = 13
            label.Text = cfg.Name or "Toggle"
            label.TextColor3 = currentTheme.Text
            label.TextXAlignment = Enum.TextXAlignment.Left

            local toggleFrame = Instance.new("Frame")
            toggleFrame.Parent = holder
            toggleFrame.Size = UDim2.new(0, 38, 0, 20)
            toggleFrame.Position = UDim2.new(1, -50, 0.5, -10)
            toggleFrame.BackgroundColor3 = state and currentTheme.ToggleOn or currentTheme.ToggleOff
            CreateCorner(toggleFrame, 10)

            local toggleCircle = Instance.new("Frame")
            toggleCircle.Parent = toggleFrame
            toggleCircle.Size = UDim2.new(0, 16, 0, 16)
            toggleCircle.Position = state and UDim2.new(1, -18, 0, 2) or UDim2.new(0, 2, 0, 2)
            toggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            CreateCorner(toggleCircle, 8)

            local toggleBtn = Instance.new("TextButton")
            toggleBtn.Parent = holder
            toggleBtn.Size = UDim2.new(1, 0, 1, 0)
            toggleBtn.BackgroundTransparency = 1
            toggleBtn.Text = ""

            local function UpdateToggle()
                PlayTween(toggleFrame, {BackgroundColor3 = state and currentTheme.ToggleOn or currentTheme.ToggleOff}, 0.25)
                PlayTween(toggleCircle, {Position = state and UDim2.new(1, -18, 0, 2) or UDim2.new(0, 2, 0, 2)}, 0.25)
            end

            toggleBtn.MouseButton1Click:Connect(function()
                state = not state
                UpdateToggle()
                if cfg.Callback then cfg.Callback(state) end
            end)
            toggleBtn.MouseEnter:Connect(function()
                PlayTween(holder, {BackgroundColor3 = currentTheme.Hover}, 0.2)
            end)
            toggleBtn.MouseLeave:Connect(function()
                PlayTween(holder, {BackgroundColor3 = currentTheme.ElementBg}, 0.2)
            end)

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
            holder.Name = "SliderHolder"
            holder.Parent = Page
            holder.Size = UDim2.new(1, 0, 0, 50)
            holder.BackgroundColor3 = currentTheme.ElementBg
            CreateCorner(holder, 6)
            local hs = CreateStroke(holder, currentTheme.Stroke, 1)

            local label = Instance.new("TextLabel")
            label.Parent = holder
            label.Size = UDim2.new(1, -70, 0, 22)
            label.Position = UDim2.new(0, 12, 0, 2)
            label.BackgroundTransparency = 1
            label.Font = Enum.Font.Code
            label.TextSize = 12
            label.Text = cfg.Name or "Slider"
            label.TextColor3 = currentTheme.Text
            label.TextXAlignment = Enum.TextXAlignment.Left

            local valLabel = Instance.new("TextLabel")
            valLabel.Parent = holder
            valLabel.Size = UDim2.new(0, 60, 0, 22)
            valLabel.Position = UDim2.new(1, -70, 0, 2)
            valLabel.BackgroundTransparency = 1
            valLabel.Font = Enum.Font.Code
            valLabel.TextSize = 12
            valLabel.TextColor3 = currentTheme.Accent
            valLabel.TextXAlignment = Enum.TextXAlignment.Right

            local sliderBg = Instance.new("Frame")
            sliderBg.Parent = holder
            sliderBg.Size = UDim2.new(1, -24, 0, 6)
            sliderBg.Position = UDim2.new(0, 12, 0, 32)
            sliderBg.BackgroundColor3 = currentTheme.ToggleOff
            CreateCorner(sliderBg, 3)

            local sliderFill = Instance.new("Frame")
            sliderFill.Parent = sliderBg
            sliderFill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)
            sliderFill.BackgroundColor3 = currentTheme.SliderFill
            CreateCorner(sliderFill, 3)

            local sliderKnob = Instance.new("Frame")
            sliderKnob.Parent = sliderFill
            sliderKnob.Size = UDim2.new(0, 12, 0, 12)
            sliderKnob.Position = UDim2.new(1, -6, 0.5, -6)
            sliderKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            CreateCorner(sliderKnob, 6)
            sliderKnob.ZIndex = 5

            local function UpdateSlider(newVal)
                value = math.clamp(newVal, min, max)
                value = math.floor(value / increment + 0.5) * increment
                value = math.clamp(value, min, max)
                local pct = (value - min) / (max - min)
                PlayTween(sliderFill, {Size = UDim2.new(pct, 0, 1, 0)}, 0.08)
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

            sliderButton.MouseButton1Down:Connect(function() sliding = true end)
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then sliding = false end
            end)
            RunService.RenderStepped:Connect(function()
                if sliding then
                    local mx = UserInputService:GetMouseLocation().X
                    local absX = sliderBg.AbsolutePosition.X
                    local absW = sliderBg.AbsoluteSize.X
                    local pct = math.clamp((mx - absX) / absW, 0, 1)
                    local newVal = min + (max - min) * pct
                    UpdateSlider(newVal)
                    if cfg.Callback then cfg.Callback(value) end
                end
            end)

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
            holder.Name = "DropdownHolder"
            holder.Parent = Page
            holder.Size = UDim2.new(1, 0, 0, 36)
            holder.BackgroundColor3 = currentTheme.ElementBg
            holder.ClipsDescendants = true
            CreateCorner(holder, 6)
            local hs = CreateStroke(holder, currentTheme.Stroke, 1)

            local header = Instance.new("TextButton")
            header.Parent = holder
            header.Size = UDim2.new(1, 0, 0, 36)
            header.BackgroundTransparency = 1
            header.Font = Enum.Font.Code
            header.TextSize = 13
            header.TextColor3 = currentTheme.Text
            header.Text = (cfg.Name or "Dropdown") .. ": " .. tostring(selected)
            header.TextXAlignment = Enum.TextXAlignment.Left
            CreatePadding(header, 0, 0, 12, 12)

            local arrow = Instance.new("TextLabel")
            arrow.Parent = holder
            arrow.Size = UDim2.new(0, 20, 0, 36)
            arrow.Position = UDim2.new(1, -30, 0, 0)
            arrow.BackgroundTransparency = 1
            arrow.Font = Enum.Font.Code
            arrow.TextSize = 12
            arrow.Text = "▼"
            arrow.TextColor3 = currentTheme.DimText

            local optionsContainer = Instance.new("Frame")
            optionsContainer.Parent = holder
            optionsContainer.Size = UDim2.new(1, -8, 0, #options * 28)
            optionsContainer.Position = UDim2.new(0, 4, 0, 38)
            optionsContainer.BackgroundTransparency = 1

            local optLayout = Instance.new("UIListLayout")
            optLayout.Parent = optionsContainer
            optLayout.Padding = UDim.new(0, 2)

            local function CreateOptionBtn(opt)
                local optBtn = Instance.new("TextButton")
                optBtn.Parent = optionsContainer
                optBtn.Size = UDim2.new(1, 0, 0, 26)
                optBtn.BackgroundColor3 = currentTheme.Card
                optBtn.Font = Enum.Font.Code
                optBtn.TextSize = 12
                optBtn.TextColor3 = currentTheme.Text
                optBtn.Text = opt
                CreateCorner(optBtn, 4)
                optBtn.MouseEnter:Connect(function() PlayTween(optBtn, {BackgroundColor3 = currentTheme.Hover}, 0.15) end)
                optBtn.MouseLeave:Connect(function() PlayTween(optBtn, {BackgroundColor3 = currentTheme.Card}, 0.15) end)
                optBtn.MouseButton1Click:Connect(function()
                    selected = opt
                    header.Text = (cfg.Name or "Dropdown") .. ": " .. opt
                    isOpen = false
                    PlayTween(holder, {Size = UDim2.new(1, 0, 0, 36)}, 0.25)
                    PlayTween(arrow, {Rotation = 0}, 0.25)
                    if cfg.Callback then cfg.Callback(opt) end
                end)
                Window:RegisterThemeObject(optBtn, {BackgroundColor3 = "Card", TextColor3 = "Text"}, {})
            end

            for _, opt in pairs(options) do CreateOptionBtn(opt) end

            header.MouseButton1Click:Connect(function()
                isOpen = not isOpen
                local targetH = isOpen and (38 + #options * 28 + 8) or 36
                PlayTween(holder, {Size = UDim2.new(1, 0, 0, targetH)}, 0.25)
                PlayTween(arrow, {Rotation = isOpen and 180 or 0}, 0.25)
            end)

            Window:RegisterThemeObject(holder, {BackgroundColor3 = "ElementBg"}, {})
            Window:RegisterThemeObject(hs, {}, {Color = "Stroke"})
            Window:RegisterThemeObject(header, {TextColor3 = "Text"}, {})
            Window:RegisterThemeObject(arrow, {TextColor3 = "DimText"}, {})

            local DropAPI = {}
            function DropAPI:Set(val) selected = val header.Text = (cfg.Name or "Dropdown") .. ": " .. val if cfg.Callback then cfg.Callback(val) end end
            function DropAPI:Get() return selected end
            function DropAPI:Refresh(newOptions, newDefault)
                for _, c in pairs(optionsContainer:GetChildren()) do if c:IsA("TextButton") then c:Destroy() end end
                options = newOptions or {}
                selected = newDefault or options[1] or ""
                header.Text = (cfg.Name or "Dropdown") .. ": " .. selected
                optionsContainer.Size = UDim2.new(1, -8, 0, #options * 28)
                for _, opt in pairs(options) do CreateOptionBtn(opt) end
                if isOpen then isOpen = false holder.Size = UDim2.new(1, 0, 0, 36) end
            end
            return DropAPI
        end

        function Tab:AddTextbox(cfg)
            cfg = cfg or {}
            local holder = Instance.new("Frame")
            holder.Name = "TextboxHolder"
            holder.Parent = Page
            holder.Size = UDim2.new(1, 0, 0, 36)
            holder.BackgroundColor3 = currentTheme.ElementBg
            CreateCorner(holder, 6)
            local hs = CreateStroke(holder, currentTheme.Stroke, 1)

            local label = Instance.new("TextLabel")
            label.Parent = holder
            label.Size = UDim2.new(0.4, 0, 1, 0)
            label.Position = UDim2.new(0, 12, 0, 0)
            label.BackgroundTransparency = 1
            label.Font = Enum.Font.Code
            label.TextSize = 12
            label.Text = cfg.Name or "Input"
            label.TextColor3 = currentTheme.Text
            label.TextXAlignment = Enum.TextXAlignment.Left

            local inputBox = Instance.new("TextBox")
            inputBox.Parent = holder
            inputBox.Size = UDim2.new(0.55, -12, 0, 26)
            inputBox.Position = UDim2.new(0.45, 0, 0, 5)
            inputBox.BackgroundColor3 = currentTheme.Card
            inputBox.Font = Enum.Font.Code
            inputBox.TextSize = 12
            inputBox.TextColor3 = currentTheme.Text
            inputBox.PlaceholderText = cfg.Placeholder or "..."
            inputBox.PlaceholderColor3 = currentTheme.DimText
            inputBox.Text = cfg.Default or ""
            inputBox.ClearTextOnFocus = cfg.ClearOnFocus or false
            CreateCorner(inputBox, 4)
            local inputStroke = CreateStroke(inputBox, currentTheme.Stroke, 1)

            inputBox.FocusLost:Connect(function(enterPressed)
                if cfg.Callback then cfg.Callback(inputBox.Text, enterPressed) end
            end)

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
            holder.Name = "KeybindHolder"
            holder.Parent = Page
            holder.Size = UDim2.new(1, 0, 0, 36)
            holder.BackgroundColor3 = currentTheme.ElementBg
            CreateCorner(holder, 6)
            local hs = CreateStroke(holder, currentTheme.Stroke, 1)

            local label = Instance.new("TextLabel")
            label.Parent = holder
            label.Size = UDim2.new(1, -80, 1, 0)
            label.Position = UDim2.new(0, 12, 0, 0)
            label.BackgroundTransparency = 1
            label.Font = Enum.Font.Code
            label.TextSize = 12
            label.Text = cfg.Name or "Keybind"
            label.TextColor3 = currentTheme.Text
            label.TextXAlignment = Enum.TextXAlignment.Left

            local keyBtn = Instance.new("TextButton")
            keyBtn.Parent = holder
            keyBtn.Size = UDim2.new(0, 60, 0, 24)
            keyBtn.Position = UDim2.new(1, -72, 0, 6)
            keyBtn.BackgroundColor3 = currentTheme.Card
            keyBtn.Font = Enum.Font.Code
            keyBtn.TextSize = 11
            keyBtn.TextColor3 = currentTheme.Accent
            keyBtn.Text = "[" .. currentKey.Name .. "]"
            CreateCorner(keyBtn, 4)
            local keyStroke = CreateStroke(keyBtn, currentTheme.Stroke, 1)

            keyBtn.MouseButton1Click:Connect(function()
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
                    if cfg.Callback then cfg.Callback(currentKey) end
                elseif not processed and not listening and input.KeyCode == currentKey then
                    if cfg.OnPress then cfg.OnPress() end
                end
            end)

            Window:RegisterThemeObject(holder, {BackgroundColor3 = "ElementBg"}, {})
            Window:RegisterThemeObject(hs, {}, {Color = "Stroke"})
            Window:RegisterThemeObject(label, {TextColor3 = "Text"}, {})
            Window:RegisterThemeObject(keyBtn, {BackgroundColor3 = "Card", TextColor3 = "Accent"}, {})
            Window:RegisterThemeObject(keyStroke, {}, {Color = "Stroke"})

            local KbAPI = {}
            function KbAPI:SetKey(key) currentKey = key keyBtn.Text = "[" .. key.Name .. "]" end
            function KbAPI:GetKey() return currentKey end
            return KbAPI
        end

        function Tab:AddColorPicker(cfg)
            cfg = cfg or {}
            local currentColor = cfg.Default or Color3.fromRGB(255, 0, 0)
            local isOpen = false

            local holder = Instance.new("Frame")
            holder.Name = "ColorPickerHolder"
            holder.Parent = Page
            holder.Size = UDim2.new(1, 0, 0, 36)
            holder.BackgroundColor3 = currentTheme.ElementBg
            holder.ClipsDescendants = true
            CreateCorner(holder, 6)
            local hs = CreateStroke(holder, currentTheme.Stroke, 1)

            local label = Instance.new("TextLabel")
            label.Parent = holder
            label.Size = UDim2.new(1, -60, 0, 36)
            label.Position = UDim2.new(0, 12, 0, 0)
            label.BackgroundTransparency = 1
            label.Font = Enum.Font.Code
            label.TextSize = 12
            label.Text = cfg.Name or "Color"
            label.TextColor3 = currentTheme.Text
            label.TextXAlignment = Enum.TextXAlignment.Left

            local preview = Instance.new("TextButton")
            preview.Parent = holder
            preview.Size = UDim2.new(0, 28, 0, 22)
            preview.Position = UDim2.new(1, -42, 0, 7)
            preview.BackgroundColor3 = currentColor
            preview.Text = ""
            CreateCorner(preview, 4)
            local previewStroke = CreateStroke(preview, currentTheme.Stroke, 1)

            local canvasHolder = Instance.new("Frame")
            canvasHolder.Parent = holder
            canvasHolder.Size = UDim2.new(1, -20, 0, 120)
            canvasHolder.Position = UDim2.new(0, 10, 0, 40)
            canvasHolder.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            CreateCorner(canvasHolder, 4)

            local whiteGrad = Instance.new("UIGradient")
            whiteGrad.Color = ColorSequence.new(Color3.new(1, 1, 1), Color3.new(1, 1, 1))
            whiteGrad.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1)})
            whiteGrad.Parent = canvasHolder

            local blackOverlay = Instance.new("Frame")
            blackOverlay.Parent = canvasHolder
            blackOverlay.Size = UDim2.new(1, 0, 1, 0)
            blackOverlay.BackgroundColor3 = Color3.new(0, 0, 0)
            blackOverlay.BackgroundTransparency = 0
            CreateCorner(blackOverlay, 4)

            local blackGrad = Instance.new("UIGradient")
            blackGrad.Color = ColorSequence.new(Color3.new(0, 0, 0), Color3.new(0, 0, 0))
            blackGrad.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0)})
            blackGrad.Rotation = 90
            blackGrad.Parent = blackOverlay

            local hueBar = Instance.new("Frame")
            hueBar.Parent = holder
            hueBar.Size = UDim2.new(1, -20, 0, 14)
            hueBar.Position = UDim2.new(0, 10, 0, 165)
            CreateCorner(hueBar, 4)

            local hueGrad = Instance.new("UIGradient")
            hueGrad.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromHSV(0, 1, 1)),
                ColorSequenceKeypoint.new(0.167, Color3.fromHSV(0.167, 1, 1)),
                ColorSequenceKeypoint.new(0.333, Color3.fromHSV(0.333, 1, 1)),
                ColorSequenceKeypoint.new(0.5, Color3.fromHSV(0.5, 1, 1)),
                ColorSequenceKeypoint.new(0.667, Color3.fromHSV(0.667, 1, 1)),
                ColorSequenceKeypoint.new(0.833, Color3.fromHSV(0.833, 1, 1)),
                ColorSequenceKeypoint.new(1, Color3.fromHSV(1, 1, 1)),
            })
            hueGrad.Parent = hueBar

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
                    local ax = canvasHolder.AbsolutePosition.X
                    local ay = canvasHolder.AbsolutePosition.Y
                    local aw = canvasHolder.AbsoluteSize.X
                    local ah = canvasHolder.AbsoluteSize.Y
                    s = math.clamp((mx.X - ax) / aw, 0, 1)
                    v = 1 - math.clamp((mx.Y - ay) / ah, 0, 1)
                    UpdateColor()
                end
                if draggingH then
                    local mx = UserInputService:GetMouseLocation()
                    local ax = hueBar.AbsolutePosition.X
                    local aw = hueBar.AbsoluteSize.X
                    h = math.clamp((mx.X - ax) / aw, 0, 1)
                    UpdateColor()
                end
            end)

            preview.MouseButton1Click:Connect(function()
                isOpen = not isOpen
                local targetH = isOpen and 190 or 36
                PlayTween(holder, {Size = UDim2.new(1, 0, 0, targetH)}, 0.3)
            end)

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
            sec.Size = UDim2.new(1, 0, 0, 28)
            sec.BackgroundTransparency = 1
            sec.Font = Enum.Font.Code
            sec.TextSize = 11
            sec.Text = "// " .. (cfg.Name or "SECTION"):upper()
            sec.TextColor3 = currentTheme.Accent
            sec.TextXAlignment = Enum.TextXAlignment.Left
            Window:RegisterThemeObject(sec, {TextColor3 = "Accent"}, {})
        end

        return Tab
    end

    return Window
end

return Nebula
