local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("FX fucks Ktkia51 Made by F4X#2106", "DarkTheme")





--Main here dumma fan
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Some universal stuff")

MainSection:NewButton("Infinte Yield", "Just google it", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)


MainSection:NewButton("Chat spoofer", "You can talk like others and shit", function()
    loadstring(game:HttpGet(('https://pastebin.com/raw/djBfk8Li'),true))()
end)







--Local Player


local LocalPlayer = Window:NewTab("LocalPlayer")
local LocalPlayer = LocalPlayer:NewSection("Local Player")


LocalPlayer:NewButton("Speed", "Makes you go faster", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/F4Xwastaken/Scripts/main/Robloxspeed.lua"))()
end)



LocalPlayer:NewButton("CTRL + Click tp", "Hold down left ctrl and click to teleport", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/F4Xwastaken/Scripts/main/ClickTeam.lua"))()
end)



LocalPlayer:NewButton("Noclip", "Enable to enable noclip", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/F4Xwastaken/Scripts/main/Noclip.lua"))();
end)







--gun mods
local LocalPlayer = Window:NewTab("Gunmods")
local LocalPlayer = LocalPlayer:NewSection("Guns to mod")

LocalPlayer:NewButton("Mod all guns", "Unlimited ammo etc ", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/F4Xwastaken/Scripts/main/ktkia51allgunsmod.lua"))();
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