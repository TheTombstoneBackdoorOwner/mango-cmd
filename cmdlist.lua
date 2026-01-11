{
    Name = "fly",
    CallBack = function(player, args)
loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
    end
},

{
    Name = "headsit",
    CallBack = function(player, args)
        local targetName = args[1]
        if not targetName then return end
        local plr = game.Players:FindFirstChild(targetName)
        if not plr then return end

        local you = player.Character
        if not you then return end
        local humanoid = you:FindFirstChild("Humanoid")
        local humanoidrootpart = you:FindFirstChild("HumanoidRootPart")
        local plrhead = plr:FindFirstChild("Head")
        local plrhumanoid = plr:FindFirstChild("Humanoid")
        if not humanoid or not humanoidrootpart or not plrhead then return end

        humanoidrootpart.CFrame = plrhead.CFrame * CFrame.new(0, 0, 1)
        local weld = Instance.new("WeldConstraint")
        weld.Part0 = humanoidrootpart
        weld.Part1 = plrhead
        weld.Parent = humanoidrootpart
        humanoid.Sit = true

        while true do
            task.wait(0.01)
            plrhead.CanCollide = false
            if not plr.Parent then
                weld:Destroy()
                humanoid.Sit = false
                plrhead.CanCollide = true
                break
            end
            if humanoid.Health == 0 then
                weld:Destroy()
                plrhead.CanCollide = true
                break
            end
            if humanoid.Jump == true then
                weld:Destroy()
                plrhead.CanCollide = true
                humanoid.Jump = true
                break
            end
        end
    end
}
