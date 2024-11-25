include("autorun/client/ui/resources/DEntry.lua")
include("autorun/client/ui/resources/DLabel.lua")
include("autorun/client/ui/load.lua")

function OpenSpawnUI()
    local frame = Load()
    AddLabel(frame, 10, 40, "NPC Type:")
    local npcTypeInput = AddEntry(frame, 150, 40, 240, 20, false)

    AddLabel(frame, 10, 70, "Max NPC Amount:")
    local maxAmountInput = AddEntry(frame, 150, 70, 240, 20, true)

    AddLabel(frame, 10, 100, "Seconds Between Spawn:")
    local secondsInput = AddEntry(frame, 150, 100, 240, 20, true)

    local startButton = vgui.Create("DButton", frame)
    startButton:SetText("Start Spawning")
    startButton:SetPos(10, 140)
    startButton:SetSize(380, 30)

    startButton.DoClick = function()
        local npcType = npcTypeInput:GetValue()
        local maxAmountNpc = tonumber(maxAmountInput:GetValue())
        local seconds = tonumber(secondsInput:GetValue())

        if npcType == "" then
            chat.AddText(Color(255, 0, 0), "Please enter the NPC type!")
            return
        end

        if not maxAmountNpc or maxAmountNpc <= 0 then
            chat.AddText(Color(255, 0, 0), "Please enter a valid max NPC amount!")
            return
        end

        if not seconds or seconds <= 0 then
            chat.AddText(Color(255, 0, 0), "Please enter a valid time interval!")
            return
        end

        RunConsoleCommand("spawn_start", npcType, maxAmountNpc, seconds)

        chat.AddText(Color(0, 255, 0), "Spawning started with the following parameters:")
        chat.AddText(Color(255, 255, 0), "NPC Type: " .. npcType .. ", Max NPCs: " .. maxAmountNpc .. ", Interval: " .. seconds .. " seconds.")
    end

    local stopButton = vgui.Create("DButton", frame)
    stopButton:SetText("Stop Spawning")
    stopButton:SetPos(10, 180)
    stopButton:SetSize(380, 30)

    stopButton.DoClick = function()
        RunConsoleCommand("spawn_stop")
    end
end