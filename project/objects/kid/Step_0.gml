switch(states)
{
	#region Normal State
	case states.normal:
		
		if collision_ellipse(player.x-player.aura_size,player.y-(player.aura_size/2),player.x+player.aura_size,player.y+(player.aura_size/2),id,true,false) {
			if player.states == states.spook {
				controller.states = states.spook
				var loop_size
				if controller.parent_do_i_have_one == true {
					loop_size = ds_list_size(controller.line_list)-1	
				} else loop_size = ds_list_size(controller.line_list)
				for(var i=0;i<loop_size;i++) {
					controller.line_list[| i].states = states.spook
					with controller.line_list[| i] {
						kid_candydrop()	
					}
				}
			}
		
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
	#region Run State
		case states.run:
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
}	
depth = -y