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

local GlowBackground = Instance.new("Frame")
GlowBackground.Name = "GlowBackground"
GlowBackground.Size = UDim2.new(0, 560, 0, 410)
GlowBackground.Position = UDim2.new(0.5,-360,0.5,-250)
GlowBackground.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GlowBackground.BackgroundTransparency = 0.8
GlowBackground.Parent = CustomHub

local GlowCorner = Instance.new("UICorner")
GlowCorner.CornerRadius = UDim.new(0, 24)
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
MainFrame.Position = UDim2.new(0.5,-355,0.5,-245)
MainFrame.Size = UDim2.new(0,710,0,490)
GlowBackground.Size = UDim2.new(0,560,0,410)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 20)
MainFrame.BackgroundTransparency = 0.35
MainFrame.BorderSizePixel = 0
MainFrame.Parent = CustomHub

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 20)
MainCorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 1.5
UIStroke.Transparency = 0.5
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Parent = MainFrame

local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 50)
TitleBar.BackgroundTransparency = 1
TitleBar.Parent = MainFrame

local HeaderLine = Instance.new("Frame")
HeaderLine.Size = UDim2.new(1,-20,0,1)
HeaderLine.BackgroundColor3 = Color3.fromRGB(255,255,255)
HeaderLine.Position = UDim2.new(0,10,0,50)

HeaderLine.BorderSizePixel = 0
HeaderLine.Parent = MainFrame

local HeaderGrad = Instance.new("UIGradient")
HeaderGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0,255,170)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(213,0,255))
}
HeaderGrad.Parent = HeaderLine

local TitleText = Instance.new("TextLabel")
TitleText.Size = UDim2.new(0.6, 0, 1, 0)
TitleText.Position = UDim2.new(0, 20, 0, 0)
TitleText.Text = "Door Hub"
TitleText.Font = Enum.Font.FredokaOne
TitleText.TextSize = 22
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.BackgroundTransparency = 1
TitleText.Parent = TitleBar

local Credit = Instance.new("TextLabel")
Credit.Size = UDim2.new(0.5,0,0,14)
Credit.Position = UDim2.new(0,22,0,26)
Credit.BackgroundTransparency = 1
Credit.Text = "by Trần Văn Hoàng"
Credit.Font = Enum.Font.Gotham
Credit.TextSize = 10
Credit.TextColor3 = Color3.fromRGB(140,140,140)
Credit.TextXAlignment = Enum.TextXAlignment.Left
Credit.Parent = TitleBar

local TitleGradient = Instance.new("UIGradient")
TitleGradient.Color = ColorSequence.new{
ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 170)),
ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 180, 255)),
ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 0, 255))
}
TitleGradient.Parent = TitleText

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 48, 0, 48)
CloseBtn.Position = UDim2.new(1, -110, 0, 6)

CloseBtn.BackgroundTransparency = 1

CloseBtn.Text = "-"
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 22
CloseBtn.TextColor3 = Color3.fromRGB(255,255,255)

CloseBtn.Parent = TitleBar

local CloseStroke = Instance.new("UIStroke")
CloseStroke.Color = Color3.fromRGB(255,255,255)
CloseStroke.Transparency = 0.5
CloseStroke.Parent = CloseBtn

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0,8)
CloseCorner.Parent = CloseBtn

local ShutDownBtn = Instance.new("TextButton")
ShutDownBtn.Size = UDim2.new(0,48,0,48)
ShutDownBtn.Position = UDim2.new(1,-55,0,6)
ShutDownBtn.BackgroundTransparency = 1
ShutDownBtn.Text = "X"
ShutDownBtn.Font = Enum.Font.GothamBold
ShutDownBtn.TextSize = 22
ShutDownBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ShutDownBtn.Parent = TitleBar

local ShutDownStroke = Instance.new("UIStroke")
ShutDownStroke.Color = Color3.fromRGB(255,255,255)
ShutDownStroke.Transparency = 0.5
ShutDownStroke.Parent = ShutDownBtn

local ConfirmFrame = Instance.new("Frame")
ConfirmFrame.Name = "ConfirmFrame"
ConfirmFrame.Size = UDim2.new(0, 280, 0, 140)
ConfirmFrame.Position = UDim2.new(0.5, -140, 0.5, -70)
ConfirmFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 26)
ConfirmFrame.BorderSizePixel = 0
ConfirmFrame.ZIndex = 10
ConfirmFrame.Visible = false
ConfirmFrame.Parent = CustomHub

local ConfirmCorner = Instance.new("UICorner")
ConfirmCorner.CornerRadius = UDim.new(0, 12)
ConfirmCorner.Parent = ConfirmFrame

