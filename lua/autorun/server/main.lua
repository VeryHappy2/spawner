include('autorun/server/npc/spawn-npc.lua')

print("Server is running")

util.AddNetworkString("RequestSpawnNPC")

net.Receive("RequestSpawnNPC", function(len, ply)
    local npcType = net.ReadString()

    local validNPCs = {
        "npc_combine_s",
        "npc_metropolice",
        "npc_zombie",
        "npc_antlion",
    }

    if not table.HasValue(validNPCs, npcType) then
        ply:PrintMessage(HUD_PRINTTALK, "Невірний тип NPC!")
        return
    end
    SpawnNPC(npcType)
end)