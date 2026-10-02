local mod = get_mod("extended_weapon_customization")

-- ##### ┬─┐┌─┐┌─┐ ┬ ┬┬┬─┐┌─┐ #########################################################################################
-- ##### ├┬┘├┤ │─┼┐│ ││├┬┘├┤  #########################################################################################
-- ##### ┴└─└─┘└─┘└└─┘┴┴└─└─┘ #########################################################################################

local trinket_hooks = mod:io_dofile("extended_weapon_customization/scripts/mods/ewc/attachments/trinket_hook")
local emblem_left = mod:io_dofile("extended_weapon_customization/scripts/mods/ewc/attachments/emblem_left")
local emblem_right = mod:io_dofile("extended_weapon_customization/scripts/mods/ewc/attachments/emblem_right")

-- ##### ┌─┐┌─┐┬─┐┌─┐┌─┐┬─┐┌┬┐┌─┐┌┐┌┌─┐┌─┐ ############################################################################
-- ##### ├─┘├┤ ├┬┘├┤ │ │├┬┘│││├─┤││││  ├┤  ############################################################################
-- ##### ┴  └─┘┴└─└  └─┘┴└─┴ ┴┴ ┴┘└┘└─┘└─┘ ############################################################################
-- #region Performance
    local table = table
    local vector3 = Vector3
    local vector3_box = Vector3Box
    local vector3_zero = vector3.zero
    local table_merge_recursive = table.merge_recursive
--#endregion

-- ##### ┌┬┐┌─┐┌┬┐┌─┐ #################################################################################################
-- #####  ││├─┤ │ ├─┤ #################################################################################################
-- ##### ─┴┘┴ ┴ ┴ ┴ ┴ #################################################################################################

local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"

local shotgun_receivers = "shotgun_rifle_receiver_01|shotgun_rifle_receiver_02|shotgun_rifle_receiver_ml01"

return {
    attachments = {
        emblem_left = emblem_left,
        emblem_right = emblem_right,
        trinket_hook = trinket_hooks,
        sight = {
            shotgun_pump_action_sight_01 = {
                replacement_path = _item_ranged.."/sights/shotgun_pump_action_sight_01",
                icon_render_unit_rotation_offset = {90, 0, 30},
                icon_render_camera_position_offset = {-.05, -1.5, .15},
                hide_from_selection = true,
            },
        },
        underbarrel = {
            shotgun_pump_action_underbarrel_01 = {
                replacement_path = _item_ranged.."/underbarrels/shotgun_pump_action_underbarrel_01",
                icon_render_unit_rotation_offset = {90, 0, 30},
                icon_render_camera_position_offset = {-.1, -2.25, .15},
            },
            shotgun_pump_action_underbarrel_02 = {
                replacement_path = _item_ranged.."/underbarrels/shotgun_pump_action_underbarrel_02",
                icon_render_unit_rotation_offset = {90, 0, 30},
                icon_render_camera_position_offset = {-.1, -2.25, .15},
            },
            shotgun_pump_action_underbarrel_03 = {
                replacement_path = _item_ranged.."/underbarrels/shotgun_pump_action_underbarrel_03",
                icon_render_unit_rotation_offset = {90, 0, 30},
                icon_render_camera_position_offset = {-.1, -2.25, .15},
            },
        },
        receiver = {
            shotgun_rifle_receiver_01 = {
                replacement_path = _item_ranged.."/recievers/shotgun_rifle_receiver_01",
                icon_render_unit_rotation_offset = {90, 0, 45},
                icon_render_camera_position_offset = {-.15, -1.75, .25},
            },
            shotgun_rifle_receiver_02 = {
                replacement_path = _item_ranged.."/recievers/shotgun_rifle_receiver_02",
                icon_render_unit_rotation_offset = {90, 0, 45},
                icon_render_camera_position_offset = {-.15, -1.75, .25},
            },
            shotgun_rifle_receiver_ml01 = {
                replacement_path = _item_ranged.."/recievers/shotgun_rifle_receiver_ml01",
                icon_render_unit_rotation_offset = {90, 0, 45},
                icon_render_camera_position_offset = {-.15, -1.75, .25},
            },
        },
        stock = {
            shotgun_pump_action_stock_01 = {
                replacement_path = _item_ranged.."/stocks/shotgun_pump_action_stock_01",
                icon_render_unit_rotation_offset = {90, -10, 30},
                icon_render_camera_position_offset = {.15, -2, .2},
            },
            shotgun_pump_action_stock_03 = {
                replacement_path = _item_ranged.."/stocks/shotgun_pump_action_stock_03",
                icon_render_unit_rotation_offset = {90, -10, 30},
                icon_render_camera_position_offset = {.15, -2, .2},
            },
            shotgun_pump_action_stock_ml01 = {
                replacement_path = _item_ranged.."/stocks/shotgun_pump_action_stock_ml01",
                icon_render_unit_rotation_offset = {90, -10, 30},
                icon_render_camera_position_offset = {.15, -2, .2},
            },
        },
        barrel = {
            shotgun_pump_action_barrel_01 = {
                replacement_path = _item_ranged.."/barrels/shotgun_pump_action_barrel_01",
                icon_render_unit_rotation_offset = {90, -20, 90 - 30},
                icon_render_camera_position_offset = {-.25, -2.5, 0},
            },
            shotgun_pump_action_barrel_03 = {
                replacement_path = _item_ranged.."/barrels/shotgun_pump_action_barrel_03",
                icon_render_unit_rotation_offset = {90, -20, 90 - 30},
                icon_render_camera_position_offset = {-.25, -2.5, 0},
            },
            shotgun_pump_action_barrel_ml01 = {
                replacement_path = _item_ranged.."/barrels/shotgun_pump_action_barrel_ml01",
                icon_render_unit_rotation_offset = {90, -20, 90 - 30},
                icon_render_camera_position_offset = {-.25, -2.5, 0},
            },
        },
    },
    fixes = {
        {attachment_slot = "sight",
            requirements = {
                barrel = {
                    has = shotgun_receivers,
                },
                sight = {
                    missing = "shotgun_pump_action_sight_01",
                }
            },
            fix = {
                attach = {
                    sight = "shotgun_pump_action_sight_01",
                },
            },
        },
    },
}