local ConfirmStroke = Instance.new("UIStroke")
ConfirmStroke.Thickness = 1.5
ConfirmStroke.Color = Color3.fromRGB(255, 80, 80)
ConfirmStroke.Parent = ConfirmFrame

local ConfirmText = Instance.new("TextLabel")
ConfirmText.Size = UDim2.new(1, -20, 0, 50)
ConfirmText.Position = UDim2.new(0, 10, 0, 20)
ConfirmText.BackgroundTransparency = 1
ConfirmText.Text = "Bạn có chắc chắn muốn tắt hoàn toàn UI và các Icon không ?"
ConfirmText.Font = Enum.Font.GothamMedium
ConfirmText.TextSize = 14
ConfirmText.TextColor3 = Color3.fromRGB(240, 240, 240)
ConfirmText.TextWrapped = true
ConfirmText.ZIndex = 10
ConfirmText.Parent = ConfirmFrame

local YesBtn = Instance.new("TextButton")
YesBtn.Size = UDim2.new(0, 100, 0, 32)
YesBtn.Position = UDim2.new(0, 30, 1, -45)
YesBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
YesBtn.Text = "Xác Nhận"
YesBtn.Font = Enum.Font.GothamBold
YesBtn.TextSize = 13
YesBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
YesBtn.ZIndex = 10
YesBtn.Parent = ConfirmFrame

local YesCorner = Instance.new("UICorner")
YesCorner.CornerRadius = UDim.new(0, 8)
YesCorner.Parent = YesBtn

local NoBtn = Instance.new("TextButton")
NoBtn.Size = UDim2.new(0, 100, 0, 32)
NoBtn.Position = UDim2.new(1, -130, 1, -45)
NoBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
NoBtn.Text = "Hủy"
NoBtn.Font = Enum.Font.GothamBold
NoBtn.TextSize = 13
NoBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
NoBtn.ZIndex = 10
NoBtn.Parent = ConfirmFrame

local NoCorner = Instance.new("UICorner")
NoCorner.CornerRadius = UDim.new(0, 8)
NoCorner.Parent = NoBtn

local Sidebar = Instance.new("ScrollingFrame")
Sidebar.ScrollBarThickness = 0
Sidebar.CanvasSize = UDim2.new(0,0,0,0)
Sidebar.Size = UDim2.new(0, 140, 1, -70)
Sidebar.Position = UDim2.new(0, 15, 0, 55)
Sidebar.BackgroundTransparency = 1
Sidebar.Parent = MainFrame

local SidebarIndicator = Instance.new("Frame")
SidebarIndicator.Size = UDim2.new(0,2,0.15,0)
SidebarIndicator.Position = UDim2.new(1,-3,0,0)
SidebarIndicator.BackgroundColor3 = Color3.fromRGB(0,255,170)
SidebarIndicator.Parent = Sidebar

local IndicatorCorner = Instance.new("UICorner")
IndicatorCorner.CornerRadius = UDim.new(1,0)
IndicatorCorner.Parent = SidebarIndicator

Sidebar:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
    local max =
        math.max(
            Sidebar.CanvasSize.Y.Offset
            - Sidebar.AbsoluteWindowSize.Y,
            1
        )

    SidebarIndicator.Position =
        UDim2.new(
            1,
            -3,
            Sidebar.CanvasPosition.Y / max,
            0
        )

end)

local SidebarLayout = Instance.new("UIListLayout")
SidebarLayout.Padding = UDim.new(0, 8)
SidebarLayout.Parent = Sidebar

SidebarLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    Sidebar.CanvasSize = UDim2.new(
        0,
        0,
        0,
        SidebarLayout.AbsoluteContentSize.Y + 20
    )
end)

local Container = Instance.new("Frame")
Container.Size = UDim2.new(1, -185, 1, -70)
Container.Position = UDim2.new(0, 170, 0, 55)
Container.BackgroundTransparency = 1
Container.Parent = MainFrame

local Divider = Instance.new("Frame")

Divider.Size = UDim2.new(0,1,1,-80)
Divider.BackgroundColor3 = Color3.fromRGB(255,255,255)
Divider.Position = UDim2.new(0,155,0,70)
Divider.BorderSizePixel = 0
Divider.Parent = MainFrame

local DividerGradient = Instance.new("UIGradient")
DividerGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0,255,170)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0,153,255))
}
DividerGradient.Parent = Divider

local Pages = {}
local TabButtons = {}
local ActiveTab = nil

