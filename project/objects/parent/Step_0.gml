switch(states)
{
	#region Normal State
	case states.normal:
		
		line_of_sight = !collision_line(x,y,player.x,player.y,block,true,false)
		
		if collision_ellipse(player.x-player.aura_size,player.y-(player.aura_size/2),player.x+player.aura_size,player.y+(player.aura_size/2),id,true,false) 
		and player.aura >= 1 and line_of_sight {
			ds_list_delete(controller.line_list,ds_list_find_index(controller.line_list,id))
			states = states.run
			movespeed = 4
			goalX = player.x
			goalY = player.y
			pos = 1
			scr_mp_grid_define_path(x,y,goalX,goalY,path,roomController.grid_sidewalk,true)
			x_goto = path_get_point_x(path,pos)
			y_goto = path_get_point_y(path,pos)
			exit
		}

		if controller.pos-(line_pos*gap) > 1 {
			pos = controller.pos-(line_pos*gap)
			x_goto = path_get_point_x(controller.path,pos)
			y_goto = path_get_point_y(controller.path,pos)

			if point_distance(x,y,x_goto,y_goto) < 8 {
				if ++pos == path_get_number(controller.path) {	
					//scr_mp_grid_define_path(x,y,goalX,goalY+198,controller.path,roomController.grid_sidewalk,false)
					x_goto = path_get_point_x(controller.path,pos)
					y_goto = path_get_point_y(controller.path,pos)
				} else {
					x_goto = path_get_point_x(controller.path,pos)
					y_goto = path_get_point_y(controller.path,pos)
				}
			}
		
			mp_potential_step(x_goto,y_goto,movespeed,false)

		}	

	break;
	#endregion
	#region Spooked State
	case states.spook:
	
		// parent doesnt get spooked unless I add an ability that allows the player to do just that
	
		//if controller.pos-(line_pos*gap) > 1 {
		//	pos = controller.pos-(line_pos*gap)
		//	x_goto = path_get_point_x(controller.path,pos)
		//	y_goto = path_get_point_y(controller.path,pos)

		//	if point_distance(x,y,x_goto,y_goto) < 8 {
		//		if ++pos == path_get_number(controller.path) {	
		//			//scr_mp_grid_define_path(x,y,goalX,goalY+198,controller.path,roomController.grid_sidewalk,false)
		//			x_goto = path_get_point_x(controller.path,pos)
		//			y_goto = path_get_point_y(controller.path,pos)
		//		} else {
		//			x_goto = path_get_point_x(controller.path,pos)
		//			y_goto = path_get_point_y(controller.path,pos)
		//		}
		//	}
		
		//	mp_potential_step(x_goto,y_goto,movespeed,false)
		//}
	
	
	break;
	#endregion
	#region Run State
		case states.run:
					boomer_brain_current++
					
					if line_of_sight and boomer_brain_current >= boomer_brain_needed {
						boomer_brain_current = 0 
						goalX = player.x
						goalY = player.y
						scr_mp_grid_define_path(x,y,goalX,goalY,path,roomController.grid_sidewalk,true)
						x_goto = path_get_point_x(path,pos)
						y_goto = path_get_point_y(path,pos)	
					} else {
						x_goto = path_get_point_x(path,pos)
						y_goto = path_get_point_y(path,pos)
					}
					
					if point_distance(x,y,x_goto,y_goto) < 8 {
						if ++pos == path_get_number(path) {	
							//Touching the player
							
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