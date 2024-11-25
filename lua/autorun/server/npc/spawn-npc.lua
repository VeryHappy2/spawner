include('autorun/server/npc/position/get-random-position.lua')

function SpawnNPC(npc)
    local spawnPos = GetSafeSpawnPosition()

    if spawnPos == nil then
        print("Not found a safe position")
        return
    end

    local npc = ents.Create(npc)

    if not IsValid(npc) then
        return nil
    end

    npc:SetPos(spawnPos)
    npc:Spawn()
    npc:Activate()

    print('npc was spawned')
    return spawnPos
end