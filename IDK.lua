--========================================================
-- CORVETTI1991 - R6 VISUAL ORBS
-- GUI COMPACTA / HORIZONTAL
-- SISTEMA DE CORES INDIVIDUAIS + RGB + PALETA
--========================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

--========================================================
-- CONFIGURAÇÃO PADRÃO
--========================================================

local DEFAULT = {
	Size = 1.00,
	Movement = 1.00,

	LeftOrb = {
		X = -0.34,
		Y = 0.36,
		Z = -0.48
	},

	RightOrb = {
		X = 0.34,
		Y = 0.36,
		Z = -0.48
	},

	LowerLeft = {
		X = -0.32,
		Y = -0.90,
		Z = 0.48
	},

	LowerRight = {
		X = 0.32,
		Y = -0.90,
		Z = 0.48
	}
}

local Config = {
	Size = DEFAULT.Size,
	Movement = DEFAULT.Movement,

	LeftOrb = {
		X = DEFAULT.LeftOrb.X,
		Y = DEFAULT.LeftOrb.Y,
		Z = DEFAULT.LeftOrb.Z
	},

	RightOrb = {
		X = DEFAULT.RightOrb.X,
		Y = DEFAULT.RightOrb.Y,
		Z = DEFAULT.RightOrb.Z
	},

	LowerLeft = {
		X = DEFAULT.LowerLeft.X,
		Y = DEFAULT.LowerLeft.Y,
		Z = DEFAULT.LowerLeft.Z
	},

	LowerRight = {
		X = DEFAULT.LowerRight.X,
		Y = DEFAULT.LowerRight.Y,
		Z = DEFAULT.LowerRight.Z
	}
}

--========================================================
-- CONFIGURAÇÃO DE CORES INDIVIDUAIS
--========================================================

local ColorConfig = {

	-- AUTOMÁTICA INDIVIDUAL
	LeftOrbAutomatic = true,
	RightOrbAutomatic = true,
	LowerLeftAutomatic = true,
	LowerRightAutomatic = true,

	-- CORES PERSONALIZADAS INDIVIDUAIS
	LeftOrbColor = Color3.fromRGB(
		255,
		50,
		50
	),

	RightOrbColor = Color3.fromRGB(
		255,
		50,
		50
	),

	LowerLeftColor = Color3.fromRGB(
		50,
		100,
		255
	),

	LowerRightColor = Color3.fromRGB(
		50,
		100,
		255
	)
}

--========================================================
-- ESTADO
--========================================================

local ATIVO = true
local conexaoOrb = nil

--========================================================
-- REFERÊNCIAS DOS SLIDERS
--========================================================

local SliderControls = {
	LeftOrb = {},
	RightOrb = {},
	LowerLeft = {},
	LowerRight = {}
}

--========================================================
-- CORES DA GUI
--========================================================

local COLORS = {

	Background = Color3.fromRGB(
		8,
		8,
		10
	),

	Panel = Color3.fromRGB(
		15,
		15,
		18
	),

	Panel2 = Color3.fromRGB(
		23,
		23,
		27
	),

	Red = Color3.fromRGB(
		200,
		25,
		42
	),

	RedDark = Color3.fromRGB(
		105,
		14,
		25
	),

	RedHover = Color3.fromRGB(
		225,
		35,
		52
	),

	White = Color3.fromRGB(
		245,
		245,
		245
	),

	Gray = Color3.fromRGB(
		150,
		150,
		157
	),

	DarkGray = Color3.fromRGB(
		60,
		60,
		65
	),

	Green = Color3.fromRGB(
		55,
		200,
		95
	)
}

--========================================================
-- GUI
--========================================================

local gui = Instance.new("ScreenGui")

gui.Name =
	"Corvetti1991GUI"

gui.ResetOnSpawn = false
gui.ZIndexBehavior =
	Enum.ZIndexBehavior.Sibling

gui.Parent =
	player:WaitForChild(
		"PlayerGui"
	)

local main = Instance.new("Frame")

main.Name =
	"Main"

main.Size =
	UDim2.new(
		0,
		460,
		0,
		390
	)

main.Position =
	UDim2.new(
		0.5,
		-230,
		0.5,
		-195
	)

main.BackgroundColor3 =
	COLORS.Background

main.BorderSizePixel = 0
main.Parent = gui

local mainCorner =
	Instance.new("UICorner")

mainCorner.CornerRadius =
	UDim.new(
		0,
		14
	)

mainCorner.Parent =
	main

local mainStroke =
	Instance.new("UIStroke")

mainStroke.Color =
	COLORS.Red

mainStroke.Thickness =
	1.5

mainStroke.Transparency =
	0.1

mainStroke.Parent =
	main

--========================================================
-- CABEÇALHO
--========================================================

local top =
	Instance.new("Frame")

top.Size =
	UDim2.new(
		1,
		0,
		0,
		48
	)

top.BackgroundColor3 =
	COLORS.Panel

top.BorderSizePixel = 0
top.Parent = main

local topCorner =
	Instance.new("UICorner")

topCorner.CornerRadius =
	UDim.new(
		0,
		14
	)

topCorner.Parent =
	top

local topLine =
	Instance.new("Frame")

topLine.Size =
	UDim2.new(
		1,
		0,
		0,
		2
	)

topLine.Position =
	UDim2.new(
		0,
		0,
		1,
		-2
	)

topLine.BackgroundColor3 =
	COLORS.Red

topLine.BorderSizePixel = 0
topLine.Parent = top

local title =
	Instance.new("TextLabel")

title.BackgroundTransparency = 1

title.Position =
	UDim2.new(
		0,
		16,
		0,
		5
	)

title.Size =
	UDim2.new(
		1,
		-90,
		0,
		21
	)

title.Font =
	Enum.Font.GothamBold

title.Text =
	"corvetti1991"

title.TextColor3 =
	COLORS.White

title.TextSize = 17

title.TextXAlignment =
	Enum.TextXAlignment.Left

title.Parent = top

local subtitle =
	Instance.new("TextLabel")

subtitle.BackgroundTransparency = 1

subtitle.Position =
	UDim2.new(
		0,
		16,
		0,
		26
	)

subtitle.Size =
	UDim2.new(
		1,
		-90,
		0,
		14
	)

subtitle.Font =
	Enum.Font.Gotham

subtitle.Text =
	"R6 • VISUAL ORBS"

subtitle.TextColor3 =
	COLORS.Gray

subtitle.TextSize = 9

subtitle.TextXAlignment =
	Enum.TextXAlignment.Left

subtitle.Parent = top

local minimize =
	Instance.new("TextButton")

minimize.Size =
	UDim2.new(
		0,
		32,
		0,
		32
	)

minimize.Position =
	UDim2.new(
		1,
		-41,
		0,
		8
	)

minimize.BackgroundColor3 =
	COLORS.RedDark

minimize.BorderSizePixel = 0

minimize.Text =
	"—"

minimize.TextColor3 =
	COLORS.White

minimize.TextSize = 17

minimize.Font =
	Enum.Font.GothamBold

minimize.Parent =
	top

local minCorner =
	Instance.new("UICorner")

minCorner.CornerRadius =
	UDim.new(
		0,
		8
	)

minCorner.Parent =
	minimize

--========================================================
-- ABAS
--========================================================

local tabs =
	Instance.new("Frame")

tabs.Position =
	UDim2.new(
		0,
		12,
		0,
		58
	)

tabs.Size =
	UDim2.new(
		1,
		-24,
		0,
		32
	)

tabs.BackgroundTransparency = 1
tabs.Parent = main

local orbTab =
	Instance.new("TextButton")

orbTab.Size =
	UDim2.new(
		0.5,
		-3,
		1,
		0
	)

orbTab.BackgroundColor3 =
	COLORS.Red

orbTab.BorderSizePixel = 0

orbTab.Text =
	"ORBS"

orbTab.TextColor3 =
	COLORS.White

orbTab.TextSize = 11

orbTab.Font =
	Enum.Font.GothamBold

orbTab.Parent =
	tabs

local orbTabCorner =
	Instance.new("UICorner")

orbTabCorner.CornerRadius =
	UDim.new(
		0,
		8
	)

orbTabCorner.Parent =
	orbTab

