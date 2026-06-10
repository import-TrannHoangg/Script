local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local CustomHub = Instance.new("ScreenGui")
CustomHub.Name = "Door_Hub"
CustomHub.Parent = CoreGui
CustomHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local OpenIcon = Instance.new("ImageButton")
OpenIcon.Name = "HubToggleButton"
OpenIcon.Size = UDim2.new(0, 50, 0, 50)
OpenIcon.Position = UDim2.new(0, 20, 0.5, -25)
OpenIcon.BackgroundColor3 = Color3.fromRGB(12, 12, 20)
OpenIcon.BackgroundTransparency = 0.2
OpenIcon.Image = "rbxassetid://104812231776893"
OpenIcon.Visible = false
OpenIcon.Parent = CustomHub

local IconCorner = Instance.new("UICorner")
IconCorner.CornerRadius = UDim.new(1, 0)
IconCorner.Parent = OpenIcon

local IconStroke = Instance.new("UIStroke")
IconStroke.Thickness = 2
IconStroke.Color = Color3.fromRGB(0, 255, 170)
IconStroke.Parent = OpenIcon

local IconGradient = Instance.new("UIGradient")
IconGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 170)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 153, 255))
}
IconGradient.Parent = OpenIcon

local MainFrameWidth, MainFrameHeight = 710, 410

local GlowBackground = Instance.new("Frame")
GlowBackground.Name = "GlowBackground"
GlowBackground.Size = UDim2.new(0, MainFrameWidth + 6, 0, MainFrameHeight + 6)
GlowBackground.Position = UDim2.new(0.5, 0, 0.5, 0)
GlowBackground.AnchorPoint = Vector2.new(0.5, 0.5)
GlowBackground.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GlowBackground.BackgroundTransparency = 0.85
GlowBackground.ZIndex = 1
GlowBackground.Parent = CustomHub

local GlowCorner = Instance.new("UICorner")
GlowCorner.CornerRadius = UDim.new(0, 16)
GlowCorner.Parent = GlowBackground

local UIGradientGlow = Instance.new("UIGradient")
UIGradientGlow.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 170)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 153, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(213, 0, 255))
}
UIGradientGlow.Parent = GlowBackground

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, MainFrameWidth, 0, MainFrameHeight)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 17, 26)
MainFrame.BackgroundTransparency = 0.2
MainFrame.BorderSizePixel = 0
MainFrame.ZIndex = 2
MainFrame.Parent = CustomHub

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 1.5
UIStroke.Transparency = 0.6
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Parent = MainFrame

local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 50)
TitleBar.BackgroundTransparency = 1
TitleBar.ZIndex = 3
TitleBar.Parent = MainFrame

local HeaderLine = Instance.new("Frame")
HeaderLine.Size = UDim2.new(1, -30, 0, 1)
HeaderLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeaderLine.Position = UDim2.new(0, 15, 0, 50)
HeaderLine.BorderSizePixel = 0
HeaderLine.ZIndex = 3
HeaderLine.Parent = MainFrame

local HeaderGrad = Instance.new("UIGradient")
HeaderGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 170)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(213, 0, 255))
}
HeaderGrad.Parent = HeaderLine

local TitleText = Instance.new("TextLabel")
TitleText.Size = UDim2.new(0.4, 0, 0, 24)
TitleText.Position = UDim2.new(0, 20, 0, 13)
TitleText.Text = "Door Hub"
TitleText.Font = Enum.Font.FredokaOne
TitleText.TextSize = 22
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.BackgroundTransparency = 1
TitleText.ZIndex = 3
TitleText.Parent = TitleBar

local Credit = Instance.new("TextLabel")
Credit.Size = UDim2.new(0.4, 0, 0, 12)
Credit.Position = UDim2.new(0, 22, 0, 34)
Credit.BackgroundTransparency = 1
Credit.Text = "by Trần Văn Hoàng"
Credit.Font = Enum.Font.Gotham
Credit.TextSize = 9
Credit.TextColor3 = Color3.fromRGB(140, 140, 140)
Credit.TextXAlignment = Enum.TextXAlignment.Left
Credit.ZIndex = 3
Credit.Parent = TitleBar

