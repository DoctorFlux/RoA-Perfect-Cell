switch(state){
	case PS_WALK:
		if("walkingsound" not in self){walkingsound = 0;}
		walkingsound += 1;
		if walkingsound == 7 || walkingsound == 30 {
			sound_play(sfx_walk);
		}
		if walkingsound == 46{
			walkingsound = 0;
		}
		break;
	case PS_IDLE:
	case PS_CROUCH:
	case PS_JUMPSQUAT:
	case PS_WALK_TURN:
	case PS_DASH_START:
	case PS_ROLL_FORWARD:
		walkingsound = 0;
		break;
}
var phone_hud_hidden = !(get_local_setting(SET_HUD_SIZE) || get_local_setting(SET_HUD_NAMES));
var phone_attacking = state == PS_ATTACK_AIR || state == PS_ATTACK_GROUND
var phone_window_end = floor(get_window_value(attack, window, AG_WINDOW_LENGTH) * ((get_window_value(attack, window, AG_WINDOW_HAS_WHIFFLAG) && !has_hit) ? 1.5 : 1));

init_shader();

//misc code bits
if move_cooldown[AT_DSTRONG] && free move_cooldown[AT_DSTRONG] = 5;

if phone_arrow_cooldown > 0 phone_arrow_cooldown--;

if get_player_color(player) == 0 {
	set_ui_element(UI_HUD_ICON, sprite_get("hud_default_hud"));
	set_ui_element(UI_HUDHURT_ICON, sprite_get("hud_default_hurt"));
	set_ui_element(UI_OFFSCREEN, sprite_get("hud_default_offscreen"));
	set_ui_element(UI_CHARSELECT, sprite_get("hud_default_charselect"));
	set_ui_element(UI_WIN_SIDEBAR, sprite_get("hud_default_result_small"));
	set_ui_element(UI_WIN_PORTRAIT, sprite_get("hud_default_portrait"));
}else{
	set_ui_element(UI_HUD_ICON, sprite_get("hud_alt1_hud"));
	set_ui_element(UI_HUDHURT_ICON, sprite_get("hud_alt1_hurt"));
	set_ui_element(UI_OFFSCREEN, sprite_get("hud_alt1_offscreen"));
	set_ui_element(UI_CHARSELECT, sprite_get("hud_alt1_charselect"));
	set_ui_element(UI_WIN_SIDEBAR, sprite_get("hud_alt1_result_small"));
	set_ui_element(UI_WIN_PORTRAIT, sprite_get("hud_alt1_portrait"));
}

if move_cooldown[AT_FSPECIAL_AIR] && !free move_cooldown[AT_FSPECIAL_AIR] = 0;

if funny_broken_mode{
	ki = ki_max;
	if !ssj spawn_form_aura();
	ssj = SSJ_UI;
	invincible = true;
	with pHitBox if player != other.player && place_meeting(x, y, other){
		var owner_id = player_id;
		with other{
			if x != owner_id.x{
				spr_dir = sign(owner_id.x - x);
			}
			attack_end();
			set_attack(AT_EXTRA_1);
		}
	}
}



if (funny_broken_mode || has_rune("J")) && ssj{
	switch(state){
		case PS_ATTACK_AIR:
		case PS_ATTACK_GROUND:
			var valid = false;
			switch(attack){
				case AT_NAIR:
				case AT_FAIR:
				case AT_BAIR:
				case AT_UAIR:
				case AT_DAIR:
				case AT_NSPECIAL:
					valid = true;
			}
			if !valid break;
		case PS_IDLE_AIR:
		case PS_FIRST_JUMP:
		case PS_DOUBLE_JUMP:
			if shield_down || true{
				if !(phone_attacking && attack == AT_NSPECIAL && window == clamp(window, 4, 6)) vsp -= gravity_speed;
				
				if (!joy_pad_idle){
					hsp += lengthdir_x(1, joy_dir);
					vsp += lengthdir_y(1, joy_dir);
				} else {
					hsp *= .6;
					vsp *= .6;
				}
				var fly_dir = point_direction(0, 0, hsp, vsp);
				var fly_dist = point_distance(0, 0, hsp, vsp);
				var max_speed = 8;
				if (fly_dist > max_speed){
					hsp = lengthdir_x(max_speed, fly_dir);
					vsp = lengthdir_y(max_speed, fly_dir);
				}
			}
			break;
	}
}



