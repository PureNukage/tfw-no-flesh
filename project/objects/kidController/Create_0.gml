squad_leader = 0

goal = instance_nearest(x,y,house)
x_goto = 0
y_goto = 0
pos = 1
path = path_add()
movespeed = 3

scr_mp_grid_define_path(x,y,goal.x+90,goal.y+198,path,roomController.grid_sidewalk,false)
x_goto = path_get_point_x(path,pos)
y_goto = path_get_point_y(path,pos)
pos = 1