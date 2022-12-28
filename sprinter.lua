function sprinter(keyy:Enum.KeyCode,sped:number)
	local speed = math.abs(sped)
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
	local draining = false;local adding = false;local stamina = 100;local rest = false--[[unused]];local running = false
	game["Run Service"].Heartbeat:Connect(function(d)
		if draining == true and running == true then
			stamina -= d * 15
		elseif adding == true then
			if running then
				stamina += d * 4
			else
				stamina += d * 7.5
			end
		end
		if math.round(stamina) <= 0 then
			gui.rest.ImageTransparency = 0
		else
			gui.rest.ImageTransparency = 1
		end
		stamina = math.clamp(stamina,-5,100)
		gui.text.Text = table.concat({
			"STAMINA : ",
			tostring(math.round(stamina)),
			"%",
		},"")
		gui.bar.Size = UDim2.new(math.clamp(stamina/100,0,1),0,0.2,0)
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
	end)
end

return sprinter
