-- CLICK HIGH JUMP + FULL MENU (FINAL FIX MOBILE)

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- CONFIG
local JumpPower = 150
local JumpSize = 60

local MIN_JUMP = 60
local MAX_JUMP = 300

local MIN_SIZE = 40
local MAX_SIZE = 100

-- CHARACTER
local function getChar()
	return player.Character or player.CharacterAdded:Wait()
end

-- ================= GUI =================
local gui = Instance.new("ScreenGui")
gui.Name = "JumpMenuGui"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = player:WaitForChild("PlayerGui")

-- ================ MENU =================
local menu = Instance.new("Frame", gui)
menu.Size = UDim2.new(0,210,0,320)
menu.Position = UDim2.new(0.05,0,0.3,0)
menu.BackgroundColor3 = Color3.fromRGB(25,25,25)
menu.Active = true
menu.Draggable = true
menu.ZIndex = 999
Instance.new("UICorner", menu).CornerRadius = UDim.new(0,15)

-- TITLE
local title = Instance.new("TextLabel", menu)
title.Size = UDim2.new(1,0,0,30)
title.Text = "JUMP MENU"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextScaled = true

-- TOGGLE JUMP
local toggleJump = Instance.new("TextButton", menu)
toggleJump.Size = UDim2.new(1,-20,0,30)
toggleJump.Position = UDim2.new(0,10,0,40)
toggleJump.Text = "Jump Button : ON"
toggleJump.BackgroundColor3 = Color3.fromRGB(50,50,50)
toggleJump.TextColor3 = Color3.new(1,1,1)
toggleJump.Font = Enum.Font.Gotham
toggleJump.TextScaled = true
Instance.new("UICorner", toggleJump)

-- TOGGLE MOVE
local toggleMove = Instance.new("TextButton", menu)
toggleMove.Size = UDim2.new(1,-20,0,30)
toggleMove.Position = UDim2.new(0,10,0,75)
toggleMove.Text = "Move Jump : ON"
toggleMove.BackgroundColor3 = Color3.fromRGB(50,50,50)
toggleMove.TextColor3 = Color3.new(1,1,1)
toggleMove.Font = Enum.Font.Gotham
toggleMove.TextScaled = true
Instance.new("UICorner", toggleMove)

-- POWER TEXT
local powerText = Instance.new("TextLabel", menu)
powerText.Size = UDim2.new(1,0,0,25)
powerText.Position = UDim2.new(0,0,0,115)
powerText.Text = "Jump Power : "..JumpPower
powerText.TextColor3 = Color3.new(1,1,1)
powerText.BackgroundTransparency = 1
powerText.Font = Enum.Font.Gotham
powerText.TextScaled = true

local minusPower = Instance.new("TextButton", menu)
minusPower.Size = UDim2.new(0.4,0,0,30)
minusPower.Position = UDim2.new(0.05,0,0,145)
minusPower.Text = "-"
minusPower.Font = Enum.Font.GothamBold
minusPower.TextScaled = true
minusPower.BackgroundColor3 = Color3.fromRGB(60,60,60)
minusPower.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", minusPower)

local plusPower = Instance.new("TextButton", menu)
plusPower.Size = UDim2.new(0.4,0,0,30)
plusPower.Position = UDim2.new(0.55,0,0,145)
plusPower.Text = "+"
plusPower.Font = Enum.Font.GothamBold
plusPower.TextScaled = true
plusPower.BackgroundColor3 = Color3.fromRGB(60,60,60)
plusPower.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", plusPower)

-- SIZE TEXT
local sizeText = Instance.new("TextLabel", menu)
sizeText.Size = UDim2.new(1,0,0,25)
sizeText.Position = UDim2.new(0,0,0,185)
sizeText.Text = "Jump Size : "..JumpSize
sizeText.TextColor3 = Color3.new(1,1,1)
sizeText.BackgroundTransparency = 1
sizeText.Font = Enum.Font.Gotham
sizeText.TextScaled = true

local minusSize = Instance.new("TextButton", menu)
minusSize.Size = UDim2.new(0.4,0,0,30)
minusSize.Position = UDim2.new(0.05,0,0,215)
minusSize.Text = "-"
minusSize.Font = Enum.Font.GothamBold
minusSize.TextScaled = true
minusSize.BackgroundColor3 = Color3.fromRGB(60,60,60)
minusSize.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", minusSize)