local configTab =
	Instance.new("TextButton")

configTab.Size =
	UDim2.new(
		0.5,
		-3,
		1,
		0
	)

configTab.Position =
	UDim2.new(
		0.5,
		3,
		0,
		0
	)

configTab.BackgroundColor3 =
	COLORS.Panel2

configTab.BorderSizePixel = 0

configTab.Text =
	"CONFIG"

configTab.TextColor3 =
	COLORS.Gray

configTab.TextSize = 11

configTab.Font =
	Enum.Font.GothamBold

configTab.Parent =
	tabs

local configTabCorner =
	Instance.new("UICorner")

configTabCorner.CornerRadius =
	UDim.new(
		0,
		8
	)

configTabCorner.Parent =
	configTab

--========================================================
-- PÁGINA ORBS
--========================================================

local orbPage =
	Instance.new("Frame")

orbPage.Position =
	UDim2.new(
		0,
		12,
		0,
		100
	)

orbPage.Size =
	UDim2.new(
		1,
		-24,
		1,
		-112
	)

orbPage.BackgroundTransparency = 1
orbPage.Parent = main

local status =
	Instance.new("TextLabel")

status.BackgroundTransparency = 1

status.Position =
	UDim2.new(
		0,
		4,
		0,
		5
	)

status.Size =
	UDim2.new(
		1,
		-8,
		0,
		25
	)

status.Font =
	Enum.Font.GothamBold

status.TextSize = 13

status.TextXAlignment =
	Enum.TextXAlignment.Left

status.Parent =
	orbPage

local function atualizarStatus()

	if ATIVO then

		status.Text =
			"●  ORBS ATIVADAS"

		status.TextColor3 =
			COLORS.Green

	else

		status.Text =
			"●  ORBS DESATIVADAS"

		status.TextColor3 =
			COLORS.Red

	end

end

atualizarStatus()

local function criarBotao(
	parent,
	texto,
	y
)

	local button =
		Instance.new("TextButton")

	button.Size =
		UDim2.new(
			1,
			0,
			0,
			42
		)

	button.Position =
		UDim2.new(
			0,
			0,
			0,
			y
		)

	button.BackgroundColor3 =
		COLORS.Panel2

	button.BorderSizePixel = 0

	button.Text =
		texto

	button.TextColor3 =
		COLORS.White

	button.TextSize = 11

	button.Font =
		Enum.Font.GothamBold

	button.Parent =
		parent

	local corner =
		Instance.new("UICorner")

	corner.CornerRadius =
		UDim.new(
			0,
			8
		)

	corner.Parent =
		button

	local stroke =
		Instance.new("UIStroke")

	stroke.Color =
		COLORS.DarkGray

	stroke.Thickness = 1
	stroke.Parent = button

	return button

end

local toggle =
	criarBotao(
		orbPage,
		"DESATIVAR ORBS",
		38
	)

local recreate =
	criarBotao(
		orbPage,
		"RECRIAR ORBS",
		88
	)

local info =
	Instance.new("TextLabel")

info.BackgroundTransparency = 1

info.Position =
	UDim2.new(
		0,
		4,
		0,
		150
	)

info.Size =
	UDim2.new(
		1,
		-8,
		0,
		100
	)

info.Font =
	Enum.Font.Gotham

info.Text =
	"Controle R6 das quatro Visual Orbs.\n\nUse CONFIG para alterar tamanho,\nmovimento, posição e cores."

info.TextColor3 =
	COLORS.Gray

info.TextSize = 11

info.TextWrapped = true

info.TextXAlignment =
	Enum.TextXAlignment.Left

info.TextYAlignment =
	Enum.TextYAlignment.Top

info.Parent =
	orbPage

--========================================================
-- PÁGINA CONFIG
--========================================================

local configPage =
	Instance.new("ScrollingFrame")

configPage.Position =
	UDim2.new(
		0,
		12,
		0,
		100
	)

configPage.Size =
	UDim2.new(
		1,
		-24,
		1,
		-112
	)

configPage.BackgroundTransparency = 1
configPage.BorderSizePixel = 0

configPage.ScrollBarThickness = 4

configPage.ScrollBarImageColor3 =
	COLORS.Red

configPage.CanvasSize =
	UDim2.new(
		0,
		0,
		0,
		1100
	)

configPage.Visible = false
configPage.Parent = main

--========================================================
-- SLIDER
--========================================================

local function criarSlider(
	parent,
	titulo,
	minValue,
	maxValue,
	valorInicial,
	y,
	passo,
	callback,
	casas
)

	local container =
		Instance.new("Frame")

	container.Size =
		UDim2.new(
			1,
			0,
			0,
			48
		)

	container.Position =
		UDim2.new(
			0,
			0,
			0,
			y
		)

	container.BackgroundTransparency = 1
	container.Parent = parent

	local label =
		Instance.new("TextLabel")

	label.BackgroundTransparency = 1

	label.Position =
		UDim2.new(
			0,
			2,
			0,
			0
		)

	label.Size =
		UDim2.new(
			0.40,
			0,
			0,
			18
		)

	label.Font =
		Enum.Font.GothamBold

	label.Text =
		titulo

	label.TextColor3 =
		COLORS.White

	label.TextSize = 9

	label.TextXAlignment =
		Enum.TextXAlignment.Left

	label.Parent =
		container

	local valueLabel =
		Instance.new("TextLabel")

	valueLabel.BackgroundTransparency = 1

	valueLabel.Position =
		UDim2.new(
			0.40,
			0,
			0,
			0
		)

	valueLabel.Size =
		UDim2.new(
			0.20,
			0,
			0,
			18
		)

	valueLabel.Font =
		Enum.Font.Gotham

	valueLabel.TextColor3 =
		COLORS.Red

	valueLabel.TextSize = 9

	valueLabel.TextXAlignment =
		Enum.TextXAlignment.Center

	valueLabel.Parent =
		container

	local minus =
		Instance.new("TextButton")

	minus.Size =
		UDim2.new(
			0,
			22,
			0,
			22
		)

	minus.Position =
		UDim2.new(
			1,
			-48,
			0,
			0
		)

	minus.BackgroundColor3 =
		COLORS.Panel2

	minus.BorderSizePixel = 0

	minus.Text = "−"

	minus.TextColor3 =
		COLORS.White

	minus.TextSize = 14

	minus.Font =
		Enum.Font.GothamBold

	minus.Parent =
		container

	local minusCorner =
		Instance.new("UICorner")

	minusCorner.CornerRadius =
		UDim.new(
			0,
			6
		)

	minusCorner.Parent =
		minus

	local plus =
		Instance.new("TextButton")

	plus.Size =
		UDim2.new(
			0,
			22,
			0,
			22
		)

	plus.Position =
		UDim2.new(
			1,
			-23,
			0,
			0
		)

	plus.BackgroundColor3 =
		COLORS.RedDark

	plus.BorderSizePixel = 0

	plus.Text = "+"

	plus.TextColor3 =
		COLORS.White

	plus.TextSize = 14

	plus.Font =
		Enum.Font.GothamBold

	plus.Parent =
		container

	local plusCorner =
		Instance.new("UICorner")

	plusCorner.CornerRadius =
		UDim.new(
			0,
			6
		)

	plusCorner.Parent =
		plus

	local sliderBack =
		Instance.new("Frame")

	sliderBack.Position =
		UDim2.new(
			0,
			2,
			0,
			29
		)

	sliderBack.Size =
		UDim2.new(
			1,
			-4,
			0,
			6
		)

	sliderBack.BackgroundColor3 =
		COLORS.DarkGray

	sliderBack.BorderSizePixel = 0

	sliderBack.Parent =
		container

	local sliderCorner =
		Instance.new("UICorner")

	sliderCorner.CornerRadius =
		UDim.new(
			1,
			0
		)

	sliderCorner.Parent =
		sliderBack

	local fill =
		Instance.new("Frame")

	fill.Size =
		UDim2.new(
			0,
			0,
			1,
			0
		)

	fill.BackgroundColor3 =
		COLORS.Red

	fill.BorderSizePixel = 0
	fill.Parent = sliderBack

	local fillCorner =
		Instance.new("UICorner")

	fillCorner.CornerRadius =
		UDim.new(
			1,
			0
		)

	fillCorner.Parent =
		fill

	local knob =
		Instance.new("Frame")

	knob.Size =
		UDim2.new(
			0,
			13,
			0,
			13
		)

	knob.AnchorPoint =
		Vector2.new(
			0.5,
			0.5
		)

	knob.BackgroundColor3 =
		COLORS.White

	knob.BorderSizePixel = 0
	knob.Parent = sliderBack

	local knobCorner =
		Instance.new("UICorner")

	knobCorner.CornerRadius =
		UDim.new(
			1,
			0
		)

	knobCorner.Parent =
		knob

	local currentValue =
		valorInicial

	local dragging = false

	local function arredondar(
		valor
	)

		local resultado =
			math.floor(
				(valor / passo)
				+ 0.5
			) * passo

		if casas then

			local mult =
				10 ^ casas

			resultado =
				math.floor(
					resultado * mult
						+ 0.5
				) / mult

		end

		return math.clamp(
			resultado,
			minValue,
			maxValue
		)

	end

	local function atualizarVisual(
		valor
	)

		currentValue =
			valor

		local alpha =
			(valor - minValue)
			/
			(maxValue - minValue)

		alpha =
			math.clamp(
				alpha,
				0,
				1
			)

		fill.Size =
			UDim2.new(
				alpha,
				0,
				1,
				0
			)

		knob.Position =
			UDim2.new(
				alpha,
				0,
				0.5,
				0
			)

		if casas then

			valueLabel.Text =
				string.format(
					"%."
						.. casas
						.. "f",
					valor
				)

		else

			valueLabel.Text =
				tostring(valor)

		end

	end

	local function atualizarPorX(
		x
	)

		local inicio =
			sliderBack.AbsolutePosition.X

		local largura =
			sliderBack.AbsoluteSize.X

		local alpha =
			math.clamp(
				(x - inicio)
					/ largura,
				0,
				1
			)

		local valor =
			minValue
			+
			(maxValue - minValue)
				* alpha

		valor =
			arredondar(
				valor
			)

		atualizarVisual(
			valor
		)

		callback(
			valor
		)

	end

	sliderBack.InputBegan:Connect(
		function(input)

			if input.UserInputType ==
				Enum.UserInputType.MouseButton1
				or input.UserInputType ==
				Enum.UserInputType.Touch then

				dragging = true

				atualizarPorX(
					input.Position.X
				)

			end

		end
	)

	UserInputService.InputChanged:Connect(
		function(input)

			if not dragging then
				return
			end

			if input.UserInputType ==
				Enum.UserInputType.MouseMovement
				or input.UserInputType ==
				Enum.UserInputType.Touch then

				atualizarPorX(
					input.Position.X
				)

			end

		end
	)

	UserInputService.InputEnded:Connect(
		function(input)

			if input.UserInputType ==
				Enum.UserInputType.MouseButton1
				or input.UserInputType ==
				Enum.UserInputType.Touch then

				dragging = false

			end

		end
	)

	minus.MouseButton1Click:Connect(
		function()

			local novo =
				arredondar(
					currentValue - passo
				)

			atualizarVisual(
				novo
			)

			callback(
				novo
			)

		end
	)

	plus.MouseButton1Click:Connect(
		function()

			local novo =
				arredondar(
					currentValue + passo
				)

			atualizarVisual(
				novo
			)

			callback(
				novo
			)

		end
	)

	atualizarVisual(
		valorInicial
	)

	local controle = {}

	function controle:Set(
		valor
	)

		valor =
			arredondar(
				valor
			)

		atualizarVisual(
			valor
		)

		callback(
			valor
		)

	end

	return controle

