local mod = get_mod("extended_weapon_customization_base_additions")

-- ##### ┬─┐┌─┐┌─┐ ┬ ┬┬┬─┐┌─┐ #########################################################################################
-- ##### ├┬┘├┤ │─┼┐│ ││├┬┘├┤  #########################################################################################
-- ##### ┴└─└─┘└─┘└└─┘┴┴└─└─┘ #########################################################################################

local shotgun_combat_group = {custom_selection_group = "shotgun_combat"}
local shotgun_double_barrel_group = {custom_selection_group = "shotgun_double_barrel"}

local combat_shotgun_barrels = mod:io_dofile("extended_weapon_customization_base_additions/scripts/mods/ewc_ba/attachments/barrel_shotgun_combat")
local combat_shotgun_stocks = mod:io_dofile("extended_weapon_customization_base_additions/scripts/mods/ewc_ba/attachments/stock_shotgun_combat")
local underbarrel_shotgun = mod:io_dofile("extended_weapon_customization_base_additions/scripts/mods/ewc_ba/attachments/underbarrel_shotguns")
mod:merge_attachment_data(shotgun_combat_group, combat_shotgun_barrels, combat_shotgun_stocks, underbarrel_shotgun)

local double_barrel_stocks = mod:io_dofile("extended_weapon_customization_base_additions/scripts/mods/ewc_ba/attachments/stock_shotgun_double_barrel")
mod:merge_attachment_data(shotgun_double_barrel_group, double_barrel_stocks)

local flashlight_human = mod:io_dofile("extended_weapon_customization_base_additions/scripts/mods/ewc_ba/attachments/flashlight_human")
local sight_reflex = mod:io_dofile("extended_weapon_customization_base_additions/scripts/mods/ewc_ba/attachments/sight_reflex")
local sight_scope = mod:io_dofile("extended_weapon_customization_base_additions/scripts/mods/ewc_ba/attachments/sight_scope")
local rails = mod:io_dofile("extended_weapon_customization_base_additions/scripts/mods/ewc_ba/attachments/rail")

-- ##### ┌─┐┌─┐┬─┐┌─┐┌─┐┬─┐┌┬┐┌─┐┌┐┌┌─┐┌─┐ ############################################################################
-- ##### ├─┘├┤ ├┬┘├┤ │ │├┬┘│││├─┤││││  ├┤  ############################################################################
-- ##### ┴  └─┘┴└─└  └─┘┴└─┴ ┴┴ ┴┘└┘└─┘└─┘ ############################################################################
-- #region Performance
    local table = table
    local vector3 = Vector3
    local vector3_box = Vector3Box
    local vector3_zero = vector3.zero
    local table_clone_safe = table.clone_safe
    local table_merge_recursive = table.merge_recursive
    local table_merge_recursive_n = table.merge_recursive_n
--#endregion

-- ##### ┌┬┐┌─┐┌┬┐┌─┐ #################################################################################################
-- #####  ││├─┤ │ ├─┤ #################################################################################################
-- ##### ─┴┘┴ ┴ ┴ ┴ ┴ #################################################################################################

local _item = "content/items/weapons/player"
local _item_melee = _item.."/melee"
local _item_ranged = _item.."/ranged"
local _item_empty_trinket = _item.."/trinkets/unused_trinket"

local short_barrels = "shotgun_rifle_barrel_01|shotgun_rifle_barrel_05|shotgun_rifle_barrel_06|shotgun_rifle_barrel_07|shotgun_rifle_barrel_08|shotgun_rifle_barrel_09|shotgun_rifle_barrel_10|shotgun_rifle_barrel_ml01"
local pump_action_barrels = "shotgun_pump_action_barrel_01|shotgun_pump_action_barrel_03|shotgun_pump_action_barrel_ml01"
local long_barrels = "shotgun_rifle_barrel_04"

local shotgun_receivers = "shotgun_rifle_receiver_01|shotgun_rifle_receiver_02|shotgun_rifle_receiver_ml01"
local shotgun_rails = "shotgun_pump_action_sight_01|shotgun_rifle_sight_01|shotgun_rifle_sight_04"

local reflex_sights = "reflex_sight_01|reflex_sight_02|reflex_sight_03"
local scopes = "scope_01"