local plusSize = Instance.new("TextButton", menu)
plusSize.Size = UDim2.new(0.4,0,0,30)
plusSize.Position = UDim2.new(0.55,0,0,215)
plusSize.Text = "+"
plusSize.Font = Enum.Font.GothamBold
plusSize.TextScaled = true
plusSize.BackgroundColor3 = Color3.fromRGB(60,60,60)
plusSize.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", plusSize)

-- HIDE MENU
local hideMenu = Instance.new("TextButton", menu)
hideMenu.Size = UDim2.new(1,-20,0,30)
hideMenu.Position = UDim2.new(0,10,1,-40)
hideMenu.Text = "Hide Menu"
hideMenu.BackgroundColor3 = Color3.fromRGB(45,45,45)
hideMenu.TextColor3 = Color3.new(1,1,1)
hideMenu.Font = Enum.Font.Gotham
hideMenu.TextScaled = true
Instance.new("UICorner", hideMenu)

-- MINI OPEN
local openBtn = Instance.new("TextButton", gui)
openBtn.Size = UDim2.new(0,45,0,45)
openBtn.Position = UDim2.new(0.02,0,0.5,0)
openBtn.Text = "≡"
openBtn.Visible = false
openBtn.Font = Enum.Font.GothamBold
openBtn.TextScaled = true
openBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
openBtn.TextColor3 = Color3.new(1,1,1)
openBtn.ZIndex = 999
Instance.new("UICorner", openBtn).CornerRadius = UDim.new(1,0)

-- JUMP BUTTON
local jumpBtn = Instance.new("TextButton", gui)
jumpBtn.Size = UDim2.new(0,JumpSize,0,JumpSize)
jumpBtn.Position = UDim2.new(0.8,0,0.7,0)
jumpBtn.Text = "J"
jumpBtn.Font = Enum.Font.GothamBold
jumpBtn.TextScaled = true
jumpBtn.TextColor3 = Color3.new(1,1,1)
jumpBtn.BackgroundColor3 = Color3.fromRGB(70,70,70)
jumpBtn.Active = true
jumpBtn.Draggable = true
jumpBtn.ZIndex = 999
Instance.new("UICorner", jumpBtn).CornerRadius = UDim.new(1,0)

-- ================= LOGIC =================
local jumpEnabled = true
local moveEnabled = true

-- MULTI JUMP (KHÔNG CẦN CHẠM ĐẤT)
jumpBtn.MouseButton1Click:Connect(function()
	if not jumpEnabled then return end
	local char = getChar()
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	hrp.AssemblyLinearVelocity = Vector3.new(
		hrp.AssemblyLinearVelocity.X,
		JumpPower,
		hrp.AssemblyLinearVelocity.Z
	)
end)

toggleJump.MouseButton1Click:Connect(function()
	jumpEnabled = not jumpEnabled
	jumpBtn.Visible = jumpEnabled
	toggleJump.Text = "Jump Button : "..(jumpEnabled and "ON" or "OFF")
end)

toggleMove.MouseButton1Click:Connect(function()
	moveEnabled = not moveEnabled
	jumpBtn.Draggable = moveEnabled
	jumpBtn.Active = moveEnabled
	toggleMove.Text = "Move Jump : "..(moveEnabled and "ON" or "OFF")
end)

plusPower.MouseButton1Click:Connect(function()
	JumpPower = math.clamp(JumpPower + 10, MIN_JUMP, MAX_JUMP)
	powerText.Text = "Jump Power : "..JumpPower
end)

minusPower.MouseButton1Click:Connect(function()
	JumpPower = math.clamp(JumpPower - 10, MIN_JUMP, MAX_JUMP)
	powerText.Text = "Jump Power : "..JumpPower
end)

plusSize.MouseButton1Click:Connect(function()
	JumpSize = math.clamp(JumpSize + 5, MIN_SIZE, MAX_SIZE)
	jumpBtn.Size = UDim2.new(0,JumpSize,0,JumpSize)
	sizeText.Text = "Jump Size : "..JumpSize
end)

minusSize.MouseButton1Click:Connect(function()
	JumpSize = math.clamp(JumpSize - 5, MIN_SIZE, MAX_SIZE)
	jumpBtn.Size = UDim2.new(0,JumpSize,0,JumpSize)
	sizeText.Text = "Jump Size : "..JumpSize
end)

hideMenu.MouseButton1Click:Connect(function()
	menu.Visible = false
	openBtn.Visible = true
end)

openBtn.MouseButton1Click:Connect(function()
	menu.Visible = true
	openBtn.Visible = false
end)

-- FORCE SHOW
menu.Visible = true
jumpBtn.Visible = true
