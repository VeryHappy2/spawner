include('autorun/server/npc/get-position.lua')
function SpawnNPC(npc)
    local spawnPos = GetSafeSpawnPosition()

    if spawnPos == nil then
        return
    end

    local npc = ents.Create(npc)

    npc:SetPos(spawnPos)
    npc:Spawn()
    npc:Activate()

    print('npc was spawned')
    return spawnPos
end