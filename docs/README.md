Fork of [Extended Weapon Customization](https://github.com/grasmann/darktide-mods). Repo is just to keep track of my changes, and is not meant as a replacement for EWC and the work put into it.

Grasmann doesn't check GitHub so I stopped worrying about keeping my forks clean and up to date, and handling multiple forks for a mono-repo is annoying.

# Version
Based on the pinned scrollbar version (2026-07-12).

## Changes
### Extended Weapon Customization
- Bandaid fix for doubled range damage in Psykhanium (**patches/action_shoot.lua**)
- More robust input validation for fix requirements (**utilities/plugins.lua**)
- Defaulted randomization mod options to off due to the issues related to it (**ewc_data.lua**)
    - Namely, crashing upon hovering seemingly random parts
    - This change can be reverted if the root causes are solved
- Additional safety checks in the hook to `_find_unit_node_recursive` (**patches/visual_loadout_customization.lua**)
    - I'm guessing this is a sign that the VLCCP needs to be updated
    - But I think messed up attachment positioning is still a good indicator of issues
## To-do
- Muzzle flash only on the left dual-wield weapons
- Missing display name after the notification changes from the hotfix before 1.13.0