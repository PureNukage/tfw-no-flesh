var house_count = instance_number(house)
for(var i=0;i<house_count;i++) {
	ds_list_add(route,instance_nth_nearest(x,y,house,i))
}