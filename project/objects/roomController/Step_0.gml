timer++

fleshPercentage = (fleshCurrent/fleshRequired[flesh])*100 


if fleshPercentage > 100 {
	flesh++
	fleshCurrent = 0 
}

if timer > spawn_time and units < max_units[flesh] {
	var spawnX = irandom_range(128,room_width-128)
	var spawnY = irandom_range(128,room_height-128)
	timer = 0
	units++
	var kid_controller = instance_create_layer(spawnX,spawnY,"Instances",kidController)
	var kid0 = instance_create_layer(spawnX,spawnY,"Instances",kid)
	var kid1 = instance_create_layer(spawnX,spawnY,"Instances",kid)
	var kid2 = instance_create_layer(spawnX,spawnY,"Instances",kid)
	kid_controller.spawner = id
	kid0.controller = kid_controller
	kid0.line_pos = 0
	kid_controller.line_list[| 0 ] = kid0
	kid1.controller = kid_controller
	kid1.line_pos = 1
	kid_controller.line_list[| 1 ] = kid1
	kid2.controller = kid_controller
	kid2.line_pos = 2
	kid_controller.line_list[| 2 ] = kid2
}	