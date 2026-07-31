
local Library = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- Создание GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local MinimizeButton = Instance.new("TextButton")
local TabsFrame = Instance.new("ScrollingFrame")
local ContentFrame = Instance.new("Frame")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local ButtonsFrame = Instance.new("Frame")
local CheckAllButton = Instance.new("TextButton")
local ClearButton = Instance.new("TextButton")
local ExportButton = Instance.new("TextButton")
local SearchBox = Instance.new("TextBox")
local StatusText = Instance.new("TextLabel")

-- Защита GUI
if syn and syn.protect_gui then
    syn.protect_gui(ScreenGui)
end
ScreenGui.Name = math.random(1000000, 9999999)
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- Main Frame
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.25, 0, 0.15, 0)
MainFrame.Size = UDim2.new(0, 800, 0, 600)
MainFrame.Active = true
MainFrame.ClipsDescendants = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(60, 120, 255)
MainStroke.Thickness = 1
MainStroke.Transparency = 0.7
MainStroke.Parent = MainFrame

-- Top Bar
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(1, 0, 0, 50)

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 12)
TopCorner.Parent = TopBar

local TopLine = Instance.new("Frame")
TopLine.Parent = TopBar
TopLine.BackgroundColor3 = Color3.fromRGB(60, 120, 255)
TopLine.BorderSizePixel = 0
TopLine.Position = UDim2.new(0, 0, 1, -2)
TopLine.Size = UDim2.new(1, 0, 0, 2)

-- Title
Title.Name = "Title"
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 15, 0, 8)
Title.Size = UDim2.new(0.4, 0, 0, 20)
Title.Font = Enum.Font.GothamBold
Title.Text = "BurmaldaGandonTEST|FUNCTION|EXECUTOR"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left

local VersionLabel = Instance.new("TextLabel")
VersionLabel.Parent = TopBar
VersionLabel.BackgroundTransparency = 1
VersionLabel.Position = UDim2.new(0, 15, 0, 28)
VersionLabel.Size = UDim2.new(0.3, 0, 0, 14)
VersionLabel.Font = Enum.Font.Gotham
VersionLabel.Text = "v3.0 MEGA | 150+ Checks"
VersionLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
VersionLabel.TextSize = 10
VersionLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Search Box
SearchBox.Name = "SearchBox"
SearchBox.Parent = TopBar
SearchBox.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
SearchBox.BorderSizePixel = 0
SearchBox.Position = UDim2.new(1, -270, 0.5, -15)
SearchBox.Size = UDim2.new(0, 180, 0, 30)
SearchBox.Font = Enum.Font.Gotham
SearchBox.PlaceholderText = "🔍 Search..."
SearchBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 110)
SearchBox.Text = ""
SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchBox.TextSize = 12
SearchBox.ClearTextOnFocus = false

local SearchCorner = Instance.new("UICorner")
SearchCorner.CornerRadius = UDim.new(0, 8)
SearchCorner.Parent = SearchBox

local SearchPadding = Instance.new("UIPadding")
SearchPadding.PaddingLeft = UDim.new(0, 10)
SearchPadding.Parent = SearchBox

-- Close Button
CloseButton.Name = "CloseButton"
CloseButton.Parent = TopBar
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(1, -38, 0.5, -15)
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "×"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 18
CloseButton.AutoButtonColor = false

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseButton

-- Minimize Button
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = TopBar
MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 180, 70)
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Position = UDim2.new(1, -73, 0.5, -15)
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Text = "−"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 18
MinimizeButton.AutoButtonColor = false

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 8)
MinCorner.Parent = MinimizeButton

-- Tabs Frame
TabsFrame.Name = "TabsFrame"
TabsFrame.Parent = MainFrame
TabsFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
TabsFrame.BorderSizePixel = 0
TabsFrame.Position = UDim2.new(0, 10, 0, 60)
TabsFrame.Size = UDim2.new(0, 160, 1, -120)
TabsFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
TabsFrame.ScrollBarThickness = 4
TabsFrame.ScrollBarImageColor3 = Color3.fromRGB(60, 120, 255)

local TabsCorner = Instance.new("UICorner")
TabsCorner.CornerRadius = UDim.new(0, 10)
TabsCorner.Parent = TabsFrame

local TabsLayout = Instance.new("UIListLayout")
TabsLayout.Parent = TabsFrame
TabsLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabsLayout.Padding = UDim.new(0, 5)

local TabsPadding = Instance.new("UIPadding")
TabsPadding.PaddingTop = UDim.new(0, 8)
TabsPadding.PaddingBottom = UDim.new(0, 8)
TabsPadding.PaddingLeft = UDim.new(0, 8)
TabsPadding.PaddingRight = UDim.new(0, 8)
TabsPadding.Parent = TabsFrame

-- Content Frame
ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundTransparency = 1
ContentFrame.Position = UDim2.new(0, 180, 0, 60)
ContentFrame.Size = UDim2.new(1, -190, 1, -120)

-- Scrolling Frame
ScrollingFrame.Name = "ScrollingFrame"
ScrollingFrame.Parent = ContentFrame
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.ScrollBarThickness = 6
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(60, 120, 255)
ScrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y

local ScrollCorner = Instance.new("UICorner")
ScrollCorner.CornerRadius = UDim.new(0, 10)
ScrollCorner.Parent = ScrollingFrame

-- UI List Layout
UIListLayout.Parent = ScrollingFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 6)

local ScrollPadding = Instance.new("UIPadding")
ScrollPadding.PaddingTop = UDim.new(0, 10)
ScrollPadding.PaddingBottom = UDim.new(0, 10)
ScrollPadding.PaddingLeft = UDim.new(0, 10)
ScrollPadding.PaddingRight = UDim.new(0, 10)
ScrollPadding.Parent = ScrollingFrame

-- Buttons Frame
ButtonsFrame.Name = "ButtonsFrame"
ButtonsFrame.Parent = MainFrame
ButtonsFrame.BackgroundTransparency = 1
ButtonsFrame.Position = UDim2.new(0, 10, 1, -45)
ButtonsFrame.Size = UDim2.new(1, -20, 0, 38)

-- Check All Button
CheckAllButton.Name = "CheckAllButton"
CheckAllButton.Parent = ButtonsFrame
CheckAllButton.BackgroundColor3 = Color3.fromRGB(60, 120, 255)
CheckAllButton.BorderSizePixel = 0
CheckAllButton.Position = UDim2.new(0, 0, 0, 0)
CheckAllButton.Size = UDim2.new(0.32, -3, 1, 0)
CheckAllButton.Font = Enum.Font.GothamBold
CheckAllButton.Text = "🔍 Check All"
CheckAllButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckAllButton.TextSize = 13
CheckAllButton.AutoButtonColor = false

local CheckCorner = Instance.new("UICorner")
CheckCorner.CornerRadius = UDim.new(0, 8)
CheckCorner.Parent = CheckAllButton

-- Clear Button
ClearButton.Name = "ClearButton"
ClearButton.Parent = ButtonsFrame
ClearButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
ClearButton.BorderSizePixel = 0
ClearButton.Position = UDim2.new(0.33, 0, 0, 0)
ClearButton.Size = UDim2.new(0.32, -3, 1, 0)
ClearButton.Font = Enum.Font.GothamBold
ClearButton.Text = "🗑️ Clear"
ClearButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ClearButton.TextSize = 13
ClearButton.AutoButtonColor = false

