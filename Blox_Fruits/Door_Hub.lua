local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local CurrentWalkSpeed = 16
local CurrentJumpPower = 50

local CustomHub = Instance.new("ScreenGui")
CustomHub.Name = "Door_Hub"
CustomHub.Parent = CoreGui
CustomHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local OpenIcon = Instance.new("ImageButton")
OpenIcon.Name = "HubToggleButton"
OpenIcon.Size = UDim2.new(0, 55, 0, 55)
OpenIcon.Position = UDim2.new(0, 30, 0.5, -27)
OpenIcon.BackgroundColor3 = Color3.fromRGB(15, 17, 26)
OpenIcon.BackgroundTransparency = 0.1
OpenIcon.Image = "rbxassetid://104812231776893"
OpenIcon.Visible = false
OpenIcon.AnchorPoint = Vector2.new(0.5, 0.5)
OpenIcon.ZIndex = 5
OpenIcon.Parent = CustomHub

local IconCorner = Instance.new("UICorner")
IconCorner.CornerRadius = UDim.new(1, 0)
IconCorner.Parent = OpenIcon

local IconStroke = Instance.new("UIStroke")
IconStroke.Thickness = 2.5
IconStroke.Color = Color3.fromRGB(0, 255, 170)
IconStroke.Parent = OpenIcon

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
UIGradientGlow.Parent = GlowBackground

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, MainFrameWidth, 0, MainFrameHeight)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 17, 26)
MainFrame.BackgroundTransparency = 0.15
MainFrame.BorderSizePixel = 0
MainFrame.ZIndex = 2
MainFrame.Parent = CustomHub

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 1.5
UIStroke.Transparency = 0.5
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Parent = MainFrame

local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
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
TitleGradient.Parent = TitleText

local ShutDownBtn = Instance.new("TextButton")
ShutDownBtn.Name = "ShutDownBtn"
ShutDownBtn.Size = UDim2.new(0, 28, 0, 28)
ShutDownBtn.Position = UDim2.new(1, -45, 0, 11)
ShutDownBtn.BackgroundTransparency = 1
ShutDownBtn.Text = "X"
ShutDownBtn.Font = Enum.Font.GothamBold
ShutDownBtn.TextSize = 14
ShutDownBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ShutDownBtn.ZIndex = 4
ShutDownBtn.Parent = TitleBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseBtn"
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(1, -85, 0, 11)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "—"
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 14
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.ZIndex = 4
CloseBtn.Parent = TitleBar

local function AddSystemButtonAnim(btn, hoverColor)
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {TextColor3 = hoverColor}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
    end)
    btn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 24, 0, 24)}):Play()
        end
    end)
    btn.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 28, 0, 28)}):Play()
        end
    end)
end

AddSystemButtonAnim(ShutDownBtn, Color3.fromRGB(255, 65, 65))
AddSystemButtonAnim(CloseBtn, Color3.fromRGB(0, 213, 255))

local function EnableDraggable(dragObject, targetObject, isIcon)
    local dragging = false
    local dragInput, dragStart, startPos
    local dragMoved = false

    dragObject.InputBegan:Connect(function(input)
        if not isIcon and not MainFrame.Visible then return end
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragMoved = false
            dragStart = input.Position
            startPos = targetObject.Position

            if isIcon then
                TweenService:Create(dragObject, TweenInfo.new(0.15, Enum.EasingStyle.Back), {Size = UDim2.new(0, 62, 0, 62)}):Play()
            end
        end
    end)

    dragObject.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            if not isIcon and not MainFrame.Visible then return end
            local delta = input.Position - dragStart
            if delta.Magnitude > 8 then
                dragMoved = true
            end
            
            targetObject.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )

            if not isIcon then
                GlowBackground.Position = targetObject.Position
            end
        end
    end)

     dragObject.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if dragging then
                dragging = false
                if isIcon then
                    TweenService:Create(dragObject, TweenInfo.new(0.15, Enum.EasingStyle.Back), {Size = UDim2.new(0, 55, 0, 55)}):Play()
                    if not dragMoved and OpenIcon.Visible then
                        OpenIcon.Visible = false
                        MainFrame.Visible = true
                        GlowBackground.Visible = true
                        MainFrame.Size = UDim2.new(0, 0, 0, 0)
                        GlowBackground.Size = UDim2.new(0, 0, 0, 0)
                        TweenService:Create(MainFrame, TweenInfo.new(0.35, Enum.EasingStyle.Back), {Size = UDim2.new(0, MainFrameWidth, 0, MainFrameHeight)}):Play()
                        TweenService:Create(GlowBackground, TweenInfo.new(0.35, Enum.EasingStyle.Back), {Size = UDim2.new(0, MainFrameWidth + 6, 0, MainFrameHeight + 6)}):Play()
                    end
                end
            end
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if dragging then
                dragging = false
                if isIcon then
                    TweenService:Create(dragObject, TweenInfo.new(0.15, Enum.EasingStyle.Back), {Size = UDim2.new(0, 55, 0, 55)}):Play()
                end
            end
        end
    end)
