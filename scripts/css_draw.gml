//css names
var temp_x = x;
var temp_y = y;
var alt_cur = get_player_color(player);

alt_name = [
"The perfect one",
"The perfect" + chr(10) + "lineage",
"The galactic" + chr(10) + "emperor",
"The ultimate" + chr(10) + "emperor",
"The immortal foe",
"The time warper",
"The strongest",
"The return of" + chr(10) + "the perfect one",
"The prideful" + chr(10) + "one",
"The perfect" + chr(10) + "linework",
"The perfect" + chr(10) + "graphics",
"The perfect" + chr(10) + "corruption",
];

if(alt_cur != prev_alt){
    anim_timer = 0;
    alpha_alt = 6;
}
if alpha_alt > 0 {
    alpha_alt -= 0.05;
    anim_timer++;
}
prev_alt = alt_cur;

if(alt_cur == 17) draw_sprite_ext(sprite_get("css_icons"), 2, temp_x + 174, temp_y + 108, 1, 1, 0, c_white, 1);
draw_sprite_part_ext(sprite_get("idle"), anim_timer * 0.15, 38, 8, 50, 200, temp_x + 8, temp_y - 12 + 40, 2, 2, c_white, alpha_alt);
draw_set_halign(fa_left);
textDraw(temp_x + 60, temp_y + ((alt_cur < 4 || alt_cur > 6) && alt_cur? 127: 141), "fName", make_color_rgb(get_color_profile_slot_r(alt_cur, 0), get_color_profile_slot_g(alt_cur, 0), get_color_profile_slot_b(alt_cur, 0)), 14, 400, 1, 1, alpha_alt, alt_name[alt_cur], c_black);


//button
if(!instance_exists(cursor_id)) exit;
//Button Location
if player == 0{ // player online
	var tmp_xl = 16
	var tmp_yl = 48
}else{
	if get_player_hud_color(player) == 8421504 { //if CPU offline
		var tmp_xl = 58
		var tmp_yl = 178
	}else{ //if player offline
		var tmp_xl = 74
		var tmp_yl = 178
	}

}
var tmp_bw = 30 // button width
var tmp_bh = 26
var tmp_xl1 = x+tmp_xl
var tmp_xl2 = tmp_xl1+tmp_bw
var tmp_yl1 = y+tmp_yl
var tmp_yl2 = tmp_yl1+tmp_bh
draw_set_halign(fa_left);

if get_synced_var(player) > 2 {
	set_synced_var( player, 0)
}
if("cssframes" not in self){cssframes = 0;}
if("voiced" not in self){voiced = get_synced_var(player);}
if("voicebutton" not in self){voicebutton = voiced * 3;}
if("voicebuttoncurrent" not in self){voicebuttoncurrent =  voiced * 3;}
if voicebutton == 2 || voicebutton == 5 || voicebutton == 8 {
	if cssframes == 0{
	sound_stop(sound_get("vcEN_cell123"));
	sound_stop(sound_get("vcJP_cell123"));
		if voicebutton == 2{
			sound_play(sound_get("vcEN_cell123"));
			voiced = 1;
			voicebuttoncurrent = voicebutton;
		}
		if voicebutton == 5{
			sound_play(sound_get("vcJP_cell123"));
			voiced = 2;
			voicebuttoncurrent = voicebutton;
		}
		if voicebutton == 8{
			voiced = 0;
			voicebuttoncurrent = voicebutton;
		}

	}
	cssframes++;
	if cssframes == 5{
		cssframes = 0;
		voicebutton += 1;
		if voicebutton > 8 {
			voicebutton -= 9;
		}
		voicebuttoncurrent = voicebutton;
	}
}
var x_temp = get_instance_x(cursor_id);
var y_temp = get_instance_y(cursor_id);
if (x_temp>tmp_xl1 && x_temp<tmp_xl2 && y_temp>tmp_yl1 && y_temp<tmp_yl2){ 	
	if voicebutton == voicebuttoncurrent {
		if voicebutton == 0 || voicebutton == 3 || voicebutton == 6 {
			voicebutton += 1;
		}
	}
}else{
	if voicebutton == 1 || voicebutton == 4 || voicebutton == 7 {
		voicebutton -= 1;
	}
	voicebuttoncurrent = voicebutton;
}
if voicebutton == 1 || voicebutton == 4 || voicebutton == 7 {
	if menu_a_pressed{
		voicebutton += 1;
		voicebuttoncurrent = voicebutton;
	}	
}
set_synced_var( player, voiced)
draw_sprite_ext(sprite_get("cssvoice_button"), 0+voicebutton, x + tmp_xl, y + tmp_yl, 1, 1, 0, c_white, 1);
#define textDraw(x, y, font, color, lineb, linew, scale, outline, alpha, string, outline_c)

draw_set_font(asset_get(argument[2]));

if argument[7]{ //outline. doesn't work lol //now it does, you're welcome
    draw_text_ext_transformed_color(argument[0] + argument[6]*2, argument[1], argument[9], argument[4], argument[5], argument[6], argument[6], 0, argument[10], argument[10], argument[10],argument[10], argument[8]);
    draw_text_ext_transformed_color(argument[0] + argument[6]*2, argument[1] + argument[6]*2, argument[9], argument[4], argument[5], argument[6], argument[6], 0, argument[10], argument[10], argument[10],argument[10], argument[8]);
    draw_text_ext_transformed_color(argument[0] + argument[6]*2, argument[1] - argument[6]*2, argument[9], argument[4], argument[5], argument[6], argument[6], 0, argument[10], argument[10], argument[10],argument[10], argument[8]);
    draw_text_ext_transformed_color(argument[0], argument[1] - argument[6]*2, argument[9], argument[4], argument[5], argument[6], argument[6], 0, argument[10], argument[10], argument[10],argument[10], argument[8]);
    draw_text_ext_transformed_color(argument[0] - argument[6]*2, argument[1] - argument[6]*2, argument[9], argument[4], argument[5], argument[6], argument[6], 0, argument[10], argument[10], argument[10],argument[10], argument[8]);
    draw_text_ext_transformed_color(argument[0] - argument[6]*2, argument[1], argument[9], argument[4], argument[5], argument[6], argument[6], 0, argument[10], argument[10], argument[10],argument[10], argument[8]);
    draw_text_ext_transformed_color(argument[0] - argument[6]*2, argument[1] + argument[6]*2, argument[9], argument[4], argument[5], argument[6], argument[6], 0, argument[10], argument[10], argument[10],argument[10], argument[8]);
    draw_text_ext_transformed_color(argument[0], argument[1] +  argument[6]*2, argument[9], argument[4], argument[5], argument[6], argument[6], 0, argument[10], argument[10], argument[10],argument[10], argument[8]);
}
draw_text_ext_transformed_color(argument[0], argument[1], argument[9], argument[4], argument[5], argument[6], argument[6], 0, argument[3], argument[3], argument[3], argument[3], argument[8]);
