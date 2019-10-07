grid_collision_create()

randomize()

timer = 0 
units = 0
spawn_time = 60
flesh = 0
fleshCurrent = 0

fleshRequired[0] = 32
fleshRequired[1] = 48
fleshRequired[2] = 64
fleshRequired[3] = 72
fleshRequired[4] = 86
fleshRequired[5] = 100

max_units[0] = 6
max_units[1] = 9
max_units[2] = 22
max_units[3] = 24
max_units[4] = 27
max_units[5] = 30

parents = 0
parentsTotal = 0 
parent_percentage[0] = 0
parent_percentage[1] = 15
parent_percentage[2] = 25
parent_percentage[3] = 33
parent_percentage[4] = 50
parent_percentage[5] = 66

fleshArt[0] = s_flesh_leg
fleshArt[1] = s_flesh_leg
fleshArt[2] = s_flesh_arm
fleshArt[3] = s_flesh_arm
fleshArt[4] = s_flesh_chest
fleshArt[5] = s_flesh_head

fleshPercentage = (fleshCurrent/fleshRequired[flesh])*100 

debug_object_variable