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
		if down_strong_pressed && !move_cooldown[AT_DSTRONG]{
			attack = AT_DSTRONG;
			startpos = "e";
			b1_pos = [];
			b2_pos = [];
			b3_pos = [];
			b4_pos = [];
			b5_pos = [];
			b6_pos = [];
		}
		break;
	case AT_NSPECIAL:
		set_pratfall(7);
		break;
	case AT_FSPECIAL:
	set_window_value(AT_FSPECIAL, 1, AG_WINDOW_GOTO, 3);
	grabp = noone;
	if free{
		attack = AT_FSPECIAL_AIR;
		window = 1;
		window_timer = 0;
	}
	break;
	case AT_USPECIAL:
	prev_pos = x;
	set_attack_value(AT_USPECIAL, AG_SPRITE, sprite_get("uspecial"));
	startp[@0] = x + 40 * spr_dir;
	startp[@1] = y;
	break;
	case AT_DSTRONG:
	startpos = y;
	b1_pos = [];
	b2_pos = [];
	b3_pos = [];
	b4_pos = [];
	b5_pos = [];
	b6_pos = [];
	break;
	case AT_DSPECIAL:
	dsp_ch = 0;
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






muno_event_type = 2;
user_event(14);



#define set_pratfall(win)

set_window_value(attack, win, AG_WINDOW_TYPE, 7 * (aerial_pratfall_timer > 0));