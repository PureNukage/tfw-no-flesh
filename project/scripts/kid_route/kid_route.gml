var house_count = instance_number(house)
for(var i=0;i<house_count;i++) {
	if ds_list_find_index(route_visited,instance_nth_nearest(x,y,house,i)) == -1 {
		ds_list_add(route,instance_nth_nearest(x,y,house,i))
	}
}