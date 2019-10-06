draw_self()
switch(states)
{
	case states.spook:
		draw_set_halign(fa_center)
		draw_set_color(c_black)
		draw_text(x,y-128,"EEEEEEEEK!")
		
		draw_set_color(-1)
		draw_set_halign(fa_left)
	break;
}