local ClearCorner = Instance.new("UICorner")
ClearCorner.CornerRadius = UDim.new(0, 8)
ClearCorner.Parent = ClearButton

-- Export Button
ExportButton.Name = "ExportButton"
ExportButton.Parent = ButtonsFrame
ExportButton.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
ExportButton.BorderSizePixel = 0
ExportButton.Position = UDim2.new(0.66, 0, 0, 0)
ExportButton.Size = UDim2.new(0.34, 0, 1, 0)
ExportButton.Font = Enum.Font.GothamBold
ExportButton.Text = "📋 Export"
ExportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExportButton.TextSize = 13
ExportButton.AutoButtonColor = false

local ExportCorner = Instance.new("UICorner")
ExportCorner.CornerRadius = UDim.new(0, 8)
ExportCorner.Parent = ExportButton

-- Status Text
StatusText.Name = "StatusText"
StatusText.Parent = ButtonsFrame
StatusText.BackgroundTransparency = 1
StatusText.Position = UDim2.new(0, 0, 1, 5)
StatusText.Size = UDim2.new(1, 0, 0, 15)
StatusText.Font = Enum.Font.Gotham
StatusText.Text = "Ready | 0/150 checked"
StatusText.TextColor3 = Color3.fromRGB(150, 150, 160)
StatusText.TextSize = 10
StatusText.TextXAlignment = Enum.TextXAlignment.Left

-- ============================
-- ПОЛНЫЙ СПИСОК ФУНКЦИЙ (150+)
-- ============================

