function FindTheHighestPosition()
    local maxHeight = -math.huge

    if not ents.GetAll() then
        return 200
    end

    for _, ent in ipairs(ents.GetAll()) do
        if IsValid(ent) then
            local pos = ent:GetPos()
            if pos.z > maxHeight then
                maxHeight = pos.z
            end
        end
    end
    return maxHeight
end

function FindMinZPosition()
    local minHeight = math.huge

    if not ents.GetAll() then
        return 0
    end

    for _, ent in ipairs(ents.GetAll()) do
        if IsValid(ent) then
            local pos = ent:GetPos()
            if pos.z < minHeight then
                minHeight = pos.z
            end
        end
    end

    return minHeight
end