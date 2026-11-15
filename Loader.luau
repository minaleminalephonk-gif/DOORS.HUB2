-- ==========================================================================
-- ĐŒØŘß HÛB - MASTER LOADER (MODULAR ARCHITECTURE)
-- ==========================================================================

if getgenv().DoorsHubLoaded then
    warn("✨ ĐŒØŘß HÛB ya se encuentra en ejecución.")
    return
end

getgenv().DoorsHubLoaded = true
getgenv().DoorsHub = {
    Version = "2.0.0",
    Author = "minaleminalephonk"
}

-- Configuración de tu repositorio en GitHub (Actualizado a PUERTAS.HUB2)
local Username = "minaleminalephonk-gif"
local Repository = "PUERTAS.HUB2"
local Branch = "main"
local BaseUrl = string.format("https://raw.githubusercontent.com/%s/%s/refs/heads/%s/", Username, Repository, Branch)

-- Función segura para peticiones HTTP
local function FetchModule(ModulePath)
    local Success, Result = pcall(function()
        return loadstring(game:HttpGet(BaseUrl .. ModulePath))()
    end)
    if not Success then
        warn("[ĐŒØŘß HÛB] Error al cargar el módulo: " + tostring(ModulePath) + " | Razón: " + tostring(Result))
        return nil
    end
    return Result
end

-- Notificación de inicio en pantalla
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "✨ ĐŒØŘß HÛB",
    Text = "Cargando componentes modulares...",
    Duration = 3
})

-- Cargar librerías del entorno y componentes base
getgenv().DoorsHub.Environment = FetchModule("Components/Interface.luau")
getgenv().DoorsHub.ESP          = FetchModule("Components/ESP.luau")

-- Detectar el juego actual y cargar su respectivo script principal
local GameList = {
    [2440500124] = "Doors" -- ID oficial de DOORS en Roblox
}

local CurrentGame = GameList[game.GameId]

if CurrentGame then
    print("[ĐŒØŘß HÛB] Juego detectado con éxito: " + CurrentGame)
    FetchModule("Games/" + CurrentGame + "/Main.luau")
else
    print("[ĐŒØŘß HÛB] Juego no compatible o universal. Cargando módulo genérico...")
    FetchModule("Games/Universal/Main.luau")
end
