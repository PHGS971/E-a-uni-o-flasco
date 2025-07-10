local Players = game:GetService("Players")
local player = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local Camera = workspace.CurrentCamera

-- Key System GUI
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "HOKALAZA_KeySystem"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 360, 0, 230)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
frame.BorderSizePixel = 0
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel", frame)
title.Text = "🔐 Digite ou cole a key aqui!"
title.Size = UDim2.new(1, -20, 0, 40)
title.Position = UDim2.new(0, 10, 0, 14)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(0, 255, 200)
title.Font = Enum.Font.GothamBlack
title.TextSize = 20

local input = Instance.new("TextBox", frame)
input.PlaceholderText = "digite a chave aqui"
input.Size = UDim2.new(1, -40, 0, 36)
input.Position = UDim2.new(0, 20, 0, 68)
input.BackgroundColor3 = Color3.fromRGB(40, 45, 60)
input.TextColor3 = Color3.fromRGB(255, 255, 255)
input.Font = Enum.Font.Gotham
input.TextSize = 18
input.ClearTextOnFocus = false
Instance.new("UICorner", input).CornerRadius = UDim.new(0, 8)

local submit = Instance.new("TextButton", frame)
submit.Text = "Verificar"
submit.Size = UDim2.new(1, -40, 0, 36)
submit.Position = UDim2.new(0, 20, 0, 122)
submit.BackgroundColor3 = Color3.fromRGB(0, 255, 200)
submit.TextColor3 = Color3.fromRGB(18, 22, 28)
submit.Font = Enum.Font.GothamBold
submit.TextSize = 20
Instance.new("UICorner", submit).CornerRadius = UDim.new(0, 8)

local getKey = Instance.new("TextButton", frame)
getKey.Text = "pegue a chave"
getKey.Size = UDim2.new(1, -40, 0, 32)
getKey.Position = UDim2.new(0, 20, 0, 172)
getKey.BackgroundColor3 = Color3.fromRGB(0, 175, 255)
getKey.TextColor3 = Color3.fromRGB(0, 0, 0)
getKey.Font = Enum.Font.GothamBold
getKey.TextSize = 18
Instance.new("UICorner", getKey).CornerRadius = UDim.new(0, 8)

-- Key Copy
local function CopyDiscord()
    if setclipboard then
        setclipboard("PHGSUNIVERSALKEY")
    elseif toclipboard then
        toclipboard("PHGSUNIVERSALKEY")
    elseif syn and syn.clipboard then
        syn.clipboard.set("PHGSUNIVERSALKEY")
    end
    getKey.Text = "Chave Copiada para sua área de transferência!"
    task.wait(1.4)
    getKey.Text = "Pegar a chave"
end
getKey.MouseButton1Click:Connect(CopyDiscord)

-- Continue na Parte 2

