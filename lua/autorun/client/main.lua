include("autorun/client/ui/frame.lua")

print("Client is running")

concommand.Add("spawn_start", function(ply, cmd, args)
    local npcType = args[1]
    local maxAmountNpc = args[2]
    local seconds = args[3]

    if not npcType then
        print("To type the npc for spawning!")
        return
    end

    if not maxAmountNpc then
        print("To type the max amount npc for spawning!")
        return
    end

    if not seconds then
        print("To type the seconds for spawning!")
        return
    end

    timer.Create("SpawnNPC", seconds, 0, function()
        if (maxAmountNpc == 0) then
            return
        end
        net.Start("RequestSpawnNPC")
        net.WriteString(npcType)
        net.SendToServer()
    
        maxAmountNpc = maxAmountNpc - 1
    end)
end)

concommand.Add("open_spawn_menu", function() OpenSpawnUI() end)
local keyPressed = false
hook.Add("Think", "OpenMenuOnCKey", function()
    
    if input.IsKeyDown(KEY_H) then
        if not keyPressed then
            OpenSpawnUI()
            keyPressed = true
        end
    else
        if keyPressed then
            keyPressed = false
        end
    end
end)

concommand.Add("spawn_stop", function()
    timer.Remove("SpawnNPC")
end)