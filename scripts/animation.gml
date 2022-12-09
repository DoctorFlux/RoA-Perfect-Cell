draw_y = 0;
spr_angle = 0;

if(state == PS_DASH || state == PS_DASH_TURN || state == PS_DASH_START){
	hurtbox_spr         = asset_get("ex_guy_hurt_box");
}else{
	hurtbox_spr = sprite_get("hurt_box")
}

if ssj == SSJ_3{
	if get_gameplay_time() % max(10, random_func(0, 40, true)) == 0{
		var dx = x;
		var dy = y - 40;
		
		dx += random_func(1, 64, true) - 32;
		dy += random_func(2, 64, true) - 32;
		
		var da = random_func(3, 3, true) * 90;
		
		var h = spawn_hit_fx(dx, dy, vfx_ssj3_lightning);
		
		h.draw_angle = da;
		if dx % 2 == 0 h.depth = depth;
	}
}

var phone_window_end = floor(get_window_value(attack, window, AG_WINDOW_LENGTH) * ((get_window_value(attack, window, AG_WINDOW_HAS_WHIFFLAG) && !has_hit) ? 1.5 : 1));

switch(state){
	case PS_ATTACK_AIR:
	case PS_ATTACK_GROUND:
		switch(attack){
			case AT_USTRONG:
				if window == 3 || (window == 4 && window_timer < phone_window_end / 2){
					hud_offset = 60;
				}
				break;
			case AT_NSPECIAL:
				if window == clamp(window, 4, 7) && abs(lengthdir_y(1, beam_angle)) > abs(lengthdir_y(1, 15)){
					image_index += 6 * sign(lengthdir_y(1, beam_angle));
				}
				break;
			case AT_FSPECIAL:
				draw_y = -36;
				spr_angle = point_direction(0, 0, lengthdir_x(1, superdash_angle) * spr_dir, lengthdir_y(1, superdash_angle)) + 180 * (spr_dir == -1);
				break;
			case 49: // final smash
				if window < 3 sprite_index = sprite_get("uspecial");
				break;
		}
		break;
	case PS_PRATLAND:
		image_index = 0 + (!was_parried && state_timer > prat_land_time - 7 || was_parried && state_timer > parry_lag - 7);
		break;
}



if state == PS_SPAWN{
	var frame_dur = 5;
	var amt_frames = 12;
	var dur = frame_dur * amt_frames;
	var delay = 30;
	var s_t = state_timer - delay + player * 5;
	
	if s_t < 5{
		visible = false;
	}
	else{
		visible = true;
	}
	
	if s_t == 0{
		if taunt_down sound_play(sound_get("hey_its_me_goku"), false, noone, 1.2);
	}
	
	if (s_t < dur){
		sprite_index = sprite_get("intro");
		image_index = max(lerp(-1, amt_frames, s_t / dur), 0);
		// image_index = s_t / frame_dur * (s_t >= 0);
		if image_index < 9 draw_indicator = 0;
		
		switch(s_t / frame_dur){
			case 0:
				sound_play(asset_get("sfx_bird_nspecial"));
				break;
			case 4:
				sound_play(jump_sound);
				break;
			case 10:
				sound_play(landing_lag_sound);
				spawn_base_dust(x, y, "land");
				break;
				
		}
	}
}



for (var i = 0; i < array_length(checked_sprite_names); i++){
	if sprite_index == sprite_get(checked_sprite_names[i]){
		process_form_sprite(checked_sprite_names[i]);
		exit;
	}
}



#define process_form_sprite(sprite)

var num_frames = image_number / num_sprite_sets;
var offset = num_frames * current_sprite_set;

var img_looped = image_index % num_frames + offset;
var img_set_duration = image_index / num_sprite_sets + offset;
var img_set_number = image_index + offset;
var img_one_frame = current_sprite_set;

switch(sprite){
	case "nspecial":
	case "nspecial_air":
		image_index = img_set_number;
		break;
}



#define spawn_base_dust // supersonic
/// spawn_base_dust(x, y, name, dir = 0)
///spawn_base_dust(x, y, name, ?dir)
//This function spawns base cast dusts. Names can be found below.
var dlen; //dust_length value
var dfx; //dust_fx value
var dfg; //fg_sprite value
var dfa = 0; //draw_angle value
var dust_color = 0;
var x = argument[0], y = argument[1], name = argument[2];
var dir = argument_count > 3 ? argument[3] : 0;

switch (name) {
	default: 
	case "dash_start":dlen = 21; dfx = 3; dfg = 2626; break;
	case "dash": dlen = 16; dfx = 4; dfg = 2656; break;
	case "jump": dlen = 12; dfx = 11; dfg = 2646; break;
	case "doublejump": 
	case "djump": dlen = 21; dfx = 2; dfg = 2624; break;
	case "walk": dlen = 12; dfx = 5; dfg = 2628; break;
	case "land": dlen = 24; dfx = 0; dfg = 2620; break;
	case "walljump": dlen = 24; dfx = 0; dfg = 2629; dfa = dir != 0 ? -90*dir : -90*spr_dir; break;
	case "n_wavedash": dlen = 24; dfx = 0; dfg = 2620; dust_color = 1; break;
	case "wavedash": dlen = 16; dfx = 4; dfg = 2656; dust_color = 1; break;
}
var newdust = spawn_dust_fx(x,y,asset_get("empty_sprite"),dlen);
if newdust == noone return noone;
newdust.dust_fx = dfx; //set the fx id
if dfg != -1 newdust.fg_sprite = dfg; //set the foreground sprite
newdust.dust_color = dust_color; //set the dust color
if dir != 0 newdust.spr_dir = dir; //set the spr_dir
newdust.draw_angle = dfa;
return newdust;