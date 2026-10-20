local mod = get_mod("visible_equipment")

-- ##### ┌─┐┌─┐┬─┐┌─┐┌─┐┬─┐┌┬┐┌─┐┌┐┌┌─┐┌─┐ ############################################################################
-- ##### ├─┘├┤ ├┬┘├┤ │ │├┬┘│││├─┤││││  ├┤  ############################################################################
-- ##### ┴  └─┘┴└─└  └─┘┴└─┴ ┴┴ ┴┘└┘└─┘└─┘ ############################################################################
-- #region Performance
    local table = table
    local vector3 = Vector3
    local vector3_box = Vector3Box
    local table_clone = table.clone
    local vector3_zero = vector3.zero
    local table_merge_recursive_n = table.merge_recursive_n
--#endregion

-- ##### ┌┬┐┌─┐┌┬┐┌─┐ #################################################################################################
-- #####  ││├─┤ │ ├─┤ #################################################################################################
-- ##### ─┴┘┴ ┴ ┴ ┴ ┴ #################################################################################################

local step_right = {
    default = {
        name = "step",
        start_position = vector3_box(vector3_zero()),
        start_rotation = vector3_box(vector3_zero()),
        end_position = vector3_box(vector3(-.05, 0, 0) * .5),
        end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        next = "back",
    },
    backpack = {
        name = "step",
        start_position = vector3_box(vector3_zero()),
        start_rotation = vector3_box(vector3_zero()),
        end_position = vector3_box(vector3(-.05, 0, 0) * .5),
        end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        next = "back",
    },
    leg_left = {
        name = "step",
        start_position = vector3_box(vector3_zero()),
        start_rotation = vector3_box(vector3_zero()),
        end_position = vector3_box(vector3(0, -.05, 0) * .5),
        end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        next = "back",
    },
    leg_right = {
        name = "step",
        start_position = vector3_box(vector3_zero()),
        start_rotation = vector3_box(vector3_zero()),
        end_position = vector3_box(vector3(0, -.05, 0) * .5),
        end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        next = "back",
    },
    hip_left = {
        name = "step",
        start_position = vector3_box(vector3_zero()),
        start_rotation = vector3_box(vector3_zero()),
        end_position = vector3_box(vector3(0, -.05, 0) * .5),
        end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        next = "back",
    },
    hip_right = {
        name = "step",
        start_position = vector3_box(vector3_zero()),
        start_rotation = vector3_box(vector3_zero()),
        end_position = vector3_box(vector3(0, -.05, 0) * .5),
        end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        next = "back",
    },
    hip_front = {
        name = "step",
        start_position = vector3_box(vector3_zero()),
        start_rotation = vector3_box(vector3_zero()),
        end_position = vector3_box(vector3(0, 0, -.05) * .5),
        end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        next = "back",
    },
    hip_back = {
        name = "step",
        start_position = vector3_box(vector3_zero()),
        start_rotation = vector3_box(vector3_zero()),
        end_position = vector3_box(vector3(0, 0, -.05) * .5),
        end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        next = "back",
    },
    name = "step",
    start_position = vector3_box(vector3_zero()),
    start_rotation = vector3_box(vector3_zero()),
    end_position = vector3_box(vector3(-.05, 0, 0) * .5),
    end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
    next = "back",
}