end

EnableDraggable(TitleBar, MainFrame, false)
EnableDraggable(OpenIcon, OpenIcon, true)

CloseBtn.MouseButton1Click:Connect(function()
    TweenService:Create(MainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)}):Play()
    TweenService:Create(GlowBackground, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)}):Play()
    task.wait(0.25)
    MainFrame.Visible = false
    GlowBackground.Visible = false
    
    OpenIcon.Size = UDim2.new(0, 0, 0, 0)
    OpenIcon.Visible = true
    TweenService:Create(OpenIcon, TweenInfo.new(0.3, Enum.EasingStyle.Back), {Size = UDim2.new(0, 55, 0, 55)}):Play()
end)

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

function CreateTab(tabName, tabIcon)
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
    TabBtnLayout.Parent = TabBtn

    local TabPadding = Instance.new("UIPadding")
    TabPadding.PaddingLeft = UDim.new(0, 12)
    TabPadding.Parent = TabBtn

    local TabIconImg
    if tabIcon then
        TabIconImg = Instance.new("ImageLabel")
        TabIconImg.Size = UDim2.new(0, 16, 0, 16)
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
    TabLabel.ZIndex = 4
    TabLabel.Parent = TabBtn

    local Page = Instance.new("ScrollingFrame")
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.BackgroundTransparency = 1
    Page.Visible = false
    Page.ScrollBarThickness = 2
    Page.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
    Page.CanvasSize = UDim2.new(0, 0, 0, 0)
    Page.ClipsDescendants = false
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

    TabBtn.MouseEnter:Connect(function()
        if ActiveTab ~= tabName then
            TweenService:Create(TabBtn, TweenInfo.new(0.2), {BackgroundTransparency = 0.97, BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
            TweenService:Create(TabLabel, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(220, 220, 220)}):Play()
        end
    end)

    TabBtn.MouseLeave:Connect(function()
        if ActiveTab ~= tabName then
            TweenService:Create(TabBtn, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
            TweenService:Create(TabLabel, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(150, 150, 150)}):Play()
        end
    end)

    TabBtn.MouseButton1Click:Connect(function()
        ActiveTab = tabName
        for tName, p in pairs(Pages) do p.Visible = (tName == tabName) end
        for tName, b in pairs(TabButtons) do 
            if tName ~= tabName then
                TweenService:Create(b, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
                TweenService:Create(b:FindFirstChildOfClass("TextLabel"), TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(150, 150, 150)}):Play()
            end
        end
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

    local SliderTrack = Instance.new("TextButton")
    SliderTrack.Size = UDim2.new(1, -30, 0, 5)
    SliderTrack.Position = UDim2.new(0, 15, 0, 40)
    SliderTrack.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    SliderTrack.Text = ""
    SliderTrack.AutoButtonColor = false
    SliderTrack.ZIndex = 4
    SliderTrack.Parent = SliderFrame

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

    SliderFrame.MouseEnter:Connect(function()
        if not MainFrame.Visible then return end
        TweenService:Create(SliderFrame, TweenInfo.new(0.2), {BackgroundTransparency = 0.93}):Play()
    end)
    SliderFrame.MouseLeave:Connect(function()
        if not MainFrame.Visible then return end
        TweenService:Create(SliderFrame, TweenInfo.new(0.2), {BackgroundTransparency = 0.96}):Play()
    end)

    local sliding = false
    local function updateSliderFromValue(val)
        local clamped = math.clamp(val, min, max)
        local percentage = (clamped - min) / (max - min)
        TweenService:Create(Knob, TweenInfo.new(0.1), {Position = UDim2.new(percentage, 0, 0.5, 0)}):Play()
        TweenService:Create(SliderFill, TweenInfo.new(0.1), {Size = UDim2.new(percentage, 0, 1, 0)}):Play()
        ValueBox.Text = tostring(clamped)
        pcall(callback, clamped)
    end

    SliderTrack.InputBegan:Connect(function(input)
        if not MainFrame.Visible then return end
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            sliding = true
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if sliding and MainFrame.Visible and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local percentage = math.clamp((input.Position.X - SliderTrack.AbsolutePosition.X) / SliderTrack.AbsoluteSize.X, 0, 1)
            updateSliderFromValue(math.floor(min + (max - min) * percentage))
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            sliding = false
        end
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

    ToggleFrame.MouseEnter:Connect(function()
        if not MainFrame.Visible then return end
        TweenService:Create(ToggleFrame, TweenInfo.new(0.2), {BackgroundTransparency = 0.93}):Play()
    end)
    ToggleFrame.MouseLeave:Connect(function()
        if not MainFrame.Visible then return end
        TweenService:Create(ToggleFrame, TweenInfo.new(0.2), {BackgroundTransparency = 0.96}):Play()
    end)

    ClickBtn.MouseButton1Click:Connect(function()
        if not MainFrame.Visible then return end
        enabled = not enabled
        local targetPos = enabled and UDim2.new(1, -15, 0, 3) or UDim2.new(0, 3, 0, 3)
        local targetColor = enabled and Color3.fromRGB(0, 200, 120) or Color3.fromRGB(50, 50, 60)
        TweenService:Create(Dot, TweenInfo.new(0.2, Enum.EasingStyle.Back), {Position = targetPos}):Play()
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
    DropBtn.ZIndex = 10
    DropBtn.Parent = DropdownFrame

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(0, 220, 0, 42)
    Title.Position = UDim2.new(0, 15, 0, 0)
    Title.Text = text
    Title.Font = Enum.Font.GothamMedium
    Title.TextSize = 13
    Title.TextColor3 = Color3.fromRGB(210, 210, 210)
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.BackgroundTransparency = 1
    Title.ZIndex = 5
    Title.Parent = DropdownFrame

    local CurrentSelect = Instance.new("TextLabel")
    CurrentSelect.Size = UDim2.new(0, 160, 0, 42)
    CurrentSelect.Position = UDim2.new(1, -210, 0, 0)
    CurrentSelect.Text = "Chưa Chọn"
    CurrentSelect.Font = Enum.Font.GothamMedium
    CurrentSelect.TextSize = 12
    CurrentSelect.TextColor3 = Color3.fromRGB(140, 140, 150)
    CurrentSelect.TextXAlignment = Enum.TextXAlignment.Right
    CurrentSelect.BackgroundTransparency = 1
    CurrentSelect.ZIndex = 6
    CurrentSelect.Parent = DropdownFrame

    local Arrow = Instance.new("TextLabel")
    Arrow.Size = UDim2.new(0, 20, 0, 42)
    Arrow.Position = UDim2.new(1, -35, 0, 0)
    Arrow.Text = "▼"
    Arrow.Font = Enum.Font.GothamBold
    Arrow.TextSize = 10
    Arrow.TextColor3 = Color3.fromRGB(150, 150, 150)
    Arrow.BackgroundTransparency = 1
    Arrow.ZIndex = 5
    Arrow.Parent = DropdownFrame

    local ListContainer = Instance.new("Frame")
    ListContainer.Position = UDim2.new(0, 10, 0, 44)
    ListContainer.BackgroundTransparency = 1
    ListContainer.ZIndex = 5
    ListContainer.Parent = DropdownFrame

    local ListLayout = Instance.new("UIListLayout")
    ListLayout.Padding = UDim.new(0, 4)
    ListLayout.Parent = ListContainer

    ListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ListContainer.Size = UDim2.new(1, -20, 0, ListLayout.AbsoluteContentSize.Y)
    end)

    DropdownFrame.MouseEnter:Connect(function()
        if not MainFrame.Visible then return end
        TweenService:Create(DropdownFrame, TweenInfo.new(0.2), {BackgroundTransparency = 0.93}):Play()
    end)
    DropdownFrame.MouseLeave:Connect(function()
        if not MainFrame.Visible then return end
        TweenService:Create(DropdownFrame, TweenInfo.new(0.2), {BackgroundTransparency = 0.96}):Play()
    end)

    for _, item in pairs(list) do
        local ItemBtn = Instance.new("TextButton")
        ItemBtn.Size = UDim2.new(1, 0, 0, 28)
        ItemBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ItemBtn.BackgroundTransparency = 0.97
        ItemBtn.Text = "   " .. tostring(item)
        ItemBtn.Font = Enum.Font.Gotham
        ItemBtn.TextSize = 12
        ItemBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        ItemBtn.TextXAlignment = Enum.TextXAlignment.Left
        ItemBtn.ClipsDescendants = true
        ItemBtn.ZIndex = 8
        ItemBtn.Parent = ListContainer
        
        local ICorn = Instance.new("UICorner")
        ICorn.CornerRadius = UDim.new(0, 6)
        ICorn.Parent = ItemBtn
        
        ItemBtn.MouseEnter:Connect(function()
            TweenService:Create(ItemBtn, TweenInfo.new(0.15), {BackgroundTransparency = 0.9, TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
        end)
        ItemBtn.MouseLeave:Connect(function()
            TweenService:Create(ItemBtn, TweenInfo.new(0.15), {BackgroundTransparency = 0.97, TextColor3 = Color3.fromRGB(180, 180, 180)}):Play()
        end)
        
        ItemBtn.MouseButton1Click:Connect(function()
            if not MainFrame.Visible then return end
            expanded = false
            CurrentSelect.Text = tostring(item)
            CurrentSelect.TextColor3 = Color3.fromRGB(0, 255, 170)
            Arrow.Text = "▼"
            DropdownFrame.ZIndex = 4
            TweenService:Create(DropdownFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(1, -10, 0, 42)}):Play()
            task.wait(0.3)
            DropdownFrame.ClipsDescendants = true
            pcall(callback, item)
        end)
    end

    DropBtn.MouseButton1Click:Connect(function()
        if not MainFrame.Visible then return end
        expanded = not expanded
        if expanded then
            DropdownFrame.ClipsDescendants = false
            DropdownFrame.ZIndex = 15
            Arrow.Text = "▲"
            local targetHeight = 48 + ListLayout.AbsoluteContentSize.Y
            TweenService:Create(DropdownFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(1, -10, 0, targetHeight)}):Play()
        else
            Arrow.Text = "▼"
            DropdownFrame.ZIndex = 4
            TweenService:Create(DropdownFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(1, -10, 0, 42)}):Play()
            task.wait(0.3)
            if not expanded then DropdownFrame.ClipsDescendants = true end
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
    Label.Size = UDim2.new(1, 0, 1, 0)
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

AddToggle("Farm", "Bật Auto Farm Level", false, function(state)
    if state then
        print("Đã bật Auto Farm")
    else
        print("Đã tắt Auto Farm")
    end
end)

AddDropdown("Farm", "Chọn Khu Vực Farm", {"Đảo Khởi Đầu", "Đảo Sa Mạc", "Tuyết Sơn", "Đảo Bầu Trời", "Đảo Ma Quỷ"}, function(island) end)

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
AddSlider("Cài Đặt", "Tốc Độ Chạy (WalkSpeed)", 16, 250, 16, function(value)
    CurrentWalkSpeed = value
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
end)

local function ApplySavedStats(character)
    local humanoid = character:WaitForChild("Humanoid", 10)
    if humanoid then
        humanoid.WalkSpeed = CurrentWalkSpeed
        
        humanoid.UseJumpPower = true
        humanoid.JumpPower = CurrentJumpPower
    end
end

game.Players.LocalPlayer.CharacterAdded:Connect(ApplySavedStats)

if game.Players.LocalPlayer.Character then
    ApplySavedStats(game.Players.LocalPlayer.Character)
end

AddSlider("Cài Đặt", "Độ Cao Nhảy (JumpPower)", 50, 300, 50, function(value)
    CurrentJumpPower = value
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
        local humanoid = game.Players.LocalPlayer.Character.Humanoid
        humanoid.UseJumpPower = true
        humanoid.JumpPower = value
    end
end)

CreateTab("Cửa Hàng", "rbxassetid://91250120807261")

local ConfirmFrame = Instance.new("Frame")
ConfirmFrame.Size = UDim2.new(0, 0, 0, 0)
ConfirmFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
ConfirmFrame.AnchorPoint = Vector2.new(0.5, 0.5)
ConfirmFrame.BackgroundColor3 = Color3.fromRGB(20, 22, 33)
ConfirmFrame.Visible = false
ConfirmFrame.ClipsDescendants = true
ConfirmFrame.ZIndex = 20
ConfirmFrame.Parent = CustomHub

local ConfirmCorner = Instance.new("UICorner")
ConfirmCorner.CornerRadius = UDim.new(0, 10)
ConfirmCorner.Parent = ConfirmFrame

local ConfirmStroke = Instance.new("UIStroke")
ConfirmStroke.Thickness = 1.5
ConfirmStroke.Color = Color3.fromRGB(255, 65, 65)
ConfirmStroke.Parent = ConfirmFrame

local ConfirmText = Instance.new("TextLabel")
ConfirmText.Size = UDim2.new(1, -20, 0, 50)
ConfirmText.Position = UDim2.new(0, 10, 0, 15)
ConfirmText.BackgroundTransparency = 1
ConfirmText.Text = "Bạn có chắc chắn muốn tắt UI không ?"
ConfirmText.Font = Enum.Font.GothamMedium
ConfirmText.TextSize = 14
ConfirmText.TextColor3 = Color3.fromRGB(240, 240, 240)
ConfirmText.ZIndex = 21
ConfirmText.Parent = ConfirmFrame

local YesBtn = Instance.new("TextButton")
YesBtn.Size = UDim2.new(0, 100, 0, 32)
YesBtn.Position = UDim2.new(0, 40, 0, 85)
YesBtn.BackgroundColor3 = Color3.fromRGB(255, 65, 65)
YesBtn.Text = "Xác Nhận"
YesBtn.Font = Enum.Font.GothamBold
YesBtn.TextSize = 12
YesBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
YesBtn.ZIndex = 21
YesBtn.Parent = ConfirmFrame

local YesCorner = Instance.new("UICorner")
YesCorner.CornerRadius = UDim.new(0, 6)
YesCorner.Parent = YesBtn

local NoBtn = Instance.new("TextButton")
NoBtn.Size = UDim2.new(0, 100, 0, 32)
NoBtn.Position = UDim2.new(1, -140, 0, 85)
NoBtn.BackgroundColor3 = Color3.fromRGB(50, 53, 70)
NoBtn.Text = "Hủy Bỏ"
NoBtn.Font = Enum.Font.GothamBold
NoBtn.TextSize = 12
NoBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
NoBtn.ZIndex = 21
NoBtn.Parent = ConfirmFrame

local NoCorner = Instance.new("UICorner")
NoCorner.CornerRadius = UDim.new(0, 6)
NoCorner.Parent = NoBtn

ShutDownBtn.MouseButton1Click:Connect(function()
    if not MainFrame.Visible then return end
    ConfirmFrame.Visible = true
    TweenService:Create(ConfirmFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back), {Size = UDim2.new(0, 300, 0, 140)}):Play()
end)

YesBtn.MouseButton1Click:Connect(function()
    CustomHub:Destroy()
end)

NoBtn.MouseButton1Click:Connect(function()
    TweenService:Create(ConfirmFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 0, 0, 0)}):Play()
    task.wait(0.2)
    ConfirmFrame.Visible = false
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
        IconStroke.Color = c1
    end
end)
