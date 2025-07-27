-- 🐲 Script mini GUI mejorado by TOKIO5025
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- GUI
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "NeoTokyo_MiniGUI"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 170, 0, 210)
Frame.Position = UDim2.new(0, 20, 0.5, -105)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true

local title = Instance.new("TextLabel", Frame)
title.Text = "🐲 NeoTokyo Mini GUI"
title.Font = Enum.Font.GothamBold
title.TextSize = 14
title.TextColor3 = Color3.new(1,1,1)
title.Size = UDim2.new(1, 0, 0, 25)
title.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
title.BorderSizePixel = 0

-- Caja velocidad
local speedBox = Instance.new("TextBox", Frame)
speedBox.PlaceholderText = "Velocidad"
speedBox.Size = UDim2.new(0, 140, 0, 20)
speedBox.Position = UDim2.new(0, 15, 0, 35)
speedBox.TextColor3 = Color3.new(0,0,0)
speedBox.BackgroundColor3 = Color3.fromRGB(240,240,240)
speedBox.Font = Enum.Font.Gotham
speedBox.TextSize = 12

-- Caja salto
local jumpBox = Instance.new("TextBox", Frame)
jumpBox.PlaceholderText = "Salto"
jumpBox.Size = UDim2.new(0, 140, 0, 20)
jumpBox.Position = UDim2.new(0, 15, 0, 60)
jumpBox.TextColor3 = Color3.new(0,0,0)
jumpBox.BackgroundColor3 = Color3.fromRGB(240,240,240)
jumpBox.Font = Enum.Font.Gotham
jumpBox.TextSize = 12

-- Caja casas (para desbanear)
local casaBox = Instance.new("TextBox", Frame)
casaBox.PlaceholderText = "N° casa para desbanear"
casaBox.Size = UDim2.new(0, 140, 0, 20)
casaBox.Position = UDim2.new(0, 15, 0, 85)
casaBox.TextColor3 = Color3.new(0,0,0)
casaBox.BackgroundColor3 = Color3.fromRGB(240,240,240)
casaBox.Font = Enum.Font.Gotham
casaBox.TextSize = 12

-- Botón aplicar
local apply = Instance.new("TextButton", Frame)
apply.Text = "Aplicar velocidad/salto"
apply.Size = UDim2.new(0, 140, 0, 20)
apply.Position = UDim2.new(0, 15, 0, 110)
apply.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
apply.TextColor3 = Color3.new(1,1,1)
apply.Font = Enum.Font.GothamBold
apply.TextSize = 12

-- Botón OFF
local off = Instance.new("TextButton", Frame)
off.Text = "OFF velocidad/salto"
off.Size = UDim2.new(0, 140, 0, 20)
off.Position = UDim2.new(0, 15, 0, 135)
off.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
off.TextColor3 = Color3.new(1,1,1)
off.Font = Enum.Font.GothamBold
off.TextSize = 12

-- Botón desbanear casas
local unban = Instance.new("TextButton", Frame)
unban.Text = "Desbanear casa"
unban.Size = UDim2.new(0, 140, 0, 20)
unban.Position = UDim2.new(0, 15, 0, 160)
unban.BackgroundColor3 = Color3.fromRGB(200, 50, 100)
unban.TextColor3 = Color3.new(1,1,1)
unban.Font = Enum.Font.GothamBold
unban.TextSize = 12

-- Botón cerrar
local close = Instance.new("TextButton", Frame)
close.Text = "X"
close.Size = UDim2.new(0, 25, 0, 25)
close.Position = UDim2.new(1, -25, 0, 0)
close.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
close.TextColor3 = Color3.new(1,1,1)
close.Font = Enum.Font.GothamBold
close.TextSize = 14

-- Función aplicar velocidad/salto
apply.MouseButton1Click:Connect(function()
	local speed = tonumber(speedBox.Text)
	local jump = tonumber(jumpBox.Text)
	if speed then humanoid.WalkSpeed = speed end
	if jump then humanoid.JumpPower = jump end
end)

-- OFF velocidad/salto
off.MouseButton1Click:Connect(function()
	humanoid.WalkSpeed = 16
	humanoid.JumpPower = 50
end)

-- Función desbanear casa (ficticio)
unban.MouseButton1Click:Connect(function()
	local casa = casaBox.Text
	if casa ~= "" then
		StarterGui:SetCore("SendNotification", {
			Title = "🐲 NeoTokyo",
			Text = "Intentando desbanear de casa #" .. casa,
			Duration = 3
		})
	else
		StarterGui:SetCore("SendNotification", {
			Title = "⚠️ Error",
			Text = "Pon el número de la casa primero",
			Duration = 3
		})
	end
end)

-- Botón cerrar GUI
close.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)