local function CreateIconFrame(parent, iconStr, xPos, yPos)
local IconBorderOuter = Instance.new("Frame")
IconBorderOuter.Size = UDim2.new(0, 32, 0, 32)
IconBorderOuter.Position = UDim2.new(0, xPos, 0, yPos)
IconBorderOuter.BackgroundColor3 = Color3.fromRGB(0, 255, 170)
IconBorderOuter.BorderSizePixel = 0
IconBorderOuter.Parent = parent

local OuterCorner = Instance.new("UICorner")
OuterCorner.CornerRadius = UDim.new(0, 9)
OuterCorner.Parent = IconBorderOuter

local BorderGrad = Instance.new("UIGradient")
BorderGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 170)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 153, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(213, 0, 255))
}
BorderGrad.Parent = IconBorderOuter

local GlowStroke = Instance.new("UIStroke")
GlowStroke.Thickness = 2
GlowStroke.Color = Color3.fromRGB(0, 200, 255)
GlowStroke.Transparency = 0.3
GlowStroke.Parent = IconBorderOuter

local IconInner = Instance.new("Frame")
IconInner.Size = UDim2.new(1, -4, 1, -4)
IconInner.Position = UDim2.new(0, 2, 0, 2)
IconInner.BackgroundColor3 = Color3.fromRGB(14, 14, 24)
IconInner.BorderSizePixel = 0
IconInner.Parent = IconBorderOuter

local InnerCorner = Instance.new("UICorner")
InnerCorner.CornerRadius = UDim.new(0, 7)
InnerCorner.Parent = IconInner

if string.sub(iconStr, 1, 13) == "rbxassetid://" then
    local IconImg = Instance.new("ImageLabel")
    IconImg.Size = UDim2.new(1, -6, 1, -6)
    IconImg.Position = UDim2.new(0, 3, 0, 3)
    IconImg.BackgroundTransparency = 1
    IconImg.Image = iconStr
    IconImg.Parent = IconInner
else
    local IconLabel = Instance.new("TextLabel")
    IconLabel.Size = UDim2.new(1, 0, 1, 0)
    IconLabel.BackgroundTransparency = 1
    IconLabel.Text = iconStr
    IconLabel.Font = Enum.Font.GothamBold
    IconLabel.TextSize = 14
    IconLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    IconLabel.Parent = IconInner
end

return IconBorderOuter, BorderGrad

end

local function CreateTab(tabName, tabIcon)
local TabBtn = Instance.new("TextButton")
TabBtn.Size = UDim2.new(1,-5,0,38)
TabBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabBtn.BackgroundTransparency = 0.96
TabBtn.Text = ""
TabBtn.Parent = Sidebar

local TabBtnCorner = Instance.new("UICorner")
TabBtnCorner.CornerRadius = UDim.new(0, 10)
TabBtnCorner.Parent = TabBtn

local TabBtnLayout = Instance.new("UIListLayout")
TabBtnLayout.FillDirection = Enum.FillDirection.Horizontal
TabBtnLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
TabBtnLayout.VerticalAlignment = Enum.VerticalAlignment.Center
TabBtnLayout.Padding = UDim.new(0, 8)
TabBtnLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabBtnLayout.Parent = TabBtn

local TabPadding = Instance.new("UIPadding")
TabPadding.PaddingLeft = UDim.new(0, 10)
TabPadding.Parent = TabBtn

if tabIcon then
    local TabIconImg = Instance.new("ImageLabel")
    TabIconImg.Size = UDim2.new(0,18,0,18)
    TabIconImg.LayoutOrder = 1
    TabIconImg.BackgroundTransparency = 1
    TabIconImg.Image = tabIcon
    TabIconImg.Parent = TabBtn
end

local TabLabel = Instance.new("TextLabel")
TabLabel.Size = UDim2.new(1,-40,1,0)
TabLabel.BackgroundTransparency = 1
TabLabel.Text = tabName
TabLabel.Font = Enum.Font.GothamBold
TabLabel.TextSize = 12
TabLabel.TextColor3 = Color3.fromRGB(160, 160, 160)
TabLabel.TextXAlignment = Enum.TextXAlignment.Left
TabLabel.LayoutOrder = 2
TabLabel.Parent = TabBtn
TabLabel.TextYAlignment = Enum.TextYAlignment.Center

local Page = Instance.new("ScrollingFrame")
Page.Size = UDim2.new(1, 0, 1, 0)
Page.BackgroundTransparency = 1
Page.Visible = false
Page.ScrollBarThickness = 3
Page.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
Page.CanvasSize = UDim2.new(0, 0, 0, 0)
Page.Parent = Container

