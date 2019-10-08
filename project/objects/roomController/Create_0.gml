grid_collision_create()

randomize()

timer = 0 
units = 0
spawn_time = 60
flesh = 0
fleshCurrent = 0

fleshRequired[0] = 16
fleshRequired[1] = 18
fleshRequired[2] = 20
fleshRequired[3] = 24
fleshRequired[4] = 26
fleshRequired[5] = 30

max_units[0] = 4
max_units[1] = 6
max_units[2] = 9
max_units[3] = 12
max_units[4] = 12
max_units[5] = 12

parents = 0
parentsTotal = 0 
parent_percentage[0] = 0
parent_percentage[1] = 15
parent_percentage[2] = 25
parent_percentage[3] = 33
parent_percentage[4] = 50
parent_percentage[5] = 66

fleshArt[0] = s_body0
fleshArt[1] = s_body1
fleshArt[2] = s_body2
fleshArt[3] = s_body3
fleshArt[4] = s_body4
fleshArt[5] = s_body5
fleshArt[6] = s_body6

fleshPercentage = (fleshCurrent/fleshRequired[flesh])*100 

debug_object_variable