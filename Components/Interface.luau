-- ==========================================================================
-- ĐŒØŘß HÛB - MÓDULO DE INTERFAZ / UI BASE
-- ==========================================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Evitar duplicados si ya está abierto
if CoreGui:FindFirstChild("DoorsHubInterface") then
    CoreGui.DoorsHubInterface:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DoorsHubInterface"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Ventana Principal del Hub
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -125)
MainFrame.Size = UDim2.new(0, 350, 0, 250)
MainFrame.Active = true
MainFrame.Draggable = true

-- Esquinas redondeadas para la ventana
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

-- Barra Superior (Título)
local TopBar = Instance.new("Frame")
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(1, 0, 0, 40)

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 8)
TopBarCorner.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 15, 0, 0)
Title.Size = UDim2.new(1, -15, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "✨ ĐŒØŘß HÛB - MODULAR"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Contenedor de opciones / Texto informativo
local ContentLabel = Instance.new("TextLabel")
ContentLabel.Parent = MainFrame
ContentLabel.BackgroundTransparency = 1
ContentLabel.Position = UDim2.new(0, 20, 0, 60)
ContentLabel.Size = UDim2.new(1, -40, 0, 100)
ContentLabel.Font = Enum.Font.Gotham
ContentLabel.Text = "Interfaz modular cargada correctamente.\nLos componentes de juego se están ejecutando en segundo plano."
ContentLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
ContentLabel.TextSize = 12
ContentLabel.TextWrapped = true
ContentLabel.TextXAlignment = Enum.TextXAlignment.Left
ContentLabel.TextYAlignment = Enum.TextYAlignment.Top

-- Botón de cerrar interfaz
local CloseButton = Instance.new("TextButton")
CloseButton.Parent = MainFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseButton.Position = UDim2.new(0.5, -75, 1, -45)
CloseButton.Size = UDim2.new(0, 150, 0, 30)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "Cerrar Hub"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 12

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 6)
ButtonCorner.Parent = CloseButton

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

print("✨ [Doors Hub] Interfaz gráfica inicializada con éxito.")
return ScreenGui
