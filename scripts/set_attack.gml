///#args attack

superdash_angle = 0;
uspecial_direction_arr = [90];

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
	case AT_NSPECIAL:
		set_pratfall(7);
		break;
}


if (funny_broken_mode || has_rune("E")) && attack == AT_DAIR{
	spawn_hit_fx(x, y, vfx_utilt_spawn);
	x += 128 * spr_dir + 64 * (right_down - left_down);
	y -= 128;
	sound_play(sfx_dbfz_teleport);
}

switch(attack){
	case AT_FSTRONG:
	case AT_USTRONG:
		set_num_hitboxes(attack, 1 + (ssj > 0));
		break;
	case AT_DSTRONG:
		set_num_hitboxes(attack, 2 + (ssj > 0));
		break;
}

if attack == AT_DSPECIAL && ssj{
	attack = AT_DSPECIAL_2;
	if funny_broken_mode || has_rune("M") attack = 49;
	spirit_bomb_juice = floor(ki / ki_max * 10)
	
	ssj = false;
	ki = 0;
}




muno_event_type = 2;
user_event(14);



#define set_pratfall(win)

set_window_value(attack, win, AG_WINDOW_TYPE, 7 * (aerial_pratfall_timer > 0));