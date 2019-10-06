goalX = irandom_range(0,room_width)
goalY = irandom_range(0,room_height)
x_goto = 0
y_goto = 0
pos = 1
path = path_add()
movespeed = 3

line_list = ds_list_create()

states = states.normal

scr_mp_grid_define_path(x,y,goalX,goalY,path,roomController.grid_sidewalk,false)
x_goto = path_get_point_x(path,pos)
y_goto = path_get_point_y(path,pos)

debug_object_variable