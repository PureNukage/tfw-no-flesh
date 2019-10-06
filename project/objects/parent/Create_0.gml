line_pos = -1
controller = -1
x_goto = -1
y_goto = -1
pos = 1
gap = 3		//	Gap in between people in line
movespeed = 3

boomer_brain_needed = 45
boomer_brain_current = 0
path = path_add()

states = states.normal

line_of_sight = collision_line(x,y,player.x,player.y,block,true,false)

timer = 0

debug_object_variable