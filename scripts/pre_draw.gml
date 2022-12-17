var phone_hud_hidden = !(get_local_setting(SET_HUD_SIZE) || get_local_setting(SET_HUD_NAMES));
var phone_attacking = state == PS_ATTACK_AIR || state == PS_ATTACK_GROUND
var phone_window_end = floor(get_window_value(attack, window, AG_WINDOW_LENGTH) * ((get_window_value(attack, window, AG_WINDOW_HAS_WHIFFLAG) && !has_hit) ? 1.5 : 1));

if phone_attacking && attack == AT_NSPECIAL{if window == 7{
		var x1 = x + 72 * spr_dir;
		var y1 = y - 40 + lengthdir_y(32, beam_angle);
		
		switch((abs(lengthdir_y(1, beam_angle)) > abs(lengthdir_y(1, 15))) * sign(lengthdir_y(1, beam_angle))){
			case 1: // down
				x1 = x + 74 * spr_dir;
				y1 = y - 6;
				break;
			case -1: // up
				x1 = x + 60 * spr_dir;
				y1 = y - 72;
				break;
		}
		
		var length = beam_length / 2;
		var frame = min(floor(6 * window_timer / phone_window_end), 5);
		var angle = beam_angle;
		
		x1 -= lengthdir_x(40, angle)
		y1 -= lengthdir_y(40, angle)
		
		draw_sprite_ext(sprite_get("nspecial_beam_fade"), frame, x1, y1, length, 1, angle, c_white, 1)
	}
}

if ssj{
	print("e");
	draw_outline(ssjs[ssj].color);
	
}



#define draw_outline(col)

gpu_set_alphatestenable(true);
gpu_set_fog(1, col, 0, 1);

for (i = 0; i < 2; i++){
	var rand_x = random_func(i + 00, 5, true) - 2;
	var rand_y = random_func(i + 10, 5, true) - 2;
	
	draw_sprite_ext(sprite_index, image_index, x + rand_x - clamp(hsp, -15, 15) * (i + 1), y + rand_y - vsp * (i + 1) + 4 + draw_y, image_xscale * 2.2, image_yscale * 2.2, spr_angle, c_white, 0.5);
}
    
gpu_set_fog(0, c_white, 0, 0);
gpu_set_alphatestenable(false);