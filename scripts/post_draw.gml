var phone_hud_hidden = !(get_local_setting(SET_HUD_SIZE) || get_local_setting(SET_HUD_NAMES));
var phone_attacking = state == PS_ATTACK_AIR || state == PS_ATTACK_GROUND
var phone_window_end = floor(get_window_value(attack, window, AG_WINDOW_LENGTH) * ((get_window_value(attack, window, AG_WINDOW_HAS_WHIFFLAG) && !has_hit) ? 1.5 : 1));
if !phone_hud_hidden && draw_indicator{
	var col = (phone_arrow_cooldown && !(phone_arrow_cooldown - 1 < 25 && (phone_arrow_cooldown - 1) % 10 >= 5)) ? phone_darkened_player_color : get_player_hud_color(player);
	draw_sprite_ext(sprite_get("_pho_cooldown_arrow"), 0, x - 7, y - char_height - hud_offset - 28, 1, 1, 0, col, 1);
}

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

if phone_attacking && attack == AT_NSPECIAL && window == clamp(window, 2, 3) && beam_juice > 30 + 60 * (ssj > 0) && abs(lengthdir_y(1, beam_angle)) > 0.1{
	shader_start();
	draw_sprite_ext(sprite_get("uspecial_arrow"), 0, x, y - 40, 1, 1, beam_angle, c_white, 1);
	shader_end();
}


//fspecial
if state == PS_ATTACK_GROUND && attack == AT_FSPECIAL && instance_exists(grabp){
	draw_sprite_ext(sprite_get("fspecial_vfx"), image_index, grabp.x, grabp.y - grabp.char_height/2, 2 * spr_dir, 2, 0, c_white, 1);
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