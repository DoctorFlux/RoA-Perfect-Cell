voice_play(VB_HURT);
sound_stop(sfx_dbfz_energyfield_fire);
sound_stop(sfx_dbfz_energyfield_chrg);
grabp = noone;

move_cooldown[AT_FSPECIAL_AIR] = 0;
move_cooldown[AT_DSTRONG] = 0;
move_cooldown[AT_USPECIAL] = 0;

#define voice_play(idx)

cur_vc = idx;
user_event(0);