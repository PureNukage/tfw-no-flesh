timer++

if timer >= 60 {
	timer = 0
	var kid0 = instance_create_layer(x,y,"Instances",kid)
	var kid1 = instance_create_layer(x,y,"Instances",kid)
	var kid2 = instance_create_layer(x,y,"Instances",kid)
}