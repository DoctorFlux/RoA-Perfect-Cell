if hitpause_timer{
	hitpause_timer--;
	in_hitpause = 1;
}
else{
	in_hitpause = 0;
}

if(attack == AT_JAB || attack == AT_FSPECIAL_AIR) && (destroyed || !free){
	spawn_hit_fx(x, y, 140);
	instance_destroy(self);
	exit;
}
if attack == AT_DSPECIAL_2{
	switch(hbox_num){
		case 1:
			hsp = lengthdir_x(move_speed, move_angle);
			vsp = lengthdir_y(move_speed, move_angle);
			
			if homing_target != noone{
				// move_angle -= angle_difference(move_angle, point_direction(x, y, homing_target.x, homing_target.y)) * max(0.1, lerp(1, 0.1, distance_to_object(homing_target) / 500));
				
				var htx = homing_target.x;
				var hty = homing_target.y - homing_target.char_height / 2;
				
				var home_amount = 0.05; // 0.25
				
				if point_distance(x, y, htx, hty) > point_distance(x+hsp, y+vsp, htx, hty){
					move_angle -= angle_difference(move_angle, point_direction(x, y, htx, hty)) * home_amount;
				}
			}
			
			var found_hbox = noone;
			
			with pHitBox if !proj_break && player != other.player && other.can_hit[player] && place_meeting(x, y, other){
				found_hbox = self;
			}
			if found_hbox != noone{
				can_hit[found_hbox.player] = 0;
				move_angle = get_hitbox_angle(found_hbox);
				sound_play(player_id.sfx_dbfz_sbomb_impact);
				spawn_hit_fx(x, y, 304);
				hitbox_timer = 0;
			}
		case 2:
			if has_hit && !in_hitpause{
				if "die" in self{
					instance_destroy();
					exit;
				}
				die = 1;
				if hits_left{
					var h = create_hitbox(attack, 2 + (hits_left == 1), round(x), round(y - up_amount));
					h.hits_left = hits_left - 1;
					h.player = player;
				}
			}
			break;
	}
}

if attack == 49{ // final smash
	if "last_refresh" not in self last_refresh = 0;
	if hitbox_timer % 2 == 0 && hitbox_timer > last_refresh{
		for (var i = 0; i < 20; i++){
		    can_hit[i] = 1;
		}
		last_refresh = hitbox_timer;
	}
}