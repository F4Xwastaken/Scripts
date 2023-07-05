local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("FX fucks Fnaf Coop Made by F4X#2106", "GrapeTheme")





--Main here dumma fan
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Some universal stuff")


MainSection:NewButton("Noclip", "Enable to enable noclip", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/F4Xwastaken/Scripts/main/Noclip.lua"))();
end)


MainSection:NewButton("CTRL + Click tp", "Hold down left ctrl and click to teleport", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/F4Xwastaken/Scripts/main/ClickTeam.lua"))()
end)



MainSection:NewButton("Speed", "Makes you go faster", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/F4Xwastaken/Scripts/main/Robloxspeed.lua"))()
end)




MainSection:NewButton("Fullbright", "Gives you fullbright dumbass", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/F4Xwastaken/Scripts/main/fullbright.lua"))();
end)




MainSection:NewButton("Leftalt + click delete", "If you hold down left alt and click you delete", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/F4Xwastaken/Scripts/main/leftaltdelete.lua"))();
end)

MainSection:NewButton("Btools", "Gives you Btools", function()
    loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))();
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
