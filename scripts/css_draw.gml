muno_event_type = 6;
user_event(14);



var alt_cur = get_player_color(player);
var num_alts = 12 - (alt_cur > 11) * 2;
var offset = 0;
if alt_cur > 11 offset += 12;
if alt_cur > 21 offset += 10;
 
for(i = 0; i < num_alts; i++){
    var draw_color = (i == alt_cur - offset) ? c_white : c_gray * 0.5;
    var draw_x = x + 78 + 8 * i;
    rectDraw(draw_x, y + 10, 5, 3, draw_color);
}

draw_sprite(sprite_get("css_voice"), (alt_cur > 11) + (alt_cur > 21), x + 78, y + 16);



#define rectDraw(x1, y1, width, height, color)

draw_rectangle_color(x1, y1, x1 + width, y1 + height, color, color, color, color, false);