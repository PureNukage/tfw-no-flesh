var number = irandom_range(0,99)
var amount_of_candy = 0

if number < 44 {
	amount_of_candy = 1		
} else if (number > 43 and number < 74) {
	amount_of_candy = 2	
} else if number > 73 { 
	amount_of_candy = 3	
}

for(var i=0;i<amount_of_candy;i++) {
	var _candy = instance_create_layer(x,y,"Instances",candy)
	var spread = 128
	var _hspd = 0
	var _hspd2 = irandom_range(1,3)
	var right_or_left = irandom_range(1,2)
	if right_or_left == 1 _hspd = 1 else _hspd = -1	
	_candy.goalY = irandom_range(y+spread,y-spread)
	_candy.vspd = -12
	_candy.hspd = _hspd2*_hspd
}