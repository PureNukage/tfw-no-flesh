switch(drawn)
{
	case 0:
		if place_meeting(x,y-2,player) {
			if player.x > x image_xscale = -1
			else image_xscale = 1
			drawn = 1
		}	
	break;
	case 1:
		image_speed = 3
		if animation_end drawn = 2
	break;
	case 2:
		sprite_index = s_block1
	break;
}