if (state == PS_ROLL_BACKWARD || state == PS_ROLL_FORWARD) && state_timer == 0 || (state == PS_TECH_BACKWARD || state == PS_TECH_FORWARD) && state_timer == 0{
	var h = spawn_hit_fx(x, y, ssjs[ssj].hairstyle == 1 ? vfx_afterimage_ssj1 : (ssjs[ssj].hairstyle == 2 ? vfx_afterimage_ssj3 : vfx_afterimage));
	h.spr_dir = -spr_dir;
	h.goku_id = self;
}

else{
	old_spr_dir = spr_dir;
}



with asset_get("hit_fx_obj") if "goku_id" in self && goku_id == other{
	x += hsp;
	var fric = 0.3;
	if abs(hsp) > fric hsp -= fric * sign(hsp);
	else hsp = 0;
}



doing_goku_beam = (phone_attacking && attack == AT_NSPECIAL && window == clamp(window, 4, 6));

if aerial_pratfall_timer aerial_pratfall_timer--;




ki_meter = lerp(ki_meter, ki, 0.5);
if abs(ki_meter - ki) < 1{
	ki_meter = ki;
}

if ssj{
	if !has_rune("N") ki = max(ki - 1, 0);
	if ki == 0{
		ssj = SSJ_NONE;
	}
	
	move_cooldown[AT_FSPECIAL] = min(move_cooldown[AT_FSPECIAL], 30);
	move_cooldown[AT_USPECIAL] = min(move_cooldown[AT_USPECIAL], 30);
	phone_arrow_cooldown = min(phone_arrow_cooldown, 30);
}

else{
	if has_rune("N") ki = min(ki + 2, ki_max);
}




if was_ssj != ssj{
	if !ssj sound_play(sfx_dbfz_teleport_end)
	init_shader();
	if "orig_dash_speed" not in self{
		orig_dash_speed = dash_speed;
		orig_initial_dash_speed = initial_dash_speed;
		orig_knockback_adj = knockback_adj;
	}
	dash_speed = orig_dash_speed + 1 * (ssj > 0);
	initial_dash_speed = orig_initial_dash_speed + 1 * (ssj > 0);
	knockback_adj = orig_knockback_adj + 0.2 * (ssj > 0);
	current_sprite_set = ssjs[ssj].hairstyle;
	
	// set_window_value(AT_DTILT, 1, AG_WINDOW_LENGTH, 6 + 2 * (ssj > 0));
	// set_window_value(AT_DTILT, 1, AG_WINDOW_SFX_FRAME, 0 + 2 * (ssj > 0));
}

was_ssj = ssj;



if meter_full_splash_timer{
	meter_full_splash_timer++;
	if meter_full_splash_timer > 30{
		meter_full_splash_timer = 0;
	}
}

if meter_full_alpha < 0.01 && ki >= ki_max && !meter_full_splash_timer{
	meter_full_splash_timer = 1;
	sound_play(asset_get("mfx_star"));
	voice_play(VB_METER_FULL);
}

meter_full_alpha = lerp(meter_full_alpha, ki >= ki_max, 0.3);



