local Library = {
    Services = {
        Players = game:GetService("Players"),
    }
    Defined = {
    }
}

Library.__index = Library

function Library.new(name)
    local self = setmetatable({},Library)
    self.name = name
    self.Root = Instance.new("ScreenGui")
    self.Root.Name = self.name
    -- Define player
    self.Defined.Player = Library.Services.Players.LocalPlayer

    self.Root.Parent = self.Defined.Player.PlayerGui
    self.Root.IgnoreGuiInset = true
    self.Root.RespawnOnSpawn = false
    return self
end

function Library:Create_Window(width,height,positionX,positionY,background_color,background_transparency)
    local Main_Window = Instance.name("Frame")
    Main_Window.Name = "Main_Window"
    Main_Window.Size = Udim2.new(width,0,height,0)
    Main_Window.Position = Udim2.new(positionX,0,positionY,0)
    Main_Window.BackgroundColor = background_color
    Main_Window.BackgroundTransparency = background_transparency
    Main_Window.Parent = self.Root
    return Main_Window
end

function Library:TextLabel(name,parent,text,background_transparency,background_color,width,height,positionX,positionY)
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Name = name
    TextLabel.Text = text
    TextLabel.BackgroundTransparency = background_transparency
    TextLabel.BackgroundColor = background_color
    TextLabel.Size = Udim2.new(width,0,height,0)
    TextLabel.Position = Udim2.new(positionX,0,positionY,0)
    TextLabel.Parent = parent
    return TextLabel
end

function Library:TextButton(name,parent,text,background_transparency,background_color,width,height,positionX,positionY)
    local TextLabel = Instance.new("TextButton")
    TextLabel.Name = name
    TextLabel.Text = text
    TextLabel.BackgroundTransparency = background_transparency
    TextLabel.BackgroundColor = background_color
    TextLabel.Size = Udim2.new(width,0,height,0)
    TextLabel.Position = Udim2.new(positionX,0,positionY,0)
    TextLabel.Parent = parent
    return TextLabel
end

function Library:OptionSelector(name,parent,text,background_transparency,background_color,width,height,positionX,positionY)
    local TxtLabel = Library:TextLabel(name,parent,text,background_transparency,background_color,width,height,positionX,positionY)
    local OS = Library:TextButton(name,TxtLabel,text,background_transparency,background_color,0.1,0.1,TxtLabel.Position.X + 0.5,TxtLabel.Position.Y + 0.5)
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = 50
    UICorner.Parent = OS
    
    return OS
end

function Library:ImageLabel(name,parent,imageid,background_transparency,background_color,width,height,positionX,positionY)
    local IMG = Instance.new("ImageLabel")
    IMG.Name = name
    if string.find(imageid,"rbxassetid://") then
    else imageid = "rbxassetid://"..imageid
    end

    IMG.Image = imageid
    IMG.BackgroundTransparency = background_transparency
    IMG.BackgroundColor = background_color
    IMG.Size = Udim2.new(width,0,height,0)
    IMG.Position = Udim2.new(positionX,0,positionY,0)
    IMG.Parent = parent
    return IMG
end

function Library:ImageButton(name,parent,imageid,background_transparency,background_color,width,height,positionX,positionY)
    local IMG = Instance.new("ImageButton")
    IMG.Name = name
    if string.find(imageid,"rbxassetid://") then
    else imageid = "rbxassetid://"..imageid
    end

    IMG.Image = imageid
    IMG.BackgroundTransparency = background_transparency
    IMG.BackgroundColor = background_color
    IMG.Size = Udim2.new(width,0,height,0)
    IMG.Position = Udim2.new(positionX,0,positionY,0)
    IMG.Parent = parent
    return IMG
end

return Library
