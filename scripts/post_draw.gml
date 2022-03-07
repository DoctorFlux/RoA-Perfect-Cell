muno_event_type = 4;
user_event(14);

if funny_broken_mode{
	shader_start();
	draw_sprite_ext(sprite_index, image_index, x + draw_x, y + draw_y, image_xscale * 2, image_yscale * 2, spr_angle, c_white, 1);
	shader_end();
}



if kaioken{
	shader_start();
	draw_sprite_ext(sprite_index, image_index, x + draw_x, y + draw_y, image_xscale * 2, image_yscale * 2, spr_angle, kaioken_red_dark, 0.5);
	shader_end();
}

if draw_indicator && ssj{
	meterDraw(x, y - char_height - hud_offset - 75 + (false && phone_cheats[cheat_hide_hud]) * 40, 40, 8, ssjs[ssj].color_dark, clamp(ki_meter / ki_max, 0, 1), 1, 1, true);
}

if phone_attacking && attack == 49 && window == clamp(window, 2, 4){
	shader_start();
	var dx = x;
	var dy = y - 480;
	if window == 2{
		dy -= ease_sineOut(200, 0, window_timer, phone_window_end);
	}
	if window == 4 && image_index == 5{
		var prog = image_index - 5;
		dx += 40 * prog * spr_dir;
		dy += 40 * prog;
	}
	draw_sprite(sprite_get("super_spirit_bomb"), 0, dx, dy);
	shader_end();
}



if phone_attacking && attack == AT_NSPECIAL{
	if window == clamp(window, 4, 6){
		shader_start();
		
		if beam_clash_buddy != noone && state_timer % 60 < 30{
			textDraw(x, y + 16, "fName", c_white, 100, 1000, fa_center, 1, true, 1, "Mash Special!!", false);
		}
		
		var spr1 = sprite_get("nspecial_beam_start");
		var spr2 = sprite_get("nspecial_beam_loop");
		var spr3 = sprite_get("nspecial_beam_end");
		
		var length = beam_length;
		var strength = clamp(floor(beam_juice / 50), 0, 2);
		var frame = state_timer % 6 < 3;
		var angle = beam_angle;
		
		var x1 = x + 72 * spr_dir;
		var y1 = y - 40 + lengthdir_y(32, angle);
		
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
		
		var cur_x = x1;
		var cur_y = y1;
		
		var ld_x = lengthdir_x(32, angle);
		var ld_y = lengthdir_y(32, angle);
		
		for (var i = 0; i * 32 < length && cur_x == clamp(cur_x, 0, room_width); i++){
			draw_sprite_ext(spr2, strength * 8 + ((i + state_timer) % 8), cur_x, cur_y, 1, 1, angle, c_white, 1);
			cur_x += ld_x;
			cur_y += ld_y;
		}
		// draw_sprite_part_ext(spr2, strength, 0, 0, length / 2, 128, x1, y1 - 64, spr_dir * 2, 1, c_white, 1);
		draw_sprite_ext(spr1, strength * 2 + frame, x1, y1, 1, 1, angle, c_white, 1);
		draw_sprite_ext(spr3, strength * 2 + frame, x1 + lengthdir_x(length, angle), y1 + lengthdir_y(length, angle), 1, 1, angle, c_white, 1);
		
		shader_end();
	}
}



if phone_attacking && attack == AT_USPECIAL && window == 1{
	shader_start();
	draw_sprite_ext(sprite_get("uspecial_arrow"), (image_index != clamp(image_index, 1, 4)), x, y - 28, 1, 1, uspecial_direction_arr[max(0, array_length(uspecial_direction_arr) - 4)], c_white, 1);
	shader_end();
	// if image_index > 0 && "uspecial_dist" in self draw_sprite(sprite_get("vfx_sparkle"), image_index - 1, x + lengthdir_x(uspecial_dist + 32, uspecial_direction_arr[max(0, array_length(uspecial_direction_arr) - 4)]), y - 32 + lengthdir_y(uspecial_dist + 32, uspecial_direction_arr[max(0, array_length(uspecial_direction_arr) - 4)]));
}

if phone_attacking && attack == AT_NSPECIAL && window == clamp(window, 2, 3) && beam_juice > 30 + 60 * (ssj > 0) && abs(lengthdir_y(1, beam_angle)) > 0.1{
	shader_start();
	draw_sprite_ext(sprite_get("uspecial_arrow"), 0, x, y - 40, 1, 1, beam_angle, c_white, 1);
	shader_end();
}



#define meterDraw(center, top, width, height, color, amount, alpha, alpha2, border)

if width < 6 return;

var left = center - width * 0.5;

draw_set_alpha(alpha);

rectDraw(left, top, width, height, c_black);
rectDraw(left + 2, top + 2, width - 4, height - 4, make_color_rgb(60, 60, 60));
if border rectDraw(left + 2, top + 2, round(min(((width - 4) * amount / 2) * 2 + 2, width - 3) / 2) * 2 - 1 + floor(amount), height - 4, c_white);

draw_set_alpha(alpha * alpha2);

rectDraw(left + 2, top + 2, round(((width - 4) * amount / 2)) * 2 - 1 + floor(amount), height - 4, color);

draw_set_alpha(1);



#define rectDraw(x1, y1, width, height, color)

draw_rectangle_color(x1, y1, x1 + width, y1 + height, color, color, color, color, false);



#define textDraw(x1, y1, font, color, lineb, linew, align, scale, outline, alpha, text, array_bool)

draw_set_font(asset_get(font));
draw_set_halign(align);

if outline {
    for (i = -1; i < 2; i++) {
        for (j = -1; j < 2; j++) {
            draw_text_ext_transformed_color(x1 + i * 2, y1 + j * 2, text, lineb, linew, scale, scale, 0, c_black, c_black, c_black, c_black, alpha);
        }
    }
}

if alpha draw_text_ext_transformed_color(x1, y1, text, lineb, linew, scale, scale, 0, color, color, color, color, alpha);

if array_bool return [string_width_ext(text, lineb, linew), string_height_ext(text, lineb, linew)];
else return;