if swallowed {
	swallowed = 0
	var ability_spr = sprite_get("kirby");
	var kirby_icon = sprite_get("kirby_icon");
	
	with enemykirby {
		has_goku_beam = true;
		doing_goku_beam = false;
		beam_newest_hbox = noone;
		
		newicon = kirby_icon;
		goku_ability_id = other;
		
		set_attack_value(AT_EXTRA_3, AG_CATEGORY, 2);
		set_attack_value(AT_EXTRA_3, AG_SPRITE, ability_spr);
		set_attack_value(AT_EXTRA_3, AG_NUM_WINDOWS, 7);
		set_attack_value(AT_EXTRA_3, AG_HAS_LANDING_LAG, 4);
		set_attack_value(AT_EXTRA_3, AG_OFF_LEDGE, 1);
		set_attack_value(AT_EXTRA_3, AG_HURTBOX_SPRITE, hurtbox_spr);
		
		// startup
		set_window_value(AT_EXTRA_3, 1, AG_WINDOW_LENGTH, 10);
		set_window_value(AT_EXTRA_3, 1, AG_WINDOW_ANIM_FRAMES, 2);
		
		// charge loop
		set_window_value(AT_EXTRA_3, 2, AG_WINDOW_TYPE, 9);
		set_window_value(AT_EXTRA_3, 2, AG_WINDOW_LENGTH, 12);
		set_window_value(AT_EXTRA_3, 2, AG_WINDOW_ANIM_FRAMES, 3);
		set_window_value(AT_EXTRA_3, 2, AG_WINDOW_ANIM_FRAME_START, 2);
		
		// post-charge
		set_window_value(AT_EXTRA_3, 3, AG_WINDOW_LENGTH, 4);
		set_window_value(AT_EXTRA_3, 3, AG_WINDOW_ANIM_FRAMES, 1);
		set_window_value(AT_EXTRA_3, 3, AG_WINDOW_ANIM_FRAME_START, 5);
		
		// beam overshoot
		set_window_value(AT_EXTRA_3, 4, AG_WINDOW_LENGTH, 3);
		set_window_value(AT_EXTRA_3, 4, AG_WINDOW_ANIM_FRAMES, 1);
		set_window_value(AT_EXTRA_3, 4, AG_WINDOW_ANIM_FRAME_START, 6);
		
		// beam loop
		set_window_value(AT_EXTRA_3, 5, AG_WINDOW_TYPE, 9);
		set_window_value(AT_EXTRA_3, 5, AG_WINDOW_LENGTH, 12);
		set_window_value(AT_EXTRA_3, 5, AG_WINDOW_ANIM_FRAMES, 3);
		set_window_value(AT_EXTRA_3, 5, AG_WINDOW_ANIM_FRAME_START, 7);
		
		// last hit
		set_window_value(AT_EXTRA_3, 6, AG_WINDOW_LENGTH, 5);
		set_window_value(AT_EXTRA_3, 6, AG_WINDOW_ANIM_FRAMES, 1);
		set_window_value(AT_EXTRA_3, 6, AG_WINDOW_ANIM_FRAME_START, 7);
		
		// endlag
		set_window_value(AT_EXTRA_3, 7, AG_WINDOW_LENGTH, 16);
		set_window_value(AT_EXTRA_3, 7, AG_WINDOW_ANIM_FRAMES, 2);
		set_window_value(AT_EXTRA_3, 7, AG_WINDOW_ANIM_FRAME_START, 10);
		
		set_num_hitboxes(AT_EXTRA_3, 0);
		
		set_hitbox_value(AT_EXTRA_3, 1, HG_HITBOX_TYPE, 1);
		set_hitbox_value(AT_EXTRA_3, 1, HG_WINDOW, 4);
		set_hitbox_value(AT_EXTRA_3, 1, HG_LIFETIME, 1);
		set_hitbox_value(AT_EXTRA_3, 1, HG_WIDTH, 64);
		set_hitbox_value(AT_EXTRA_3, 1, HG_HEIGHT, 64);
		set_hitbox_value(AT_EXTRA_3, 1, HG_SHAPE, 2);
		set_hitbox_value(AT_EXTRA_3, 1, HG_PRIORITY, 3);
		set_hitbox_value(AT_EXTRA_3, 1, HG_DAMAGE, 1);
		set_hitbox_value(AT_EXTRA_3, 1, HG_ANGLE, 70);
		set_hitbox_value(AT_EXTRA_3, 1, HG_BASE_KNOCKBACK, 1);
		set_hitbox_value(AT_EXTRA_3, 1, HG_KNOCKBACK_SCALING, 0);
		set_hitbox_value(AT_EXTRA_3, 1, HG_BASE_HITPAUSE, 3);
		set_hitbox_value(AT_EXTRA_3, 1, HG_HITPAUSE_SCALING, 0);
		set_hitbox_value(AT_EXTRA_3, 1, HG_SDI_MULTIPLIER, 0.00001);
		set_hitbox_value(AT_EXTRA_3, 1, HG_HIT_SFX, other.sfx_dbfz_hit_weak);
		set_hitbox_value(AT_EXTRA_3, 1, HG_EXTENDED_PARRY_STUN, 1);
		
		set_hitbox_value(AT_EXTRA_3, 2, HG_HITBOX_TYPE, 1); // also change these stats in hit_player.gml
		set_hitbox_value(AT_EXTRA_3, 2, HG_WINDOW, 6);
		set_hitbox_value(AT_EXTRA_3, 2, HG_LIFETIME, 5);
		set_hitbox_value(AT_EXTRA_3, 2, HG_WIDTH, 64);
		set_hitbox_value(AT_EXTRA_3, 2, HG_HEIGHT, 64);
		set_hitbox_value(AT_EXTRA_3, 2, HG_SHAPE, 2);
		set_hitbox_value(AT_EXTRA_3, 2, HG_PRIORITY, 3);
		set_hitbox_value(AT_EXTRA_3, 2, HG_DAMAGE, 4);
		set_hitbox_value(AT_EXTRA_3, 2, HG_ANGLE, 45);
		set_hitbox_value(AT_EXTRA_3, 2, HG_BASE_KNOCKBACK, 7);
		set_hitbox_value(AT_EXTRA_3, 2, HG_KNOCKBACK_SCALING, 0.8);
		set_hitbox_value(AT_EXTRA_3, 2, HG_BASE_HITPAUSE, 9);
		set_hitbox_value(AT_EXTRA_3, 2, HG_HITPAUSE_SCALING, 0.5);
		set_hitbox_value(AT_EXTRA_3, 2, HG_VISUAL_EFFECT, 304);
		set_hitbox_value(AT_EXTRA_3, 2, HG_HIT_LOCKOUT, 5);
		set_hitbox_value(AT_EXTRA_3, 2, HG_HIT_SFX, other.sfx_dbfz_hit_jab3);
		set_hitbox_value(AT_EXTRA_3, 2, HG_EXTENDED_PARRY_STUN, 1);
	}
}