end

--========================================================
-- FUNÇÕES DAS ORBS
--========================================================

local function encontrarOrb(
	nome
)

	local character =
		player.Character

	if not character then
		return nil
	end

	local folder =
		character:FindFirstChild(
			"VisualOrbs"
		)

	if not folder then
		return nil
	end

	if nome == "LeftOrb" then

		return folder:FindFirstChild(
			"LeftOrb"
		)

	elseif nome == "RightOrb" then

		return folder:FindFirstChild(
			"RightOrb"
		)

	elseif nome == "LowerLeft" then

		return folder:FindFirstChild(
			"LowerOrbLeft"
		)

	elseif nome == "LowerRight" then

		return folder:FindFirstChild(
			"LowerOrbRight"
		)

	end

	return nil

end

--========================================================
-- CORES DO PERSONAGEM
--========================================================

local function obterCoresAutomaticas()

	local character =
		player.Character

	if not character then
		return nil
	end

	local torso =
		character:FindFirstChild(
			"Torso"
		)

	local leftLeg =
		character:FindFirstChild(
			"Left Leg"
		)

	local rightLeg =
		character:FindFirstChild(
			"Right Leg"
		)

	if not torso
		or not leftLeg
		or not rightLeg then

		return nil

	end

	return {
		UpperLeft = torso.Color,
		UpperRight = torso.Color,
		LowerLeft = leftLeg.Color,
		LowerRight = rightLeg.Color
	}

end

--========================================================
-- APLICAR COR DAS ORBS
--========================================================

local function aplicarCores()

	local character =
		player.Character

	if not character then
		return
	end

	local folder =
		character:FindFirstChild(
			"VisualOrbs"
		)

	if not folder then
		return
	end

	local automaticas =
		obterCoresAutomaticas()

	if not automaticas then
		return
	end

	local upperLeft =
		folder:FindFirstChild(
			"LeftOrb"
		)

	local upperRight =
		folder:FindFirstChild(
			"RightOrb"
		)

	local lowerLeft =
		folder:FindFirstChild(
			"LowerOrbLeft"
		)

	local lowerRight =
		folder:FindFirstChild(
			"LowerOrbRight"
		)

	--====================================================
	-- SUPERIOR ESQUERDA
	--====================================================

	if upperLeft then

		if ColorConfig.LeftOrbAutomatic then

			upperLeft.Color =
				automaticas.UpperLeft

		else

			upperLeft.Color =
				ColorConfig.LeftOrbColor

		end

	end

	--====================================================
	-- SUPERIOR DIREITA
	--====================================================

	if upperRight then

		if ColorConfig.RightOrbAutomatic then

			upperRight.Color =
				automaticas.UpperRight

		else

			upperRight.Color =
				ColorConfig.RightOrbColor

		end

	end

	--====================================================
	-- INFERIOR ESQUERDA
	--====================================================

	if lowerLeft then

		if ColorConfig.LowerLeftAutomatic then

			lowerLeft.Color =
				automaticas.LowerLeft

		else

			lowerLeft.Color =
				ColorConfig.LowerLeftColor

		end

	end

	--====================================================
	-- INFERIOR DIREITA
	--====================================================

	if lowerRight then

		if ColorConfig.LowerRightAutomatic then

			lowerRight.Color =
				automaticas.LowerRight

		else

			lowerRight.Color =
				ColorConfig.LowerRightColor

		end

	end

end

--========================================================
-- APLICAR POSIÇÃO
--========================================================

local function aplicarPosicao(
	nome
)

	local parte =
		encontrarOrb(
			nome
		)

	if not parte then
		return
	end

	local weld =
		parte:FindFirstChild(
			"OrbWeld"
		)
		or parte:FindFirstChild(
			"LowerOrbWeld"
		)

	if not weld then
		return
	end

	local c =
		Config[nome]

	weld.C0 =
		CFrame.new(
			c.X,
			c.Y,
			c.Z
		)

end

--========================================================
-- APLICAR TAMANHO
--========================================================

local function aplicarTamanho()

	local character =
		player.Character

	if not character then
		return
	end

	local folder =
		character:FindFirstChild(
			"VisualOrbs"
		)

	if not folder then
		return
	end

	for _, parte in ipairs(
		folder:GetChildren()
	) do

		if parte:IsA(
			"BasePart"
		) then

			parte.Size =
				Vector3.new(
					1.35
						* Config.Size,

					1.30
						* Config.Size,

					1.35
						* Config.Size
				)

		end

	end

end

--========================================================
-- TÍTULO CONFIG
--========================================================

local configTitle =
	Instance.new("TextLabel")

configTitle.BackgroundTransparency = 1

configTitle.Size =
	UDim2.new(
		1,
		0,
		0,
		20
	)

