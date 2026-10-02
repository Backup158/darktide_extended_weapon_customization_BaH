Fork of [Extended Weapon Customization](https://github.com/grasmann/darktide-mods). Repo is just to keep track of my/our changes, and is not meant as a replacement for EWC and the work put into it. (Fork has been expanded to include other related mods in the EWC sphere).

Grasmann, these are the changes we'd like merged. `showdiff` however you'd like to; each general change is described below point-by-point. Changes are accredited to the contributor. If didn't put one, it was probably me.

# Changes
## Extended Weapon Customization
Based on the pinned scrollbar version (2026-07-12).

- Bandaid fix for doubled range damage in Psykhanium (**patches/action_shoot.lua**)
    - In the shooting hook, it gets hit results by calling `hit_scan_process_hits`, which calls a chain of attack functions that wind up with one that actually processing damage. In normal matches, this is fine due to server validation. In solo instances, this causes ranged shooting to apply twice.
    - Just changing `is_server` to false the parameters is not enough
    - Hit results is used to find out which enemies should be gibbed with weapon types elsewhere, so I kept this whole system intact
    - The change is to take the damage done, then halve its value if `is_server` is true. That way, it gets doubled and becomes the original damage.
- More robust input validation for fix requirements (**utilities/plugins.lua**)
    - As-is, having malformed `requirements` for fixes would cause a backend error on launch, without indication of what went wrong
    - This checks for basic errors and logs hints for plugin authors
- Defaulted randomization mod options to off due to the issues related to it (**ewc_data.lua**)
    - Namely, crashing upon hovering seemingly random parts
    - This change can be reverted if the root causes are solved
- Additional safety checks in the hook to `_find_unit_node_recursive` (**patches/visual_loadout_customization.lua**)
    - This is a sign that the VLCCP needs to be updated, and it just kicks the problem up the chain
    - But I think messed up attachment positioning is still a good indicator of issues
    - And if it still crashes, that makes it clearer where the problem lies
    - This change is really easy to get rid of, if you don't want it
- Fix crash on turning on flashlight (**extensions/flashlight_extension.lua**)
    - `rewind_ms` had name changed (`LagCompensation.rewind_miliseconds`)... yes that is what they wrote
    - Using this as a string as an argument for `PhysicsWorld.raycast` is fine; this is a Stingray function (?) and there's code using that same string
    - No action needed for **patches/action_shoot.lua** because `ActionShoot._rewind_ms` was not renamed

## Extended Weapon Customization - Base Additions
Based on the Nexus version (1.04 - 2026-07-10)

- Fix crash on turning on laser (**attachments/laser_pointer.lua**)
    - `rewind_ms` had name changed (`LagCompensation.rewind_miliseconds`)... yes that is what they wrote
    - Using this as a string as an argument for `PhysicsWorld.raycast` is fine; this is a Stingray function (?) and there's code using that same string

## Visible Equipment
Based on Nexus version.

- Fix crash on opening cosmetics (**patches/ui_manager.lua**)
    - The create mannequin function from `Items` was moved to `ProfileUtils`
    - The parameters now take the unit and profile instead of unit and all the individual parts of the profile

## Visual Loadout Customization Community Patch
Based on Nexus Version

- N/A

# To-do
## Extended Weapon Customization
- Muzzle flash only on the left dual-wield weapons
- Missing display name after the notification changes from the hotfix before 1.13.0
- Add support for new weapons and marks from Depths of the Damned (1.13.0)
    - `shotgun_p3_m1`
    - `ogryn_hammer_2h_p1_m1`
    - `ogryn_thumper_p1_m3`
    - `ogryn_powermaul_slabshield_p1_m2`
    - `powermaul_2h_p1_m2`
    - `shotgun_p2_m3`
## Extended Weapon Customization - Base Additions
- Add support for new weapons and marks from Depths of the Damned (1.13.0)
    - `shotgun_p3_m1`
    - `ogryn_hammer_2h_p1_m1`
    - `ogryn_thumper_p1_m3`
    - `ogryn_powermaul_slabshield_p1_m2`
    - `powermaul_2h_p1_m2`
    - `shotgun_p2_m3`
## Visual Loadout Customization Community Patch
- Crash on finding worlddata and unit nodes whenever there are players loaded
## Visible Equipment
- Add support for new weapons and marks from Depths of the Damned (1.13.0)
    - `shotgun_p3_m1`
    - `ogryn_hammer_2h_p1_m1`
    - `ogryn_thumper_p1_m3`
    - `ogryn_powermaul_slabshield_p1_m2`
    - `powermaul_2h_p1_m2`
    - `shotgun_p2_m3`