local PageIndicator = Instance.new("Frame")
PageIndicator.Size = UDim2.new(0,2,0.15,0)
PageIndicator.Position = UDim2.new(1,-2,0,0)
PageIndicator.BackgroundColor3 = Color3.fromRGB(0,170,255)
PageIndicator.Parent = Page

local PICorner = Instance.new("UICorner")
PICorner.CornerRadius = UDim.new(1,0)
PICorner.Parent = PageIndicator

Page:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
    local max =
        math.max(
            Page.CanvasSize.Y.Offset
            - Page.AbsoluteWindowSize.Y,
            1
        )

    PageIndicator.Position =
        UDim2.new(
            1,
            -2,
            Page.CanvasPosition.Y / max,
            0
        )

end)

local PageLayout = Instance.new("UIListLayout")
PageLayout.Padding = UDim.new(0, 10)
PageLayout.Parent = Page

PageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    Page.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y + 20)
end)

Pages[tabName] = Page
TabButtons[tabName] = TabBtn

TabBtn.MouseButton1Click:Connect(function()
    for _, p in pairs(Pages) do p.Visible = false end
    for _, b in pairs(TabButtons) do 
        TweenService:Create(b, TweenInfo.new(0.3), {BackgroundTransparency = 0.96}):Play()
        TweenService:Create(b:FindFirstChildOfClass("TextLabel"), TweenInfo.new(0.3), {TextColor3 = Color3.fromRGB(160, 160, 160)}):Play()
    end
    Page.Visible = true
    TweenService:Create(TabBtn, TweenInfo.new(0.3), {BackgroundTransparency = 0.85}):Play()
    TweenService:Create(TabLabel, TweenInfo.new(0.3), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
end)

if ActiveTab == nil then
    ActiveTab = tabName
    Page.Visible = true
    TabBtn.BackgroundTransparency = 0.85
    TabLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
end

end

function AddSlider(tabName, text, min, max, default, callback)
local page = Pages[tabName]
local SliderFrame = Instance.new("Frame")
SliderFrame.Size = UDim2.new(1, -10, 0, 55)
SliderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SliderFrame.BackgroundTransparency = 0.94
SliderFrame.Parent = page

local SFCorner = Instance.new("UICorner")
SFCorner.CornerRadius = UDim.new(0, 10)
SFCorner.Parent = SliderFrame

local Label = Instance.new("TextLabel")
Label.Size = UDim2.new(0.5, 0, 0, 25)
Label.Position = UDim2.new(0, 50, 0, 4)
Label.Text = text
Label.Font = Enum.Font.GothamMedium
Label.TextSize = 12
Label.TextColor3 = Color3.fromRGB(220, 220, 220)
Label.TextXAlignment = Enum.TextXAlignment.Left
Label.BackgroundTransparency = 1
Label.Parent = SliderFrame

local ValueBox = Instance.new("TextBox")
ValueBox.Size = UDim2.new(0, 55, 0, 20)
ValueBox.Position = UDim2.new(1, -67, 0, 6)
ValueBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ValueBox.BackgroundTransparency = 0.92
ValueBox.Text = tostring(default)
ValueBox.Font = Enum.Font.GothamBold
ValueBox.TextSize = 12
ValueBox.TextColor3 = Color3.fromRGB(0, 213, 255)
ValueBox.ClearTextOnFocus = false
ValueBox.Parent = SliderFrame

local VBCorner = Instance.new("UICorner")
VBCorner.CornerRadius = UDim.new(0, 5)
VBCorner.Parent = ValueBox

local VBBorder = Instance.new("UIStroke")
VBBorder.Thickness = 1
VBBorder.Color = Color3.fromRGB(0, 213, 255)
VBBorder.Transparency = 0.6
VBBorder.Parent = ValueBox

local SliderTrack = Instance.new("TextButton")
SliderTrack.Size = UDim2.new(1, -110, 0, 6)
SliderTrack.Position = UDim2.new(0, 50, 0, 38)
SliderTrack.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
SliderTrack.Text = ""
SliderTrack.AutoButtonColor = false
SliderTrack.Parent = SliderFrame

local TrackCorner = Instance.new("UICorner")
TrackCorner.CornerRadius = UDim.new(1, 0)
TrackCorner.Parent = SliderTrack

local SliderFill = Instance.new("Frame")
SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
SliderFill.BackgroundColor3 = Color3.fromRGB(255, 60, 100)
SliderFill.BorderSizePixel = 0
SliderFill.Parent = SliderTrack

local FillGrad = Instance.new("UIGradient")
FillGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 170)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 150, 255))
}
FillGrad.Parent = SliderFill

local FillCorner = Instance.new("UICorner")
FillCorner.CornerRadius = UDim.new(1, 0)
FillCorner.Parent = SliderFill

