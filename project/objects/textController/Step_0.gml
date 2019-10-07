timer++

if keyboard_check_pressed(vk_anykey) {
	if textCurrent < 12 timer = timerRequired
	else room_goto_next()	
}

if timer >= timerRequired {
	with textChild {
		if ID = other.textCurrent {
			image_alpha = 1	
		}
	}
	textCurrent++
	switch(textCurrent)
	{
		case 1:	timerRequired = 60
		case 2: timerRequired = 95
		case 3: timerRequired = 120
	}
	timer = 0
}	

if textCurrent == 4 {
	var _x = room_width/2
	var _y = 326
	for(var i=3;i<11;i++) {
		var _text = instance_create_layer(_x,_y,"Instances",textChild)
		_text.image_alpha = 0
		_text.text = text[i]
		_text.ID = i
		_y += 48
	}
}
