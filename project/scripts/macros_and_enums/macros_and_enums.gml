#macro animation_end (image_index > image_number - 1)
#macro debug_object_variable ds_list_add(debug.object_list,id)


enum states {
	normal,
	spook,
	hide,
	damage,
	
	run = 6,
	look = 7,
	flee = 8
}

enum flesh {
	left_arm,
	right_arm,
	left_leg,
	right_leg,
	chest,
	head
}