submit.MouseButton1Click:Connect(function()
    if input.Text == "PHGSUNIVERSALKEY" then
        gui:Destroy()

        if game.CoreGui:FindFirstChild("hokalaza") then
            game.CoreGui.hokalaza:Destroy()
        end

        local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
        ScreenGui.Name = "PHGS Secret Hub"
        ScreenGui.ResetOnSpawn = false

        local MainFrame = Instance.new("Frame", ScreenGui)
        MainFrame.Size = UDim2.new(0, 330, 0, 470)
        MainFrame.Position = UDim2.new(0, 10, 0.5, -235)
        MainFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 33)
        MainFrame.BorderSizePixel = 0
        MainFrame.Active = true
        MainFrame.Draggable = true

        -- Botão de fechar
        local closeBtn = Instance.new("TextButton", MainFrame)
        closeBtn.Size = UDim2.new(0, 28, 0, 28)
        closeBtn.Position = UDim2.new(1, -30, 0, 2)
        closeBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
        closeBtn.Text = "X"
        closeBtn.TextColor3 = Color3.new(1,1,1)
        closeBtn.Font = Enum.Font.GothamBold
        closeBtn.TextSize = 14
        closeBtn.MouseButton1Click:Connect(function()
            ScreenGui:Destroy()
        end)
        Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 8)

        local TabFrame = Instance.new("Frame", MainFrame)
        TabFrame.Size = UDim2.new(0, 62, 1, 0)
        TabFrame.Position = UDim2.new(0, 0, 0, 0)
        TabFrame.BackgroundColor3 = Color3.fromRGB(38, 38, 50)
        TabFrame.BorderSizePixel = 0

        local ContentFrame = Instance.new("Frame", MainFrame)
        ContentFrame.Size = UDim2.new(1, -62, 1, 0)
        ContentFrame.Position = UDim2.new(0, 62, 0, 0)
        ContentFrame.BackgroundColor3 = Color3.fromRGB(33, 33, 40)
        ContentFrame.BorderSizePixel = 0

        -- Tabs
        local function makeTabButton(text, order)
            local btn = Instance.new("TextButton", TabFrame)
            btn.Size = UDim2.new(1, 0, 0, 40)
            btn.Position = UDim2.new(0, 0, 0, 20 + 50 * order)
            btn.BackgroundColor3 = Color3.fromRGB(47, 47, 59)
            btn.TextColor3 = Color3.new(1,1,1)
            btn.Font = Enum.Font.GothamBold
            btn.TextSize = 16
            btn.Text = text
            btn.AutoButtonColor = true
            return btn
        end

        local Pages = {}
        for i, name in ipairs({"Main", "Visuals", "Credit"}) do
            local page = Instance.new("Frame", ContentFrame)
            page.Name = name.."Page"
            page.Size = UDim2.new(1,0,1,0)
            page.Position = UDim2.new(0,0,0,0)
            page.BackgroundTransparency = 1
            page.Visible = i == 1
            Pages[name] = page
        end

        local function showPage(name)
            for n, page in pairs(Pages) do
                page.Visible = (n == name)
            end
        end

        local mainTab = makeTabButton("Main", 0)
        local visualTab = makeTabButton("Visuals", 1)
        local creditTab = makeTabButton("Credit", 2)

        mainTab.MouseButton1Click:Connect(function() showPage("Main") end)
        visualTab.MouseButton1Click:Connect(function() showPage("Visuals") end)
        creditTab.MouseButton1Click:Connect(function() showPage("Credit") end)

        -- Atualizador automático de humanoid
        local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        player.CharacterAdded:Connect(function(char)
            humanoid = char:WaitForChild("Humanoid", 3)
        end)

        -- Continue na Parte 3
        
        -- Funções principais
        local function makeToggleBtn(parent, label, posY, default, callback, optSize)
            local toggle = Instance.new("TextButton", parent)
            toggle.Size = optSize or UDim2.new(0, 200, 0, 60)
            toggle.Position = UDim2.new(0.5, -toggle.Size.X.Offset/2, 0, posY)
            toggle.BackgroundColor3 = Color3.fromRGB(70, 80, 120)
            toggle.TextColor3 = Color3.new(1,1,1)
            toggle.Font = Enum.Font.GothamBlack
            toggle.TextSize = optSize and 16 or 30
            toggle.Text = label .. ": " .. (default and "ON" or "OFF")
            toggle.BorderSizePixel = 0
            local state = default
            toggle.MouseButton1Click:Connect(function()
                state = not state
                toggle.Text = label .. ": " .. (state and "ON" or "OFF")
                callback(state)
                toggle.BackgroundColor3 = state and Color3.fromRGB(100,180,80) or Color3.fromRGB(70, 80, 120)
            end)
            return toggle
        end

        local aimbotEnabled = false
        local speedEnabled = false
        local jumpEnabled = false
        local noclipEnabled = false
        local infJumpEnabled = false
        local bhopEnabled = false

        local speedValue = 70
        local jumpValue = 100

        -- Aimbot botão grande
        local aimbotBtn = makeToggleBtn(Pages.Main, "AIMBOT (HEAD)", 18, false, function(v)
            aimbotEnabled = v
        end, UDim2.new(0, 240, 0, 65))
        aimbotBtn.Position = UDim2.new(0.5, -120, 0, 18)
        aimbotBtn.TextSize = 30

        -- Outras funções
        makeToggleBtn(Pages.Main, "Speed Boost", 100, false, function(v)
            speedEnabled = v
            if humanoid then humanoid.WalkSpeed = v and speedValue or 16 end
        end, UDim2.new(0, 170, 0, 36))

        makeToggleBtn(Pages.Main, "Jump Boost", 150, false, function(v)
            jumpEnabled = v
            if humanoid then humanoid.JumpPower = v and jumpValue or 50 end
        end, UDim2.new(0, 170, 0, 36))

        makeToggleBtn(Pages.Main, "Noclip", 200, false, function(v) noclipEnabled = v end, UDim2.new(0, 170, 0, 36))
        makeToggleBtn(Pages.Main, "Infinite Jump", 250, false, function(v) infJumpEnabled = v end, UDim2.new(0, 170, 0, 36))
        makeToggleBtn(Pages.Main, "Bunny Hop", 300, false, function(v) bhopEnabled = v end, UDim2.new(0, 170, 0, 36))

        -- Aimbot função
        local function getNearestTarget()
            local nearest, dist, partObj
            for _,plr in pairs(Players:GetPlayers()) do
                if plr ~= player and plr.Character and plr.Character:FindFirstChild("Head") then
                    local part = plr.Character.Head
                    local d = (Camera.CFrame.Position - part.Position).Magnitude
                    if not dist or d < dist then
                        dist = d
                        nearest = plr
                        partObj = part
                    end
                end
            end
            return partObj
        end

        -- Loop principal
        RunService.RenderStepped:Connect(function()
            local c = player.Character
            humanoid = c and c:FindFirstChildOfClass("Humanoid")

            -- Speed
            if speedEnabled and humanoid then
                humanoid.WalkSpeed = speedValue
            elseif not speedEnabled and humanoid and humanoid.WalkSpeed ~= 16 then
                humanoid.WalkSpeed = 16
            end

            -- Jump
            if jumpEnabled and humanoid then
                humanoid.JumpPower = jumpValue
            elseif not jumpEnabled and humanoid and humanoid.JumpPower ~= 50 then
                humanoid.JumpPower = 50
            end

            -- Aimbot
            if aimbotEnabled then
                local part = getNearestTarget()
                if part then Camera.CFrame = CFrame.new(Camera.CFrame.Position, part.Position) end
            end

            -- Noclip
            if noclipEnabled and c then
                for _,v in pairs(c:GetDescendants()) do
                    if v:IsA("BasePart") and v.CanCollide then v.CanCollide = false end
                end
            end

            -- Bunny Hop
            if bhopEnabled and humanoid then
                if humanoid.FloorMaterial ~= Enum.Material.Air then
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end
        end)

        -- Infinite Jump
        UIS.JumpRequest:Connect(function()
            if infJumpEnabled then
                local c = player.Character
                if c and c:FindFirstChildOfClass("Humanoid") then
                    c:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end
        end)
        
        -- VISUALS TAB
        local TeleportService = game:GetService("TeleportService")
        local HttpService = game:GetService("HttpService")

        -- Fly Button
        local flyBtn = Instance.new("TextButton", Pages.Visuals)
        flyBtn.Size = UDim2.new(0, 170, 0, 36)
        flyBtn.Position = UDim2.new(0, 30, 0, 20)
        flyBtn.BackgroundColor3 = Color3.fromRGB(50,50,60)
        flyBtn.TextColor3 = Color3.new(1,1,1)
        flyBtn.Font = Enum.Font.GothamSemibold
        flyBtn.TextSize = 15
        flyBtn.Text = "Enable Fly"
        flyBtn.MouseButton1Click:Connect(function()
            pcall(function()
                loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-fly-v3-44404"))()
            end)
        end)

        -- Rejoin
        local rejoinBtn = Instance.new("TextButton", Pages.Visuals)
        rejoinBtn.Size = UDim2.new(0, 80, 0, 28)
        rejoinBtn.Position = UDim2.new(0, 30, 0, 65)
        rejoinBtn.BackgroundColor3 = Color3.fromRGB(66, 120, 66)
        rejoinBtn.TextColor3 = Color3.new(1,1,1)
        rejoinBtn.Font = Enum.Font.Gotham
        rejoinBtn.TextSize = 14
        rejoinBtn.Text = "Rejoin"
        rejoinBtn.MouseButton1Click:Connect(function()
            TeleportService:Teleport(game.PlaceId, player)
        end)

        -- Server Hop
        local serverhopBtn = Instance.new("TextButton", Pages.Visuals)
        serverhopBtn.Size = UDim2.new(0, 80, 0, 28)
        serverhopBtn.Position = UDim2.new(0, 120, 0, 65)
        serverhopBtn.BackgroundColor3 = Color3.fromRGB(120, 66, 66)
        serverhopBtn.TextColor3 = Color3.new(1,1,1)
        serverhopBtn.Font = Enum.Font.Gotham
        serverhopBtn.TextSize = 14
        serverhopBtn.Text = "Server Hop"
        serverhopBtn.MouseButton1Click:Connect(function()
            local servers = {}
            local function getServers(cursor)
                local url = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"
                if cursor then url = url.."&cursor="..cursor end
                local data = game:HttpGet(url)
                local success, decoded = pcall(function()
                    return HttpService:JSONDecode(data)
                end)
                if success and decoded then
                    for _, s in pairs(decoded.data) do
                        if s.playing < s.maxPlayers and s.id ~= game.JobId then
                            table.insert(servers, s.id)
                        end
                    end
                    if decoded.nextPageCursor then
                        getServers(decoded.nextPageCursor)
                    end
                end
            end
            pcall(getServers)
            if #servers > 0 then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], player)
            else
                TeleportService:Teleport(game.PlaceId, player)
            end
        end)

        -- ESP Variables
        local masterEsp = false
        local espOptions = {
            Player = false,
            User = false,
            Health = false,
            Box = false,
            Tracers = false,
            Name = false
        }

        local function makeVisualToggle(txt, y, key)
            local btn = Instance.new("TextButton", Pages.Visuals)
            btn.Size = UDim2.new(0, 140, 0, 28)
            btn.Position = UDim2.new(0, 40, 0, y)
            btn.BackgroundColor3 = Color3.fromRGB(45,55,65)
            btn.TextColor3 = Color3.new(1,1,1)
            btn.Font = Enum.Font.Gotham
            btn.TextSize = 14
            btn.Text = txt..": OFF"
            local state = false
            btn.MouseButton1Click:Connect(function()
                state = not state
                espOptions[key] = state
                btn.Text = txt..": "..(state and "ON" or "OFF")
            end)
        end

        makeVisualToggle("ESP (master)", 110, "Master")
        makeVisualToggle("Player ESP", 150, "Player")
        makeVisualToggle("User ESP", 190, "User")
        makeVisualToggle("Health ESP", 230, "Health")
        makeVisualToggle("Box ESP", 270, "Box")
        makeVisualToggle("Tracers", 310, "Tracers")
        makeVisualToggle("Name ESP", 350, "Name")

        -- ESP Drawing
        local tracerDrawings = {}
        local espFolder = Instance.new("Folder", workspace)
        espFolder.Name = "PHGS_ESP"

        local function clearESP()
            for _,v in pairs(espFolder:GetChildren()) do v:Destroy() end
            for _,drawing in pairs(tracerDrawings) do
                if drawing then
                    drawing:Remove()
                end
            end
            tracerDrawings = {}
        end

        RunService.RenderStepped:Connect(function()
            clearESP()
            if not espOptions["Master"] then return end
            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= player and plr.Character and plr.Character:FindFirstChild("Head") then
                    local head = plr.Character.Head
                    local hum = plr.Character:FindFirstChildOfClass("Humanoid")
                    -- Player Name
                    if espOptions.Player then
                        local bb = Instance.new("BillboardGui", espFolder)
                        bb.Adornee = head
                        bb.Size = UDim2.new(0, 100, 0, 40)
                        bb.StudsOffset = Vector3.new(0,2,0)
                        bb.AlwaysOnTop = true
                        local label = Instance.new("TextLabel", bb)
                        label.Size = UDim2.new(1,0,1,0)
                        label.Text = plr.Name
                        label.BackgroundTransparency = 1
                        label.TextColor3 = Color3.new(1,1,0)
                        label.TextScaled = true
                    end
                    -- Display Name
                    if espOptions.User then
                        local bb = Instance.new("BillboardGui", espFolder)
                        bb.Adornee = head
                        bb.Size = UDim2.new(0, 100, 0, 40)
                        bb.StudsOffset = Vector3.new(0,3,0)
                        bb.AlwaysOnTop = true
                        local label = Instance.new("TextLabel", bb)
                        label.Size = UDim2.new(1,0,1,0)
                        label.Text = plr.DisplayName
                        label.BackgroundTransparency = 1
                        label.TextColor3 = Color3.new(0.8,0.8,1)
                        label.TextScaled = true
                    end
                    -- Health
                    if espOptions.Health and hum then
                        local bb = Instance.new("BillboardGui", espFolder)
                        bb.Adornee = head
                        bb.Size = UDim2.new(0, 100, 0, 40)
                        bb.StudsOffset = Vector3.new(0,4,0)
                        bb.AlwaysOnTop = true
                        local label = Instance.new("TextLabel", bb)
                        label.Size = UDim2.new(1,0,1,0)
                        label.Text = "HP: "..math.floor(hum.Health)
                        label.BackgroundTransparency = 1
                        label.TextColor3 = Color3.new(0,1,0)
                        label.TextScaled = true
                    end
                    -- Box
                    if espOptions.Box then
                        local adorn = Instance.new("BoxHandleAdornment", espFolder)
                        adorn.Adornee = plr.Character:FindFirstChild("HumanoidRootPart") or head
                        adorn.Size = Vector3.new(4,7,2)
                        adorn.Color3 = Color3.new(1,1,1)
                        adorn.Transparency = 0.6
                        adorn.AlwaysOnTop = true
                        adorn.ZIndex = 10
                    end
                    -- Tracers (Drawing)
                    if espOptions.Tracers and Drawing then
                        local headPos, onscreen = Camera:WorldToViewportPoint(head.Position)
                        if onscreen then
                            local tracer = Drawing.new("Line")
                            tracer.From = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y)
                            tracer.To = Vector2.new(headPos.X, headPos.Y)
                            tracer.Color = Color3.new(1,0,0)
                            tracer.Thickness = 2
                            tracer.Transparency = 1
                            tracer.Visible = true
                            table.insert(tracerDrawings, tracer)
                        end
                    end
                    -- NameESP
                    if espOptions.Name then
                        local bb = Instance.new("BillboardGui", espFolder)
                        bb.Adornee = head
                        bb.Size = UDim2.new(0, 100, 0, 20)
                        bb.StudsOffset = Vector3.new(0,5,0)
                        bb.AlwaysOnTop = true
                        local label = Instance.new("TextLabel", bb)
                        label.Size = UDim2.new(1,0,1,0)
                        label.Text = plr.Name
                        label.BackgroundTransparency = 1
                        label.TextColor3 = Color3.new(0.6,1,1)
                        label.TextScaled = true
                    end
                end
            end
        end)

        -- ABA CREDIT
        local creditTitle = Instance.new("TextLabel", Pages.Credit)
        creditTitle.Size = UDim2.new(1, -20, 0, 40)
        creditTitle.Position = UDim2.new(0, 10, 0, 30)
        creditTitle.BackgroundTransparency = 1
        creditTitle.TextColor3 = Color3.new(1,1,1)
        creditTitle.Font = Enum.Font.GothamBold
        creditTitle.TextSize = 20
        creditTitle.Text = "PHGS Universal Hub"

        local creditOwner = Instance.new("TextLabel", Pages.Credit)
        creditOwner.Size = UDim2.new(1, -20, 0, 30)
        creditOwner.Position = UDim2.new(0, 10, 0, 70)
        creditOwner.BackgroundTransparency = 1
        creditOwner.TextColor3 = Color3.new(0.8,1,1)
        creditOwner.Font = Enum.Font.Gotham
        creditOwner.TextSize = 15
        creditOwner.Text = "Feito por: PHGS / CRAZY"

        local creditFeatures = Instance.new("TextLabel", Pages.Credit)
        creditFeatures.Size = UDim2.new(1, -20, 0, 220)
        creditFeatures.Position = UDim2.new(0, 10, 0, 110)
        creditFeatures.BackgroundTransparency = 1
        creditFeatures.TextColor3 = Color3.new(1,1,1)
        creditFeatures.Font = Enum.Font.Gotham
        creditFeatures.TextSize = 14
        creditFeatures.TextWrapped = true
        creditFeatures.Text = [[
✨ Funcionalidades:
- Aimbot com mira na cabeça
- Boost de velocidade e pulo
- Noclip, Infinite Jump e Bhop
- Fly universal v3
- ESP completo: Nome, Vida, Caixas, Tracers
- Rejoin, Server Hop
- GUI com abas: Main / Visuals / Créditos
        ]]