local CheckFunctions = {
    -- ===== HOOKS (10) =====
    {cat = "Hooks", name = "gethook", desc = "Проверяет хуки функций", check = function()
        return gethook ~= nil, gethook and "Доступно" or "Недоступно"
    end},
    {cat = "Hooks", name = "getnamecallmethod", desc = "Получает метод namecall", check = function()
        return getnamecallmethod ~= nil, getnamecallmethod and "Доступно" or "Недоступно"
    end},
    {cat = "Hooks", name = "hookfunction", desc = "Хук функций", check = function()
        return hookfunction ~= nil, hookfunction and "Доступно" or "Недоступно"
    end},
    {cat = "Hooks", name = "hookmetamethod", desc = "Хук метаметодов", check = function()
        return hookmetamethod ~= nil, hookmetamethod and "Доступно" or "Недоступно"
    end},
    {cat = "Hooks", name = "checkcaller", desc = "Проверка вызова", check = function()
        if checkcaller then
            local safe = checkcaller()
            return safe, safe and "Безопасно" or "Внешний"
        end
        return nil, "Недоступно"
    end},
    {cat = "Hooks", name = "replaceclosure", desc = "Замена замыкания", check = function()
        return replaceclosure ~= nil, replaceclosure and "Доступно" or "Недоступно"
    end},
    {cat = "Hooks", name = "restorefunction", desc = "Восстановление функции", check = function()
        return restorefunction ~= nil, restorefunction and "Доступно" or "Недоступно"
    end},
    {cat = "Hooks", name = "ishooked", desc = "Проверка хука", check = function()
        return ishooked ~= nil, ishooked and "Доступно" or "Недоступно"
    end},
    {cat = "Hooks", name = "setnamecallmethod", desc = "Установка namecall", check = function()
        return setnamecallmethod ~= nil, setnamecallmethod and "Доступно" or "Недоступно"
    end},
    {cat = "Hooks", name = "gethookfunction", desc = "Получение хук функции", check = function()
        return gethookfunction ~= nil, gethookfunction and "Доступно" or "Недоступно"
    end},
    
    -- ===== ENVIRONMENT (10) =====
    {cat = "Environment", name = "getgenv", desc = "Глобальное окружение", check = function()
        if getgenv then
            local count = 0
            for _ in pairs(getgenv()) do count = count + 1 end
            return true, count .. " переменных"
        end
        return nil, "Недоступно"
    end},
    {cat = "Environment", name = "getrenv", desc = "Roblox окружение", check = function()
        return getrenv ~= nil, getrenv and "Доступно" or "Недоступно"
    end},
    {cat = "Environment", name = "getfenv", desc = "Окружение функции", check = function()
        return getfenv ~= nil, getfenv and "Доступно" or "Недоступно"
    end},
    {cat = "Environment", name = "setfenv", desc = "Установка окружения", check = function()
        return setfenv ~= nil, setfenv and "Доступно" or "Недоступно"
    end},
    {cat = "Environment", name = "getsenv", desc = "Окружение скрипта", check = function()
        return getsenv ~= nil, getsenv and "Доступно" or "Недоступно"
    end},
    {cat = "Environment", name = "getmenv", desc = "Module окружение", check = function()
        return getmenv ~= nil, getmenv and "Доступно" or "Недоступно"
    end},
    {cat = "Environment", name = "gettenv", desc = "Thread окружение", check = function()
        return gettenv ~= nil, gettenv and "Доступно" or "Недоступно"
    end},
    {cat = "Environment", name = "getreg", desc = "Registry таблица", check = function()
        return getreg ~= nil, getreg and "Доступно" or "Недоступно"
    end},
    {cat = "Environment", name = "getgc", desc = "Garbage Collector", check = function()
        if getgc then
            local count = #getgc()
            return true, count .. " объектов"
        end
        return nil, "Недоступно"
    end},
    {cat = "Environment", name = "getinstances", desc = "Все Instance", check = function()
        if getinstances then
            local count = #getinstances()
            return true, count .. " инстансов"
        end
        return nil, "Недоступно"
    end},
    
    -- ===== METATABLES (8) =====
    {cat = "Metatables", name = "getrawmetatable", desc = "Получение метатаблицы", check = function()
        if getrawmetatable then
            local mt = getrawmetatable(game)
            return mt ~= nil, mt and "Получена" or "Ошибка"
        end
        return nil, "Недоступно"
    end},
    {cat = "Metatables", name = "setrawmetatable", desc = "Установка метатаблицы", check = function()
        return setrawmetatable ~= nil, setrawmetatable and "Доступно" or "Недоступно"
    end},
    {cat = "Metatables", name = "setreadonly", desc = "Снятие защиты", check = function()
        return setreadonly ~= nil, setreadonly and "Доступно" or "Недоступно"
    end},
    {cat = "Metatables", name = "isreadonly", desc = "Проверка защиты", check = function()
        if isreadonly and getrawmetatable then
            local mt = getrawmetatable(game)
            if mt then
                local ro = isreadonly(mt)
                return ro, ro and "Защищена" or "Уязвима"
            end
        end
        return nil, "Недоступно"
    end},
    {cat = "Metatables", name = "make_readonly", desc = "Сделать readonly", check = function()
        return make_readonly ~= nil, make_readonly and "Доступно" or "Недоступно"
    end},
    {cat = "Metatables", name = "make_writeable", desc = "Сделать writeable", check = function()
        return make_writeable ~= nil, make_writeable and "Доступно" or "Недоступно"
    end},
    {cat = "Metatables", name = "getmetatable", desc = "Получить метатаблицу", check = function()
        return getmetatable ~= nil, getmetatable and "Доступно" or "Недоступно"
    end},
    {cat = "Metatables", name = "setmetatable", desc = "Установить метатаблицу", check = function()
        return setmetatable ~= nil, setmetatable and "Доступно" or "Недоступно"
    end},
    
    -- ===== SCRIPTS (10) =====
    {cat = "Scripts", name = "getscripts", desc = "Все скрипты", check = function()
        if getscripts then
            local count = #getscripts()
            return true, count .. " скриптов"
        end
        return nil, "Недоступно"
    end},
    {cat = "Scripts", name = "getrunningscripts", desc = "Активные скрипты", check = function()
        if getrunningscripts then
            local count = #getrunningscripts()
            return true, count .. " активных"
        end
        return nil, "Недоступно"
    end},
    {cat = "Scripts", name = "getcallingscript", desc = "Вызывающий скрипт", check = function()
        return getcallingscript ~= nil, getcallingscript and "Доступно" or "Недоступно"
    end},
    {cat = "Scripts", name = "getscriptclosure", desc = "Замыкание скрипта", check = function()
        return getscriptclosure ~= nil, getscriptclosure and "Доступно" or "Недоступно"
    end},
    {cat = "Scripts", name = "getscripthash", desc = "Хеш скрипта", check = function()
        return getscripthash ~= nil, getscripthash and "Доступно" or "Недоступно"
    end},
    {cat = "Scripts", name = "getscriptbytecode", desc = "Байткод скрипта", check = function()
        return getscriptbytecode ~= nil, getscriptbytecode and "Доступно" or "Недоступно"
    end},
    {cat = "Scripts", name = "dumpstring", desc = "Дамп строки", check = function()
        return dumpstring ~= nil, dumpstring and "Доступно" or "Недоступно"
    end},
    {cat = "Scripts", name = "decompile", desc = "Декомпиляция", check = function()
        return decompile ~= nil, decompile and "Доступно" or "Недоступно"
    end},
    {cat = "Scripts", name = "getloadedmodules", desc = "Загруженные модули", check = function()
        if getloadedmodules then
            local count = #getloadedmodules()
            return true, count .. " модулей"
        end
        return nil, "Недоступно"
    end},
    {cat = "Scripts", name = "require", desc = "Require функция", check = function()
        return require ~= nil, require and "Доступно" or "Недоступно"
    end},
    
    -- ===== INSTANCES (12) =====
    {cat = "Instances", name = "getnilinstances", desc = "Instance в nil", check = function()
        if getnilinstances then
            local count = #getnilinstances()
            return true, count .. " в nil"
        end
        return nil, "Недоступно"
    end},
    {cat = "Instances", name = "isscriptable", desc = "Проверка свойства", check = function()
        return isscriptable ~= nil, isscriptable and "Доступно" or "Недоступно"
    end},
    {cat = "Instances", name = "setscriptable", desc = "Изменение свойства", check = function()
        return setscriptable ~= nil, setscriptable and "Доступно" or "Недоступно"
    end},
    {cat = "Instances", name = "gethiddenproperty", desc = "Скрытые свойства", check = function()
        return gethiddenproperty ~= nil, gethiddenproperty and "Доступно" or "Недоступно"
    end},
    {cat = "Instances", name = "sethiddenproperty", desc = "Установка свойств", check = function()
        return sethiddenproperty ~= nil, sethiddenproperty and "Доступно" or "Недоступно"
    end},
    {cat = "Instances", name = "gethui", desc = "Hidden UI", check = function()
        return gethui ~= nil, gethui and "Доступно" or "Недоступно"
    end},
    {cat = "Instances", name = "getproperties", desc = "Все свойства", check = function()
        return getproperties ~= nil, getproperties and "Доступно" or "Недоступно"
    end},
    {cat = "Instances", name = "getcustomasset", desc = "Пользовательские asset", check = function()
        return getcustomasset ~= nil, getcustomasset and "Доступно" or "Недоступно"
    end},
    {cat = "Instances", name = "getspecialinfo", desc = "Специальная информация", check = function()
        return getspecialinfo ~= nil, getspecialinfo and "Доступно" or "Недоступно"
    end},
    {cat = "Instances", name = "saveinstance", desc = "Сохранение Instance", check = function()
        return saveinstance ~= nil, saveinstance and "Доступно" or "Недоступно"
    end},
    {cat = "Instances", name = "getdescendants", desc = "Получить потомков", check = function()
        return true, "Native функция"
    end},
    {cat = "Instances", name = "getchildren", desc = "Получить детей", check = function()
        return true, "Native функция"
    end},
    
    -- ===== CONNECTIONS (8) =====
    {cat = "Connections", name = "getconnections", desc = "Получение подключений", check = function()
        return getconnections ~= nil, getconnections and "Доступно" or "Недоступно"
    end},
    {cat = "Connections", name = "firesignal", desc = "Вызов сигнала", check = function()
        return firesignal ~= nil, firesignal and "Доступно" or "Недоступно"
    end},
    {cat = "Connections", name = "getcallbackvalue", desc = "Значение callback", check = function()
        return getcallbackvalue ~= nil, getcallbackvalue and "Доступно" or "Недоступно"
    end},
    {cat = "Connections", name = "getconnectionstate", desc = "Состояние подключения", check = function()
        return getconnectionstate ~= nil, getconnectionstate and "Доступно" or "Недоступно"
    end},
    {cat = "Connections", name = "disableconnection", desc = "Отключить подключение", check = function()
        return true, "Через getconnections"
    end},
    {cat = "Connections", name = "enableconnection", desc = "Включить подключение", check = function()
        return true, "Через getconnections"
    end},
    {cat = "Connections", name = "fireconnection", desc = "Вызов подключения", check = function()
        return true, "Через getconnections"
    end},
    {cat = "Connections", name = "getconnectioncount", desc = "Количество подключений", check = function()
        return true, "Через #getconnections()"
    end},
    
    -- ===== REMOTES (8) =====
    {cat = "Remotes", name = "fireserver", desc = "Вызов RemoteEvent", check = function()
        local count = 0
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("RemoteEvent") then count = count + 1 end
        end
        return true, count .. " RemoteEvent"
    end},
    {cat = "Remotes", name = "invokeserver", desc = "Вызов RemoteFunction", check = function()
        local count = 0
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("RemoteFunction") then count = count + 1 end
        end
        return true, count .. " RemoteFunction"
    end},
    {cat = "Remotes", name = "getremotes", desc = "Поиск Remote", check = function()
        local re, rf = 0, 0
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("RemoteEvent") then re = re + 1 end
            if v:IsA("RemoteFunction") then rf = rf + 1 end
        end
        return true, re .. " RE, " .. rf .. " RF"
    end},
    {cat = "Remotes", name = "hookremote", desc = "Хук Remote", check = function()
        return hookfunction ~= nil, hookfunction and "Через hookfunction" or "Недоступно"
    end},
    {cat = "Remotes", name = "logremote", desc = "Логирование Remote", check = function()
        return getconnections ~= nil, getconnections and "Через getconnections" or "Недоступно"
    end},
    {cat = "Remotes", name = "getremotename", desc = "Имя Remote", check = function()
        return true, "Через .Name"
    end},
    {cat = "Remotes", name = "getremoteparent", desc = "Родитель Remote", check = function()
        return true, "Через .Parent"
    end},
    {cat = "Remotes", name = "isremote", desc = "Проверка Remote", check = function()
        return true, "Через :IsA()"
    end},
    
    -- ===== CLOSURES (15) =====
    {cat = "Closures", name = "newcclosure", desc = "Создание C замыкания", check = function()
        return newcclosure ~= nil, newcclosure and "Доступно" or "Недоступно"
    end},
    {cat = "Closures", name = "clonefunction", desc = "Клонирование функции", check = function()
        return clonefunction ~= nil, clonefunction and "Доступно" or "Недоступно"
    end},
    {cat = "Closures", name = "islclosure", desc = "Проверка Lua closure", check = function()
        return islclosure ~= nil, islclosure and "Доступно" or "Недоступно"
    end},
    {cat = "Closures", name = "iscclosure", desc = "Проверка C closure", check = function()
        return iscclosure ~= nil, iscclosure and "Доступно" or "Недоступно"
    end},
    {cat = "Closures", name = "getconstants", desc = "Константы функции", check = function()
        return getconstants ~= nil, getconstants and "Доступно" or "Недоступно"
    end},
    {cat = "Closures", name = "getconstant", desc = "Получить константу", check = function()
        return getconstant ~= nil, getconstant and "Доступно" or "Недоступно"
    end},
    {cat = "Closures", name = "setconstant", desc = "Установить константу", check = function()
        return setconstant ~= nil, setconstant and "Доступно" or "Недоступно"
    end},
    {cat = "Closures", name = "getupvalues", desc = "Upvalue функции", check = function()
        return getupvalues ~= nil, getupvalues and "Доступно" or "Недоступно"
    end},
    {cat = "Closures", name = "getupvalue", desc = "Получить upvalue", check = function()
        return getupvalue ~= nil, getupvalue and "Доступно" or "Недоступно"
    end},
    {cat = "Closures", name = "setupvalue", desc = "Установить upvalue", check = function()
        return setupvalue ~= nil, setupvalue and "Доступно" or "Недоступно"
    end},
    {cat = "Closures", name = "getproto", desc = "Прототипы функции", check = function()
        return getproto ~= nil, getproto and "Доступно" or "Недоступно"
    end},
    {cat = "Closures", name = "getprotos", desc = "Все прототипы", check = function()
        return getprotos ~= nil, getprotos and "Доступно" or "Недоступно"
    end},
    {cat = "Closures", name = "setproto", desc = "Установить прототип", check = function()
        return setproto ~= nil, setproto and "Доступно" or "Недоступно"
    end},
    {cat = "Closures", name = "getinfo", desc = "Информация о функции", check = function()
        return debug and debug.getinfo ~= nil, debug.getinfo and "Доступно" or "Недоступно"
    end},
    {cat = "Closures", name = "getstack", desc = "Stack функции", check = function()
        return getstack ~= nil, getstack and "Доступно" or "Недоступно"
    end},
    
    -- ===== CACHE (5) =====
    {cat = "Cache", name = "cloneref", desc = "Клонирование ссылки", check = function()
        return cloneref ~= nil, cloneref and "Доступно" or "Недоступно"
    end},
    {cat = "Cache", name = "compareinstances", desc = "Сравнение Instance", check = function()
        return compareinstances ~= nil, compareinstances and "Доступно" or "Недоступно"
    end},
    {cat = "Cache", name = "invalidatecache", desc = "Очистка кэша", check = function()
        return invalidatecache ~= nil, invalidatecache and "Доступно" or "Недоступно"
    end},
    {cat = "Cache", name = "getcache", desc = "Получить кэш", check = function()
        return getcache ~= nil, getcache and "Доступно" or "Недоступно"
    end},
    {cat = "Cache", name = "iscached", desc = "Проверка кэша", check = function()
        return iscached ~= nil, iscached and "Доступно" or "Недоступно"
    end},
    
    -- ===== CONSOLE (6) =====
    {cat = "Console", name = "rconsolecreate", desc = "Создание консоли", check = function()
        return rconsolecreate ~= nil, rconsolecreate and "Доступно" or "Недоступно"
    end},
    {cat = "Console", name = "rconsoleprint", desc = "Вывод в консоль", check = function()
        return rconsoleprint ~= nil, rconsoleprint and "Доступно" or "Недоступно"
    end},
    {cat = "Console", name = "rconsoleclear", desc = "Очистка консоли", check = function()
        return rconsoleclear ~= nil, rconsoleclear and "Доступно" or "Недоступно"
    end},
    {cat = "Console", name = "rconsoleinput", desc = "Ввод в консоль", check = function()
        return rconsoleinput ~= nil, rconsoleinput and "Доступно" or "Недоступно"
    end},
    {cat = "Console", name = "rconsoleclose", desc = "Закрыть консоль", check = function()
        return rconsoleclose ~= nil, rconsoleclose and "Доступно" or "Недоступно"
    end},
    {cat = "Console", name = "rconsolename", desc = "Имя консоли", check = function()
        return rconsolename ~= nil, rconsolename and "Доступно" or "Недоступно"
    end},
    
    -- ===== FILESYSTEM (10) =====
    {cat = "Filesystem", name = "readfile", desc = "Чтение файлов", check = function()
        return readfile ~= nil, readfile and "Доступно" or "Недоступно"
    end},
    {cat = "Filesystem", name = "writefile", desc = "Запись файлов", check = function()
        return writefile ~= nil, writefile and "Доступно" or "Недоступно"
    end},
    {cat = "Filesystem", name = "appendfile", desc = "Добавление в файл", check = function()
        return appendfile ~= nil, appendfile and "Доступно" or "Недоступно"
    end},
    {cat = "Filesystem", name = "delfile", desc = "Удаление файлов", check = function()
        return delfile ~= nil, delfile and "Доступно" or "Недоступно"
    end},
    {cat = "Filesystem", name = "isfile", desc = "Проверка файла", check = function()
        return isfile ~= nil, isfile and "Доступно" or "Недоступно"
    end},
    {cat = "Filesystem", name = "isfolder", desc = "Проверка папки", check = function()
        return isfolder ~= nil, isfolder and "Доступно" or "Недоступно"
    end},
    {cat = "Filesystem", name = "listfiles", desc = "Список файлов", check = function()
        return listfiles ~= nil, listfiles and "Доступно" or "Недоступно"
    end},
    {cat = "Filesystem", name = "makefolder", desc = "Создание папки", check = function()
        return makefolder ~= nil, makefolder and "Доступно" or "Недоступно"
    end},
    {cat = "Filesystem", name = "delfolder", desc = "Удаление папки", check = function()
        return delfolder ~= nil, delfolder and "Доступно" or "Недоступно"
    end},
    {cat = "Filesystem", name = "loadfile", desc = "Загрузка файла", check = function()
        return loadfile ~= nil, loadfile and "Доступно" or "Недоступно"
    end},
    
    -- ===== CLIPBOARD (2) =====
    {cat = "Clipboard", name = "setclipboard", desc = "Копирование", check = function()
        return setclipboard ~= nil, setclipboard and "Доступно" or "Недоступно"
    end},
    {cat = "Clipboard", name = "getclipboard", desc = "Получение из буфера", check = function()
        return getclipboard ~= nil, getclipboard and "Доступно" or "Недоступно"
    end},
    
    -- ===== DRAWING (10) =====
    {cat = "Drawing", name = "Drawing.new", desc = "Создание Drawing", check = function()
        return Drawing ~= nil, Drawing and "Доступно" or "Недоступно"
    end},
    {cat = "Drawing", name = "isrenderobj", desc = "Проверка Drawing", check = function()
        return isrenderobj ~= nil, isrenderobj and "Доступно" or "Недоступно"
    end},
    {cat = "Drawing", name = "getrenderproperty", desc = "Свойство рендера", check = function()
        return getrenderproperty ~= nil, getrenderproperty and "Доступно" or "Недоступно"
    end},
    {cat = "Drawing", name = "setrenderproperty", desc = "Установка свойства", check = function()
        return setrenderproperty ~= nil, setrenderproperty and "Доступно" or "Недоступно"
    end},
    {cat = "Drawing", name = "cleardrawcache", desc = "Очистка кэша", check = function()
        return cleardrawcache ~= nil, cleardrawcache and "Доступно" or "Недоступно"
    end},
    {cat = "Drawing", name = "Drawing.Fonts", desc = "Шрифты Drawing", check = function()
        return Drawing and Drawing.Fonts ~= nil, Drawing and "Доступно" or "Недоступно"
    end},
    {cat = "Drawing", name = "Line", desc = "Drawing Line", check = function()
        if Drawing then
            local ok = pcall(function() Drawing.new("Line") end)
            return ok, ok and "Доступно" or "Ошибка"
        end
        return nil, "Недоступно"
    end},
    {cat = "Drawing", name = "Circle", desc = "Drawing Circle", check = function()
        if Drawing then
            local ok = pcall(function() Drawing.new("Circle") end)
            return ok, ok and "Доступно" or "Ошибка"
        end
        return nil, "Недоступно"
    end},
    {cat = "Drawing", name = "Square", desc = "Drawing Square", check = function()
        if Drawing then
            local ok = pcall(function() Drawing.new("Square") end)
            return ok, ok and "Доступно" or "Ошибка"
        end
        return nil, "Недоступно"
    end},
    {cat = "Drawing", name = "Text", desc = "Drawing Text", check = function()
        if Drawing then
            local ok = pcall(function() Drawing.new("Text") end)
            return ok, ok and "Доступно" or "Ошибка"
        end
        return nil, "Недоступно"
    end},
    
    -- ===== INPUT (10) =====
    {cat = "Input", name = "mouse1click", desc = "Клик мыши", check = function()
        return mouse1click ~= nil, mouse1click and "Доступно" or "Недоступно"
    end},
    {cat = "Input", name = "mouse1press", desc = "Нажатие мыши", check = function()
        return mouse1press ~= nil, mouse1press and "Доступно" or "Недоступно"
    end},
    {cat = "Input", name = "mouse1release", desc = "Отпускание мыши", check = function()
        return mouse1release ~= nil, mouse1release and "Доступно" or "Недоступно"
    end},
    {cat = "Input", name = "mouse2click", desc = "ПКМ клик", check = function()
        return mouse2click ~= nil, mouse2click and "Доступно" or "Недоступно"
    end},
    {cat = "Input", name = "mouse2press", desc = "ПКМ нажатие", check = function()
        return mouse2press ~= nil, mouse2press and "Доступно" or "Недоступно"
    end},
    {cat = "Input", name = "mouse2release", desc = "ПКМ отпускание", check = function()
        return mouse2release ~= nil, mouse2release and "Доступно" or "Недоступно"
    end},
    {cat = "Input", name = "keypress", desc = "Нажатие клавиши", check = function()
        return keypress ~= nil, keypress and "Доступно" or "Недоступно"
    end},
    {cat = "Input", name = "keyrelease", desc = "Отпускание клавиши", check = function()
        return keyrelease ~= nil, keyrelease and "Доступно" or "Недоступно"
    end},
    {cat = "Input", name = "mousescroll", desc = "Прокрутка мыши", check = function()
        return mousescroll ~= nil, mousescroll and "Доступно" or "Недоступно"
    end},
    {cat = "Input", name = "mousemoverel", desc = "Относительное движение", check = function()
        return mousemoverel ~= nil, mousemoverel and "Доступно" or "Недоступно"
    end},
    
    -- ===== WEBSOCKET (3) =====
    {cat = "WebSocket", name = "WebSocket.connect", desc = "WebSocket", check = function()
        return WebSocket ~= nil, WebSocket and "Доступно" or "Недоступно"
    end},
    {cat = "WebSocket", name = "websocket.connect", desc = "websocket (lowercase)", check = function()
        return websocket ~= nil, websocket and "Доступно" or "Недоступно"
    end},
    {cat = "WebSocket", name = "ws.connect", desc = "ws подключение", check = function()
        return ws ~= nil, ws and "Доступно" or "Недоступно"
    end},
    
    -- ===== REQUEST (5) =====
    {cat = "Request", name = "request", desc = "HTTP запросы", check = function()
        return request ~= nil, request and "Доступно" or "Недоступно"
    end},
    {cat = "Request", name = "http_request", desc = "HTTP (альт)", check = function()
        return http_request ~= nil, http_request and "Доступно" or "Недоступно"
    end},
    {cat = "Request", name = "syn.request", desc = "Synapse request", check = function()
        return syn and syn.request ~= nil, syn and syn.request and "Доступно" or "Недоступно"
    end},
    {cat = "Request", name = "game:HttpGet", desc = "HttpGet", check = function()
        return pcall(function() game:HttpGet("https://google.com") end), "Native"
    end},
    {cat = "Request", name = "game:HttpPost", desc = "HttpPost", check = function()
        return true, "Native функция"
    end},
    
    -- ===== DEBUG (10) =====
    {cat = "Debug", name = "debug.getupvalue", desc = "Получение upvalue", check = function()
        return debug and debug.getupvalue ~= nil, debug and debug.getupvalue and "Доступно" or "Недоступно"
    end},
    {cat = "Debug", name = "debug.setupvalue", desc = "Установка upvalue", check = function()
        return debug and debug.setupvalue ~= nil, debug and debug.setupvalue and "Доступно" or "Недоступно"
    end},
    {cat = "Debug", name = "debug.getconstant", desc = "Получение константы", check = function()
        return debug and debug.getconstant ~= nil, debug and debug.getconstant and "Доступно" or "Недоступно"
    end},
    {cat = "Debug", name = "debug.setconstant", desc = "Установка константы", check = function()
        return debug and debug.setconstant ~= nil, debug and debug.setconstant and "Доступно" or "Недоступно"
    end},
    {cat = "Debug", name = "debug.getproto", desc = "Получение прототипа", check = function()
        return debug and debug.getproto ~= nil, debug and debug.getproto and "Доступно" or "Недоступно"
    end},
    {cat = "Debug", name = "debug.getinfo", desc = "Информация", check = function()
        return debug and debug.getinfo ~= nil, debug and debug.getinfo and "Доступно" or "Недоступно"
    end},
    {cat = "Debug", name = "debug.getstack", desc = "Stack", check = function()
        return debug and debug.getstack ~= nil, debug and debug.getstack and "Доступно" or "Недоступно"
    end},
    {cat = "Debug", name = "debug.setstack", desc = "Установка stack", check = function()
        return debug and debug.setstack ~= nil, debug and debug.setstack and "Доступно" or "Недоступно"
    end},
    {cat = "Debug", name = "debug.getlocal", desc = "Локальные переменные", check = function()
        return debug and debug.getlocal ~= nil, debug and debug.getlocal and "Доступно" or "Недоступно"
    end},
    {cat = "Debug", name = "debug.setlocal", desc = "Установка локальных", check = function()
        return debug and debug.setlocal ~= nil, debug and debug.setlocal and "Доступно" or "Недоступно"
    end},
    
    -- ===== CRYPT (8) =====
    {cat = "Crypt", name = "crypt.encrypt", desc = "Шифрование", check = function()
        return crypt and crypt.encrypt ~= nil, crypt and crypt.encrypt and "Доступно" or "Недоступно"
    end},
    {cat = "Crypt", name = "crypt.decrypt", desc = "Дешифрование", check = function()
        return crypt and crypt.decrypt ~= nil, crypt and crypt.decrypt and "Доступно" or "Недоступно"
    end},
    {cat = "Crypt", name = "crypt.base64encode", desc = "Base64 encode", check = function()
        return crypt and crypt.base64encode ~= nil, crypt and crypt.base64encode and "Доступно" or "Недоступно"
    end},
    {cat = "Crypt", name = "crypt.base64decode", desc = "Base64 decode", check = function()
        return crypt and crypt.base64decode ~= nil, crypt and crypt.base64decode and "Доступно" or "Недоступно"
    end},
    {cat = "Crypt", name = "crypt.hash", desc = "Хеширование", check = function()
        return crypt and crypt.hash ~= nil, crypt and crypt.hash and "Доступно" or "Недоступно"
    end},
    {cat = "Crypt", name = "crypt.generatekey", desc = "Генерация ключа", check = function()
        return crypt and crypt.generatekey ~= nil, crypt and crypt.generatekey and "Доступно" or "Недоступно"
    end},
    {cat = "Crypt", name = "crypt.random", desc = "Случайные данные", check = function()
        return crypt and crypt.random ~= nil, crypt and crypt.random and "Доступно" or "Недоступно"
    end},
    {cat = "Crypt", name = "base64_encode", desc = "base64_encode", check = function()
        return base64_encode ~= nil, base64_encode and "Доступно" or "Недоступно"
    end},
    
    -- ===== MISC (20) =====
    {cat = "Misc", name = "identifyexecutor", desc = "Определение эксплойта", check = function()
        if identifyexecutor then
            local name, ver = identifyexecutor()
            return true, (name or "Unknown") .. " " .. (ver or "")
        end
        return nil, "Недоступно"
    end},
    {cat = "Misc", name = "getexecutorname", desc = "Имя эксплойта", check = function()
        if getexecutorname then
            return true, getexecutorname()
        end
        return nil, "Недоступно"
    end},
    {cat = "Misc", name = "setfpscap", desc = "Ограничение FPS", check = function()
        return setfpscap ~= nil, setfpscap and "Доступно" or "Недоступно"
    end},
    {cat = "Misc", name = "getfpscap", desc = "Текущий FPS cap", check = function()
        return getfpscap ~= nil, getfpscap and "Доступно" or "Недоступно"
    end},
    {cat = "Misc", name = "loadstring", desc = "Выполнение кода", check = function()
        return loadstring ~= nil, loadstring and "Доступно" or "Недоступно"
    end},
    {cat = "Misc", name = "getthreadidentity", desc = "Thread identity", check = function()
        if getthreadidentity then
            local id = getthreadidentity()
            return true, "Identity: " .. id
        end
        return nil, "Недоступно"
    end},
    {cat = "Misc", name = "setthreadidentity", desc = "Set identity", check = function()
        return setthreadidentity ~= nil, setthreadidentity and "Доступно" or "Недоступно"
    end},
    {cat = "Misc", name = "messagebox", desc = "Системное окно", check = function()
        return messagebox ~= nil, messagebox and "Доступно" or "Недоступно"
    end},
    {cat = "Misc", name = "queue_on_teleport", desc = "Код при телепорте", check = function()
        return queue_on_teleport ~= nil, queue_on_teleport and "Доступно" or "Недоступно"
    end},
    {cat = "Misc", name = "syn_checkcaller", desc = "Synapse checkcaller", check = function()
        return syn_checkcaller ~= nil, syn_checkcaller and "Доступно" or "Недоступно"
    end},
    {cat = "Misc", name = "is_synapse_function", desc = "Проверка Synapse функции", check = function()
        return is_synapse_function ~= nil, is_synapse_function and "Доступно" or "Недоступно"
    end},
    {cat = "Misc", name = "getfflag", desc = "Получить FFlag", check = function()
        return getfflag ~= nil, getfflag and "Доступно" or "Недоступно"
    end},
    {cat = "Misc", name = "setfflag", desc = "Установить FFlag", check = function()
        return setfflag ~= nil, setfflag and "Доступно" or "Недоступно"
    end},
    {cat = "Misc", name = "getnamecallmethod", desc = "Namecall метод", check = function()
        return getnamecallmethod ~= nil, getnamecallmethod and "Доступно" or "Недоступно"
    end},
    {cat = "Misc", name = "isnetworkowner", desc = "Network владелец", check = function()
        return isnetworkowner ~= nil, isnetworkowner and "Доступно" or "Недоступно"
    end},
    {cat = "Misc", name = "getnilinstances", desc = "Nil instances", check = function()
        if getnilinstances then
            return true, #getnilinstances() .. " объектов"
        end
        return nil, "Недоступно"
    end},
    {cat = "Misc", name = "fireclickdetector", desc = "Клик детектор", check = function()
        return fireclickdetector ~= nil, fireclickdetector and "Доступно" or "Недоступно"
    end},
    {cat = "Misc", name = "fireproximityprompt", desc = "Proximity prompt", check = function()
        return fireproximityprompt ~= nil, fireproximityprompt and "Доступно" or "Недоступно"
    end},
    {cat = "Misc", name = "firetouchinterest", desc = "Touch interest", check = function()
        return firetouchinterest ~= nil, firetouchinterest and "Доступно" or "Недоступно"
    end},
    {cat = "Misc", name = "getping", desc = "Получить пинг", check = function()
        local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
        return true, math.floor(ping) .. " ms"
    end},
    
    -- ===== SECURITY (10) =====
    {cat = "Security", name = "Anti-Cheat Detection", desc = "Проверка античита", check = function()
        local count = 0
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("LocalScript") then
                local n = v.Name:lower()
                if n:find("anti") or n:find("detect") or n:find("cheat") then count = count + 1 end
            end
        end
        return count == 0, count > 0 and count .. " подозр." or "Чисто"
    end},
    {cat = "Security", name = "Metatable Protection", desc = "Защита метатаблицы", check = function()
        if getrawmetatable and isreadonly then
            local mt = getrawmetatable(game)
            local ro = isreadonly(mt)
            return ro, ro and "Защищена" or "Уязвима"
        end
        return nil, "Не проверено"
    end},
    {cat = "Security", name = "Memory Usage", desc = "Память", check = function()
        local mem = game:GetService("Stats"):GetTotalMemoryUsageMb()
        return mem < 1500, math.floor(mem) .. " MB"
    end},
    {cat = "Security", name = "Script Count", desc = "Скрипты", check = function()
        local count = 0
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("LocalScript") or v:IsA("ModuleScript") then count = count + 1 end
        end
        return true, count .. " скриптов"
    end},
    {cat = "Security", name = "Remote Encryption", desc = "Шифрование", check = function()
        local enc, total = 0, 0
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
                total = total + 1
                if v.Name:match("%x%x%x%x") then enc = enc + 1 end
            end
        end
        return true, enc .. "/" .. total
    end},
    {cat = "Security", name = "Hooked Functions", desc = "Хукнутые функции", check = function()
        if gethook then
            local count = 0
            local testFuncs = {game.HttpGet, game.GetService, workspace.FindFirstChild}
            for _, f in pairs(testFuncs) do
                if gethook(f) then count = count + 1 end
            end
            return count == 0, count .. " хуков"
        end
        return nil, "Не проверено"
    end},
    {cat = "Security", name = "Environment Check", desc = "Проверка окружения", check = function()
        if getgenv then
            local sus = 0
            for k,v in pairs(getgenv()) do
                if type(k) == "string" and (k:lower():find("cheat") or k:lower():find("hack")) then
                    sus = sus + 1
                end
            end
            return sus == 0, sus .. " подозр."
        end
        return nil, "Не проверено"
    end},
    {cat = "Security", name = "FPS Check", desc = "Проверка FPS", check = function()
        local fps = workspace:GetRealPhysicsFPS()
        return fps > 30, math.floor(fps) .. " FPS"
    end},
    {cat = "Security", name = "Player Permissions", desc = "Права игрока", check = function()
        local plr = game:GetService("Players").LocalPlayer
        return true, plr and "LocalPlayer OK" or "Нет игрока"
    end},
    {cat = "Security", name = "CoreGui Access", desc = "Доступ к CoreGui", check = function()
        local ok = pcall(function()
            return game:GetService("CoreGui")
        end)
        return ok, ok and "Доступно" or "Заблокировано"
    end},
}

