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
flesh_required[flesh.chest] = 86
flesh_required[flesh.head] = 100

max_units[flesh.left_arm] = 12
max_units[flesh.right_arm] = 18
max_units[flesh.left_leg] = 22
max_units[flesh.right_leg] = 24
max_units[flesh.chest] = 27
max_units[flesh.head] = 30

fleshPercentage = (fleshCurrent/fleshRequired[flesh])*100 

debug_object_variable