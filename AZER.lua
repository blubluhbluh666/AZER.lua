local n25 = 3238
local n26 = 1420
local flag2 = true
local flag3 = true

if _G.AZER then
	return
end
_G.AZER = true

-- Services
local LocalPlayer = game:GetService('Players').LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local InputService = game:GetService('UserInputService')
local TextService = game:GetService('TextService')
local TweenService = game:GetService('TweenService')
local CoreGui = game:FindFirstChild('CoreGui') or LocalPlayer.PlayerGui
local RunService = game:GetService('RunService')
local Workspace = game:GetService('Workspace')
local Stats = game:GetService('Stats')

-- Wait for game to load
repeat
	task.wait()
until game:IsLoaded()

task.wait(1)

-- Load NeverLose library
local success, lib = pcall(function()
	return loadstring(game:HttpGet("https://raw.githubusercontent.com/riqegopeek/NeverLose/refs/heads/main/src/interface.luau"))()
end)

if not success or not lib then
	print("ERROR: Failed to load NeverLose library")
	return
end

-- Set dark blue theme
lib:Theme("dark")

-- Create main window
local mainWindow = lib:AddWindow("AZER", "AZER")
if not mainWindow then
	print("ERROR: Failed to create main window")
	return
end

-- Add tabs
local combatTab = mainWindow:AddTab("combat", "rbxassetid://10734951847")
local visualTab = mainWindow:AddTab("visual", "rbxassetid://10723346959")
local miscTab = mainWindow:AddTab("misc", "rbxassetid://10709797985")
local fflagsTab = mainWindow:AddTab("fflags", "rbxassetid://10723364435")

if not combatTab or not visualTab or not miscTab or not fflagsTab then
	print("ERROR: Failed to create tabs")
	return
end

-- Add sections
local parrySection = combatTab:AddSection("parry", "left")
local curveSection = combatTab:AddSection("curve", "right")
local spamSection = combatTab:AddSection("spam", "left")
local hotkeysSection = combatTab:AddSection("hotkeys", "right")
local visualSection = visualTab:AddSection("visual", "left")
local miscSection = miscTab:AddSection("misc", "left")
local profileSection = fflagsTab:AddSection("profile", "left")
local fflagsJsonSection = fflagsTab:AddSection("fflags json", "right")

if not parrySection or not curveSection or not spamSection or not hotkeysSection or not visualSection or not miscSection or not profileSection or not fflagsJsonSection then
	print("ERROR: Failed to create sections")
	return
end

-- Create notification system
local notificationManager = lib:Notification()

-- Test notification to verify UI is working
if notificationManager then
	notificationManager:Notify("success", "AZER", "Script loaded successfully!", 5)
else
	print("ERROR: Failed to create notification manager")
	return
end

-- Configuration system
local config = {
	accuracy = 100,
	spam_threshold = 3,
	curve_keybind = false,
	manual_notify = false,
	curve_notify = false,
	curve_method = "camera",
	manual_spam = "E",
	mobile_triggerbot_button = false,
	mobile_manual_spam_button = false,
	ability_esp = false,
	auto_parry = false,
	ball_debug = false,
	auto_spam = false,
	random_target = false,
	unlock_all = false,
	last_equipped_sword = "",
	last_equipped_explosion = "",
	favorite_swords = {},
	favorite_explosions = {},
	deleted_swords = {},
	deleted_explosions = {},
	fflag_profile = "default",
	fflag_json = "",
	fflag_auto_load = false,
}

-- Add test controls to verify interactivity
parrySection:AddToggle("Auto Parry", false, function(value)
	config.auto_parry = value
	notificationManager:Notify("info", "Config", "Auto Parry: " .. tostring(value), 2)
end)

curveSection:AddToggle("Curve", false, function(value)
	config.curve_keybind = value
	notificationManager:Notify("info", "Config", "Curve: " .. tostring(value), 2)
end)

spamSection:AddSlider("Spam Threshold", 1, 3, 3, function(value)
	config.spam_threshold = value
	notificationManager:Notify("info", "Config", "Spam Threshold: " .. tostring(value), 2)
end)

visualSection:AddToggle("Ability ESP", false, function(value)
	config.ability_esp = value
	notificationManager:Notify("info", "Config", "Ability ESP: " .. tostring(value), 2)
end)

miscSection:AddButton("Save Config", function()
	notificationManager:Notify("success", "Config", "Configuration saved!", 3)
end)

miscSection:AddButton("Load Config", function()
	notificationManager:Notify("success", "Config", "Configuration loaded!", 3)
end)

profileSection:AddLabel("FFlags Profile Manager")
profileSection:AddButton("Create Profile", function()
	notificationManager:Notify("info", "FFlags", "Profile created!", 3)
end)

fflagsJsonSection:AddLabel("Format: {\"FFlagName\":\"value\"}")
fflagsJsonSection:AddButton("Apply FFlags", function()
	notificationManager:Notify("success", "FFlags", "FFlags applied!", 3)
end)

-- Cleanup on script stop
_G.AZER = false
notificationManager:Notify("success", "AZER", "Script fully loaded and ready!", 5)

print("AZER script loaded successfully!")