-- Функции создания элементов (ОПТИМИЗИРОВАНО)
function Library:CreateCheckItem(data)
    local Item = Instance.new("Frame")
    Item.Name = data.name
    Item.Parent = ScrollingFrame
    Item.BackgroundColor3 = Color3.fromRGB(26, 26, 33)
    Item.BorderSizePixel = 0
    Item.Size = UDim2.new(1, -12, 0, 70)
    Item.Visible = true
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = Item
    
    local Cat = Instance.new("TextLabel")
    Cat.Parent = Item
    Cat.BackgroundTransparency = 1
    Cat.Position = UDim2.new(0, 10, 0, 4)
    Cat.Size = UDim2.new(1, -20, 0, 11)
    Cat.Font = Enum.Font.GothamBold
    Cat.Text = "📁 " .. data.cat
    Cat.TextColor3 = Color3.fromRGB(80, 140, 255)
    Cat.TextSize = 9
    Cat.TextXAlignment = Enum.TextXAlignment.Left
    
    local Name = Instance.new("TextLabel")
    Name.Parent = Item
    Name.BackgroundTransparency = 1
    Name.Position = UDim2.new(0, 10, 0, 18)
    Name.Size = UDim2.new(0.6, 0, 0, 15)
    Name.Font = Enum.Font.GothamBold
    Name.Text = "⚡ " .. data.name
    Name.TextColor3 = Color3.fromRGB(255, 255, 255)
    Name.TextSize = 11
    Name.TextXAlignment = Enum.TextXAlignment.Left
    
    local Desc = Instance.new("TextLabel")
    Desc.Parent = Item
    Desc.BackgroundTransparency = 1
    Desc.Position = UDim2.new(0, 10, 0, 35)
    Desc.Size = UDim2.new(0.6, 0, 0, 11)
    Desc.Font = Enum.Font.Gotham
    Desc.Text = data.desc
    Desc.TextColor3 = Color3.fromRGB(130, 130, 140)
    Desc.TextSize = 9
    Desc.TextXAlignment = Enum.TextXAlignment.Left
    
    local Status = Instance.new("TextLabel")
    Status.Name = "Status"
    Status.Parent = Item
    Status.BackgroundTransparency = 1
    Status.Position = UDim2.new(0, 10, 0, 48)
    Status.Size = UDim2.new(0.6, 0, 0, 15)
    Status.Font = Enum.Font.GothamBold
    Status.Text = "⏳ Ожидание..."
    Status.TextColor3 = Color3.fromRGB(170, 170, 180)
    Status.TextSize = 9
    Status.TextXAlignment = Enum.TextXAlignment.Left
    
    local Btn = Instance.new("TextButton")
    Btn.Name = "CheckButton"
    Btn.Parent = Item
    Btn.BackgroundColor3 = Color3.fromRGB(60, 120, 255)
    Btn.BorderSizePixel = 0
    Btn.Position = UDim2.new(1, -75, 0.5, -14)
    Btn.Size = UDim2.new(0, 65, 0, 28)
    Btn.Font = Enum.Font.GothamBold
    Btn.Text = "▶ Test"
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.TextSize = 10
    Btn.AutoButtonColor = false
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 6)
    BtnCorner.Parent = Btn
    
    return Item, Status, Btn
