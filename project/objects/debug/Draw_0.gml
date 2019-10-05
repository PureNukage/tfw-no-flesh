switch(mode)
{
	case 0:
	
	break;
	case 1:		// Collision Grid Debug
	
		for(var _x=0;_x<ds_grid_width(roomController.grid_collision);_x++) {
			for(var _y=0;_y<ds_grid_height(roomController.grid_collision);_y++) {
				if ds_grid_get(roomController.grid_collision,_x,_y) == grid_layer {
					draw_set_alpha(.6)
					draw_set_color(c_green)
					draw_rectangle(_x*32,_y*32,(_x*32)+32,(_y*32)+32,false)
					draw_set_color(c_black)
					draw_set_alpha(1)					
					//draw_text(_x*16,_y*16,roomController.grid_collision[# _x,_y])
					draw_set_color(-1)
				}
			}
		}
		
	break;
	case 2:
	
	break;		//	Object Variables


}