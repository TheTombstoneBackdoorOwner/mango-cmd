local LMG2L = {};

LMG2L["ScreenGui_1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
LMG2L["ScreenGui_1"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling

LMG2L["cmd_2"] = Instance.new("TextBox", LMG2L["ScreenGui_1"])
LMG2L["cmd_2"].Visible = false
LMG2L["cmd_2"].Name = "cmd"
LMG2L["cmd_2"].TextXAlignment = Enum.TextXAlignment.Left
LMG2L["cmd_2"].BorderSizePixel = 0
LMG2L["cmd_2"].TextColor3 = Color3.fromRGB(31, 131, 5)
LMG2L["cmd_2"].BackgroundColor3 = Color3.fromRGB(59, 59, 59)
LMG2L["cmd_2"].Size = UDim2.new(0.725, 0, 0.02965, 0)
LMG2L["cmd_2"].Position = UDim2.new(0.12969, 0, 0.4124, 0)
LMG2L["cmd_2"].Text = ""

LMG2L["Opening_3"] = Instance.new("LocalScript", LMG2L["cmd_2"])
LMG2L["Opening_3"].Name = "Opening"

LMG2L["Cmds_4"] = Instance.new("LocalScript", LMG2L["cmd_2"])
LMG2L["Cmds_4"].Name = "Cmds"

LMG2L["UIAspectRatioConstraint_5"] = Instance.new("UIAspectRatioConstraint", LMG2L["cmd_2"])
LMG2L["UIAspectRatioConstraint_5"].AspectRatio = 42.18182

LMG2L["TextButton_6"] = Instance.new("TextButton", LMG2L["ScreenGui_1"])
LMG2L["TextButton_6"].BorderSizePixel = 0
LMG2L["TextButton_6"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LMG2L["TextButton_6"].Size = UDim2.new(0.03906, 0, 0.06469, 0)
LMG2L["TextButton_6"].Text = "Open"
LMG2L["TextButton_6"].Position = UDim2.new(0.46719, 0, -0.03774, 0)

LMG2L["UICorner_7"] = Instance.new("UICorner", LMG2L["TextButton_6"])

LMG2L["mobileopening_8"] = Instance.new("LocalScript", LMG2L["TextButton_6"])
LMG2L["mobileopening_8"].Name = "mobileopening"

LMG2L["UIAspectRatioConstraint_9"] = Instance.new("UIAspectRatioConstraint", LMG2L["TextButton_6"])
LMG2L["UIAspectRatioConstraint_9"].AspectRatio = 1.04167

local function C_3()
	local script = LMG2L["Opening_3"]
	local UIS = game:GetService("UserInputService")
	
	UIS.InputBegan:Connect(function(input, g)	
	    if not g and input.KeyCode == Enum.KeyCode.Semicolon then
	        script.Parent.Visible = true
	    end
	end)
end
task.spawn(C_3)

local function C_4()
	local script = LMG2L["Cmds_4"]
	local player = game.Players.LocalPlayer
local tb = player.PlayerGui:WaitForChild("ScreenGui_1"):WaitForChild("cmd_2")
local cmds = loadstring(game:HttpGet("https://raw.githubusercontent.com/TheTombstoneBackdoorOwner/mango-cmd/refs/heads/main/cmdlist.lua"))()

local function run()
    local txt = tb.Text
    if txt == "" then return end
    local parts = string.split(txt, " ")
    local name, args = parts[1]:lower(), {select(2, table.unpack(parts))}
    for _, cmd in pairs(cmds) do
        if cmd.Name:lower() == name then
            for i,v in pairs(args) do
                if v == "playername" then
                    args[i] = parts[2]
                end
            end
            pcall(function() cmd.CallBack(player, args) end)
            break
        end
    end
    tb.Text = ""
end

tb.FocusLost:Connect(function(enter)
    if enter then run() end
end)
end
task.spawn(C_4)

local function C_8()
	local script = LMG2L["mobileopening_8"]
	local b = script.Parent	
	
	b.MouseButton1Click:Connect(function()	
	    script.Parent.Parent.cmd.Visible = true
	end)	
end
task.spawn(C_8)

return LMG2L["ScreenGui_1"], require