local back_right = {
    default = {
        name = "back",
        start_position = vector3_box(vector3(-.05, 0, 0) * .5),
        start_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        end_position = vector3_box(vector3_zero()),
        end_rotation = vector3_box(vector3_zero()),
    },
    backpack = {
        name = "back",
        start_position = vector3_box(vector3(-.05, 0, 0) * .5),
        start_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        end_position = vector3_box(vector3_zero()),
        end_rotation = vector3_box(vector3_zero()),
    },
    leg_left = {
        name = "back",
        start_position = vector3_box(vector3(0, -.05, 0) * .5),
        start_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        end_position = vector3_box(vector3_zero()),
        end_rotation = vector3_box(vector3_zero()),
    },
    leg_right = {
        name = "back",
        start_position = vector3_box(vector3(0, -.05, 0) * .5),
        start_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        end_position = vector3_box(vector3_zero()),
        end_rotation = vector3_box(vector3_zero()),
    },
    hip_left = {
        name = "back",
        start_position = vector3_box(vector3(0, -.05, 0) * .5),
        start_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        end_position = vector3_box(vector3_zero()),
        end_rotation = vector3_box(vector3_zero()),
    },
    hip_right = {
        name = "back",
        start_position = vector3_box(vector3(0, -.05, 0) * .5),
        start_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        end_position = vector3_box(vector3_zero()),
        end_rotation = vector3_box(vector3_zero()),
    },
    hip_front = {
        name = "back",
        start_position = vector3_box(vector3(0, 0, -.05) * .5),
        start_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        end_position = vector3_box(vector3_zero()),
        end_rotation = vector3_box(vector3_zero()),
    },
    hip_back = {
        name = "back",
        start_position = vector3_box(vector3(0, 0, -.05) * .5),
        start_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        end_position = vector3_box(vector3_zero()),
        end_rotation = vector3_box(vector3_zero()),
    },
    name = "back",
    start_position = vector3_box(vector3(-.05, 0, 0) * .5),
    start_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
    end_position = vector3_box(vector3_zero()),
    end_rotation = vector3_box(vector3_zero()),
}

local place_right = {
    default = {
        name = "place",
        no_modifiers = true,
        start_position = vector3_box(vector3(1, -.5, .5) * .5),
        start_rotation = vector3_box(vector3(0, 0, -90) * .5),
        end_position = vector3_box(vector3(-.15, 0, 0) * .5),
        end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        next = "step",
    },
    backpack = {
        name = "place",
        no_modifiers = true,
        start_position = vector3_box(vector3(1, -.5, .5) * .5),
        start_rotation = vector3_box(vector3(0, 0, -90) * .5),
        end_position = vector3_box(vector3(-.15, 0, 0) * .5),
        end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        next = "step",
    },
    leg_left = {
        name = "place",
        no_modifiers = true,
        start_position = vector3_box(vector3(-1, .5, 0) * .5),
        start_rotation = vector3_box(vector3(90, 0, 0) * .5),
        end_position = vector3_box(vector3(-.15, 0, 0) * .5),
        end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        next = "step",
    },
    leg_right = {
        name = "place",
        no_modifiers = true,
        start_position = vector3_box(vector3(1, -.5, 0) * .5),
        start_rotation = vector3_box(vector3(0, 0, 90) * .5),
        end_position = vector3_box(vector3(-.15, 0, 0) * .5),
        end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        next = "step",
    },
    hip_left = {
        name = "place",
        no_modifiers = true,
        start_position = vector3_box(vector3(1, .5, 0) * .5),
        start_rotation = vector3_box(vector3(0, 0, -90) * .5),
        end_position = vector3_box(vector3(-.15, 0, 0) * .5),
        end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        next = "step",
    },
    hip_right = {
        name = "place",
        no_modifiers = true,
        start_position = vector3_box(vector3(-1, .5, 0) * .5),
        start_rotation = vector3_box(vector3(0, 0, 90) * .5),
        end_position = vector3_box(vector3(-.15, 0, 0) * .5),
        end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        next = "step",
    },
    hip_front = {
        name = "place",
        no_modifiers = true,
        start_position = vector3_box(vector3(1, -.5, 0) * .5),
        start_rotation = vector3_box(vector3(-5, 2.5, -90) * .5),
        end_position = vector3_box(vector3(-.15, 0, 0) * .5),
        end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        next = "step",
    },
    hip_back = {
        name = "place",
        no_modifiers = true,
        start_position = vector3_box(vector3(1, -.5, 0) * .5),
        start_rotation = vector3_box(vector3(-5, 2.5, 90) * .5),
        end_position = vector3_box(vector3(-.15, 0, 0) * .5),
        end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        next = "step",
    },
    name = "place",
    no_modifiers = true,
    start_position = vector3_box(vector3(1, -.5, 0) * .5),
    start_rotation = vector3_box(vector3(-5, 2.5, -90) * .5),
    end_position = vector3_box(vector3(-.15, 0, 0) * .5),
    end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
    next = "step",
}