local TitleGradient = Instance.new("UIGradient")
TitleGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 170)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 180, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 0, 255))
}
TitleGradient.Parent = TitleText

local ShutDownBtn = Instance.new("TextButton")
ShutDownBtn.Size = UDim2.new(0, 28, 0, 28)
ShutDownBtn.Position = UDim2.new(1, -45, 0, 11)
ShutDownBtn.BackgroundTransparency = 1
ShutDownBtn.Text = "X"
ShutDownBtn.Font = Enum.Font.GothamBold
ShutDownBtn.TextSize = 14
ShutDownBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ShutDownBtn.ZIndex = 3
ShutDownBtn.Parent = TitleBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(1, -85, 0, 11)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "-"
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 18
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.ZIndex = 3
CloseBtn.Parent = TitleBar

local Sidebar = Instance.new("ScrollingFrame")
Sidebar.ScrollBarThickness = 0
Sidebar.CanvasSize = UDim2.new(0, 0, 0, 0)
Sidebar.Size = UDim2.new(0, 175, 1, -65)
Sidebar.Position = UDim2.new(0, 15, 0, 60)
Sidebar.BackgroundTransparency = 1
Sidebar.ZIndex = 3
Sidebar.Parent = MainFrame

local Divider = Instance.new("Frame")
Divider.Size = UDim2.new(0, 1, 1, -75)
Divider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Divider.Position = UDim2.new(0, 200, 0, 65)
Divider.BorderSizePixel = 0
Divider.ZIndex = 3
Divider.Parent = MainFrame

local DividerGradient = Instance.new("UIGradient")
DividerGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 170)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 153, 255))
}
DividerGradient.Parent = Divider

local Container = Instance.new("Frame")
Container.Size = UDim2.new(1, -225, 1, -70)
Container.Position = UDim2.new(0, 212, 0, 60)
Container.BackgroundTransparency = 1
Container.ZIndex = 3
Container.Parent = MainFrame

local SidebarLayout = Instance.new("UIListLayout")
SidebarLayout.Padding = UDim.new(0, 6)
SidebarLayout.Parent = Sidebar

SidebarLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    Sidebar.CanvasSize = UDim2.new(0, 0, 0, SidebarLayout.AbsoluteContentSize.Y + 10)
end)

local Pages = {}
local TabButtons = {}
local ActiveTab = nil

local function CreateTab(tabName, tabIcon)
    local TabBtn = Instance.new("TextButton")
    TabBtn.Size = UDim2.new(1, -8, 0, 36)
    TabBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabBtn.BackgroundTransparency = 1
    TabBtn.Text = ""
    TabBtn.ZIndex = 4
    TabBtn.Parent = Sidebar

    local TabBtnCorner = Instance.new("UICorner")
    TabBtnCorner.CornerRadius = UDim.new(0, 6)
    TabBtnCorner.Parent = TabBtn

    local TabBtnLayout = Instance.new("UIListLayout")
    TabBtnLayout.FillDirection = Enum.FillDirection.Horizontal
    TabBtnLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    TabBtnLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    TabBtnLayout.Padding = UDim.new(0, 10)
    TabBtnLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabBtnLayout.Parent = TabBtn

    local TabPadding = Instance.new("UIPadding")
    TabPadding.PaddingLeft = UDim.new(0, 12)
    TabPadding.Parent = TabBtn

    if tabIcon then
        local TabIconImg = Instance.new("ImageLabel")
        TabIconImg.Size = UDim2.new(0, 16, 0, 16)
        TabIconImg.LayoutOrder = 1
        TabIconImg.BackgroundTransparency = 1
        TabIconImg.Image = tabIcon
        TabIconImg.ZIndex = 4
        TabIconImg.Parent = TabBtn
    end

    local TabLabel = Instance.new("TextLabel")
    TabLabel.Size = UDim2.new(1, -30, 1, 0)
    TabLabel.BackgroundTransparency = 1
    TabLabel.Text = tabName
    TabLabel.Font = Enum.Font.GothamMedium
    TabLabel.TextSize = 12
    TabLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    TabLabel.TextXAlignment = Enum.TextXAlignment.Left
    TabLabel.LayoutOrder = 2
    TabLabel.ZIndex = 4
    TabLabel.Parent = TabBtn

    local Page = Instance.new("ScrollingFrame")
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.BackgroundTransparency = 1
    Page.Visible = false
    Page.ScrollBarThickness = 2
    Page.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
    Page.CanvasSize = UDim2.new(0, 0, 0, 0)
    Page.ZIndex = 3
    Page.Parent = Container

    local PageLayout = Instance.new("UIListLayout")
    PageLayout.Padding = UDim.new(0, 8)
    PageLayout.Parent = Page

    PageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Page.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y + 10)
    end)

    Pages[tabName] = Page
    TabButtons[tabName] = TabBtn

    TabBtn.MouseButton1Click:Connect(function()
        for _, p in pairs(Pages) do p.Visible = false end
        for _, b in pairs(TabButtons) do 
            TweenService:Create(b, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
            TweenService:Create(b:FindFirstChildOfClass("TextLabel"), TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(150, 150, 150)}):Play()
        end
        Page.Visible = true
        TweenService:Create(TabBtn, TweenInfo.new(0.2), {BackgroundTransparency = 0.93, BackgroundColor3 = Color3.fromRGB(255,255,255)}):Play()
        TweenService:Create(TabLabel, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(0, 255, 170)}):Play()
    end)

    if ActiveTab == nil then
        ActiveTab = tabName
        Page.Visible = true
        TabBtn.BackgroundTransparency = 0.93
        TabBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabLabel.TextColor3 = Color3.fromRGB(0, 255, 170)
    end