with oPlayer if "goku_ability_id" in self && goku_ability_id == other doing_goku_beam = ((state == PS_ATTACK_AIR || state == PS_ATTACK_GROUND) && attack == AT_EXTRA_3 && window == clamp(window, 4, 6));
with oPlayer if "goku_ability_id" in self && goku_ability_id == other && (state == PS_ATTACK_AIR || state == PS_ATTACK_GROUND) && attack == AT_EXTRA_3{
	var phone_window_end = get_window_value(attack, window, AG_WINDOW_LENGTH);
	move_cooldown[attack] = 120;
	var goku = other;
	
	switch(window){
		case 1: // startup
			if window_timer == 1{
				beam_juice = 30; // amt of energy "left" in the beam
				beam_juice_max = 60 * 8;
				beam_length = 0; // current length of beam
				hsp = clamp(hsp, -2, 2);
				vsp = min(vsp, 3);
				has_updated_beam_kb = false;
				beam_clash_buddy = noone;
				beam_clash_timer = 0;
				beam_clash_timer_max = 120;
			}
			can_fast_fall = false;
			break;
		case 2: // charge loop
			if window_timer == 1{
				sound_play(other.sfx_dbfz_kame_charge, false, noone, 1, 1 + beam_juice * 0.001);
			}
			if beam_juice > 180{
				shake_camera(floor((beam_juice - 180) / 30), 1);
			}
			beam_angle = point_direction(0, 0, lengthdir_x(1, 0) * spr_dir, lengthdir_y(1, 0));
			if special_down && beam_juice < beam_juice_max{
				beam_juice++;
			}
			else{
				window++;
				window_timer = 0;
			}
			hsp = clamp(hsp, -2, 2);
			vsp = min(vsp, 3);
			can_fast_fall = false;
			
			if window_timer == phone_window_end || window_timer == phone_window_end - 3|| window_timer == phone_window_end - 6{
				spawn_base_dust(x - 20 * spr_dir + sin(window_timer + 2) * 6 * spr_dir, y, beam_juice > 300 ? "dash_start" : (beam_juice > 180 ? "dash" : "walk"));
			}
			break;
		case 3: // post-charge
			hsp *= 0.75;
			vsp *= 0.75;
			can_move = false;
			can_fast_fall = false;
			was_fully_charged = (beam_juice >= beam_juice_max);
			if window_timer == 1{
				spawn_nspecial_hitbox(1);
				sound_play(other.sfx_dbfz_kame_fire);
				spawn_base_dust(x, y, "dash_start");
				
				var x1 = x + 72 * spr_dir;
				var y1 = y - 26 + lengthdir_y(32, beam_angle);
				
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
				
				var h;
				with other{
					h = spawn_hit_fx(x1, y1, vfx_nspecial_fire);
				}
				h.spr_dir = 1;
				h.draw_angle = beam_angle;
				h.depth = depth - 1;
			}
			break;
		case 5: // beam loop
			if beam_juice <= 0{
				window++;
				window_timer = 0;
				spawn_nspecial_hitbox(2);
			}
			hsp = 0;
			vsp = 0;
			can_move = false;
			can_fast_fall = false;
			
			if window_timer % 2{
				spawn_base_dust(x - 26 * spr_dir + sin(window_timer + 2) * 6 * spr_dir, y, "dash");
			}
			shake_camera(1, 1);
		case 4: // beam overshoot
			if beam_clash_buddy != noone{
				beam_clash_logic(goku);
			}
			else if !was_fully_charged && !hitpause && (was_parried || has_hit || place_meeting(x + lengthdir_x(beam_length + 32, beam_angle), y + lengthdir_y(beam_length, beam_angle), asset_get("par_block"))){
				if beam_juice > 0{
					beam_juice -= 10;
				}
			}
			else if !hitpause{
				if beam_juice > 0{
					beam_length += 32 + 64 * was_fully_charged;
					beam_juice -= 10;
				}
			}
			if window != 6{
				spawn_nspecial_hitbox(1);
				
				if beam_clash_buddy == noone{
					var me = self;
					with oPlayer if "has_goku_beam" in self && doing_goku_beam && abs((me.beam_angle + 180) % 360 - beam_angle % 360) < 5 && instance_exists(beam_newest_hbox){
						var him = self;
						with beam_newest_hbox if distance_to_object(me.beam_newest_hbox) < (32 + 64 * (me.was_fully_charged || him.was_fully_charged)){
							me.beam_clash_buddy = him;
							him.beam_clash_buddy = me;
							with me sound_play(goku.sfx_dbfz_hit_broken);
							me.beam_juice = max(me.beam_juice, 30);
							him.beam_juice = max(him.beam_juice, 30);
							me.beam_clash_timer_max = max(me.beam_clash_timer_max, him.beam_clash_timer_max);
							him.beam_clash_timer_max = max(me.beam_clash_timer_max, him.beam_clash_timer_max);
						}
					}
				}
			}
			
			hsp = 0;
			vsp = 0;
			can_move = false;
			can_fast_fall = false;
			shake_camera(4, 1);
			break;
		case 6: // last hit
			if beam_clash_buddy != noone{
				beam_clash_logic(goku);
			}
			else if window_timer == phone_window_end{
	
				var x1 = x + 72 * spr_dir;
				var y1 = y - 20 + lengthdir_y(32, beam_angle);
				
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
				
				var h;
				with other{
					h = spawn_hit_fx(x1 + lengthdir_x(other.beam_length - 34, other.beam_angle), y1 + lengthdir_y(other.beam_length - 34, other.beam_angle), vfx_ftilt_destroy);
				}
				h.spr_dir = 1;
				h.draw_angle = beam_angle;
				h.depth = depth;
			}
			hsp = 0;
			vsp = 0;
			can_move = false;
			can_fast_fall = false;
			break;
		case 7: // endlag
			hsp = 0;
			vsp = 0;
			can_move = false;
			can_fast_fall = false;
			break;
	}
}

