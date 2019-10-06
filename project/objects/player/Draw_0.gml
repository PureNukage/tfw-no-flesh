for (var i=0; i<image_number;i++) {
	draw_sprite_ext(sprite_index,i,x,y-i,image_xscale,image_yscale,image_angle,c_white,image_alpha);
}

if states == states.spook {
	draw_set_halign(fa_center)
	draw_text(x,y-162,"boo!")	
}