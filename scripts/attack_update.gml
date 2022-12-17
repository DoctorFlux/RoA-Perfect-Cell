if array_length(phone_dust_query){
		for(var i = 0; i < array_length(phone_dust_query); i++){
		var cur = phone_dust_query[i];
		spawn_base_dust(cur[0], cur[1], cur[2], cur[3]);
	}
	var phone_dust_query = [];
}

var phone_window_end = floor(get_window_value(attack, window, AG_WINDOW_LENGTH) * ((get_window_value(attack, window, AG_WINDOW_HAS_WHIFFLAG) && !has_hit) ? 1.5 : 1));
//B - Reversals
if (attack == AT_NSPECIAL || attack == AT_FSPECIAL || attack == AT_DSPECIAL || attack == AT_USPECIAL){
	trigger_b_reverse();
}


// voice

switch(attack){
	case AT_JAB:
		voice_window(2, VB_ATK_SMALL);
		break;
	case AT_DATTACK:
		voice_window(1, VB_ATK_SMALL);
		break;
	case AT_FTILT:
		voice_window(1, VB_ATK_SMALL);
		break;
	case AT_DTILT:
		voice_window(1, VB_ATK_SMALL);
		break;
	case AT_UTILT:
		voice_window(1, VB_ATK_SMALL);
		break;
	case AT_NAIR:
		voice_window(1, VB_ATK_SMALL);
		break;
	case AT_FAIR:
		voice_window(2, VB_ATK_MED);
		break;
	case AT_BAIR:
		voice_window(1, VB_ATK_MED);
		break;
	case AT_UAIR:
		voice_window(1, VB_ATK_BIG);
		break;
	case AT_DAIR:
		voice_window(1, VB_ATK_MED);
		break;
	case AT_FSTRONG:
		voice_window(4, VB_ATK_BIG);
		break;
	case AT_USTRONG:
		voice_window(2, VB_ATK_BIG);
		break;
	case AT_DSTRONG:
		if window == 2 && window_timer == 1{
			voice_play(VB_ATK_BIG);
		}
		break;
	case AT_USPECIAL:
		voice_window(1, VB_ATK_BIG);
		break;
	case AT_FSPECIAL:
		if window == 2 && window_timer == 1{
			voice_play(VB_ATK_BIG);
		}
		break;
	case AT_FSPECIAL_AIR:
		voice_window(1, VB_ATK_MED);
		break;
	case AT_TAUNT:
		if window_timer == 1 voice_play(VB_TAUNT);
			if ssj != 2{
				if attack_down{
					ssj = 2;
					sound_play(sfx_dbfz_charge);
				}
			}
		break;
}



