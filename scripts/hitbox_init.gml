if "hitpause_timer" not in self hitpause_timer = 0;
if "has_hit" not in self has_hit = 0;

if attack == AT_FTILT{
	if player_id.phone_arrow_cooldown{
		hitbox_timer = length - 1;
	}
}

if attack == AT_DSPECIAL_2{
	
	if "hits_left" not in self hits_left = 0;
	if "up_amount" not in self up_amount = round(ease_sineIn(0, 50, hits_left, 15));
	
	if hbox_num == 1{
		hits_left = player_id.spirit_bomb_juice + 3;
		move_angle = point_direction(0, 0, hsp, vsp);
		move_speed = point_distance(0, 0, hsp, vsp);
		
		var h = spawn_hit_fx(x, y, player_id.vfx_nspecial_fire);
		h.spr_dir = 1;
		h.draw_angle = move_angle;
		h.depth = player_id.depth - 1;
		
		homing_target = noone;
		var record = 0;
		with oPlayer if get_player_team(player) != get_player_team(other.player) && visible{
			if other.homing_target == noone || distance_to_object(other) < record{
				other.homing_target = self;
				record = distance_to_object(other);
			}
		}
	}
}