local attachments = {
    shotgun_p3_m1 = {
        flashlight = flashlight_human,
        sight_2 = table_merge_recursive_n(nil, sight_reflex, sight_scope),
        stock = table_merge_recursive_n(nil, combat_shotgun_stocks, double_barrel_stocks),
        underbarrel = underbarrel_shotgun,
        barrel = combat_shotgun_barrels,
        rail = rails,
        sight = {
            shotgun_rifle_sight_invisible_01 = {
                replacement_path = _item_ranged.."/sights/shotgun_rifle_sight_invisible_01",
                icon_render_unit_rotation_offset = {90, 0, 30},
                icon_render_camera_position_offset = {-.05, -1.5, .15},
                hide_from_selection = true,
            },
        },
    },
}

local attachment_slots = {
    shotgun_p3_m1 = {
        sight_2 = {
            parent_slot = "sight",
            default_path = _item_empty_trinket,
        },
    },
}

local fixes = {
    shotgun_p3_m1 = {
        {attachment_slot = "sight_2",
            requirements = {
                sight_2 = {
                    has = reflex_sights,
                },
                sight = {
                    has = shotgun_rails,
                },
            },
            fix = {
                offset = {
                    position = vector3_box(0, 0, .0235),
                    rotation = vector3_box(0, 0, 0),
                    scale = vector3_box(1, 1, 1),
                    node = 1,
                },
            },
        },
        {attachment_slot = "sight_2",
            requirements = {
                sight_2 = {
                    has = scopes,
                },
            },
            fix = {
                offset = {
                    position = vector3_box(0, -.1, .03),
                    rotation = vector3_box(0, 0, 0),
                    scale = vector3_box(1, 1, 1),
                    node = 1,
                },
            },
        },
        {attachment_slot = "sight",
            requirements = {
                sight_2 = {
                    has = scopes,
                },
                sight = {
                    missing = "shotgun_rifle_sight_invisible_01",
                }
            },
            fix = {
                attach = {
                    sight = "shotgun_rifle_sight_invisible_01",
                },
            },
        },
        {attachment_slot = "sight_offset",
            requirements = {
                sight_2 = { 
                    has = reflex_sights 
                },
                sight = {
                    has = shotgun_rails,
                },
            },
            fix = {
                offset = { position = vector3_box(0, 0, -.016) },
            },
        },
        {attachment_slot = "sight_offset",
            requirements = {
                sight_2 = { 
                    has = scopes
                },
            },
            fix = {
                offset = {
                    position = vector3_box(0, -.05, -.024),
                    rotation = vector3_box(0, 0, 0),
                    custom_fov = 32.5,
                    aim_scale = .5,
                    fov = 25,
                },
            },
        },
        {attachment_slot = "sight",
            requirements = {
                barrel = {
                    has = long_barrels,
                },
                receiver = {
                    has = shotgun_receivers
                },
                sight = {
                    missing = "shotgun_rifle_sight_04",
                },
                sight_2 = {
                    missing = scopes,
                },
            },
            fix = {
                attach = {
                    sight = "shotgun_rifle_sight_04",
                },
            },
        },
        {attachment_slot = "sight",
            requirements = {
                barrel = {
                    has = short_barrels,
                },
                receiver = {
                    has = shotgun_receivers
                },
                sight = {
                    missing = "shotgun_rifle_sight_01",
                },
                sight_2 = {
                    missing = scopes,
                },
            },
            fix = {
                attach = {
                    sight = "shotgun_rifle_sight_01",
                },
            },
        },
        {attachment_slot = "sight",
            requirements = {
                barrel = {
                    has = pump_action_barrels,
                },
                receiver = {
                    has = shotgun_receivers
                },
                sight = {
                    missing = "shotgun_pump_action_sight_01",
                },
                sight_2 = {
                    missing = scopes,
                },
            },
            fix = {
                attach = {
                    sight = "shotgun_pump_action_sight_01",
                },
            },
        },
        {attachment_slot = "flashlight",
            requirements ={
                barrel = {
                    has = short_barrels
                }
            },
            fix = {
                offset = {
                    position = vector3_box(0.008, -0.08, 0.056),
                    rotation = vector3_box(0, 0, 0),
                    scale = vector3_box(1, 1, 1),
                    node = 1,
                },
            },
        },
    },
}

return {
    attachment_slots = attachment_slots,
    attachments = attachments,
    fixes = fixes,
}
