//Movement
vspd = 0
hspd = 0
s_hspd = 0
s_vspd = 0
movespeed = 3
Direction = 0
Speed = 0

//Aura
aura = 0
aura_size = 64

aggro_list = ds_list_create()
lookout_list = ds_list_create()

aggro_list_size = ds_list_size(aggro_list)
lookout_list_size = ds_list_size(lookout_list)

color = 0

hp = 3

hidingSpot = 0

timer = 0
states = states.normal

debug_object_variable