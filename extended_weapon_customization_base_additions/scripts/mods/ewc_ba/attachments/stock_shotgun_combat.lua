local mod = get_mod("extended_weapon_customization_base_additions")

-- ##### ┌─┐┌─┐┬─┐┌─┐┌─┐┬─┐┌┬┐┌─┐┌┐┌┌─┐┌─┐ ############################################################################
-- ##### ├─┘├┤ ├┬┘├┤ │ │├┬┘│││├─┤││││  ├┤  ############################################################################
-- ##### ┴  └─┘┴└─└  └─┘┴└─┴ ┴┴ ┴┘└┘└─┘└─┘ ############################################################################
-- #region Performance
    local vector3 = Vector3
    local vector3_box = Vector3Box
    local vector3_zero = vector3.zero
--#endregion

-- ##### ┌┬┐┌─┐┌┬┐┌─┐ #################################################################################################
-- #####  ││├─┤ │ ├─┤ #################################################################################################
-- ##### ─┴┘┴ ┴ ┴ ┴ ┴ #################################################################################################

local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"

return {
    shotgun_rifle_stock_01 = {
        replacement_path = _item_ranged.."/stocks/shotgun_rifle_stock_01",
        icon_render_unit_rotation_offset = {90, -10, 30},
        icon_render_camera_position_offset = {.15, -2, .2},
        selection_index = 1,
    },
    shotgun_rifle_stock_03 = {
        replacement_path = _item_ranged.."/stocks/shotgun_rifle_stock_03",
        icon_render_unit_rotation_offset = {90, -10, 30},
        icon_render_camera_position_offset = {.15, -2, .2},
        selection_index = 2,
    },
    shotgun_rifle_stock_05 = {
        replacement_path = _item_ranged.."/stocks/shotgun_rifle_stock_05",
        icon_render_unit_rotation_offset = {90, -10, 30},
        icon_render_camera_position_offset = {.15, -2, .2},
        selection_index = 3,
    },
    shotgun_rifle_stock_06 = {
        replacement_path = _item_ranged.."/stocks/shotgun_rifle_stock_06",
        icon_render_unit_rotation_offset = {90, -10, 30},
        icon_render_camera_position_offset = {.15, -2, .2},
        selection_index = 4,
    },
    shotgun_rifle_stock_07 = {
        replacement_path = _item_ranged.."/stocks/shotgun_rifle_stock_07",
        icon_render_unit_rotation_offset = {90, -10, 30},
        icon_render_camera_position_offset = {.15, -2, .2},
        selection_index = 5,
    },
    shotgun_rifle_stock_08 = {
        replacement_path = _item_ranged.."/stocks/shotgun_rifle_stock_08",
        icon_render_unit_rotation_offset = {90, -10, 30},
        icon_render_camera_position_offset = {.15, -2, .2},
        selection_index = 6,
    },
    shotgun_rifle_stock_09 = {
        replacement_path = _item_ranged.."/stocks/shotgun_rifle_stock_09",
        icon_render_unit_rotation_offset = {90, -10, 30},
        icon_render_camera_position_offset = {.15, -2, .2},
        selection_index = 7,
    },
    shotgun_rifle_stock_10 = {
        replacement_path = _item_ranged.."/stocks/shotgun_rifle_stock_10",
        icon_render_unit_rotation_offset = {90, -10, 30},
        icon_render_camera_position_offset = {.15, -2, .2},
        selection_index = 8,
    },
    shotgun_rifle_stock_ml01 = {
        replacement_path = _item_ranged.."/stocks/shotgun_rifle_stock_ml01",
        icon_render_unit_rotation_offset = {90, -10, 30},
        icon_render_camera_position_offset = {.15, -2, .2},
        selection_index = 9,
    },
}
