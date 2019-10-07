if player.states = states.hide {
	x = player.hidingSpot.x+64
	y = player.hidingSpot.y+64
} else {
	x = player.x
	y = player.y
}

{
	var edgeX = camera_get_view_width(cam)/2
	var edgeY = camera_get_view_height(cam)/2
	x = clamp(x,128+edgeX,room_width-128-edgeX)
	y = clamp(y,128+edgeY,room_height-128-edgeY)
}