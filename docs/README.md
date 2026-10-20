Fork of [Extended Weapon Customization](https://github.com/grasmann/darktide-mods). Repo is just to keep track of my/our changes, and is not meant as a replacement for EWC and the work put into it. (Fork has been expanded to include other related mods in the EWC sphere).

Grasmann, these are the changes we'd like merged. `showdiff` however you'd like to; each general change is described below point-by-point. Changes are accredited to the contributor. If I didn't put one, it was probably me.

Download mirrors for convenience:
- [Extended Weapon Customization](https://www.mediafire.com/file/7rvs6c3ovsbzudd/dotd_extended_weapon_customization.zip/file)
- [Extended Weapon Customization - Base Additions](https://www.mediafire.com/file/snpcugcbst7tfx7/dotd_extended_weapon_customization_base_additions.zip/file)
- [Visible Equipment](https://www.mediafire.com/file/k4ojc65oktsltcc/dotd_visible_equipment.zip/file)

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
    - The code is sectioned into regions so this can be easily reverted
        - Streamlines workflow
        - Removed need for extra download
        - Old versions of VLCCP in the load order can cause issues with loaded after
    - Comments out the VLCCP check (and adds an inverse check below) in **ewc.lua** and AML check in **extended_weapon_customization.mod**
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
        - `VisualLoadoutExtractData.ROOT_ATTACH_NAME` correctly gives "right" for the right-hand gun, but the fallback always happened, so this was never called
        - Thus, both particles would get stuck on the left-hand gun only
        - Removing the fallback allows the particles to attach correctly
- Bandaid fix for doubled range damage in Psykhanium (**patches/action_shoot.lua**)
    - In the shooting hook, it gets hit results by calling `hit_scan_process_hits`, which calls a chain of attack functions that wind up with one that actually processing damage. In normal matches, this is fine due to server validation. In solo instances, this causes ranged shooting to apply twice.
    - Just changing `is_server` to false the parameters is not enough
    - Hit results is used to find out which enemies should be gibbed with weapon types elsewhere, so I kept this whole system intact
    - The change is to take the damage done, then halve its value if `is_server` is true. That way, it gets doubled and becomes the original damage.
- Refactored randomization mod options to avoid hooking functions that do nothing without -- Thanks Geoff from Accounting!
    - Disables some hooks in the following patches if player randomization is disabled: 
        - `PlayerHuskVisualLoadoutExtension`
        - `PlayerHuskFirstPersonExtension`
        - `MissionIntroView`
        - `LobbyView`
    - Reenables those hooks if randomization is enabled mid-game, piggybacking off `mod._on_setting_changed` in **ewc.lua**
- Defaulted randomization mod options to off due to the issues related to it (**ewc_data.lua**)
    - Namely, crashing upon hovering seemingly random parts
    - This change can be reverted if the root causes are solved
- [DotD] Add support for new weapons and marks -- Thanks to Geoff from Accounting!
    - `shotgun_p3_m1`
    - `ogryn_hammer_2h_p1_m1`
    - `ogryn_thumper_p1_m3`
    - `ogryn_powermaul_slabshield_p1_m2`
    - `powermaul_2h_p1_m2`
    - `shotgun_p2_m3`
    - table_clones added to **utilities/attachments.lua**
    - New weapon files created for `shotgun_p3_m1` (Huntsman Shotgun) and `ogryn_hammer_2h_p1_m1` (Cruncher)
- More robust input validation for fix requirements (**utilities/plugins.lua**)
    - As-is, having malformed `requirements` for fixes would cause a backend error on launch, without indication of what went wrong
    - This checks for basic errors and logs hints for plugin authors
- Add new attachments
    - Relic Blade **weapons/powersword_2h_p1_m1.lua**
        - Grip: `_item_melee.."/grips/2h_power_sword_grip_05"`
        - Blade: `_item_melee.."/blades/2h_power_sword_blade_05"`
        - Pommel: `_item_melee.."/pommels/2h_power_sword_pommel_05"`
        - Hilt: `_item_melee.."/hilts/2h_power_sword_hilt_05"`
    - Double-barreled Shotgun **weapons/shotgun_p2_m1.lua**
        - Receiver: `_item_ranged.."/recievers/shotgun_double_barrel_receiver_04"`
        - Stock: `_item_ranged.."/stocks/shotgun_double_barrel_stock_05"`
        - Barrel: `_item_ranged.."/barrels/shotgun_double_barrel_05"`
    - Infantry Lasgun **weapons/lasgun_p1_m1.lua**
        - Stock: and **attachments/stock_lasgun.lua**
            - `_item_ranged.."/stocks/lasgun_rifle_stock_06"`
            - `_item_ranged.."/stocks/lasgun_rifle_stock_07"`
            - `_item_ranged.."/stocks/lasgun_rifle_stock_08"`
        - Receiver:
            - `_item_ranged.."/recievers/lasgun_rifle_receiver_04"`
            - `_item_ranged.."/recievers/lasgun_rifle_receiver_05"`
            - `_item_ranged.."/recievers/lasgun_rifle_receiver_06"`
        - Barrel: **attachments/barrel_lasgun_infantry.lua**
            - `_item_ranged.."/barrels/lasgun_rifle_barrel_10"`
            - `_item_ranged.."/barrels/lasgun_rifle_barrel_11"`
            - `_item_ranged.."/barrels/lasgun_rifle_barrel_12"`
        - Grip: **attachments/grip_lasgun.lua**
            - `_item_ranged.."/grips/lasgun_rifle_grip_06"`
            - `_item_ranged.."/grips/lasgun_rifle_grip_07"`
        - Magazine: **attachments/magazine_lasgun_infantry.lua**
            - `_item_ranged.."/magazines/lasgun_rifle_magazine_02"`
            - `_item_ranged.."/magazines/lasgun_rifle_magazine_03"`
        - Muzzle: **attachments/muzzle_lasgun_infantry.lua**
            - `_item_ranged.."/muzzles/lasgun_rifle_muzzle_05"`
            - `_item_ranged.."/muzzles/lasgun_rifle_muzzle_06"`
            - `_item_ranged.."/muzzles/lasgun_rifle_muzzle_07"`
    - Recon Lasgun **weapons/lasgun_p3_m1.lua**
        - Stock: `_item_ranged.."/stocks/lasgun_rifle_elysian_stock_05"` also in **attachments/stock_lasgun.lua**
        - Receiver: `_item_ranged.."/recievers/lasgun_rifle_elysian_receiver_09"`
        - Muzzle: `_item_ranged.."/muzzles/lasgun_rifle_elysian_muzzle_05"` in **attachments/muzzle_lasgun_recon.lua**
- Add load order rules to metadata and **extended_weapon_customization.mod**
    - We found that loading `transonic_weapon_colors` before EWC or the MasterItems patch would cause crashes or break functionality
- Add **info.json** metadata file
    - This was introduced by DMF 26.08.19
    - I set the version to `<current>_dotd_<n>`. Feel free to change

## Extended Weapon Customization - Base Additions
Based on the Nexus version (1.04 - 2026-07-10)

- [DotD] Fix crash on turning on laser (**attachments/laser_pointer.lua**)
    - `rewind_ms` had name changed (`LagCompensation.rewind_miliseconds`)... yes that is what they wrote
    - Using this as a string as an argument for `PhysicsWorld.raycast` is fine; the source code has code passing that same string as an argument
- [DotD] Add support for new weapons and marks -- Thanks Geoff from Accounting!
    - `shotgun_p3_m1` (**weapons/shotgun_p3_m1.lua**)
    - `ogryn_thumper_p1_m3`
    - `shotgun_p2_m3`
- [DotD] Add `shotgun_p1_m1` parts to `shotgun_p3_m1` -- Thanks Geoff from Accounting!
    - **attachments/barrel_shotgun_combat.lua**
    - **attachments/stock_shotgun_combat.lua**
    - **attachments/underbarrel_shotguns.lua**
- [DotD] Add `shotgun_p3_m1` parts to `shotgun_p1_m1` -- Thanks Geoff from Accounting!
    - **weapons/shotgun_p1_m1.lua**
    - **attachments/stock_shotgun_huntsman.lua**
    - **attachments/underbarrel_huntsman.lua**
    - With localization for group names (**ewc_ba_localization.lua**)
- Add new attachments (for brevity, these are just the numbers, since the address is written in the EWC section)
    - **attachments/blade_2h_power_sword.lua** - Relic Blade Blade: [5]
    - **attachments/hilt_2h_power_sword.lua** - Relic Blade Hilt: [5]
    - **attachments/pommel_2h_power_sword.lua** - Relic Blade Pommel: [5]
    - **attachments/stock_shotgun_double_barrel.lua** - Double-barreled Shotgun Stock: [5]
    - **attachments/barrel_lasgun_infantry.lua** - Infantry Lasgun Barrels: [10, 11, 12]
    - **attachments/grip_lasgun.lua** - Infantry Lasgun Magazines: [6, 7] 
    - **attachments/magazine_lasgun_infantry.lua** - Infantry Lasgun Magazines: [2, 3] 
    - **attachments/muzzle_lasgun_infantry.lua** - Infantry Lasgun Muzzles: [5, 6, 7] 
    - **attachments/muzzle_lasgun_recon.lua** - Recon Lasgun Muzzles: [5]
    - **attachments/stock_lasgun.lua**
        - Infantry Lasgun Stocks: [6, 7, 8]
        - Recon Lasgun Stocks; [5]
- Add **info.json** metadata file
    - This was introduced by DMF 26.08.19
    - I set the version to `<current>_dotd_<n>`. Feel free to change

## Visible Equipment
Based on Nexus version (10 July 2026).

- [DotD] Fix crash on opening cosmetics (**patches/ui_manager.lua**)
    - The create mannequin function from `Items` was moved to `ProfileUtils`
    - The parameters now take the unit and profile instead of unit and all the individual parts of the profile
- Add missing weapons -- Thanks Broccodile!
    - [DotD] Add support for new weapons and marks
        - `shotgun_p3_m1`: Huntsman's Shotgun
        - `ogryn_hammer_2h_p1_m1`: Cruncher
        - `ogryn_thumper_p1_m3`: Thugshot
        - `ogryn_powermaul_slabshield_p1_m2`: Gromm Mk I & Mk V Battle Maul & Slab Shield
        - `powermaul_2h_p1_m2`: Krourk Mk VII Crusher
        - `shotgun_p2_m3`: Krourk Mk IV Double-Barrelled Shotgun
    - [Skitarii] Add support for new melee weapons
        - `powermaul_p3_m1`: Arc Maul
        - `powersword_p3_m1`: Mechanicus Power Sword
        - `transonic_sword_transonic_knife_p1_m1`: Paired Transonic Blades (I did these so send critiques to me)
    - Added to the following files:
        - **utilities/animations.lua**
        - **utilities/hide_attachments.lua**
        - **utilities/momentums.lua**
        - **utilities/offsets.lua**
        - **utilities/scripts.lua**
        - **utilities/sounds.lua**
- Add **info.json** metadata file
    - This was introduced by DMF 26.08.19
    - I set the version to `<current>_dotd_<n>`. Feel free to change

# To-do
## Extended Weapon Customization
- Missing display name after the notification changes from the hotfix 1.12.4, 2026-08-11 (**patches/inventory_weapon_cosmetics_view/preview.lua**)
    - Names do not display when selecting attachments
        - in `widgets_by_name`, there's no `sub_display_name` nor `display_name`
    - The nameplates from Modding Tools still work though
    - Dirty fix of using mod:notify() to display it, which in this menu will put a notification on the right side
        - Includes a widget to disable this (**ewc_data.lua**, **ewc_localization.lua**)
        - Search for `-- @Backup158:` in the code

## Visual Loadout Customization Community Patch
- Old bug from Skitarii update that prevented materials from being applied to body parts (?)
    - Namely, oxidation on Skitarii limbs