if object_index != oPlayer exit;



var col = ssjs[ssj].color;

set_character_color_slot(4, color_get_red(col), color_get_green(col), color_get_blue(col));
set_article_color_slot(4, color_get_red(col), color_get_green(col), color_get_blue(col));

if get_player_color(player) != 11 col = ssjs[ssj].color_dark;

set_character_color_slot(5, color_get_red(col), color_get_green(col), color_get_blue(col));
set_article_color_slot(5, color_get_red(col), color_get_green(col), color_get_blue(col));