switch(mode)
{
	case 0:
	
	break;
	case 1:		// Collision Grid Debug
		draw_set_halign(fa_right)
		draw_set_color(c_black)
		draw_text(1280-15,60,"grid layer: "+string(grid_layer))
		draw_set_halign(fa_left)
		draw_set_color(-1)
		
		
	break;
	case 2:		//	Object Variables
		draw_set_halign(fa_left)
		draw_set_color(c_black)
		var _y = 15
		for(var i=0;i<array_length_1d(object_variable_array);i++) {
			draw_text(15,_y,string(object_variable_array[i]) + " : " + string(variable_instance_get(object,object_variable_array[i])))	
			_y += 15
		}
	
		
		draw_set_color(-1)
	break;		
}

if mode > 0 {		// Constants
	draw_set_color(c_black)
	draw_set_halign(fa_right)
	draw_text(1280-15,15,"mode: "+string(mode))
	draw_text(1280-15,30,"object index: "+string(object_Index))
	draw_text(1280-15,45,"object name: "+string(object_get_name(object.object_index)))
	
	draw_set_color(-1)
		
}