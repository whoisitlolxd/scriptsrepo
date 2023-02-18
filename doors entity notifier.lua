if getgenv == nil then
	error('getgenv is nil; get a better executor',0)
end

--[[local ws = game:GetService('Workspace')

ws.Ambience:ClearAllChildren() -- no annoying ambience

-- no annoying ambience^2
ws.Terrain.DescendantAdded:Connect(function(v)
    if v:IsA'Sound' then
        if v.Parent:IsA'Attachment' then
            v.Parent:Remove()
        end
    end
end)

local run = game['Run Service']

function notif(title,text,dur)
    game.StarterGui:SetCore('SendNotification',{
        Title = title;
        Text = text;
        Duration = tonumber(dur) or 3;
        }
    )
end

getgenv().notif = notif

-- these are necessary
getgenv().functions = {}
getgenv().functions.hb = {}
getgenv().functions.hb.nowindows = function()
    for i,v in pairs(ws.CurrentRooms:GetChildren()) do
        for b,n in pairs(v.Assets:GetDescendants()) do if n:IsA'Sound' then n.PlaybackSpeed = 0 end end -- windows make noise. get rekt
    end
end

-- screech alert
getgenv().functions.screech = function(v)
    if v.Name == 'Screech' then
        notif('Entity Warning!','Screech has spawned, look around!',3)
    end
end

-- screech alert^2
ws.Camera.ChildAdded:Connect(getgenv().functions.screech)

run.Heartbeat:Connect(function()
    for i,func in pairs(getgenv().functions.hb) do
        func()
    end
end)

-- monster detector
ws.ChildAdded:Connect(function(v)
    if (v.Name ~= 'RushMoving' or v.Name ~= 'AmbushMoving' or v.Name ~= 'SeekMoving') and not v:IsA('Model') then
        return
    end
    local loop = nil
    loop = game['Run Service'].Stepped:Connect(function()
        if (v:FindFirstChildOfClass('BasePart') or v.PrimaryPart) ~= nil then
            local homepart = v:FindFirstChildOfClass('BasePart') or v.PrimaryPart
            local mag = game.Players.LocalPlayer:DistanceFromCharacter(homepart.Position)
            if mag < 10000 then
                getgenv().notif('Entity Warning!','\"'..v.Name..'\" has spawned!',3)
                loop:Disconnect()
                loop = nil
            end
        end
        if v == nil then
            loop:Disconnect()
            loop = nil
        end
    end)
end)

notif('Placeholder title','Script is running. Ignore this.',3)]]

-- updated

local ws = game:GetService('Workspace')

function bbgui(v)
    local gui = Instance.new('BillboardGui')
	local corner = Instance.new('UICorner')
	corner.CornerRadius = UDim.new(1,0)
	local frame = Instance.new('Frame')
    frame.BorderSizePixel = 0
    corner.Parent = frame
	frame.Size = UDim2.fromScale(1,1)
	frame.BackgroundColor3 = Color3.new(1,0,0)
	frame.Parent = gui
    --[[local imglabel = Instance.new('ImageLabel')
    imglabel.Size = UDim2.fromScale(1,1)]]
    gui.Size = UDim2.fromScale(5,5)
    frame.BackgroundTransparency = 0.5
    --[[imglabel.BackgroundTransparency = 1
    imglabel.Image = 'rbxassetid://7949112710'
    imglabel.Parent = gui]]
    gui.LightInfluence = 0
    gui.AlwaysOnTop = true
	gui.Parent = v
    --gui.Adornee = v
end

getgenv().bbgui = bbgui

ws.Ambience:ClearAllChildren()

ws.Terrain.DescendantAdded:Connect(function(v)
    if v:IsA'Sound' then
	    v.Volume = 0; v.PlaybackSpeed = 0
    end
end)

ws.Ambience.DescendantAdded:Connect(function(v)
    if v:IsA'Sound' then
	    v.Volume = 0; v.PlaybackSpeed = 0
    end
end)

local run = game['Run Service']

function notif(title,text,dur,icon)
    game.StarterGui:SetCore('SendNotification',{
	Icon = icon == true and 'rbxassetid://7949112710' or nil;
        Title = title;
        Text = text;
        Duration = tonumber(dur) or 3;
        }
    )
end

getgenv().notif = notif

-- these are necessary
getgenv().functions = {}
getgenv().functions.hb = {}
getgenv().functions.hb.nowindows = function()
	pcall(function()
		for i,v in pairs(ws.CurrentRooms:GetChildren()) do
			for b,n in pairs(v.Assets:GetDescendants()) do if n:IsA('Sound') then n.PlaybackSpeed = 0; n.Volume = 0; n:Stop(); end end -- windows make noise. get rekt
		end
	end)
end

-- anti lag?
getgenv().functions.hb.camremovepieces = function()
	for i,part in next,workspace.CurrentCamera:GetChildren() do
		if part.Name == 'Piece' then v:Destroy() end
	end
end

-- screech alert
getgenv().functions.screech = function(v)
    if v.Name == 'Screech' then
        notif('Entity Warning!','Screech has spawned, look around!',3,true)
        getgenv().bbgui(v:FindFirstChildWhichIsA('Part',true) or v:FindFirstChildWhichIsA('BasePart',true) or v:FindFirstChildWhichIsA('MeshPart',true))
    end
end

-- screech alert
ws.Camera.ChildAdded:Connect(getgenv().functions.screech)

run.Heartbeat:Connect(function()
    for i,func in pairs(getgenv().functions.hb) do
        pcall(function()func()end)
    end
end)

-- monster detector
ws.ChildAdded:Connect(function(v)
    if not ((v.Name == 'RushMoving' or v.Name == 'AmbushMoving' or v.Name == 'SeekMoving') and v:IsA('Model')) then
        return
    end
    local loop = nil
    loop = game['Run Service'].Stepped:Connect(function()
        if (v:FindFirstChildOfClass('BasePart') or v.PrimaryPart) ~= nil then
            local homepart = v:FindFirstChildOfClass('BasePart') or v.PrimaryPart
            local mag = game.Players.LocalPlayer:DistanceFromCharacter(homepart.Position)
            if mag < 10000 then
                getgenv().bbgui(homepart)
                getgenv().notif('Entity Warning!','\"'..v.Name..'\" has spawned!',3,true)
                loop:Disconnect()
                loop = nil
            end
        end
        if v == nil then
            loop:Disconnect()
            loop = nil
        end
    end)
end)

getgenv().notif('small note','the screwed bambi image is a placeholder incase you didnt know',3,true)
