if get_player_color(player) == 0 {
	if ("state" not in self || state != PS_PARRY || image_index != 1) {
		set_character_color_slot(2, 25, 29, 35, 1);
	}
} else if get_player_color(player) == 10{
	set_character_color_shading(0, 0);
	set_character_color_shading(1, 0);
	set_character_color_shading(2, 0);
	set_character_color_shading(3, 0);
	set_character_color_shading(4, 0);
	set_character_color_shading(5, 0);
	set_character_color_shading(6, 0);
	set_character_color_shading(7, 0);
} 

if object_index != oPlayer exit;
if ssj == 1 || ssj == 2 || ssj == 3 || ssj == 4 || ssj == 5 || ssj == 6{
	var col = ssjs[ssj].color;

	set_character_color_slot(4, color_get_red(col), color_get_green(col), color_get_blue(col));
	set_article_color_slot(4, color_get_red(col), color_get_green(col), color_get_blue(col));

	if get_player_color(player) != 11 col = ssjs[ssj].color_dark;

	set_character_color_slot(5, color_get_red(col), color_get_green(col), color_get_blue(col));
	set_article_color_slot(5, color_get_red(col), color_get_green(col), color_get_blue(col));
} 