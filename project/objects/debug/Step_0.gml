if keyboard_check_pressed(vk_control) {
	mode++	
}

var new_grid_layer = grid_layer
new_grid_layer += keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left)
if (new_grid_layer > -2 and new_grid_layer < 2) grid_layer = new_grid_layer

var new_object = object_Index
new_object += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up)
if (new_object > -1 and new_object < ds_list_size(object_list)) {
	object_Index = new_object
	object = object_list[| object_Index]
	object_variable_array = variable_instance_get_names(object)
}

if mode >= 3 {
	mode = 0
}	