end

-- Создание вкладок
local CurrentCategory = "All"
local TabButtons = {}

function Library:CreateTab(name, cat)
    local Btn = Instance.new("TextButton")
    Btn.Name = name
    Btn.Parent = TabsFrame
    Btn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
    Btn.BorderSizePixel = 0
    Btn.Size = UDim2.new(1, -16, 0, 32)
    Btn.Font = Enum.Font.GothamBold
    Btn.Text = "  " .. name
    Btn.TextColor3 = Color3.fromRGB(180, 180, 190)
    Btn.TextSize = 10
    Btn.TextXAlignment = Enum.TextXAlignment.Left
    Btn.AutoButtonColor = false
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 7)
    Corner.Parent = Btn
    
    local Indicator = Instance.new("Frame")
    Indicator.Name = "Indicator"
    Indicator.Parent = Btn
    Indicator.BackgroundColor3 = Color3.fromRGB(60, 120, 255)
    Indicator.BorderSizePixel = 0
    Indicator.Size = UDim2.new(0, 0, 1, 0)
    
    local IndCorner = Instance.new("UICorner")
    IndCorner.CornerRadius = UDim.new(0, 7)
    IndCorner.Parent = Indicator
    
    table.insert(TabButtons, {btn = Btn, cat = cat, ind = Indicator})
    
    Btn.MouseButton1Click:Connect(function()
        Library:SwitchCategory(cat)
    end)
    
    return Btn
