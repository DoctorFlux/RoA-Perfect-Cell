//B - Reversals
if (attack == AT_NSPECIAL || attack == AT_FSPECIAL || attack == AT_DSPECIAL || attack == AT_USPECIAL){
	trigger_b_reverse();
}



if state_timer > 1{ // don't run out mid-attack
	if kaioken ki = min(ki, kaioken - 1);
	if ssj ki = max(ki, 2);
}



// voice

switch(attack){
	case AT_JAB:
		voice_window(1, VB_ATK_SMALL);
		voice_window(4, VB_ATK_SMALL);
		voice_window(7, VB_ATK_MED);
		break;
	case AT_UTILT:
	case AT_NAIR:
		voice_window(1, VB_ATK_SMALL);
		voice_window(4, VB_ATK_MED);
		break;
	case AT_FTILT:
	case AT_DTILT:
		voice_window(1, VB_ATK_SMALL);
		break;
	case AT_DATTACK:
	case AT_FAIR:
	case AT_BAIR:
	case AT_UAIR:
	case AT_DAIR:
		voice_window(1, VB_ATK_MED);
		break;
	case AT_FSTRONG:
	case AT_USTRONG:
	case AT_DSTRONG:
		voice_window(2, VB_ATK_BIG);
		break;
	case AT_TAUNT:
		if window == 1 && window_timer == 1{
			if funny_broken_mode || has_rune("O"){
				// sound_stop(voice_playing_sound);
				voice_playing_sound = sound_play(sound_get("hey_its_me_goku"), false, noone, 1.2);
			}
			else{
				voice_play(VB_TAUNT);
			}
		}
}



switch(attack){
	case AT_JAB:
	case AT_FTILT:
	case AT_UTILT:
	case AT_DTILT:
		if (window == 1 || (attack == AT_UTILT || attack == AT_JAB) && (window == 4 || window == 7)) && window_timer == phone_window_end{
			spawn_base_dust(x - 16 * spr_dir, y, "dash");
		}
		break;
	case AT_DATTACK:
		if window == 1 && window_timer == phone_window_end{
			spawn_base_dust(x + 64 * spr_dir, y, "dash_start");
		}
		break;
	case AT_FSTRONG:
		if window == 2 && window_timer == phone_window_end{
			spawn_base_dust(x, y, "dash_start");
			var h = spawn_form_aura();
			h.x += 32 * spr_dir;
		}
		break;
	case AT_USTRONG:
		if window == 2 && window_timer == 1{
			spawn_base_dust(x, y, "dash_start");
		}
		if window == 2 && window_timer == phone_window_end{
			spawn_form_aura();
		}
		break;
	case AT_DSTRONG:
		if window == 2 && window_timer == phone_window_end{
			spawn_base_dust(x, y, "land");
			spawn_form_aura();
		}
		break;
}



switch(attack){
	case AT_NAIR:
		set_pratfall(6);
	case AT_FAIR:
	case AT_BAIR:
	case AT_UAIR:
		set_pratfall(3);
		break;
	case AT_DAIR:
		set_pratfall(4);
		break;
}



