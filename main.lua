-- Create the GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create a draggable frame
local DraggableFrame = Instance.new("Frame")
DraggableFrame.Parent = ScreenGui
DraggableFrame.Size = UDim2.new(0, 350, 0, 250)
DraggableFrame.Position = UDim2.new(0.5, -175, 0.5, -125)
DraggableFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
DraggableFrame.BorderSizePixel = 0
DraggableFrame.Draggable = true
DraggableFrame.Active = true
DraggableFrame.BackgroundTransparency = 0.2

-- Add a title
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = DraggableFrame
TitleLabel.Size = UDim2.new(1, 0, 0, 50)
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.Text = "Mbhiww"
TitleLabel.BackgroundColor3 = Color3.fromRGB(60, 90, 120)
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 24
TitleLabel.BorderSizePixel = 0

-- Add a description
local DescriptionLabel = Instance.new("TextLabel")
DescriptionLabel.Parent = DraggableFrame
DescriptionLabel.Size = UDim2.new(1, -20, 0, 30)
DescriptionLabel.Position = UDim2.new(0, 10, 0, 60)
DescriptionLabel.Text = "Gacorkan!"
DescriptionLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
DescriptionLabel.BackgroundTransparency = 1
DescriptionLabel.Font = Enum.Font.Gotham
DescriptionLabel.TextSize = 18

-- Add a shoot button with hover effect
local ShootButton = Instance.new("TextButton")
ShootButton.Parent = DraggableFrame
ShootButton.Text = "Shoot Ball"
ShootButton.Size = UDim2.new(0, 200, 0, 50)
ShootButton.Position = UDim2.new(0.5, -100, 0.4, 0)
ShootButton.BackgroundColor3 = Color3.fromRGB(80, 160, 240)
ShootButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ShootButton.Font = Enum.Font.GothamBold
ShootButton.TextSize = 20
ShootButton.BorderSizePixel = 0
ShootButton.AutoButtonColor = false

ShootButton.MouseEnter:Connect(function()
    ShootButton.BackgroundColor3 = Color3.fromRGB(100, 180, 255)
end)
ShootButton.MouseLeave:Connect(function()
    ShootButton.BackgroundColor3 = Color3.fromRGB(80, 160, 240)
end)

-- Add a speed input box
local SpeedTextBox = Instance.new("TextBox")
SpeedTextBox.Parent = DraggableFrame
SpeedTextBox.Size = UDim2.new(0, 250, 0, 40)
SpeedTextBox.Position = UDim2.new(0.5, -125, 0.6, 0)
SpeedTextBox.Text = "10000" -- Default minimum speed
SpeedTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedTextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
SpeedTextBox.BorderSizePixel = 0
SpeedTextBox.Font = Enum.Font.Gotham
SpeedTextBox.PlaceholderText = "Enter Speed (min: 1)"
SpeedTextBox.TextSize = 18
SpeedTextBox.ClearTextOnFocus = false

-- Add a label for the speed
local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Parent = DraggableFrame
SpeedLabel.Size = UDim2.new(1, -20, 0, 30)
SpeedLabel.Position = UDim2.new(0, 10, 0.75, 0)
SpeedLabel.Text = "Shot Speed: " .. SpeedTextBox.Text
SpeedLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Font = Enum.Font.Gotham
SpeedLabel.TextSize = 18

-- Update the speed label dynamically
SpeedTextBox.FocusLost:Connect(function()
    local inputValue = tonumber(SpeedTextBox.Text)
    if inputValue and inputValue >= 10000 then
        SpeedLabel.Text = "Shot Speed: " .. inputValue
    else
        SpeedLabel.Text = "Invalid input! Using minimum: 10000"
        SpeedTextBox.Text = "10000"
    end
end)

-- Define the shooting functionality
local function shootFastDown()
    -- Get the shot speed, ensure it is at least 10000
    local inputSpeed = tonumber(SpeedTextBox.Text) or 10000
    local shotPower = math.max(inputSpeed, 10000)
    local downwardDirection = Vector3.new(0, -50, -100)

    -- Fire the server to shoot the ball
    local args = {
        [1] = shotPower,
        [4] = downwardDirection
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("BallService"):WaitForChild("RE"):WaitForChild("Shoot"):FireServer(unpack(args))
    print("Ball shot downward with speed: " .. shotPower)
end

-- Connect the button to the shooting function
ShootButton.MouseButton1Click:Connect(shootFastDown)
