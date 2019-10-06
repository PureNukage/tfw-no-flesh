switch(states) 
{
	#region Normal State
		case states.normal:
		
		if point_distance(x,y,x_goto,y_goto) < 8 {
			if ++pos == path_get_number(path) {	
				goalX = irandom_range(0,room_width)
				goalY = irandom_range(0,room_height)
				scr_mp_grid_define_path(x,y,goalX,goalY,path,roomController.grid_sidewalk,false)
				pos = 1		
				x_goto = path_get_point_x(path,pos)
				y_goto = path_get_point_y(path,pos)
			} else {
				x_goto = path_get_point_x(path,pos)
				y_goto = path_get_point_y(path,pos)
			}
		}
		
		mp_potential_step(x_goto,y_goto,movespeed,false)		
		
		break;
	#endregion
	#region Spook State
		case states.spook:
		
		
		
		break;
	#endregion
}
depth = -y