local step_left = {
    default = {
        name = "step",
        start_position = vector3_box(vector3_zero()),
        start_rotation = vector3_box(vector3_zero()),
        end_position = vector3_box(vector3(-.05, 0, 0) * .5),
        end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        next = "back",
    },
    backpack = {
        name = "step",
        start_position = vector3_box(vector3_zero()),
        start_rotation = vector3_box(vector3_zero()),
        end_position = vector3_box(vector3(-.05, 0, 0) * .5),
        end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        next = "back",
    },
    leg_left = {
        name = "step",
        start_position = vector3_box(vector3_zero()),
        start_rotation = vector3_box(vector3_zero()),
        end_position = vector3_box(vector3(0, -.05, 0) * .5),
        end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        next = "back",
    },
    leg_right = {
        name = "step",
        start_position = vector3_box(vector3_zero()),
        start_rotation = vector3_box(vector3_zero()),
        end_position = vector3_box(vector3(0, -.05, 0) * .5),
        end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        next = "back",
    },
    hip_left = {
        name = "step",
        start_position = vector3_box(vector3_zero()),
        start_rotation = vector3_box(vector3_zero()),
        end_position = vector3_box(vector3(0, -.05, 0) * .5),
        end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        next = "back",
    },
    hip_right = {
        name = "step",
        start_position = vector3_box(vector3_zero()),
        start_rotation = vector3_box(vector3_zero()),
        end_position = vector3_box(vector3(0, -.05, 0) * .5),
        end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        next = "back",
    },
    hip_front = {
        name = "step",
        start_position = vector3_box(vector3_zero()),
        start_rotation = vector3_box(vector3_zero()),
        end_position = vector3_box(vector3(0, 0, -.05) * .5),
        end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        next = "back",
    },
    hip_back = {
        name = "step",
        start_position = vector3_box(vector3_zero()),
        start_rotation = vector3_box(vector3_zero()),
        end_position = vector3_box(vector3(0, 0, -.05) * .5),
        end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        next = "back",
    },
    name = "step",
    start_position = vector3_box(vector3_zero()),
    start_rotation = vector3_box(vector3_zero()),
    end_position = vector3_box(vector3(-.05, 0, 0) * .5),
    end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
    next = "back",
}

local back_left = {
    default = {
        name = "back",
        start_position = vector3_box(vector3(-.05, 0, 0) * .5),
        start_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        end_position = vector3_box(vector3_zero()),
        end_rotation = vector3_box(vector3_zero()),
    },
    backpack = {
        name = "back",
        start_position = vector3_box(vector3(-.05, 0, 0) * .5),
        start_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        end_position = vector3_box(vector3_zero()),
        end_rotation = vector3_box(vector3_zero()),
    },
    leg_left = {
        name = "back",
        start_position = vector3_box(vector3(0, -.05, 0) * .5),
        start_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        end_position = vector3_box(vector3_zero()),
        end_rotation = vector3_box(vector3_zero()),
    },
    leg_right = {
        name = "back",
        start_position = vector3_box(vector3(0, -.05, 0) * .5),
        start_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        end_position = vector3_box(vector3_zero()),
        end_rotation = vector3_box(vector3_zero()),
    },
    hip_left = {
        name = "back",
        start_position = vector3_box(vector3(0, -.05, 0) * .5),
        start_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        end_position = vector3_box(vector3_zero()),
        end_rotation = vector3_box(vector3_zero()),
    },
    hip_right = {
        name = "back",
        start_position = vector3_box(vector3(0, -.05, 0) * .5),
        start_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        end_position = vector3_box(vector3_zero()),
        end_rotation = vector3_box(vector3_zero()),
    },
    hip_front = {
        name = "back",
        start_position = vector3_box(vector3(0, 0, -.05) * .5),
        start_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        end_position = vector3_box(vector3_zero()),
        end_rotation = vector3_box(vector3_zero()),
    },
    hip_back = {
        name = "back",
        start_position = vector3_box(vector3(0, 0, -.05) * .5),
        start_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        end_position = vector3_box(vector3_zero()),
        end_rotation = vector3_box(vector3_zero()),
    },
    name = "back",
    start_position = vector3_box(vector3(-.05, 0, 0) * .5),
    start_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
    end_position = vector3_box(vector3_zero()),
    end_rotation = vector3_box(vector3_zero()),
}

