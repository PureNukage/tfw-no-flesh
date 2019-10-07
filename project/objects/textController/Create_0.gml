text[0] = "There was a lonely skeleton who dreamed of having friends"
text[1] = "however the children screamed in fright when they looked at him"
text[2] = "Maybe eating lots of candy would give him flesh"

text[3] = "W A S and D are to move"
text[4] = "Spacebar is to spook children"
text[5] = "E enters a hiding spot"

text[6] = "Your goal is to scare children and take their candy"
text[7] = "You need all 6 body parts in order to win the game"
text[8] = "Watch out for parents"
text[9] = "They dont like it when their kids get spooked"
text[10] = "Press any key"

var _x = room_width/2
var _y = 32
for(var i=0;i<3;i++) {
	var _text = instance_create_layer(_x,_y,"Instances",textChild)
	_text.image_alpha = 0
	_text.text = text[i]
	_text.ID = i
	_y += 48
}

timer = 0
timerRequired = 30

textCurrent = 0