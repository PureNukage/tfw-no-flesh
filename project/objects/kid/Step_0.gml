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

depth = -y