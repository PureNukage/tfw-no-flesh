/// @function (id, object)
/// @description Compare an instance object index with that of another.
/// @param {real} instance_id The unique instance ID value of the instance to check.
/// @param {real} object_index The object index to be checked against.

var tile_width = 16
var tile_height = 16

grid_collision = ds_grid_create(room_width/tile_width,room_height/tile_height)

grid_sidewalk = mp_grid_create(0,0,room_width/tile_width,room_height/tile_height,tile_width,tile_height)
grid_sidewalk_and_road_and_grass = mp_grid_create(0,0,room_width/tile_width,room_height/tile_height,tile_width,tile_height)

ds_grid_set_region(grid_collision,0,0,room_width/tile_width,room_height/tile_height,-1)

for(var _x=0;_x<ds_grid_width(grid_collision);_x++) {
	for(var _y=0;_y<ds_grid_height(grid_collision);_y++) {
		if instance_position(_x*16,_y*16,house) {
			mp_grid_add_cell(grid_sidewalk,_x,_y)	
			mp_grid_add_cell(grid_sidewalk_and_road_and_grass,_x,_y)
		}
		for(var i=0;i<3;i++) {	
			var tilemap
			switch(i)
			{
				case 0: tilemap = "sidewalk" break;
				case 1: tilemap = "road" break;
				case 2: tilemap = "grass" break;
			}
			var lay_id = layer_get_id(tilemap)
			var tilemap_id = layer_tilemap_get_id(lay_id)
			show_debug_message("_x: "+string(_x))
			show_debug_message("_y: "+string(_y))
			if (tilemap_get_at_pixel(tilemap_id,_x*16,_y*16) & tile_index_mask) != 0 {
				ds_grid_set(grid_collision,_x,_y,i)
				switch(i)
				{
					case 1: mp_grid_add_cell(grid_sidewalk,_x,_y)
					case 2: mp_grid_add_cell(grid_sidewalk,_x,_y)
				}	
				show_debug_message("tilemap added: "+tilemap+" as: "+string(i))
				i = 3
			}
		}		
	}
}