local sliding = false

local Knob = Instance.new("Frame")
Knob.Size = UDim2.new(0,14,0,14)
Knob.BackgroundColor3 = Color3.fromRGB(255,255,255)
BorderSizePixel = 0
Knob.AnchorPoint = Vector2.new(0.5,0.5)
Knob.Position = UDim2.new(
    (default-min)/(max-min),
    0,
    0.5,
    0
)
Knob.Parent = SliderTrack

local KnobCorner = Instance.new("UICorner")
KnobCorner.CornerRadius = UDim.new(1,0)
KnobCorner.Parent = Knob

local function updateSliderFromValue(val)
    local clamped = math.clamp(val, min, max)
    local percentage = (clamped - min) / (max - min)
    Knob.Position = UDim2.new(
        percentage,
        0,
        0.5,
        0
    )
    SliderFill.Size = UDim2.new(percentage, 0, 1, 0)
    ValueBox.Text = tostring(clamped)
    pcall(callback, clamped)
end

local function updateSliderFromInput(input)
    local percentage = math.clamp((input.Position.X - SliderTrack.AbsolutePosition.X) / SliderTrack.AbsoluteSize.X, 0, 1)
    local value = math.floor(min + (max - min) * percentage)
    Knob.Position = UDim2.new(
        percentage,
        0,
        0.5,
        0
    )
    ValueBox.Text = tostring(value)
    SliderFill.Size = UDim2.new(percentage, 0, 1, 0)
    pcall(callback, value)
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

ValueBox.FocusLost:Connect(function(enterPressed)
    local num = tonumber(ValueBox.Text)
    if num then updateSliderFromValue(num)
    else updateSliderFromValue(min) end
end)


end

function AddButton(tabName, text, callback)
local page = Pages[tabName]

local Button = Instance.new("TextButton")
Button.Size = UDim2.new(1, -10, 0, 42)
Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Button.BackgroundTransparency = 0.94
Button.Text = ""
Button.Parent = page

local BTCorner = Instance.new("UICorner")
BTCorner.CornerRadius = UDim.new(0, 10)
BTCorner.Parent = Button

local BLabel = Instance.new("TextLabel")
BLabel.Position = UDim2.new(0, 15, 0, 0)
BLabel.Size = UDim2.new(1, -30, 1, 0)
BLabel.Text = text
BLabel.Font = Enum.Font.GothamMedium
BLabel.TextSize = 13
BLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
BLabel.TextXAlignment = Enum.TextXAlignment.Left
BLabel.BackgroundTransparency = 1
BLabel.Parent = Button

Button.MouseEnter:Connect(function()
    TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundTransparency = 0.88, BackgroundColor3 = Color3.fromRGB(40, 40, 60)}):Play()
end)
Button.MouseLeave:Connect(function()
    TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundTransparency = 0.94, BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
end)

Button.MouseButton1Click:Connect(function()
    Button.BackgroundTransparency = 0.75
    task.wait(0.08)
    Button.BackgroundTransparency = 0.88
    pcall(callback)
end)

Button.MouseButton1Down:Connect(function()
    TweenService:Create(
        Button,
        TweenInfo.new(0.1),
        {
            Size = UDim2.new(1,-14,0,38)
        }
    ):Play()
end)

Button.MouseButton1Up:Connect(function()
    TweenService:Create(
        Button,
        TweenInfo.new(0.1),
        {
            Size = UDim2.new(1,-10,0,42)
        }
    ):Play()
end)

end

function AddTextBox(tabName, text, placeholder, callback)
local page = Pages[tabName]
local BoxFrame = Instance.new("Frame")
BoxFrame.Size = UDim2.new(1, -10, 0, 46)
BoxFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BoxFrame.BackgroundTransparency = 0.94
BoxFrame.Parent = page

local BFCorner = Instance.new("UICorner")
BFCorner.CornerRadius = UDim.new(0, 10)
BFCorner.Parent = BoxFrame

local Label = Instance.new("TextLabel")
Label.Size = UDim2.new(0.35, 0, 1, 0)
Label.Position = UDim2.new(0, 15, 0, 0)
Label.Text = text
Label.Font = Enum.Font.GothamMedium
Label.TextSize = 12
Label.TextColor3 = Color3.fromRGB(220, 220, 220)
Label.TextXAlignment = Enum.TextXAlignment.Left
Label.BackgroundTransparency = 1
Label.Parent = BoxFrame

