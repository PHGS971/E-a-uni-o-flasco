bit32 = {};
local N = 32;
local P = 2 ^ N;
bit32.bnot = function(x)
	x = x % P;
	return (P - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bxor = function(x, y)
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % P;
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		local add = 0;
		if (x >= (P / 2)) then
			add = P - (2 ^ (N - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + add;
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
bit32 = {};
local N = 32;
local P = 2 ^ N;
bit32.bnot = function(x)
	x = x % P;
	return (P - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bxor = function(x, y)
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % P;
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		local add = 0;
		if (x >= (P / 2)) then
			add = P - (2 ^ (N - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + add;
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
local TABLE_TableIndirection = {};
TABLE_TableIndirection["Players%0"] = game:GetService("Players");
TABLE_TableIndirection["TweenService%0"] = game:GetService("TweenService");
TABLE_TableIndirection["RunService%0"] = game:GetService("RunService");
TABLE_TableIndirection["StarterGui%0"] = game:GetService("StarterGui");
TABLE_TableIndirection["UserInput%0"] = game:GetService("UserInputService");
TABLE_TableIndirection["replicatedStorage%0"] = game:GetService("ReplicatedStorage");
TABLE_TableIndirection["LocalPlayer%0"] = TABLE_TableIndirection["Players%0"].LocalPlayer;
TABLE_TableIndirection["Camera%0"] = workspace.CurrentCamera;
if not TABLE_TableIndirection["replicatedStorage%0"]:FindFirstChild("decalIdentifier") then
	TABLE_TableIndirection["d%0"] = Instance.new("Decal");
	TABLE_TableIndirection["d%0"].Name = "decalIdentifier";
	TABLE_TableIndirection["d%0"].Parent = TABLE_TableIndirection["replicatedStorage%0"];
end
TABLE_TableIndirection["toggles%0"] = {Movement={infJump=false,noClip=false,xray=false},Sheriff={aimbot=false},ESP={enabled=false,gun=false},Murder={killAll=false},TP={autoGetGun=false}};
TABLE_TableIndirection["ss%0"] = {GunEsp=true,GunEspColor=Color3.new(0, 0, 1),GunNameEsp=true,GunNameTransparency=0.1,NameFont=Enum.Font.SourceSans,GunNameColor=Color3.new(0, 0, 1),AutoPickupGun=true,GColorT=Color3.new(0, 1, 0),GColorF=Color3.new(1, 0, 0)};
TABLE_TableIndirection["espFolder%0"] = Instance.new("Folder");
TABLE_TableIndirection["espFolder%0"].Name = "ESPFolder";
TABLE_TableIndirection["espFolder%0"].Parent = workspace;
TABLE_TableIndirection["lastSheriffPos%0"] = {};
TABLE_TableIndirection["savedGunPosition%0"] = nil;
TABLE_TableIndirection["flingActive%0"] = false;
local function performFling()
	TABLE_TableIndirection["offset%0"] = 0.3;
	while TABLE_TableIndirection["flingActive%0"] do
		TABLE_TableIndirection["RunService%0"].Heartbeat:Wait();
		TABLE_TableIndirection["character%0"] = TABLE_TableIndirection["LocalPlayer%0"].Character;
		TABLE_TableIndirection["hrp%0"] = TABLE_TableIndirection["character%0"] and TABLE_TableIndirection["character%0"]:FindFirstChild("HumanoidRootPart");
		if TABLE_TableIndirection["hrp%0"] then
			TABLE_TableIndirection["currentVel%0"] = TABLE_TableIndirection["hrp%0"].Velocity;
			TABLE_TableIndirection["hrp%0"].Velocity = (TABLE_TableIndirection["currentVel%0"] * 4500) + Vector3.new(0, 4500, 0);
			TABLE_TableIndirection["RunService%0"].RenderStepped:Wait();
			TABLE_TableIndirection["hrp%0"].Velocity = TABLE_TableIndirection["currentVel%0"];
			TABLE_TableIndirection["RunService%0"].Stepped:Wait();
			TABLE_TableIndirection["hrp%0"].Velocity = TABLE_TableIndirection["currentVel%0"] + Vector3.new(0, TABLE_TableIndirection["offset%0"], 0);
			TABLE_TableIndirection["offset%0"] = -TABLE_TableIndirection["offset%0"];
		end
	end
end
local function watchPlayer(p)
	p.CharacterAdded:Connect(function(c)
		TABLE_TableIndirection["hrp%0"] = c:WaitForChild("HumanoidRootPart");
		TABLE_TableIndirection["hum%0"] = c:WaitForChild("Humanoid");
		if (TABLE_TableIndirection["hum%0"] or (4593 <= 2672)) then
			TABLE_TableIndirection["hum%0"].Died:Connect(function()
				if (c:FindFirstChild("Gun") or c:FindFirstChild("gun") or (1168 > 3156)) then
					TABLE_TableIndirection["lastSheriffPos%0"][p.Name] = TABLE_TableIndirection["hrp%0"].Position;
				end
			end);
		end
	end);
end
for _, p in ipairs(TABLE_TableIndirection["Players%0"]:GetPlayers()) do
	if ((p ~= TABLE_TableIndirection["LocalPlayer%0"]) or (572 > 4486)) then
		watchPlayer(p);
	end
end
TABLE_TableIndirection["Players%0"].PlayerAdded:Connect(function(p)
	if (p ~= TABLE_TableIndirection["LocalPlayer%0"]) then
		watchPlayer(p);
	end
end);
local function initUI()
	TABLE_TableIndirection["sg%0"] = TABLE_TableIndirection["LocalPlayer%0"]:WaitForChild("PlayerGui");
	TABLE_TableIndirection["gui%0"] = Instance.new("ScreenGui");
	TABLE_TableIndirection["gui%0"].Name = "MM2EnhancedUI";
	TABLE_TableIndirection["gui%0"].ResetOnSpawn = false;
	TABLE_TableIndirection["gui%0"].Parent = TABLE_TableIndirection["sg%0"];
	TABLE_TableIndirection["mf%0"] = Instance.new("Frame");
	TABLE_TableIndirection["mf%0"].Name = "MainFrame";
	TABLE_TableIndirection["mf%0"].Size = UDim2.new(0.3, 0, 0.3, 0);
	TABLE_TableIndirection["mf%0"].Position = UDim2.new(0.35, 0, 0.35, 0);
	TABLE_TableIndirection["mf%0"].BackgroundColor3 = Color3.fromRGB(20, 20, 20);
	TABLE_TableIndirection["mf%0"].BorderSizePixel = 0;
	TABLE_TableIndirection["mf%0"].Active = true;
	TABLE_TableIndirection["mf%0"].Draggable = true;
	TABLE_TableIndirection["mf%0"].Parent = TABLE_TableIndirection["gui%0"];
	TABLE_TableIndirection["corner%0"] = Instance.new("UICorner");
	TABLE_TableIndirection["corner%0"].CornerRadius = UDim.new(0, 8);
	TABLE_TableIndirection["corner%0"].Parent = TABLE_TableIndirection["mf%0"];
	local tabs, frames = {}, {};
	for i, name in ipairs({"Movement","Sheriff","ESP","TP","Murder"}) do
		TABLE_TableIndirection["tb%0"] = Instance.new("TextButton");
		TABLE_TableIndirection["tb%0"].Name = name .. "Tab";
		TABLE_TableIndirection["tb%0"].Size = UDim2.new(0, 50, 0, 20);
		TABLE_TableIndirection["tb%0"].Position = UDim2.new(0, ((i - 1) * 55) + 5, 0, 5);
		TABLE_TableIndirection["tb%0"].Text = name;
		TABLE_TableIndirection["tb%0"].BackgroundColor3 = Color3.fromRGB(45, 45, 45);
		TABLE_TableIndirection["tb%0"].TextColor3 = Color3.new(1, 1, 1);
		TABLE_TableIndirection["tb%0"].Font = Enum.Font.SourceSansBold;
		TABLE_TableIndirection["tb%0"].TextScaled = true;
		TABLE_TableIndirection["tb%0"].Parent = TABLE_TableIndirection["mf%0"];
		tabs[name] = TABLE_TableIndirection["tb%0"];
		TABLE_TableIndirection["f%0"] = Instance.new("Frame");
		TABLE_TableIndirection["f%0"].Name = name .. "Frame";
		TABLE_TableIndirection["f%0"].Size = UDim2.new(1, -10, 1, -40);
		TABLE_TableIndirection["f%0"].Position = UDim2.new(0, 5, 0, 30);
		TABLE_TableIndirection["f%0"].BackgroundColor3 = Color3.fromRGB(30, 30, 30);
		TABLE_TableIndirection["f%0"].Visible = i == 1;
		TABLE_TableIndirection["f%0"].Parent = TABLE_TableIndirection["mf%0"];
		TABLE_TableIndirection["fc%0"] = Instance.new("UICorner");
		TABLE_TableIndirection["fc%0"].CornerRadius = UDim.new(0, 8);
		TABLE_TableIndirection["fc%0"].Parent = TABLE_TableIndirection["f%0"];
		frames[name] = TABLE_TableIndirection["f%0"];
	end
	for name, tb in pairs(tabs) do
		tb.MouseButton1Click:Connect(function()
			for n, f in pairs(frames) do
				f.Visible = n == name;
			end
			for n, b in pairs(tabs) do
				b.BackgroundColor3 = ((n == name) and Color3.fromRGB(70, 70, 70)) or Color3.fromRGB(45, 45, 45);
			end
		end);
	end
	TABLE_TableIndirection["toggleBtn%0"] = Instance.new("TextButton");
	TABLE_TableIndirection["toggleBtn%0"].Name = "TopToggle";
	TABLE_TableIndirection["toggleBtn%0"].Size = UDim2.new(0, 40, 0, 40);
	TABLE_TableIndirection["toggleBtn%0"].Position = UDim2.new(1, -50, 0, 10);
	TABLE_TableIndirection["toggleBtn%0"].BackgroundColor3 = Color3.new(0, 0, 0);
	TABLE_TableIndirection["toggleBtn%0"].Text = "";
	TABLE_TableIndirection["toggleBtn%0"].Parent = TABLE_TableIndirection["gui%0"];
	TABLE_TableIndirection["tcorner%0"] = Instance.new("UICorner");
	TABLE_TableIndirection["tcorner%0"].CornerRadius = UDim.new(1, 0);
	TABLE_TableIndirection["tcorner%0"].Parent = TABLE_TableIndirection["toggleBtn%0"];
	TABLE_TableIndirection["toggleBtn%0"].MouseButton1Click:Connect(function()
		if TABLE_TableIndirection["mf%0"].Visible then
			TABLE_TableIndirection["tween%0"] = TABLE_TableIndirection["TweenService%0"]:Create(TABLE_TableIndirection["mf%0"], TweenInfo.new(0.3), {Position=UDim2.new(1, 0, 0.35, 0)});
			TABLE_TableIndirection["tween%0"]:Play();
			wait(0.3);
			TABLE_TableIndirection["mf%0"].Visible = false;
		else
			TABLE_TableIndirection["mf%0"].Visible = true;
			TABLE_TableIndirection["tween%0"] = TABLE_TableIndirection["TweenService%0"]:Create(TABLE_TableIndirection["mf%0"], TweenInfo.new(0.3), {Position=UDim2.new(0.35, 0, 0.35, 0)});
			TABLE_TableIndirection["tween%0"]:Play();
		end
	end);
	local function btn(parent, text, pos, size)
		TABLE_TableIndirection["b%0"] = Instance.new("TextButton");
		TABLE_TableIndirection["b%0"].Size = size or UDim2.new(0, 100, 0, 20);
		TABLE_TableIndirection["b%0"].Position = pos;
		TABLE_TableIndirection["b%0"].Text = text;
		TABLE_TableIndirection["b%0"].BackgroundColor3 = Color3.fromRGB(60, 60, 60);
		TABLE_TableIndirection["b%0"].TextColor3 = Color3.new(1, 1, 1);
		TABLE_TableIndirection["b%0"].Font = Enum.Font.SourceSansBold;
		TABLE_TableIndirection["b%0"].TextScaled = true;
		TABLE_TableIndirection["bc%0"] = Instance.new("UICorner");
		TABLE_TableIndirection["bc%0"].CornerRadius = UDim.new(0, 4);
		TABLE_TableIndirection["bc%0"].Parent = TABLE_TableIndirection["b%0"];
		TABLE_TableIndirection["b%0"].Parent = parent;
		return TABLE_TableIndirection["b%0"];
	end
	TABLE_TableIndirection["mTab%0"] = frames['Movement'];
	TABLE_TableIndirection["y%0"] = 10;
	TABLE_TableIndirection["sp%0"] = 25;
	TABLE_TableIndirection["ij%0"] = btn(TABLE_TableIndirection["mTab%0"], "InfJump: " .. ((TABLE_TableIndirection["toggles%0"].Movement.infJump and "ON") or "OFF"), UDim2.new(0, 10, 0, TABLE_TableIndirection["y%0"]));
	TABLE_TableIndirection["ij%0"].MouseButton1Click:Connect(function()
		TABLE_TableIndirection["toggles%0"].Movement.infJump = not TABLE_TableIndirection["toggles%0"].Movement.infJump;
		TABLE_TableIndirection["ij%0"].Text = "InfJump: " .. ((TABLE_TableIndirection["toggles%0"].Movement.infJump and "ON") or "OFF");
		TABLE_TableIndirection["ij%0"].BackgroundColor3 = (TABLE_TableIndirection["toggles%0"].Movement.infJump and Color3.fromRGB(50, 205, 50)) or Color3.fromRGB(255, 51, 51);
	end);
	y = TABLE_TableIndirection["y%0"] + TABLE_TableIndirection["sp%0"];
	TABLE_TableIndirection["nc%0"] = btn(TABLE_TableIndirection["mTab%0"], "NoClip: " .. ((TABLE_TableIndirection["toggles%0"].Movement.noClip and "ON") or "OFF"), UDim2.new(0, 10, 0, y));
	TABLE_TableIndirection["nc%0"].MouseButton1Click:Connect(function()
		TABLE_TableIndirection["toggles%0"].Movement.noClip = not TABLE_TableIndirection["toggles%0"].Movement.noClip;
		TABLE_TableIndirection["nc%0"].Text = "NoClip: " .. ((TABLE_TableIndirection["toggles%0"].Movement.noClip and "ON") or "OFF");
		TABLE_TableIndirection["nc%0"].BackgroundColor3 = (TABLE_TableIndirection["toggles%0"].Movement.noClip and Color3.fromRGB(50, 205, 50)) or Color3.fromRGB(255, 51, 51);
	end);
	y = y + TABLE_TableIndirection["sp%0"];
	TABLE_TableIndirection["xr%0"] = btn(TABLE_TableIndirection["mTab%0"], "Xray: " .. ((TABLE_TableIndirection["toggles%0"].Movement.xray and "ON") or "OFF"), UDim2.new(0, 10, 0, y));
	TABLE_TableIndirection["xr%0"].MouseButton1Click:Connect(function()
		TABLE_TableIndirection["toggles%0"].Movement.xray = not TABLE_TableIndirection["toggles%0"].Movement.xray;
		TABLE_TableIndirection["xr%0"].Text = "Xray: " .. ((TABLE_TableIndirection["toggles%0"].Movement.xray and "ON") or "OFF");
		TABLE_TableIndirection["xr%0"].BackgroundColor3 = (TABLE_TableIndirection["toggles%0"].Movement.xray and Color3.fromRGB(50, 205, 50)) or Color3.fromRGB(255, 51, 51);
		for _, o in ipairs(workspace:GetDescendants()) do
			if ((1404 == 1404) and o:IsA("BasePart")) then
				TABLE_TableIndirection["p%0"] = o:FindFirstAncestorOfClass("Model");
				TABLE_TableIndirection["isP%0"] = TABLE_TableIndirection["p%0"] and TABLE_TableIndirection["Players%0"]:GetPlayerFromCharacter(TABLE_TableIndirection["p%0"]);
				if (not TABLE_TableIndirection["isP%0"] or (3748 < 2212)) then
					o.LocalTransparencyModifier = (TABLE_TableIndirection["toggles%0"].Movement.xray and 0.4) or 0;
				end
			end
		end
	end);
	y = y + TABLE_TableIndirection["sp%0"];
	TABLE_TableIndirection["tf%0"] = btn(TABLE_TableIndirection["mTab%0"], "Touch Fling: OFF", UDim2.new(0, 10, 0, y));
	TABLE_TableIndirection["tf%0"].MouseButton1Click:Connect(function()
		TABLE_TableIndirection["flingActive%0"] = not TABLE_TableIndirection["flingActive%0"];
		TABLE_TableIndirection["tf%0"].Text = "Touch Fling: " .. ((TABLE_TableIndirection["flingActive%0"] and "ON") or "OFF");
		if TABLE_TableIndirection["flingActive%0"] then
			coroutine.wrap(performFling)();
		end
	end);
	y = y + TABLE_TableIndirection["sp%0"];
	TABLE_TableIndirection["sTab%0"] = frames['Sheriff'];
	y = 10;
	TABLE_TableIndirection["ab%0"] = btn(TABLE_TableIndirection["sTab%0"], "Aimbot: " .. ((TABLE_TableIndirection["toggles%0"].Sheriff.aimbot and "ON") or "OFF"), UDim2.new(0, 10, 0, y));
	TABLE_TableIndirection["ab%0"].MouseButton1Click:Connect(function()
		TABLE_TableIndirection["toggles%0"].Sheriff.aimbot = not TABLE_TableIndirection["toggles%0"].Sheriff.aimbot;
		TABLE_TableIndirection["ab%0"].Text = "Aimbot: " .. ((TABLE_TableIndirection["toggles%0"].Sheriff.aimbot and "ON") or "OFF");
		TABLE_TableIndirection["ab%0"].BackgroundColor3 = (TABLE_TableIndirection["toggles%0"].Sheriff.aimbot and Color3.fromRGB(50, 205, 50)) or Color3.fromRGB(255, 51, 51);
	end);
	TABLE_TableIndirection["eTab%0"] = frames['ESP'];
	y = 10;
	TABLE_TableIndirection["espBtn%0"] = btn(TABLE_TableIndirection["eTab%0"], "ESP: " .. ((TABLE_TableIndirection["toggles%0"].ESP.enabled and "ON") or "OFF"), UDim2.new(0, 10, 0, y));
	TABLE_TableIndirection["espBtn%0"].MouseButton1Click:Connect(function()
		TABLE_TableIndirection["toggles%0"].ESP.enabled = not TABLE_TableIndirection["toggles%0"].ESP.enabled;
		TABLE_TableIndirection["espBtn%0"].Text = "ESP: " .. ((TABLE_TableIndirection["toggles%0"].ESP.enabled and "ON") or "OFF");
		TABLE_TableIndirection["espBtn%0"].BackgroundColor3 = (TABLE_TableIndirection["toggles%0"].ESP.enabled and Color3.fromRGB(50, 205, 50)) or Color3.fromRGB(255, 51, 51);
		if (not TABLE_TableIndirection["toggles%0"].ESP.enabled or (1180 == 2180)) then
			for _, p in ipairs(TABLE_TableIndirection["Players%0"]:GetPlayers()) do
				if ((4090 < 4653) and p.Character and p.Character:FindFirstChild("Head")) then
					TABLE_TableIndirection["l%0"] = p.Character.Head:FindFirstChild("ESPLabel");
					if TABLE_TableIndirection["l%0"] then
						TABLE_TableIndirection["l%0"]:Destroy();
					end
				end
			end
		end
	end);
	y = y + TABLE_TableIndirection["sp%0"];
	TABLE_TableIndirection["gunBtn%0"] = btn(TABLE_TableIndirection["eTab%0"], "Gun ESP: " .. ((TABLE_TableIndirection["toggles%0"].ESP.gun and "ON") or "OFF"), UDim2.new(0, 10, 0, y));
	TABLE_TableIndirection["gunBtn%0"].MouseButton1Click:Connect(function()
		TABLE_TableIndirection["toggles%0"].ESP.gun = not TABLE_TableIndirection["toggles%0"].ESP.gun;
		TABLE_TableIndirection["gunBtn%0"].Text = "Gun ESP: " .. ((TABLE_TableIndirection["toggles%0"].ESP.gun and "ON") or "OFF");
		TABLE_TableIndirection["gunBtn%0"].BackgroundColor3 = (TABLE_TableIndirection["toggles%0"].ESP.gun and Color3.fromRGB(50, 205, 50)) or Color3.fromRGB(255, 51, 51);
	end);
	TABLE_TableIndirection["tpTab%0"] = frames['TP'];
	y = 10;
	sp = 25;
	TABLE_TableIndirection["tpGun%0"] = btn(TABLE_TableIndirection["tpTab%0"], "TP to Gun", UDim2.new(0, 10, 0, y));
	TABLE_TableIndirection["tpGun%0"].MouseButton1Click:Connect(function()
		if ((TABLE_TableIndirection["LocalPlayer%0"].Character and TABLE_TableIndirection["LocalPlayer%0"].Character:FindFirstChild("HumanoidRootPart")) or (2652 < 196)) then
			TABLE_TableIndirection["hrp%0"] = TABLE_TableIndirection["LocalPlayer%0"].Character.HumanoidRootPart;
			TABLE_TableIndirection["savedGunPosition%0"] = TABLE_TableIndirection["savedGunPosition%0"] or TABLE_TableIndirection["hrp%0"].CFrame;
			TABLE_TableIndirection["gd%0"] = workspace:FindFirstChild("GunDrop", true);
			if (TABLE_TableIndirection["gd%0"] and TABLE_TableIndirection["gd%0"]:IsA("BasePart")) then
				pcall(function()
					TABLE_TableIndirection["hrp%0"].CFrame = TABLE_TableIndirection["gd%0"].CFrame;
				end);
				TABLE_TableIndirection["tpGun%0"].Text = "Gun Detected";
				TABLE_TableIndirection["tpGun%0"].TextColor3 = TABLE_TableIndirection["ss%0"].GColorT;
			else
				TABLE_TableIndirection["tpGun%0"].Text = "Gun Not Found";
				TABLE_TableIndirection["tpGun%0"].Text