function GetMapBounds()
    local world = game.GetWorld()
    if not world then
        print("World is invalid!")
        return nil, nil
    end

    local minBound, maxBound = world:GetModelBounds()

    if not (minBound and maxBound) then
        print("Invalid bounds returned!")
        return nil, nil
    end

    return minBound, maxBound
end