configTitle.Font =
	Enum.Font.GothamBold

configTitle.Text =
	"CONFIGURAÇÃO"

configTitle.TextColor3 =
	COLORS.White

configTitle.TextSize = 13

configTitle.TextXAlignment =
	Enum.TextXAlignment.Left

configTitle.Parent =
	configPage

--========================================================
-- TAMANHO
--========================================================

criarSlider(
	configPage,
	"TAMANHO",
	0.50,
	10.00,
	Config.Size,
	22,
	0.05,

	function(valor)

		Config.Size =
			valor

		aplicarTamanho()

	end,

	2
)

--========================================================
-- MOVIMENTO
--========================================================

criarSlider(
	configPage,
	"MOVIMENTO",
	0.00,
	2.00,
	Config.Movement,
	70,
	0.05,

	function(valor)

		Config.Movement =
			valor

	end,

	2
)

--========================================================
-- POSIÇÃO
--========================================================

local orbSection =
	Instance.new("TextLabel")

orbSection.BackgroundTransparency = 1

orbSection.Position =
	UDim2.new(
		0,
		0,
		0,
		118
	)

orbSection.Size =
	UDim2.new(
		1,
		0,
		0,
		20
	)

orbSection.Font =
	Enum.Font.GothamBold

orbSection.Text =
	"POSIÇÃO DAS ORBS"

orbSection.TextColor3 =
	COLORS.White

orbSection.TextSize = 13

orbSection.TextXAlignment =
	Enum.TextXAlignment.Left

orbSection.Parent =
	configPage

--========================================================
-- COLUNAS
--========================================================

local leftColumn =
	Instance.new("Frame")

leftColumn.Position =
	UDim2.new(
		0,
		0,
		0,
		143
	)

leftColumn.Size =
	UDim2.new(
		0.485,
		0,
		0,
		172
	)

leftColumn.BackgroundTransparency = 1
leftColumn.Parent = configPage

local rightColumn =
	Instance.new("Frame")

rightColumn.Position =
	UDim2.new(
		0.515,
		0,
		0,
		143
	)

rightColumn.Size =
	UDim2.new(
		0.485,
		0,
		0,
		172
	)

rightColumn.BackgroundTransparency = 1
rightColumn.Parent = configPage

--========================================================
-- CONFIG ORB
--========================================================

local function criarOrbConfig(
	parent,
	nome,
	titulo
)

	local box =
		Instance.new("Frame")

	box.Size =
		UDim2.new(
			1,
			0,
			0,
			172
		)

	box.BackgroundColor3 =
		COLORS.Panel

	box.BorderSizePixel = 0
	box.Parent = parent

	local corner =
		Instance.new("UICorner")

	corner.CornerRadius =
		UDim.new(
			0,
			9
		)

	corner.Parent =
		box

	local stroke =
		Instance.new("UIStroke")

	stroke.Color =
		COLORS.DarkGray

	stroke.Thickness = 1
	stroke.Parent = box

	local label =
		Instance.new("TextLabel")

	label.BackgroundTransparency = 1

	label.Position =
		UDim2.new(
			0,
			9,
			0,
			5
		)

	label.Size =
		UDim2.new(
			1,
			-18,
			0,
			18
		)

	label.Font =
		Enum.Font.GothamBold

	label.Text =
		titulo

	label.TextColor3 =
		COLORS.Red

	label.TextSize = 9

	label.TextXAlignment =
		Enum.TextXAlignment.Left

	label.Parent =
		box

	local function posSlider(
		eixo,
		y
	)

		SliderControls[nome][eixo] =
			criarSlider(
				box,
				eixo,
				-10.00,
				10.00,
				Config[nome][eixo],
				y,
				0.01,

				function(valor)

					Config[nome][eixo] =
						valor

					aplicarPosicao(
						nome
					)

				end,

				2
			)

	end

	posSlider(
		"X",
		24
	)

	posSlider(
		"Y",
		72
	)

	posSlider(
		"Z",
		120
	)

end

criarOrbConfig(
	leftColumn,
	"LeftOrb",
	"● SUPERIOR ESQ."
)

criarOrbConfig(
	rightColumn,
	"RightOrb",
	"● SUPERIOR DIR."
)

--========================================================
-- LOWER ORBS
--========================================================

local lowerLeftColumn =
	Instance.new("Frame")

lowerLeftColumn.Position =
	UDim2.new(
		0,
		0,
		0,
		325
	)

lowerLeftColumn.Size =
	UDim2.new(
		0.485,
		0,
		0,
		172
	)

lowerLeftColumn.BackgroundTransparency = 1
lowerLeftColumn.Parent = configPage

local lowerRightColumn =
	Instance.new("Frame")

lowerRightColumn.Position =
	UDim2.new(
		0.515,
		0,
		0,
		325
	)

lowerRightColumn.Size =
	UDim2.new(
		0.485,
		0,
		0,
		172
	)

lowerRightColumn.BackgroundTransparency = 1
lowerRightColumn.Parent = configPage

criarOrbConfig(
	lowerLeftColumn,
	"LowerLeft",
	"● INFERIOR ESQ."
)

criarOrbConfig(
	lowerRightColumn,
	"LowerRight",
	"● INFERIOR DIR."
)

--========================================================
-- SINCRONIZAÇÃO
--========================================================

local function sincronizarOrb(
	origem,
	destino
)

	Config[destino].X =
		-Config[origem].X

	Config[destino].Y =
		Config[origem].Y

	Config[destino].Z =
		Config[origem].Z

	if SliderControls[destino].X then

		SliderControls[destino].X:Set(
			Config[destino].X
		)

	end

	if SliderControls[destino].Y then

		SliderControls[destino].Y:Set(
			Config[destino].Y
		)

	end

	if SliderControls[destino].Z then

		SliderControls[destino].Z:Set(
			Config[destino].Z
		)

	end

	aplicarPosicao(
		destino
	)

end

--========================================================
-- BOTÕES SINCRONIZAÇÃO
--========================================================

local syncTitle =
	Instance.new("TextLabel")

syncTitle.BackgroundTransparency = 1

syncTitle.Position =
	UDim2.new(
		0,
		0,
		0,
		515
	)

syncTitle.Size =
	UDim2.new(
		1,
		0,
		0,
		20
	)

syncTitle.Font =
	Enum.Font.GothamBold

syncTitle.Text =
	"SINCRONIZAR"

syncTitle.TextColor3 =
	COLORS.White

syncTitle.TextSize = 12

syncTitle.TextXAlignment =
	Enum.TextXAlignment.Left

syncTitle.Parent =
	configPage

local function criarSyncButton(
	texto,
	x,
	y,
	callback
)

	local button =
		Instance.new("TextButton")

	button.Size =
		UDim2.new(
			0.235,
			0,
			0,
			34
		)

	button.Position =
		UDim2.new(
			x,
			0,
			0,
			y
		)

	button.BackgroundColor3 =
		COLORS.Panel2

	button.BorderSizePixel = 0

	button.Text =
		texto

	button.TextColor3 =
		COLORS.White

	button.TextSize = 8

	button.Font =
		Enum.Font.GothamBold

	button.Parent =
		configPage

	local corner =
		Instance.new("UICorner")

	corner.CornerRadius =
		UDim.new(
			0,
			7
		)

	corner.Parent =
		button

	button.MouseButton1Click:Connect(
		callback
	)

	return button

end

criarSyncButton(
	"ESQ → DIR",
	0,
	540,

	function()

		sincronizarOrb(
			"LeftOrb",
			"RightOrb"
		)

	end
)

criarSyncButton(
	"DIR → ESQ",
	0.255,
	540,

	function()

		sincronizarOrb(
			"RightOrb",
			"LeftOrb"
		)

	end
)

criarSyncButton(
	"INF. ESQ → DIR",
	0.51,
	540,

	function()

		sincronizarOrb(
			"LowerLeft",
			"LowerRight"
		)

	end
)

criarSyncButton(
	"INF. DIR → ESQ",
	0.765,
	540,

	function()

		sincronizarOrb(
			"LowerRight",
			"LowerLeft"
		)

	end
)

--========================================================
-- CORES INDIVIDUAIS
--========================================================

