if (my_hitboxID.type == 2){
	my_hitboxID.hitpause_timer = hit_player_obj.hitstop - my_hitboxID.extra_hitpause;
	my_hitboxID.has_hit = 1;
}

if (my_hitboxID.attack == AT_FTILT && my_hitboxID.hbox_num == 2){
	var h = spawn_hit_fx(my_hitboxID.x + 30 * my_hitboxID.spr_dir, my_hitboxID.y, vfx_ftilt_destroy);
	h.spr_dir = my_hitboxID.spr_dir;
}

if (my_hitboxID.attack == AT_FTILT && my_hitboxID.hbox_num == 1){
	hit_player_obj.x = lerp(hit_player_obj.x, x + 64 * spr_dir, 0.5);
}

if my_hitboxID.attack == AT_NSPECIAL && !has_updated_beam_kb{ // also change in nspecial.gml
	has_updated_beam_kb = true;
	set_hitbox_value(AT_NSPECIAL, 2, HG_BASE_KNOCKBACK, lerp(7, 12, beam_juice / beam_juice_max));
	set_hitbox_value(AT_NSPECIAL, 2, HG_KNOCKBACK_SCALING, lerp(0.5, 1.6, beam_juice / beam_juice_max));
	set_hitbox_value(AT_NSPECIAL, 2, HG_BASE_HITPAUSE, lerp(8, 20, beam_juice / beam_juice_max));
	set_hitbox_value(AT_NSPECIAL, 2, HG_HITPAUSE_SCALING, lerp(0.5, 1.5, beam_juice / beam_juice_max));
	set_hitbox_value(AT_NSPECIAL, 2, HG_DAMAGE, lerp(2, 22, beam_juice / beam_juice_max));
	set_hitbox_value(AT_NSPECIAL, 2, HG_ANGLE, round(lerp(55, 35, beam_juice / beam_juice_max)));
}

if my_hitboxID.attack == AT_NSPECIAL && my_hitboxID.hbox_num == 2 && my_hitboxID.hitpause > 15{
	sound_play(sfx_dbfz_hit_broken);
}

if(my_hitboxID.attack == AT_FSPECIAL && my_hitboxID.hbox_num == 1){
	set_window_value(AT_FSPECIAL, 1, AG_WINDOW_GOTO, 2);
	grabp.state = PS_WRAPPED;
	grabp.wrap_time = 1000
}

if(my_hitboxID.attack == AT_USPECIAL && my_hitboxID.hbox_num == 1){
	hit_player_obj.state = PS_WRAPPED;
	hit_player_obj.wrap_time = 1000;
	hit_player_obj.cell_usp_grab = 1;
	hit_player_obj.cell_grab_t = 20;
}else if(my_hitboxID.attack == AT_USPECIAL && my_hitboxID.hbox_num == 2){
	hit_player_obj.cell_usp_grab = 0;
}

var ki_mult = 5; // 4

switch my_hitboxID.attack{
	case AT_NSPECIAL:
		if my_hitboxID.hbox_num == 1{
			if !ssj ki = min(ki + my_hitboxID.damage * ki_mult, ki_max);
			if kaioken{
				take_damage(hit_player_obj.player, player, 1);
				kaioken = min(kaioken + my_hitboxID.damage * ki_mult, ki_max);
			}
			break;
		}
	case AT_DSPECIAL_2:
		if my_hitboxID.hbox_num == 2{
			if !ssj ki = min(ki + my_hitboxID.damage * ki_mult, ki_max);
			break;
		}
	default:
		if !ssj ki = min(ki + my_hitboxID.damage * ki_mult, ki_max);
		if kaioken{
			take_damage(hit_player_obj.player, player, 2);
			kaioken = min(kaioken + my_hitboxID.damage * ki_mult, ki_max);
		}
		break;
}



if my_hitboxID.attack == AT_DSPECIAL_2 && my_hitboxID.hbox_num < 3{
	with my_hitboxID if "up_amount" not in self up_amount = round(ease_sineIn(0, 50, hits_left, 15));
	hit_player_obj.y -= my_hitboxID.up_amount;
	if my_hitboxID.hbox_num == 1{
		my_hitboxID.x = hit_player_obj.x;
		my_hitboxID.y = hit_player_obj.y - hit_player_obj.char_height;
		my_hitboxID.hsp = 0;
		my_hitboxID.vsp = 0;
	}
}