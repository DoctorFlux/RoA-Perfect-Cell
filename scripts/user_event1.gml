if ki < kaioken{
	if !hitpause{
		ki++;
		kaioken_recoil_tick++;
		if kaioken_recoil_tick % floor(kaioken_add / 20) == 0{
			take_damage(player, player, 1);
		}
	}
}
else{
	if kaioken sound_play(sfx_dbfz_teleport_end);
	kaioken = 0;
}