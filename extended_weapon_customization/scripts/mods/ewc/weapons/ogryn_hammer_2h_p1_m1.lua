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
local _item_melee = _item.."/melee"
local _item_ranged = _item.."/ranged"

return {
    attachments = {
        emblem_left = emblem_left,
        emblem_right = emblem_right,
        trinket_hook = trinket_hooks,
        shaft = {
            ogryn_hammer_shaft_01 = {
                replacement_path = _item_melee.."/shafts/ogryn_hammer_shaft_01",
                icon_render_unit_rotation_offset = {90, -30, 0},
                icon_render_camera_position_offset = {0, -10, 1.25},
            },
            ogryn_hammer_shaft_02 = {
                replacement_path = _item_melee.."/shafts/ogryn_hammer_shaft_02",
                icon_render_unit_rotation_offset = {90, -30, 0},
                icon_render_camera_position_offset = {0, -10, 1.25},
            },
            ogryn_hammer_shaft_ml01 = {
                replacement_path = _item_melee.."/shafts/ogryn_hammer_shaft_ml01",
                icon_render_unit_rotation_offset = {90, -30, 0},
                icon_render_camera_position_offset = {0, -10, 1.25},
            },
        },
        head = {
            ogryn_hammer_2h_head_01 = {
                replacement_path = _item_melee.."/heads/ogryn_hammer_2h_head_01",
                icon_render_unit_rotation_offset = {90, -30, 30},
                icon_render_camera_position_offset = {.1, -11, 1.25},
            },
            ogryn_hammer_2h_head_02 = {
                replacement_path = _item_melee.."/heads/ogryn_hammer_2h_head_02",
                icon_render_unit_rotation_offset = {90, -30, 30},
                icon_render_camera_position_offset = {.1, -11, 1.25},
            },
            ogryn_hammer_2h_head_ml01 = {
                replacement_path = _item_melee.."/heads/ogryn_hammer_2h_head_ml01",
                icon_render_unit_rotation_offset = {90, -30, 30},
                icon_render_camera_position_offset = {.1, -11, 1.25},
            },
        },
        pommel = {
            ogryn_hammer_2h_pommel_01 = {
                replacement_path = _item_melee.."/pommels/ogryn_hammer_2h_pommel_01",
                icon_render_unit_rotation_offset = {90, 30, 0},
                icon_render_camera_position_offset = {0, -3, .1},
            },
            ogryn_hammer_2h_pommel_02 = {
                replacement_path = _item_melee.."/pommels/ogryn_hammer_2h_pommel_02",
                icon_render_unit_rotation_offset = {90, 30, 0},
                icon_render_camera_position_offset = {0, -3, .1},
            },
            ogryn_hammer_2h_pommel_ml01 = {
                replacement_path = _item_melee.."/pommels/ogryn_hammer_2h_pommel_ml01",
                icon_render_unit_rotation_offset = {90, 30, 0},
                icon_render_camera_position_offset = {0, -3, .1},
            },
        }
    },
}
