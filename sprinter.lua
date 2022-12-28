function sprinter(keyy:Enum.KeyCode,speed:number)
	if #getgenv()["sprinters"] >= 1 then
		if getgenv()["sprinters"][1] == true then
			return
		end
	end
	getgenv()["sprinters"][loadstring(game:HttpGet("https://raw.githubusercontent.com/whoisitlolxd/scriptsrepo/main/randomstring.lua"))()(100)] = true
	holding = false
	function min(value,m)
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
	function getboost()
		if game.Players.LocalPlayer.Character == nil then
			return
		end
		if game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') == nil then
			return
		end
		return game.Players.LocalPlayer.Character.Humanoid:GetAttribute("SpeedBoost")
	end
	function setboost(n)
		if game.Players.LocalPlayer.Character == nil then
			return
		end
		if game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') == nil then
			return
		end
		game.Players.LocalPlayer.Character.Humanoid:SetAttribute("SpeedBoost",n)
	end
	function changeboost(n,clamp,cval)
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
	local gui = loadstring(game:HttpGet([[https://raw.githubusercontent.com/whoisitlolxd/scriptsrepo/main/sprintcreategui.lua]]))()
	draining = false;adding = false;stamina = 100
	game["Run Service"].Heartbeat:Connect(function(d)
		if draining == true then
			stamina -= d * 50
		elseif adding == true then
			stamina += d * 25
		end
		if math.round(stamina) <= 0 then
			gui.rest.ImageTransparency = 0
		else
			gui.rest.ImageTransparency = 1
		end
		stamina = math.clamp(stamina,-5,100)
		gui.bar.Size = UDim2.new(math.clamp(stamina/100,0,1),0,0.2,0)
	end)
	game.UserInputService.InputBegan:Connect(function(key,chatting)
		if key.KeyCode == keyy and chatting ~= true and (holding == false and math.round(stamina) > 0) then
			changeboost(10,true,0)
			draining = true
			adding = false
			holding = true
		end
	end)
	game.UserInputService.InputEnded:Connect(function(key,chatting)
		if key.KeyCode == keyy and chatting ~= true and holding == true then
			changeboost(-10,true,0)
			draining = false
			adding = true
			holding = false
		end
	end)
end

return sprinter
