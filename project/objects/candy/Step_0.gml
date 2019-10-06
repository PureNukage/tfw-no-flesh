if y != goalY vspd = vspd + grav

size = lerp(size,1,.08)

image_xscale = size
image_yscale = size

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
	}
}

if instance_place(x+hspd,y,player) {
	roomController.fleshCurrent++
	instance_destroy()	
}

x += hspd


depth = -y