if "ki" not in self exit;

if !phone_cheats[CHEAT_TRAILER]{
	
	var hair_sprite = sprite_get("meter_hair");
	var bg_sprite = sprite_get("meter_back");
	var mask_sprite = sprite_get("meter_mask");
	var fill_sprite = sprite_get("meter_fill");
	var marker_sprite = sprite_get("meter_marker");
	var full_sprite = sprite_get("meter_full");
	
	var dx = temp_x - 24;
	var dy = temp_y - 74;
	
	shader_start();
	
	if !phone_fast draw_sprite(hair_sprite, current_sprite_set, dx, dy);
	draw_sprite(bg_sprite, ssj == SSJ_UI, dx, dy);
	
	shader_end();
	
	maskHeader();
	
	draw_sprite(mask_sprite, 0, dx, dy);
	
	maskMidder();
	
	var meter_off = floor(clamp(200 * (1 - ki_meter / ki_max), 0, 200) / 2) * 2;
	
	draw_sprite(fill_sprite, get_gameplay_time() / 4, dx - meter_off, dy);
	if !phone_fast && !(ssj && ki > ki_max - 28 && ki % 8 < 4){
		draw_sprite_ext(fill_sprite, get_gameplay_time() / 4 + 3, dx - meter_off - 20, dy, 1, 1, 0, ssj ? ssjs[ssj].color_dark : (kaioken ? kaioken_red_dark : blue_color), 1);
	}
	
	if meter_full_alpha > 0.01{
		if !phone_fast draw_sprite_ext(full_sprite, 0, dx, dy - get_gameplay_time() * 2 % 98 + 48, 1, 1, 0, c_white, meter_full_alpha);
	}
	
	maskFooter();
	
	if meter_full_alpha > 0.01{
		textDraw(dx + 204, dy + 47, "fName", get_gameplay_time() % 8 < 4 ? ssjs[SSJ_1].color_dark : c_white, 1000, 1000, fa_left, 1, 1, meter_full_alpha, "READY!", 0);
	}
	
	if kaioken{
		var marker_off = floor(clamp(200 * (1 - kaioken / ki_max), 0, 200) / 2) * 2;
		draw_sprite_ext(marker_sprite, get_gameplay_time() / 4, dx - marker_off, dy, 1, 1, 0, (get_gameplay_time() % 8 < 4) ? kaioken_red_light : kaioken_red_dark, 1);
	}
	
	if meter_full_splash_timer{
		draw_sprite(sprite_get("meter_ready_splash"), lerp(0, 4, meter_full_splash_timer / 25), dx + 10, dy - 38);
	}
	
	if funny_broken_mode{
		draw_debug_text(temp_x, temp_y - 64, "If you're seeing this in a tournament,
		something has gone VERY wrong... (goku OP mode)")
	}
	
}



muno_event_type = 5;
user_event(14);



#define maskHeader

gpu_set_blendenable(false);
gpu_set_colorwriteenable(false,false,false,true);
draw_set_alpha(0);
draw_rectangle_color(0, 0, room_width, room_height, c_white, c_white, c_white, c_white, false);
draw_set_alpha(1);



#define maskMidder

gpu_set_blendenable(true);
gpu_set_colorwriteenable(true,true,true,true);
gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
gpu_set_alphatestenable(true);



#define maskFooter

gpu_set_alphatestenable(false);
gpu_set_blendmode(bm_normal);
draw_set_alpha(1);



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