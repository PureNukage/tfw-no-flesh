switch(states)
{
	#region Normal State	
	case states.normal:	
	
	if aura_size > 64 aura_size--
	
	if playerInput.spook {
		states = states.spook
		movespeed = 1
		aura_size = 256
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
	
	//Hop into a hiding spot
	if instance_place(x+hspd,y+vspd,hidingspot) {
		var _hidingspot = instance_place(x+hspd,y+vspd,hidingspot)
		hidingSpot = _hidingspot
		_hidingspot.highlight = true
		if playerInput.action {
			_hidingspot.filled = !_hidingspot.filled
			if _hidingspot.filled == 1 {
				states = states.hide
			}
		}
	} else {
		if hidingSpot != 0 { 
			hidingSpot.highlight = false	
			hidingSpot = 0
		}
	}
	
	break;
	#endregion
	#region Spook State	
	case states.spook:	
	
	timer++
	hspd = 0
	vspd = 0
	
	if timer >= 60 {
		timer = 0
		states = states.normal	
		movespeed = 3
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
	
	
	break;
	#endregion
	#region Hide State
		case states.hide:
			hspd = 0
			vspd = 0
			speed = 0
			image_alpha = 0
			if playerInput.action {
				hidingSpot.filled = 0	
				image_alpha = 1
				states = states.normal
			}
				
		break;
	#endregion
}

if ds_list_size(aggro_list) > 0 {
	//aura_size = 64+(32*ds_list_size(aggro_list))
} else {
	
}

#region aura

	switch(aura)
	{
		case 0: 
			if ds_list_size(aggro_list) == 0 and ds_list_size(lookout_list) == 0 {
				color = c_white 
				aura_size--
				aura_size = clamp(aura_size,64,(64+(32*ds_list_size(aggro_list)))+256)
			} else {
				if ds_list_size(aggro_list) > 0 {
					aura = 2	
				} else {
					if ds_list_size(lookout_list) > 0 {
						aura = 1	
					}
				}
			}
		break;
		case 1: 
			if ds_list_size(aggro_list) == 0 and ds_list_size(lookout_list) > 0 {
				color = c_yellow
				aura_size--
				aura_size = clamp(aura_size,64+(32*ds_list_size(aggro_list)),128+(32*ds_list_size(aggro_list))+256)
			} else {
				if ds_list_size(aggro_list) > 0 {
					aura = 2	
				} else {
					if ds_list_size(lookout_list) == 0 {
						aura = 0	
					}
				}
			}
		
		
		break;
		case 2: 
			if ds_list_size(aggro_list) > 0 {
				color = c_red 
				aura_size--
				aura_size = clamp(aura_size,64+(32*ds_list_size(aggro_list)),64+(32*ds_list_size(aggro_list))+256)
			} else {
				if ds_list_size(lookout_list) > 0 {
					aura = 1	
				} else aura = 0
			}
		break;
	}
	
#endregion

aggro_list_size = ds_list_size(aggro_list)
lookout_list_size = ds_list_size(lookout_list)

depth = -y