local colorTitle =
	Instance.new("TextLabel")

colorTitle.BackgroundTransparency = 1

colorTitle.Position =
	UDim2.new(
		0,
		0,
		0,
		600
	)

colorTitle.Size =
	UDim2.new(
		1,
		0,
		0,
		20
	)

colorTitle.Font =
	Enum.Font.GothamBold

colorTitle.Text =
	"CORES INDIVIDUAIS DAS ORBS"

colorTitle.TextColor3 =
	COLORS.White

colorTitle.TextSize = 13

colorTitle.TextXAlignment =
	Enum.TextXAlignment.Left

colorTitle.Parent =
	configPage

--========================================================
-- TOGGLE DE COR INDIVIDUAL
--========================================================

local function criarToggleCor(
	texto,
	y,
	getState,
	setState
)

	local button =
		Instance.new("TextButton")

	button.Position =
		UDim2.new(
			0,
			0,
			0,
			y
		)

	button.Size =
		UDim2.new(
			1,
			0,
			0,
			32
		)

	button.BorderSizePixel = 0
	button.Parent = configPage

	local corner =
		Instance.new("UICorner")

	corner.CornerRadius =
		UDim.new(
			0,
			8
		)

	corner.Parent =
		button

	local function atualizar()

		if getState() then

			button.Text =
				texto
				.. "  •  ON"

			button.BackgroundColor3 =
				COLORS.Green

			button.TextColor3 =
				COLORS.White

		else

			button.Text =
				texto
				.. "  •  OFF"

			button.BackgroundColor3 =
				COLORS.Panel2

			button.TextColor3 =
				COLORS.Gray

		end

	end

	atualizar()

	button.MouseButton1Click:Connect(
		function()

			setState(
				not getState()
			)

			atualizar()

			aplicarCores()

		end
	)

	return button

end

--========================================================
-- QUATRO AUTOMÁTICAS INDIVIDUAIS
--========================================================

local leftAutoToggle =
	criarToggleCor(
		"AUTOMÁTICA • SUPERIOR ESQ.",
		625,

		function()
			return ColorConfig.LeftOrbAutomatic
		end,

		function(valor)
			ColorConfig.LeftOrbAutomatic =
				valor
		end
	)

local rightAutoToggle =
	criarToggleCor(
		"AUTOMÁTICA • SUPERIOR DIR.",
		661,

		function()
			return ColorConfig.RightOrbAutomatic
		end,

		function(valor)
			ColorConfig.RightOrbAutomatic =
				valor
		end
	)

local lowerLeftAutoToggle =
	criarToggleCor(
		"AUTOMÁTICA • INFERIOR ESQ.",
		697,

		function()
			return ColorConfig.LowerLeftAutomatic
		end,

		function(valor)
			ColorConfig.LowerLeftAutomatic =
				valor
		end
	)

local lowerRightAutoToggle =
	criarToggleCor(
		"AUTOMÁTICA • INFERIOR DIR.",
		733,

		function()
			return ColorConfig.LowerRightAutomatic
		end,

		function(valor)
			ColorConfig.LowerRightAutomatic =
				valor
		end
	)

--========================================================
-- PALETA
--========================================================

local paletteTitle =
	Instance.new("TextLabel")

paletteTitle.BackgroundTransparency = 1

paletteTitle.Position =
	UDim2.new(
		0,
		0,
		0,
		780
	)

paletteTitle.Size =
	UDim2.new(
		1,
		0,
		0,
		18
	)

paletteTitle.Font =
	Enum.Font.GothamBold

paletteTitle.Text =
	"PALETA • SELECIONE UMA ORB"

paletteTitle.TextColor3 =
	COLORS.White

paletteTitle.TextSize = 10

paletteTitle.TextXAlignment =
	Enum.TextXAlignment.Left

paletteTitle.Parent =
	configPage

--========================================================
-- PALETA DE CORES
--========================================================

local paletteColors = {

	{
		Name = "VERMELHO",
		Color = Color3.fromRGB(
			255,
			50,
			50
		)
	},

	{
		Name = "LARANJA",
		Color = Color3.fromRGB(
			255,
			130,
			30
		)
	},

	{
		Name = "AMARELO",
		Color = Color3.fromRGB(
			255,
			220,
			40
		)
	},

	{
		Name = "VERDE",
		Color = Color3.fromRGB(
			50,
			220,
			90
		)
	},

	{
		Name = "CIANO",
		Color = Color3.fromRGB(
			30,
			220,
			220
		)
	},

	{
		Name = "AZUL",
		Color = Color3.fromRGB(
			40,
			100,
			255
		)
	},

	{
		Name = "ROXO",
		Color = Color3.fromRGB(
			160,
			60,
			255
		)
	},

	{
		Name = "ROSA",
		Color = Color3.fromRGB(
			255,
			60,
			170
		)
	},

	{
		Name = "BRANCO",
		Color = Color3.fromRGB(
			255,
			255,
			255
		)
	},

	{
		Name = "PRETO",
		Color = Color3.fromRGB(
			10,
			10,
			10
		)
	},

	{
		Name = "CINZA",
		Color = Color3.fromRGB(
			130,
			130,
			130
		)
	},

	{
		Name = "DOURADO",
		Color = Color3.fromRGB(
			255,
			180,
			40
		)
	}
}

local selectedPaletteGroup =
	"LeftOrb"

--========================================================
-- PALETA VISUAL
--========================================================

local paletteFrame =
	Instance.new("Frame")

paletteFrame.Position =
	UDim2.new(
		0,
		0,
		0,
		800
	)

paletteFrame.Size =
	UDim2.new(
		1,
		0,
		0,
		76
	)

paletteFrame.BackgroundTransparency = 1
paletteFrame.Parent = configPage

local function criarCorPaleta(
	item,
	index
)

	local button =
		Instance.new("TextButton")

	local coluna =
		(index - 1) % 6

	local linha =
		math.floor(
			(index - 1) / 6
		)

	button.Size =
		UDim2.new(
			0,
			58,
			0,
			30
		)

	button.Position =
		UDim2.new(
			0,
			coluna * 72,
			0,
			linha * 38
		)

	button.BackgroundColor3 =
		item.Color

	button.BorderSizePixel = 0

	button.Text =
		""

	button.Parent =
		paletteFrame

	local corner =
		Instance.new("UICorner")

	corner.CornerRadius =
		UDim.new(
			0,
			7
		)

	corner.Parent =
		button

	button.MouseButton1Click:Connect(
		function()

			if selectedPaletteGroup ==
				"LeftOrb" then

				ColorConfig.LeftOrbColor =
					item.Color

			elseif selectedPaletteGroup ==
				"RightOrb" then

				ColorConfig.RightOrbColor =
					item.Color

			elseif selectedPaletteGroup ==
				"LowerLeft" then

				ColorConfig.LowerLeftColor =
					item.Color

			elseif selectedPaletteGroup ==
				"LowerRight" then

				ColorConfig.LowerRightColor =
					item.Color

			end

			aplicarCores()

		end
	)

end

for index, item in ipairs(
	paletteColors
) do

	criarCorPaleta(
		item,
		index
	)

end

--========================================================
-- SELEÇÃO DA ORB DA PALETA
--========================================================

local function criarOrbColorButton(
	texto,
	grupo,
	x,
	y
)

	local button =
		Instance.new("TextButton")

	button.Position =
		UDim2.new(
			x,
			0,
			0,
			y
		)

	button.Size =
		UDim2.new(
			0.235,
			0,
			0,
			30
		)

	button.BackgroundColor3 =
		COLORS.Panel2

	button.BorderSizePixel = 0

	button.Text =
		texto

	button.TextColor3 =
		COLORS.Gray

	button.TextSize = 8

	button.Font =
		Enum.Font.GothamBold

	button.Parent =
		configPage

	local corner =
		Instance.new("UICorner")

	corner.CornerRadius =
		UDim.new(
			0,
			7
		)

	corner.Parent =
		button

	button.MouseButton1Click:Connect(
		function()

			selectedPaletteGroup =
				grupo

			for _, objeto in ipairs(
				configPage:GetChildren()
			) do

				if objeto:IsA(
					"TextButton"
				)
				and objeto:GetAttribute(
					"ColorOrbButton"
				) then

					objeto.BackgroundColor3 =
						COLORS.Panel2

					objeto.TextColor3 =
						COLORS.Gray

				end

			end

			button.BackgroundColor3 =
				COLORS.Red

			button.TextColor3 =
				COLORS.White

		end
	)

	button:SetAttribute(
		"ColorOrbButton",
		true
	)

	return button