local InputBox = Instance.new("TextBox")
InputBox.Position = UDim2.new(0.42,0,0,10)
InputBox.Size = UDim2.new(0.55,0,0,26)
InputBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
InputBox.BackgroundTransparency = 0.7
InputBox.Text = ""
InputBox.PlaceholderText = placeholder
InputBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 110)
InputBox.Font = Enum.Font.Gotham
InputBox.TextSize = 12
InputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
InputBox.ClearTextOnFocus = false
InputBox.Parent = BoxFrame

local IBCorner = Instance.new("UICorner")
IBCorner.CornerRadius = UDim.new(0, 6)
IBCorner.Parent = InputBox

local IBStroke = Instance.new("UIStroke")
IBStroke.Thickness = 1
IBStroke.Color = Color3.fromRGB(255, 255, 255)
IBStroke.Transparency = 0.8
IBStroke.Parent = InputBox

InputBox.FocusLost:Connect(function()
    TweenService:Create(
        IBStroke,
        TweenInfo.new(0.2),
        {
            Transparency = 0.8,
            Color = Color3.fromRGB(255,255,255)
        }
    ):Play()
end)

InputBox.FocusLost:Connect(function()
    pcall(callback, InputBox.Text)
end)

end

function AddDropdown(tabName, text, list, callback)
local page = Pages[tabName]
local expanded = false

local DropdownFrame = Instance.new("Frame")
DropdownFrame.Size = UDim2.new(1, -10, 0, 42)
DropdownFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DropdownFrame.BackgroundTransparency = 0.94
DropdownFrame.ClipsDescendants = true
DropdownFrame.Parent = page

local DFCorner = Instance.new("UICorner")
DFCorner.CornerRadius = UDim.new(0, 10)
DFCorner.Parent = DropdownFrame

local DropBtn = Instance.new("TextButton")
DropBtn.Size = UDim2.new(1, 0, 0, 42)
DropBtn.BackgroundTransparency = 1
DropBtn.Text = ""
DropBtn.Parent = DropdownFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0.4, 0, 0, 42)
Title.Position = UDim2.new(0,15,0,0)
Title.Text = text
Title.Font = Enum.Font.GothamMedium
Title.TextSize = 12
Title.TextColor3 = Color3.fromRGB(220, 220, 220)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.BackgroundTransparency = 1
Title.Parent = DropdownFrame

local CurrentSelect = Instance.new("TextLabel")
CurrentSelect.Size = UDim2.new(0.35, 0, 0, 42)
CurrentSelect.Position = UDim2.new(0.55, -20, 0, 0)
CurrentSelect.Text = "Chưa Chọn"
CurrentSelect.Font = Enum.Font.Gotham
CurrentSelect.TextSize = 11
CurrentSelect.TextColor3 = Color3.fromRGB(140, 140, 150)
CurrentSelect.TextXAlignment = Enum.TextXAlignment.Right
CurrentSelect.BackgroundTransparency = 1
CurrentSelect.Parent = DropdownFrame

local Arrow = Instance.new("TextLabel")
Arrow.Size = UDim2.new(0, 25, 0, 42)
Arrow.Position = UDim2.new(1, -30, 0, 0)
Arrow.Text = "▼"
Arrow.Font = Enum.Font.GothamBold
Arrow.TextSize = 10
Arrow.TextColor3 = Color3.fromRGB(180, 180, 180)
Arrow.BackgroundTransparency = 1
Arrow.Parent = DropdownFrame