end

function AddSlider(tabName, text, min, max, default, callback)
    local page = Pages[tabName]
    local SliderFrame = Instance.new("Frame")
    SliderFrame.Size = UDim2.new(1, -10, 0, 58)
    SliderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SliderFrame.BackgroundTransparency = 0.96
    SliderFrame.ZIndex = 4
    SliderFrame.Parent = page

    local SFCorner = Instance.new("UICorner")
    SFCorner.CornerRadius = UDim.new(0, 8)
    SFCorner.Parent = SliderFrame

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.7, 0, 0, 25)
    Label.Position = UDim2.new(0, 15, 0, 6)
    Label.Text = text
    Label.Font = Enum.Font.GothamMedium
    Label.TextSize = 12
    Label.TextColor3 = Color3.fromRGB(210, 210, 210)
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.BackgroundTransparency = 1
    Label.ZIndex = 4
    Label.Parent = SliderFrame

    local ValueBox = Instance.new("TextBox")
    ValueBox.Size = UDim2.new(0, 46, 0, 20)
    ValueBox.Position = UDim2.new(1, -60, 0, 8)
    ValueBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ValueBox.BackgroundTransparency = 0.95
    ValueBox.Text = tostring(default)
    ValueBox.Font = Enum.Font.GothamBold
    ValueBox.TextSize = 11
    ValueBox.TextColor3 = Color3.fromRGB(0, 213, 255)
    ValueBox.ClearTextOnFocus = false
    ValueBox.ZIndex = 5
    ValueBox.Parent = SliderFrame

    local VBCorner = Instance.new("UICorner")
    VBCorner.CornerRadius = UDim.new(0, 4)
    VBCorner.Parent = ValueBox

    local SliderTrack = Instance.new("TextButton")
    SliderTrack.Size = UDim2.new(1, -30, 0, 5)
    SliderTrack.Position = UDim2.new(0, 15, 0, 40)
    SliderTrack.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    SliderTrack.Text = ""
    SliderTrack.AutoButtonColor = false
    SliderTrack.ZIndex = 4
    SliderTrack.Parent = SliderFrame

    local TrackCorner = Instance.new("UICorner")
    TrackCorner.CornerRadius = UDim.new(1, 0)
    TrackCorner.Parent = SliderTrack

    local SliderFill = Instance.new("Frame")
    SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    SliderFill.BorderSizePixel = 0
    SliderFill.ZIndex = 4
    SliderFill.Parent = SliderTrack

    local FillGrad = Instance.new("UIGradient")
    FillGrad.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 170)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 150, 255))
    }
    FillGrad.Parent = SliderFill

    local Knob = Instance.new("Frame")
    Knob.Size = UDim2.new(0, 12, 0, 12)
    Knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Knob.AnchorPoint = Vector2.new(0.5, 0.5)
    Knob.Position = UDim2.new((default - min) / (max - min), 0, 0.5, 0)
    Knob.ZIndex = 5
    Knob.Parent = SliderTrack

    local KnobCorner = Instance.new("UICorner")
    KnobCorner.CornerRadius = UDim.new(1, 0)
    KnobCorner.Parent = Knob

    local sliding = false

    local function updateSliderFromValue(val)
        local clamped = math.clamp(val, min, max)
        local percentage = (clamped - min) / (max - min)
        Knob.Position = UDim2.new(percentage, 0, 0.5, 0)
        SliderFill.Size = UDim2.new(percentage, 0, 1, 0)
        ValueBox.Text = tostring(clamped)
        pcall(callback, clamped)
    end

    local function updateSliderFromInput(input)
        local percentage = math.clamp((input.Position.X - SliderTrack.AbsolutePosition.X) / SliderTrack.AbsoluteSize.X, 0, 1)
        local value = math.floor(min + (max - min) * percentage)
        updateSliderFromValue(value)
    end

    SliderTrack.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            sliding = true
            updateSliderFromInput(input)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if sliding and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateSliderFromInput(input)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            sliding = false
        end
    end)

    ValueBox.FocusLost:Connect(function()
        local num = tonumber(ValueBox.Text)
        updateSliderFromValue(num or min)
    end)