end

local leftColorButton =
	criarOrbColorButton(
		"SUP. ESQ.",
		"LeftOrb",
		0,
		880
	)

local rightColorButton =
	criarOrbColorButton(
		"SUP. DIR.",
		"RightOrb",
		0.255,
		880
	)

local lowerLeftColorButton =
	criarOrbColorButton(
		"INF. ESQ.",
		"LowerLeft",
		0.51,
		880
	)

local lowerRightColorButton =
	criarOrbColorButton(
		"INF. DIR.",
		"LowerRight",
		"0.765",
		880
	)

-- Corrige a posição do botão inferior direito
lowerRightColorButton.Position =
	UDim2.new(
		0.765,
		0,
		0,
		880
	)

leftColorButton.BackgroundColor3 =
	COLORS.Red

leftColorButton.TextColor3 =
	COLORS.White

--========================================================
-- RGB
--========================================================

local rgbTitle =
	Instance.new("TextLabel")

rgbTitle.BackgroundTransparency = 1

rgbTitle.Position =
	UDim2.new(
		0,
		0,
		0,
		920
	)

rgbTitle.Size =
	UDim2.new(
		1,
		0,
		0,
		18
	)

rgbTitle.Font =
	Enum.Font.GothamBold

rgbTitle.Text =
	"RGB • 0 - 255"

rgbTitle.TextColor3 =
	COLORS.White

rgbTitle.TextSize = 10

rgbTitle.TextXAlignment =
	Enum.TextXAlignment.Left

rgbTitle.Parent =
	configPage

local function criarRGBBox(
	nome,
	x
)

	local box =
		Instance.new("TextBox")

	box.Position =
		UDim2.new(
			x,
			0,
			0,
			940
		)

	box.Size =
		UDim2.new(
			0,
			55,
			0,
			30
		)

	box.BackgroundColor3 =
		COLORS.Panel2

	box.BorderSizePixel = 0

	box.Text =
		"255"

	box.TextColor3 =
		COLORS.White

	box.TextSize = 10

	box.Font =
		Enum.Font.GothamBold

	box.PlaceholderText =
		nome

	box.ClearTextOnFocus = false

	box.Parent =
		configPage

	local corner =
		Instance.new("UICorner")

	corner.CornerRadius =
		UDim.new(
			0,
			6
		)

	corner.Parent =
		box

	return box

end

local rBox =
	criarRGBBox(
		"R",
		0
	)

local gBox =
	criarRGBBox(
		"G",
		0.17
	)

local bBox =
	criarRGBBox(
		"B",
		0.34
	)

local rgbApply =
	Instance.new("TextButton")

rgbApply.Position =
	UDim2.new(
		0.52,
		0,
		0,
		940
	)

rgbApply.Size =
	UDim2.new(
		0.48,
		0,
		0,
		30
	)

rgbApply.BackgroundColor3 =
	COLORS.RedDark

rgbApply.BorderSizePixel = 0

rgbApply.Text =
	"APLICAR RGB NA ORB"

rgbApply.TextColor3 =
	COLORS.White

rgbApply.TextSize = 9

rgbApply.Font =
	Enum.Font.GothamBold

rgbApply.Parent =
	configPage

local rgbApplyCorner =
	Instance.new("UICorner")

rgbApplyCorner.CornerRadius =
	UDim.new(
		0,
		7
	)

rgbApplyCorner.Parent =
	rgbApply

local function obterRGB(
	box
)

	local numero =
		tonumber(
			box.Text
		)

	if not numero then
		return 0
	end

	return math.clamp(
		math.floor(
			numero + 0.5
		),
		0,
		255
	)

end

rgbApply.MouseButton1Click:Connect(
	function()

		local r =
			obterRGB(
				rBox
			)

		local g =
			obterRGB(
				gBox
			)

		local b =
			obterRGB(
				bBox
			)

		local novaCor =
			Color3.fromRGB(
				r,
				g,
				b
			)

		if selectedPaletteGroup ==
			"LeftOrb" then

			ColorConfig.LeftOrbColor =
				novaCor

		elseif selectedPaletteGroup ==
			"RightOrb" then

			ColorConfig.RightOrbColor =
				novaCor

		elseif selectedPaletteGroup ==
			"LowerLeft" then

			ColorConfig.LowerLeftColor =
				novaCor

		elseif selectedPaletteGroup ==
			"LowerRight" then

			ColorConfig.LowerRightColor =
				novaCor

		end

		aplicarCores()

	end
)

--========================================================
-- RESET
--========================================================

local reset =
	Instance.new("TextButton")

reset.Size =
	UDim2.new(
		1,
		0,
		0,
		36
	)

reset.Position =
	UDim2.new(
		0,
		0,
		0,
		985
	)

reset.BackgroundColor3 =
	COLORS.RedDark

reset.BorderSizePixel = 0

reset.Text =
	"RESTAURAR PADRÃO"

reset.TextColor3 =
	COLORS.White

reset.TextSize = 10

reset.Font =
	Enum.Font.GothamBold

reset.Parent =
	configPage

local resetCorner =
	Instance.new("UICorner")

resetCorner.CornerRadius =
	UDim.new(
		0,
		8
	)

resetCorner.Parent =
	reset

reset.MouseButton1Click:Connect(
	function()

		Config.Size =
			DEFAULT.Size

		Config.Movement =
			DEFAULT.Movement

		for eixo, valor in pairs(
			DEFAULT.LeftOrb
		) do

			Config.LeftOrb[eixo] =
				valor

		end

		for eixo, valor in pairs(
			DEFAULT.RightOrb
		) do

			Config.RightOrb[eixo] =
				valor

		end

		for eixo, valor in pairs(
			DEFAULT.LowerLeft
		) do

			Config.LowerLeft[eixo] =
				valor

		end

		for eixo, valor in pairs(
			DEFAULT.LowerRight
		) do

			Config.LowerRight[eixo] =
				valor

		end

		--============================================
		-- RESTAURAR CORES INDIVIDUAIS
		--============================================

		ColorConfig.LeftOrbAutomatic =
			true

		ColorConfig.RightOrbAutomatic =
			true

		ColorConfig.LowerLeftAutomatic =
			true

		ColorConfig.LowerRightAutomatic =
			true

		ColorConfig.LeftOrbColor =
			Color3.fromRGB(
				255,
				50,
				50
			)

		ColorConfig.RightOrbColor =
			Color3.fromRGB(
				255,
				50,
				50
			)

		ColorConfig.LowerLeftColor =
			Color3.fromRGB(
				50,
				100,
				255
			)

		ColorConfig.LowerRightColor =
			Color3.fromRGB(
				50,
				100,
				255
			)

		-- Atualiza visual dos toggles
		if leftAutoToggle then
			leftAutoToggle.Text =
				"AUTOMÁTICA • SUPERIOR ESQ.  •  ON"

			leftAutoToggle.BackgroundColor3 =
				COLORS.Green

			leftAutoToggle.TextColor3 =
				COLORS.White
		end

		if rightAutoToggle then
			rightAutoToggle.Text =
				"AUTOMÁTICA • SUPERIOR DIR.  •  ON"

			rightAutoToggle.BackgroundColor3 =
				COLORS.Green

			rightAutoToggle.TextColor3 =
				COLORS.White
		end

		if lowerLeftAutoToggle then
			lowerLeftAutoToggle.Text =
				"AUTOMÁTICA • INFERIOR ESQ.  •  ON"

			lowerLeftAutoToggle.BackgroundColor3 =
				COLORS.Green

			lowerLeftAutoToggle.TextColor3 =
				COLORS.White
		end

		if lowerRightAutoToggle then
			lowerRightAutoToggle.Text =
				"AUTOMÁTICA • INFERIOR DIR.  •  ON"

			lowerRightAutoToggle.BackgroundColor3 =
				COLORS.Green

			lowerRightAutoToggle.TextColor3 =
				COLORS.White
		end

		if ATIVO
			and player.Character then

			criarOrbsR6(
				player.Character
			)

		end

	end
)

