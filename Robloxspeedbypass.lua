local Spoofed = {};
local Clone = game.Clone;
local oldIdx;
local oldNewIdx;
local OldNC;

getgenv().Settings = {
   Speed = 45
}


local Player = game:GetService("Players").LocalPlayer;

local Methods = {
   "FindFirstChild",
   "FindFirstChildOfClass",
   "FindFirstChildWhichIsA"
}



local function SpoofProp(Instance, Property)
   local Cloned = Clone(Instance);

   table.insert(Spoofed, {
       Instance = Instance,
       Property = Property;
       ClonedInstance = Cloned;
   })
end


oldIdx = hookmetamethod(game, "__index", function(self, key)
   for i,v in next, Spoofed do
       if self == v.Instance and key == v.Property and not checkcaller() then
           return oldIdx(v.ClonedInstance, key)
       end

       if key == "Parent" and (self == v.ClonedInstance or self == v.Instance) and checkcaller() == false then
           return oldIdx(v.Instance, key)
       end
   end

   return oldIdx(self, key)
end)

oldNewIdx = hookmetamethod(game, "__newindex", function(self, key, newval, ...)
   for i,v in next, Spoofed do
       if self == v.Instance and key == v.Property and not checkcaller() then
           return oldNewIdx(v.ClonedInstance, key, newval, ...);
       end
   end
   return oldNewIdx(self, key, newval, ...)
end)

OldNC = hookmetamethod(game, "__namecall", function(self, ...)
   
   local Method = getnamecallmethod();

   if not table.find(Methods, Method) or Player.Character == nil or self ~= Player.Character then
       return OldNC(self, ...)
   end
   
   local Results = OldNC(self, ...);

   if Results and Results:IsA("Humanoid") and Player.Character and self == Player.Character then
       for i,v in next, Spoofed do
           if v.Instance == Results then
               return v.ClonedInstance
           end
       end
   end
   return OldNC(self, ...)
end)

for i, Method in next, Methods do
   local Old;

   Old = hookfunction(game[Method], function(self, ...)
       if not Player.Character or self ~= Player.Character then
           return Old(self, ...)
       end

       local Results = Old(self, ...);

       if Results and Results:IsA("Humanoid") and Player.Character and self == Player.Character then
           for i,v in next, Spoofed do
               if v.Instance == Results then
                   return v.ClonedInstance
               end
           end
       end
       return Old(self, ...)
   end)
end

local character = Player.Character

SpoofProp(character.Humanoid, "WalkSpeed")
character.Humanoid.WalkSpeed = Settings.Speed


character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
   character.Humanoid.WalkSpeed = Settings.Speed
end)


Player.CharacterAdded:Connect(function(character)
   character:WaitForChild("Humanoid")
   SpoofProp(character.Humanoid, "WalkSpeed")
   character.Humanoid.WalkSpeed = Settings.Speed

   character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
       character.Humanoid.WalkSpeed = Settings.Speed
   end)
end)