local ListContainer = Instance.new("Frame")
ListContainer.Size = UDim2.new(1, -20, 0, #list * 32)
ListContainer.Position = UDim2.new(0, 10, 0, 44)
ListContainer.BackgroundTransparency = 1
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
    ItemBtn.TextColor3 = Color3.fromRGB(190, 190, 190)
    ItemBtn.TextXAlignment = Enum.TextXAlignment.Left
    ItemBtn.Parent = ListContainer
    
    local ICorn = Instance.new("UICorner")
    ICorn.CornerRadius = UDim.new(0, 6)
    ICorn.Parent = ItemBtn
    
    ItemBtn.MouseButton1Click:Connect(function()
        expanded = false
        CurrentSelect.Text = tostring(item)
        Arrow.Text = "▼"
        TweenService:Create(DropdownFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {Size = UDim2.new(1, -10, 0, 42)}):Play()
        pcall(callback, item)
    end)
end

DropBtn.MouseButton1Click:Connect(function()
    expanded = not expanded
    if expanded then
        Arrow.Text = "▲"
        TweenService:Create(DropdownFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {Size = UDim2.new(1, -10, 0, 47 + (#list * 32))}):Play()
    else
        Arrow.Text = "▼"
        TweenService:Create(DropdownFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {Size = UDim2.new(1, -10, 0, 42)}):Play()
    end
end)


end

function AddToggle(tabName, text, default, callback)
local page = Pages[tabName]
local enabled = default

local ToggleFrame = Instance.new("Frame")
ToggleFrame.Size = UDim2.new(1, -10, 0, 42)
ToggleFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleFrame.BackgroundTransparency = 0.94
ToggleFrame.Parent = page

local TFCorner = Instance.new("UICorner")
TFCorner.CornerRadius = UDim.new(0, 10)
TFCorner.Parent = ToggleFrame

local Label = Instance.new("TextLabel")
Label.Size = UDim2.new(0.6, 0, 1, 0)
Label.Position = UDim2.new(0,15,0,0)
Label.Text = text
Label.Font = Enum.Font.GothamMedium
Label.TextSize = 12
Label.TextColor3 = Color3.fromRGB(220, 220, 220)
Label.TextXAlignment = Enum.TextXAlignment.Left
Label.BackgroundTransparency = 1
Label.Parent = ToggleFrame

local ClickBtn = Instance.new("TextButton")
ClickBtn.Size = UDim2.new(1, 0, 1, 0)
ClickBtn.BackgroundTransparency = 1
ClickBtn.Text = ""
ClickBtn.Parent = ToggleFrame

local Switch = Instance.new("Frame")
Switch.Size = UDim2.new(0,44,0,22)
Switch.Position = UDim2.new(1, -48, 0, 11)
Switch.BackgroundColor3 = enabled and Color3.fromRGB(0, 200, 120) or Color3.fromRGB(60, 60, 70)
Switch.Parent = ToggleFrame

local SwitchCorner = Instance.new("UICorner")
SwitchCorner.CornerRadius = UDim.new(1, 0)
SwitchCorner.Parent = Switch

local Dot = Instance.new("Frame")
Dot.Size = UDim2.new(0,16,0,16)
Dot.Position = enabled and UDim2.new(1, -17, 0, 3) or UDim2.new(0, 3, 0, 3)
Dot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Dot.Parent = Switch

local DotCorner = Instance.new("UICorner")
DotCorner.CornerRadius = UDim.new(1, 0)
DotCorner.Parent = Dot

ClickBtn.MouseButton1Click:Connect(function()
    enabled = not enabled
    local targetPos = enabled and UDim2.new(1, -17, 0, 3) or UDim2.new(0, 3, 0, 3)
    local targetColor = enabled and Color3.fromRGB(0, 200, 120) or Color3.fromRGB(60, 60, 70)
    TweenService:Create(Dot, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = targetPos}):Play()
    TweenService:Create(Switch, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {BackgroundColor3 = targetColor}):Play()
    pcall(callback, enabled)
end)

end

function AddLabel(tabName, text)
    local page = Pages[tabName]

    local LabelFrame = Instance.new("Frame")
    LabelFrame.Size = UDim2.new(1, -10, 0, 28)
    LabelFrame.BackgroundTransparency = 1
    LabelFrame.Parent = page

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, 0, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.Font = Enum.Font.GothamBold
    Label.TextSize = 15
    Label.TextColor3 = Color3.fromRGB(255,255,255)
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = LabelFrame

    local Gradient = Instance.new("UIGradient")
    Gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0,255,170)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0,153,255))
    }
    Gradient.Parent = Label
    
    local Line = Instance.new("Frame")
    Line.Size = UDim2.new(1,0,0,1)
    Line.Position = UDim2.new(0,0,1,-1)
    Line.BorderSizePixel = 0
    Line.Parent = LabelFrame

    local LineGradient = Instance.new("UIGradient")
    LineGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0,255,170)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(213,0,255))
    }
    LineGradient.Parent = Line
end

CreateTab("Farm", "rbxassetid://70492079783125")

AddLabel("Farm", "Farm Chính")

AddToggle("Farm", "Bật Auto Farm Level", false, function(state)
    print("Auto Farm: ", state)
end)

AddDropdown("Farm", "Chọn Khu Vực Farm",
{
    "Đảo Khởi Đầu",
    "Đảo Sa Mạc",
    "Tuyết Sơn",
    "Đảo Bầu Trời"
},
function(island)
    print("Di chuyển tới: " .. island)
end)

CreateTab("Nhiệm Vụ & Vật Phẩm", "rbxassetid://85923648556160")
CreateTab("Câu Cá", "rbxassetid://117464735534300")
CreateTab("Sự Kiện Biển", "rbxassetid://117464735534300")
CreateTab("Raid & Trái Ác Quỷ", "rbxassetid://117786143421965")
CreateTab("Chỉ Số", "rbxassetid://131983014082260")
CreateTab("Dịch Chuyển", "rbxassetid://83054494283840")
CreateTab("Trạng Thái", "rbxassetid://86375240234504")
CreateTab("Thị Giác", "rbxassetid://137611999012404")
CreateTab("Cài Đặt", "rbxassetid://70767352650956")

