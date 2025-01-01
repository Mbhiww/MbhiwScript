-- Priority Settings
getgenv().FocusWave = 5
getgenv().PriorityCards = {
    "+ Range I", "- Cooldown I", "+ Attack I", "+ Gain 2 Random Effects Tier 1",
    "- Cooldown II", "+ Range II", "+ Attack II", "+ Gain 2 Random Effects Tier 2",
    "- Cooldown III", "+ Range III", "+ Attack III", "+ Gain 2 Random Effects Tier 3"
}
getgenv().Cards = {
    "+ Explosive Deaths I", "+ Explosive Deaths II", "+ Explosive Deaths III",
    "+ Gain 2 Random Curses Tier 3", "+ Gain 2 Random Curses Tier 2",
    "+ Gain 2 Random Curses Tier 1", "+ Enemy Speed III", "+ Enemy Speed II",
    "+ Enemy Speed I", "+ Enemy Regen I", "+ Enemy Regen II", "+ Enemy Regen III",
    "+ Yen I", "+ Yen II", "+ Yen III", "+ Boss Damage I", "+ Boss Damage II",
    "+ Boss Damage III", "+ Range I", "- Cooldown I", "+ Attack I",
    "+ Gain 2 Random Effects Tier 1", "- Cooldown II", "+ Range II",
    "+ Attack II", "+ Gain 2 Random Effects Tier 2", "- Cooldown III",
    "+ Range III", "+ Attack III", "+ Gain 2 Random Effects Tier 3", "+ New Path"
}

-- Load External Library
loadstring(game:HttpGet("https://raw.githubusercontent.com/Niga-Niga/scripts/refs/heads/main/pickcard.lua"))()

-- Modify Map and Destroy Unwanted Elements
for _, child in ipairs(workspace._map:GetChildren()) do
    if child:FindFirstChild("snow") then
        child.snow:Destroy()
    end
end

if workspace._map.player:FindFirstChild("Beacon") then
    workspace._map.player.Beacon:Destroy()
end

local area = workspace._map.player:FindFirstChild("area")
if area then
    area.BrickColor = BrickColor.new("Lime green")
    area.Color = Color3.fromRGB(0, 255, 0)
    area.Size = Vector3.new(0.3, 15, 15)
    area.Shape = Enum.PartType.Block

    local attachment = area:FindFirstChild("Attachment")
    if attachment then
        attachment:Destroy()
    end
end

for _, bisaya in ipairs(workspace._map:GetChildren()) do
    if bisaya:IsA("Model") then
        for _, child in ipairs(bisaya:GetChildren()) do
            if child.Name == "Model" or child.Name == "side" then
                child:Destroy()
            end
        end
    end
end

-- Teleport Functionality
game:GetService("GuiService").ErrorMessageChanged:Connect(function()
    wait(2)
    game:GetService("TeleportService"):Teleport(8304919130)
end)