switch attack{
	case AT_JAB:
		if window == 1 && window_timer == phone_window_end{
			was_parried = false;
		}
		if (funny_broken_mode || has_rune("D")) && window == 6{
			can_jump = !was_parried;
		}
		break;
		
	case AT_FTILT:
		if window == 1 && window_timer == 8{
			hsp = 6 * spr_dir;
		}
		if window == 2{
			hsp *= 0.8;
		}
		if window == 3 phone_arrow_cooldown = max(phone_arrow_cooldown, 30);
		break;
	
	case AT_UTILT:
		if window == 1{
			set_attack_value(attack, AG_NUM_WINDOWS, 3);
		}
		if window == 3{
			if (attack_pressed || up_stick_pressed) && !jump_pressed{
				set_attack_value(attack, AG_NUM_WINDOWS, 6);
				window = 4;
				window_timer = 0;
			}
		}
		if window == 4 && window_timer == phone_window_end{
			var pos_x = x + 80 * spr_dir;
			pos_x += (right_down - left_down) * 32
			
			create_hitbox(attack, 3, pos_x, y - 32);
			spawn_hit_fx(pos_x, y, vfx_utilt_spawn);
			
			sound_play(sfx_dbfz_kidan_fire);
		}
		break;
	
	case AT_DTILT:
		if window == 1{
			if window_timer == 1{
				hsp += 2 * spr_dir;
			}
			if window_timer == phone_window_end{
				hsp = 15 * spr_dir;
				if funny_broken_mode || has_rune("C"){
					hsp = 30 * spr_dir;
				}
			}
		}
		
		if window == 3{
			hsp = clamp(hsp, -10, 10)
			hsp *= 0.9;
		}
		
		if funny_broken_mode || has_rune("C"){
			if window == 1 {
				has_jumped = 0;
			}
			
			if has_hit && (jump_pressed || (tap_jump_pressed && can_tap_jump())){
				has_jumped = true;
			}
			
			if has_jumped && !hitpause && !was_parried {
				attack_end();
				destroy_hitboxes();
				set_state(PS_JUMPSQUAT);
				hsp = clamp(hsp, -dash_speed, dash_speed);
			}
		}
		
		break;
	
	case AT_DATTACK:
		if window == 1{
			if window_timer == phone_window_end{
				hsp = 48 * spr_dir; // 64
			}
			if window_timer == phone_window_end - 4{
				sound_play(sfx_dbfz_elbow);
			}
		}
		
		if window == 2{
			hsp = clamp(hsp, -15, 15);
		}
		
		if window > 2{
			hsp = clamp(hsp, -10, 10);
			hsp *= 0.9;
		}
		
		vsp = 0;
		
		if window == 4 && free && window_timer >= phone_window_end * 0.5{
			window_timer = phone_window_end;
		}
		
		break;
	
	case AT_NAIR:
		if window < 4 && aerial_pratfall_timer && !has_hit{
			aerial_pratfall_timer = 5;
		}
		if window == 1{
			set_attack_value(attack, AG_NUM_WINDOWS, 3);
		}
		if (window == 3 || window == 6 && (funny_broken_mode || has_rune("D"))) && (window_timer >= phone_window_end * 0.5 || has_hit){
			if !jump_pressed && !special_pressed && !shield_pressed{
				if attack_pressed && joy_pad_idle{
					set_attack_value(attack, AG_NUM_WINDOWS, 6);
					window++;
					window_timer = 0;
				}
				else{
					can_attack = true;
				}
			}
		}
		if window == 7{
			window = 1;
			attack_end();
		}
	
		if (window == 1) nair_check = false;
		if hitpause{
			if !nair_check{
				if old_vsp == fast_fall old_vsp += 0.01;
				nair_check = true;
			}
			if old_vsp != fast_fall{
				old_vsp = min(old_vsp, (window > 3 ? -6 : -4));
				if down_pressed{
					do_a_fast_fall = true;
					old_vsp = fast_fall;
				}
			}
		}
		break;
	
	case AT_DAIR:
		if funny_broken_mode || has_rune("E") fall_through = true;
		if window == 1{
			hsp *= 0.6;
			vsp *= 0.6;
		}
		if window == 1 && window_timer == phone_window_end{
			hsp = 7 * spr_dir;
			vsp = 15;
			var h = spawn_hit_fx(x + 16 * spr_dir, y - 0, vfx_utilt_spawn);
			h.spr_dir = 1;
			h.draw_angle = 24 * spr_dir;
		}
		if window == clamp(window, 2, 3){
			can_move = false;
			can_fast_fall = false;
		}
		
		if window > 1{
			can_wall_jump = true;
		}
		break;
	
	case AT_FSTRONG:
		if window == 2{
			hsp += 7 * spr_dir;
			if window_timer == 1{
				sound_play(asset_get("sfx_ori_charged_flame_release"));
			}
		}
		if window == 3{
			hsp = 0;
		}
		break;
	
	case AT_USTRONG:
		can_move = false;
		can_fast_fall = false;
		if window == 2{
			hsp += 4 * spr_dir;
			if window_timer == 3{
				sound_play(asset_get("sfx_ori_charged_flame_release"));
			}
			if window_timer == phone_window_end{
				free = true;
				vsp = -10 - (strong_charge / 5);
				if funny_broken_mode || has_rune("F") vsp -= 30;
				spawn_base_dust(x, y, "jump");
				hsp = 4 * spr_dir;
			}
		}
		if window == 4{
			vsp -= gravity_speed * 0.5;
			if window_timer == 1{
				vsp = -4;
				hsp = 2 * spr_dir;
			}
		}
		break;
	
	case AT_DSTRONG:
		if window == 2{
			if window_timer == 1{
				sound_play(asset_get("sfx_ori_charged_flame_release"));
			}
		}
		break;
	
	case AT_NSPECIAL:
		switch(window){
			case 1: // startup
				if window_timer == 1{
					beam_juice = 60 + 60 * (ssj > 0); // 30 + 60 * (...)
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
					voice_play(VB_HA);
					
					// also change in nspecial.gml
					set_window_value(AT_NSPECIAL, 7, AG_WINDOW_LENGTH, 16 + floor(ease_sineIn(0, 30, beam_juice, beam_juice_max)));
				}
				if window_timer == phone_window_end{
					if beam_juice >= beam_juice_max && !ssj{
						chooseSsj();
						sound_play(sfx_dbfz_charge);
						ki = ki_max;
						kaioken = 0;
					}
					if funny_broken_mode || has_rune("L"){
						beam_juice = beam_juice_max;
					}
					spawn_form_aura();
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
			default: // flight
				
				if !hitpause{
				
					fall_through = true;
					
					var added_angle = 0;
					
					switch((right_down - left_down) * spr_dir){
						default:
							added_angle = 30;
							break;
						case 1:
							added_angle = 15;
							break;
						case -1:
							added_angle = 45;
							break;
					}
					
					if added_angle && abs(up_down - down_down) && !was_parried{
						superdash_angle_velocity = added_angle * (up_down - down_down) * 0.125;	
					}
					else{
						superdash_angle_velocity -= sign(superdash_angle_velocity) * 0.5;
						if abs(superdash_angle_velocity) < 0.5{
							superdash_angle_velocity = 0;
						}
					}
					
					var found = false;
					
					if funny_broken_mode || has_rune("G"){
						with oPlayer if !found && visible && get_player_team(player) != get_player_team(other.player){
							var htx = x;
							var hty = y;
							var moving_toward = point_distance(other.x, other.y, htx, hty) > point_distance(other.x+other.hsp, other.y+other.vsp, htx, hty);
							if moving_toward || true{
								var true_angle = point_direction(0, 0, lengthdir_x(1, other.superdash_angle) * other.spr_dir, lengthdir_y(1, other.superdash_angle));
								other.superdash_angle_velocity = -angle_difference(true_angle, point_direction(other.x, other.y, htx, hty)) * 0.35 * other.spr_dir;
								found = true;
							}
						}
					}
					
					superdash_angle += superdash_angle_velocity;
					
					if !free && !found superdash_angle = max(superdash_angle, 0);
					
					if found fall_through = true;
					
					var spd = 15 + (window == 2) * 5;
					if (funny_broken_mode || has_rune("G")) && found spd += 20;
					if (right_down - left_down) == -spr_dir && !abs(up_down - down_down) || was_parried{
						spd /= 2;
					}
					hsp = lengthdir_x(spd, superdash_angle) * spr_dir;
					vsp = lengthdir_y(spd, superdash_angle);
					
					if window_timer == phone_window_end{
						var h = spawn_hit_fx(x + lengthdir_x(-24, superdash_angle) * spr_dir, y + lengthdir_y(-24, superdash_angle) - 36, vfx_ftilt_destroy);
						h.draw_angle = superdash_angle * spr_dir;
					}
					
					if shield_pressed{
						destroy_hitboxes();
						window = 5;
						window_timer = 0;
					}
					
					can_wall_jump = true;
				}
				break;
			case 1: // startup
				if window_timer == 1{
					sound_play(sfx_dbfz_kidan_charge);
					spawn_base_dust(x, y, "jump");
					voice_play(VB_ATK_MED);
				}
				
				vsp = lerp(-4, -1, window_timer / phone_window_end)
				hsp = sin(window_timer / phone_window_end - 0.5) * spr_dir * 6;
				superdash_angle = 0;
				superdash_angle_velocity = 0;
				
				if window_timer == phone_window_end{
					spawn_hit_fx(x, y - 36, vfx_nspecial_fire);
					x += 32 * spr_dir;
				}
				break;
			case 5: // endlag
				hsp *= 0.8;
				vsp *= 0.8;
				can_wall_jump = true;
				break;
		}
		if has_hit && !hitpause{
			hsp = clamp(hsp, -6, 6);
			vsp = -6;
			attack_end();
			set_state(PS_IDLE_AIR);
		}
		break;
	
	case AT_USPECIAL:
		can_move = false;
		can_fast_fall = false;
		var spd = 16;
		uspecial_dist = 200;
		switch(window){
			case 1:
				if window_timer == 1{
					sound_play(sfx_dbfz_kidan_charge);
					voice_play(VB_ATK_SMALL);
					uspecial_target = noone;
				}
				if !free{
					vsp = -10;
				}
				hsp *= 0.85;
				vsp *= 0.85;
				if !joy_pad_idle{
					array_push(uspecial_direction_arr, joy_dir);
				}
				if window_timer == phone_window_end{
					uspecial_direction = uspecial_direction_arr[max(0, array_length(uspecial_direction_arr) - 4)]; // ignore the last 3 frames of non-idle joystick input, because of weird pseudo-snapback behavior on analog sticks
					if funny_broken_mode || has_rune("H") uspecial_direction = uspecial_direction_arr[max(0, array_length(uspecial_direction_arr) - 1)];
					// x += lengthdir_x(uspecial_dist, uspecial_direction);
					// y += lengthdir_y(uspecial_dist, uspecial_direction);
					// hsp = lengthdir_x(spd, uspecial_direction);
					// vsp = lengthdir_y(spd, uspecial_direction);
					
					hsp = lengthdir_x(uspecial_dist, uspecial_direction);
					vsp = lengthdir_y(uspecial_dist, uspecial_direction);
					fall_through = true;
					
					
					if ssj && !shield_down && uspecial_can_target{
						var nearest = noone;
						var record = 0;
						with oPlayer if get_player_team(player) != get_player_team(other.player) && (state_cat == SC_HITSTUN){
							if nearest == noone || distance_to_object(other) < record{
								nearest = self;
								record = distance_to_object(other);
							}
						}
						if nearest != noone{
							uspecial_can_target = false;
							
							x = nearest.x - lengthdir_x(72, uspecial_direction);
							y = nearest.y - lengthdir_y(72, uspecial_direction);
							
							x = clamp(x, phone_blastzone_l + 32, phone_blastzone_r - 32);
							y = clamp(y, phone_blastzone_t + 32, phone_blastzone_b - 32);
							
							var ceiling_limit = 256;
							
							y = max(y, ceiling_limit);
							with nearest y = max(y, ceiling_limit);
							
							hsp = 0;
							vsp = 0;
							
							uspecial_target = nearest;
						}
					}
				}
				break;
			case 2:
				free = true;
				can_wall_jump = true;
				hsp *= 0.8;
				vsp *= 0.8;
				
				if window_timer == 1{
					hsp = lengthdir_x(spd, uspecial_direction);
					vsp = lengthdir_y(spd, uspecial_direction);
					if uspecial_target != noone{
						hsp += uspecial_target.hsp;
						vsp += uspecial_target.vsp;
					}
				}
				
				if attack_pressed || up_strong_pressed || down_strong_pressed || left_strong_pressed || right_strong_pressed || up_stick_pressed || down_stick_pressed || left_stick_pressed || right_stick_pressed{
					can_attack = true;
					if !(funny_broken_mode || has_rune("H")) aerial_pratfall_timer = 5;
					hsp = clamp(hsp, -6, 6);
					vsp = -4;
				}
				else if special_pressed && !phone_arrow_cooldown{
					attack_end();
					if !(funny_broken_mode || has_rune("H")) aerial_pratfall_timer = 5;
					set_attack(AT_NSPECIAL);
					vsp = clamp(vsp, -4, 4);
				}
				break;
		}
		break;
	
	case AT_DSPECIAL:
		can_move = false;
		can_fast_fall = false;
		if window == 1 && window_timer == 4 && !hitpause{
			clear_button_buffer(PC_SPECIAL_PRESSED);
			if ki < ki_max{
				if !kaioken{
					voice_play(VB_KAIOKEN);
					kaioken = min(ki + kaioken_add, ki_max);
					kaioken_recoil_tick = 0;
					shake_camera(5, 10);
				}
				else{
					shake_camera(3, 5);
				}
			}
			else{
				if !ssj{
					voice_play(VB_ATK_HUGE);
					chooseSsj();
					switch(get_player_color(player)){
						case 5:
						case 17:
						case 27:
							ssj = SSJ_ROSE;
							break;
					}
					shake_camera(10, 20);
					sound_play(sfx_dbfz_hit_broken);
				}
			}
			spawn_form_aura();
			has_looped = false;
		}
		if window == 1{
			hsp = 0;
			vsp = 0;
		}
		if window == clamp(window, 2, 7){
			if (funny_broken_mode || has_rune("I")) && window_timer == 1 && !hitpause{
				attack_end();
				destroy_hitboxes();
				create_hitbox(attack, 1, x, y - 32)
			}
			shake_camera(2, 1);
			if has_looped{
				if !special_down || !kaioken || ssj{
					window += 6;
					window_timer = 0;
					destroy_hitboxes();
				}
				else{
					repeat(4){
						if ki >= kaioken - 4 kaioken = min(kaioken + 1, ki_max);
						user_event(1);
					}
				}
			}
			else{
				hsp = 0;
				vsp = 0;
			}
		}
		if window == 7 && window_timer == phone_window_end{
			has_looped = true;
			if ssj{
				window += 6;
				window_timer = 0;
			}
		}
		hsp = clamp(hsp, -3, 3);
		vsp = min(vsp, 6); // 3
		if has_hit && !hitpause{
			if abs(right_hard_pressed - left_hard_pressed) && !free{
				attack_end();
				spr_dir = (right_hard_pressed - left_hard_pressed);
				set_state(PS_DASH_START);
			}
			else{
				can_attack = true;
				can_special = true;
				can_jump = true;
				can_shield = true;
				can_strong = true;
				can_ustrong = true;
			}
		}
		break;
	
	case AT_DSPECIAL_2:
		can_fast_fall = false;
		switch(window){
			case 1:
				if window_timer == 1{
					voice_play(VB_SPIRIT_BOMB);
				}
				vsp = lerp(-6, -3, window_timer / phone_window_end);
				hsp = clamp(hsp, -2, 2);
				break;
			case 2:
				if !hitpause{
					vsp = lerp(-3, 0, window_timer / phone_window_end);
				}
				hsp = clamp(hsp, -2, 2);
				
				if window_timer == phone_window_end && !hitpause{
					hsp = -3 * spr_dir;
					vsp = -4;
				}
				break;
			case 3:
				can_move = false;
				break;
		}
		break;
	
	case 49: // Final Smash
		can_move = false;
		can_fast_fall = false;
		ssj = SSJ_NONE;
		switch(window){
			case 1:
				if window_timer == 2{
					sound_play(sfx_dbfz_kidan_charge);
					voice_play(VB_S_SPIRIT_BOMB);
					if "superTrue" in self{
						set_hitbox_value(49, 1, HG_DAMAGE, 1); // weaker in sai's mode or w/e
					}
				}
				if !free{
					vsp = -10;
				}
				hsp = 0;
				vsp = 0;
				if window_timer == phone_window_end{
					x = room_width / 2 - 320 * spr_dir;
					y = 240;
				}
				break;
			case 2:
				free = true;
				hsp = 0;
				vsp = 0;
				break;
			case 3:
				hsp = 0;
				vsp = 0;
				break;
			case 4:
				hsp = 0;
				vsp = 0;
				
				if window_timer == phone_window_end && !hitpause{
					hsp = -3 * spr_dir;
					vsp = -4;
					sound_play(sfx_dbfz_sbomb_hit);
				}
				break;
			case 5:
				can_move = false;
				break;
		}
		break;
	
	case AT_EXTRA_1: // UI Dodge
		can_move = false;
		can_fast_fall = false;
		can_attack = true;
		can_special = true;
		can_jump = true;
		can_shield = true;
		can_strong = true;
		can_ustrong = true;
		hsp = walk_speed * spr_dir;
		vsp = 0;
		break;
	
	case AT_TAUNT:
		if window_timer == 1 taunt_time = 0;
		if window_timer == 30 && taunt_down{
			window_timer--;
			taunt_time++;
			if taunt_time > 180{
				shake_camera(floor((taunt_time - 180) / 30), 1);
				if taunt_time % 30 == 0{
					var intensity = min(2, (taunt_time - 180) * 0.1 / 60);
					sound_play(sound_get("hey_its_me_goku"), false, noone, intensity, intensity + 0.5);
				}
				if taunt_time % 30 == 4{
					var intensity = min(2, (taunt_time - 180) * 0.1 / 60);
					sound_play(sound_get("hey_its_me_goku"), false, noone, intensity - 1, intensity + 0.5);
				}
			}
		}
		
		if !funny_broken_mode && special_down && attack_down{
			var found = false;
			with oPlayer if self != other switch url{ // shoutouts to sai
				case "2273636433":
				case "1870768156":
				case "1869351026":
				case "2443363942":
				case "2159023588":
				case "1980469422":
					break;
				default:
					if (
						check_string_for_name(player, "nald") || 
						check_string_for_name(player, "%") || 
						check_string_for_name(player, "sand") || 
						check_string_for_name(player, "psy") || 
						check_string_for_name(player, "ultra") || 
						check_string_for_name(player, "god") || 
						check_string_for_name(player, "boss") || 
						check_string_for_name(player, "ui ") || 
						check_string_for_name(player, "ssg") || 
						check_string_for_name(player, "melee") || 
						check_string_for_name(player, "accurate")
						) found = true;
					break;
			}
			if found{
				sound_play(sfx_dbfz_charge);
				voice_play(VB_ATK_HUGE);
				funny_broken_mode = true;
				
				set_hitbox_value(AT_UTILT, 3, HG_DAMAGE, 10);
				set_hitbox_value(AT_UTILT, 3, HG_ANGLE, 90);
				set_hitbox_value(AT_UTILT, 3, HG_BASE_KNOCKBACK, 9);
				set_hitbox_value(AT_UTILT, 3, HG_KNOCKBACK_SCALING, .9);
				set_hitbox_value(AT_UTILT, 3, HG_BASE_HITPAUSE, 16);
				set_hitbox_value(AT_UTILT, 3, HG_HITPAUSE_SCALING, .8);
				set_hitbox_value(AT_UTILT, 3, HG_HIT_SFX, sfx_dbfz_hit_strong);
				set_hitbox_value(AT_UTILT, 3, HG_PROJECTILE_VSPEED, -40);
				
				set_hitbox_value(AT_USTRONG, 1, HG_DAMAGE, 13);
				set_hitbox_value(AT_USTRONG, 1, HG_BASE_KNOCKBACK, 10);
				set_hitbox_value(AT_USTRONG, 1, HG_KNOCKBACK_SCALING, 1.1);
				set_hitbox_value(AT_USTRONG, 1, HG_BASE_HITPAUSE, 16);
				set_hitbox_value(AT_USTRONG, 1, HG_HITPAUSE_SCALING, .7);
				
				set_hitbox_value(AT_USTRONG, 2, HG_DAMAGE, 13);
				set_hitbox_value(AT_USTRONG, 2, HG_BASE_KNOCKBACK, 10);
				set_hitbox_value(AT_USTRONG, 2, HG_KNOCKBACK_SCALING, 1.4);
				set_hitbox_value(AT_USTRONG, 2, HG_BASE_HITPAUSE, 16);
				set_hitbox_value(AT_USTRONG, 2, HG_HITPAUSE_SCALING, .7);
				
				set_window_value(AT_USPECIAL, 1, AG_WINDOW_LENGTH, 6);
				set_window_value(AT_USPECIAL, 1, AG_WINDOW_SFX_FRAME, 0);
				
				set_window_value(AT_USPECIAL, 2, AG_WINDOW_TYPE, 0);
				
				set_hitbox_value(AT_NAIR, 2, HG_HIT_LOCKOUT, 0);
				
				set_hitbox_value(AT_FTILT, 2, HG_DAMAGE, 10);
				set_hitbox_value(AT_FTILT, 2, HG_ANGLE, 40);
				set_hitbox_value(AT_FTILT, 2, HG_BASE_KNOCKBACK, 9);
				set_hitbox_value(AT_FTILT, 2, HG_KNOCKBACK_SCALING, .6);
				set_hitbox_value(AT_FTILT, 2, HG_BASE_HITPAUSE, 16);
				set_hitbox_value(AT_FTILT, 2, HG_HITPAUSE_SCALING, .8);
				set_hitbox_value(AT_FTILT, 2, HG_HIT_SFX, sfx_dbfz_hit_strong);
				set_hitbox_value(AT_FTILT, 2, HG_PROJECTILE_HSPEED, 40);
				
				set_hitbox_value(AT_DSPECIAL, 1, HG_ANGLE_FLIPPER, 4);
				set_hitbox_value(AT_DSPECIAL, 1, HG_ANGLE, 10);
				set_hitbox_value(AT_DSPECIAL, 1, HG_KNOCKBACK_SCALING, 0);
				set_hitbox_value(AT_DSPECIAL, 1, HG_HITPAUSE_SCALING, 0);
				
				set_hitbox_value(AT_DAIR, 1, HG_LIFETIME, 15);
				set_hitbox_value(AT_DAIR, 2, HG_WINDOW, 0);
			}
		}
		break;
}



switch(attack){
	case AT_JAB:
		ssj_cancel(9);
	case AT_UTILT:
	case AT_NAIR:
		ssj_cancel(6);
	case AT_FTILT:
	case AT_DTILT:
	case AT_FAIR:
	case AT_BAIR:
	case AT_UAIR:
		ssj_cancel(3);
		break;
		break;
	case AT_FSTRONG:
	case AT_USTRONG:
	case AT_DSTRONG:
	case AT_DATTACK:
	case AT_DAIR:
		ssj_cancel(4);
		break;
}



#define check_string_for_name(player, string)

return string_count(string, string_lower(get_char_info(player, INFO_STR_NAME)))



#define chooseSsj

ssj = SSJ_1;
if shield_down{
	ssj = SSJ_UI;
}
if attack_down{
	ssj = SSJ_3;
	if shield_down{
		ssj = SSJ_BLUE;
	}
}
if jump_down{
	ssj = SSJ_GOD;
	if shield_down{
		ssj = SSJ_BLUE;
	}
}



#define voice_window(wdw, idx)

if window == wdw && window_timer == phone_window_end - 2{
	voice_play(idx);
}



#define voice_play(idx)

cur_vc = idx;
user_event(0);



#define spawn_form_aura

if ssj return spawn_hit_fx(x, y, vfx_ssj_start);
if kaioken return spawn_hit_fx(x, y, vfx_kaioken_start);



#define ssj_cancel(win)

if ssj && window == win && has_hit && !hitpause{
	if funny_broken_mode || has_rune("K"){
		iasa_script();
		return;
	}
	can_special = true;
	can_strong = true;
	can_ustrong = true;
}



#define set_pratfall(win)

if hitpause || has_hit{
	set_window_value(attack, win, AG_WINDOW_TYPE, 0);
}

if !free && get_window_value(attack, win, AG_WINDOW_TYPE) == 7 && attack != AT_NSPECIAL{
	attack_end();
	set_state(PS_PRATLAND);
}



#define beam_clash_logic

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