end

function Library:SwitchCategory(cat)
    CurrentCategory = cat
    
    for _, tab in pairs(TabButtons) do
        if tab.cat == cat then
            tab.btn.BackgroundColor3 = Color3.fromRGB(38, 38, 48)
            tab.btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            tab.ind.Size = UDim2.new(0, 3, 1, 0)
        else
            tab.btn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
            tab.btn.TextColor3 = Color3.fromRGB(180, 180, 190)
            tab.ind.Size = UDim2.new(0, 0, 1, 0)
        end
    end
    
    for _, item in pairs(CheckItems) do
        if cat == "All" then
            item.item.Visible = true
        else
            item.item.Visible = item.data.cat == cat
        end
    end
end

-- Создание вкладок
Library:CreateTab("📋 All", "All")
Library:CreateTab("🎣 Hooks", "Hooks")
Library:CreateTab("🌍 Env", "Environment")
Library:CreateTab("📊 Meta", "Metatables")
Library:CreateTab("📜 Scripts", "Scripts")
Library:CreateTab("🔗 Inst", "Instances")
Library:CreateTab("🔌 Conn", "Connections")
Library:CreateTab("📡 Remote", "Remotes")
Library:CreateTab("🔒 Close", "Closures")
Library:CreateTab("💾 Cache", "Cache")
Library:CreateTab("🖥️ Console", "Console")
Library:CreateTab("📁 Files", "Filesystem")
Library:CreateTab("📋 Clip", "Clipboard")
Library:CreateTab("✏️ Draw", "Drawing")
Library:CreateTab("⌨️ Input", "Input")
Library:CreateTab("🌐 WS", "WebSocket")
Library:CreateTab("📨 HTTP", "Request")
Library:CreateTab("🐛 Debug", "Debug")
Library:CreateTab("🔐 Crypt", "Crypt")
Library:CreateTab("🎲 Misc", "Misc")
Library:CreateTab("🛡️ Sec", "Security")

TabsLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    TabsFrame.CanvasSize = UDim2.new(0, 0, 0, TabsLayout.AbsoluteContentSize.Y + 16)
end)

-- Создание элементов
CheckItems = {}
for _, data in ipairs(CheckFunctions) do
    local item, status, btn = Library:CreateCheckItem(data)
    
    btn.MouseButton1Click:Connect(function()
        btn.Text = "⏳"
        btn.BackgroundColor3 = Color3.fromRGB(90, 90, 100)
        
        task.spawn(function()
            task.wait(0.05)
            local ok, result, msg = pcall(data.check)
            
            if ok and result ~= nil then
                if result then
                    status.Text = "✅ " .. (msg or "OK")
                    status.TextColor3 = Color3.fromRGB(100, 255, 100)
                    btn.BackgroundColor3 = Color3.fromRGB(70, 180, 70)
                    btn.Text = "✓"
                elseif result == false then
                    status.Text = "❌ " .. (msg or "FAIL")
                    status.TextColor3 = Color3.fromRGB(255, 100, 100)
                    btn.BackgroundColor3 = Color3.fromRGB(220, 70, 70)
                    btn.Text = "✗"
                else
                    status.Text = "⚠️ " .. (msg or "N/A")
                    status.TextColor3 = Color3.fromRGB(255, 200, 100)
                    btn.BackgroundColor3 = Color3.fromRGB(220, 160, 70)
                    btn.Text = "⚠"
                end
            else
                status.Text = "❌ Error"
                status.TextColor3 = Color3.fromRGB(255, 100, 100)
                btn.BackgroundColor3 = Color3.fromRGB(220, 70, 70)
                btn.Text = "✗"
            end
        end)
    end)
    
    btn.MouseEnter:Connect(function()
        if btn.Text == "▶ Test" then
            btn.BackgroundColor3 = Color3.fromRGB(80, 140, 255)
        end
    end)
    
    btn.MouseLeave:Connect(function()
        if btn.Text == "▶ Test" then
            btn.BackgroundColor3 = Color3.fromRGB(60, 120, 255)
        end
    end)
    
    table.insert(CheckItems, {
        button = btn,
        status = status,
        check = data.check,
        item = item,
        data = data
    })
