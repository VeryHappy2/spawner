function Load() 
    local frame = vgui.Create("DFrame")
    frame:SetTitle("Spawn NPC Manager")
    frame:SetSize(400, 240)
    frame:Center()
    frame:MakePopup()
    return frame
end