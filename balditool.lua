local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
local slapspeed = 1
local slaprepeat = 10
local movedir = Vector3.zero
local ogws = 0
local function slap()
    if plr.Character == nil then
        return
    end
    ogws =
        plr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed == 0 and ogws or
        plr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed
    plr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 0
    local sound = Instance.new("Sound", plr.PlayerGui)
    sound.SoundId = "rbxassetid://1841427728"
    sound:Play()
    game.Debris:AddItem(sound, 3)
    for i = 1, slaprepeat do
        plr.Character:TranslateBy(movedir * slapspeed)
        task.wait()
    end
    plr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = ogws
end
mouse.KeyDown:Connect(
    function(key)
        pcall(
            function()
                if key:lower() == "g" then
                    if plr.Backpack:FindFirstChild("Ruler") ~= nil or plr.Character:FindFirstChild("Ruler") then
                        return
                    end
                    local tool = Instance.new("Tool")
                    tool.RequiresHandle = false
                    tool.CanBeDropped = false
                    tool.Name = "Ruler"
                    tool.Activated:Connect(
                        function()
                            pcall(
                                function()
                                    slap()
                                end
                            )
                        end
                    )
                    tool.ToolTip = "Activate to slap ruler/move like Baldi"
                    tool.Parent = plr.Backpack
                end
            end
        )
    end
)
plr.Chatted:Connect(
    function(m)
        if m:split(" ")[1] == "/e" and m:split(" ")[2] == "slapspeed" and tonumber(m:split(" ")[3]) ~= nil then
            slapspeed = tonumber(m:split(" ")[3])
        end
        if m:split(" ")[1] == "/e" and m:split(" ")[2] == "slaprepeat" and tonumber(m:split(" ")[3]) ~= nil then
            slaprepeat = tonumber(m:split(" ")[3])
        end
    end
)
game["Run Service"].Heartbeat:Connect(
    function()
        pcall(
            function()
                if plr.Character == nil then
                    return
                end
                local pos =
                    Vector3.new(
                    plr.Character.PrimaryPart.Position.X + plr.Character.PrimaryPart.CFrame.LookVector.X,
                    plr.Character.PrimaryPart.Position.Y,
                    plr.Character.PrimaryPart.Position.Z + plr.Character.PrimaryPart.CFrame.LookVector.Z
                )
                movedir = CFrame.new(plr.Character.PrimaryPart.Position, pos).LookVector
            end
        )
    end
)

--[[
local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
local slapspeed = 1
local slaprepeat = 10
local movedir = Vector3.zero
local function slap()
	if plr.Character == nil then return end
	local ogws = plr.Character:FindFirstChildOfClass('Humanoid').WalkSpeed
	plr.Character:FindFirstChildOfClass('Humanoid').WalkSpeed = 0
	local sound = Instance.new('Sound',plr.PlayerGui)
	sound.SoundId = 'rbxassetid://1841427728'
	sound:Play()
	game.Debris:AddItem(sound,3)
	for i=1,slaprepeat do
		plr.Character:TranslateBy(movedir*slapspeed)
		task.wait()
	end
	plr.Character:FindFirstChildOfClass('Humanoid').WalkSpeed = ogws
end
mouse.KeyDown:Connect(function(key)
	if key:lower() == 'g' then
		if plr.Backpack:FindFirstChild('Ruler') ~= nil then return end
		local tool = Instance.new('Tool')
		tool.RequiresHandle = false
		tool.CanBeDropped = false
		tool.Name = 'Ruler'
		tool.Activated:Connect(function()
			pcall(function()slap()end)
		end)
		tool.ToolTip = 'Activate to slap ruler/move like Baldi'
		tool.Parent = plr.Backpack
	end
end)
plr.Chatted:Connect(function(m)
	if m:split(' ')[1] == '/e' and m:split(' ')[2] == 'slapspeed' and tonumber(m:split(' ')[3]) ~= nil then
		slapspeed = tonumber(m:split(' ')[3])
	end
	if m:split(' ')[1] == '/e' and m:split(' ')[2] == 'slaprepeat' and tonumber(m:split(' ')[3]) ~= nil then
		slaprepeat = tonumber(m:split(' ')[3])
	end
end)
game["Run Service"].Heartbeat:Connect(function()
	pcall(function()
		if plr.Character == nil then return end
		local pos = Vector3.new(
			plr.Character.PrimaryPart.Position.X + plr.Character.PrimaryPart.CFrame.LookVector.X,
			plr.Character.PrimaryPart.Position.Y,
			plr.Character.PrimaryPart.Position.Z + plr.Character.PrimaryPart.CFrame.LookVector.Z
		)
		movedir = CFrame.new(plr.Character.PrimaryPart.Position,pos).LookVector
	end)
end)
]]
