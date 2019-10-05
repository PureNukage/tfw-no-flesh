squad_leader = 0

goal = instance_nearest(x,y,house)
x_goto = 0
y_goto = 0
pos = 0
path = path_add()
movespeed = 3

scr_mp_grid_define_path(x,y,goal.x+90,goal.y+198,path,roomController.grid_sidewalk,false)