AddLabel("Cài Đặt", "Cài Đặt")

AddSlider("Cài Đặt", "Tốc độ chạy (WalkSpeed)", 16, 250, 16, function(value)
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
end)

AddSlider("Cài Đặt", "Độ cao nhảy (JumpPower)", 50, 300, 50, function(value)
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    end
end)

CreateTab("Cửa Hàng", "rbxassetid://91250120807261")

task.spawn(function()
local hue = 0
while task.wait(0.03) do
hue = (hue + 0.003) % 1

    UIGradientGlow.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromHSV((hue) % 1, 0.9, 1)),
        ColorSequenceKeypoint.new(0.5, Color3.fromHSV((hue + 0.3) % 1, 0.9, 1)),
        ColorSequenceKeypoint.new(1, Color3.fromHSV((hue + 0.6) % 1, 0.9, 1))
    }

    TitleGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromHSV((hue + 0.1) % 1, 0.85, 1)),
        ColorSequenceKeypoint.new(0.5, Color3.fromHSV((hue + 0.4) % 1, 0.85, 1)),
        ColorSequenceKeypoint.new(1, Color3.fromHSV((hue + 0.7) % 1, 0.85, 1))
    }

    IconGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromHSV(hue, 0.9, 1)),
        ColorSequenceKeypoint.new(1, Color3.fromHSV((hue + 0.4) % 1, 0.9, 1))
    }

    UIStroke.Color = Color3.fromHSV(hue, 0.6, 1)
    UIStroke.Transparency = 0.3
    IconStroke.Color = Color3.fromHSV(hue, 0.8, 1)
    
    UIGradientGlow.Rotation = (UIGradientGlow.Rotation + 0.8) % 360
end


end)

local dragging, dragInput, dragStart, startPos
local function update(input)
local delta = input.Position - dragStart
TweenService:Create(MainFrame, TweenInfo.new(0.08, Enum.EasingStyle.Quad), {Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)}):Play()
TweenService:Create(GlowBackground, TweenInfo.new(0.08, Enum.EasingStyle.Quad), {Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X - 5, startPos.Y.Scale, startPos.Y.Offset + delta.Y - 5)}):Play()
end

TitleBar.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
dragging = true
dragStart = input.Position
startPos = MainFrame.Position
input.Changed:Connect(function()
if input.UserInputState == Enum.UserInputState.End then dragging = false end
end)
end
end)

TitleBar.InputChanged:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
dragInput = input
end
end)

UserInputService.InputChanged:Connect(function(input)
if input == dragInput and dragging then update(input) end
end)

CloseBtn.MouseButton1Click:Connect(function()
local t1 = TweenService:Create(MainFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0,0,0,0), BackgroundTransparency = 1})
local t2 = TweenService:Create(GlowBackground, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0,0,0,0), BackgroundTransparency = 1})
t1:Play()
t2:Play()

t1.Completed:Connect(function()
    MainFrame.Visible = false
    GlowBackground.Visible = false

    OpenIcon.Visible = true
    OpenIcon.Active = true

    OpenIcon.Size = UDim2.new(0, 0, 0, 0)
    OpenIcon.ImageTransparency = 0
    OpenIcon.BackgroundTransparency = 0.2

    task.wait()

    TweenService:Create(
        OpenIcon,
        TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {Size = UDim2.new(0, 50, 0, 50)}
    ):Play()
end)


end)

OpenIcon.MouseButton1Click:Connect(function()
TweenService:Create(OpenIcon, TweenInfo.new(0.15), {
    Rotation = 10
}):Play()

task.wait(0.15)

TweenService:Create(OpenIcon, TweenInfo.new(0.2), {
    Rotation = 0
}):Play()

task.wait(0.15)
OpenIcon.Visible = false

MainFrame.Visible = true
GlowBackground.Visible = true
GlowBackground.Size = UDim2.new(0,560,0,410)
MainFrame.Size = UDim2.new(0,710,0,490)
MainFrame.BackgroundTransparency = 0.35
GlowBackground.BackgroundTransparency = 0.8

end)

ShutDownBtn.MouseButton1Click:Connect(function()
ConfirmFrame.Visible = true
end)

NoBtn.MouseButton1Click:Connect(function()
ConfirmFrame.Visible = false
end)

YesBtn.MouseButton1Click:Connect(function()
CustomHub:Destroy()
end)
