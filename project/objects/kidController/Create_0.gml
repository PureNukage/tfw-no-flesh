spawner = -1
x_goto = 0
y_goto = 0
pos = 1
path = path_add()
movespeed = 3

line_list = ds_list_create()

route = ds_list_create()
kid_route()
goalX = route[| 0].x+96
goalY = route[| 0].y+200
ds_list_delete(route,0)

states = states.normal

timer = 0

parent_do_i_have_one = 0

scr_mp_grid_define_path(x,y,goalX,goalY,path,roomController.grid_sidewalk,false)
x_goto = path_get_point_x(path,pos)
y_goto = path_get_point_y(path,pos)

debug_object_variable