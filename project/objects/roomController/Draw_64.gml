if debug.mode == 0 {

	var _centerX = camera_get_view_width(camera.cam)/2
	var _centerY = 64
	draw_healthbar(_centerX-128,_centerY-32,_centerX+128,_centerY+32,fleshPercentage,c_white,c_red,c_red,0,true,true)

	var _x = 15
	for(var i=0;i<player.hp;i++) {
		draw_sprite(s_skull,0,_x,_centerY-64)
		_x += 128
	}

	var _x = camera_get_view_width(camera.cam)-128
	for(var i=0;i<flesh;i++) {
		draw_sprite(fleshArt[i],0,_x,_centerY-64)
		_x -= 96
	}
	
}