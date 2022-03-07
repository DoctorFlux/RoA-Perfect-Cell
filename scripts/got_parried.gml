if my_hitboxID.attack == AT_FTILT && my_hitboxID.hbox_num == 2{
	my_hitboxID.hitbox_timer = 1;
	my_hitboxID.hsp *= 1.1;
}

ki = max(ki - 100, 0);

if my_hitboxID.attack == AT_DSPECIAL_2 && my_hitboxID.hbox_num == 1{
	my_hitboxID.homing_target = self;
	my_hitboxID.move_angle += 180;
	my_hitboxID.hitbox_timer = 1;
}