configPage.CanvasSize =
	UDim2.new(
		0,
		0,
		0,
		1040
	)

--========================================================
-- ABAS
--========================================================

orbTab.MouseButton1Click:Connect(
	function()

		orbPage.Visible =
			true

		configPage.Visible =
			false

		orbTab.BackgroundColor3 =
			COLORS.Red

		orbTab.TextColor3 =
			COLORS.White

		configTab.BackgroundColor3 =
			COLORS.Panel2

		configTab.TextColor3 =
			COLORS.Gray

	end
)

configTab.MouseButton1Click:Connect(
	function()

		orbPage.Visible =
			false

		configPage.Visible =
			true

		configTab.BackgroundColor3 =
			COLORS.Red

		configTab.TextColor3 =
			COLORS.White

		orbTab.BackgroundColor3 =
			COLORS.Panel2

		orbTab.TextColor3 =
			COLORS.Gray

	end
)

--========================================================
-- ARRASTAR GUI
--========================================================

local dragging = false
local dragStart
local startPosition

top.InputBegan:Connect(
	function(input)

		if input.UserInputType ==
			Enum.UserInputType.MouseButton1
			or input.UserInputType ==
			Enum.UserInputType.Touch then

			dragging = true

			dragStart =
				input.Position

			startPosition =
				main.Position

		end

	end
)

UserInputService.InputChanged:Connect(
	function(input)

		if not dragging then
			return
		end

		if input.UserInputType ==
			Enum.UserInputType.MouseMovement
			or input.UserInputType ==
			Enum.UserInputType.Touch then

			local delta =
				input.Position
				- dragStart

			main.Position =
				UDim2.new(
					startPosition.X.Scale,
					startPosition.X.Offset
						+ delta.X,

					startPosition.Y.Scale,
					startPosition.Y.Offset
						+ delta.Y
				)

		end

	end
)

UserInputService.InputEnded:Connect(
	function(input)

		if input.UserInputType ==
			Enum.UserInputType.MouseButton1
			or input.UserInputType ==
			Enum.UserInputType.Touch then

			dragging = false

		end

	end
)

--========================================================
-- MINIMIZAR
--========================================================

local minimizado = false

minimize.MouseButton1Click:Connect(
	function()

		minimizado =
			not minimizado

		if minimizado then

			main.Size =
				UDim2.new(
					0,
					460,
					0,
					48
				)

			tabs.Visible = false
			orbPage.Visible = false
			configPage.Visible = false

			minimize.Text =
				"+"

		else

			main.Size =
				UDim2.new(
					0,
					460,
					0,
					390
				)

			tabs.Visible = true

			if configPage.Visible then

				configPage.Visible =
					true

			else

				orbPage.Visible =
					true

			end

			minimize.Text =
				"—"

		end

	end
)

--========================================================
-- TOGGLE ORBS
--========================================================

toggle.MouseButton1Click:Connect(
	function()

		ATIVO =
			not ATIVO

		if ATIVO then

			if player.Character then

				criarOrbsR6(
					player.Character
				)

			end

			toggle.Text =
				"DESATIVAR ORBS"

			toggle.BackgroundColor3 =
				COLORS.Red

		else

			if conexaoOrb then

				conexaoOrb:Disconnect()
				conexaoOrb = nil

			end

			if player.Character then

				local folder =
					player.Character:FindFirstChild(
						"VisualOrbs"
					)

				if folder then
					folder:Destroy()
				end

			end

			toggle.Text =
				"ATIVAR ORBS"

			toggle.BackgroundColor3 =
				COLORS.RedDark

		end

		atualizarStatus()

	end
)

--========================================================
-- RECRIAR
--========================================================

recreate.MouseButton1Click:Connect(
	function()

		if ATIVO
			and player.Character then

			criarOrbsR6(
				player.Character
			)

		end

	end
)

--========================================================
-- CRIAR PARTE DA ORB
--========================================================

local function criarOrbPart(
	folder,
	torso,
	nome,
	configName,
	tamanho,
	cor,
	weldName
)

	local parte =
		Instance.new("Part")

	parte.Name =
		nome

	parte.Shape =
		Enum.PartType.Ball

	parte.Size =
		Vector3.new(
			tamanho.X
				* Config.Size,

			tamanho.Y
				* Config.Size,

			tamanho.Z
				* Config.Size
		)

	parte.Color =
		cor

	parte.Material =
		Enum.Material.SmoothPlastic

	parte.CanCollide = false
	parte.CanTouch = false
	parte.CanQuery = false
	parte.Massless = true
	parte.CastShadow = false

	parte.Parent =
		folder

	local weld =
		Instance.new("Weld")

	weld.Name =
		weldName

	weld.Part0 =
		torso

	weld.Part1 =
		parte

	weld.C0 =
		CFrame.new(
			Config[configName].X,
			Config[configName].Y,
			Config[configName].Z
		)

	weld.Parent =
		parte

	return {
		weld = weld,
		baseC0 = weld.C0,
		side = 0
	}

end

--========================================================
-- CRIAR ORBS R6
--========================================================