end

UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 20)
end)

-- Check All
local checking = false
CheckAllButton.MouseButton1Click:Connect(function()
    if checking then return end
    checking = true
    
    CheckAllButton.Text = "⏳ Checking..."
    local total = 0
    local checked = 0
    
    for _, item in pairs(CheckItems) do
        if item.item.Visible then total = total + 1 end
    end
    
    for i, item in pairs(CheckItems) do
        if item.item.Visible then
            task.spawn(function()
                task.wait(i * 0.01)
                item.button.MouseButton1Click:Fire()
                checked = checked + 1
                StatusText.Text = "Checking... " .. checked .. "/" .. total
            end)
        end
    end
    
    task.wait(total * 0.01 + 0.5)
    CheckAllButton.Text = "🔍 Check All"
    StatusText.Text = "Ready | " .. checked .. "/" .. total .. " checked"
    checking = false
end)

-- Clear
ClearButton.MouseButton1Click:Connect(function()
    for _, item in pairs(CheckItems) do
        item.status.Text = "⏳ Ожидание..."
        item.status.TextColor3 = Color3.fromRGB(170, 170, 180)
        item.button.Text = "▶ Test"
        item.button.BackgroundColor3 = Color3.fromRGB(60, 120, 255)
    end
    StatusText.Text = "Ready | 0/" .. #CheckFunctions .. " checked"
end)

-- Export
ExportButton.MouseButton1Click:Connect(function()
    local txt = "=== CHEAT DETECTOR v3.0 ===\n"
    txt = txt .. "Functions: " .. #CheckFunctions .. "\n"
    txt = txt .. "Time: " .. os.date("%Y-%m-%d %H:%M:%S") .. "\n\n"
    
    for _, item in pairs(CheckItems) do
        txt = txt .. item.data.name .. ": " .. item.status.Text .. "\n"
    end
    
    if setclipboard then
        setclipboard(txt)
        ExportButton.Text = "✅ Copied!"
    else
        print(txt)
        ExportButton.Text = "✅ Console!"
    end
    
    task.wait(1.5)
    ExportButton.Text = "📋 Export"
end)

-- Search
local searchDebounce = false
SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
    if searchDebounce then return end
    searchDebounce = true
    
    task.wait(0.2)
    
    local txt = SearchBox.Text:lower()
    
    for _, item in pairs(CheckItems) do
        if txt == "" then
            if CurrentCategory == "All" then
                item.item.Visible = true
            else
                item.item.Visible = item.data.cat == CurrentCategory
            end
        else
            local match = item.data.name:lower():find(txt) or item.data.desc:lower():find(txt)
            local catMatch = CurrentCategory == "All" or item.data.cat == CurrentCategory
            item.item.Visible = match and catMatch
        end
    end
    
    searchDebounce = false
end)

-- Close
CloseButton.MouseButton1Click:Connect(function()
    TweenService:Create(MainFrame, TweenInfo.new(0.2), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }):Play()
    task.wait(0.2)
    ScreenGui:Destroy()
end)

-- Minimize
local minimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    TweenService:Create(MainFrame, TweenInfo.new(0.2), {
        Size = minimized and UDim2.new(0, 800, 0, 50) or UDim2.new(0, 800, 0, 600)
    }):Play()
    MinimizeButton.Text = minimized and "+" or "−"
end)

-- Dragging
local dragging = false
local dragStart
local startPos

TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- Анимация появления
MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 800, 0, 600),
    Position = UDim2.new(0.25, 0, 0.15, 0)
}):Play()

Library:SwitchCategory("All")

print("🛡️ ULTIMATE CHEAT DETECTOR v3.0 MEGA COMPLETE")
print("📊 Total Functions: " .. #CheckFunctions)
print("✅ Categories: " .. #TabButtons)
print("⚡ Performance: OPTIMIZED")
