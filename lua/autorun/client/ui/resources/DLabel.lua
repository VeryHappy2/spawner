function AddLabel(frame, positionX, positionY, text)
    local label = vgui.Create("DLabel", frame)
    label:SetText(text)
    label:SetPos(positionX, positionY)
    label:SizeToContents()
end