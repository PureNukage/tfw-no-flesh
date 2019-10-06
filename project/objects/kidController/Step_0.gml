switch(states) 
{
	#region Normal State
		case states.normal:
		
		if point_distance(x,y,x_goto,y_goto) < 8 {
			if ++pos == path_get_number(path) {	
				goalX = irandom_range(128,room_width-128)
				goalY = irandom_range(128,room_height-128)
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
			
			var _5050 = irandom_range(0,1)
			
			//Run away from the player
			if (player.x < x) and (player.y < y) {			//	Bottom Right
				if _5050 == 0 {
					goalX = room_width-64
					goalY = irandom_range(y,room_height-64)
				} else {
					goalX = irandom_range(x,room_width-64)	
					goalY = room_height-64
				}
			} else if (player.x < x) and (player.y > y) {	//	Top Right
				if _5050 == 0 {
					goalX = room_width-64
					goalY = irandom_range(y,0)
				} else {
					goalX = irandom_range(x,room_width-64)
					goalY = 64
				}					
			} else if (player.x > x) and (player.y < y) {	//	Bottom Left
				if _5050 == 0 {
					goalX = 64
					goalY = irandom_range(y,room_height-64)
				} else {
					goalX = irandom_range(0,x)
					goalY = room_height-64
				}
			} else if (player.x > x) and (player.y > y) {	//	Top Left
				if _5050 == 0 {
					goalX = 64
					goalY = irandom_range(0,y)
				} else {
					goalX = irandom_range(0,x)
					goalY = room_height-64
				}
				
			}
			
			var loop_size
			if parent_do_i_have_one == true {
				loop_size = ds_list_size(line_list)-1	
			} else loop_size = ds_list_size(line_list)
			
			for(var i=0;i<loop_size;i++) {
				line_list[| i].states = states.run
				line_list[| i].movespeed = 7
			}
			states = states.run	
			
			movespeed = 7
			pos = 1
			scr_mp_grid_define_path(x,y,goalX,goalY,path,roomController.grid_sidewalk,true)
			x_goto = path_get_point_x(path,pos)
			y_goto = path_get_point_y(path,pos)
		}
		
		
		break;
	#endregion
	#region Run State
		case states.run:
			
		if point_distance(x,y,x_goto,y_goto) < 8 {
			if ++pos == path_get_number(path) {	
				for(var i=0;i<ds_list_size(line_list);i++) {
					instance_destroy(line_list[| i]) 
				}
				spawner.units--
				instance_destroy()
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