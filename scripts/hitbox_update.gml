if attack == AT_NSPECIAL {
	player_id.attack_cooldown[AT_NSPECIAL] = 90
}

if(attack == AT_JAB && !free){
	destroyed = true;
}