end

function AddToggle(tabName, text, default, callback)
    local page = Pages[tabName]
    local enabled = default

    local ToggleFrame = Instance.new("Frame")
    ToggleFrame.Size = UDim2.new(1, -10, 0, 42)
    ToggleFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ToggleFrame.BackgroundTransparency = 0.96
    ToggleFrame.ZIndex = 4
    ToggleFrame.Parent = page

    local TFCorner = Instance.new("UICorner")
    TFCorner.CornerRadius = UDim.new(0, 8)
    TFCorner.Parent = ToggleFrame

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.7, 0, 1, 0)
    Label.Position = UDim2.new(0, 15, 0, 0)
    Label.Text = text
    Label.Font = Enum.Font.GothamMedium
    Label.TextSize = 13
    Label.TextColor3 = Color3.fromRGB(210, 210, 210)
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.BackgroundTransparency = 1
    Label.ZIndex = 4
    Label.Parent = ToggleFrame

    local ClickBtn = Instance.new("TextButton")
    ClickBtn.Size = UDim2.new(1, 0, 1, 0)
    ClickBtn.BackgroundTransparency = 1
    ClickBtn.Text = ""
    ClickBtn.ZIndex = 5
    ClickBtn.Parent = ToggleFrame

    local Switch = Instance.new("Frame")
    Switch.Size = UDim2.new(0, 38, 0, 18)
    Switch.Position = UDim2.new(1, -53, 0.5, -9)
    Switch.BackgroundColor3 = enabled and Color3.fromRGB(0, 200, 120) or Color3.fromRGB(50, 50, 60)
    Switch.ZIndex = 4
    Switch.Parent = ToggleFrame

    local SwitchCorner = Instance.new("UICorner")
    SwitchCorner.CornerRadius = UDim.new(1, 0)
    SwitchCorner.Parent = Switch

    local Dot = Instance.new("Frame")
    Dot.Size = UDim2.new(0, 12, 0, 12)
    Dot.Position = enabled and UDim2.new(1, -15, 0, 3) or UDim2.new(0, 3, 0, 3)
    Dot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Dot.ZIndex = 5
    Dot.Parent = Switch

    local DotCorner = Instance.new("UICorner")
    DotCorner.CornerRadius = UDim.new(1, 0)
    DotCorner.Parent = Dot

    ClickBtn.MouseButton1Click:Connect(function()
        enabled = not enabled
        local targetPos = enabled and UDim2.new(1, -15, 0, 3) or UDim2.new(0, 3, 0, 3)
        local targetColor = enabled and Color3.fromRGB(0, 200, 120) or Color3.fromRGB(50, 50, 60)
        TweenService:Create(Dot, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = targetPos}):Play()
        TweenService:Create(Switch, TweenInfo.new(0.15), {BackgroundColor3 = targetColor}):Play()
        pcall(callback, enabled)
    end)
