local Events = require("utility/events")
local Utils = require("utility/utils")
local RecruitWorkforce = require("scripts/recruit-workforce")
local Investments = require("scripts/investments")
local Orders = require("scripts/orders")
local Financials = require("scripts/financials")
local Gui = require("scripts/gui")
local Market = require("scripts/market")
local Map = require("scripts/map")

local function OnStartup()
    global.surface = game.surfaces[1]
    global.playerForce = game.forces[1]
    global.playerForce.research_queue_enabled = true
    Utils.DisableIntroMessage()
    Utils.DisableWinOnRocket()
    RecruitWorkforce.OnStartup()
    Financials.OnStartup()
    Investments.OnStartup()
    Orders.OnStartup()
    Market.OnStartup()
    Map.OnStartup()

    Gui.OnStartup()
end

local function OnLoad()
    Utils.DisableSiloScript()
    RecruitWorkforce.OnLoad()
    Financials.OnLoad()
    Investments.OnLoad()
    Orders.OnLoad()
    Market.OnLoad()
    Map.OnLoad()

    Gui.OnLoad()
end

script.on_init(OnStartup)
script.on_configuration_changed(OnStartup)
script.on_load(OnLoad)
Events.RegisterEvent(defines.events.on_runtime_mod_setting_changed)
Events.RegisterEvent(defines.events.on_rocket_launched)
Events.RegisterEvent(defines.events.on_research_finished)
Events.RegisterEvent(defines.events.on_research_started)
Events.RegisterEvent(defines.events.on_player_joined_game)
Events.RegisterEvent(defines.events.on_chunk_generated)
Events.RegisterEvent(defines.events.on_entity_died)
Events.RegisterEvent(defines.events.script_raised_destroy)
Events.RegisterEvent(defines.events.on_lua_shortcut)
Events.RegisterScheduler()
