switch(states)
{
	case states.normal:	
	#region Normal State
	
	if playerInput.spook {
		states = states.spook	
	}
	
	hspd = (playerInput.right - playerInput.left)*movespeed

	vspd = (playerInput.down - playerInput.up)*movespeed

	if hspd != 0 or vspd != 0 {
		Speed = point_distance(0,0,hspd,vspd)
		Direction = point_direction(0,0,hspd,vspd)
	}

	image_angle = Direction

	//Collision Checks
	repeat(abs(vspd)) {
		if !place_meeting(x,y+sign(vspd),block) {
			y += sign(vspd)	
		} else {
			vspd = 0	
		}
	}

	repeat(abs(hspd)) {
		if !place_meeting(x+sign(hspd),y,block) {
			x += sign(hspd)	
		} else {
			hspd = 0	
		}
	}
	
	#endregion
	break;
	case states.spook:	
	#region Spook States
	timer++
	hspd = 0
	vspd = 0
	
	if timer >= 60 {
		timer = 0
		states = states.normal	
	}
	
	
	#endregion
	break;
}


depth = -y