function criarOrbsR6(
	character
)

	if conexaoOrb then

		conexaoOrb:Disconnect()
		conexaoOrb = nil

	end

	local torso =
		character:FindFirstChild(
			"Torso"
		)

	local humanoid =
		character:FindFirstChild(
			"Humanoid"
		)

	local leftLeg =
		character:FindFirstChild(
			"Left Leg"
		)

	local rightLeg =
		character:FindFirstChild(
			"Right Leg"
		)

	if not torso
		or not humanoid
		or not leftLeg
		or not rightLeg then

		return

	end

	local antigo =
		character:FindFirstChild(
			"VisualOrbs"
		)

	if antigo then
		antigo:Destroy()
	end

	local folder =
		Instance.new("Folder")

	folder.Name =
		"VisualOrbs"

	folder.Parent =
		character

	local orbs = {}
	local lowerOrbs = {}

	--====================================================
	-- CORES INICIAIS INDIVIDUAIS
	--====================================================

	local upperLeftInitialColor

	if ColorConfig.LeftOrbAutomatic then

		upperLeftInitialColor =
			torso.Color

	else

		upperLeftInitialColor =
			ColorConfig.LeftOrbColor

	end

	local upperRightInitialColor

	if ColorConfig.RightOrbAutomatic then

		upperRightInitialColor =
			torso.Color

	else

		upperRightInitialColor =
			ColorConfig.RightOrbColor

	end

	local lowerLeftInitialColor

	if ColorConfig.LowerLeftAutomatic then

		lowerLeftInitialColor =
			leftLeg.Color

	else

		lowerLeftInitialColor =
			ColorConfig.LowerLeftColor

	end

	local lowerRightInitialColor

	if ColorConfig.LowerRightAutomatic then

		lowerRightInitialColor =
			rightLeg.Color

	else

		lowerRightInitialColor =
			ColorConfig.LowerRightColor

	end

	--====================================================
	-- SUPERIOR ESQUERDA
	--====================================================

	local left =
		criarOrbPart(
			folder,
			torso,
			"LeftOrb",
			"LeftOrb",
			Vector3.new(
				1.36,
				1.28,
				1.35
			),
			upperLeftInitialColor,
			"OrbWeld"
		)

	left.side = -1

	table.insert(
		orbs,
		left
	)

	--====================================================
	-- SUPERIOR DIREITA
	--====================================================

	local right =
		criarOrbPart(
			folder,
			torso,
			"RightOrb",
			"RightOrb",
			Vector3.new(
				1.36,
				1.28,
				1.35
			),
			upperRightInitialColor,
			"OrbWeld"
		)

	right.side = 1

	table.insert(
		orbs,
		right
	)

	--====================================================
	-- INFERIOR ESQUERDA
	--====================================================

	local lowerLeft =
		criarOrbPart(
			folder,
			torso,
			"LowerOrbLeft",
			"LowerLeft",
			Vector3.new(
				1.35,
				1.30,
				1.35
			),
			lowerLeftInitialColor,
			"LowerOrbWeld"
		)

	lowerLeft.side = -1

	table.insert(
		lowerOrbs,
		lowerLeft
	)

	--====================================================
	-- INFERIOR DIREITA
	--====================================================

	local lowerRight =
		criarOrbPart(
			folder,
			torso,
			"LowerOrbRight",
			"LowerRight",
			Vector3.new(
				1.35,
				1.30,
				1.35
			),
			lowerRightInitialColor,
			"LowerOrbWeld"
		)

	lowerRight.side = 1

	table.insert(
		lowerOrbs,
		lowerRight
	)

	-- Aplica imediatamente as cores individuais
	aplicarCores()

	--====================================================
	-- MOVIMENTO
	--====================================================

	local tempo = 0

	local MAX_X = 0.60
	local MAX_Y = 0.40
	local MAX_Z = 0.35

	local LOWER_MAX_X = 0.25
	local LOWER_MAX_Y = 0.20
	local LOWER_MAX_Z = 0.20

	local SUAVIDADE = 3
	local LOWER_SUAVIDADE = 6

	local ultimaDirecao =
		torso.CFrame.LookVector

	conexaoOrb =
		RunService.RenderStepped:Connect(
			function(dt)

				if not ATIVO then
					return
				end

				if not character.Parent
					or humanoid.Health <= 0 then

					if conexaoOrb then

						conexaoOrb:Disconnect()
						conexaoOrb = nil

					end

					return

				end

				tempo += dt

				--================================================
				-- ATUALIZA CORES AUTOMÁTICAS
				--================================================

				if ColorConfig.LeftOrbAutomatic
					or ColorConfig.RightOrbAutomatic
					or ColorConfig.LowerLeftAutomatic
					or ColorConfig.LowerRightAutomatic then

					aplicarCores()

				end

				local estado =
					humanoid:GetState()

				local velocidade =
					torso.AssemblyLinearVelocity

				local velocidadeHorizontal =
					Vector3.new(
						velocidade.X,
						0,
						velocidade.Z
					).Magnitude

				local intensidade =
					math.clamp(
						velocidadeHorizontal
							/ 16,
						0,
						1
					)

				local direcaoAtual =
					torso.CFrame.LookVector

				local produto =
					math.clamp(
						ultimaDirecao:Dot(
							direcaoAtual
						),
						-1,
						1
					)

				local angulo =
					math.acos(
						produto
					)

				local curva =
					math.clamp(
						angulo
							/ math.rad(20),
						0,
						1
					)

				ultimaDirecao =
					direcaoAtual

				local frequencia = 3

				local amplitudeX = 0
				local amplitudeY = 0
				local amplitudeZ = 0

				local rotacaoX = 0
				local rotacaoZ = 0

				--================================================
				-- ANDANDO / CORRENDO
				--================================================

				if velocidadeHorizontal > 1 then

					frequencia =
						4
						+ intensidade * 2

					amplitudeY =
						0.12
						* intensidade

					amplitudeX =
						0.08
						* intensidade

					amplitudeZ =
						0.08
						* intensidade

					rotacaoX =
						math.rad(5)
						* intensidade

					amplitudeX +=
						0.50
						* curva

					amplitudeZ +=
						0.22
						* curva

					rotacaoZ =
						math.rad(25)
						* curva

				--================================================
				-- PULANDO
				--================================================

				elseif estado ==
					Enum.HumanoidStateType.Jumping then

					frequencia = 2.2

					amplitudeX = 0.12
					amplitudeY = 0.40
					amplitudeZ = 0.20

					rotacaoX =
						math.rad(18)

					rotacaoZ =
						math.rad(7)

				--================================================
				-- FREEFALL
				--================================================

				elseif estado ==
					Enum.HumanoidStateType.Freefall then

					frequencia = 1.8

					amplitudeX = 0.14
					amplitudeY = 0.50
					amplitudeZ = 0.24

					rotacaoX =
						math.rad(22)

					rotacaoZ =
						math.rad(9)

				--================================================
				-- SWIMMING
				--================================================

				elseif estado ==
					Enum.HumanoidStateType.Swimming then

					frequencia = 2.5

					amplitudeX = 0.25
					amplitudeY = 0.35
					amplitudeZ = 0.25

					rotacaoX =
						math.rad(20)

					rotacaoZ =
						math.rad(15)

				--================================================
				-- CLIMBING
				--================================================

				elseif estado ==
					Enum.HumanoidStateType.Climbing then

					frequencia = 3

					amplitudeX = 0.18
					amplitudeY = 0.38
					amplitudeZ = 0.18

					rotacaoX =
						math.rad(16)

					rotacaoZ =
						math.rad(10)

				end

				amplitudeX *=
					Config.Movement

				amplitudeY *=
					Config.Movement

				amplitudeZ *=
					Config.Movement

				rotacaoX *=
					Config.Movement

				rotacaoZ *=
					Config.Movement

				--================================================
				-- ORBS SUPERIORES
				--================================================

				for _, orb in ipairs(
					orbs
				) do

					local lado =
						orb.side

					local onda =
						math.sin(
							tempo
								* frequencia
						)

					local ondaLenta =
						math.sin(
							tempo
								* frequencia
								* 0.55
								+ 0.8
						)

					local x =
						onda
						* amplitudeX
						* lado

					local y =
						ondaLenta
						* amplitudeY

					local z =
						math.abs(
							onda
						)
						* amplitudeZ

					local rx =
						ondaLenta
						* rotacaoX

					local rz =
						onda
						* rotacaoZ
						* lado

					x =
						math.clamp(
							x,
							-MAX_X,
							MAX_X
						)

					y =
						math.clamp(
							y,
							-MAX_Y,
							MAX_Y
						)

					z =
						math.clamp(
							z,
							-MAX_Z,
							MAX_Z
						)

					local alvo =
						orb.baseC0
						* CFrame.new(
							x,
							y,
							z
						)
						* CFrame.Angles(
							rx,
							0,
							rz
						)

					local alpha =
						math.clamp(
							dt
								* SUAVIDADE,
							0,
							1
						)

					orb.weld.C0 =
						orb.weld.C0:Lerp(
							alvo,
							alpha
						)

				end

				--================================================
				-- LOWER ORBS
				--================================================

				for _, orb in ipairs(
					lowerOrbs
				) do

					local lado =
						orb.side

					local onda =
						math.sin(
							tempo
								* frequencia
								* 0.85
								+ lado
								* 0.5
						)

					local ondaLenta =
						math.sin(
							tempo
								* frequencia
								* 0.50
								+ lado
						)

					local x =
						onda
						* 0.07
						* lado

					local y =
						ondaLenta
						* 0.05

					local z =
						math.abs(
							onda
						)
						* 0.07

					x +=
						curva
						* 0.08
						* lado

					x *=
						Config.Movement

					y *=
						Config.Movement

					z *=
						Config.Movement

					local rx =
						ondaLenta
						* math.rad(3)
						* Config.Movement

					local rz =
						onda
						* math.rad(4)
						* lado
						* Config.Movement

					x =
						math.clamp(
							x,
							-LOWER_MAX_X,
							LOWER_MAX_X
						)

					y =
						math.clamp(
							y,
							-LOWER_MAX_Y,
							LOWER_MAX_Y
						)

					z =
						math.clamp(
							z,
							-LOWER_MAX_Z,
							LOWER_MAX_Z
						)

					local alvo =
						orb.baseC0
						* CFrame.new(
							x,
							y,
							z
						)
						* CFrame.Angles(
							rx,
							0,
							rz
						)

					local alpha =
						math.clamp(
							dt
								* LOWER_SUAVIDADE,
							0,
							1
						)

					orb.weld.C0 =
						orb.weld.C0:Lerp(
							alvo,
							alpha
						)

				end

			end
		)

end

--========================================================
-- CONFIGURAÇÃO DO PERSONAGEM
--========================================================

local function configurar(
	character
)

	task.wait(1)

	if ATIVO then

		criarOrbsR6(
			character
		)

	end

end

if player.Character then

	task.spawn(
		function()

			configurar(
				player.Character
			)

		end
	)

end

player.CharacterAdded:Connect(
	function(character)

		if conexaoOrb then

			conexaoOrb:Disconnect()
			conexaoOrb = nil

		end

		task.spawn(
			function()

				configurar(
					character
				)

			end
		ed