switch(attack){
	case AT_NSPECIAL:
	move_cooldown[AT_NSPECIAL] = 180;
		switch(window){
			case 1: // startup
				if window_timer == 1{
					beam_juice = 60 + 60; // 30 + 60 * (...)
					beam_juice_max = 60 * 8;
					beam_length = 0; // current length of beam
					hsp = clamp(hsp, -2, 2);
					vsp = min(vsp, 3);
					has_updated_beam_kb = false;
					beam_clash_buddy = noone;
					beam_clash_timer = 0;
					beam_clash_timer_max = 120;
					beam_angle = 0;
				}
				if window_timer == phone_window_end{
					voice_play(VB_KAMEHAME);
				}
				can_fast_fall = false;
				break;
			case 2: // charge loop
				if window_timer == 1{
					sound_play(sfx_dbfz_kame_charge, false, noone, 1, 1 + beam_juice * 0.001);
				}
				if beam_juice > 180{
					shake_camera(floor((beam_juice - 180) / 30), 1);
				}
				switch((right_down - left_down) * spr_dir){
					default:
						beam_angle = 30;
						break;
					case 1:
						beam_angle = 15;
						break;
					case -1:
						beam_angle = 45;
						break;
				}
				beam_angle *= (up_down - down_down);
				beam_angle = (beam_angle + 360) % 360;
				beam_angle = point_direction(0, 0, lengthdir_x(1, beam_angle) * spr_dir, lengthdir_y(1, beam_angle));
				if special_down && beam_juice < beam_juice_max{
					beam_juice++;
				}
				else{
					window++;
					window_timer = 0;
					sound_play(sfx_dbfz_swipe_weak1);
					sound_play(asset_get("mfx_star"), false, noone, 1, 1.2);
					var hfx = spawn_hit_fx(x - 24 * spr_dir, y - 38, 305);
					hfx.depth = depth - 3;
					array_push(phone_dust_query, [x, y, "land", spr_dir]);
					
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
					
					var h = spawn_hit_fx(x1, y1, vfx_ftilt_destroy);
					h.spr_dir = 1;
					h.draw_angle = beam_angle;
					h.depth = depth - 1;
				}
				hsp = clamp(hsp, -2, 2);
				vsp = min(vsp, 3);
				can_fast_fall = false;
				
				if window_timer == phone_window_end || window_timer == phone_window_end - 3|| window_timer == phone_window_end - 6{
					spawn_base_dust(x - 20 * spr_dir + sin(window_timer + 2) * 6 * spr_dir, y, beam_juice > 300 ? "dash_start" : (beam_juice > 180 ? "dash" : "walk"));
				}
				break;
			case 3: // post-charge
				hsp = 0;
				vsp = 0;
				can_move = false;
				can_fast_fall = false;
				was_fully_charged = (beam_juice >= beam_juice_max);
				if window_timer == 13{ // 1
				phone_arrow_cooldown = 120;
					voice_play(VB_HA);
					
					// also change in nspecial.gml
					set_window_value(AT_NSPECIAL, 7, AG_WINDOW_LENGTH, 16 + floor(ease_sineIn(0, 30, beam_juice, beam_juice_max)));
				}
				if window_timer == phone_window_end{
					if funny_broken_mode || has_rune("L"){
						beam_juice = beam_juice_max;
					}
					spawn_nspecial_hitbox(1);
					sound_play(sfx_dbfz_kame_fire);
					spawn_base_dust(x, y, "dash_start");
					
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
					
					var h = spawn_hit_fx(x1, y1, vfx_nspecial_fire);
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
					spawn_base_dust(x - 20 * spr_dir + sin(window_timer + 2) * 6 * spr_dir, y, "dash");
				}
				shake_camera(1, 1);
			case 4: // beam overshoot
				if beam_clash_buddy != noone{
					beam_clash_logic();
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
								with me sound_play(sfx_dbfz_hit_broken);
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
					beam_clash_logic();
				}
				else if window_timer == phone_window_end{
		
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
					
					var h = spawn_hit_fx(x1 + lengthdir_x(beam_length - 34, beam_angle), y1 + lengthdir_y(beam_length - 34, beam_angle), vfx_ftilt_destroy);
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
			case 8: // endlag pt 2
				set_window_value(attack, window, AG_WINDOW_TYPE, 7 * free);
				break;
		}
		break;
	case AT_FSPECIAL:
		can_move = false;
		can_fast_fall = false;
		switch(window){
			case 1:
			if window_timer == 34 && !hitstop{
				for(var m = 0; m < 260; m++){
					var colp = collision_rectangle(x, y, x + m * spr_dir, y - 60, oPlayer, 1, 1);
					if instance_exists(colp){
						set_hitbox_value(AT_FSPECIAL, 3, HG_HITBOX_X, abs(x - colp.x));
						create_hitbox(AT_FSPECIAL, 3, x, y);
						break;
					}
				}
			}
			if instance_exists(grabp){
				grabp.y = lerp(grabp.y, y - 160, 0.1);
				grabp.state = PS_FLASHED;
				grabp.x = grabx;
				grabp.hsp = 0;
				grabp.vsp = 0;
			}
			break;
			case 2:
			if instance_exists(grabp){
			if window_timer < 46 && window_timer && !(window_timer % 8) && !hitstop && !instance_exists(fspec_hb){
				set_hitbox_value(AT_FSPECIAL, 1, HG_HITBOX_X, abs(grabp.x - x));
				set_hitbox_value(AT_FSPECIAL, 1, HG_HITBOX_Y, (grabp.y - grabp.char_height / 2) - y);
				fspec_hb = create_hitbox(AT_FSPECIAL, 1, x, y);
			}
			if window_timer = 60 && !hitstop && !instance_exists(fspec_hb){
				set_hitbox_value(AT_FSPECIAL, 2, HG_HITBOX_X, abs(grabp.x - x));
				set_hitbox_value(AT_FSPECIAL, 2, HG_HITBOX_Y, (grabp.y - grabp.char_height / 2) - y);
				fspec_hb = create_hitbox(AT_FSPECIAL, 2, x, y);
			}
			if window_timer < 60{
			grabp.state = PS_FLASHED;
			grabp.y = y - 160;
			grabp.x = grabx;
			grabp.hsp = 0;
			grabp.vsp = 0;
			}
		}
			break;
		}
		break;
	case AT_FSPECIAL_AIR:
	can_fast_fall = 0;
		if window == 2 && window_timer == 1{
			sound_play(sfx_dbfz_kidan_fire);
		}
		if window == 2 && window_timer == 8{
			sound_play(sfx_dbfz_kidan_fire);
		}
		if window == 2 && window_timer == 14{
			sound_play(sfx_dbfz_kidan_fire);
		}
		move_cooldown[AT_FSPECIAL_AIR] = 99999;
		break;
	
		
	case AT_USPECIAL:
	if (left_down || right_down) && window < 16 && !hitstop{
		x += (right_down? 1: -1);
		startp[@0] += (right_down? 1: -1);
	}
	if window == 1 startp[@0] = x + 40 * spr_dir;
	if !hitstop startp[@0] -= get_window_value(AT_USPECIAL, window, AG_WINDOW_HSPEED)/10 * spr_dir;
	if hsp = 0 && !hitstop startp[@0] -= get_window_value(AT_USPECIAL, window, AG_WINDOW_HSPEED)* spr_dir;
	can_move = 0;
	can_fast_fall = 0;
	if window < 15 && !(window % 2) && !hitstop create_hitbox(AT_USPECIAL, 1, x, y);
	if window == 16 && window_timer == 5 set_attack_value(AT_USPECIAL, AG_SPRITE, sprite_get("dair"));
	if window < 14{
		with oPlayer if self != other{
			if cell_usp_grab{
				if state == PS_DEAD || state == PS_RESPAWN{
					cell_usp_grab = 0;
					break;
				}
				state = PS_FLASHED;
				x = lerp(x, other.startp[0], 0.5);
				y = lerp(y, other.y, 0.5);
			}
		}
		if window == 13 && window_timer == 2 startp[@1] = y;
	}else if window < 16{
		with oPlayer if self != other{
			if cell_usp_grab{
				if state == PS_DEAD || state == PS_RESPAWN{
					cell_usp_grab = 0;
				}
				state = PS_FLASHED;
				x = lerp(x, other.startp[0] + 10 * other.spr_dir, 0.2);
				y = lerp(y, other.startp[1] + 30, 0.2);
			}
		}
	}else if window >= 16 grabp = noone;
	break;
	
	case AT_DSTRONG:
	can_move = 0;
	can_fast_fall = 0;
	if free move_cooldown[AT_DSTRONG] = 5;
	switch window{
		case 1:
		if startpos != "e" y = lerp(y, startpos - 60, 0.1);
		break;
		case 2:
		if window_timer == 1{
			for(var b = 0; b <= 400; b+=5){
				if (position_meeting(x +(dcos(260)*b - 10)*spr_dir, y - dsin(260)*b + 10, asset_get("par_block")) || position_meeting(x +(dcos(260)*b - 10)*spr_dir, y - dsin(260)*b + 10, asset_get("par_jumpthrough"))) && !array_length(b1_pos){
					b1_pos = [(dcos(260)*b)-10, -(dsin(260)*b)];
				}
				if (position_meeting(x + dcos(270)*b*spr_dir, y - dsin(270)*b + 10, asset_get("par_block")) || position_meeting(x + dcos(270)*b*spr_dir, y - dsin(270)*b + 10, asset_get("par_jumpthrough"))) && !array_length(b2_pos){
					b2_pos = [dcos(270)*b, -dsin(270)*b];
				}
				if (position_meeting(x + dcos(280)*b*spr_dir, y - dsin(280)*b + 10, asset_get("par_block")) || position_meeting(x + dcos(280)*b*spr_dir, y - dsin(280)*b + 10, asset_get("par_jumpthrough"))) && !array_length(b3_pos){
					b3_pos = [dcos(280)*b, -dsin(280)*b];
				}
				if (position_meeting(x + (dcos(285)*b + 20)*spr_dir, y - dsin(285)*b + 10, asset_get("par_block")) || position_meeting(x + (dcos(285)*b + 20)*spr_dir, y - dsin(285)*b + 10, asset_get("par_jumpthrough"))) && !array_length(b4_pos){
					b4_pos = [dcos(285)*b + 20, -dsin(285)*b];
				}
				if (position_meeting(x + (dcos(290)*b + 40)*spr_dir, y - dsin(290)*b + 10, asset_get("par_block")) || position_meeting(x + (dcos(290)*b + 40)*spr_dir, y - dsin(290)*b + 10, asset_get("par_jumpthrough"))) && !array_length(b5_pos){
					b5_pos = [dcos(290)*b + 40, -dsin(290)*b];
				}
				if (position_meeting(x + (dcos(295)*b + 60)*spr_dir, y - dsin(295)*b + 10, asset_get("par_block")) || position_meeting(x + (dcos(295)*b + 60)*spr_dir, y - dsin(295)*b + 10, asset_get("par_jumpthrough"))) && !array_length(b6_pos){
					b6_pos = [dcos(295)*b + 60, -dsin(295)*b];
				}
				if array_length(b1_pos) && array_length(b2_pos) && array_length(b3_pos) && array_length(b4_pos) && array_length(b5_pos) && array_length(b6_pos){
					break;
				}
			}
		}
		if array_length(b1_pos) && window_timer = 4 && !hitstop{
			sound_play(asset_get("sfx_mol_flash_explode"));
			set_hitbox_value(AT_DSTRONG, 2, HG_HITBOX_X, b1_pos[0]);
			set_hitbox_value(AT_DSTRONG, 2, HG_HITBOX_Y, b1_pos[1]);
			create_hitbox(AT_DSTRONG, 2, x, y);
			spawn_hit_fx(x + b1_pos[0]*spr_dir, y + b1_pos[1] -10, 270);
		}
		if array_length(b2_pos) && window_timer = 7 && !hitstop{
			sound_play(asset_get("sfx_mol_flash_explode"));
			set_hitbox_value(AT_DSTRONG, 3, HG_HITBOX_X, b2_pos[0]);
			set_hitbox_value(AT_DSTRONG, 3, HG_HITBOX_Y, b2_pos[1]);
			create_hitbox(AT_DSTRONG, 3, x, y);
			spawn_hit_fx(x + b2_pos[0]*spr_dir, y + b2_pos[1] -10, 270);
		}
		if array_length(b3_pos) && window_timer = 10 && !hitstop{
			sound_play(asset_get("sfx_mol_flash_explode"));
			set_hitbox_value(AT_DSTRONG, 4, HG_HITBOX_X, b3_pos[0]);
			set_hitbox_value(AT_DSTRONG, 4, HG_HITBOX_Y, b3_pos[1]);
			create_hitbox(AT_DSTRONG, 4, x, y);
			spawn_hit_fx(x + b3_pos[0]*spr_dir, y + b3_pos[1] -10, 270);
		}
		if array_length(b4_pos) && window_timer = 13 && !hitstop{
			sound_play(asset_get("sfx_mol_flash_explode"));
			set_hitbox_value(AT_DSTRONG, 5, HG_HITBOX_X, b4_pos[0]);
			set_hitbox_value(AT_DSTRONG, 5, HG_HITBOX_Y, b4_pos[1]);
			create_hitbox(AT_DSTRONG, 5, x, y);
			spawn_hit_fx(x + b4_pos[0]*spr_dir, y + b4_pos[1] -10, 270);
		}
		if array_length(b5_pos) && window_timer = 16 && !hitstop{
			sound_play(asset_get("sfx_mol_flash_explode"));
			set_hitbox_value(AT_DSTRONG, 6, HG_HITBOX_X, b5_pos[0]);
			set_hitbox_value(AT_DSTRONG, 6, HG_HITBOX_Y, b5_pos[1]);
			create_hitbox(AT_DSTRONG, 6, x, y);
			spawn_hit_fx(x + b5_pos[0]*spr_dir, y + b5_pos[1] -10, 270);
		}
		if array_length(b6_pos) && window_timer = 19 && !hitstop{
			sound_play(asset_get("sfx_mol_flash_explode"));
			set_hitbox_value(AT_DSTRONG, 7, HG_HITBOX_X, b6_pos[0]);
			set_hitbox_value(AT_DSTRONG, 7, HG_HITBOX_Y, b6_pos[1]);
			create_hitbox(AT_DSTRONG, 7, x, y);
			spawn_hit_fx(x + b6_pos[0]*spr_dir, y + b6_pos[1] -10, 270);
		}
		break;
	}
	break;
	case AT_DSPECIAL:
		can_move = 0;
		can_fast_fall = 0;
		vsp = 0;
		hsp = 0;
		if window == 2{
			dsp_ch++;
			if (!special_down && dsp_ch >= 5) || dsp_ch >= 60{
				sound_stop(sfx_dbfz_energyfield_chrg);
				voice_play(VB_BARRIER);
				window = 3;
				window_timer = 0;
			}
		}
		if window == 3{
			hud_offset = 30;
			if window_timer = 39{
			}
		}
		break;
}



#define check_string_for_name(player, string)

return string_count(string, string_lower(get_char_info(player, INFO_STR_NAME)))



#define voice_window(wdw, idx)

var phone_window_end = floor(get_window_value(attack, window, AG_WINDOW_LENGTH) * ((get_window_value(attack, window, AG_WINDOW_HAS_WHIFFLAG) && !has_hit) ? 1.5 : 1));

if window == wdw && window_timer == phone_window_end - 2{
	voice_play(idx);
}



#define voice_play(idx)

cur_vc = idx;
user_event(0);


#define set_pratfall(win)

if hitpause || has_hit{
	set_window_value(attack, win, AG_WINDOW_TYPE, 0);
}

if !free && get_window_value(attack, win, AG_WINDOW_TYPE) == 7 && attack != AT_NSPECIAL{
	attack_end();
	set_state(PS_PRATLAND);
}



#define beam_clash_logic()

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
			sound_play(sfx_dbfz_kame_charge, false, noone, 1, 1 + beam_juice * 0.001)
		}
	}
}



#define spawn_nspecial_hitbox(num)

if hitpause && num == 1 return;

attack_end();

var x1 = 72;
var y1 = -40 + lengthdir_y(32, beam_angle);

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

for (var i = 0; i * 32 < beam_length && i < 32 && cur_x == clamp(cur_x, phone_blastzone_l, phone_blastzone_r); i++){
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