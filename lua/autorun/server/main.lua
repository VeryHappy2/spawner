include('autorun/server/npc/spawn-npc.lua')

print("Server is running")

util.AddNetworkString("RequestSpawnNPC")

net.Receive("RequestSpawnNPC", function(len, ply)
    local npcType = net.ReadString()
    local spawned = SpawnNPC(npcType)

    if not spawned then
        ply:PrintMessage(HUD_PRINTTALK, "That's not right npc!")
    end
end)