set_attack_value(AT_DSPECIAL, AG_CATEGORY, 2);
set_attack_value(AT_DSPECIAL, AG_SPRITE, sprite_get("dspecial"));
set_attack_value(AT_DSPECIAL, AG_NUM_WINDOWS, 7);
set_attack_value(AT_DSPECIAL, AG_HAS_LANDING_LAG, 4);
set_attack_value(AT_DSPECIAL, AG_OFF_LEDGE, 1);
set_attack_value(AT_DSPECIAL, AG_HURTBOX_SPRITE, hurtbox_spr);
set_attack_value(AT_DSPECIAL, AG_MUNO_ATTACK_COOLDOWN, 30);

set_window_value(AT_DSPECIAL, 1, AG_WINDOW_LENGTH, 8);
set_window_value(AT_DSPECIAL, 1, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_DSPECIAL, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_DSPECIAL, 1, AG_WINDOW_SFX, sfx_dbfz_charge);

for (var i = 2; i < 8; i++){
	set_window_value(AT_DSPECIAL, i, AG_WINDOW_LENGTH, 3);
	set_window_value(AT_DSPECIAL, i, AG_WINDOW_ANIM_FRAMES, 1);
	set_window_value(AT_DSPECIAL, i, AG_WINDOW_ANIM_FRAME_START, i);
}
set_window_value(AT_DSPECIAL, 7, AG_WINDOW_GOTO, 2);

for (var i = 8; i < 14; i++){
	set_window_value(AT_DSPECIAL, i, AG_WINDOW_LENGTH, 3);
	set_window_value(AT_DSPECIAL, i, AG_WINDOW_ANIM_FRAMES, 1);
	set_window_value(AT_DSPECIAL, i, AG_WINDOW_ANIM_FRAME_START, i);
}

set_num_hitboxes(AT_DSPECIAL, 1);

set_hitbox_value(AT_DSPECIAL, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DSPECIAL, 1, HG_WINDOW, 1);
set_hitbox_value(AT_DSPECIAL, 1, HG_WINDOW_CREATION_FRAME, 4);
set_hitbox_value(AT_DSPECIAL, 1, HG_LIFETIME, 4);
set_hitbox_value(AT_DSPECIAL, 1, HG_HITBOX_Y, -32);
set_hitbox_value(AT_DSPECIAL, 1, HG_WIDTH, 64);
set_hitbox_value(AT_DSPECIAL, 1, HG_HEIGHT, 64);
set_hitbox_value(AT_DSPECIAL, 1, HG_SHAPE, 2);
set_hitbox_value(AT_DSPECIAL, 1, HG_PRIORITY, 1);
set_hitbox_value(AT_DSPECIAL, 1, HG_DAMAGE, 4);
set_hitbox_value(AT_DSPECIAL, 1, HG_ANGLE, 45);
set_hitbox_value(AT_DSPECIAL, 1, HG_BASE_KNOCKBACK, 7);
set_hitbox_value(AT_DSPECIAL, 1, HG_KNOCKBACK_SCALING, .1);
set_hitbox_value(AT_DSPECIAL, 1, HG_BASE_HITPAUSE, 7);
set_hitbox_value(AT_DSPECIAL, 1, HG_HITPAUSE_SCALING, .2);
set_hitbox_value(AT_DSPECIAL, 1, HG_HIT_SFX, sfx_dbfz_hit_kidan);
set_hitbox_value(AT_DSPECIAL, 1, HG_ANGLE_FLIPPER, 3);
set_hitbox_value(AT_DSPECIAL, 1, HG_TECHABLE, 1);

if !has_rune("I") exit;

// set_hitbox_value(AT_DSPECIAL, 1, HG_LIFETIME, 100);
set_hitbox_value(AT_DSPECIAL, 1, HG_ANGLE_FLIPPER, 4);
set_hitbox_value(AT_DSPECIAL, 1, HG_ANGLE, 10);
set_hitbox_value(AT_DSPECIAL, 1, HG_KNOCKBACK_SCALING, 0);
set_hitbox_value(AT_DSPECIAL, 1, HG_HITPAUSE_SCALING, 0);