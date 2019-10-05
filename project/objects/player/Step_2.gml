var vxNew, vyNew
s_hspd += hspd
s_vspd += vspd

vxNew = round(s_hspd)
vyNew = round(s_vspd)

s_hspd -= vxNew
s_vspd -= vyNew


// Vertical
repeat(abs(vyNew)) {
    if (!place_meeting(x, y + sign(vyNew), block))
        y += sign(vyNew); 
    else {
        vspd = 0;
        break;
    }
}

// Horizontal
repeat(abs(vxNew)) {

    // Move up slope
    if (place_meeting(x+sign(vxNew),y,block) && !place_meeting(x+sign(vxNew),y-1,block))
        --y;
    
    // Move down slope
    if (!place_meeting(x+sign(vxNew),y,block) && !place_meeting(x+sign(vxNew),y+1,block) && place_meeting(x+sign(vxNew),y+2,block))
        ++y; 

    if (!place_meeting(x+sign(vxNew),y,block))
        x += sign(vxNew); 
    else {
        hspd = 0;
        break;
    }
}