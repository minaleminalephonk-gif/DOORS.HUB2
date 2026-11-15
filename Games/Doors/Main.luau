-- ==========================================================================
-- ĐŒØŘß HÛB - MÓDULO PRINCIPAL DE DOORS
-- ==========================================================================

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

print("✨ [Doors Hub] Módulo de DOORS inicializado correctamente.")

-- 1. SISTEMA DE ESP PARA ENTIDADES (Rush, Ambush, Figure, Seek, Eyes)
local function EnableEntityESP(state)
    getgenv().ESP_Entities_Active = state
    task.spawn(function()
        while getgenv().ESP_Entities_Active do
            task.wait(1)
            pcall(function()
                for _, v in ipairs(Workspace:GetChildren()) do
                    if v:IsA("Model") and (v.Name == "RushMoving" or v.Name == "AmbushMoving" or v.Name == "FigureRagdoll" or v.Name == "SeekMoving" or v.Name == "Eyes") then
                        if not v:FindFirstChild("DoorsHub_ESP") then
                            local Highlight = Instance.new("Highlight")
                            Highlight.Name = "DoorsHub_ESP"
                            Highlight.Adornee = v
                            Highlight.FillColor = Color3.fromRGB(255, 0, 0)
                            Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                            Highlight.Parent = v
                        end
                    end
                end
            end)
        end
    end)
end

-- 2. BYPASSES Y PROTECCIONES (Anti-Screech / Anti-Eyes)
local function EnableEntityBypasses(state)
    getgenv().BypassesActive = state
    RunService.Stepped:Connect(function()
        if getgenv().BypassesActive then
            pcall(function()
                -- Eliminar Screech de forma instantánea si aparece
                local Screech = Workspace:FindFirstChild("Screech") or (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Screech"))
                if Screech then Screech:Destroy() end

                -- Esquivar la mirada de Eyes automáticamente
                local Eyes = Workspace:FindFirstChild("Eyes")
                if Eyes and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position, LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, -10, 0))
                end
            end)
        end
    end)
end

-- Activación automática de las funciones en Doors
EnableEntityESP(true)
EnableEntityBypasses(true)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "ĐŒØŘß HÛB",
    Text = "¡Módulo de DOORS cargado con éxito!",
    Duration = 4
})
