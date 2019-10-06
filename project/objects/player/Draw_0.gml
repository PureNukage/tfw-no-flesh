for (var i=0; i<image_number;i++) {
	draw_sprite_ext(sprite_index,i,x,y-i,image_xscale,image_yscale,image_angle,c_white,image_alpha);
}

if states == states.spook {
	draw_set_halign(fa_center)
	draw_text(x,y-162,"boo!")	
}

switch(aura)
{
	case 0: var _color = c_white break;
	case 1: var _color = c_yellow break;
	case 2: var _color = c_red break;
}

draw_set_alpha(.3)
draw_set_color(_color)
draw_ellipse(x-aura_size,y-(aura_size/2),x+aura_size,y+(aura_size/2),false)
draw_set_color(-1)
draw_set_alpha(1)