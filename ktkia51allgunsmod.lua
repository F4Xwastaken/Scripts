local plr = game.Players.LocalPlayer

function gunmods()
for i,v in pairs(getgc(true)) do
  if type(v) == 'table' then
      if rawget(v, 'stored_ammo') then
          v.ammo=99999
          v.stored_ammo=99999
          v.is_auto=true
          v.shoot_wait=0
          v.bullet_count=10
          v.inaccuracy=0
end;end;end;end
plr.Character.ChildAdded:Connect(function(child)
if child:IsA("Tool") then
gunmods()
end
end)