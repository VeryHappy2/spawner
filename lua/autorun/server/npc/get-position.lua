function GetSafeSpawnPosition()
    for i = 1, 100 do
        local pos = GetRandomSpawnPosition()

        if pos == nil then return nil end

        local trace = util.TraceLine({
            start = pos,
            endpos = pos - Vector(0, 0, 1000),
            filter = function(ent) return ent:IsWorld() end
        })

        if trace.Hit then
            local safePos = trace.HitPos + Vector(0, 0, 10)
            
            local checkTrace = util.TraceHull({
                start = safePos,
                endpos = safePos + Vector(0, 0, 10),
                mins = Vector(-16, -16, 0),
                maxs = Vector(16, 16, 72),
                filter = function(ent) return ent:IsWorld() end
            })

            if not checkTrace.Hit then
                return safePos
            end
        end
    end

    return nil
end

function GetRandomSpawnPosition()
    local minBound, maxBound = GetMapBounds()

    if minBound == nil or maxBound == nil then
        print("Failed to get map bounds!")
        return nil
    end

    local x = math.Rand(minBound.x, maxBound.x)
    local y = math.Rand(minBound.y, maxBound.y)
    local z = 10

    return Vector(x, y, z)
end

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