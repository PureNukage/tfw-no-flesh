if ds_list_find_index(debug.object_list,id) != -1 {
	ds_list_delete(debug.object_list,ds_list_find_index(debug.object_list,id))	
}