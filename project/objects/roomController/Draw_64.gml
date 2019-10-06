switch(fleshLevel)
{
	case 0:
		var _centerX = camera_get_view_width(camera.cam)/2
		var _centerY = 64
		var percentage = (fleshCurrent/fleshRequired)*100
		draw_healthbar(_centerX-128,_centerY-32,_centerX+128,_centerY+32,percentage,c_white,c_red,c_red,0,true,true)
	break;
}