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
		
		timer++
		
		if timer >= 45 {
			timer = 0
			
			//Run away from the player
			var _goalX = 0
			var _goalY = 0
			if (player.x < x) {
				//while _goalX == 0 {
				//	var _random_x = irandom_range(x,room_width)
					//var _random_tile = ds_grid_get(roomController.grid_collision,_random_x,)	
				//}
			} else goalX = -128
			if (player.y < y) {
				
			} else goalY = -128			
			
			for(var i=0;i<ds_list_size(line_list);i++) {
				line_list[| i].states = states.run
				line_list[| i].movespeed = 7
			}
			states = states.run	
			
			pos = 1
			scr_mp_grid_define_path(x,y,goalX,goalY,path,roomController.grid_sidewalk,false)
			x_goto = path_get_point_x(path,pos)
			y_goto = path_get_point_y(path,pos)
		}
		
		
		break;
	#endregion
	#region Run State
		case states.run:
			
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
}
depth = -y