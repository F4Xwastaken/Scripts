--Hold CLTR and click to delete parts (you need to rejoin if you delete something wrong!! W/ <3 plemrbx<3
local Plr = game:GetService("Players").LocalPlayer
local Mouse = Plr:GetMouse()

Mouse.Button1Down:connect(function()
if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftAlt) then return end
if not Mouse.Target then return end
Mouse.Target:Destroy()
end)