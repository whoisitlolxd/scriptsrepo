function sprinter(keyy:Enum.KeyCode,sped:number,barmin:number,barmax:number,sart:number,dispaymax:number)
	local speed = math.abs(sped)
	local barminn = barmin or -5
	local barmaxx = barmax or 100
	local start = sart or barmaxx
	local displaymax = dispaymax or barmaxx
	local holding = false
	local function min(value,m)
		local newvalue
		local b
		if m == nil then b = 0 else b = m end
		if value < b then
			newvalue = b
		else
			newvalue = value
		end
		return newvalue
	end
	local function getboost()
		if game.Players.LocalPlayer.Character == nil then
			return
		end
		if game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') == nil then
			return
		end
		return game.Players.LocalPlayer.Character.Humanoid:GetAttribute("SpeedBoost")
	end
	local function setboost(n)
		if game.Players.LocalPlayer.Character == nil then
			return
		end
		if game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') == nil then
			return
		end
		game.Players.LocalPlayer.Character.Humanoid:SetAttribute("SpeedBoost",n)
	end
	local function changeboost(n,clamp,cval)
		if game.Players.LocalPlayer.Character == nil then
			return
		end
		if game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') == nil then
			return
		end
		if clamp == true then
			setboost(min(getboost()+n,cval))
		else
			setboost(getboost()+n)
		end
	end
	local gui = loadstring(game:HttpGet("https://raw.githubusercontent.com/whoisitlolxd/scriptsrepo/main/sprintcreategui.lua"))()
	gui.bar.BackgroundTransparency = 0.3
	local draining = false;local adding = false;local stamina = start;local rest = false--[[unused]];local running = false;local runspeed = 0
	game["Run Service"].Heartbeat:Connect(function(d)
		if draining == true and running == true then
			stamina -= (d * 15) * math.clamp(math.abs(runspeed),0,1)
		elseif adding == true then
			if running then
				stamina += d * 3.25
			else
				stamina += d * 7.5
			end
		end
		if math.round(stamina) <= 0 then
			setboost(-3)
			gui.rest.ImageTransparency = 0
		else
			if getboost() < 0 then
				setboost(0)
			end
			gui.rest.ImageTransparency = 1
		end
		stamina = math.clamp(stamina,barminn,barmaxx)
		if math.round(stamina*10)/10 ~= math.round(stamina) then
			gui.text.Text = table.concat({
				"STAMINA : ",
				tostring(math.round(stamina*10)/10),
				"%",
			},"")
		else
			gui.text.Text = table.concat({
				"STAMINA : ",
				tostring(math.round(stamina*10)/10),
				".0",
				"%",
			},"")
		end
		gui.bar.Size = UDim2.new(math.clamp(stamina/displaymax,0,1),0,0.2,0)
		if game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):GetState() == Enum.HumanoidStateType.Dead then
			gui.frame.Visible = false
		end
	end)
	game.UserInputService.InputBegan:Connect(function(key,chatting)
		if key.KeyCode == keyy and chatting ~= true and (holding == false and math.round(stamina) > 0) then
			changeboost(speed,true,0)
			draining = true
			adding = false
			holding = true
		end
	end)
	game.UserInputService.InputEnded:Connect(function(key,chatting)
		if key.KeyCode == keyy and chatting ~= true and holding == true then
			changeboost(-speed,true,0)
			draining = false
			adding = true
			holding = false
		end
	end)
	game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').Running:Connect(function(speedd)
		if math.abs(speedd) > 0 then
			running = true
		else
			running = false
		end
		runspeed = speedd / game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').WalkSpeed
	end)
end

return sprinter
