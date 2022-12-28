--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88 
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER

SHHHH DONT TELL ANYONE I USED THE CONVERTER!!! - whoisitlol
]=]

-- Instances: 7 | Scripts: 0 | Modules: 0
local G2L = {};

-- StarterGui.SprintGui
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["ResetOnSpawn"] = false;
G2L["1"]["Name"] = [[SprintGui]];
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

-- StarterGui.SprintGui.Frame
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2"]["AnchorPoint"] = Vector2.new(0, 1);
G2L["2"]["BackgroundTransparency"] = 1;
G2L["2"]["Size"] = UDim2.new(0.3499999940395355, 0, 0.3499999940395355, 0);
G2L["2"]["Position"] = UDim2.new(0.009999999776482582, 0, 1, 0);

-- StarterGui.SprintGui.Frame.rest
G2L["3"] = Instance.new("ImageLabel", G2L["2"]);
G2L["3"]["ScaleType"] = Enum.ScaleType.Fit;
G2L["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3"]["ImageColor3"] = Color3.fromRGB(255, 0, 0);
G2L["3"]["ImageTransparency"] = 1;
G2L["3"]["Image"] = [[http://www.roblox.com/asset/?id=11947774147]];
G2L["3"]["Size"] = UDim2.new(1, 0, 0.20000000298023224, 0);
G2L["3"]["Name"] = [[rest]];
G2L["3"]["BackgroundTransparency"] = 1;

-- StarterGui.SprintGui.Frame.staminabar
G2L["4"] = Instance.new("Frame", G2L["2"]);
G2L["4"]["BorderSizePixel"] = 0;
G2L["4"]["BackgroundColor3"] = Color3.fromRGB(255, 250, 202);
G2L["4"]["BorderMode"] = Enum.BorderMode.Inset;
G2L["4"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["4"]["Size"] = UDim2.new(1, 0, 0.15000000596046448, 0);
G2L["4"]["Position"] = UDim2.new(0, 0, 0.5, 0);
G2L["4"]["Name"] = [[staminabar]];

-- StarterGui.SprintGui.Frame.staminabar.UICorner
G2L["5"] = Instance.new("UICorner", G2L["4"]);
G2L["5"]["CornerRadius"] = UDim.new(0.5, 0);

-- StarterGui.SprintGui.Frame.staminabar.UIStroke
G2L["6"] = Instance.new("UIStroke", G2L["4"]);
G2L["6"]["Color"] = Color3.fromRGB(255, 255, 255);
G2L["6"]["Thickness"] = 3;
G2L["6"]["Transparency"] = 0.75;
G2L["6"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.SprintGui.Frame.stamina
G2L["7"] = Instance.new("TextLabel", G2L["2"]);
G2L["7"]["TextWrapped"] = false;
G2L["7"]["TextStrokeTransparency"] = 0.5;
G2L["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["7"]["TextStrokeColor3"] = Color3.fromRGB(51, 51, 51);
G2L["7"]["TextSize"] = 30;
G2L["7"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["7"]["AnchorPoint"] = Vector2.new(0, 1);
G2L["7"]["Size"] = UDim2.new(1, 0, 0.30000001192092896, 0);
G2L["7"]["Text"] = [[STAMINA : 100]];
G2L["7"]["Name"] = [[stamina]];
G2L["7"]["Font"] = Enum.Font.Cartoon;
G2L["7"]["BackgroundTransparency"] = 1;
G2L["7"]["Position"] = UDim2.new(0, 0, 1, 0);

local guishit = {}
guishit.ui = G2L["1"]
guishit.frame = G2L["2"]
guishit.rest = G2L["3"]
guishit.bar = G2L["4"]
guishit.text = G2L["7"]
guishit.other = {}
guishit.other.corner = G2L["5"]
guishit.other.stroke = G2L["6"]

return guishit
