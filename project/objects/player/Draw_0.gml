draw_self()
//for (var i=0; i<image_number;i++) {
//	draw_sprite_ext(sprite_index,i,x,y-i,image_xscale,image_yscale,image_angle,c_white,image_alpha);
//}

if states == states.spook {
	draw_set_halign(fa_center)
	draw_text(x,y-162,"boo!")	
}

if states != states.hide {
	draw_set_alpha(.3)
	draw_set_color(color)
	draw_ellipse(x-aura_size,y-(aura_size/2),x+aura_size,y+(aura_size/2),false)
	draw_set_color(-1)
	draw_set_alpha(1)
}

if debug.mode != 0 {
	draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,false)
}	