end

function AddDropdown(tabName, text, list, callback)
    local page = Pages[tabName]
    local expanded = false

    local DropdownFrame = Instance.new("Frame")
    DropdownFrame.Size = UDim2.new(1, -10, 0, 42)
    DropdownFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    DropdownFrame.BackgroundTransparency = 0.96
    DropdownFrame.ClipsDescendants = true
    DropdownFrame.ZIndex = 4
    DropdownFrame.Parent = page

    local DFCorner = Instance.new("UICorner")
    DFCorner.CornerRadius = UDim.new(0, 8)
    DFCorner.Parent = DropdownFrame

    local DropBtn = Instance.new("TextButton")
    DropBtn.Size = UDim2.new(1, 0, 0, 42)
    DropBtn.BackgroundTransparency = 1
    DropBtn.Text = ""
    DropBtn.ZIndex = 5
    DropBtn.Parent = DropdownFrame

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(0.5, 0, 0, 42)
    Title.Position = UDim2.new(0, 15, 0, 0)
    Title.Text = text
    Title.Font = Enum.Font.GothamMedium
    Title.TextSize = 13
    Title.TextColor3 = Color3.fromRGB(210, 210, 210)
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.BackgroundTransparency = 1
    Title.ZIndex = 4
    Title.Parent = DropdownFrame

    local CurrentSelect = Instance.new("TextLabel")
    CurrentSelect.Size = UDim2.new(0.4, 0, 0, 42)
    CurrentSelect.Position = UDim2.new(1, -60, 0, 0)
    CurrentSelect.Text = "Chưa Chọn"
    CurrentSelect.Font = Enum.Font.Gotham
    CurrentSelect.TextSize = 12
    CurrentSelect.TextColor3 = Color3.fromRGB(140, 140, 150)
    CurrentSelect.TextXAlignment = Enum.TextXAlignment.Right
    CurrentSelect.BackgroundTransparency = 1
    CurrentSelect.ZIndex = 4
    CurrentSelect.Parent = DropdownFrame

    local Arrow = Instance.new("TextLabel")
    Arrow.Size = UDim2.new(0, 20, 0, 42)
    Arrow.Position = UDim2.new(1, -30, 0, 0)
    Arrow.Text = "▼"
    Arrow.Font = Enum.Font.GothamBold
    Arrow.TextSize = 11
    Arrow.TextColor3 = Color3.fromRGB(150, 150, 150)
    Arrow.BackgroundTransparency = 1
    Arrow.ZIndex = 4
    Arrow.Parent = DropdownFrame

    local ListContainer = Instance.new("Frame")
    ListContainer.Size = UDim2.new(1, -20, 0, #list * 32)
    ListContainer.Position = UDim2.new(0, 10, 0, 44)
    ListContainer.BackgroundTransparency = 1
    ListContainer.ZIndex = 4
    ListContainer.Parent = DropdownFrame

    local ListLayout = Instance.new("UIListLayout")
    ListLayout.Padding = UDim.new(0, 4)
    ListLayout.Parent = ListContainer

    for _, item in pairs(list) do
        local ItemBtn = Instance.new("TextButton")
        ItemBtn.Size = UDim2.new(1, 0, 0, 28)
        ItemBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ItemBtn.BackgroundTransparency = 0.97
        ItemBtn.Text = "  " .. tostring(item)
        ItemBtn.Font = Enum.Font.Gotham
        ItemBtn.TextSize = 12
        ItemBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        ItemBtn.TextXAlignment = Enum.TextXAlignment.Left
        ItemBtn.ZIndex = 5
        ItemBtn.Parent = ListContainer
        
        local ICorn = Instance.new("UICorner")
        ICorn.CornerRadius = UDim.new(0, 6)
        ICorn.Parent = ItemBtn
        
        ItemBtn.MouseButton1Click:Connect(function()
            expanded = false
            CurrentSelect.Text = tostring(item)
            Arrow.Text = "▼"
            TweenService:Create(DropdownFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {Size = UDim2.new(1, -10, 0, 42)}):Play()
            pcall(callback, item)
        end)
    end

    DropBtn.MouseButton1Click:Connect(function()
        expanded = not expanded
        if expanded then
            Arrow.Text = "▲"
            TweenService:Create(DropdownFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {Size = UDim2.new(1, -10, 0, 46 + (#list * 32))}):Play()
        else
            Arrow.Text = "▼"
            TweenService:Create(DropdownFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {Size = UDim2.new(1, -10, 0, 42)}):Play()
        end
    end)
end

function AddLabel(tabName, text)
    local page = Pages[tabName]

    local LabelFrame = Instance.new("Frame")
    LabelFrame.Size = UDim2.new(1, -10, 0, 32)
    LabelFrame.BackgroundTransparency = 1
    LabelFrame.ZIndex = 4
    LabelFrame.Parent = page

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, 0, 1, -4)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.Font = Enum.Font.GothamBold
    Label.TextSize = 14
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.ZIndex = 4
    Label.Parent = LabelFrame

    local Gradient = Instance.new("UIGradient")
    Gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 170)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 153, 255))
    }
    Gradient.Parent = Label