with oPlayer if self != other{
	if cell_grab_t cell_grab_t--;
	else cell_usp_grab = 0;
}


#define voice_play(idx)

cur_vc = idx;
user_event(0);



#define beam_clash_logic(goku)

if !beam_clash_buddy.doing_goku_beam{
	beam_clash_buddy.beam_clash_buddy = noone;
	beam_clash_buddy = noone;
}
else{
	if beam_clash_timer >= beam_clash_timer_max{
		var winner = noone;
		if beam_length > beam_clash_buddy.beam_length{
			winner = self;
		}
		if beam_length < beam_clash_buddy.beam_length{
			winner = beam_clash_buddy;
		}
		if winner == self{
			window = 5;
			window_timer = 0;
		}
		else{
			beam_juice = 0;
		}
		if winner == beam_clash_buddy{
			
		}
		else{
			beam_clash_buddy.beam_juice = 0;
		}
	}
	else{
		beam_clash_timer++;
		if special_pressed{
			clear_button_buffer(PC_SPECIAL_PRESSED);
			beam_length += 32;
			beam_clash_buddy.beam_length -= 32;
			beam_juice = min(beam_juice + 20, beam_juice_max);
			beam_clash_buddy.beam_juice = max(beam_clash_buddy.beam_juice - 10, 10);
			sound_play(goku.sfx_dbfz_kame_charge, false, noone, 1, 1 + beam_juice * 0.001)
		}
	}
}



