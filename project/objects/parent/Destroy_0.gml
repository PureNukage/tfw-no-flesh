//	Make sure we're in the players aggro list
if ds_list_find_index(player.aggro_list,id) != -1 {
	ds_list_delete(player.aggro_list,ds_list_find_index(player.aggro_list,id))	
}
//	Done looking for player, remove ourselves from the players lookout list
if ds_list_find_index(player.lookout_list,id) != -1 {
	ds_list_delete(player.lookout_list,ds_list_find_index(player.lookout_list,id))
}

roomController.parents--