end

CreateTab("Farm", "rbxassetid://70492079783125")
AddLabel("Farm", "Farm Chính")
AddToggle("Farm", "Bật Auto Farm Level", false, function(state) end)
AddDropdown("Farm", "Chọn Khu Vực Farm", {"Đảo Khởi Đầu", "Đảo Sa Mạc", "Tuyết Sơn", "Đảo Bầu Trời"}, function(island) end)

CreateTab("Nhiệm Vụ & Vật Phẩm", "rbxassetid://85923648556160")
CreateTab("Câu Cá", "rbxassetid://117464735534300")
CreateTab("Sự Kiện Biển", "rbxassetid://117464735534300")
CreateTab("Raid & Trái Ác Quỷ", "rbxassetid://117786143421965")
CreateTab("Chỉ Số", "rbxassetid://131983014082260")
CreateTab("Dịch Chuyển", "rbxassetid://83054494283840")
CreateTab("Trạng Thái", "rbxassetid://86375240234504")
CreateTab("Thị Giác", "rbxassetid://137611999012404")

CreateTab("Cài Đặt", "rbxassetid://70767352650956")
AddLabel("Cài Đặt", "Cài Đặt Hệ Thống")
AddSlider("Cài Đặt", "Tốc độ chạy (WalkSpeed)", 16, 250, 16, function(value)
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
end)

local function ApplyJumpPower(value)
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
        local humanoid = game.Players.LocalPlayer.Character.Humanoid
        humanoid.UseJumpPower = true
        humanoid.JumpPower = value
    end
end

game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
    local humanoid = char:WaitForChild("Humanoid")
    local currentValue = tonumber(Pages["Cài Đặt"]:FindFirstChild("Độ cao nhảy (JumpPower)") and Pages["Cài Đặt"]["Độ cao nhảy (JumpPower)"]:FindFirstChild("TextBox") and Pages["Cài Đặt"]["Độ cao nhảy (JumpPower)"].TextBox.Text) or 50
    humanoid.UseJumpPower = true
    humanoid.JumpPower = currentValue
end)

AddSlider("Cài Đặt", "Độ cao nhảy (JumpPower)", 50, 300, 50, function(value)
    ApplyJumpPower(value)
end)

CreateTab("Cửa Hàng", "rbxassetid://91250120807261")

ShutDownBtn.MouseButton1Click:Connect(function()
    CustomHub:Destroy()
end)

CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    GlowBackground.Visible = false
    OpenIcon.Visible = true
end)

OpenIcon.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    GlowBackground.Visible = true
    OpenIcon.Visible = false
end)

task.spawn(function()
    local hue = 0
    while task.wait(0.03) do
        hue = (hue + 0.002) % 1
        local c1 = Color3.fromHSV(hue, 0.8, 1)
        local c2 = Color3.fromHSV((hue + 0.33) % 1, 0.8, 1)
        local c3 = Color3.fromHSV((hue + 0.66) % 1, 0.8, 1)

        UIGradientGlow.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, c1),
            ColorSequenceKeypoint.new(0.5, c2),
            ColorSequenceKeypoint.new(1, c3)
        }
        TitleGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, c1),
            ColorSequenceKeypoint.new(0.5, c2),
            ColorSequenceKeypoint.new(1, c3)
        }
    end
end)
