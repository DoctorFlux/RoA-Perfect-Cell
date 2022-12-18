voice_play(VB_HURT);

grabp = noone;

move_cooldown[AT_FSPECIAL_AIR] = 0;
move_cooldown[AT_DSTRONG] = 0;

#define voice_play(idx)

cur_vc = idx;
user_event(0);