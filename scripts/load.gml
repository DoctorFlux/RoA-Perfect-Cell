sprite_change_offset("idle", 50, 70);
sprite_change_offset("crouch", 50, 70);
sprite_change_offset("walk", 50, 70);
sprite_change_offset("walkturn", 50, 70);
sprite_change_offset("dash", 50, 70);
sprite_change_offset("dashstart", 50, 70);
sprite_change_offset("dashstop", 50, 70);
sprite_change_offset("dashturn", 50, 70);


sprite_change_offset("hurt_box", 100, 140);
sprite_change_offset("crouch_hurt_box", 100, 140);
sprite_change_offset("hurt", 50, 70);
sprite_change_offset("hurtground", 50, 70);
sprite_change_offset("bighurt", 50, 70);
sprite_change_offset("uphurt", 50, 70);
sprite_change_offset("downhurt", 50, 70);
sprite_change_offset("bouncehurt", 50, 70);
sprite_change_offset("spinhurt", 50, 70);

sprite_change_offset("jumpstart", 50, 70);
sprite_change_offset("jump", 50, 70);
sprite_change_offset("doublejump", 50, 70);
sprite_change_offset("walljump", 50, 70);
sprite_change_offset("pratfall", 50, 70);
sprite_change_offset("land", 50, 70);
sprite_change_offset("landinglag", 50, 70);

sprite_change_offset("parry", 50, 70);
sprite_change_offset("roll_forward", 50, 70);
sprite_change_offset("roll_backward", 50, 70);
sprite_change_offset("airdodge", 50, 70);
sprite_change_offset("waveland", 50, 70);
sprite_change_offset("tech", 50, 70);

sprite_change_offset("jab", 50, 70, true);
sprite_change_offset("jab_vfx", 50, 70, true);
sprite_change_offset("dattack", 50, 70, true);
sprite_change_offset("ftilt", 50, 70, true);
sprite_change_offset("dtilt", 50, 70, true);
sprite_change_offset("utilt", 50, 70, true);
sprite_change_offset("nair", 50, 70, true);
sprite_change_offset("fair", 50, 70, true);
sprite_change_offset("bair", 50, 70, true);
sprite_change_offset("uair", 50, 70, true);
sprite_change_offset("dair", 50, 70, true);
sprite_change_offset("fstrong", 50, 70, true);
sprite_change_offset("fstrong_vfx", 50, 70, true);
sprite_change_offset("ustrong", 50, 70, true);
sprite_change_offset("dstrong", 50, 70, true);
sprite_change_offset("nspecial", 50, 70, true);
sprite_change_offset("nspecial_air", 50, 70, true);
sprite_change_offset("fspecial", 50, 52, true);
sprite_change_offset("fspecialair", 50, 70, true);
sprite_change_offset("fspecialair_vfx", 50, 70, true);
sprite_change_offset("jab_vfx", 50, 70, true);
sprite_change_offset("fspecial_vfx", 100, 50);
sprite_change_offset("fspecial_hurt", 98, 154, true);
sprite_change_offset("uspecial", 93, 120);
sprite_change_offset("dspecial", 50, 70, true);
sprite_change_offset("dspecial_vfx", 50, 70, true);
sprite_change_offset("taunt", 50, 70);
sprite_change_offset("phone_open", 50, 70);

sprite_change_offset("vfx_afterimage", 100, 140);
sprite_change_offset("vfx_afterimage_ssj1", 100, 140);
sprite_change_offset("vfx_afterimage_ssj3", 100, 140);
sprite_change_offset("ftilt_proj", 100, 140);

sprite_change_offset("vfx_ftilt_destroy", 100, 140);
sprite_change_offset("fspecial_vfx_start", 100, 140);
sprite_change_offset("utilt_proj", 100, 140 - 30);
sprite_change_offset("vfx_utilt_spawn", 100, 140);
sprite_change_offset("nspecial_beam_start", 64, 64);
sprite_change_offset("nspecial_beam_end", 64, 64);
sprite_change_offset("nspecial_beam_loop", 0, 64);
sprite_change_offset("nspecial_beam_fade", 0, 33);
sprite_change_offset("vfx_nspecial_fire", 100, 140);
sprite_change_offset("vfx_sparkle", 100, 100);
sprite_change_offset("uspecial_arrow", 100, 140);
sprite_change_offset("sbomb_traveling", 128, 128);
sprite_change_offset("sbomb_multihit", 128, 128);

sprite_change_offset("vfx_kaioken_start", 100, 140);
sprite_change_offset("vfx_ssj_start", 100, 140);
sprite_change_offset("vfx_ssj3_lightning", 32, 32);

sprite_change_offset("super_spirit_bomb", 768, 768);

sprite_change_offset("plat", 50, 70);
sprite_change_offset("intro", 150, 99);
sprite_change_offset("kirby", 100, 140);
sprite_change_offset("kirby_icon", 10, 10);

sprite_change_offset("nspecial_proj", 64, 94);
sprite_change_offset("jab_proj", 40, 26);
sprite_change_offset("fspecialair_proj", 40, 26);

sprite_change_offset("hud_default_hud", 0, -2);
sprite_change_offset("hud_alt1_hud", 0, -2);
sprite_change_offset("hud_default_hurt", 0, -2);
sprite_change_offset("hud_alt1_hurt", 0, -2);
sprite_change_offset("hud_default_offscreen", 16, 18);
sprite_change_offset("hud_alt1_offscreen", 16, 18);
var alt_clr = get_player_color("online_css" in self ? 0 : player);
if get_player_color(player) == 0 {
	set_ui_element(UI_HUD_ICON, sprite_get("hud_default_hud"));
	set_ui_element(UI_HUDHURT_ICON, sprite_get("hud_default_hurt"));
	set_ui_element(UI_OFFSCREEN, sprite_get("hud_default_offscreen"));
	set_ui_element(UI_CHARSELECT, sprite_get("hud_default_charselect"));
	set_ui_element(UI_WIN_SIDEBAR, sprite_get("hud_default_result_small"));
	set_ui_element(UI_WIN_PORTRAIT, sprite_get("hud_default_portrait"));
}else{
	set_ui_element(UI_HUD_ICON, sprite_get("hud_alt1_hud"));
	set_ui_element(UI_HUDHURT_ICON, sprite_get("hud_alt1_hurt"));
	set_ui_element(UI_OFFSCREEN, sprite_get("hud_alt1_offscreen"));
	set_ui_element(UI_CHARSELECT, sprite_get("hud_alt1_charselect"));
	set_ui_element(UI_WIN_SIDEBAR, sprite_get("hud_alt1_result_small"));
	set_ui_element(UI_WIN_PORTRAIT, sprite_get("hud_alt1_portrait"));
}