local place_left = {
    default = {
        name = "place",
        no_modifiers = true,
        start_position = vector3_box(vector3(1, .5, .5) * .5),
        start_rotation = vector3_box(vector3(0, 0, -90) * .5),
        end_position = vector3_box(vector3(-.15, 0, 0) * .5),
        end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        next = "step",
    },
    backpack = {
        name = "place",
        no_modifiers = true,
        start_position = vector3_box(vector3(1, .5, .5) * .5),
        start_rotation = vector3_box(vector3(0, 0, -90) * .5),
        end_position = vector3_box(vector3(-.15, 0, 0) * .5),
        end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        next = "step",
    },
    leg_left = {
        name = "place",
        no_modifiers = true,
        start_position = vector3_box(vector3(-1, -.5, 0) * .5),
        start_rotation = vector3_box(vector3(90, 0, 0) * .5),
        end_position = vector3_box(vector3(-.15, 0, 0) * .5),
        end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        next = "step",
    },
    leg_right = {
        name = "place",
        no_modifiers = true,
        start_position = vector3_box(vector3(1, .5, 0) * .5),
        start_rotation = vector3_box(vector3(0, 0, 90) * .5),
        end_position = vector3_box(vector3(-.15, 0, 0) * .5),
        end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        next = "step",
    },
    hip_left = {
        name = "place",
        no_modifiers = true,
        start_position = vector3_box(vector3(1, -.5, 0) * .5),
        start_rotation = vector3_box(vector3(0, 0, -90) * .5),
        end_position = vector3_box(vector3(-.15, 0, 0) * .5),
        end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        next = "step",
    },
    hip_right = {
        name = "place",
        no_modifiers = true,
        start_position = vector3_box(vector3(-1, -.5, 0) * .5),
        start_rotation = vector3_box(vector3(0, 0, 90) * .5),
        end_position = vector3_box(vector3(-.15, 0, 0) * .5),
        end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        next = "step",
    },
    hip_front = {
        name = "place",
        no_modifiers = true,
        start_position = vector3_box(vector3(1, .5, 0) * .5),
        start_rotation = vector3_box(vector3(-5, 2.5, -90) * .5),
        end_position = vector3_box(vector3(-.15, 0, 0) * .5),
        end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        next = "step",
    },
    hip_back = {
        name = "place",
        no_modifiers = true,
        start_position = vector3_box(vector3(1, .5, 0) * .5),
        start_rotation = vector3_box(vector3(-5, 2.5, 90) * .5),
        end_position = vector3_box(vector3(-.15, 0, 0) * .5),
        end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
        next = "step",
    },
    name = "place",
    no_modifiers = true,
    start_position = vector3_box(vector3(1, .5, 0) * .5),
    start_rotation = vector3_box(vector3(-5, 2.5, -90) * .5),
    end_position = vector3_box(vector3(-.15, 0, 0) * .5),
    end_rotation = vector3_box(vector3(-5, 2.5, 5) * .5),
    next = "step",
}

