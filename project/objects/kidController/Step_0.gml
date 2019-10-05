//x = squad_leader.x
//y = squad_leader.y

if point_distance(x,y,x_goto,y_goto) < 8 {
	if ++pos == path_get_number(path) {	
		
	} else {
		x_goto = path_get_point_x(path,pos)
		y_goto = path_get_point_y(path,pos)
	}
}
		
mp_potential_step(x_goto,y_goto,movespeed,false)