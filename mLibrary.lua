--// variables
local InputService      = cloneref(UserSettings().GetService(game, "UserInputService"));
local Players           = cloneref(UserSettings().GetService(game, "Players"));
local Workspace         = cloneref(UserSettings().GetService(game, "Workspace"));
local HttpService       = cloneref(UserSettings().GetService(game, "HttpService"));
local GuiService        = cloneref(UserSettings().GetService(game, "GuiService"));
local Lighting          = cloneref(UserSettings().GetService(game, "Lighting"));
local RunService        = cloneref(UserSettings().GetService(game, "RunService"));
local TweenService      = cloneref(UserSettings().GetService(game, "TweenService"));
local ReplicatedStorage = cloneref(UserSettings().GetService(game, "ReplicatedStorage"));

local NewVect2          = Vector2.new;
local NewVect3          = Vector3.new;
local Dim2              = UDim2.new;
local NewDim            = UDim.new;
local NewRect           = Rect.new;
local NewCF             = CFrame.new;
local NewAnglesCF       = CFrame.Angles;
local DimOffset         = UDim2.fromOffset;

local NewColor          = Color3.new
local FromRgb           = Color3.fromRGB
local FromHex           = Color3.fromHex
local RgbSeq            = ColorSequence.new
local RgbKey            = ColorSequenceKeypoint.new
local NumbSeq           = NumberSequence.new
local NumbKey           = NumberSequenceKeypoint.new
local NewInst           = Instance.new
local Camera            = Workspace.CurrentCamera
local Client            = Players.LocalPlayer
local Character         = Client.Character
--
local Mouse = cloneref(Client:GetMouse())
local GuiOffset = GuiService:GetGuiInset().Y

local Max = math.max
local Floor = math.floor
local Min = math.min
local Abs = math.abs
local Noise = math.noise
local Rad = math.rad
local Random = math.random
local pow = math.pow
local Sin = math.Sin
local Pi = math.Pi
local Tan = math.tan
local Atan2 = math.atan2
local Cos = math.cos
local Round = math.Round;
local Clamp = math.clamp;
local Celi = math.ceil;
local Sqrt = math.sqrt;
local ACos = math.acos;
local Huge = math.huge;
local Wait = clonefunction(task.wait)
local Spawn = clonefunction(task.spawn)



--// Library init
local Library = {
    directory = "Akira",
    Folders = {"/Fonts", "/Configs", "/Images"},
    Flags = {},
    ConfigFlags = {},
    VisibleFlags = {}, 
    Guis = {}, 
    Connections = {},   
    Notifications = {},
    PlayerlistData = {},
    CurrentTab, 
    CurrentElementOpen, 
    DockButtonHolder,  
    Font, 
    KeybindList,
    Binds = {}, 
}

local Flags = Library.Flags
local ConfigFlags = Library.ConfigFlags

Library.Themes = {
    Preset = {
        ["Outline"] = FromRgb(15, 2, 7),
        ["Inline"] = FromRgb(38, 9, 21),
        ["Accent"] = FromRgb(175, 50, 100),
        ["LowContrast"] = FromRgb(30, 6, 16),
        ["HighContrast"] = FromRgb(22, 4, 12),
        ["Text"] = FromRgb(136, 136, 136),
        ["TextOutline"] = FromRgb(0, 0, 0),
        ["Glow"] = FromRgb(0, 0, 0),
    },

    utility = {
        ["Outline"] = {
            ["BackgroundColor3"] = {}, 	
            ["Color"] = {}, 
        },
        ["Inline"] = {
            ["BackgroundColor3"] = {}, 	
        },
        ["Accent"] = {
            ["BackgroundColor3"] = {}, 	
            ["TextColor3"] = {}, 
            ["ImageColor3"] = {}, 
            ["ScrollBarImageColor3"] = {} 
        },
        ["Contrast"] = {
            ["Color"] = {}, 	
        },
        ["Text"] = {
            ["TextColor3"] = {}, 	
        },
        ["TextOutline"] = {
            ["Color"] = {}, 	
        },
        ["Glow"] = {
            ["ImageColor3"] = {}, 	
        }, 
    }, 

    Find = {
        ["Frame"] = "BackgroundColor3", 
        ["TextLabel"] = "TextColor3", 
        ["UIGradient"] = "Color",
        ["UIStroke"] = "Color",
        ["ImageLabel"] = "ImageColor3",
        ["TextButton"] = "BackgroundColor3", 
        ["ScrollingFrame"] = "ScrollBarImageColor3"
    }
}

local Keys = {
    [Enum.KeyCode.LeftShift] = "LS",
    [Enum.KeyCode.RightShift] = "RS",
    [Enum.KeyCode.LeftControl] = "LC",
    [Enum.KeyCode.RightControl] = "RC",
    [Enum.KeyCode.Insert] = "INS",
    [Enum.KeyCode.Backspace] = "BS",
    [Enum.KeyCode.Return] = "Ent",
    [Enum.KeyCode.LeftAlt] = "LA",
    [Enum.KeyCode.RightAlt] = "RA",
    [Enum.KeyCode.CapsLock] = "CAPS",
    [Enum.KeyCode.One] = "1",
    [Enum.KeyCode.Two] = "2",
    [Enum.KeyCode.Three] = "3",
    [Enum.KeyCode.Four] = "4",
    [Enum.KeyCode.Five] = "5",
    [Enum.KeyCode.Six] = "6",
    [Enum.KeyCode.Seven] = "7",
    [Enum.KeyCode.Eight] = "8",
    [Enum.KeyCode.Nine] = "9",
    [Enum.KeyCode.Zero] = "0",
    [Enum.KeyCode.KeypadOne] = "Num1",
    [Enum.KeyCode.KeypadTwo] = "Num2",
    [Enum.KeyCode.KeypadThree] = "Num3",
    [Enum.KeyCode.KeypadFour] = "Num4",
    [Enum.KeyCode.KeypadFive] = "Num5",
    [Enum.KeyCode.KeypadSix] = "Num6",
    [Enum.KeyCode.KeypadSeven] = "Num7",
    [Enum.KeyCode.KeypadEight] = "Num8",
    [Enum.KeyCode.KeypadNine] = "Num9",
    [Enum.KeyCode.KeypadZero] = "Num0",
    [Enum.KeyCode.Minus] = "-",
    [Enum.KeyCode.Equals] = "=",
    [Enum.KeyCode.Tilde] = "~",
    [Enum.KeyCode.LeftBracket] = "[",
    [Enum.KeyCode.RightBracket] = "]",
    [Enum.KeyCode.RightParenthesis] = ")",
    [Enum.KeyCode.LeftParenthesis] = "(",
    [Enum.KeyCode.Semicolon] = ",",
    [Enum.KeyCode.Quote] = "'",
    [Enum.KeyCode.BackSlash] = "\\",
    [Enum.KeyCode.Comma] = ",",
    [Enum.KeyCode.Period] = ".",
    [Enum.KeyCode.Slash] = "/",
    [Enum.KeyCode.Asterisk] = "*",
    [Enum.KeyCode.Plus] = "+",
    [Enum.KeyCode.Period] = ".",
    [Enum.KeyCode.Backquote] = "`",
    [Enum.UserInputType.MouseButton1] = "MB1",
    [Enum.UserInputType.MouseButton2] = "MB2",
    [Enum.UserInputType.MouseButton3] = "MB3",
    [Enum.KeyCode.Escape] = "ESC",
    [Enum.KeyCode.Space] = "SPC",
}
    
Library.__index = Library

for _, Path in next, Library.Folders do 
    makefolder(Library.directory .. Path)
end 
local Fonts = {}
function LoadFont(Name, fileName, url)
    local FontDir = Library.directory .. "/Fonts"
    if not isfolder(FontDir) then
        makefolder(FontDir)
    end

    local AssetPath = FontDir .. "/" .. fileName
    local FontConfig = FontDir .. "/" .. Name .. ".json"

    if isfile(AssetPath) and isfile(FontConfig) then
        local getcustomasset = getcustomasset or getcustomasset
        return getcustomasset(FontConfig)
    end

    if isfile(AssetPath) then
        delfile(AssetPath)
    end

    writefile(AssetPath, data)

    if not isfile(FontConfig) then
        local FontData = {Name = Name, Faces = {{Name = "Regular", Weight = 400, Style = "Normal", AssetId = getcustomasset(AssetPath)}}}
        writefile(FontConfig, HttpService:JSONEncode(FontData))
    end

    return getcustomasset(FontConfig)
end

Spawn(function()
    local FontsT = {{Name = "ProggyClean", file = "ProggyClean.ttf", url = "https://github.com/fent4life/other/raw/refs/heads/main/fonts/ProggyClean.ttf"}; {Name = "ProggyTiny", file = "ProggyTiny.ttf", url = "https://github.com/fent4life/other/raw/refs/heads/main/fonts/ProggyTiny.ttf"}; {Name = "Minecraftia", file = "Minecraftia.ttf", url = "https://github.com/fent4life/other/raw/refs/heads/main/fonts/Minecraftia.ttf"}; {Name = "SourceSans", file = "SourceSans.ttf", url = "https://github.com/fent4life/other/raw/refs/heads/main/fonts/SourceSans.ttf"}; {Name = "Monospace", file = "Monospace.ttf", url = "https://github.com/fent4life/other/raw/refs/heads/main/fonts/Monospace.ttf"}}
    for _, fontDef in ipairs(FontsT) do
        local Passed, result = pcall(function()
            return Font.new(LoadFont(fontDef.Name, fontDef.file, fontDef.url)) or Font.fromEnum(Enum.Font.SourceSans)
        end)
        if Passed then
            Fonts[fontDef.Name] = result
        else
            Fonts[fontDef.Name] = Font.fromEnum(Enum.Font.SourceSans)
        end
    end
end)

writefile("Proggy.ttf", game:HttpGet("https://github.com/i77lhm/storage/raw/refs/heads/main/fonts/ProggyClean.ttf"))

local Proggy = {Name = "Proggy", Faces = {{Name = "Regular", Weight = 400, Style = "normal", AssetId = getcustomasset("Proggy.ttf")}}}

--writefile("Proggy.ttf", HttpService:JSONEncode(Proggy))

