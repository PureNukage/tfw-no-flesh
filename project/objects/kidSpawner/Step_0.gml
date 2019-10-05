timer++

if timer >= 60 {
	timer = 0
	var kid_controller = instance_create_layer(x,y,"Instances",kidController)
	var kid0 = instance_create_layer(x,y,"Instances",kid)
	var kid1 = instance_create_layer(x,y,"Instances",kid)
	var kid2 = instance_create_layer(x,y,"Instances",kid)
	kid0.controller = kid_controller
	kid1.controller = kid_controller
	kid2.controller = kid_controller
}