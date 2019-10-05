hspd = (playerInput.right - playerInput.left)*movespeed

vspd = vspd + grav

//Collision Checks
repeat(abs(vspd)) {
	if !place_meeting(x,y+sign(vspd),block) {
		y += sign(vspd)	
	} else {
		var _block = instance_place(x,y+sign(vspd),block)
		if _block.drawn == 0 {
			_block.drawn = 1	
		}
		vspd = 0	
	}
}

repeat(abs(hspd)) {
	if !place_meeting(x+sign(hspd),y,block) {
		x += sign(hspd)	
	} else {
		var _block = instance_place(x+(hspd),y,block)
		if _block.drawn == 0 {
			_block.drawn = 1	
		}
		hspd = 0	
	}
}