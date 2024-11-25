function AddEntry(frame, positionX, positionY, width, height, numeric)
    local entry = vgui.Create("DTextEntry", frame)
    entry:SetPos(positionX, positionY)
    entry:SetSize(width, height)
    entry:SetNumeric(numeric)
    return entry
end