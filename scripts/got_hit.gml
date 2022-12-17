if kaioken && enemy_hitboxID.damage > 0 take_damage(player, enemy_hitboxID.player, 2);

var ki_mult = 1;
if ssj{
	ki = max(ki - enemy_hitboxID.damage * ki_mult, 1);
}
else{
	ki = min(ki + enemy_hitboxID.damage * ki_mult * 2, ki_max);
}

voice_play(VB_HURT);

grabp = noone;

moove_cooldown[AT_FSPECIAL_AIR] = 0;
moove_cooldown[AT_DSTRONG] = 0;

#define voice_play(idx)

cur_vc = idx;
user_event(0);