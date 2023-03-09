local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua%22))()
local Window = Library.CreateLib("FX fucks Yba:NU Made by F4X#2106", "DarkTheme")


local colors = {
    SchemeColor = Color3.fromRGB(0,255,255),
    Background = Color3.fromRGB(0, 0, 0),
    Header = Color3.fromRGB(0, 0, 0),
    TextColor = Color3.fromRGB(255,255,255),
    ElementColor = Color3.fromRGB(20, 20, 20)
}


--Main here dumma fan
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Some universal stuff")

MainSection:NewButton("Infinte Yield", "Just google it", function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source%27),true))()
end)


MainSection:NewButton("Chat spoofer", "You can talk like others and shit", function()
    loadstring(game:HttpGet(('https://pastebin.com/raw/djBfk8Li%27),true))()
end)







--Local Player


local LocalPlayer = Window:NewTab("LocalPlayer")
local LocalPlayer = LocalPlayer:NewSection("Local Player")


LocalPlayer:NewButton("Speed", "Makes you go faster", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/F4Xwastaken/Scripts/main/Robloxspeed.lua%22))()
end)



LocalPlayer:NewButton("CTRL + Click tp", "Hold down left ctrl and click to teleport", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/F4Xwastaken/Scripts/main/ClickTeam.lua%22))()
end)







--Settings
local Settings = Window:NewTab("Settings")
local Settings = Settings:NewSection("Settings")
Settings:NewKeybind("Toggle UI", "KeybindInfo", Enum.KeyCode.RightControl, function()
    Library:ToggleUI()
end)





--Credits
local Credits = Window:NewTab("Credits")

local Credits = Credits:NewSection("Made By F4X#2106/@Edne961")