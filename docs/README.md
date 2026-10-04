Fork of [Extended Weapon Customization](https://github.com/grasmann/darktide-mods). Repo is just to keep track of my/our changes, and is not meant as a replacement for EWC and the work put into it. (Fork has been expanded to include other related mods in the EWC sphere).

Grasmann, these are the changes we'd like merged. `showdiff` however you'd like to; each general change is described below point-by-point. Changes are accredited to the contributor. If didn't put one, it was probably me.

# Changes
Changes are listed for each mod. Changes are listed with the top being "most important for review" and going down. 

Bracket tags at the start indicate relevant game update.
- [DotD] - Depths of the Damned - 1.13.0 - 2026-09-29
## Extended Weapon Customization
Based on the pinned scrollbar version (2026-07-12).

- [DotD] Crash when seeing other players due to `VisualLoadoutCustomization._spawn_attachment` mishandling spawning weapon units (**patches/visual_loadout_customization.lua**, formerly VLCCP) -- Thanks Stimm Shady (Arrowstorm606)!
    - Specific handling for weapons found in the MasterItems
    - DotD move units around, so EWC attachments were getting picked up by this method, where it would default to trying to spawn a unit with UserData, causing a crash
    - Notably affected by the presence of a player using a Chainsword equipped with `content/weapons/player/melee/2h_chain_sword/attachments/chain_01/chain_57_01`
- [DotD] Integrated VLCCP into **patches/visual_loadout_customization.lua** -- Thanks Stimm Shady (Arrowstorm606)!
    - Based on Nexus Version (24 June 2026 - For update 1.12.0).
    - Streamlines workflow
    - Removed need for extra download
    - Does not cause issues if the original VLCCP is in the load order too
    - The code is sectioned into regions so this can be easily reverted
    - Comments out the VLCCP check in **ewc.lua**
- [DotD] Additional safety checks in the hook to `_find_unit_node_recursive` (**patches/visual_loadout_customization.lua**)
    - This is a sign that the VLCCP needs to be updated, and it just kicks the problem up the chain
    - But I think messed up attachment positioning is still a good indicator of issues
    - And if it still crashes, that makes it clearer where the problem lies
    - This change is really easy to get rid of, if you don't want it
- [DotD] Fix crash on turning on flashlight (**extensions/flashlight_extension.lua**)
    - `rewind_ms` had name changed (`LagCompensation.rewind_miliseconds`)... yes that is what they wrote
    - Using this as a string as an argument for `PhysicsWorld.raycast` is fine; the source code has code passing that same string as an argument
    - No action needed for **patches/action_shoot.lua** because `ActionShoot._rewind_ms` was not renamed
- Muzzle flash only on the left dual-wield weapons from Hive Scum release (**patches/player_unit_fx_extension**) -- Thanks Geoff from Accounting!
    - In the hook for `PlayerUnitFxExtension._spawn_unit_particles`
    - Whenever this function applied to the right-hand gun, it would always fallback to searching for all sources from the spawner name
        - This would always choose "left" as the attachment name, since both are given 
        - `VisualLoadoutExtractData.ROOT_ATTACH_NAME` would've had the given "right" for the right-hand gun, but the fallback always happened, so this was never called
        - Thus, both particles would get stuck on the left-hand gun only
- Bandaid fix for doubled range damage in Psykhanium (**patches/action_shoot.lua**)
    - In the shooting hook, it gets hit results by calling `hit_scan_process_hits`, which calls a chain of attack functions that wind up with one that actually processing damage. In normal matches, this is fine due to server validation. In solo instances, this causes ranged shooting to apply twice.
    - Just changing `is_server` to false the parameters is not enough
    - Hit results is used to find out which enemies should be gibbed with weapon types elsewhere, so I kept this whole system intact
    - The change is to take the damage done, then halve its value if `is_server` is true. That way, it gets doubled and becomes the original damage.
- More robust input validation for fix requirements (**utilities/plugins.lua**)
    - As-is, having malformed `requirements` for fixes would cause a backend error on launch, without indication of what went wrong
    - This checks for basic errors and logs hints for plugin authors
- [DotD] Add support for new weapons and marks -- Thanks to Geoff from Accounting!
    - `shotgun_p3_m1`
    - `ogryn_hammer_2h_p1_m1`
    - `ogryn_thumper_p1_m3`
    - `ogryn_powermaul_slabshield_p1_m2`
    - `powermaul_2h_p1_m2`
    - `shotgun_p2_m3`
    - table_clones added to **utilities/attachments.lua**
    - New weapon files created for `shotgun_p3_m1` (Huntsman Shotgun) and `ogryn_hammer_2h_p1_m1` (Cruncher)
- Defaulted randomization mod options to off due to the issues related to it (**ewc_data.lua**)
    - Namely, crashing upon hovering seemingly random parts
    - This change can be reverted if the root causes are solved

## Extended Weapon Customization - Base Additions
Based on the Nexus version (1.04 - 2026-07-10)

- [DotD] Fix crash on turning on laser (**attachments/laser_pointer.lua**)
    - `rewind_ms` had name changed (`LagCompensation.rewind_miliseconds`)... yes that is what they wrote
    - Using this as a string as an argument for `PhysicsWorld.raycast` is fine; the source code has code passing that same string as an argument

## Visible Equipment
Based on Nexus version (10 July 2026).

- [DotD] Fix crash on opening cosmetics (**patches/ui_manager.lua**)
    - The create mannequin function from `Items` was moved to `ProfileUtils`
    - The parameters now take the unit and profile instead of unit and all the individual parts of the profile

# To-do
## Extended Weapon Customization
- Missing display name after the notification changes from the hotfix before 1.13.0 (**patches/inventory_weapon_cosmetics_view/preview.lua**)
    - Names do not display when selecting attachments
    - The nameplates from Modding Tools still work though
    - Dirty fix of using mod:echo() to display it, which in this menu will put a notification on the right side

## Extended Weapon Customization - Base Additions
- [DotD] Add support for new weapons and marks
    - `shotgun_p3_m1`
    - `ogryn_hammer_2h_p1_m1`
    - `ogryn_thumper_p1_m3`
    - `ogryn_powermaul_slabshield_p1_m2`
    - `powermaul_2h_p1_m2`
    - `shotgun_p2_m3`

## Visual Loadout Customization Community Patch
- Old bug from Skitarii update that prevented materials from being applied to body parts (namely, oxidation on Skitarii limbs)

## Visible Equipment
- [DotD] Add support for new weapons and marks
    - `shotgun_p3_m1`
    - `ogryn_hammer_2h_p1_m1`
    - `ogryn_thumper_p1_m3`
    - `ogryn_powermaul_slabshield_p1_m2`
    - `powermaul_2h_p1_m2`
    - `shotgun_p2_m3`