#define spawn_nspecial_hitbox(num)

if hitpause && num == 1 return;

attack_end();

var x1 = 72;
var y1 = -26 + lengthdir_y(32, beam_angle);

switch((abs(lengthdir_y(1, beam_angle)) > abs(lengthdir_y(1, 15))) * sign(lengthdir_y(1, beam_angle))){
	case 1: // down
		x1 = 74;
		y1 = -6;
		break;
	case -1: // up
		x1 = 60;
		y1 = -72;
		break;
}

// x1 += lengthdir_x(beam_length - 32 * !has_hit, beam_angle) * spr_dir;
// y1 += lengthdir_y(beam_length - 32 * !has_hit, beam_angle);

var cur_x = x1;
var cur_y = y1;

set_hitbox_value(attack, num, HG_WIDTH, 64 + 16 * has_hit);
set_hitbox_value(attack, num, HG_HEIGHT, 64 + 16 * has_hit);

var ld_x = lengthdir_x(32, beam_angle) * spr_dir;
var ld_y = lengthdir_y(32, beam_angle);

for (var i = 0; i * 32 < beam_length && i < 32 && cur_x == clamp(cur_x, -64, room_width + 64); i++){
	if i % 3 == 0 || (i+1) * 32 >= beam_length{
		if (i+1) * 32 >= beam_length{
			set_hitbox_value(attack, num, HG_WIDTH, 64 + 64 * has_hit);
			set_hitbox_value(attack, num, HG_HEIGHT, 64 + 64 * has_hit);
		}
		beam_newest_hbox = create_hitbox(attack, num, round(x + cur_x * spr_dir), round(y + cur_y));
		beam_newest_hbox.x_pos = round(cur_x * spr_dir);
		beam_newest_hbox.y_pos = round(cur_y);
	}
	cur_x += ld_x;
	cur_y += ld_y;
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



#define spawn_form_aura

if ssj return spawn_hit_fx(x, y, vfx_ssj_start);
if kaioken return spawn_hit_fx(x, y, vfx_kaioken_start);