switch(states) 
{
	#region Normal State
		case states.normal:
		
		if point_distance(x,y,x_goto,y_goto) < 8 {
			if ++pos == path_get_number(path) {	
				//Arrived at House (presumably)
				if ds_list_size(route) > 0 {
					//Check if all kids are here
					if parent_do_i_have_one == true {
						var amount_of_kids = ds_list_size(line_list)-1
					} else var amount_of_kids = ds_list_size(line_list)
					var have_my_kids_arrived = 0
					while(have_my_kids_arrived < amount_of_kids) {
						for(var i=0;i<amount_of_kids;i++) {
							if i == 0 {
								if distance_to_point(line_list[| i].x,line_list[| i].y) < 75 {
									have_my_kids_arrived++
								}
							} else {
								show_message("i: "+string(i))
								with line_list[| i] {
									if distance_to_point(other.line_list[| i-1].x,other.line_list[| i-1].y) < 75 {
										have_my_kids_arrived++	
									}
								}
							}	
						}
					}
					if have_my_kids_arrived == amount_of_kids {
						goalX = route[| 0].x+96
						goalY = route[| 0].y+200
						ds_list_delete(route,0)
						scr_mp_grid_define_path(x,y,goalX,goalY,path,roomController.grid_sidewalk,false)
						pos = 1
						x_goto = path_get_point_x(path,pos)
						y_goto = path_get_point_y(path,pos)
					}
				} else {
					//End of the route	
					states = states.run
					#region which corner
						var _whichCorner = irandom_range(0,3)
						var _5050 = irandom_range(0,1)
						var spawnX = 0
						var spawnY = 0
			
						//Choose which corner this squad will spawn in 
						switch(_whichCorner) 
						{
							case 0:											//	Bottom Right
								if _5050 == 0 {
									spawnX = room_width-64
									spawnY = irandom_range(y,room_height-64)
								} else {
									spawnX = irandom_range(x,room_width-64)	
									spawnY = room_height-64
								}
							break;
							case 1:											//	Top Right
								if _5050 == 0 {
									spawnX = room_width-64
									spawnY = irandom_range(y,0)
								} else {
									spawnX = irandom_range(x,room_width-64)
									spawnY = 64
								}	
							break;
							case 2:											//	Bottom Left
								if _5050 == 0 {
									spawnX = 64
									spawnY = irandom_range(y,room_height-64)
								} else {
									spawnX = irandom_range(0,x)
									spawnY = room_height-64
								}
							break;
							case 3:											//	Top Left
								if _5050 == 0 {
									spawnX = 64
									spawnY = irandom_range(0,y)
								} else {
									spawnX = irandom_range(0,x)
									spawnY = room_height-64
								}
							break;
						}
					#endregion
					
					scr_mp_grid_define_path(x,y,spawnX,spawnY,path,roomController.grid_sidewalk,false)
					pos = 1
					x_goto = path_get_point_x(path,pos)
					y_goto = path_get_point_y(path,pos)
					
				}
				
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
				//with line_list[| ds_list_size(line_list)] movespeed = 5
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
				if parent_do_i_have_one == true {
					with parent {
						if controller = other.id {
							controller = -1	
						}
					}
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

route_size = ds_list_size(route)
depth = -y