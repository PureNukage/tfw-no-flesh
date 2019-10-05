if keyboard_check_pressed(vk_control) {
	mode++	
}

var new_grid_layer = grid_layer
new_grid_layer += keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left)
if (new_grid_layer > -2 and new_grid_layer < 2) grid_layer = new_grid_layer

if mode >= 2 {
	mode = 0
}	