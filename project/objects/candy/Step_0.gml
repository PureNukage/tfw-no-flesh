switch(state)
{
	case 0:
		if y != goalY vspd = vspd + grav

		repeat abs(vspd) {
			var newY = y
			newY += sign(vspd)
			//show_debug_message("newY: "+string(newY))
			if newY <= goalY {
				y += sign(vspd)
			} else {
				//show_debug_message("landed at: "+string(y))
				vspd = 0	
				hspd = 0
				state = 1
			}
		}

		x += hspd
	break;
	case 1:
	
		
		if distance_to_object(player) < 140 {
			movespeed = lerp(movespeed,movespeedMax,.3)
			move_towards_point(player.x,player.y,movespeed)	
		} else {
			movespeed = lerp(movespeed,0,.6)	
			speed = movespeed
		}
		
	break;
}

size = lerp(size,1,.08)

image_xscale = size
image_yscale = size

if instance_place(x+hspd,y,player) {
	roomController.fleshCurrent++
	instance_destroy()	
}

depth = -y