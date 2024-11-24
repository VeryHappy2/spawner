print("Client is running")

concommand.Add("spawn_start", function(ply, cmd, args)

    if #args < 1 then
        print("Введіть тип NPC для спавну!")
        return
    end
    local npcType = args[1]
    
    local validNPCs = {
        "npc_combine_s",
        "npc_metropolice",
        "npc_zombie",
        "npc_antlion",
    }

    if table.HasValue(validNPCs, npcType) then
        timer.Create("SpawnNPC", 5, 0, function()
            net.Start("RequestSpawnNPC")
            net.WriteString(npcType)
            net.SendToServer()
        end)
    else
        print("Невірний тип NPC!")
    end
end)
concommand.Add("spawn_stop", function()
    timer.Remove("SpawnNPC")
end)