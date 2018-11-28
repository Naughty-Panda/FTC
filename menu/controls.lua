 
--[[----------------------------------------------------------
    OPTIONS MENU CONTROLS
  ]]----------------------------------------------------------
    
--[[ 
 * Initialize Unit Frames Component
 * --------------------------------
 * Sets up controls for the menu component of FTC
 * Depends on LibAddonMenu-2.0
 * Called by FTC.Menu:Initialize()
 * --------------------------------
 ]]--
function FTC.Menu:Controls()

    --[[----------------------------------------------------------
        SELECT CORE COMPONENTS
      ]]----------------------------------------------------------
    FTC.Menu.options = {

        -- Components Header
        {   type        = "header", 
            name        = GetString(FTC_Menu_Configure),
            width       = "full" 
        },

        -- Enable/Disable Unit Frames
        {   type        = "checkbox", 
            name        = GetString(FTC_Menu_Frames),
            tooltip     = GetString(FTC_Menu_FramesDesc),
            getFunc     = function() return FTC.Vars.EnableFrames end, 
            setFunc     = function(value) FTC.Menu:Update( 'EnableFrames' , value , true ) end, 
            default     = FTC.Defaults.EnableFrames, 
            warning     = GetString(FTC_Menu_Reload),
        },

        -- Enable/Disable Buff Tracking
        {   type        = "checkbox",
            name        = GetString(FTC_Menu_Buffs),
            tooltip     = GetString(FTC_Menu_BuffsDesc),
            getFunc     = function() return FTC.Vars.EnableBuffs end,
            setFunc     = function(value) FTC.Menu:Update( 'EnableBuffs' , value , true ) end,
            default     = FTC.Defaults.EnableBuffs, 
            warning     = GetString(FTC_Menu_Reload),
        },

        -- Enable/Disable Combat Log
        {   type        = "checkbox",
            name        = GetString(FTC_Menu_Log),
            tooltip     = GetString(FTC_Menu_LogDesc),
            getFunc     = function() return FTC.Vars.EnableLog end,
            setFunc     = function(value) FTC.Menu:Update( 'EnableLog' , value , true ) end, 
            default     = FTC.Defaults.EnableLog, 
            warning     = GetString(FTC_Menu_Reload),
        },

        -- Enable/Disable Scrolling Combat Text
        {   type        = "checkbox", 
            name        = GetString(FTC_Menu_SCT),
            tooltip     = GetString(FTC_Menu_SCTDesc),
            getFunc     = function() return FTC.Vars.EnableSCT end, 
            setFunc     = function(value) FTC.Menu:Update( 'EnableSCT' , value , true ) end, 
            default     = FTC.Defaults.EnableSCT, 
            warning     = GetString(FTC_Menu_Reload),
        },

        -- Enable/Disable Damage Statistics
        {   type        = "checkbox",
            name        = GetString(FTC_Menu_Stats),
            tooltip     = GetString(FTC_Menu_StatsDesc),
            getFunc     = function() return FTC.Vars.EnableStats end, 
            setFunc     = function(value) FTC.Menu:Update( 'EnableStats' , value , true ) end, 
            default     = FTC.Defaults.EnableStats, 
            warning     = GetString(FTC_Menu_Reload),
        },

        -- Enable/Disable Advanced Hotbar
        {   type        = "checkbox", 
            name        = GetString(FTC_Menu_Hotbar),
            tooltip     = GetString(FTC_Menu_HotbarDesc),
            getFunc     = function() return FTC.Vars.EnableHotbar end, 
            setFunc     = function(value) FTC.Menu:Update( 'EnableHotbar' , value , true ) end, 
            default     = FTC.Defaults.EnableHotbar, 
            warning     = GetString(FTC_Menu_Reload),
        },

        -- Reposition Elements?
        { 
            type        = "button", 
            name        = GetString(FTC_Menu_Move),
            tooltip     = GetString(FTC_Menu_MoveDesc),
            func        = function() FTC.Menu:MoveFrames(true) end,
        }, 

        -- Reset Unit Frames
        { 
            type        = "button", 
            name        = GetString(FTC_Menu_Reset),
            tooltip     = GetString(FTC_Menu_ResetDesc),
            func        = function() FTC.Menu:Reset() end,
        }, 
    }

    --[[----------------------------------------------------------
        UNIT FRAMES
      ]]----------------------------------------------------------
    local Frames = {

        -- Unit Frames Header
        {   type        = "header", 
            name        = GetString(FTC_Menu_FHeader),
            width       = "full" 
        },

        -- Use Player Frame?
        {   type        = "checkbox", 
            name        = GetString(FTC_Menu_FPlayerF),
            tooltip     = GetString(FTC_Menu_FPlayerFDesc),
            getFunc     = function() return FTC.Vars.PlayerFrame end, 
            setFunc     = function(value) FTC.Menu:Update( 'PlayerFrame' , value , true ) end, 
            default     = FTC.Defaults.PlayerFrame,
            warning     = GetString(FTC_Menu_Reload),
        },

        -- Use Target Frame?
        {   type        = "checkbox", 
            name        = GetString(FTC_Menu_FTargetF),
            tooltip     = GetString(FTC_Menu_FTargetFDesc),
            getFunc     = function() return FTC.Vars.TargetFrame end, 
            setFunc     = function(value) FTC.Menu:Update( 'TargetFrame' , value ) end, 
            default     = FTC.Defaults.TargetFrame,
        },

        -- Use Small Group Frame?
        {   type        = "checkbox", 
            name        = GetString(FTC_Menu_FGroup),
            tooltip     = GetString(FTC_Menu_FGroupDesc),
            getFunc     = function() return FTC.Vars.GroupFrames end, 
            setFunc     = function(value) FTC.Menu:Update( 'GroupFrames' , value , true ) end,
            default     = FTC.Defaults.GroupFrames,
            warning     = GetString(FTC_Menu_Reload),
        },
        -- Use Raid Frame?
        {   type        = "checkbox", 
            name        = GetString(FTC_Menu_FRaid),
            tooltip     = GetString(FTC_Menu_FRaidDesc),
            getFunc     = function() return FTC.Vars.RaidFrames end, 
            setFunc     = function(value) FTC.Menu:Update( 'RaidFrames' , value , true ) end,
            default     = FTC.Defaults.RaidFrames,
            warning     = GetString(FTC_Menu_Reload),
        },

        -- Keep Default Target Frame?
        {   type        = "checkbox", 
            name        = GetString(FTC_Menu_FShowDef),
            tooltip     = GetString(FTC_Menu_FShowDefDesc),
            getFunc     = function() return FTC.Vars.DefaultTargetFrame end, 
            setFunc     = function(value) FTC.Menu:Update( 'DefaultTargetFrame' , value ) end, 
            default     = FTC.Defaults.DefaultTargetFrame
        },

        -- Label Default Frames?
        {   type        = "checkbox", 
            name        = GetString(FTC_Menu_FLabelDef),
            tooltip     = GetString(FTC_Menu_FLabelDefDesc),
            getFunc     = function() return FTC.Vars.LabelFrames end, 
            setFunc     = function(value) FTC.Menu:UpdateFrames( 'LabelFrames' , value ) end, 
            default     = FTC.Defaults.LabelFrames
        },

        -- Show Maximum Health?
        {   type        = "checkbox", 
            name        = GetString(FTC_Menu_FShowMax),
            tooltip     = GetString(FTC_Menu_FShowMaxDesc),
            getFunc     = function() return FTC.Vars.FrameShowMax end, 
            setFunc     = function(value) FTC.Menu:UpdateFrames( 'FrameShowMax' , value ) end, 
            default     = FTC.Defaults.FrameShowMax
        },

        -- Unit Frame Width
        {   type        = "slider", 
            name        = GetString(FTC_Menu_FWidth),
            tooltip     = GetString(FTC_Menu_FWidthDesc),
            min         = 200, 
            max         = 500, 
            step        = 50, 
            getFunc     = function() return FTC.Vars.FrameWidth end, 
            setFunc     = function( value ) FTC.Menu:UpdateFrames( "FrameWidth" , value ) end, 
            default     = FTC.Defaults.FrameWidth,
        },

        -- Unit Frame Height
        {   type        = "slider", 
            name        = GetString(FTC_Menu_FHeight),
            tooltip     = GetString(FTC_Menu_FHeightDesc),
            min         = 120, 
            max         = 240, 
            step        = 30, 
            getFunc     = function() return FTC.Vars.FrameHeight end, 
            setFunc     = function( value ) FTC.Menu:UpdateFrames( "FrameHeight" , value ) end, 
            default     = FTC.Defaults.FrameHeight,
        },

		-- Target Frame Width
        {   type        = "slider", 
            name        = GetString(FTC_Menu_TFWidth),
            tooltip     = GetString(FTC_Menu_TFWidthDesc),
            min         = 200, 
            max         = 500, 
            step        = 50, 
            getFunc     = function() return FTC.Vars.TargetFrameWidth end, 
            setFunc     = function( value ) FTC.Menu:UpdateFrames( "TargetFrameWidth" , value ) end, 
            default     = FTC.Defaults.TargetFrameWidth,
        },

        -- Target Frame Height
        {   type        = "slider", 
            name        = GetString(FTC_Menu_TFHeight),
            tooltip     = GetString(FTC_Menu_TFHeightDesc),
            min         = 80, 
            max         = 160, 
            step        = 20, 
            getFunc     = function() return FTC.Vars.TargetFrameHeight end, 
            setFunc     = function( value ) FTC.Menu:UpdateFrames( "TargetFrameHeight" , value ) end, 
            default     = FTC.Defaults.TargetFrameHeight,
        },

        -- In-Combat Opacity
        {   type        = "slider", 
            name        = GetString(FTC_Menu_FOpacIn),
            tooltip     = GetString(FTC_Menu_FOpacInDesc),
            min         = 0, 
            max         = 100, 
            step        = 10, 
            getFunc     = function() return FTC.Vars.FrameOpacityIn end, 
            setFunc     = function( value ) FTC.Menu:UpdateFrames( "FrameOpacityIn" , value ) end, 
            default     = FTC.Defaults.OpacityIn
        },
           
        -- Non-Combat Opacity
        {   type        = "slider", 
            name        = GetString(FTC_Menu_FOpacOut),
            tooltip     = GetString(FTC_Menu_FOpacOutDesc),
            min         = 0, 
            max         = 100, 
            step        = 10,
            getFunc     = function() return FTC.Vars.FrameOpacityOut end, 
            setFunc     = function( value ) FTC.Menu:UpdateFrames( "FrameOpacityOut" , value ) end, 
            default     = FTC.Defaults.OpacityOut
        },

        -- In-Combat Target Opacity
        {   type        = "slider", 
            name        = GetString(FTC_Menu_FTOpacIn),
            tooltip     = GetString(FTC_Menu_FTOpacInDesc),
            min         = 0, 
            max         = 100, 
            step        = 10,
            getFunc     = function() return FTC.Vars.FrameTargetOpacityIn end, 
            setFunc     = function( value ) FTC.Menu:UpdateFrames( "FrameTargetOpacityIn" , value ) end, 
            default     = FTC.Defaults.FrameTargetOpacityIn
        },

        -- Non-Combat Target Opacity
        {   type        = "slider", 
            name        = GetString(FTC_Menu_FTOpacOut),
            tooltip     = GetString(FTC_Menu_FTOpacOutDesc),
            min         = 0, 
            max         = 100, 
            step        = 10,
            getFunc     = function() return FTC.Vars.FrameTargetOpacityOut end, 
            setFunc     = function( value ) FTC.Menu:UpdateFrames( "FrameTargetOpacityOut" , value ) end, 
            default     = FTC.Defaults.FrameTargetOpacityOut
        },
		
        -- Primary Frame Font
        {   type        = "dropdown", 
            name        = GetString(FTC_Menu_FFont1),
            tooltip     = GetString(FTC_Menu_FFont1Desc),
            choices     = { "Metamorphous", "ESO Standard" , "ESO Bold" , "Prose Antique" , "Handwritten" , "Trajan Pro" , "Futura Standard" , "Futura Bold" , "Adventure Normal" , "Anonymous Pro Bold" , "Audiowide" , "AvQest" , "Bazooka" , "Emblem" , "Enigmatic" , "Friz Quadrata TT" , "Holy Empire" , "Morpheus" , "Myriad" , "Nightshade" , "OpenDyslexic" , "Qlassik" , "Shojumaru" , "Skurri" , "Sniglet" , "Tahoma" , "Trade Winds" , "Transformers" , "Vera Mono" , "Vera Serif" }, 
            getFunc     = function() return FTC.UI:TranslateFont(FTC.Vars.FrameFont1) end, 
            setFunc     = function( value ) FTC.Menu:UpdateFrames( "FrameFont1" , FTC.UI:TranslateFont(value) ) end,
            default     = FTC.Defaults.FrameFont1, 
        },

        -- Secondary Frame Font
        {   type        = "dropdown", 
            name        = GetString(FTC_Menu_FFont2),
            tooltip     = GetString(FTC_Menu_FFont2Desc),
            choices     = { "Metamorphous", "ESO Standard" , "ESO Bold" , "Prose Antique" , "Handwritten" , "Trajan Pro" , "Futura Standard" , "Futura Bold" , "Adventure Normal" , "Anonymous Pro Bold" , "Audiowide" , "AvQest" , "Bazooka" , "Emblem" , "Enigmatic" , "Friz Quadrata TT" , "Holy Empire" , "Morpheus" , "Myriad" , "Nightshade" , "OpenDyslexic" , "Qlassik" , "Shojumaru" , "Skurri" , "Sniglet" , "Tahoma" , "Trade Winds" , "Transformers" , "Vera Mono" , "Vera Serif" }, 
            getFunc     = function() return FTC.UI:TranslateFont(FTC.Vars.FrameFont2) end, 
            setFunc     = function( value ) FTC.Menu:UpdateFrames( "FrameFont2" , FTC.UI:TranslateFont(value) ) end,
            default     = FTC.Defaults.FrameFont2, 
        },

        -- Frame Font Size
        {   type        = "slider", 
            name        = GetString(FTC_Menu_FFontS),
            tooltip     = GetString(FTC_Menu_FFontSDesc),
            min         = 12,
            max         = 24, 
            step        = 1, 
            getFunc     = function() return FTC.Vars.FrameFontSize end, 
            setFunc     = function( value ) FTC.Menu:UpdateFrames( "FrameFontSize" , value ) end, 
            default     = FTC.Defaults.FrameFontSize
        },

        -- Execute Threshold
        {   type        = "slider", 
            name        = GetString(FTC_Menu_Exceute),
            tooltip     = GetString(FTC_Menu_ExecuteDesc),
            min         = 0,
            max         = 50, 
            step        = 5, 
            getFunc     = function() return FTC.Vars.ExecuteThreshold end, 
            setFunc     = function( value ) FTC.Menu:Update( "ExecuteThreshold" , value ) end, 
            default     = FTC.Defaults.ExecuteThreshold
        },

        -- Display Nameplate?
        {   type        = "checkbox", 
            name        = GetString(FTC_Menu_FShowName),
            tooltip     = GetString(FTC_Menu_FShowNameDesc),
            getFunc     = function() return FTC.Vars.EnableNameplate end, 
            setFunc     = function(value) FTC.Menu:UpdateFrames( 'EnableNameplate' , value ) end, 
            default     = FTC.Defaults.EnableNameplate
        },

        -- Display Experience Bar?
        {   type        = "checkbox", 
            name        = GetString(FTC_Menu_FShowXP),
            tooltip     = GetString(FTC_Menu_FShowXPDesc),
            getFunc     = function() return FTC.Vars.EnableXPBar end, 
            setFunc     = function(value) FTC.Menu:UpdateFrames( 'EnableXPBar' , value ) end, 
            default     = FTC.Defaults.EnableXPBar
        },
		
        -- Show Level on Target Frame?
        {   type        = "checkbox", 
            name        = GetString(FTC_Menu_FTargetL),
            tooltip     = GetString(FTC_Menu_FTargetLDesc),
            getFunc     = function() return FTC.Vars.TargetFrameLevel end, 
            setFunc     = function(value) FTC.Menu:UpdateFrames( 'TargetFrameLevel' , value ) end,
            default     = FTC.Defaults.TargetFrameLevel
        },

        -- Show Titles on Target Frame?
        {   type        = "checkbox", 
            name        = GetString(FTC_Menu_FTargetT),
            tooltip     = GetString(FTC_Menu_FTargetTDesc),
            getFunc     = function() return FTC.Vars.TargetFrameTitle end, 
            setFunc     = function(value) FTC.Menu:Update( 'TargetFrameTitle' , value , true) end, 
            default     = FTC.Defaults.TargetFrameTitle,
			warning     = GetString(FTC_Menu_Reload),
        },
		
        -- Show @Name in Target Frame?
        {   type        = "checkbox", 
            name        = GetString(FTC_Menu_FTargetShowA),
            tooltip     = GetString(FTC_Menu_FTargetShowADesc),
            getFunc     = function() return FTC.Vars.TargetFrameShowAccount end, 
            setFunc     = function(value) FTC.Menu:UpdateFrames( 'TargetFrameShowAccount' , value ) end,
            default     = FTC.Defaults.TargetFrameShowAccount
        },		

        -- Font Color
        {   type        = "colorpicker", 
            name        = GetString(FTC_Menu_FFontC),
            tooltip     = GetString(FTC_Menu_FFontCDesc),
            getFunc     = function() return FTC.Vars.FrameFontColor[1],FTC.Vars.FrameFontColor[2],FTC.Vars.FrameFontColor[3] end, 
            setFunc     = function(r,g,b,a) FTC.Menu:UpdateFrames('FrameFontColor', { math.floor(r*100)/100 , math.floor(g*100)/100 , math.floor(b*100)/100 }) end,
            default     = FTC.Vars.FrameFontColor,
        },
		
		-- Frame Texture options
        {   type        = "dropdown", 
            name        = "Frame texture",
            tooltip     = "Choose frame texture. [Default: Grainy]",
            choices     = { "Grainy", "Aluminium", "Metal", "Stone", "Scratch", "Graphite", "Grid", "Healbot", "Diagonals", "Rays", "Blot", "Frost", "Hexagon", "Leaves", "Lightning", "LiteStep", "DarkStep", "Rocks", "Runes", "Round", "Striped", "Tukui", "Tube", "Wave", "Xeon", "Banto", "Glaze", "Minimalist", "Normtex", "Simple", "Smooth", "Upline", "Otravi", "Cilinder", "Faded", "Oldbar" },
            getFunc     = function() return FTC.UI:TranslateTex(FTC.Vars.FrameTexture) end,
            setFunc     = function( value ) FTC.Menu:UpdateFrames( "FrameTexture" , FTC.UI:TranslateTex(value) ) end,
            default     = FTC.Defaults.FrameTexture,
        },

        -- Health Bar Color
        {   type        = "colorpicker", 
            name        = GetString(FTC_Menu_FHealthC),
            tooltip     = GetString(FTC_Menu_FHealthCDesc),
            getFunc     = function() return FTC.Vars.FrameHealthColor[1],FTC.Vars.FrameHealthColor[2],FTC.Vars.FrameHealthColor[3] end, 
            setFunc     = function(r,g,b,a) FTC.Menu:UpdateFrames('FrameHealthColor', { math.floor(r*100)/100 , math.floor(g*100)/100 , math.floor(b*100)/100 }) end,
            default     = FTC.Vars.FrameHealthColor,
        },

        -- Magicka Bar Color
        {   type        = "colorpicker", 
            name        = GetString(FTC_Menu_FMagickaC),
            tooltip     = GetString(FTC_Menu_FMagickaCDesc),
            getFunc     = function() return FTC.Vars.FrameMagickaColor[1],FTC.Vars.FrameMagickaColor[2],FTC.Vars.FrameMagickaColor[3] end, 
            setFunc     = function(r,g,b,a) FTC.Menu:UpdateFrames('FrameMagickaColor', { math.floor(r*100)/100 , math.floor(g*100)/100 , math.floor(b*100)/100 }) end,
            default     = FTC.Vars.FrameMagickaColor,
        },

        -- Stamina Bar Color
        {   type        = "colorpicker", 
            name        = GetString(FTC_Menu_FStaminaC),
            tooltip     = GetString(FTC_Menu_FStaminaCDesc),
            getFunc     = function() return FTC.Vars.FrameStaminaColor[1],FTC.Vars.FrameStaminaColor[2],FTC.Vars.FrameStaminaColor[3] end, 
            setFunc     = function(r,g,b,a) FTC.Menu:UpdateFrames('FrameStaminaColor', { math.floor(r*100)/100 , math.floor(g*100)/100 , math.floor(b*100)/100 }) end,
            default     = FTC.Vars.FrameStaminaColor,
        },

        -- Shield Bar Color
        {   type        = "colorpicker", 
            name        = GetString(FTC_Menu_FShieldC),
            tooltip     = GetString(FTC_Menu_FShieldCDesc),
            getFunc     = function() return FTC.Vars.FrameShieldColor[1],FTC.Vars.FrameShieldColor[2],FTC.Vars.FrameShieldColor[3] end, 
            setFunc     = function(r,g,b,a) FTC.Menu:UpdateFrames('FrameShieldColor', { math.floor(r*100)/100 , math.floor(g*100)/100 , math.floor(b*100)/100 }) end,
            default     = FTC.Vars.FrameShieldColor,
        },

        -- Group Frame Width
        {   type        = "slider", 
            name        = GetString(FTC_Menu_FGWidth),
            tooltip     = GetString(FTC_Menu_FGWidthDesc),
            min         = 150, 
            max         = 350, 
            step        = 50, 
            getFunc     = function() return FTC.Vars.GroupWidth end, 
            setFunc     = function( value ) FTC.Menu:UpdateFrames( "GroupWidth" , value ) end, 
            default     = FTC.Defaults.GroupWidth,
        },

        -- Group Frame Height
        {   type        = "slider", 
            name        = GetString(FTC_Menu_FGHeight),
            tooltip     = GetString(FTC_Menu_FGHeightDesc),
            min         = 250, 
            max         = 400, 
            step        = 50, 
            getFunc     = function() return FTC.Vars.GroupHeight end, 
            setFunc     = function( value ) FTC.Menu:UpdateFrames( "GroupHeight" , value ) end, 
            default     = FTC.Defaults.GroupHeight,
        },

        -- Group Frame Font Size
        {   type        = "slider", 
            name        = GetString(FTC_Menu_FGFontS),
            tooltip     = GetString(FTC_Menu_FGFontSDesc),
            min         = 12,
            max         = 24, 
            step        = 1, 
            getFunc     = function() return FTC.Vars.GroupFontSize end, 
            setFunc     = function( value ) FTC.Menu:UpdateFrames( "GroupFontSize" , value ) end, 
            default     = FTC.Defaults.GroupFontSize
        },

        -- Show Player in Group Frame?
        {   type        = "checkbox", 
            name        = GetString(FTC_Menu_FGHideP),
            tooltip     = GetString(FTC_Menu_FGHidePDesc),
            getFunc     = function() return FTC.Vars.GroupHidePlayer end, 
            setFunc     = function(value) FTC.Menu:UpdateFrames( 'GroupHidePlayer' , value ) end,
            default     = FTC.Defaults.GroupHidePlayer
        },

        -- Show Level in Group Frame?
        {   type        = "checkbox", 
            name        = GetString(FTC_Menu_FGShowL),
            tooltip     = GetString(FTC_Menu_FGShowLDesc),
            getFunc     = function() return FTC.Vars.GroupShowLevel end, 
            setFunc     = function(value) FTC.Menu:UpdateFrames( 'GroupShowLevel' , value ) end,
            default     = FTC.Defaults.GroupShowLevel
        },	
		
        -- Show @Name in Group Frame?
        {   type        = "checkbox", 
            name        = GetString(FTC_Menu_FGShowA),
            tooltip     = GetString(FTC_Menu_FGShowADesc),
            getFunc     = function() return FTC.Vars.GroupShowAccount end, 
            setFunc     = function(value) FTC.Menu:UpdateFrames( 'GroupShowAccount' , value ) end,
            default     = FTC.Defaults.GroupShowAccount
        },		

        -- Colorize Roles?
        {   type        = "checkbox", 
            name        = GetString(FTC_Menu_FColorR),
            tooltip     = GetString(FTC_Menu_FColorRDesc),
            getFunc     = function() return FTC.Vars.ColorRoles end, 
            setFunc     = function(value) FTC.Menu:UpdateFrames( 'ColorRoles' , value ) end,
            default     = FTC.Defaults.ColorRoles
        },

        -- Tank Role Color
        {   type        = "colorpicker", 
            name        = GetString(FTC_Menu_FTankC),
            tooltip     = GetString(FTC_Menu_FTankCDesc),
            getFunc     = function() return unpack(FTC.Vars.FrameTankColor) end, 
            setFunc     = function(r,g,b,a) FTC.Menu:UpdateFrames('FrameTankColor', { math.floor(r*100)/100 , math.floor(g*100)/100 , math.floor(b*100)/100 }) end,
            default     = FTC.Vars.FrameTankColor,
        },

        -- Healer Role Color
        {   type        = "colorpicker", 
            name        = GetString(FTC_Menu_FHealerC),
            tooltip     = GetString(FTC_Menu_FHealerCDesc),
            getFunc     = function() return unpack(FTC.Vars.FrameHealerColor) end, 
            setFunc     = function(r,g,b,a) FTC.Menu:UpdateFrames('FrameHealerColor', { math.floor(r*100)/100 , math.floor(g*100)/100 , math.floor(b*100)/100 }) end,
            default     = FTC.Vars.FrameHealerColor,
        },

        -- DPS Role Color
        {   type        = "colorpicker", 
            name        = GetString(FTC_Menu_FDamageC),
            tooltip     = GetString(FTC_Menu_FDamageCDesc),
            getFunc     = function() return unpack(FTC.Vars.FrameDamageColor) end, 
            setFunc     = function(r,g,b,a) FTC.Menu:UpdateFrames('FrameDamageColor', { math.floor(r*100)/100 , math.floor(g*100)/100 , math.floor(b*100)/100 }) end,
            default     = FTC.Vars.FrameDamageColor,
        },

        -- Raid Column Size
        {   type        = "dropdown", 
            name        = GetString(FTC_Menu_FRaidS),
            tooltip     = GetString(FTC_Menu_FRaidSDesc),
            choices     = { 4 , 6 , 8 , 12 }, 
            getFunc     = function() return FTC.Vars.RaidColumnSize end, 
            setFunc     = function( value ) FTC.Menu:UpdateFrames( "RaidColumnSize" , value ) end,
            default     = FTC.Defaults.RaidColumnSize,
        },

        -- Raid Frame Width
        {   type        = "slider", 
            name        = GetString(FTC_Menu_FRWidth),
            tooltip     = GetString(FTC_Menu_FRWidthDesc),
            min         = 90, 
            max         = 180, 
            step        = 30, 
            getFunc     = function() return FTC.Vars.RaidWidth end, 
            setFunc     = function( value ) FTC.Menu:UpdateFrames( "RaidWidth" , value ) end, 
            default     = FTC.Defaults.RaidWidth,
        },

        -- Raid Frame Height
        {   type        = "slider", 
            name        = GetString(FTC_Menu_FRHeight),
            tooltip     = GetString(FTC_Menu_FRHeightDesc),
            min         = 40, 
            max         = 60, 
            step        = 10, 
            getFunc     = function() return FTC.Vars.RaidHeight end, 
            setFunc     = function( value ) FTC.Menu:UpdateFrames( "RaidHeight" , value ) end, 
            default     = FTC.Defaults.RaidHeight,
        },

        -- Raid Frame Font Size
        {   type        = "slider", 
            name        = GetString(FTC_Menu_FRFontS),
            tooltip     = GetString(FTC_Menu_FRFontSDesc),
            min         = 10,
            max         = 18, 
            step        = 1, 
            getFunc     = function() return FTC.Vars.RaidFontSize end, 
            setFunc     = function( value ) FTC.Menu:UpdateFrames( "RaidFontSize" , value ) end, 
            default     = FTC.Defaults.RaidFontSize
        },

        -- Reset Unit Frames
        { 
            type        = "button", 
            name        = GetString(FTC_Menu_FReset),
            tooltip     = GetString(FTC_Menu_FResetDesc),
            func        = function() FTC.Menu:Reset("Frames") end,
        }, 
    }
    if FTC.Vars.EnableFrames then
        for i = 1 , #Frames do table.insert( FTC.Menu.options , Frames[i] ) end
    end

    --[[----------------------------------------------------------
        BUFF TRACKING
      ]]----------------------------------------------------------
    local Buffs = {

        -- Buff Tracking Header
        {   type        = "header", 
            name        = GetString(FTC_Menu_BHeader),
            width       = "full" 
        },

        -- Player Buff Format
        {   type        = "dropdown", 
            name        = GetString(FTC_Menu_BPBFormat),
            tooltip     = GetString(FTC_Menu_BPBFormatDesc),
            choices     = { GetString(FTC_BuffFormat1) , GetString(FTC_BuffFormat2) , GetString(FTC_BuffFormat3) , GetString(FTC_BuffFormat4) , GetString(FTC_BuffFormat5) , GetString(FTC_BuffFormat6) , GetString(FTC_BuffFormat0) }, 
            getFunc     = function() return FTC.Menu:GetBuffFormat(FTC.Vars.PlayerBuffFormat) end, 
            setFunc     = function( value ) FTC.Menu:UpdateBuffFormat('PlayerBuffFormat',value) end,
            default     = FTC.Menu:GetBuffFormat(FTC.Defaults.PlayerBuffFormat), 
        },

        -- Player Debuff Format
        {   type        = "dropdown", 
            name        = GetString(FTC_Menu_BPDFormat),
            tooltip     = GetString(FTC_Menu_BPDFormatDesc),
            choices     = { GetString(FTC_BuffFormat1) , GetString(FTC_BuffFormat2) , GetString(FTC_BuffFormat3) , GetString(FTC_BuffFormat4) , GetString(FTC_BuffFormat5) , GetString(FTC_BuffFormat6) , GetString(FTC_BuffFormat0) }, 
            getFunc     = function() return FTC.Menu:GetBuffFormat(FTC.Vars.PlayerDebuffFormat) end, 
            setFunc     = function( value ) FTC.Menu:UpdateBuffFormat('PlayerDebuffFormat',value) end,
            default     = FTC.Menu:GetBuffFormat(FTC.Defaults.PlayerDebuffFormat), 
        },

        -- Long Buff Format
        {   type        = "dropdown", 
            name        = GetString(FTC_Menu_BLBFormat),
            tooltip     = GetString(FTC_Menu_BLBFormatDesc),
            choices     = { GetString(FTC_BuffFormat1) , GetString(FTC_BuffFormat2) , GetString(FTC_BuffFormat3) , GetString(FTC_BuffFormat4) , GetString(FTC_BuffFormat5) , GetString(FTC_BuffFormat6) , GetString(FTC_BuffFormat0) }, 
            getFunc     = function() return FTC.Menu:GetBuffFormat(FTC.Vars.LongBuffFormat) end, 
            setFunc     = function( value ) FTC.Menu:UpdateBuffFormat('LongBuffFormat',value) end,
            default     = FTC.Menu:GetBuffFormat(FTC.Defaults.LongBuffFormat),
        },

        -- Target Buff Format
        {   type        = "dropdown", 
            name        = GetString(FTC_Menu_BTBFormat),
            tooltip     = GetString(FTC_Menu_BTBFormatDesc),
            choices     = { GetString(FTC_BuffFormat1) , GetString(FTC_BuffFormat2) , GetString(FTC_BuffFormat3) , GetString(FTC_BuffFormat4) , GetString(FTC_BuffFormat5) , GetString(FTC_BuffFormat6) , GetString(FTC_BuffFormat0) }, 
            getFunc     = function() return FTC.Menu:GetBuffFormat(FTC.Vars.TargetBuffFormat) end, 
            setFunc     = function( value ) FTC.Menu:UpdateBuffFormat('TargetBuffFormat',value) end,
            default     = FTC.Menu:GetBuffFormat(FTC.Defaults.TargetBuffFormat),
        },

        -- Target Debuff Format
        {   type        = "dropdown", 
            name        = GetString(FTC_Menu_BTDFormat),
            tooltip     = GetString(FTC_Menu_BTDFormatDesc),
            choices     = { GetString(FTC_BuffFormat1) , GetString(FTC_BuffFormat2) , GetString(FTC_BuffFormat3) , GetString(FTC_BuffFormat4) , GetString(FTC_BuffFormat5) , GetString(FTC_BuffFormat6) , GetString(FTC_BuffFormat0) }, 
            getFunc     = function() return FTC.Menu:GetBuffFormat(FTC.Vars.TargetDebuffFormat) end, 
            setFunc     = function( value ) FTC.Menu:UpdateBuffFormat('TargetDebuffFormat',value) end,
            default     = FTC.Menu:GetBuffFormat(FTC.Defaults.TargetDebuffFormat),
        },

        -- Primary Buffs Font
        {   type        = "dropdown", 
            name        = GetString(FTC_Menu_BFont1),
            tooltip     = GetString(FTC_Menu_BFont1Desc),
            choices     = { "Metamorphous", "ESO Standard" , "ESO Bold" , "Prose Antique" , "Handwritten" , "Trajan Pro" , "Futura Standard" , "Futura Bold" , "Adventure Normal" , "Anonymous Pro Bold" , "Audiowide" , "AvQest" , "Bazooka" , "Emblem" , "Enigmatic" , "Friz Quadrata TT" , "Holy Empire" , "Morpheus" , "Myriad" , "Nightshade" , "OpenDyslexic" , "Qlassik" , "Shojumaru" , "Skurri" , "Sniglet" , "Tahoma" , "Trade Winds" , "Transformers" , "Vera Mono" , "Vera Serif" }, 
            getFunc     = function() return FTC.UI:TranslateFont(FTC.Vars.BuffsFont1) end, 
            setFunc     = function( value ) FTC.Menu:UpdateBuffs( "BuffsFont1" , FTC.UI:TranslateFont(value) ) end,
            default     = FTC.Defaults.BuffsFont1, 
        },

        -- Secondary Buffs Font
        {   type        = "dropdown", 
            name        = GetString(FTC_Menu_BFont2),
            tooltip     = GetString(FTC_Menu_BFont2Desc),
            choices     = { "Metamorphous", "ESO Standard" , "ESO Bold" , "Prose Antique" , "Handwritten" , "Trajan Pro" , "Futura Standard" , "Futura Bold" , "Adventure Normal" , "Anonymous Pro Bold" , "Audiowide" , "AvQest" , "Bazooka" , "Emblem" , "Enigmatic" , "Friz Quadrata TT" , "Holy Empire" , "Morpheus" , "Myriad" , "Nightshade" , "OpenDyslexic" , "Qlassik" , "Shojumaru" , "Skurri" , "Sniglet" , "Tahoma" , "Trade Winds" , "Transformers" , "Vera Mono" , "Vera Serif" }, 
            getFunc     = function() return FTC.UI:TranslateFont(FTC.Vars.BuffsFont2) end, 
            setFunc     = function( value ) FTC.Menu:UpdateBuffs( "BuffsFont2" , FTC.UI:TranslateFont(value) ) end,
            default     = FTC.Defaults.BuffsFont2, 
        },

        -- Frame Font Size
        {   type        = "slider", 
            name        = GetString(FTC_Menu_BFontS),
            tooltip     = GetString(FTC_Menu_BFontSDesc),
            min         = 12,
            max         = 24, 
            step        = 1, 
            getFunc     = function() return FTC.Vars.BuffsFontSize end, 
            setFunc     = function( value ) FTC.Menu:UpdateBuffs( "BuffsFontSize" , value ) end, 
            default     = FTC.Defaults.BuffsFontSize
        },

        -- Reset Buffs
        { 
            type        = "button", 
            name        = GetString(FTC_Menu_BReset),
            tooltip     = GetString(FTC_Menu_BResetDesc),
            func        = function() FTC.Menu:Reset("Buffs") end,
        }, 
    }
    if FTC.Vars.EnableBuffs then
        for i = 1 , #Buffs do table.insert( FTC.Menu.options , Buffs[i] ) end
    end


    --[[----------------------------------------------------------
        COMBAT LOG
      ]]----------------------------------------------------------
    local Log = {

        -- Buff Tracking Header
        {   type        = "header", 
            name        = GetString(FTC_Menu_LHeader),
            width       = "full" 
        },

        -- Alternate Log with Chat
        {   type        = "checkbox", 
            name        = GetString(FTC_Menu_LAltChat),
            tooltip     = GetString(FTC_Menu_LAltChatDesc),
            getFunc     = function() return FTC.Vars.AlternateChat end, 
            setFunc     = function(value) FTC.Menu:UpdateLog( 'AlternateChat' , value ) end, 
            default     = FTC.Defaults.AlternateChat, 
        },
		
        -- Hide healing?
        { 
            type        = "checkbox", 
            name        = GetString(FTC_Menu_LHideHeal),
            tooltip     = GetString(FTC_Menu_LHideHealDesc),
            getFunc     = function() return FTC.Vars.LogHideHeal end, 
            setFunc     = function(value) FTC.Menu:Update( 'LogHideHeal' , value ) end, 
            default     = FTC.Defaults.LogHideHeal,
        },

        -- Combat only healing?
        { 
            type        = "checkbox", 
            name        = GetString(FTC_Menu_LCOH),
            tooltip     = GetString(FTC_Menu_LCOHDesc),
            getFunc     = function() return FTC.Vars.LogCOH end, 
            setFunc     = function(value) FTC.Menu:Update( 'LogCOH' , value ) end, 
            default     = FTC.Defaults.LogCOH,
        },		

        -- Combat Log Font
        {   type        = "dropdown", 
            name        = GetString(FTC_Menu_LFont),
            tooltip     = GetString(FTC_Menu_LFontDesc),
            choices     = { "Metamorphous", "ESO Standard" , "ESO Bold" , "Prose Antique" , "Handwritten" , "Trajan Pro" , "Futura Standard" , "Futura Bold" , "Adventure Normal" , "Anonymous Pro Bold" , "Audiowide" , "AvQest" , "Bazooka" , "Emblem" , "Enigmatic" , "Friz Quadrata TT" , "Holy Empire" , "Morpheus" , "Myriad" , "Nightshade" , "OpenDyslexic" , "Qlassik" , "Shojumaru" , "Skurri" , "Sniglet" , "Tahoma" , "Trade Winds" , "Transformers" , "Vera Mono" , "Vera Serif" }, 
            getFunc     = function() return FTC.UI:TranslateFont(FTC.Vars.LogFont) end, 
            setFunc     = function( value ) FTC.Menu:UpdateLog( "LogFont" , FTC.UI:TranslateFont(value) ) end,
            default     = FTC.Defaults.LogFont, 
        },

        -- Combat Log Size
        {   type        = "slider", 
            name        = GetString(FTC_Menu_LFontS),
            tooltip     = GetString(FTC_Menu_LFontSDesc),
            min         = 12,
            max         = 24, 
            step        = 1, 
            getFunc     = function() return FTC.Vars.LogFontSize end, 
            setFunc     = function( value ) FTC.Menu:UpdateLog( "LogFontSize" , value ) end, 
            default     = FTC.Defaults.LogFontSize
        },

        -- Combat Log Opacity
        {   type        = "slider", 
            name        = GetString(FTC_Menu_LOpacity),
            tooltip     = GetString(FTC_Menu_LOpacityDesc),
            min         = 0,
            max         = 100, 
            step        = 5, 
            getFunc     = function() return FTC.Vars.LogOpacity end, 
            setFunc     = function( value ) FTC.Menu:UpdateLog( "LogOpacity" , value ) end, 
            default     = FTC.Defaults.LogOpacity
        },

        -- Reset Log
        { 
            type        = "button", 
            name        = GetString(FTC_Menu_LReset),
            tooltip     = GetString(FTC_Menu_LResetDesc),
            func        = function() FTC.Menu:Reset("Log") end,
        }, 
    }
    if FTC.Vars.EnableLog then
        for i = 1 , #Log do table.insert( FTC.Menu.options , Log[i] ) end
    end


    --[[----------------------------------------------------------
        SCROLLING COMBAT TEXT
      ]]----------------------------------------------------------
    local SCT = {

        -- SCT Header
        { 
            type        = "header", 
            name        = GetString(FTC_Menu_SHeader),
            width       = "full", 
        },

        -- Display Ability Icons?
        { 
            type        = "checkbox", 
            name        = GetString(FTC_Menu_SIcons),
            tooltip     = GetString(FTC_Menu_SIconsDesc),
            getFunc     = function() return FTC.Vars.SCTIcons end, 
            setFunc     = function(value) FTC.Menu:Update( 'SCTIcons' , value ) end, 
            default     = FTC.Defaults.SCTIcons,
        },
      
        -- Display Ability Names?
        { 
            type        = "checkbox", 
            name        = GetString(FTC_Menu_SNames),
            tooltip     = GetString(FTC_Menu_SNamesDesc),
            getFunc     = function() return FTC.Vars.SCTNames end, 
            setFunc     = function(value) FTC.Menu:Update( 'SCTNames' , value ) end, 
            default     = FTC.Defaults.SCTNames,
        },

        -- Round Values?
        { 
            type        = "checkbox", 
            name        = GetString(FTC_Menu_SRound),
            tooltip     = GetString(FTC_Menu_SRoundDesc),
            getFunc     = function() return FTC.Vars.SCTRound end, 
            setFunc     = function(value) FTC.Menu:Update( 'SCTRound' , value ) end, 
            default     = FTC.Defaults.SCTRound,
        },

        -- Display Alerts?
        { 
            type        = "checkbox", 
            name        = GetString(FTC_Menu_SAlerts),
            tooltip     = GetString(FTC_Menu_SAlertsDesc),
            getFunc     = function() return FTC.Vars.SCTAlerts end, 
            setFunc     = function(value) FTC.Menu:Update( 'SCTAlerts' , value ) end, 
            default     = FTC.Defaults.SCTAlerts,
        },

        -- Hide healing?
        { 
            type        = "checkbox", 
            name        = GetString(FTC_Menu_SHideHeal),
            tooltip     = GetString(FTC_Menu_SHideHealDesc),
            getFunc     = function() return FTC.Vars.SCTHideHeal end, 
            setFunc     = function(value) FTC.Menu:Update( 'SCTHideHeal' , value ) end, 
            default     = FTC.Defaults.SCTHideHeal,
        },

        -- Combat only healing?
        { 
            type        = "checkbox", 
            name        = GetString(FTC_Menu_SCOH),
            tooltip     = GetString(FTC_Menu_SCOHDesc),
            getFunc     = function() return FTC.Vars.SCTCOH end, 
            setFunc     = function(value) FTC.Menu:Update( 'SCTCOH' , value ) end, 
            default     = FTC.Defaults.SCTCOH,
        },

        -- SCT Scroll Speed
        {   type        = "slider", 
            name        = GetString(FTC_Menu_SSpeed),
            tooltip     = GetString(FTC_Menu_SSpeedDesc),
            min         = 0,
            max         = 10, 
            step        = 1, 
            getFunc     = function() return FTC.Vars.SCTSpeed end, 
            setFunc     = function( value ) FTC.Menu:Update( "SCTSpeed" , value ) end, 
            default     = FTC.Defaults.SCTSpeed
        },

        -- SCT Arc Intensity
        {   type        = "slider", 
            name        = GetString(FTC_Menu_SArc),
            tooltip     = GetString(FTC_Menu_SArcDesc),
            min         = -10,
            max         = 10, 
            step        = 1, 
            getFunc     = function() return FTC.Vars.SCTArc end, 
            setFunc     = function( value ) FTC.Menu:Update( "SCTArc" , value ) end, 
            default     = FTC.Defaults.SCTArc
        },

        -- Outgoing SCT Direction
        {   type        = "dropdown", 
            name        = GetString(FTC_Menu_SScrollOut),
            tooltip     = GetString(FTC_Menu_SScrollOutDesc),
            choices     = { "Up" , "Down" }, 
            getFunc     = function() return FTC.Vars.SCTOutScroll end, 
            setFunc     = function( value ) FTC.Menu:Update( "SCTOutScroll" , value ) end,
            default     = FTC.Defaults.SCTOutScroll, 
        },

        -- Incoming SCT Direction
        {   type        = "dropdown", 
            name        = GetString(FTC_Menu_SScrollIn),
            tooltip     = GetString(FTC_Menu_SScrollInDesc),
            choices     = { "Up" , "Down" }, 
            getFunc     = function() return FTC.Vars.SCTInScroll end, 
            setFunc     = function( value ) FTC.Menu:Update( "SCTInScroll" , value ) end,
            default     = FTC.Defaults.SCTInScroll, 
        },

        -- Primary SCT Font
        {   type        = "dropdown", 
            name        = GetString(FTC_Menu_SFont1),
            tooltip     = GetString(FTC_Menu_SFont1Desc),
            choices     = { "Metamorphous", "ESO Standard" , "ESO Bold" , "Prose Antique" , "Handwritten" , "Trajan Pro" , "Futura Standard" , "Futura Bold" , "Adventure Normal" , "Anonymous Pro Bold" , "Audiowide" , "AvQest" , "Bazooka" , "Emblem" , "Enigmatic" , "Friz Quadrata TT" , "Holy Empire" , "Morpheus" , "Myriad" , "Nightshade" , "OpenDyslexic" , "Qlassik" , "Shojumaru" , "Skurri" , "Sniglet" , "Tahoma" , "Trade Winds" , "Transformers" , "Vera Mono" , "Vera Serif" }, 
            getFunc     = function() return FTC.UI:TranslateFont(FTC.Vars.SCTFont1) end, 
            setFunc     = function( value ) FTC.Menu:Update( "SCTFont1" , FTC.UI:TranslateFont(value) ) end,
            default     = FTC.Defaults.SCTFont1, 
        },

        -- Secondary SCT Font
        {   type        = "dropdown", 
            name        = GetString(FTC_Menu_SFont2),
            tooltip     = GetString(FTC_Menu_SFont2Desc),
            choices     = { "Metamorphous", "ESO Standard" , "ESO Bold" , "Prose Antique" , "Handwritten" , "Trajan Pro" , "Futura Standard" , "Futura Bold" , "Adventure Normal" , "Anonymous Pro Bold" , "Audiowide" , "AvQest" , "Bazooka" , "Emblem" , "Enigmatic" , "Friz Quadrata TT" , "Holy Empire" , "Morpheus" , "Myriad" , "Nightshade" , "OpenDyslexic" , "Qlassik" , "Shojumaru" , "Skurri" , "Sniglet" , "Tahoma" , "Trade Winds" , "Transformers" , "Vera Mono" , "Vera Serif" }, 
            getFunc     = function() return FTC.UI:TranslateFont(FTC.Vars.SCTFont2) end, 
            setFunc     = function( value ) FTC.Menu:Update( "SCTFont2" , FTC.UI:TranslateFont(value) ) end,
            default     = FTC.Defaults.SCTFont2, 
        },

        -- SCT Font Size
        {   type        = "slider", 
            name        = GetString(FTC_Menu_SFontS),
            tooltip     = GetString(FTC_Menu_SFontSDesc),
            min         = 12,
            max         = 36, 
            step        = 1, 
            getFunc     = function() return FTC.Vars.SCTFontSize end, 
            setFunc     = function( value ) FTC.Menu:Update( "SCTFontSize" , value ) end, 
            default     = FTC.Defaults.SCTFontSize
        },

        -- SCT Icon Size
        {   type        = "slider", 
            name        = GetString(FTC_Menu_SIconS),
            tooltip     = GetString(FTC_Menu_SIconSDesc),
            min         = 24,
            max         = 64, 
            step        = 4, 
            getFunc     = function() return FTC.Vars.SCTIconSize end, 
            setFunc     = function( value ) FTC.Menu:Update( "SCTIconSize" , value ) end, 
            default     = FTC.Defaults.SCTIconSize
        },

        -- Reset SCT
        { 
            type        = "button",
            name        = GetString(FTC_Menu_SCTReset),
            tooltip     = GetString(FTC_Menu_SCTResetDesc),
            func        = function() FTC.Menu:Reset("SCT") end,
        },
    }
    if FTC.Vars.EnableSCT then
        for i = 1 , #SCT do table.insert( FTC.Menu.options , SCT[i] ) end
    end

    --[[----------------------------------------------------------
        DAMAGE STATISTICS
      ]]----------------------------------------------------------
    local Stats = {
        
        -- Statistics Header
        { 
            type        = "header", 
            name        = GetString(FTC_Menu_THeader),
            width       = "full", 
        },

        -- Damage Tracker Timeout
        { 
            type        = "slider", 
            name        = GetString(FTC_Menu_TTimeout), 
            tooltip     = GetString(FTC_Menu_TTimeoutDesc),
            min         = 5, 
            max         = 60, 
            step        = 5, 
            getFunc     = function() return FTC.Vars.DamageTimeout end, 
            setFunc     = function( value ) FTC.Menu:Update( "DamageTimeout" , value ) end,
            default     = FTC.Defaults.DamageTimeout,
        },

        -- Reset Healing?
        { 
            type        = "checkbox", 
            name        = GetString(FTC_Menu_TRHeal),
            tooltip     = GetString(FTC_Menu_TRHealDesc),
            getFunc     = function() return FTC.Vars.StatTriggerHeals end, 
            setFunc     = function(value) FTC.Menu:Update( 'StatTriggerHeals' , value ) end, 
            default     = FTC.Defaults.StatTriggerHeals,
        },

        -- Share DPS with Group?
        { 
            type        = "checkbox", 
            name        = GetString(FTC_Menu_TShare),
            tooltip     = GetString(FTC_Menu_TShareDesc),
            getFunc     = function() return FTC.Vars.StatsShareDPS end, 
            setFunc     = function(value) FTC.Menu:Update( 'StatsShareDPS' , value ) end, 
            default     = FTC.Defaults.StatsShareDPS,
        },

        -- Reset Stats
        { 
            type        = "button",
            name        = GetString(FTC_Menu_TReset),
            tooltip     = GetString(FTC_Menu_TResetDesc),
            func        = function() FTC.Menu:Reset("Stats") end,
        },
    }
    if FTC.Vars.EnableStats then
        for i = 1 , #Stats do table.insert( FTC.Menu.options , Stats[i] ) end
    end
end