local ConfigHolder 
--// Library functions 
    function Library:Resizeable(AFrame) 
        local Frame = NewInst("TextButton")
        Frame.Position = Dim2(1, -10, 1, -10)
        Frame.BorderColor3 = FromRgb(0, 0, 0)
        Frame.Size = Dim2(0, 10, 0, 10)
        Frame.BorderSizePixel = 0
        Frame.BackgroundColor3 = FromRgb(255, 255, 255)
        Frame.Parent = AFrame
        Frame.BackgroundTransparency = 1 
        Frame.Text = ""

        local Resizing = false 
        local StartSize 
        local Start 
        local OgSize = AFrame.Size  

        Frame.InputBegan:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                Resizing = true
                Start = Input.Position
                StartSize = AFrame.Size
            end
        end)

        Frame.InputEnded:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                Resizing = false
            end
        end)

        Library:Connection(InputService.InputChanged, function(Input, GameEvent) 
            if Resizing and Input.UserInputType == Enum.UserInputType.MouseMovement then
                local ViewportX = Camera.ViewportSize.X
                local ViewportY = Camera.ViewportSize.Y

                local CurrentSize = Dim2(StartSize.X.Scale, Clamp(StartSize.X.Offset + (Input.Position.X - Start.X), OgSize.X.Offset, ViewportX), StartSize.Y.Scale, Clamp(StartSize.Y.Offset + (Input.Position.Y - Start.Y), OgSize.Y.Offset, ViewportY))
                AFrame.Size = CurrentSize
            end
        end)
    end

    function Library:DragThing(AFrame)
        local Dragging = false 
        local StartSize = AFrame.Position
        local Start 

        AFrame.InputBegan:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                Dragging = true
                Start = Input.Position
                StartSize = AFrame.Position

                if Library.CurrentElementOpen then 
                    Library.CurrentElementOpen.SetVisible(false)
                    Library.CurrentElementOpen.Open = false 
                    Library.CurrentElementOpen = nil 
                end
            end
        end)

        AFrame.InputEnded:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                Dragging = false
            end
        end)

        Library:Connection(InputService.InputChanged, function(Input, GameEvent) 
            if Dragging and Input.UserInputType == Enum.UserInputType.MouseMovement then
                local ViewportX = Camera.ViewportSize.X
                local ViewportY = Camera.ViewportSize.Y

                local CurrentPosition = Dim2(
                    0,
                    Clamp(
                        StartSize.X.Offset + (Input.Position.X - Start.X),
                        0,
                        ViewportX - AFrame.Size.X.Offset
                    ),
                    0,
                    Clamp(
                        StartSize.Y.Offset + (Input.Position.Y - Start.Y),
                        0,
                        ViewportY - AFrame.Size.Y.Offset
                    )
                )

                AFrame.Position = CurrentPosition
            end
        end)
    end

    function Library:NewDrawing(class, properties)
        local Inst = Drawing.new(class)

        for _, V in next, properties do 
            Inst[_] = V
        end 

        Insert(Akira.drawings, Inst)

        return Inst 
    end 
    
    function Library:NewInstance(class, properties) 
        local Inst = NewInst(class)

        for _, V in next, properties do 
            Inst[_] = V
        end 

        Insert(Akira.instances, Inst)

        return Inst 
    end 

    function Library:ConvertEnum(enum)
        local EnumParts = {}
    
        for part in string.gmatch(enum, "[%w_]+") do
            Insert(EnumParts, part)
        end
    
        local EnumTable = Enum
        for i = 2, #EnumParts do
            local EnumItem = EnumTable[EnumParts[i]]
    
            EnumTable = EnumItem
        end
    
        return EnumTable
    end

    function Library:Tween(obj, properties)
        local Tween = TweenService:Create(obj, TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0), properties):Play()
        return Tween
    end 

    function Library:UpdateConfigList() 
        if not ConfigHolder then return end 
    
        local List = {}
    
        for idx, file in next, listfiles(Library.directory .. "/configs") do
            local Name = file:gsub(Library.directory .. "/configs\\", ""):gsub(".Cfg", ""):gsub(Library.directory .. "\\configs\\", "")
            List[#List + 1] = Name
        end
        
        ConfigHolder.RefreshOptions(List)
    end 

    function Library:GetConfig()
        local Config = {}
    
        for _, V in Flags do
            if type(V) == "table" and V.Key then
                Config[_] = {Active = V.Active, Mode = V.Mode, Key = tostring(V.Key)}
            elseif type(V) == "table" and V["Transparency"] and V["Color"] then
                Config[_] = {Transparency = V["Transparency"], Color = V["Color"]:ToHex()}
            else
                Config[_] = V
            end
        end 
        
        return HttpService:JSONEncode(Config)
    end

    function Library:LoadConfig(ConfigJson) 
        local config = HttpService:JSONDecode(ConfigJson)
    
        for _, V in next, config do 
            local FunctionSet = Library.ConfigFlags[_]
            
            if FunctionSet then 
                if type(V) == "table" and V["Transparency"] and V["Color"] then
                    FunctionSet(FromHex(V["Color"]), V["Transparency"])
                elseif type(V) == "table" and V["Active"] then 
                    FunctionSet(V)
                else 
                    FunctionSet(V)
                end
            end 
        end 
    end 
    
    function Library:Round(number, float) 
        local multiplier = 1 / (float or 1)

        return Floor(number * multiplier + .5) / multiplier
    end 

    function Library:ApplyTheme(instance, theme, Property) 
        Insert(Library.Themes.utility[theme][Property], instance)
    end

    function Library:UpdateTheme(theme, NewColor)
        for _, Property in next, Library.Themes.utility[theme] do 

            for m, object in next, Property do 
                if object[_] == Library.Themes.Preset[theme] or object.ClassName == "UIGradient" then
                    object[_] = NewColor 
                end
            end 
        end 

        Library.Themes.Preset[theme] = NewColor 
    end 

    function Library:UpdateFont(Font, TextSize)
        Library.Font = Font
        Library.TextSize = TextSize

        for _, Property in next, Library.Themes.utility.Text do
            for _, object in next, Property do
                if object:IsA("TextLabel") or object:IsA("TextButton") or object:IsA("TextBox") then
                    CheckDiff(object, "FontFace", Font)
                    CheckDiff(object, "TextSize", TextSize)
                end
            end
        end

        for _, gui in next, Library.Guis do
            for _, object in next, gui:GetDescendants() do
                if object:IsA("TextLabel") or object:IsA("TextButton") or object:IsA("TextBox") then
                    CheckDiff(object, "FontFace", Font)
                    CheckDiff(object, "TextSize", TextSize)
                end
            end
        end
    end

    function Library:Connection(signal, Callback)
        local Connection = signal:Connect(Callback)
        
        Insert(Library.Connections, Connection)

        return Connection 
    end

    function Library:ApplyStroke(parent) 
        local Stroke = Library:Create("UIStroke", {
            Parent = parent,
            Color = Library.Themes.Preset.TextOutline, 
            LineJoinMode = Enum.LineJoinMode.Miter
        }) 
        
        Library:ApplyTheme(Stroke, "TextOutline", "Color")
    end

    function Library:Create(instance, Options)
        local Inst = NewInst(instance) 
        
        for Prop, value in next, Options do 
            Inst[Prop] = value
        end
        
        if instance == "TextLabel" or instance == "TextButton" or instance == "TextBox" then 	
            Library:ApplyTheme(Inst, "Text", "TextColor3")
            Library:ApplyStroke(Inst)
        elseif instance == "ScreenGui" then 
            Insert(Library.Guis, Inst)
        end
        
        return Inst 
    end
    
-- 

-- elements 
    local ToolTipSGui = Library:Create("ScreenGui", {
        Enabled = true,
        Parent = gethui(),
        Name = "",
        DisplayOrder = 500, 
    })

    function Library:ToolTip(Options) 
        local Cfg = {
            Name = Options.Name or "hi", 
            Path = Options.Path or nil, 
        }
        
        if Cfg.Path then 
            local WatermarkOutline = Library:Create("Frame", {
                Parent = ToolTipSGui,
                Name = "",
                Size = Dim2(0, 0, 0, 22),
                Position = Dim2(0, 500, 0, 300),
                BorderColor3 = FromRgb(0, 0, 0),
                BorderSizePixel = 0,
                Visible = false,
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundColor3 = Library.Themes.Preset.Outline
            })
            
            local WatermarkInline = Library:Create("Frame", {
                Parent = WatermarkOutline,
                Name = "",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Inline
            })
            
            local WatermarkBackground = Library:Create("Frame", {
                Parent = WatermarkInline,
                Name = "",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            
            local UIGradient = Library:Create("UIGradient", {
                Parent = WatermarkBackground,
                Name = "",
                Color = RgbSeq{RgbKey(0, FromRgb(41, 41, 55)), RgbKey(1, FromRgb(35, 35, 47))}
            }); Library:ApplyTheme(UIGradient, "Contrast", "Color")
            
            local Text = Library:Create("TextLabel", {
                Parent = WatermarkBackground,
                Name = "",
                FontFace = Library.Font,
                TextColor3 = Library.Themes.Preset.Text,
                BorderColor3 = FromRgb(0, 0, 0),
                Text = " " .. Cfg.Name .. " ",
                Size = Dim2(0, 0, 1, 0),
                BackgroundTransparency = 1,
                Position = Dim2(0, 0, 0, -1),
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.X,
                TextSize = 11,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            
            local UIStroke = Library:Create("UIStroke", {
                Parent = Text,
                Name = "",
                LineJoinMode = Enum.LineJoinMode.Miter
            })

            Cfg.Path.MouseEnter:Connect(function()
                WatermarkOutline.Visible = true 
            end)   

            Cfg.Path.MouseLeave:Connect(function()
                WatermarkOutline.Visible = false 
            end)

            Library:Connection(InputService.InputChanged, function(Input)
                if WatermarkOutline.Visible and Input.UserInputType == Enum.UserInputType.MouseMovement then
                    WatermarkOutline.Position = DimOffset(Input.Position.X + 10, Input.Position.Y + 10)
                end
            end)
        end 
        
        return Cfg
    end 

    function Library:Panel(Options) 
        local Cfg = {
            Name = Options.Text or Options.Name or "Window", 
            Size = Options.Size or Dim2(0, 530, 0, 590),
            Position = Options.Position or Dim2(0, 500, 0, 500),
            AnchorPoint = Options.AnchorPoint or NewVect2(0, 0)
        }

        local SGui = Library:Create("ScreenGui", {
            Enabled = true,
            Parent = gethui(),
            Name = "" 
        })

        local MainHolder = Library:Create("Frame", {
            Parent = SGui,
            Name = "",
            AnchorPoint = NewVect2(Cfg.AnchorPoint.X, Cfg.AnchorPoint.Y),
            Position = Cfg.Position,
            Active = true, 
            BorderColor3 = FromRgb(0, 0, 0),
            Size = Cfg.Size,
            BorderSizePixel = 0,
            BackgroundColor3 = Library.Themes.Preset.Outline
        })

        Library:DragThing(MainHolder)
        
        --Library:ApplyTheme(MainHolder, "Outline", "BackgroundColor3") 
        
        local WindowInline = Library:Create("Frame", {
            Parent = MainHolder,
            Name = "",
            Position = Dim2(0, 1, 0, 1),
            BorderColor3 = FromRgb(0, 0, 0),
            Size = Dim2(1, -2, 1, -2),
            BorderSizePixel = 0,
            BackgroundColor3 = Library.Themes.Preset.Accent
        })
        
        Library:ApplyTheme(WindowInline, "Accent", "BackgroundColor3") 
        
        local WindowHolder = Library:Create("Frame", {
            Parent = WindowInline,
            Name = "",
            Position = Dim2(0, 1, 0, 1),
            BorderColor3 = Library.Themes.Preset.Outline,
            Size = Dim2(1, -2, 1, -2),
            BorderSizePixel = 0,
            BackgroundColor3 = FromRgb(255, 255, 255)
        })
                    
        local UIGradient = Library:Create("UIGradient", {
            Parent = WindowHolder,
            Name = "",
            Rotation = 90,
            Color = RgbSeq{
            RgbKey(0, FromRgb(41, 41, 55)),
            RgbKey(1, FromRgb(35, 35, 47))
        }
        })

        Library:ApplyTheme(UIGradient, "Contrast", "Color") 
        
        local Text = Library:Create("TextLabel", {
            Parent = WindowHolder,
            Name = "",
            FontFace = Library.Font,
            TextColor3 = Library.Themes.Preset.Text,
            BorderColor3 = FromRgb(0, 0, 0),
            Text = Cfg.Name,
            BackgroundTransparency = 1,
            Position = Dim2(0, 2, 0, 4),
            BorderSizePixel = 0,
            AutomaticSize = Enum.AutomaticSize.XY,
            TextSize = 11,
            BackgroundColor3 = FromRgb(255, 255, 255)
        })
        
        local UIStroke = Library:Create("UIStroke", {
            Parent = Text,
            Name = "",
            LineJoinMode = Enum.LineJoinMode.Miter
        })
        
        local UIPadding = Library:Create("UIPadding", {
            Parent = WindowHolder,
            Name = "",
            PaddingBottom = NewDim(0, 4),
            PaddingRight = NewDim(0, 4),
            PaddingLeft = NewDim(0, 4)
        })
        
        local Outline = Library:Create("Frame", {
            Parent = WindowHolder,
            Name = "",
            Position = Dim2(0, 0, 0, 18),
            BorderColor3 = FromRgb(0, 0, 0),
            Size = Dim2(1, 0, 1, -18),
            BorderSizePixel = 0,
            BackgroundColor3 = Library.Themes.Preset.Inline
        })
        
        Library:ApplyTheme(Outline, "Inline", "BackgroundColor3") 
        
        local Inline = Library:Create("Frame", {
            Parent = Outline,
            Name = "",
            Position = Dim2(0, 1, 0, 1),
            BorderColor3 = FromRgb(0, 0, 0),
            Size = Dim2(1, -2, 1, -2),
            BorderSizePixel = 0,
            BackgroundColor3 = Library.Themes.Preset.Outline
        })
        
        Library:ApplyTheme(Inline, "Outline", "BackgroundColor3") 
        
        local Holder = Library:Create("Frame", {
            Parent = Inline,
            Name = "",
            Position = Dim2(0, 1, 0, 1),
            BorderColor3 = FromRgb(0, 0, 0),
            Size = Dim2(1, -2, 1, -2),
            BorderSizePixel = 0,
            BackgroundColor3 = FromRgb(255, 255, 255)
        })
        
        local UIGradient = Library:Create("UIGradient", {
            Parent = Holder,
            Name = "",
            Rotation = 90,
            Color = RgbSeq{
                RgbKey(0, FromRgb(41, 41, 55)),
                RgbKey(1, FromRgb(35, 35, 47))
            }
        })
        
        Library:ApplyTheme(UIGradient, "Contrast", "Color") 
        
        local UIPadding = Library:Create("UIPadding", {
            Parent = Holder,
            Name = "",
            PaddingTop = NewDim(0, 5),
            PaddingBottom = NewDim(0, 5),
            PaddingRight = NewDim(0, 5),
            PaddingLeft = NewDim(0, 5)
        })
        
        local Glow = Library:Create("ImageLabel", {
            Parent = MainHolder,
            Name = "",
            ImageColor3 = Library.Themes.Preset.Glow,
            ScaleType = Enum.ScaleType.Slice,
            BorderColor3 = FromRgb(0, 0, 0),
            BackgroundColor3 = FromRgb(255, 255, 255),
            Visible = true,
            Image = "http://www.roblox.com/asset/?id=18245826428",
            BackgroundTransparency = 1,
            ImageTransparency = .75,  
            Position = Dim2(0, -20, 0, -20),
            Size = Dim2(1, 40, 1, 40),
            ZIndex = 2,
            BorderSizePixel = 0,
            SliceCenter = NewRect(NewVect2(21, 21), NewVect2(79, 79))
        })Library:ApplyTheme(Glow, "Glow", "ImageColor3") 
        
        return Holder, SGui      
    end 

    local SGui = Library:Create("ScreenGui", {
        Enabled = true,
        Parent = gethui(),
        Name = "",
        DisplayOrder = 2, 
    })

    function Library:FoldElements(origin, elements)
        for _, x in next, elements do 
            local Flag = Library.VisibleFlags[x]

            if Flag then    
                Flag(Flags[origin])
            end     
        end 
    end 

    function Library:Window(properties)
        local Window = {}
        -- local ButtonHolder  
        
        local function CreateDockButton(Options) 
            local Cfg = {
                Image = Options.Image or "rbxAssetId://79856374238119",
                Open = Options.Open or true,
                Callback = Options.Callback or function() end
            }
    
            local Button = Library:Create("TextButton", {
                Parent = ButtonHolder,
                Name = "",
                FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
                TextColor3 = FromRgb(0, 0, 0),
                BorderColor3 = FromRgb(0, 0, 0),
                Text = "",
                Size = Dim2(0, 25, 0, 25),
                BorderSizePixel = 0,
                TextSize = 14,
                BackgroundColor3 = Library.Themes.Preset.Inline
            })
            
            local ButtonInline = Library:Create("Frame", {
                Parent = Button,
                Name = "",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Outline
            })Library:ApplyTheme(ButtonInline, "Outline", "BackgroundColor3") 
            
            local ButtonInline = Library:Create("Frame", {
                Parent = ButtonInline,
                Name = "",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })Library:ApplyTheme(ButtonInline, "Inline", "BackgroundColor3")
            
            local UIGradient = Library:Create("UIGradient", {
                Parent = ButtonInline,
                Name = "",
                Rotation = 90,
                Color = RgbSeq{
                RgbKey(0, FromRgb(35, 35, 47)),
                RgbKey(1, FromRgb(41, 41, 55))
            }
            })Library:ApplyTheme(UIGradient, "Contrast", "Color") 
            
            local ImageLabel = Library:Create("ImageLabel", {
                Parent = ButtonInline,
                Name = "",
                ImageColor3 = Library.Themes.Preset.Accent,
                Image = "rbxAssetId://79856374238119",
                BackgroundTransparency = 1,
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, 0, 1, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })Library:ApplyTheme(ImageLabel, "Accent", "ImageColor3") 
            
            local UIPadding = Library:Create("UIPadding", {
                Parent = ButtonInline,
                Name = "",
                PaddingTop = NewDim(0, 4),
                PaddingBottom = NewDim(0, 4),
                PaddingRight = NewDim(0, 4),
                PaddingLeft = NewDim(0, 4)
            })
    
            Button.MouseButton1Click:Connect(function()
                Cfg.Open = not Cfg.Open 
    
                Cfg.Callback(Cfg.Open) 
            end)
        end 
        -- main Window
            local Holder, Path = Library:Panel({
                Name = properties and properties.Name or "Akira.lol", 
                Size = Dim2(0, 604, 0, 628),
                Position = Dim2(0, (Camera.ViewportSize.X / 2) - 604/2, 0, (Camera.ViewportSize.Y / 2) - 628/2),
            }) 

             CreateDockButton({
                 Image = "rbxAssetId://100959383267514",
                 Callback = function(Open)
                     Path.Enabled = Open 
                 end 
             })

            Window["TabHolder"] = Library:Create("Frame", {
                Parent = Holder,
                Name = " ",
                BackgroundTransparency = 1,
                Size = Dim2(1, 0, 0, 22),
                BorderColor3 = FromRgb(0, 0, 0),
                ZIndex = 5,
                BorderSizePixel = 0,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })

            Library:Create("UIListLayout", {
                Parent = Window["TabHolder"],
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalFlex = Enum.UIFlexAlignment.Fill,
                Padding = NewDim(0, 2),
                SortOrder = Enum.SortOrder.LayoutOrder
            })

            local SectionHolder = Library:Create("Frame", {
                Parent = Holder,
                Name = " ",
                BackgroundTransparency = 1,
                Position = Dim2(0, -1, 0, 19),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, 0, 1, -22),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            Window["SectionHolder"] = SectionHolder

            local Outline = Library:Create("Frame", {
                Parent = SectionHolder,
                Name = "\0",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, 0, 1, 2),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Outline
            })
            
            Library:ApplyTheme(Outline, "Outline", "BackgroundColor3") 

            local Inline = Library:Create("Frame", {
                Parent = Outline,
                Name = "\0",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Inline
            })
            
            Library:ApplyTheme(Inline, "Inline", "BackgroundColor3") 

            local Background = Library:Create("Frame", {
                Parent = Inline,
                Name = "\0",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })

            Library.SectionHolder = Background

            Library:Create("UIPadding", {
                Parent = Background,
                PaddingTop = NewDim(0, 4),
                PaddingBottom = NewDim(0, 4),
                PaddingRight = NewDim(0, 4),
                PaddingLeft = NewDim(0, 4)
            })

            local UIGradient = Library:Create("UIGradient", {
                Parent = Background,
                Rotation = 90,
                Color = RgbSeq{
                    RgbKey(0, FromRgb(41, 41, 55)),
                    RgbKey(1, FromRgb(35, 35, 47))
                }
            })
            
            Library:ApplyTheme(UIGradient, "Contrast", "Color") 

            Library:Resizeable(Path:FindFirstChildOfClass("Frame")) 
        -- 

        -- Keybind List       
            local Outline = Library:Create("Frame", {
                Parent = SGui,
                Name = "",
                Visible = false, 
                Active = true,
                Draggable = true, 
                Position = Dim2(0, 50, 0, 200),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(0, 182, 0, 25),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Outline
            })
            Library:ApplyTheme(Outline, "Outline", "BackgroundColor3") 
            Library:DragThing(Outline)
            Library.KeybindListFrame = Outline 
            
            local Inline = Library:Create("Frame", {
                Parent = Outline,
                Name = "",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Inline
            })
            Library:ApplyTheme(Inline, "Inline", "BackgroundColor3")

            local Background = Library:Create("Frame", {
                Parent = Inline,
                Name = "",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            
            local UIGradient = Library:Create("UIGradient", {
                Parent = Background,
                Name = "",
                Rotation = 90,
                Color = RgbSeq{
                    RgbKey(0, Library.Themes.Preset.LowContrast),
                    RgbKey(1, Library.Themes.Preset.HighContrast)
                }
            })
            Library:ApplyTheme(UIGradient, "Contrast", "Color") 
            
            local bg = Library:Create("Frame", {
                Parent = Background,
                Name = "A",
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, 0, 0, 2),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Accent
            }); Library:ApplyTheme(bg, "Accent", "BackgroundColor3")
            
            
            Library:Create("UIGradient", {
                Parent = bg,
                Name = "",
                Enabled = true, 
                Rotation = 90,
                Color = RgbSeq{
                    RgbKey(0, FromRgb(255, 255, 255)),
                    RgbKey(1, FromRgb(167, 167, 167))
                }
            })
            
            local Text = Library:Create("TextLabel", {
                Parent = Background,
                Name = "",
                FontFace = Library.Font,
                TextColor3 = Library.Themes.Preset.Text,
                BorderColor3 = FromRgb(0, 0, 0),
                Text = "Keybinds",
                BackgroundTransparency = 1,
                TextTruncate = Enum.TextTruncate.AtEnd,
                Size = Dim2(1, 0, 1, 0),
                BorderSizePixel = 0,
                TextSize = 11,
                BackgroundColor3 = Library.Themes.Preset.Text
            }, "Text")
            
            local UIStroke = Library:Create("UIStroke", {
                Parent = Text,
                Name = "",
                LineJoinMode = Enum.LineJoinMode.Miter
            })
            
            local TextHolder = Library:Create("Frame", {
                Parent = Background,
                Name = "",
                Size = Dim2(0, 182, 0, 22),
                Position = Dim2(0, -2, 1, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundColor3 = Library.Themes.Preset.Outline
            })
            Library:ApplyTheme(TextHolder, "Outline", "BackgroundColor3")

            local Inline = Library:Create("Frame", {
                Parent = TextHolder,
                Name = "",
                Size = Dim2(1, -2, 1, -2),
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                BorderSizePixel = 0,
                --AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundColor3 = Library.Themes.Preset.Inline
            })
            Library:ApplyTheme(Inline, "Inline", "BackgroundColor3")
            
            local Background = Library:Create("Frame", {
                Parent = Inline,
                Name = "",
                Size = Dim2(1, -2, 1, -2),
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                BorderSizePixel = 0,
                --AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            Library.KeybindList = Background
            
            local UIGradient = Library:Create("UIGradient", {
                Parent = Background,
                Name = "",
                Rotation = 90,
                Color = RgbSeq{
                    RgbKey(0, Library.Themes.Preset.LowContrast),
                    RgbKey(1, Library.Themes.Preset.HighContrast)
                }
            })
            Library:ApplyTheme(UIGradient, "Contrast", "Color") 
            
            Library:Create("UIListLayout", {
                Parent = Background,
                Name = "",
                Padding = NewDim(0, -1),
                SortOrder = Enum.SortOrder.LayoutOrder
            })
            
            Library:Create("UIPadding", {
                Parent = Background,
                Name = "",
                PaddingBottom = NewDim(0, 4),
                PaddingLeft = NewDim(0, 5)
            })
            
        
        -- 

        --[[ dock innit
             local DockOutline = Library:Create("Frame", {
                 Parent = SGui,
                 Name = "",
                 Visible = true,
                 BorderColor3 = FromRgb(0, 0, 0),
                 AnchorPoint = NewVect2(.5, 0),
                 Position = Dim2(.5, 0, 0, 20),
                 Size = Dim2(0, 127, 0, 39),
                 BorderSizePixel = 0,
                 BackgroundColor3 = Library.Themes.Preset.Outline
             })Library:ApplyTheme(DockOutline, "Outline", "BackgroundColor3") 
            
             local DockInline = Library:Create("Frame", {
                 Parent = DockOutline,
                 Name = "",
                 Position = Dim2(0, 1, 0, 1),
                 BorderColor3 = FromRgb(0, 0, 0),
                 Size = Dim2(1, -2, 1, -2),
                 BorderSizePixel = 0,
                 BackgroundColor3 = Library.Themes.Preset.Inline
             })Library:ApplyTheme(DockInline, "Inline", "BackgroundColor3") 
            
             local DockHolder = Library:Create("Frame", {
                 Parent = DockInline,
                 Name = "",
                 Size = Dim2(1, -2, 1, -2),
                 Position = Dim2(0, 1, 0, 1),
                 BorderColor3 = Library.Themes.Preset.Outline,
                 BorderSizePixel = 0,
                 BackgroundColor3 = FromRgb(255, 255, 255)
             })Library:ApplyTheme(DockHolder, "Outline", "BackgroundColor3") 
            
             local Accent = Library:Create("Frame", {
                 Parent = DockHolder,
                 Name = "",
                 Size = Dim2(1, 0, 0, 2),
                 BorderColor3 = FromRgb(0, 0, 0),
                 BorderSizePixel = 0,
                 BackgroundColor3 = Library.Themes.Preset.Accent
             })Library:ApplyTheme(Accent, "Accent", "BackgroundColor3") 
            
             local UIGradient = Library:Create("UIGradient", {
                 Parent = Accent,
                 Name = "",
                 Rotation = 90,
                 Color = RgbSeq{
                 RgbKey(0, FromRgb(255, 255, 255)),
                 RgbKey(1, FromRgb(167, 167, 167))
             }
             })
            
             ButtonHolder = Library:Create("Frame", {
                 Parent = DockHolder,
                 Name = "",
                 BackgroundTransparency = 1,
                 Size = Dim2(1, 0, 1, 0),
                 BorderColor3 = FromRgb(0, 0, 0),
                 BorderSizePixel = 0,
                 BackgroundColor3 = FromRgb(255, 255, 255)
             })
            
             local UIListLayout = Library:Create("UIListLayout", {
                 Parent = ButtonHolder,
                 Name = "",
                 Padding = NewDim(0, 5),
                 FillDirection = Enum.FillDirection.Horizontal,
                 SortOrder = Enum.SortOrder.LayoutOrder
             })
            
             local UIPadding = Library:Create("UIPadding", {
                 Parent = ButtonHolder,
                 Name = "",
                 PaddingTop = NewDim(0, 6),
                 PaddingBottom = NewDim(0, 4),
                 PaddingRight = NewDim(0, 4),
                 PaddingLeft = NewDim(0, 4)
             })
                    
             local UIGradient = Library:Create("UIGradient", {
                 Parent = DockHolder,
                 Name = "",
                 Rotation = 90,
                 Color = RgbSeq{
                 RgbKey(0, FromRgb(41, 41, 55)),
                 RgbKey(1, FromRgb(35, 35, 47))
             }
             })Library:ApplyTheme(UIGradient, "Contrast", "Color") 
			]]

        	-- Esp Preview
            Window["EspPreview"], EspPreview = Library:Panel({
                Name = "Esp Preview", 
                AnchorPoint = NewVect2(-1, 0),
                Size = Dim2(0, 280, 0, 350),
                Position = Dim2(0, Holder.AbsolutePosition.X + Holder.AbsoluteSize.X + 10, 0, Holder.AbsolutePosition.Y - 22)
            }) 
				
            EspPreview.Enabled = false
            --   CreateDockButton({
                --   Image = "rbxAssetId://79856374238119",
                --   Callback = function(Open)
                --   EspPreview.Enabled = Open 
                --   end 
            --   })

             local UIGradient = Library:Create("UIGradient", {
                 Parent = Holder,
                 Name = "",
                 Rotation = 90,
                 Color = RgbSeq{
                     RgbKey(0, FromRgb(41, 41, 55)),
                     RgbKey(1, FromRgb(35, 35, 47))
                 }
             })Library:ApplyTheme(UIGradient, "Contrast", "Color") 
            
             local UIPadding = Library:Create("UIPadding", {
                 Parent = Holder,
                 Name = "",
                 PaddingTop = NewDim(0, 5),
                 PaddingBottom = NewDim(0, 5),
                 PaddingRight = NewDim(0, 5),
                 PaddingLeft = NewDim(0, 5)
             })
            
             local Glow = Library:Create("ImageLabel", {
                 Parent = ConfigOutline,
                 Name = "",
                 ImageColor3 = Library.Themes.Preset.Accent,
                 ScaleType = Enum.ScaleType.Slice,
                 BorderColor3 = FromRgb(0, 0, 0),
                 BackgroundColor3 = FromRgb(255, 255, 255),
                 Visible = true,
                 Image = "http://www.roblox.com/asset/?id=18245826428",
                 BackgroundTransparency = 1,
                 ImageTransparency = .75,  
                 Position = Dim2(0, -20, 0, -20),
                 Size = Dim2(1, 40, 1, 40),
                 ZIndex = 2,
                 BorderSizePixel = 0,
                 SliceCenter = NewRect(NewVect2(21, 21), NewVect2(79, 79))
             })Library:ApplyTheme(Glow, "Glow", "ImageColor3") 
            
        -- -- 

        --[[ -- Playerlist 
             Window["Playerlist"], PlayerlistGui = Library:Panel({
                 Name = "Playerlist", 
                 AnchorPoint = NewVect2(-1, 0),
                 Size = Dim2(0, 385, 0, 399),
                 Position = Dim2(0, Holder.AbsolutePosition.X - 395, 0, Holder.AbsolutePosition.Y - 22)
             })    
            
             CreateDockButton({
                 Image = "rbxAssetId://115194686863276",
                 Callback = function(Open)
                     PlayerlistGui.Enabled = Open 
                 end 
             })
          ]]
        
         -- theming 
        --     Window["Library.Themes"], Library.ThemesGui = Library:Panel({
        --         Name = "Style", 
        --         AnchorPoint = NewVect2(-1, 0),
        --         Size = Dim2(0, 322, 0, 391),
        --         Position = Dim2(0, Window["EspPreview"].AbsolutePosition.X + Window["EspPreview"].AbsoluteSize.X + 10, 0, Window["EspPreview"].AbsolutePosition.Y - 22)
        --     })   

        --     CreateDockButton({
        --         Image = "rbxAssetId://115194686863276",
        --         Callback = function(Open)
        --             Library.ThemesGui.Enabled = Open 
        --         end 
        --     })
        -- -- 
        
        function Window.UpdateMenuVisibility(bool) 
            Path.Enabled = bool 
            ToolTipSGui.Enabled = bool

            if Library.CurrentElementOpen then 
                Library.CurrentElementOpen.SetVisible(false)
                Library.CurrentElementOpen.Open = false 
                Library.CurrentElementOpen = nil 
            end

            for _, V in ToolTipSGui:GetChildren() do 
                V.Visible = false
            end 
        end 

        return setmetatable(Window, Library)
    end

    function Library:Watermark(Options) 
        local Cfg = {
            Default = Options.Text or Options.Default or os.date('Akira.lol | %b %d %Y | %H:%M')
        }

        local WatermarkOutline = Library:Create("Frame", {
            Parent = SGui,
            Name = "",
            BorderColor3 = FromRgb(0, 0, 0),
            AnchorPoint = NewVect2(1, 1),
            Position = Dim2(1, -20, 0, 20),
            Size = Dim2(0, 0, 0, 24),
            BorderSizePixel = 0,
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundColor3 = Library.Themes.Preset.Outline
        })Library:ApplyTheme(WatermarkOutline, "Outline", "BackgroundColor3") 
        WatermarkOutline.Position = DimOffset(WatermarkOutline.AbsolutePosition.X, WatermarkOutline.AbsolutePosition.Y)
        Library:DragThing(WatermarkOutline)

        local WatermarkInline = Library:Create("Frame", {
            Parent = WatermarkOutline,
            Name = "",
            Position = Dim2(0, 1, 0, 1),
            BorderColor3 = FromRgb(0, 0, 0),
            Size = Dim2(1, -2, 1, -2),
            BorderSizePixel = 0,
            BackgroundColor3 = Library.Themes.Preset.Inline
        })Library:ApplyTheme(WatermarkInline, "Inline", "BackgroundColor3") 
        
        local WatermarkBackground = Library:Create("Frame", {
            Parent = WatermarkInline,
            Name = "",
            Position = Dim2(0, 1, 0, 1),
            BorderColor3 = FromRgb(0, 0, 0),
            Size = Dim2(1, -2, 1, -2),
            BorderSizePixel = 0,
            BackgroundColor3 = FromRgb(255, 255, 255)
        })
        
        local UIGradient = Library:Create("UIGradient", {
            Parent = WatermarkBackground,
            Name = "",
            Rotation = 90,
            Color = RgbSeq{
                RgbKey(0, FromRgb(41, 41, 55)),
                RgbKey(1, FromRgb(35, 35, 47))
            }
        })Library:ApplyTheme(UIGradient, "Contrast", "Color") 
        
        local Text = Library:Create("TextLabel", {
            Parent = WatermarkBackground,
            Name = "",
            FontFace = Library.Font,
            TextColor3 = Library.Themes.Preset.Text,
            BorderColor3 = FromRgb(0, 0, 0),
            Text = "",
            Size = Dim2(0, 0, 1, 0),
            BackgroundTransparency = 1,
            Position = Dim2(0, -1, 0, 1),
            BorderSizePixel = 0,
            AutomaticSize = Enum.AutomaticSize.X,
            TextSize = 11,
            BackgroundColor3 = FromRgb(255, 255, 255)
        })
        
        Library:Create("UIStroke", {
            Parent = Text,
            Name = "",
            LineJoinMode = Enum.LineJoinMode.Miter
        })
        
        local Accent = Library:Create("Frame", {
            Parent = WatermarkOutline,
            Name = "",
            Position = Dim2(0, 2, 0, 2),
            BorderColor3 = FromRgb(0, 0, 0),
            Size = Dim2(1, -4, 0, 2),
            BorderSizePixel = 0,
            BackgroundColor3 = Library.Themes.Preset.Accent
        })Library:ApplyTheme(Accent, "Accent", "BackgroundColor3") 
        
        local UIGradient = Library:Create("UIGradient", {
            Parent = Accent,
            Name = "",
            Rotation = 90,
            Color = RgbSeq{
                RgbKey(0, FromRgb(255, 255, 255)),
                RgbKey(1, FromRgb(167, 167, 167))
            }
        })
        
        function Cfg.UpdateText(Input)
            Text.Text = "  ".. Input .."  "
        end 

        function Cfg.SetVisible(bool) 
            WatermarkOutline.Visible = bool
        end 

        Cfg.UpdateText(Cfg.Default)

        return Cfg 

    end 

    local NotificationHolder = Library:Create("ScreenGui", {
        Parent = gethui(),
        Name = "",
        IgnoreGuiInset = true, 
        DisplayOrder = -1, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    })

    function Library:RefreshNotifications()  	
        for _, notif in next, Library.Notifications do 
            TweenService:Create(notif, TweenInfo.new(.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {Position = Dim2(0, 20, 0, 72 + (_ * 28))}):Play()
        end     
    end

    function Library:Notification(properties)
        local Cfg = {
            Time = properties.Time or 5,
            Text = properties.Text or properties.Name or "Notification",
            Flashing = false, 
        }
    
        -- Instances
            local WatermarkOutline = Library:Create("Frame", {
                Parent = NotificationHolder,
                Name = "",
                Size = Dim2(0, 0, 0, 24),
                BorderColor3 = FromRgb(0, 0, 0),
                BorderSizePixel = 0,
                Position = Dim2(0, 20, 0, 72 + (#Library.Notifications * 28)),
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundColor3 = Library.Themes.Preset.Outline,
                AnchorPoint = NewVect2(1, 0)
            })
        
            local WatermarkInline = Library:Create("Frame", {
                Parent = WatermarkOutline,
                Name = "",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Inline
            })

            local WatermarkBackground = Library:Create("Frame", {
                Parent = WatermarkInline,
                Name = "",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
    
            local UIGradient = Library:Create("UIGradient", {
                Parent = WatermarkBackground,
                Name = "",
                Color = ColorSequence.new{
                    RgbKey(0, Library.Themes.Preset.LowContrast),
                    RgbKey(1, Library.Themes.Preset.HighContrast)
                }
            })
    
            local Text = Library:Create("TextLabel", {
                Parent = WatermarkBackground,
                Name = "",
                FontFace = Library.Font,
                TextColor3 = Library.Themes.Preset.Text,
                BorderColor3 = FromRgb(0, 0, 0),
                Text = "  " .. Cfg.Text .. "  ",
                Size = Dim2(0, 0, 1, 0),
                BackgroundTransparency = 1,
                Position = Dim2(0, 0, 0, -1),
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.X,
                TextSize = 11,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
    
            local Accent = Library:Create("Frame", {
                Parent = WatermarkOutline,
                Name = "",
                Position = Dim2(0, 2, 0, 2),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(0, 1, 1, -4),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Accent
            })

            Library:ApplyTheme(Accent, "Accent", "BackgroundColor3")
    
            local UIGradient = Library:Create("UIGradient", {
                Parent = Accent,
                Name = "",
                Rotation = 90,
                Color = ColorSequence.new{
                    RgbKey(0, FromRgb(255, 255, 255)),
                    RgbKey(1, FromRgb(167, 167, 167))
                }
            })
            
            local AccentBottom = Library:Create("Frame", {
                Parent = WatermarkOutline,
                Name = "",
                Position = Dim2(0, 2, 1, -3),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(0, -4, 0, 1),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Accent
            })
            
            local UIGradient = Library:Create("UIGradient", {
                Parent = Accent,
                Name = "",
                Rotation = 90,
                Color = ColorSequence.new{
                    RgbKey(0, FromRgb(255, 255, 255)),
                    RgbKey(1, FromRgb(167, 167, 167))
                }
            })

            local index = #Library.Notifications + 1
            Library.Notifications[index] =WatermarkOutline

            Library:RefreshNotifications()

            TweenService:Create(WatermarkOutline, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {AnchorPoint = NewVect2(0, 0)}):Play()
            
            TweenService:Create(AccentBottom, TweenInfo.new(Cfg.Time, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Size = Dim2(1, -4, 0, 1)}):Play()
        --
        
        Spawn(function()
            Wait(Cfg.Time)

            Library.Notifications[index] = nil

            TweenService:Create(WatermarkOutline, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {AnchorPoint = NewVect2(1, 0), BackgroundTransparency = 1}):Play()
            
            for _, V in next, WatermarkOutline:GetDescendants() do 
                if V:IsA("TextLabel") then 
                    TweenService:Create(V, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {TextTransparency = 1}):Play()
                elseif V:IsA("Frame") then 
                    TweenService:Create(V, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {BackgroundTransparency = 1}):Play()
                elseif V:IsA("ImageLabel") then
                    TweenService:Create(V, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {ImageTransparency = 1}):Play()
                elseif V:IsA("UIStroke") then 
                    TweenService:Create(V, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Transparency = 1}):Play()
                end 
            end 

            Wait(1)

            WatermarkOutline:Destroy()
        end)    
    end 

    function Library:tab(Options)	
        local Cfg = {
            Name = Options.Name or "tab", 
            Enabled = false, 
        }
        
        -- Button instances
            local TabHolder = Library:Create("TextButton", {
                Parent = self.TabHolder,
                FontFace = Library.Font,
                TextColor3 = Library.Themes.Preset.Text,
                BorderColor3 = FromRgb(0, 0, 0),
                Text = "",
                Name = "\0",
                BorderSizePixel = 0,
                Size = Dim2(0, 0, 1, -2),
                ZIndex = 5,
                TextSize = 11,
                BackgroundColor3 = Library.Themes.Preset.Outline,
                AutoButtonColor = false
            })Library:ApplyTheme(TabHolder, "Outline", "BackgroundColor3") 

            local Inline = Library:Create("Frame", {
                Parent = TabHolder,
                Size = Dim2(1, -2, 1, 0),
                Name = "\0",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                ZIndex = 5,
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Inline
            })Library:ApplyTheme(Inline, "Inline", "BackgroundColor3") 

            local Background = Library:Create("Frame", {
                Parent = Inline,
                Size = Dim2(1, -2, 1, -1),
                Name = "\0",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                ZIndex = 5,
                BorderSizePixel = 0,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })

            local UIGradient = Library:Create("UIGradient", {
                Parent = Background,
                Rotation = 90,
                Color = RgbSeq{RgbKey(0, FromRgb(41, 41, 55)), RgbKey(1, FromRgb(35, 35, 47))}
            })Library:ApplyTheme(UIGradient, "Contrast", "Color") 

            local Text = Library:Create("TextLabel", {
                Parent = Background,
                FontFace = Library.Font,
                TextColor3 = Library.Themes.Preset.Text,
                BorderColor3 = FromRgb(0, 0, 0),
                Text = Cfg.Name,
                Name = "\0",
                BackgroundTransparency = 1,
                Size = Dim2(1, 0, 1, 0),
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.X,
                TextSize = 11,
                ZIndex = 5,
                BackgroundColor3 = FromRgb(255, 255, 255)
            }, "Text")
            Library:ApplyTheme(Text, "Accent", "TextColor3")
        -- 

        -- Section instances 
            local SectionHolder = Library:Create("Frame", {
                Parent = Library.SectionHolder,
                BackgroundTransparency = 1,
                Name = "\0",
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, 0, 1, 0),
                BorderSizePixel = 0,
                Visible = false,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
        
            Cfg["Holder"] = SectionHolder

            Library:Create("UIListLayout", {
                Parent = SectionHolder,
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalFlex = Enum.UIFlexAlignment.Fill,
                Padding = NewDim(0, 4),
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        -- 

        function Cfg.OpenTab()
            if Library.CurrentTab and Library.CurrentTab[1] ~= Background then 
                local Button = Library.CurrentTab[1]
                Button.Size = Dim2(1, -2, 1, -1)
                Button:FindFirstChildOfClass("UIGradient").Rotation = 90
                Button:FindFirstChildOfClass("TextLabel").TextColor3 = Library.Themes.Preset.Text
                    
                Library.CurrentTab[2].Visible = false
                
                Library.CurrentTab = nil
            end
            
            Library.CurrentTab = {
                Background, SectionHolder
            }
            
            local Button = Library.CurrentTab[1] 
            Button.Size = Dim2(1, -2, 1, 0) -- ENABLED
            Button:FindFirstChildOfClass("UIGradient").Rotation = -90
            Button:FindFirstChildOfClass("TextLabel").TextColor3 = Library.Themes.Preset.Accent 

            Library.CurrentTab[2].Visible = true 

            if Library.CurrentElementOpen and Library.CurrentElementOpen ~= Cfg then 
                Library.CurrentElementOpen.SetVisible(false)
                Library.CurrentElementOpen.Open = false 
                Library.CurrentElementOpen = nil 
            end
        end
        
        TabHolder.MouseButton1Click:Connect(Cfg.OpenTab)
        
        return setmetatable(Cfg, Library) 
    end

    function Library:Column(Path) 
        local Cfg = {}
        
        local Holder = Path and self[Path] or self.Holder
        
        local Column = Library:Create("Frame", {
            Parent = Holder,
            BackgroundTransparency = 1,
            Name = "\0",
            BorderColor3 = FromRgb(0, 0, 0),
            Size = Dim2(1, 0, 1, 0),
            BorderSizePixel = 0,
            BackgroundColor3 = Library.Themes.Preset.Inline
        })Library:ApplyTheme(Column, "Inline", "BackgroundColor3") 
        
        Library:Create("UIListLayout", {
            Parent = Column,
            Padding = NewDim(0, 4),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalFlex = Enum.UIFlexAlignment.Fill
        })
        
        Cfg["Holder"] = Column

        return setmetatable(Cfg, Library) 
    end

    function Library:MultiSection(Options)
        local Cfg = {
            names = Options.names or {"First", "Second", "Third"}, 
            sections = {},
        }

        local Section = Library:Create("Frame", {
            Parent = self.Holder,
            Name = "",
            BorderColor3 = FromRgb(0, 0, 0),
            Size = Dim2(1, 0, 1, 0),
            BorderSizePixel = 0,
            BackgroundColor3 = Library.Themes.Preset.Inline
        }) Library:ApplyTheme(Section, "Inline", "BackgroundColor3")
        
        local Inline = Library:Create("Frame", {
            Parent = Section,
            Name = "",
            Position = Dim2(0, 1, 0, 1),
            BorderColor3 = FromRgb(0, 0, 0),
            Size = Dim2(1, -2, 1, -2),
            BorderSizePixel = 0,
            BackgroundColor3 = Library.Themes.Preset.Outline
        }) Library:ApplyTheme(Inline, "Outline", "BackgroundColor3") 
        
        local __background = Library:Create("Frame", {
            Parent = Inline,
            Name = "",
            ClipsDescendants = true,
            Position = Dim2(0, 1, 0, 1),
            BorderColor3 = FromRgb(0, 0, 0),
            Size = Dim2(1, -2, 1, -2),
            BorderSizePixel = 0,
            ZIndex = 1,
            BackgroundColor3 = FromRgb(255, 255, 255)
        })
        
        local Accent = Library:Create("Frame", {
            Parent = __background,
            Name = "",
            Size = Dim2(1, 0, 0, 2),
            BorderColor3 = FromRgb(0, 0, 0),
            ZIndex = 3,
            BorderSizePixel = 0,
            BackgroundColor3 = Library.Themes.Preset.Accent
        }) Library:ApplyTheme(Accent, "Accent", "BackgroundColor3")
        
        local UIGradient = Library:Create("UIGradient", {
            Parent = Accent,
            Name = "",
            Rotation = 90,
            Color = RgbSeq{RgbKey(0, FromRgb(255, 255, 255)), RgbKey(1, FromRgb(167, 167, 167))}
        }) 
        
        local UIGradient = Library:Create("UIGradient", {
            Parent = __background,
            Name = "",
            Rotation = 90,
            Color = RgbSeq{RgbKey(0, FromRgb(41, 41, 55)), RgbKey(1, FromRgb(35, 35, 47))}
        }) Library:ApplyTheme(UIGradient, "Contrast", "Color") 
        
        local TabHolder = Library:Create("Frame", {
            Parent = __background,
            Name = "",
            ClipsDescendants = true,
            BackgroundTransparency = 1,
            Position = Dim2(0, -1, 0, 0),
            BorderColor3 = FromRgb(0, 0, 0),
            Size = Dim2(1, 2, 0, 21),
            BorderSizePixel = 0,
            BackgroundColor3 = FromRgb(255, 255, 255)
        }) 
        
        Library:Create("UIListLayout", {
            Parent = TabHolder,
            Name = "",
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalFlex = Enum.UIFlexAlignment.Fill,
            Padding = NewDim(0, -3),
            SortOrder = Enum.SortOrder.LayoutOrder
        })
        
        for _, tab in next, Cfg.names do 
            local Multi = {
                Open = false, 
            } 

            -- Tab
                local tabb = Library:Create("TextButton", {
                    Parent = TabHolder,
                    Name = "",
                    AutoButtonColor = false,
                    FontFace = Library.Font,
                    TextColor3 = Library.Themes.Preset.Text,
                    BorderColor3 = FromRgb(0, 0, 0),
                    Text = "",
                    BorderSizePixel = 0,
                    Size = Dim2(0, 0, 1, 0),
                    ZIndex = 1,
                    TextSize = 11,
                    BackgroundColor3 = Library.Themes.Preset.Outline
                }) Library:ApplyTheme(tabb, "Outline", "BackgroundColor3") 
                
                local Background = Library:Create("Frame", {
                    Parent = tabb,
                    Name = "",
                    Size = Dim2(1, 0, 1, -2),
                    Position = Dim2(0, 1, 0, 1),
                    BorderColor3 = FromRgb(0, 0, 0),
                    ZIndex = 1,
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRgb(255, 255, 255)
                })
                
                local UIGradient = Library:Create("UIGradient", {
                    Parent = Background,
                    Name = "",
                    Rotation = 90,
                    Color = RgbSeq{RgbKey(0, FromRgb(41, 41, 55)), RgbKey(1, FromRgb(35, 35, 47))}
                }) Library:ApplyTheme(UIGradient, "Contrast", "Color")
                
                local Text = Library:Create("TextLabel", {
                    Parent = Background,
                    Name = "",
                    FontFace = Library.Font,
                    TextColor3 = Library.Themes.Preset.Text,
                    BorderColor3 = FromRgb(0, 0, 0),
                    Text = tab,
                    BackgroundTransparency = 1,
                    Size = Dim2(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X,
                    TextSize = 11,
                    BackgroundColor3 = FromRgb(255, 255, 255)
                }) 
                
                local UIStroke = Library:Create("UIStroke", {
                    Parent = Text,
                    Name = "",
                    LineJoinMode = Enum.LineJoinMode.Miter
                })
            -- 

            -- Element Handler
                local ScrollingFrame = Library:Create("ScrollingFrame", {
                    Parent = __background,
                    Name = "",
                    ScrollBarImageColor3 = Library.Themes.Preset.Accent,
                    Active = true,
                    AutomaticCanvasSize = Enum.AutomaticSize.Y,
                    ScrollBarThickness = 2,
                    Size = Dim2(1, 0, 1, -20),
                    Visible = false, 
                    BackgroundTransparency = 1,
                    Position = Dim2(0, 0, 0, 24),
                    BackgroundColor3 = FromRgb(255, 255, 255),
                    BorderColor3 = FromRgb(0, 0, 0),
                    BorderSizePixel = 0,
                    ScrollBarThickness = 2,
                    CanvasSize = Dim2(0, 0, 0, 0)
                }) Library:ApplyTheme(ScrollingFrame, "Accent", "ScrollBarImageColor3") 
                
                local elements = Library:Create("Frame", {
                    Parent = ScrollingFrame,
                    Name = "",
                    BorderColor3 = FromRgb(0, 0, 0),
                    Size = Dim2(1, 0, 0, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRgb(255, 255, 255)
                }) Multi.Holder = elements
                
                local UIListLayout = Library:Create("UIListLayout", {
                    Parent = elements,
                    Name = "",
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    Padding = NewDim(0, 4)
                })
                
                local UIPadding = Library:Create("UIPadding", {
                    Parent = ScrollingFrame,
                    Name = "",
                    PaddingBottom = NewDim(0, 60)
                })
            --
            
            function Multi:OpenTab(bool) 
                ScrollingFrame.Visible = bool 
                UIGradient.Rotation = bool and -90 or 90
                tabb.Size = Dim2(0, 0, 1, bool and 1 or 0)
            end

            Library:Connection(tabb.MouseButton1Click, function()
                for _, MultiS in next, Cfg.sections do 
                    MultiS:OpenTab(false)
                end

                if Library.CurrentElementOpen then 
                    Library.CurrentElementOpen.SetVisible(false)
                    Library.CurrentElementOpen.Open = false 
                    Library.CurrentElementOpen = nil 
                end

                Multi:OpenTab(true) 
            end)

            Cfg.sections[#Cfg.sections + 1] = setmetatable(Multi, Library)
        end 

        Cfg.sections[1]:OpenTab(true)

        return unpack(Cfg.sections)
    end 

    function Library:Section(Options)
        local Cfg = {
            Name = Options.Name or "Section", 
        }
        
        local Section = Library:Create("Frame", {
            Parent = self.Holder,
            Name = "\0",
            BorderColor3 = FromRgb(0, 0, 0),
            Size = Dim2(1, 0, 1, 0),
            BorderSizePixel = 0,
            BackgroundColor3 = Library.Themes.Preset.Inline
        })Library:ApplyTheme(Section, "Inline", "BackgroundColor3") 

        local Inline = Library:Create("Frame", {
            Parent = Section,
            Name = "\0",
            Position = Dim2(0, 1, 0, 1),
            BorderColor3 = FromRgb(0, 0, 0),
            Size = Dim2(1, -2, 1, -2),
            BorderSizePixel = 0,
            BackgroundColor3 = Library.Themes.Preset.Outline
        })Library:ApplyTheme(Inline, "Outline", "BackgroundColor3") 

        local Background = Library:Create("Frame", {
            Parent = Inline,
            Name = "\0",
            Position = Dim2(0, 1, 0, 1),
            BorderColor3 = FromRgb(0, 0, 0),
            Size = Dim2(1, -2, 1, -2),
            BorderSizePixel = 0,
            BackgroundColor3 = FromRgb(255, 255, 255)
        })

        local Text = Library:Create("TextLabel", {
            Parent = Background,
            FontFace = Library.Font,
            TextColor3 = Library.Themes.Preset.Text,
            BorderColor3 = FromRgb(0, 0, 0),
            Text = Cfg.Name,
            Name = "\0",
            BackgroundTransparency = 1,
            Position = Dim2(0, 6, 0, 4),
            BorderSizePixel = 0,
            AutomaticSize = Enum.AutomaticSize.XY,
            TextSize = 11,
            BackgroundColor3 = FromRgb(255, 255, 255)
        })

        Library:Create("UIStroke", {
            Parent = Text,
            LineJoinMode = Enum.LineJoinMode.Miter
        })

        local Accent = Library:Create("Frame", {
            Parent = Background,
            Name = "\0",
            BorderColor3 = FromRgb(0, 0, 0),
            Size = Dim2(1, 0, 0, 2),
            BorderSizePixel = 0,
            BackgroundColor3 = Library.Themes.Preset.Accent
        })Library:ApplyTheme(Accent, "Accent", "BackgroundColor3") 

        local UIGradient = Library:Create("UIGradient", {
            Parent = Accent,
            Rotation = 90,
            Color = RgbSeq{
                RgbKey(0, FromRgb(255, 255, 255)),
                RgbKey(1, FromRgb(167, 167, 167))
            }
        })

        local UIGradient = Library:Create("UIGradient", {
            Parent = Background,
            Rotation = 90,
            Color = RgbSeq{
                RgbKey(0, FromRgb(41, 41, 55)),
                RgbKey(1, FromRgb(35, 35, 47))
            }
        })Library:ApplyTheme(UIGradient, "Contrast", "Color") 

        local ScrollingFrame = Library:Create("ScrollingFrame", {
            Parent = Background,
            ScrollBarImageColor3 = Library.Themes.Preset.Accent,
            Active = true,
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            ScrollBarThickness = 2,
            Size = Dim2(1, 0, 1, -20),
            BackgroundTransparency = 1,
            Position = Dim2(0, 0, 0, 20),
            BackgroundColor3 = FromRgb(255, 255, 255),
            BorderColor3 = FromRgb(0, 0, 0),
            BorderSizePixel = 0,
            CanvasSize = Dim2(0, 0, 0, 0)
        })Library:ApplyTheme(ScrollingFrame, "Accent", "ScrollBarImageColor3") 

        ScrollingFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
            if Library.CurrentElementOpen then 
                Library.CurrentElementOpen.SetVisible(false)
                Library.CurrentElementOpen.Open = false 
                Library.CurrentElementOpen = nil
            end
        end) 

        local elements = Library:Create("Frame", {
            Parent = ScrollingFrame,
            Name = "\0",
            BorderColor3 = FromRgb(0, 0, 0),
            Size = Dim2(1, 0, 0, 0),
            BorderSizePixel = 0,
            BackgroundColor3 = FromRgb(255, 255, 255)
        })
        Cfg.Holder = elements 

        Library:Create("UIListLayout", {
            Parent = elements,
            Padding = NewDim(0, 4),
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder
        })

        Library:Create("UIPadding", {
            Parent = ScrollingFrame,
            PaddingBottom = NewDim(0, 10)
        })

        return setmetatable(Cfg, Library)
    end

    function Library:Slider(Options)
        local Cfg = {
            Name = Options.Name or nil,
            Suffix = Options.Suffix or "",
            Flag = Options.Flag or tostring(2^789),
            Callback = Options.Callback or function() end, 
            Visible = Options.Visible or true, 

            Min = Options.Min or Options.minimum or 0,
            max = Options.max or Options.maximum or 100,
            intervals = Options.Interval or Options.decimal or 1,
            Default = Options.Default or 10,

            Dragging = false,
            value = Options.Default or 10, 
        } 

        -- instances 
            local SliderREAL = Library:Create("TextLabel", {
                Parent = self.Holder, 
                FontFace = Library.Font,
                TextColor3 = Library.Themes.Preset.Text,
                BorderColor3 = FromRgb(0, 0, 0),
                Text = "",
                Name = "Slider",
                ZIndex = 2,
                Size = Dim2(1, -8, 0, 12),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                TextXAlignment = Enum.TextXAlignment.Left,
                AutomaticSize = Enum.AutomaticSize.Y,
                TextYAlignment = Enum.TextYAlignment.Top,
                TextSize = 11,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            
            local TextLABEL; 
            if Cfg.Name then 
                local LeftComponents = Library:Create("Frame", {
                    Parent = SliderREAL,
                    Name = "LeftComponents",
                    BackgroundTransparency = 1,
                    Position = Dim2(0, 2, 0, -1),
                    BorderColor3 = FromRgb(0, 0, 0),
                    Size = Dim2(0, 0, 0, 14),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRgb(255, 255, 255)
                })
                
                TextLABEL = Library:Create("TextLabel", {
                    Parent = LeftComponents,
                    FontFace = Library.Font,
                    TextColor3 = Library.Themes.Preset.Text,
                    BorderColor3 = FromRgb(0, 0, 0),
                    Text = Cfg.Name,
                    Name = "Text",
                    BackgroundTransparency = 1,
                    Size = Dim2(0, 0, 1, -1),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X,
                    TextSize = 11,
                    BackgroundColor3 = FromRgb(255, 255, 255)
                }, "Text")

                Library:Create("UIListLayout", {
                    Parent = LeftComponents,
                    Padding = NewDim(0, 5),
                    Name = "_",
                    FillDirection = Enum.FillDirection.Horizontal
                })
            end 
            
            local BottomComponents = Library:Create("Frame", {
                Parent = SliderREAL,
                Name = "BottomComponents",
                Position = Dim2(0, 0, 0, Cfg.Name and 15 or 0),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, 26, 0, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            
            local Slider = Library:Create("TextButton", {
                Parent = BottomComponents,
                Name = "Slider",
                Position = Dim2(0, 0, 0, 2),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -27, 1, 12),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Outline,
                Text = "",
                AutoButtonColor = false,
            })Library:ApplyTheme(Slider, "Outline", "BackgroundColor3") 
            
            local Inline = Library:Create("Frame", {
                Parent = Slider,
                Name = "Inline",
                Position = Dim2(0, 0, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -1, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Inline
            })Library:ApplyTheme(Inline, "Inline", "BackgroundColor3") 
            
            local Background = Library:Create("Frame", {
                Parent = Inline,
                Name = "Background",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Accent
            })Library:ApplyTheme(Background, "Accent", "BackgroundColor3") 
            
            local Contrast = Library:Create("Frame", {
                Parent = Background,
                Name = "Contrast",
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, 0, 1, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            
            local SliderText = Library:Create("TextLabel", {
                Parent = Contrast,
                FontFace = Library.Font,
                TextColor3 = Library.Themes.Preset.Text,
                BorderColor3 = FromRgb(0, 0, 0),
                Text = "12.50/100.00",
                Name = "Text",
                BackgroundTransparency = 1,
                Position = Dim2(0, 0, 0, -1),
                Size = Dim2(1, 0, 1, 0),
                BorderSizePixel = 0,
                TextSize = 11,
                ZIndex = 2,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            
            local Fill = Library:Create("Frame", {
                Parent = Contrast,
                Name = "Fill",
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(.75, 0, 1, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Accent
            })Library:ApplyTheme(Fill, "Accent", "BackgroundColor3") 
            
            local UIGradient = Library:Create("UIGradient", {
                Parent = Fill,
                Rotation = 90,
                Color = RgbSeq{
                    RgbKey(0, FromRgb(255, 255, 255)),
                    RgbKey(1, FromRgb(167, 167, 167))
                }
            })
            
            local UIGradient = Library:Create("UIGradient", {
                Parent = Contrast,
                Rotation = 90,
                Color = RgbSeq{
                    RgbKey(0, FromRgb(41, 41, 55)),
                    RgbKey(1, FromRgb(35, 35, 47))
                }
            }); Library:ApplyTheme(UIGradient, "Contrast", "Color")
            
            local UIGradient = Library:Create("UIGradient", {
                Parent = Background,
                Rotation = 90,
                Color = RgbSeq{
                    RgbKey(0, FromRgb(255, 255, 255)),
                    RgbKey(1, FromRgb(167, 167, 167))
                }
            })
            
            Library:Create("UIListLayout", {
                Parent = BottomComponents,
                Padding = NewDim(0, 10),
                Name = "_",
                SortOrder = Enum.SortOrder.LayoutOrder
            })
            
            Library:Create("UIPadding", {
                Parent = Slider,
                PaddingLeft = NewDim(0, 1)
            })
        --  

        function Cfg.Set(value)
            Cfg.value = Clamp(Library:Round(value, Cfg.intervals), Cfg.Min, Cfg.max)

            Fill.Size = Dim2((Cfg.value - Cfg.Min) / (Cfg.max - Cfg.Min), 0, 1, 0)
            SliderText.Text = tostring(Cfg.value) .. Cfg.Suffix .. "/" .. tostring(Cfg.max) .. Cfg.Suffix
            Flags[Cfg.Flag] = Cfg.value

            Cfg.Callback(Flags[Cfg.Flag])
        end

        function Cfg.SetElementVisible(bool)
            SliderREAL.Visible = bool 

            if TextLABEL then 
                TextLABEL.Visible = bool 
            end 
        end

        Library:Connection(InputService.InputChanged, function(Input)
            if Cfg.Dragging and Input.UserInputType == Enum.UserInputType.MouseMovement then 
                local SizeX = (Input.Position.X - Slider.AbsolutePosition.X) / Slider.AbsoluteSize.X
                local value = ((Cfg.max - Cfg.Min) * SizeX) + Cfg.Min
                Cfg.Set(value)
            end
        end)

        Library:Connection(InputService.InputEnded, function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                Cfg.Dragging = false 
            end 
        end)

        Slider.MouseButton1Down:Connect(function()
            Cfg.Dragging = true
        end)

        if Cfg.ToolTip then 
            Library:ToolTip({Name = Cfg.ToolTip, Path = SliderREAL})
        end

        Cfg.Set(Cfg.Default)
        Cfg.SetElementVisible(Cfg.Visible)
                
        ConfigFlags[Cfg.Flag] = Cfg.Set

        Library.ConfigFlags[Cfg.Flag] = Cfg.Set
        Library.VisibleFlags[Cfg.Flag] = Cfg.SetElementVisible

        return setmetatable(Cfg, Library) 
    end 

    function Library:Toggle(Options)
        local Cfg = {
            Enabled = Options.Enabled or nil,
            Name = Options.Name or "Toggle",
            Flag = Options.Flag or tostring(random(1,9999999)),
            Callback = Options.Callback or function() end,
            Default = Options.Default or false,
            Colorpicker = Options.NewColor or nil,
            Visible = Options.Visible or true,
            ToolTip = Options.ToolTip or nil,
        }
        
        -- instances
            local ToggleHolder = Library:Create("TextButton", {
                Parent = self.Holder,
                FontFace = Library.Font,
                TextColor3 = FromRgb(151, 151, 151),
                BorderColor3 = FromRgb(0, 0, 0),
                Text = "",
                Name = "Toggle",
                ZIndex = 1,
                Size = Dim2(1, -8, 0, 12),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                TextXAlignment = Enum.TextXAlignment.Left,
                AutomaticSize = Enum.AutomaticSize.Y,
                TextYAlignment = Enum.TextYAlignment.Top,
                TextSize = 11,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
        
            local RightComponents = Library:Create("Frame", {
                Parent = ToggleHolder,
                Name = "RightComponents",
                Position = Dim2(1, -1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(0, 0, 0, 12),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            Cfg["RightHolder"] = RightComponents
        
            local List = Library:Create("UIListLayout", {
                Parent = RightComponents,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Right,
                Padding = NewDim(0, 4),
                Name = "List",
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        
            Library:Create("UIPadding", {
                Parent = ToggleHolder
            })
        
            local LeftComponents = Library:Create("Frame", {
                Parent = ToggleHolder,
                Name = "LeftComponents",
                BackgroundTransparency = 1,
                Position = Dim2(0, 0, 0, 0),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(0, 0, 0, 14),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            
            local Text = Library:Create("TextLabel", {
                Parent = LeftComponents,
                FontFace = Library.Font,
                TextColor3 = Library.Themes.Preset.Text,
                BorderColor3 = FromRgb(0, 0, 0),
                Text = Cfg.Name,
                Name = "Text",
                BackgroundTransparency = 1,
                Size = Dim2(0, 0, 1, -1),
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.X,
                TextSize = 11,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
        
            Library:Create("UIStroke", {
                Parent = Text,
                LineJoinMode = Enum.LineJoinMode.Miter
            })
        
            Library:Create("UIListLayout", {
                Parent = LeftComponents,
                Padding = NewDim(0, 5),
                Name = "_",
                FillDirection = Enum.FillDirection.Horizontal
            })
        
            local Toggle = Library:Create("TextButton", {
                Parent = LeftComponents,
                Name = "!Toggle",
                Text = "",
                AutoButtonColor = false,
                Position = Dim2(0, 0, 0, 2),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(0, 14, 0, 14),
                BorderSizePixel = 0,
                ZIndex = 1, 
                BackgroundColor3 = Library.Themes.Preset.Outline
            })Library:ApplyTheme(Toggle, "Outline", "BackgroundColor3") 
        
            local Inline = Library:Create("Frame", {
                Parent = Toggle,
                Name = "Inline",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Inline
            })Library:ApplyTheme(Inline, "Inline", "BackgroundColor3") 
        
            local Background = Library:Create("Frame", {
                Parent = Inline,
                Name = "Background",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Accent
            })
            Library:ApplyTheme(Background, "Accent", "BackgroundColor3") 
            Library:ApplyTheme(Background, "Accent", "BackgroundColor3") 
            
            local UIGradient = Library:Create("UIGradient", {
                Parent = Background,
                Rotation = 90,
                Color = RgbSeq{
                    RgbKey(0, FromRgb(255, 255, 255)),
                    RgbKey(1, FromRgb(167, 167, 167))
                }
            })
        -- 
            
        function Cfg.Set(bool)
            Background.BackgroundColor3 = bool and Library.Themes.Preset.Accent or Library.Themes.Preset.Inline
    
            Flags[Cfg.Flag] = bool
            
            Cfg.Callback(bool)
        end

        function Cfg.SetElementVisible(bool)
            ToggleHolder.Visible = bool 
        end 
    
        Library:Connection(ToggleHolder.MouseButton1Click, function()
            Cfg.Enabled = not Cfg.Enabled
    
            Cfg.Set(Cfg.Enabled)
        end)

        Library:Connection(Toggle.MouseButton1Click, function()
            Cfg.Enabled = not Cfg.Enabled
    
            Cfg.Set(Cfg.Enabled)
        end)

        if Cfg.ToolTip then 
            Library:ToolTip({Name = Cfg.ToolTip, Path = ToggleHolder})
        end

        Cfg.Set(Cfg.Default)
        
        Cfg.SetElementVisible(Cfg.Visible)
        
        Library.ConfigFlags[Cfg.Flag] = Cfg.Set
        Library.VisibleFlags[Cfg.Flag] = Cfg.SetElementVisible

        return setmetatable(Cfg, Library)
    end
    
    function Library:Colorpicker(Options)
        local parent = self.RightHolder
        
        local Cfg = {
            Name = Options.Name or "Color", 
            Flag = Options.Flag or tostring(2^789),
            NewColor = Options.NewColor or NewColor(1, 1, 1),
            Alpha = Options.Alpha or 0,
            Callback = Options.Callback or function() end,
            RightHolder = self.RightHolder,
        }

        local DraggingSat = false 
        local DraggingHue = false 
        local DraggingAlpha = false 

        local H, S, V = Cfg.NewColor:ToHSV() 
        local A = Cfg.Alpha 
        
        -- Colorpicker Button 
            local ColorpickerButton = Library:Create("TextButton", {
                Parent = parent,
                Name = "Outline",
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(0, 24, 0, 14),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Outline,
                Text = "",
                AutoButtonColor = false,
            })Library:ApplyTheme(ColorpickerButton, "Outline", "BackgroundColor3") 
        
            local Inline = Library:Create("Frame", {
                Parent = ColorpickerButton,
                Name = "Inline",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Inline
            })Library:ApplyTheme(Inline, "Inline", "BackgroundColor3") 
        
            local handler = Library:Create("Frame", {
                Parent = Inline,
                Name = "handler",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRgb(250, 165, 27)
            })
        
            local UIGradient = Library:Create("UIGradient", {
                Parent = handler,
                Rotation = 90,
                Color = RgbSeq{
                    RgbKey(0, FromRgb(255, 255, 255)),
                    RgbKey(1, FromRgb(167, 167, 167))
                }
            })
        -- 

        -- Colorpicker instances
            local ColorpickerHolder = Library:Create("Frame", {
                Parent = SGui,
                Name = "Colorpicker",
                Position = Dim2(0, ColorpickerButton.AbsolutePosition.X + 1, 0, ColorpickerButton.AbsolutePosition.Y + 17),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(0, 190, 0, 190),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Outline,
                Visible = false,
                ZIndex = 1
            })Library:ApplyTheme(ColorpickerHolder, "Outline", "BackgroundColor3") 

            Library:Resizeable(ColorpickerHolder)
            
            local WindowInline = Library:Create("Frame", {
                Parent = ColorpickerHolder,
                Name = "WindowInline",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Accent
            })Library:ApplyTheme(WindowInline, "Accent", "BackgroundColor3") 
            
            local WindowHolder = Library:Create("Frame", {
                Parent = WindowInline,
                Name = "WindowHolder",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = Library.Themes.Preset.Outline,
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            
            local UIGradient = Library:Create("UIGradient", {
                Parent = WindowHolder,
                Rotation = 90,
                Name = "_",
                Color = RgbSeq{
                RgbKey(0, FromRgb(41, 41, 55)),
                RgbKey(1, FromRgb(35, 35, 47))
            }
            })Library:ApplyTheme(UIGradient, "Contrast", "Color") 
            
            local Text = Library:Create("TextLabel", {
                Parent = WindowHolder,
                FontFace = Library.Font,
                TextColor3 = Library.Themes.Preset.Text,
                BorderColor3 = FromRgb(0, 0, 0),
                Text = Cfg.Name,
                Name = "Text",
                BackgroundTransparency = 1,
                Position = Dim2(0, 2, 0, 4),
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.XY,
                TextSize = 11,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            
            Library:Create("UIStroke", {
                Parent = Text,
                LineJoinMode = Enum.LineJoinMode.Miter
            })
            
            Library:Create("UIPadding", {
                Parent = WindowHolder,
                Name = "_",
                PaddingBottom = NewDim(0, 4),
                PaddingRight = NewDim(0, 4),
                PaddingLeft = NewDim(0, 4)
            })
            
            local MainHolder = Library:Create("Frame", {
                Parent = WindowHolder,
                Name = "MainHolder",
                Position = Dim2(0, 0, 0, 20),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, 0, 1, -20),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Inline
            })Library:ApplyTheme(MainHolder, "Inline", "BackgroundColor3") 
            
            local MainHolderInline = Library:Create("Frame", {
                Parent = MainHolder,
                Name = "MainHolderInline",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Outline
            })Library:ApplyTheme(MainHolderInline, "Outline", "BackgroundColor3") 
            
            local MainHolderBackground = Library:Create("Frame", {
                Parent = MainHolderInline,
                Name = "MainHolderBackground",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            
            local UIGradient = Library:Create("UIGradient", {
                Parent = MainHolderBackground,
                Rotation = 90,
                Name = "_",
                Color = RgbSeq{
                RgbKey(0, FromRgb(41, 41, 55)),
                RgbKey(1, FromRgb(35, 35, 47))
            }
            })Library:ApplyTheme(UIGradient, "Contrast", "Color") 
            
            Library:Create("UIPadding", {
                Parent = MainHolderBackground,
                PaddingTop = NewDim(0, 4),
                Name = "_",
                PaddingBottom = NewDim(0, 4),
                PaddingRight = NewDim(0, 4),
                PaddingLeft = NewDim(0, 4)
            })
            
            local Alpha = Library:Create("TextButton", {
                Parent = MainHolderBackground,
                AnchorPoint = NewVect2(0, .5),
                Name = "Alpha",
                Position = Dim2(0, 0, 1, -8),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -20, 0, 14),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Inline,
                Text = "",
                AutoButtonColor = false,
            })Library:ApplyTheme(Alpha, "Inline", "BackgroundColor3") 
            
            local Outline = Library:Create("Frame", {
                Parent = Alpha,
                Name = "Outline",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Outline
            })Library:ApplyTheme(Outline, "Outline", "BackgroundColor3") 
            
            local AlphaDrag = Library:Create("Frame", {
                Parent = Outline,
                Name = "AlphaDrag",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRgb(0, 221, 255)
            })
            
            local AlphaInd = Library:Create("ImageLabel", {
                Parent = AlphaDrag,
                ScaleType = Enum.ScaleType.Tile,
                BorderColor3 = FromRgb(0, 0, 0),
                Image = "rbxAssetId://18274452449",
                BackgroundTransparency = 1,
                Name = "AlphaInd",
                Size = Dim2(1, 0, 1, 0),
                TileSize = Dim2(0, 6, 0, 6),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            
            local UIGradient = Library:Create("UIGradient", {
                Parent = AlphaInd,
                Transparency = NumbSeq{
                    NumbKey(0, 0),
                    NumbKey(1, 1)
                }
            })
            
            local AlphaPicker = Library:Create("Frame", {
                Parent = AlphaDrag,
                Name = "AlphaPicker",
                BorderMode = Enum.BorderMode.Inset,
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(0, 4, 1, 0),
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            
            local Hue = Library:Create("TextButton", {
                Parent = MainHolderBackground,
                AnchorPoint = NewVect2(1, 0),
                Name = "Hue",
                Position = Dim2(1, -1, 0, 0),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(0, 14, 1, -20),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Inline,
                Text = "",
                AutoButtonColor = false
            })
            
            local Outline = Library:Create("Frame", {
                Parent = Hue,
                Name = "Outline",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Outline
            })
            
            local Frame = Library:Create("Frame", {
                Parent = Outline,
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            
            local UIGradient = Library:Create("UIGradient", {
                Parent = Frame,
                Rotation = 270,
                Color = RgbSeq{
                RgbKey(0, FromRgb(255, 0, 0)),
                RgbKey(.17000000178813934, FromRgb(255, 255, 0)),
                RgbKey(.33000001311302185, FromRgb(0, 255, 0)),
                RgbKey(.5, FromRgb(0, 255, 255)),
                RgbKey(.6700000166893005, FromRgb(0, 0, 255)),
                RgbKey(.8299999833106995, FromRgb(255, 0, 255)),
                RgbKey(1, FromRgb(255, 0, 0))
            }
            }) 
            
            local HuePicker = Library:Create("Frame", {
                Parent = Frame,
                Name = "HuePicker",
                BorderMode = Enum.BorderMode.Inset,
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, 0, 0, 4),
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            
            local Visualize = Library:Create("Frame", {
                Parent = MainHolderBackground,
                AnchorPoint = NewVect2(1, 1),
                Name = "Visualize",
                Position = Dim2(1, -1, 1, -1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(0, 14, 0, 14),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Inline
            })Library:ApplyTheme(Visualize, "Inline", "BackgroundColor3") 
            
            local Outline = Library:Create("Frame", {
                Parent = Visualize,
                Size = Dim2(1, -2, 1, -2),
                Name = "Outline",
                Active = true,
                BorderColor3 = FromRgb(0, 0, 0),
                Position = Dim2(0, 1, 0, 1),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Outline
            })Library:ApplyTheme(Outline, "Outline", "BackgroundColor3") 
            
            local Visualize = Library:Create("Frame", {
                Parent = Outline,
                Size = Dim2(1, -2, 1, -2),
                Name = "Visualize",
                Active = true,
                BorderColor3 = FromRgb(0, 0, 0),
                Position = Dim2(0, 1, 0, 1),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRgb(0, 221, 255)
            })
            
            local SatValPicker = Library:Create("Frame", {
                Parent = MainHolderBackground,
                Name = "SatValPicker",
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -20, 1, -20),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Inline
            })Library:ApplyTheme(SatValPicker, "Inline", "BackgroundColor3") 
            
            local Outline = Library:Create("Frame", {
                Parent = SatValPicker,
                Name = "Outline",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Outline
            })Library:ApplyTheme(Outline, "Outline", "BackgroundColor3") 
            
            local Colorpicker = Library:Create("Frame", {
                Parent = Outline,
                Name = "Colorpicker",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRgb(0, 221, 255)
            })
            
            local Sat = Library:Create("TextButton", {
                Parent = Colorpicker,
                Name = "Sat",
                Size = Dim2(1, 0, 1, 0),
                BorderColor3 = FromRgb(0, 0, 0),
                ZIndex = 2,
                BorderSizePixel = 0,
                BackgroundColor3 = FromRgb(255, 255, 255),
                Text = "",
                AutoButtonColor = false,
            })
            
            local UIGradient = Library:Create("UIGradient", {
                Parent = Sat,
                Rotation = 270,
                Transparency = NumbSeq{
                    NumbKey(0, 0),
                    NumbKey(1, 1)
                },
                Color = RgbSeq{
                    RgbKey(0, FromRgb(0, 0, 0)),
                    RgbKey(1, FromRgb(0, 0, 0))
                }
            })
            
            local Val = Library:Create("TextButton", {
                Parent = Colorpicker,
                Name = "Val",
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, 0, 1, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRgb(255, 255, 255),
                Text = "",
                AutoButtonColor = false,
            })
            
            local UIGradient = Library:Create("UIGradient", {
                Parent = Val,
                Transparency = NumbSeq{
                    NumbKey(0, 0),
                    NumbKey(1, 1)
                }
            })
            
            local SatValPickerREAL = Library:Create("Frame", {
                Parent = Colorpicker,
                Name = "SatValPickerREAL",
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(0, 2, 0, 2),
                BorderSizePixel = 1,
                BackgroundColor3 = FromRgb(255, 255, 255),
                ZIndex = 3, 
            })
        -- 
            
        function Cfg.SetVisible(bool)
            ColorpickerHolder.Visible = bool

            if bool then 
                if Library.CurrentElementOpen and Library.CurrentElementOpen ~= Cfg then 
                    Library.CurrentElementOpen.SetVisible(false)
                    Library.CurrentElementOpen.Open = false 
                end

                Library.CurrentElementOpen = Cfg
                ColorpickerHolder.Position = Dim2(0, ColorpickerButton.AbsolutePosition.X + 1, 0, ColorpickerButton.AbsolutePosition.Y + 17)
            end
        end 

        ColorpickerButton.MouseButton1Click:Connect(function()		
            Cfg.Open = not Cfg.Open

            Cfg.SetVisible(Cfg.Open) 
        end)

        function Cfg.Set(NewColor, Alpha)
            if NewColor then 
                H, S, V = NewColor:ToHSV()
            end 
        
            if Alpha then 
                A = Alpha
            end 
        
            local HsvPosition = Color3.fromHSV(H, S, V)
            local Color = Color3.fromHSV(H, S, V)
            
            local value = 1 - H
            local Offset = (value < 1) and 0 or -4
            HuePicker.Position = Dim2(0, 0, value, Offset)

            local Offset = (A < 1) and 0 or -4
            AlphaPicker.Position = Dim2(A, Offset, 0, 0)

            AlphaDrag.BackgroundColor3 = Color3.fromHSV(H, S, V)
            
            Visualize.BackgroundColor3 = Color
            handler.BackgroundColor3 = Color 

            Colorpicker.BackgroundColor3 = Color3.fromHSV(H, 1, 1)
            
            Cfg.NewColor = Color
            Cfg.Alpha = A
            
            local SOffset = (S < 1) and 0 or -3
            local VOffset = (1 - V < 1) and 0 or -3
            SatValPickerREAL.Position = Dim2(S, SOffset, 1 - V, VOffset)

            Flags[Cfg.Flag] = {} 
            Flags[Cfg.Flag]["Color"] = Color
            Flags[Cfg.Flag]["Transparency"] = A
        
            Cfg.Callback(Color, A)
        end

        function Cfg.Update() 
            local Mouse = InputService:GetMouseLocation() 

            if DraggingSat then	
                S = Clamp((NewVect2(Mouse.X, Mouse.Y - GuiOffset) - Val.AbsolutePosition).X / Val.AbsoluteSize.X, 0, 1)
                V = 1 - Clamp((NewVect2(Mouse.X, Mouse.Y - GuiOffset) - Sat.AbsolutePosition).Y / Sat.AbsoluteSize.Y, 0, 1)
            elseif DraggingHue then 
                H = Clamp(1 - (NewVect2(Mouse.X, Mouse.Y - GuiOffset) - Hue.AbsolutePosition).Y / Hue.AbsoluteSize.Y, 0, 1)
            elseif DraggingAlpha then 
                A = Clamp((NewVect2(Mouse.X, Mouse.Y - GuiOffset) - Alpha.AbsolutePosition).X / Alpha.AbsoluteSize.X, 0, 1)
            end

            Cfg.Set(nil, nil)
        end

        Alpha.MouseButton1Down:Connect(function()
            DraggingAlpha = true 
        end)

        Hue.MouseButton1Down:Connect(function()
            DraggingHue = true 
        end)

        Sat.MouseButton1Down:Connect(function()
            DraggingSat = true  
        end)

        InputService.InputEnded:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                DraggingSat = false
                DraggingHue = false
                DraggingAlpha = false 
            end
        end)

        InputService.InputChanged:Connect(function(Input)
            if (DraggingSat or DraggingHue or DraggingAlpha) and Input.UserInputType == Enum.UserInputType.MouseMovement then
                Cfg.Update() 
            end
        end)	

        Cfg.Set(Cfg.NewColor, Cfg.Alpha)

        Library.ConfigFlags[Cfg.Flag] = Cfg.Set
    
        return setmetatable(Cfg, Library) 
    end

    function Library:Keybind(Options)
        local parent = self.RightHolder

        local Cfg = {
            Flag = Options.Flag or "SET ME A FLAG NOWWW!!!!",
            Callback = Options.Callback or function() end,
            Open = false,
            Binding = nil, 
            Name = Options.Name or nil, 
            IgnoreKey = Options.ignore or false, 

            Key = Options.Key or nil, 
            Mode = Options.Mode or "Toggle",
            Active = Options.Default or false, 

            HoldInstances = {},
        }

        Flags[Cfg.Flag] = {} 
        
        local KeybindElement;
        if Cfg.Name then 
            KeybindElement = Library:Create("TextLabel", {
                Parent = Library.KeybindList,
                Name = "",
                FontFace = Library.Font,
                TextColor3 = Library.Themes.Preset.Text,
                BorderColor3 = FromRgb(0, 0, 0),
                Text = "[ Hold ]  Fly - X",
                Size = Dim2(1, -5, 0, 18),
                Visible = false, 
                Position = Dim2(0, 5, 0, -1),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextTruncate = Enum.TextTruncate.AtEnd,
                AutomaticSize = Enum.AutomaticSize.Y,
                TextSize = 11,
                BackgroundColor3 = Library.Themes.Preset.Text
            }, "Text")
        end 

        local ElementOutline = Library:Create("TextButton", {
            Parent = parent,
            Name = "",
            BorderColor3 = FromRgb(0, 0, 0),
            Text = "", 
            Size = Dim2(0, 24, 0, 14),
            BorderSizePixel = 0,
            BackgroundColor3 = Library.Themes.Preset.Outline
        })Library:ApplyTheme(ElementOutline, "Outline", "BackgroundColor3") 
        
        local Inline = Library:Create("Frame", {
            Parent = ElementOutline,
            Name = "",
            Position = Dim2(0, 1, 0, 1),
            BorderColor3 = FromRgb(0, 0, 0),
            Size = Dim2(1, -2, 1, -2),
            BorderSizePixel = 0,
            BackgroundColor3 = Library.Themes.Preset.Inline
        })Library:ApplyTheme(Inline, "Inline", "BackgroundColor3") 
        
        local handler = Library:Create("Frame", {
            Parent = Inline,
            Name = "",
            Position = Dim2(0, 1, 0, 1),
            BorderColor3 = FromRgb(0, 0, 0),
            Size = Dim2(1, -2, 1, -2),
            BorderSizePixel = 0,
            BackgroundColor3 = FromRgb(255, 255, 255)
        })
        
        local UIGradient = Library:Create("UIGradient", {
            Parent = handler,
            Name = "",
            Rotation = 90,
            Color = RgbSeq{
                RgbKey(0, FromRgb(41, 41, 55)),
                RgbKey(1, FromRgb(35, 35, 47))
            }
        }); Library:ApplyTheme(UIGradient, "Contrast", "Color") 
        
        local KeyText = Library:Create("TextLabel", {
            Parent = handler,
            Name = "",
            FontFace = Library.Font,
            TextColor3 = Library.Themes.Preset.Text,
            BorderColor3 = FromRgb(0, 0, 0),
            Text = "b",
            Size = Dim2(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Position = Dim2(0, 0, 0, -2),
            BorderSizePixel = 0,
            AutomaticSize = Enum.AutomaticSize.XY,
            TextSize = 11,
            BackgroundColor3 = FromRgb(255, 255, 255)
        })
            
        -- Mode selector
            local KeybindSelector = Library:Create("Frame", {
                Parent = SGui,
                Name = "",
                Position = Dim2(0, ElementOutline.AbsolutePosition.X + 1, 0, ElementOutline.AbsolutePosition.Y + 17),
                BorderColor3 = FromRgb(255, 255, 255),
                BorderSizePixel = 2,
                Visible = false, 
                AutomaticSize = Enum.AutomaticSize.XY,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            
            Library:Create("UIListLayout", {
                Parent = KeybindSelector,
                Name = "",
                SortOrder = Enum.SortOrder.LayoutOrder,
                HorizontalFlex = Enum.UIFlexAlignment.Fill,
                Padding = NewDim(0, 2)
            })
            
            local HoldButton = Library:Create("TextButton", {
                Parent = KeybindSelector,
                Name = "",
                FontFace = Library.Font,
                TextColor3 = Library.Themes.Preset.Text,
                BorderColor3 = FromRgb(0, 0, 0),
                Text = "Hold",
                BackgroundTransparency = 1,
                AutomaticSize = Enum.AutomaticSize.XY,
                BorderSizePixel = 0,
                ZIndex = 2,
                TextSize = 11,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            
            Library:Create("UIStroke", {
                Parent = HoldButton,
                Name = "",
                LineJoinMode = Enum.LineJoinMode.Miter
            })
            
            Library:Create("UIPadding", {
                Parent = KeybindSelector,
                Name = "",
                PaddingTop = NewDim(0, 3),
                PaddingBottom = NewDim(0, 5),
                PaddingRight = NewDim(0, 5),
                PaddingLeft = NewDim(0, 5)
            })
            
            local ToggleButton = Library:Create("TextButton", {
                Parent = KeybindSelector,
                Name = "",
                FontFace = Library.Font,
                TextColor3 = Library.Themes.Preset.Text,
                BorderColor3 = FromRgb(0, 0, 0),
                Text = "Toggle",
                BackgroundTransparency = 1,
                AutomaticSize = Enum.AutomaticSize.XY,
                BorderSizePixel = 0,
                ZIndex = 2,
                TextSize = 11,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            
            Library:Create("UIStroke", {
                Parent = ToggleButton,
                Name = "",
                LineJoinMode = Enum.LineJoinMode.Miter
            })
            
            local AlwaysButton = Library:Create("TextButton", {
                Parent = KeybindSelector,
                Name = "",
                FontFace = Library.Font,
                TextColor3 = Library.Themes.Preset.Text,
                BorderColor3 = FromRgb(0, 0, 0),
                Text = "Always",
                BackgroundTransparency = 1,
                AutomaticSize = Enum.AutomaticSize.XY,
                BorderSizePixel = 0,
                ZIndex = 2,
                TextSize = 11,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            
            Library:Create("UIStroke", {
                Parent = AlwaysButton,
                Name = "",
                LineJoinMode = Enum.LineJoinMode.Miter
            })
            
            local UIGradient = Library:Create("UIGradient", {
                Parent = KeybindSelector,
                Name = "",
                Rotation = 90,
                Color = RgbSeq{
                    RgbKey(0, FromRgb(41, 41, 55)),
                    RgbKey(1, FromRgb(35, 35, 47))
                }
            }); Library:ApplyTheme(UIGradient, "Contrast", "Color")
            
            local UIStroke = Library:Create("UIStroke", {
                Parent = KeybindSelector,
                Name = "",
                Color = Library.Themes.Preset.Inline,
                LineJoinMode = Enum.LineJoinMode.Miter,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            })
        -- 

        -- init 
            function Cfg.SetVisible(bool)
                KeybindSelector.Visible = bool
                KeybindSelector.Position = Dim2(0, ElementOutline.AbsolutePosition.X + 1, 0, ElementOutline.AbsolutePosition.Y + 17)

                if bool then 
                    if Library.CurrentElementOpen and Library.CurrentElementOpen ~= Cfg then 
                        Library.CurrentElementOpen.SetVisible(false)
                        Library.CurrentElementOpen.Open = false 
                    end

                    Library.CurrentElementOpen = Cfg 
                end
            end 

            function Cfg.SetMode(Mode) 
                Cfg.Mode = Mode 

                if Mode == "Always" then
                    Cfg.Set(true)
                elseif Mode == "Hold" then
                    Cfg.Set(false)
                end

                Flags[Cfg.Flag]["Mode"] = Mode
            end 

            function Cfg.Set(Input)
                if type(Input) == "boolean" then 
                    local __cached = Input 

                    if Cfg.Mode == "Always" then 
                        __cached = true 
                    end 

                    Cfg.Active = __cached 
                    Flags[Cfg.Flag]["Active"] = __cached 
                    Cfg.Callback(__cached)
                elseif tostring(Input):find("Enum") then 
                    Input = Input.Name == "Escape" and "..." or Input

                    Cfg.Key = Input or "..."	

                    local _text = Keys[Cfg.Key] or tostring(Cfg.Key):gsub("Enum.", "")
                    local _text2 = (tostring(_text):gsub("KeyCode.", ""):gsub("UserInputType.", "")) or "..."
                    Cfg.KeyName = _text2

                    Flags[Cfg.Flag]["Mode"] = Cfg.Mode 
                    Flags[Cfg.Flag]["Key"] = Cfg.Key 

                    KeyText.Text = string.lower(_text2)

                    Cfg.Callback(Cfg.Active or false)
                elseif Find({"Toggle", "Hold", "Always"}, Input) then 
                    Cfg.SetMode(Input)

                    if Input == "Always" then 
                        Cfg.Active = true 
                    end 

                    Cfg.Callback(Cfg.Active or false)
                elseif type(Input) == "table" then 
                    Input.Key = type(Input.Key) == "string" and Input.Key ~= "..." and Library:ConvertEnum(Input.Key) or Input.Key

                    Input.Key = Input.Key == Enum.KeyCode.Escape and "..." or Input.Key
                    Cfg.Key = Input.Key or "..."
                    
                    Cfg.Mode = Input.Mode or "Toggle"

                    if Input.Active then
                        Cfg.Active = Input.Active
                    end

                    local Text = tostring(Cfg.Key) ~= "Enums" and (Keys[Cfg.Key] or tostring(Cfg.Key):gsub("Enum.", "")) or nil
                    local __text = Text and (tostring(Text):gsub("KeyCode.", ""):gsub("UserInputType.", ""))
                    
                    KeyText.Text = string.lower(__text) or "..."
                    Cfg.KeyName = __text
                end 

                Flags[Cfg.Flag] = {
                    Mode = Cfg.Mode,
                    Key = Cfg.Key, 
                    Active = Cfg.Active
                }
                
                if Cfg.Name then 
                    KeybindElement.Visible = Cfg.Active

                    Library:Tween(KeybindElement, {
                        TextTransparency = Cfg.Active and 0 or 1, 
                    }) 

                    Library:Tween(KeybindElement:FindFirstChildOfClass("UIStroke"), {
                        Transparency = Cfg.Active and 0 or 1, 
                    }) 
                    
                    local Text = tostring(Cfg.Key) ~= "Enums" and (Keys[Cfg.Key] or tostring(Cfg.Key):gsub("Enum.", "")) or nil
                    local __text = Text and (tostring(Text):gsub("KeyCode.", ""):gsub("UserInputType.", ""))

                    if Cfg.Name then 
                        KeybindElement.Text = "[ " .. string.upper(string.sub(Cfg.Mode, 1, 1)) .. string.sub(Cfg.Mode, 2) .. " ] " .. Cfg.Name .. " - " .. __text
                    end
                end
            end

            HoldButton.MouseButton1Click:Connect(function()
                Cfg.SetMode("Hold") 
                Cfg.SetVisible(false)
                Cfg.Open = false 
            end) 

            ToggleButton.MouseButton1Click:Connect(function()
                Cfg.SetMode("Toggle") 
                Cfg.SetVisible(false)
                Cfg.Open = false 
            end) 

            AlwaysButton.MouseButton1Click:Connect(function()
                Cfg.SetMode("Always") 
                Cfg.SetVisible(false)
                Cfg.Open = false 
            end) 
            
            ElementOutline.MouseButton2Click:Connect(function()
                Cfg.Open = not Cfg.Open 

                Cfg.SetVisible(Cfg.Open)
            end)

            ElementOutline.MouseButton1Down:Connect(function()
                Wait()
                KeyText.Text = "..."	

                if Cfg.Binding then return end 

                Cfg.Binding = Library:Connection(InputService.InputBegan, function(Keycode, GameEvent)  
                    Cfg.Set(Keycode.KeyCode)

                    Cfg.Binding:Disconnect() 
                    Cfg.Binding = nil
                end)
            end)

            Library:Connection(InputService.InputBegan, function(Input, GameEvent) 
                if not GameEvent then 
                    if Input.KeyCode == Cfg.Key then 
                        if Cfg.Mode == "Toggle" then 
                            Cfg.Active = not Cfg.Active
                            Cfg.Set(Cfg.Active)
                        elseif Cfg.Mode == "Hold" then 
                            Cfg.Set(true)
                        end
                    end
                end
            end)

            Library:Connection(InputService.InputEnded, function(Input, GameEvent) 
                if GameEvent then 
                    return 
                end 

                local SelectedKey = Input.UserInputType == Enum.UserInputType.Keyboard and Input.KeyCode or Input.UserInputType
    
                if SelectedKey == Cfg.Key then
                    if Cfg.Mode == "Hold" then 
                        Cfg.Set(false)
                    end
                end
            end)
    
            Cfg.Set({Mode = Cfg.Mode, Active = Cfg.Active, Key = Cfg.Key})
    
            Library.ConfigFlags[Cfg.Flag] = Cfg.Set
        -- 
        
        Library.ConfigFlags[Cfg.Flag] = Cfg.Set

        return setmetatable(Cfg, Library) 
    end 

    function Library:Dropdown(Options) 
        local parent = self.Holder 

        local Cfg = {
            Name = Options.Name or nil,
            Flag = Options.Flag or tostring(random(1,9999999)),

            Items = Options.Items or {"1", "2", "3"},
            Callback = Options.Callback or function() end,
            Multi = Options.Multi or false, 
            Visible = Options.Visible or true,

            Open = false, 
            OptionInstances = {}, 
            MultiItems = {}, 
            Scrolling = Options.Scrolling or false, 

        }

        Cfg.Default = Options.Default or (Cfg.Multi and {Cfg.Items[1]}) or Cfg.Items[1] or nil

        -- Dropdown elements
            local DropDownREAL = Library:Create("TextLabel", {
                Parent = parent,
                FontFace = Library.Font,
                TextColor3 = Library.Themes.Preset.Text,
                BorderColor3 = FromRgb(0, 0, 0),
                Text = "",
                Name = "Dropdown",
                ZIndex = 2,
                Size = Dim2(1, -8, 0, 12),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                TextXAlignment = Enum.TextXAlignment.Left,
                AutomaticSize = Enum.AutomaticSize.Y,
                TextYAlignment = Enum.TextYAlignment.Top,
                TextSize = 11,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })

            local MainText      
            if Cfg.Name then 
                local LeftComponents = Library:Create("Frame", {
                    Parent = DropDownREAL,
                    Name = "LeftComponents",
                    BackgroundTransparency = 1,
                    Position = Dim2(0, 2, 0, -1),
                    BorderColor3 = FromRgb(0, 0, 0),
                    Size = Dim2(0, 0, 0, 14),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRgb(255, 255, 255)
                })

                MainText = Library:Create("TextLabel", {
                    Parent = LeftComponents,
                    FontFace = Library.Font,
                    TextColor3 = Library.Themes.Preset.Text,
                    BorderColor3 = FromRgb(0, 0, 0),
                    Text = Cfg.Name,
                    Name = "Text",
                    BackgroundTransparency = 1,
                    Size = Dim2(0, 0, 1, -1),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X,
                    TextSize = 11,
                    BackgroundColor3 = FromRgb(255, 255, 255)
                })
                
                Library:Create("UIStroke", {
                    Parent = MainText,
                    LineJoinMode = Enum.LineJoinMode.Miter
                })
                
                Library:Create("UIListLayout", {
                    Parent = LeftComponents,
                    Padding = NewDim(0, 5),
                    Name = "_",
                    FillDirection = Enum.FillDirection.Horizontal
                })

                local RightComponents = Library:Create("Frame", {
                    Parent = DropDownREAL,
                    Name = "RightComponents",
                    Position = Dim2(1, -1, 0, 1),
                    BorderColor3 = FromRgb(0, 0, 0),
                    Size = Dim2(0, 0, 0, 12),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRgb(255, 255, 255)
                })
                Cfg["RightHolder"] = RightComponents
    
                local List = Library:Create("UIListLayout", {
                    Parent = RightComponents,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Right,
                    Padding = NewDim(0, 4),
                    Name = "List",
                    SortOrder = Enum.SortOrder.LayoutOrder
                })
            end 

            local BottomComponents = Library:Create("Frame", {
                Parent = DropDownREAL,
                Name = "BottomComponents",
                Position = Dim2(0, 0, 0, Cfg.Name and 15 or 0),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, 26, 0, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            
            local Dropdown = Library:Create("TextButton", {
                Parent = BottomComponents,
                Name = "Dropdown",
                Position = Dim2(0, 0, 0, 2),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -27, 1, 18),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Outline,
                Text = "",
                AutoButtonColor = false, 
            })Library:ApplyTheme(Dropdown, "Outline", "BackgroundColor3") 
            
            local Inline = Library:Create("Frame", {
                Parent = Dropdown,
                Name = "Inline",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Inline
            })Library:ApplyTheme(Inline, "Inline", "BackgroundColor3") 
            
            local Background = Library:Create("Frame", {
                Parent = Inline,
                Name = "Background",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Accent
            })Library:ApplyTheme(Background, "Accent", "BackgroundColor3") 
            
            local Contrast = Library:Create("Frame", {
                Parent = Background,
                Name = "Contrast",
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, 0, 1, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })

            local Plus = Library:Create("TextLabel", {
                Parent = Contrast,
                TextWrapped = true,
                TextColor3 = Library.Themes.Preset.Text,
                BorderColor3 = FromRgb(0, 0, 0),
                Text = "+",
                Name = "Plus",
                Size = Dim2(1, -4, 1, 0),
                Position = Dim2(0, 0, 0, -1),
                BackgroundTransparency = 1,
                TextXAlignment = Enum.TextXAlignment.Right,
                FontFace = Library.Font,
                TextTruncate = Enum.TextTruncate.AtEnd,
                BorderSizePixel = 0,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            
            Library:Create("UIStroke", {
                Parent = Plus,
                LineJoinMode = Enum.LineJoinMode.Miter
            })
            
            local Text = Library:Create("TextLabel", {
                Parent = Contrast,
                FontFace = Library.Font,
                TextColor3 = Library.Themes.Preset.Text,
                BorderColor3 = FromRgb(0, 0, 0),
                Text = "aa",
                Name = "Text",
                Size = Dim2(1, -4, 1, 0),
                Position = Dim2(0, 4, 0, -1),
                BackgroundTransparency = 1,
                TextXAlignment = Enum.TextXAlignment.Left,
                BorderSizePixel = 0,
                TextTruncate = Enum.TextTruncate.AtEnd,
                TextSize = 11,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            
            Library:Create("UIStroke", {
                Parent = Text,
                LineJoinMode = Enum.LineJoinMode.Miter
            })
            
            local UIGradient = Library:Create("UIGradient", {
                Parent = Contrast,
                Rotation = 90,
                Color = RgbSeq{
                    RgbKey(0, FromRgb(41, 41, 55)),
                    RgbKey(1, FromRgb(35, 35, 47))
                }
            })Library:ApplyTheme(UIGradient, "Contrast", "Color") 
            
            local UIGradient = Library:Create("UIGradient", {
                Parent = Background,
                Rotation = 90,
                Color = RgbSeq{
                    RgbKey(0, FromRgb(255, 255, 255)),
                    RgbKey(1, FromRgb(167, 167, 167))
                }
            })Library:ApplyTheme(UIGradient, "Contrast", "Color") 
            
            Library:Create("UIListLayout", {
                Parent = BottomComponents,
                Padding = NewDim(0, 10),
                Name = "_",
                SortOrder = Enum.SortOrder.LayoutOrder
            })     
        --

        -- Dropdown Holder
            local DropDownHolder = Library:Create("Frame", {
                Parent = SGui,
                BorderColor3 = FromRgb(0, 0, 0),
                Name = "DropDownHolder",
                BackgroundTransparency = 1,
                Position = Dim2(0, Dropdown.AbsolutePosition.X + 1, 0, Dropdown.AbsolutePosition.Y + 22),
                Size = Dim2(0, Dropdown.AbsoluteSize.X, 0, Cfg.Scrolling and 180 or 0),
                BorderSizePixel = 0,
                AutomaticSize = Cfg.Scrolling and Enum.AutomaticSize.None or Enum.AutomaticSize.Y,
                BackgroundColor3 = Library.Themes.Preset.Outline,
                Visible = false
            })
            
            local Inline = Library:Create("Frame", {
                Parent = DropDownHolder,
                Size = Dim2(1, -2, 1, 2),
                Name = "Inline",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                ZIndex = 2,
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Inline
            })Library:ApplyTheme(Inline, "Inline", "BackgroundColor3") 
            
            local Background; 
            if not Cfg.Scrolling then 
                Background = Library:Create("Frame", {
                    Parent = Inline,
                    BorderColor3 = FromRgb(0, 0, 0),
                    Name = "Background",
                    BackgroundTransparency = 1,
                    Position = Dim2(0, 1, 0, 1),
                    Size = Dim2(1, -2, 1, 1),
                    ZIndex = 2,
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Themes.Preset.Accent
                })
                Library:ApplyTheme(Background, "Accent", "BackgroundColor3") 
            else 
                Background = Library:Create("ScrollingFrame", {
                    Parent = Inline,
                    BorderColor3 = FromRgb(0, 0, 0),
                    Name = "Background",
                    BackgroundTransparency = 1,
                    Position = Dim2(0, 1, 0, 1),
                    Size = Dim2(1, -2, 1, 1),
                    ZIndex = 2,
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Themes.Preset.Accent,
                    CanvasSize = Dim2(0, 0, 0, 0),
                    AutomaticCanvasSize = Enum.AutomaticSize.Y,
                    ScrollBarThickness = 2,
                    ScrollBarImageColor3 = Library.Themes.Preset.Accent
                })
                Library:ApplyTheme(Background, "Accent", "BackgroundColor3") 
                Library:ApplyTheme(Background, "Accent", "ScrollBarImageColor3") 
            end 
            
            local Contrast = Library:Create("Frame", {
                Parent = Background,
                Name = "Contrast",
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, 0, 1, -3),
                BorderSizePixel = 0,
                ZIndex = 2, 
                BackgroundColor3 = FromRgb(255, 255, 255),
                AutomaticSize = Cfg.Scrolling and Enum.AutomaticSize.Y or Enum.AutomaticSize.None,
            }); 

            Library:Create("UIPadding", {
                Parent = Contrast,
                PaddingTop = NewDim(0, 2),
                PaddingBottom = NewDim(0, 2),
                PaddingRight = NewDim(0, 0),
                PaddingLeft = NewDim(0, 4)
            })
            
            local UIGradient = Library:Create("UIGradient", {
                Parent = Contrast,
                Rotation = 90,
                Color = RgbSeq{
                    RgbKey(0, FromRgb(41, 41, 55)),
                    RgbKey(1, FromRgb(35, 35, 47))
                }
            })Library:ApplyTheme(UIGradient, "Contrast", "Color") 
        
            Library:Create("UIListLayout", {
                Parent = Contrast,
                Padding = NewDim(0, 5),
                SortOrder = Enum.SortOrder.LayoutOrder
            })Library:ApplyTheme(UIGradient, "Contrast", "Color") 
            
            local UIGradient = Library:Create("UIGradient", {
                Parent = Background,
                Rotation = 90,
                Color = RgbSeq{
                    RgbKey(0, FromRgb(255, 255, 255)),
                    RgbKey(1, FromRgb(167, 167, 167))
                }
            })Library:ApplyTheme(UIGradient, "Contrast", "Color") 
            
            local Stroke = Library:Create("UIStroke", {
                Parent = Inline,
                Color = Library.Themes.Preset.Outline,
                LineJoinMode = Enum.LineJoinMode.Miter
            })Library:ApplyTheme(Stroke, "Outline", "Color") 
        -- 

        function Cfg.SetElementVisible(bool)
            DropDownREAL.Visible = bool 

            if MainText then 
                MainText.Visible = bool
            end 
        end 

        function Cfg.SetVisible(bool) 
            DropDownHolder.Visible = bool

            Plus.Text = bool and "-" or "+"
            Plus.TextSize = bool and 12 or 8

            if bool then 
                if Library.CurrentElementOpen and Library.CurrentElementOpen ~= Cfg then 
                    Library.CurrentElementOpen.SetVisible(false)
                    Library.CurrentElementOpen.Open = false 
                end

                DropDownHolder.Size = Dim2(0, Dropdown.AbsoluteSize.X, 0, DropDownHolder.Size.Y.Offset)
                DropDownHolder.Position = Dim2(0, Dropdown.AbsolutePosition.X + 1, 0, Dropdown.AbsolutePosition.Y + 22)
                Library.CurrentElementOpen = Cfg
            end
        end

        function Cfg.Set(value) 
            local selected = {}

            local IsTable = type(value) == "table"

            for _,V in next, Cfg.OptionInstances do 
                if V.Text == value or (IsTable and Find(value, V.Text)) then 
                    Insert(selected, V.Text)
                    Cfg.MultiItems = selected
                    V.TextColor3 = Library.Themes.Preset.Accent
                else 
                    V.TextColor3 = Library.Themes.Preset.Text
                end
            end

            Text.Text = IsTable and concat(selected, ", ") or selected[1] or "None"
            Flags[Cfg.Flag] = IsTable and selected or selected[1]
            Cfg.Callback(Flags[Cfg.Flag]) 
        end
        
        function Cfg:RefreshOptions(RefreshedList) 
            for _, V in next, Cfg.OptionInstances do 
                V:Destroy() 
            end

            Cfg.OptionInstances = {} 

            for i,V in next, RefreshedList do 
                local TextButton = Library:Create("TextButton", {
                    Parent = Contrast,
                    FontFace = Library.Font,
                    TextColor3 = Library.Themes.Preset.Text,
                    BorderColor3 = FromRgb(0, 0, 0),
                    Size = Dim2(1, 0, 0, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextWrapped = true,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    TextSize = 11,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 2, 
                    Text = V,
                    BackgroundColor3 = FromRgb(255, 255, 255)
                })Library:ApplyTheme(TextButton, "Accent", "TextColor3") 
                
                Library:Create("UIStroke", {
                    Parent = TextButton,
                    LineJoinMode = Enum.LineJoinMode.Miter
                })

                Insert(Cfg.OptionInstances, TextButton)

                TextButton.MouseButton1Down:Connect(function()
                    if Cfg.Multi then 
                        local SelectedIndex = Find(Cfg.MultiItems, TextButton.Text)

                        if SelectedIndex then 
                            remove(Cfg.MultiItems, SelectedIndex)
                        else
                            Insert(Cfg.MultiItems, TextButton.Text)
                        end

                        Cfg.Set(Cfg.MultiItems) 				
                    else 
                        Cfg.SetVisible(false)
                        Cfg.Open = false 

                        Cfg.Set(TextButton.Text)
                    end
                end)
            end
        end

        Dropdown.MouseButton1Click:Connect(function()
            Cfg.Open = not Cfg.Open 

            Cfg.SetVisible(Cfg.Open)
        end)

        Cfg:RefreshOptions(Cfg.Items) 

        Cfg.Set(Cfg.Default)
        
        Library.ConfigFlags[Cfg.Flag] = Cfg.Set
        Library.VisibleFlags[Cfg.Flag] = Cfg.SetElementVisible

        Cfg.SetElementVisible(Cfg.Visible)

        return setmetatable(Cfg, Library)
    end 

    function Library:List(Options)
        local Cfg = {
            Callback = Options and Options.Callback or function() end, 

            scale = Options.Size or 232, 
            Items = Options.Items or {"1", "2", "3"}, 
            -- order = Options.order or 1, 
            PlaceholderText = Options.Placeholder or Options.PlaceholderText or "Search here...",
            Visible = Options.Visible or true,

            OptionInstances = {}, 
            CurrentInstance = nil, 
            Flag = Options.Flag or "SET A FLAG U NIGGER", 

        } 

        -- instances 
            local ListHolder = Library:Create("TextLabel", {
                Parent = self.Holder,
                Name = "",
                FontFace = Library.Font,
                TextColor3 = Library.Themes.Preset.Text,
                BorderColor3 = FromRgb(0, 0, 0),
                Text = "",
                ZIndex = 2,
                Size = Dim2(1, -8, 0, 12),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                TextXAlignment = Enum.TextXAlignment.Left,
                AutomaticSize = Enum.AutomaticSize.Y,
                TextYAlignment = Enum.TextYAlignment.Top,
                TextSize = 11,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            
            local UIPadding = Library:Create("UIPadding", {
                Parent = ListHolder,
                Name = "",
                PaddingLeft = NewDim(0, 1)
            })
            
            local UIStroke = Library:Create("UIStroke", {
                Parent = ListHolder,
                Name = ""
            })
            
            local BottomComponents = Library:Create("Frame", {
                Parent = ListHolder,
                Name = "",
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, 26, 0, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            
            Library:Create("UIListLayout", {
                Parent = BottomComponents,
                Name = "",
                Padding = NewDim(0, 10),
                SortOrder = Enum.SortOrder.LayoutOrder
            })
            
            local List = Library:Create("Frame", {
                Parent = BottomComponents,
                Name = "",
                Position = Dim2(0, 0, 0, 2),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -27, 1, Cfg.scale),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Outline
            })Library:ApplyTheme(MainHolder, "Outline", "BackgroundColor3") 
            
            local Inline = Library:Create("Frame", {
                Parent = List,
                Name = "",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Inline
            })Library:ApplyTheme(Inline, "Inline", "BackgroundColor3") 
            
            local Background = Library:Create("Frame", {
                Parent = Inline,
                Name = "",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Accent
            })Library:ApplyTheme(Background, "Accent", "BackgroundColor3") 
            
            local UIGradient = Library:Create("UIGradient", {
                Parent = Background,
                Name = "",
                Rotation = 90,
                Color = RgbSeq{
                RgbKey(0, FromRgb(255, 255, 255)),
                RgbKey(1, FromRgb(167, 167, 167))
            }
            })Library:ApplyTheme(UIGradient, "Contrast", "Color") 
            
            local Contrast = Library:Create("Frame", {
                Parent = Background,
                Name = "",
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, 0, 1, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            
            local UIGradient = Library:Create("UIGradient", {
                Parent = Contrast,
                Name = "",
                Rotation = 90,
                Color = RgbSeq{
                RgbKey(0, FromRgb(41, 41, 55)),
                RgbKey(1, FromRgb(35, 35, 47))
            }
            })Library:ApplyTheme(UIGradient, "Contrast", "Color") 
            
            local ScrollingFrame = Library:Create("ScrollingFrame", {
                Parent = Contrast,
                Name = "",
                ScrollBarImageColor3 = Library.Themes.Preset.Accent,
                Active = true,
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                ScrollBarThickness = 2,
                BackgroundTransparency = 1,
                Size = Dim2(1, 0, 1, 0),
                BackgroundColor3 = FromRgb(255, 255, 255),
                BorderColor3 = FromRgb(0, 0, 0),
                BorderSizePixel = 0,
                CanvasSize = Dim2(0, 0, 0, 0)
            })Library:ApplyTheme(ScrollingFrame, "Accent", "ScrollBarImageColor3") 
            
            local UIPadding = Library:Create("UIPadding", {
                Parent = ScrollingFrame,
                Name = "",
                PaddingBottom = NewDim(0, 4),
                PaddingTop = NewDim(0, 4)
            })
            
            local UIListLayout = Library:Create("UIListLayout", {
                Parent = ScrollingFrame,
                Name = "",
                Padding = NewDim(0, 4),
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        --  

        function Cfg.RenderOption(Text) 
            local TextButton = Library:Create("TextButton", {
                Parent = ScrollingFrame,
                Name = "",
                Text = tostring(Text),
                FontFace = Library.Font,
                TextColor3 = Library.Themes.Preset.Text,
                BorderColor3 = FromRgb(0, 0, 0),
                BackgroundTransparency = 1,
                Size = Dim2(1, 0, 0, 0),
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.Y,
                TextSize = 11,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })

            Library:ApplyTheme(TextButton, "Accent", "TextColor3") 

            local UIStroke = Library:Create("UIStroke", {
                Parent = TextButton,
                Name = ""
            })

            return TextButton 
        end 

        function Cfg.SetElementVisible(bool)
            ListHolder.Visible = bool 
        end

        function Cfg.RefreshOptions(Options) 
            if type(Options) == "function" then 
                return 
            end 

            for _, V in next, Cfg.OptionInstances do 
                V:Destroy() 
            end 

            for _, option in next, Options do 
                local Button = Cfg.RenderOption(option) 

                Insert(Cfg.OptionInstances, Button)

                Button.MouseButton1Click:Connect(function()
                    if Cfg.CurrentInstance and Cfg.CurrentInstance ~= Button then 
                        Cfg.CurrentInstance.TextColor3 = Library.Themes.Preset.Text 
                    end 

                    Cfg.CurrentInstance = Button 
                    Button.TextColor3 = Library.Themes.Preset.Accent 

                    Flags[Cfg.Flag] = Button.Text
                    
                    Cfg.Callback(Button.Text)
                end)
            end 
        end     

        function Cfg.FilterOptions(Text)
            for _, V in next, Cfg.OptionInstances do 
                if string.find(V.Text, Text) then 
                    V.Visible = true 
                else 
                    V.Visible = false
                end
            end
        end 

        function Cfg.Set(value)
            for _, Buttons in next, Cfg.OptionInstances do 
                if Buttons.Text == value then 
                    Buttons.TextColor3 = Library.Themes.Preset.Accent 
                else 
                    Buttons.TextColor3 = Library.Themes.Preset.Text 
                end 
            end 

            Flags[Cfg.Flag] = value
            Cfg.Callback(value)
        end 

        Cfg.RefreshOptions(Cfg.Items) 
        Cfg.SetElementVisible(Cfg.Visible)

        Library.VisibleFlags[Cfg.Flag] = Cfg.SetElementVisible
        Library.ConfigFlags[Cfg.Flag] = Cfg.Set

        return setmetatable(Cfg, Library)
    end 

    function Library:TextBox(Options)
        local Cfg = {
            Placeholder = Options.Placeholder or Options.PlaceholderText or Options.Holder or Options.Holdertext or "type here...",
            Default = Options.Default,
            Flag = Options.Flag or "SET ME NIGGA",
            Callback = Options.Callback or function() end,
            Visible = Options.Visible or true,
        }
        
        -- instances 
            local TextBoxHolder = Library:Create("TextLabel", {
                Parent = self.Holder,
                Name = "",
                FontFace = Library.Font,
                TextColor3 = Library.Themes.Preset.Text,
                BorderColor3 = FromRgb(0, 0, 0),
                Text = "",
                ZIndex = 2,
                Size = Dim2(1, -8, 0, 12),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                TextXAlignment = Enum.TextXAlignment.Left,
                AutomaticSize = Enum.AutomaticSize.Y,
                TextYAlignment = Enum.TextYAlignment.Top,
                TextSize = 11,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            
            Library:Create("UIPadding", {
                Parent = TextBoxHolder,
                Name = "",
                PaddingLeft = NewDim(0, 1)
            })
            
            Library:Create("UIStroke", {
                Parent = TextBoxHolder,
                Name = ""
            })
            
            local Button = Library:Create("Frame", {
                Parent = TextBoxHolder,
                Name = "",
                Position = Dim2(0, 0, 0, 2),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -27, 0, 18),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Outline
            })
            
            Library:ApplyTheme(Button, "Outline", "BackgroundColor3") 
            
            local Inline = Library:Create("Frame", {
                Parent = Button,
                Name = "",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Inline
            })
            
            Library:ApplyTheme(Inline, "Inline", "BackgroundColor3") 
            
            local Background = Library:Create("Frame", {
                Parent = Inline,
                Name = "",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Accent
            })
            
            Library:ApplyTheme(Background, "Accent", "BackgroundColor3") 
            
            local TextBox = Library:Create("TextBox", {
                Parent = Background,
                Name = "",
                CursorPosition = -1,
                FontFace = Library.Font,
                TextColor3 = Library.Themes.Preset.Text,
                BorderColor3 = FromRgb(0, 0, 0),
                ZIndex = 2,
                Text = "", 
                Size = Dim2(1, 0, 1, 0),
                BorderSizePixel = 0,
                TextWrapped = true,
                BackgroundTransparency = 1,
                TextTruncate = Enum.TextTruncate.SplitWord,
                PlaceholderText = "Type here...",
                ClearTextOnFocus = false,
                TextSize = 11,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            
            Library:Create("UIStroke", {
                Parent = TextBox,
                Name = ""
            })
            
            local TextButton = Library:Create("TextButton", {
                Parent = Background,
                Name = "",
                FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
                TextColor3 = FromRgb(0, 0, 0),
                BorderColor3 = FromRgb(0, 0, 0),
                Text = "",
                AutoButtonColor = false,
                Size = Dim2(1, 0, 1, 0),
                BorderSizePixel = 0,
                TextSize = 14,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            
            local UIGradient = Library:Create("UIGradient", {
                Parent = TextButton,
                Name = "",
                Rotation = 90,
                Color = RgbSeq{
                RgbKey(0, FromRgb(41, 41, 55)),
                RgbKey(1, FromRgb(35, 35, 47))
            }
            })
            
            Library:ApplyTheme(UIGradient, "Contrast", "Color") 
            
            Library:Create("UIListLayout", {
                Parent = TextBoxHolder,
                Name = "",
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalFlex = Enum.UIFlexAlignment.Fill,
                Padding = NewDim(0, 4),
                SortOrder = Enum.SortOrder.LayoutOrder
            })
            
            TextBox:GetPropertyChangedSignal("Text"):Connect(function()
                Flags[Cfg.Flag] = TextBox.Text
                Cfg.Callback(TextBox.Text)
            end)
        -- 

        function Cfg.SetElementVisible(bool)
            TextBoxHolder.Visible = bool 
        end

        function Cfg.Set(Text) 
            Flags[Cfg.Flag] = Text
            TextBox.Text = Text
            Cfg.Callback(Text)
        end 

        if Cfg.Default then 
            Cfg.Set(Cfg.Default) 
        end 

        Cfg.SetElementVisible(Cfg.Visible)

        Library.ConfigFlags[Cfg.Flag] = Cfg.Set
        Library.VisibleFlags[Cfg.Flag] = Cfg.SetElementVisible

        return setmetatable(Cfg, Library) 
    end 

    function Library:ButtonHolder(Options) 
        local Cfg = {
            Flag = Options.Flag or "hi", 
            Visible = Options.Visible or true,
        }

        local ButtonHolder = Library:Create("TextLabel", {
            Parent = self.Holder,
            Name = "",
            FontFace = Library.Font,
            TextColor3 = Library.Themes.Preset.Text,
            BorderColor3 = FromRgb(0, 0, 0),
            Text = "",
            ZIndex = 2,
            Size = Dim2(1, -8, 0, 12),
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            TextXAlignment = Enum.TextXAlignment.Left,
            AutomaticSize = Enum.AutomaticSize.Y,
            TextYAlignment = Enum.TextYAlignment.Top,
            TextSize = 11,
            BackgroundColor3 = FromRgb(255, 255, 255), 
        })

        self.CurrnetHolder = ButtonHolder

        -- instances 
            Library:Create("UIStroke", {
                Parent = ButtonHolder,
                Name = ""
            })
            
            Library:Create("UIListLayout", {
                Parent = ButtonHolder,
                Name = "",
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalFlex = Enum.UIFlexAlignment.Fill,
                Padding = NewDim(0, 4),
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        -- 
        
        function Cfg.SetElementVisible(bool)
            ButtonHolder.Visible = bool 
        end

        Cfg.SetElementVisible(Cfg.Visible)

        Library.VisibleFlags[Cfg.Flag] = Cfg.SetElementVisible

        return setmetatable(Cfg, Library)
    end 

    function Library:Button(Options)
        local Cfg = {
            Callback = Options.Callback or function() end, 
            Name = Options.Text or Options.Name or "Button",
        }   

        local Button = Library:Create("TextButton", {
            Parent = self.CurrnetHolder,
            Name = "",
            Position = Dim2(0, 0, 0, 2),
            BorderColor3 = FromRgb(0, 0, 0),
            Size = Dim2(1, -27, 0, 18),
            BorderSizePixel = 0,
            BackgroundColor3 = Library.Themes.Preset.Outline,
            Text = ""
        })
        
        Library:ApplyTheme(Button, "Outline", "BackgroundColor3") 
        
        local Inline = Library:Create("Frame", {
            Parent = Button,
            Name = "",
            Position = Dim2(0, 1, 0, 1),
            BorderColor3 = FromRgb(0, 0, 0),
            Size = Dim2(1, -2, 1, -2),
            BorderSizePixel = 0,
            BackgroundColor3 = Library.Themes.Preset.Inline
        })
        
        Library:ApplyTheme(Inline, "Inline", "BackgroundColor3") 
        
        local Background = Library:Create("Frame", {
            Parent = Inline,
            Name = "",
            Position = Dim2(0, 1, 0, 1),
            BorderColor3 = FromRgb(0, 0, 0),
            Size = Dim2(1, -2, 1, -2),
            BorderSizePixel = 0,
            BackgroundColor3 = Library.Themes.Preset.Accent
        })
        
        Library:ApplyTheme(Background, "Accent", "BackgroundColor3") 
        
        local _UIGradient = Library:Create("UIGradient", {
            Parent = Background,
            Name = "",
            Rotation = 90,
            Color = RgbSeq{
            RgbKey(0, FromRgb(255, 255, 255)),
            RgbKey(1, FromRgb(167, 167, 167))
        }
        })
        
        Library:ApplyTheme(_UIGradient, "Contrast", "Color") 
        
        local Contrast = Library:Create("Frame", {
            Parent = Background,
            Name = "",
            BorderColor3 = FromRgb(0, 0, 0),
            Size = Dim2(1, 0, 1, 0),
            BorderSizePixel = 0,
            BackgroundColor3 = FromRgb(255, 255, 255)
        })
        
        local UIGradient = Library:Create("UIGradient", {
            Parent = Contrast,
            Name = "",
            Rotation = 90,
            Color = RgbSeq{
            RgbKey(0, FromRgb(41, 41, 55)),
            RgbKey(1, FromRgb(35, 35, 47))
        }
        })
        
        Library:ApplyTheme(UIGradient, "Contrast", "Color") 
        
        local Text = Library:Create("TextLabel", {
            Parent = Contrast,
            Name = "",
            TextWrapped = true,
            TextColor3 = Library.Themes.Preset.Text,
            BorderColor3 = FromRgb(0, 0, 0),
            Text = Cfg.Name,
            Size = Dim2(1, -4, 1, 0),
            Position = Dim2(0, 4, 0, -1),
            BackgroundTransparency = 1,
            TextTruncate = Enum.TextTruncate.AtEnd,
            BorderSizePixel = 0,
            FontFace = Library.Font,
            TextSize = 11,
            BackgroundColor3 = FromRgb(255, 255, 255)
        })
        
        local UIStroke = Library:Create("UIStroke", {
            Parent = Text,
            Name = "",
            LineJoinMode = Enum.LineJoinMode.Miter
        })

        Button.MouseButton1Click:Connect(function()
            Cfg.Callback() 
        end)

        return setmetatable(Cfg, Library)
    end 

    function Library:Label(Options)
        local Cfg = {Name = Options.Text or Options.Name or "Label"}

        local Dropdown = Library:Create("TextLabel", {
            Parent = self.Holder,
            Name = "",
            FontFace = Library.Font,
            TextColor3 = Library.Themes.Preset.Text,
            BorderColor3 = FromRgb(0, 0, 0),
            Text = "",
            ZIndex = 2,
            Size = Dim2(1, -8, 0, 12),
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            TextXAlignment = Enum.TextXAlignment.Left,
            AutomaticSize = Enum.AutomaticSize.Y,
            TextYAlignment = Enum.TextYAlignment.Top,
            TextSize = 11,
            BackgroundColor3 = FromRgb(255, 255, 255)
        })
        
        local UIStroke = Library:Create("UIStroke", {
            Parent = Dropdown,
            Name = ""
        })
        
        local LeftComponents = Library:Create("Frame", {
            Parent = Dropdown,
            Name = "",
            BackgroundTransparency = 1,
            Position = Dim2(0, 2, 0, -1),
            BorderColor3 = FromRgb(0, 0, 0),
            Size = Dim2(0, 0, 0, 14),
            BorderSizePixel = 0,
            BackgroundColor3 = FromRgb(255, 255, 255)
        })
        
        local TextLabel = Library:Create("TextLabel", {
            Parent = LeftComponents,
            Name = "",
            FontFace = Library.Font,
            TextColor3 = Library.Themes.Preset.Text,
            BorderColor3 = FromRgb(0, 0, 0),
            Text = Cfg.Name,
            BackgroundTransparency = 1,
            TextXAlignment = Enum.TextXAlignment.Left,
            BorderSizePixel = 0,
            AutomaticSize = Enum.AutomaticSize.Y,
            TextSize = 11,
            BackgroundColor3 = FromRgb(255, 255, 255)
        })

        local RightComponents = Library:Create("Frame", {
            Parent = Dropdown,
            Name = "RightComponents",
            Position = Dim2(1, -1, 0, 1),
            BorderColor3 = FromRgb(0, 0, 0),
            Size = Dim2(0, 0, 0, 12),
            BorderSizePixel = 0,
            BackgroundColor3 = FromRgb(255, 255, 255)
        }) Cfg.RightHolder = RightComponents

        local List = Library:Create("UIListLayout", {
            Parent = RightComponents,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            Padding = NewDim(0, 4),
            Name = "List",
            SortOrder = Enum.SortOrder.LayoutOrder
        })
        
        local UIStroke = Library:Create("UIStroke", {
            Parent = TextLabel,
            Name = ""
        })

        function Cfg.UpdateText(Text) 
            TextLabel.Text = Text 
        end 
                    
        return setmetatable(Cfg, Library)   
    end 

    function Library:Playerlist(Options) 
        local Cfg = {
            Callback = Options.Callback or function() end, 

            Labels = {
                Name,
                Display, 
                Uid, 
            }
        }

        local SelectedButton; 

        local patterns = {
            ["Priority"] = FromRgb(255, 255, 0),
            ["Enemy"] = FromRgb(255, 0, 0),
            ["Neutral"] = Library.Themes.Preset.Text,
            ["Friendly"] = FromRgb(0, 255, 255)
        }

        -- elements 
            local playerListHolder = Library:Create("TextLabel", {
                Parent = self.Holder,
                Name = "",
                FontFace = Library.Font,
                TextColor3 = Library.Themes.Preset.Text,
                BorderColor3 = FromRgb(0, 0, 0),
                Text = "",
                ZIndex = 2,
                Size = Dim2(1, -8, 0, 12),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                TextXAlignment = Enum.TextXAlignment.Left,
                AutomaticSize = Enum.AutomaticSize.Y,
                TextYAlignment = Enum.TextYAlignment.Top,
                TextSize = 11,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            
            local UIPadding = Library:Create("UIPadding", {
                Parent = playerListHolder,
                Name = "",
                PaddingBottom = NewDim(0, -2),
                PaddingLeft = NewDim(0, 1)
            })
            
            local UIStroke = Library:Create("UIStroke", {
                Parent = playerListHolder,
                Name = ""
            })
            
            local BottomComponents = Library:Create("Frame", {
                Parent = playerListHolder,
                Name = "",
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, 26, 0, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            
            Library:Create("UIListLayout", {
                Parent = BottomComponents,
                Name = "",
                Padding = NewDim(0, 10),
                SortOrder = Enum.SortOrder.LayoutOrder
            })
            
            local List = Library:Create("Frame", {
                Parent = BottomComponents,
                Name = "",
                Position = Dim2(0, 0, 0, 2),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -27, 1, 232),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Outline
            })Library:ApplyTheme(List, "Outline", "BackgroundColor3") 
            
            local Inline = Library:Create("Frame", {
                Parent = List,
                Name = "",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Inline
            })Library:ApplyTheme(Inline, "Inline", "BackgroundColor3") 
            
            local Background = Library:Create("Frame", {
                Parent = Inline,
                Name = "",
                Position = Dim2(0, 1, 0, 1),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Accent
            })
            
            local UIGradient = Library:Create("UIGradient", {
                Parent = Background,
                Name = "",
                Rotation = 90,
                Color = RgbSeq{
                    RgbKey(0, FromRgb(255, 255, 255)),
                    RgbKey(1, FromRgb(167, 167, 167))
                }
            }); Library:ApplyTheme(UIGradient, "Contrast", "Color") 
            
            local Contrast = Library:Create("Frame", {
                Parent = Background,
                Name = "",
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, 0, 1, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            
            local UIGradient = Library:Create("UIGradient", {
                Parent = Contrast,
                Name = "",
                Rotation = 90,
                Color = RgbSeq{
                RgbKey(0, FromRgb(41, 41, 55)),
                RgbKey(1, FromRgb(35, 35, 47))
            }
            }); Library:ApplyTheme(UIGradient, "Contrast", "Color") 
            
            local ScrollingFrame = Library:Create("ScrollingFrame", {
                Parent = Contrast,
                Name = "",
                ScrollBarImageColor3 = Library.Themes.Preset.Accent,
                Active = true,
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                ScrollBarThickness = 2,
                BackgroundTransparency = 1,
                Size = Dim2(1, 0, 1, 0),
                BackgroundColor3 = FromRgb(255, 255, 255),
                BorderColor3 = FromRgb(0, 0, 0),
                BorderSizePixel = 0,
                CanvasSize = Dim2(0, 0, 0, 0)
            })Library:ApplyTheme(ScrollingFrame, "Accent", "ScrollBarImageColor3") 
            
            local UIPadding = Library:Create("UIPadding", {
                Parent = ScrollingFrame,
                Name = "",
                PaddingTop = NewDim(0, 4),
                PaddingBottom = NewDim(0, 4),
                PaddingRight = NewDim(0, 4),
                PaddingLeft = NewDim(0, 4)
            })
            
            local UIListLayout = Library:Create("UIListLayout", {
                Parent = ScrollingFrame,
                Name = "",
                Padding = NewDim(0, 4),
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        -- 

        function Cfg.CreatePlayer(Player) 
            Library.PlayerlistData[tostring(Player)] = {}
            local Path = Library.PlayerlistData[tostring(Player)]
            
            local TextButton = Library:Create("TextButton", {
                Parent = ScrollingFrame,
                Name = "",
                FontFace = Library.Font,
                TextColor3 = Library.Themes.Preset.Text,
                BorderColor3 = FromRgb(0, 0, 0),
                Text = "",
                BackgroundTransparency = 1,
                Size = Dim2(1, 0, 0, 0),
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.Y,
                TextSize = 11,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })

            local PlayerName = Library:Create("TextLabel", {
                Parent = TextButton,
                FontFace = Library.Font,
                TextColor3 = Library.Themes.Preset.Text,
                BorderColor3 = FromRgb(0, 0, 0),
                Text = tostring(Player),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextTruncate = Enum.TextTruncate.AtEnd,
                AutomaticSize = Enum.AutomaticSize.Y,
                TextSize = 11,
                LayoutOrder = -100, 
                BackgroundColor3 = FromRgb(255, 255, 255)
            })
            Library:ApplyTheme(PlayerName, "Text", "TextColor3") 
            Library:ApplyTheme(PlayerName, "Accent", "TextColor3") 
                            
            -- local TextLabel = Library:Create("TextLabel", {
            --     Parent = TextButton,
            --     Name = "",
            --     FontFace = Library.Font,
            --     TextColor3 = Library.Themes.Preset.Text,
            --     BorderColor3 = FromRgb(0, 0, 0),
            --     Text = "None",
            --     BackgroundTransparency = 1,
            --     TextXAlignment = Enum.TextXAlignment.Left,
            --     BorderSizePixel = 0,
            --     AutomaticSize = Enum.AutomaticSize.Y,
            --     TextSize = 11,
            --     BackgroundColor3 = FromRgb(255, 255, 255)
            -- })
                            
            -- local Frame = Library:Create("Frame", {
            --     Parent = TextLabel,
            --     Name = "",
            --     Position = Dim2(0, -10, 0, 0),
            --     BorderColor3 = FromRgb(0, 0, 0),
            --     Size = Dim2(0, 1, 0, 12),
            --     BorderSizePixel = 0,
            --     BackgroundColor3 = Library.Themes.Preset.Outline
            -- })Library:ApplyTheme(MainHolder, "Outline", "BackgroundColor3") 
            
            local PriorityText = Library:Create("TextLabel", {
                Parent = TextButton,
                Name = "",
                FontFace = Library.Font,
                TextColor3 = tostring(Player) ~= Client.Name and Library.Themes.Preset.Text or FromRgb(0, 0, 255),
                BorderColor3 = FromRgb(0, 0, 0),
                Text = tostring(Player) ~= Client.Name and "Neutral" or "LocalPlayer",
                BackgroundTransparency = 1,
                TextXAlignment = Enum.TextXAlignment.Left,
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.Y,
                TextSize = 11,
                BackgroundColor3 = FromRgb(255, 255, 255)
            })

            local Frame = Library:Create("Frame", {
                Parent = PriorityText,
                Name = "",
                Position = Dim2(0, -10, 0, 0),
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(0, 1, 0, 12),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Outline
            })Library:ApplyTheme(MainHolder, "Outline", "BackgroundColor3") 
            
            local UIListLayout = Library:Create("UIListLayout", {
                Parent = TextButton,
                Name = "",
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalFlex = Enum.UIFlexAlignment.Fill,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalFlex = Enum.UIFlexAlignment.Fill
            })
            
            local UIPadding = Library:Create("UIPadding", {
                Parent = TextButton,
                Name = "",
                PaddingRight = NewDim(0, 2),
                PaddingLeft = NewDim(0, 2)
            })

            local line = Library:Create("Frame", {
                Parent = ScrollingFrame,
                Name = "",
                BorderColor3 = FromRgb(0, 0, 0),
                Size = Dim2(1, 0, 0, 1),
                BorderSizePixel = 0,
                BackgroundColor3 = Library.Themes.Preset.Outline
            })Library:ApplyTheme(MainHolder, "Outline", "BackgroundColor3") 

            Path.instance = TextButton 
            Path.line = line 
            Path.Priority = "Neutral"
            Path.PriorityText = PriorityText
            -- Library.SelectedPlayer = Players[tostring(Player)]
            
            TextButton.MouseButton1Click:Connect(function()
                if tostring(Player) == Client.Name then 
                    return 
                end 

                if SelectedButton then 
                    SelectedButton.TextColor3 = Library.Themes.Preset.Text 
                    SelectedButton = nil 
                end     

                SelectedButton = PlayerName 
                PlayerName.TextColor3 = Library.Themes.Preset.Accent 

                Library.SelectedPlayer = tostring(Player)
                Library.ConfigFlags["PlayerlistDropDown"](Path.PriorityText.Text)

                if Cfg.Labels.Name then 
                    Cfg.Labels.Name.UpdateText("User: @" .. tostring(Player))
                    Cfg.Labels.Display.UpdateText("Name (Display): " .. Players[tostring(Player)].DisplayName)
                    Cfg.Labels.Uid.UpdateText("User Id: " .. Players[tostring(Player)].UserId)
                end
            end)

            return Path 
        end 

        function Cfg.Search(Text)
            for _, Player in next, Players:GetPlayers() do 
                local Name = tostring(Player)
                local Path = Library.PlayerlistData[Name]

                if Path then 
                    local Sanity = string.lower(Name):match(string.lower(Text)) and true or false
                    Path.instance.Visible = Sanity
                    Path.line.Visible = Sanity
                end 
            end 
        end 

        function Cfg.RemovePlayer(Player) 
            local Path = Library.PlayerlistData[tostring(Player)]
            Path.instance:Destroy() 
            Path.line:Destroy() 
            Path = nil 
        end 

        function Library.Prioritize(Text) 
            local Path = Library.PlayerlistData[Library.SelectedPlayer]
            
            if Path then 
                Path.PriorityText.Text = Text
                Path.PriorityText.TextColor3 = patterns[Text]
                Path.Priority = Text
            end 
        end 

        function Library.GetPriority(Player) 
            local Path = Library.PlayerlistData[tostring(Player)]

            if Path then 
                return Path.Priority
            end 
        end 

        Players.PlayerAdded:Connect(Cfg.CreatePlayer)
        Players.PlayerRemoving:Connect(Cfg.RemovePlayer)
        
        for _, Player in next, Players:GetPlayers() do 
            local PlayerObject = Cfg.CreatePlayer(Player.Name)
            Insert(Library.PlayerlistData, PlayerObject)
        end 

        self:TextBox({Name = "Search", Callback = function(txt)
            Cfg.Search(txt)
        end})
        Cfg.Labels.Name = self:Label({Name = "Name: ??"})
        Cfg.Labels.Display = self:Label({Name = "Display Name: ??"})
        Cfg.Labels.Uid = self:Label({Name = "User Id: ??"})

        return setmetatable(Cfg, Library)
    end
return Library
