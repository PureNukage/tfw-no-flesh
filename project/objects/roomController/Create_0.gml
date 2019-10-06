grid_collision_create()

timer = 0 
units = 0
spawn_time = 60
flesh = 0
fleshCurrent = 0

fleshRequired[flesh.left_arm] = 32
fleshRequired[flesh.right_arm] = 48
fleshRequired[flesh.left_leg] = 64
fleshRequired[flesh.right_leg] = 72
fleshRequired[flesh.chest] = 86
fleshRequired[flesh.head] = 100

max_units[flesh.left_arm] = 12
max_units[flesh.right_arm] = 18
max_units[flesh.left_leg] = 22
max_units[flesh.right_leg] = 24
max_units[flesh.chest] = 27
max_units[flesh.head] = 30

parents = 0
parentsTotal = 0 
parent_percentage[0] = 0
parent_percentage[1] = 15
parent_percentage[2] = 25
parent_percentage[3] = 33
parent_percentage[4] = 50
parent_percentage[5] = 66

fleshPercentage = (fleshCurrent/fleshRequired[flesh])*100 

debug_object_variable