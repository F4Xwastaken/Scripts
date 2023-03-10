local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("FX Multi Tool Made by F4X#2106", "BloodTheme")





--Main here dumma fan
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Some universal stuff")


MainSection:NewButton("Noclip", "Enable to enable noclip", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/F4Xwastaken/Scripts/main/Noclip.lua"))();
end)


MainSection:NewButton("CTRL + Click tp", "Hold down left ctrl and click to teleport", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/F4Xwastaken/Scripts/main/ClickTeam.lua"))()
end)


MainSection:NewSlider("Speed", "Beep beep or vroom vroom", 500, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

MainSection:NewSlider("Jump", "Jump power", 500, 16, function(b) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpHeight = b
end)



MainSection:NewButton("Leftalt + click delete", "If you hold down left alt and click you delete", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/F4Xwastaken/Scripts/main/leftaltdelete.lua"))();
end)

MainSection:NewButton("Infinte Yield", "Just google it", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
 end)
 
 
 MainSection:NewButton("Chat spoofer", "You can talk like others and shit", function()
     loadstring(game:HttpGet(('https://pastebin.com/raw/djBfk8Li'),true))()
 end)



--Games
local Games = Window:NewTab("Games")
local Games = Games:NewSection("Game Scripts by F4X")


Games:NewButton("Fnaf Coop", "Fnaf coop script made by F4X", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/F4Xwastaken/Scripts/main/FX%20fucks%20fnaf%20coop.lua"))();
end)

Games:NewButton("Yba:Nu", "Yba:nu script made by F4X", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/F4Xwastaken/Scripts/main/Ybanu.lua"))();
end)

Games:NewButton("Ktkia51", "Kill the killers in area 51 script made by F4X", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/F4Xwastaken/Scripts/main/FX%20Ktkia51.lua"))();
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