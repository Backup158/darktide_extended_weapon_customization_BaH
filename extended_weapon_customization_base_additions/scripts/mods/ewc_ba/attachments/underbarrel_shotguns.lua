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
    shotgun_rifle_underbarrel_01 = {
        replacement_path = _item_ranged.."/underbarrels/shotgun_rifle_underbarrel_01",
        icon_render_unit_rotation_offset = {90, 0, 30},
        icon_render_camera_position_offset = {-.05, -1.5, .15},
        selection_index = 1,
    },
    shotgun_rifle_underbarrel_04 = {
        replacement_path = _item_ranged.."/underbarrels/shotgun_rifle_underbarrel_04",
        icon_render_unit_rotation_offset = {90, 0, 30},
        icon_render_camera_position_offset = {-.1, -2.25, .15},
        selection_index = 2,
    },
    shotgun_rifle_underbarrel_05 = {
        replacement_path = _item_ranged.."/underbarrels/shotgun_rifle_underbarrel_05",
        icon_render_unit_rotation_offset = {90, 0, 30},
        icon_render_camera_position_offset = {-.05, -1.5, .15},
        selection_index = 3,
    },
    shotgun_rifle_underbarrel_06 = {
        replacement_path = _item_ranged.."/underbarrels/shotgun_rifle_underbarrel_06",
        icon_render_unit_rotation_offset = {90, 0, 30},
        icon_render_camera_position_offset = {-.05, -1.5, .15},
        selection_index = 4,
    },
    shotgun_rifle_underbarrel_07 = {
        replacement_path = _item_ranged.."/underbarrels/shotgun_rifle_underbarrel_07",
        icon_render_unit_rotation_offset = {90, 0, 30},
        icon_render_camera_position_offset = {-.05, -1.5, .15},
        selection_index = 5,
    },
    shotgun_rifle_underbarrel_08 = {
        replacement_path = _item_ranged.."/underbarrels/shotgun_rifle_underbarrel_08",
        icon_render_unit_rotation_offset = {90, 0, 30},
        icon_render_camera_position_offset = {-.05, -1.5, .15},
        selection_index = 6,
    },
}