local offsets = {
    default = {
        right = {
            node = "j_spine2",
            position = vector3_box(.248, .168, .149),
            rotation = vector3_box(-118, -80, -65),
        },
        left = {
            node = "j_spine2",
            position = vector3_box(.263, .207, -.008),
            rotation = vector3_box(-46, -76, -140),
        },
    },
    hip_front = {
        right = {
            node = "j_hips",
            position = vector3_box(.106, .18, .175),
            rotation = vector3_box(-174, -49, -90),
        },
        left = {
            node = "j_hips",
            position = vector3_box(-.148, .136, .155),
            rotation = vector3_box(-172, 50, 82),
        },
    },
    hip_back = {
        right = {
            node = "j_hips",
            position = vector3_box(.127, -.14, .12),
            rotation = vector3_box(153, -53, -102),
        },
        left = {
            node = "j_hips",
            position = vector3_box(-.125, -.124, .14),
            rotation = vector3_box(155, 40, 120),
        },
    },
    leg_left = {
        right = {
            node = "j_leftupleg",
            position = vector3_box(.187, .032, -.14),
            rotation = vector3_box(-102, 68, -64),
        },
        left = {
            node = "j_rightupleg",
            position = vector3_box(-.227, -.021, .141),
            rotation = vector3_box(91, -68, 74),
        },
    },
    leg_right = {
        right = {
            node = "j_rightupleg",
            position = vector3_box(-.227, -.021, .141),
            rotation = vector3_box(91, -68, 74),
        },
        left = {
            node = "j_leftupleg",
            position = vector3_box(.187, .032, -.14),
            rotation = vector3_box(-102, 68, -64),
        },
    },
    hip_left = {
        right = {
            node = "j_hips",
            position = vector3_box(.225, .067, .03),
            rotation = vector3_box(150, 12, 174),
        },
        left = {
            node = "j_hips",
            position = vector3_box(-.24, .064, .016),
            rotation = vector3_box(133, -5, 173),
        },
    },
    hip_right = {
        right = {
            node = "j_hips",
            position = vector3_box(-.24, .064, .016),
            rotation = vector3_box(133, -5, 173),
        },
        left = {
            node = "j_hips",
            position = vector3_box(.225, .067, .03),
            rotation = vector3_box(150, 12, 174),
        },
    },
    backpack = {
        right = {
            node = "j_spine2",
            position = vector3_box(.248, .226, .25),
            rotation = vector3_box(-118, -80, -106),
        },
        left = {
            node = "j_spine2",
            position = vector3_box(.393, .209, -.245),
            rotation = vector3_box(-85, -79, -85),
        },
    },
}

return {
    offsets = offsets,
    animations = {
        default = {
            right = {
                states = 2,
                start = "step",
                step = step_right,
                back = back_right,
            },
            left = {
                states = 2,
                start = "step",
                step = step_left,
                back = back_left,
            },
        },
        shoot = {
            right = {
                states = 2,
                start = "step",
                interval = .035,
                interrupt = true,
                step = step_right,
                back = back_right,
            },
            left = {
                states = 2,
                start = "step",
                interval = .035,
                interrupt = true,
                step = step_left,
                back = back_left,
            },
        },
        sheath = {
            right = {
                states = 3,
                start = "place",
                interrupt = true,
                place = place_right,
                step = step_right,
                back = back_right,
            },
            left = {
                states = 3,
                start = "place",
                interrupt = true,
                place = place_left,
                step = step_left,
                back = back_left,
            },
        },
    },
    sounds = {
        crouching = {
            "sfx_grab_weapon",
            "sfx_foley_equip",
        },
        default = {
            "sfx_ads_up",
            "sfx_ads_down",
        },
        accent = {
            "sfx_equip_02",
            "sfx_magazine_eject",
            "sfx_swing_heavy",
        },
    },
}