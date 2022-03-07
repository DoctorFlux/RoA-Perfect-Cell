set_attack_value(AT_FSPECIAL, AG_CATEGORY, 2);
set_attack_value(AT_FSPECIAL, AG_SPRITE, sprite_get("fspecial"));
set_attack_value(AT_FSPECIAL, AG_NUM_WINDOWS, 5);
set_attack_value(AT_FSPECIAL, AG_HAS_LANDING_LAG, 4);
set_attack_value(AT_FSPECIAL, AG_AIR_SPRITE, sprite_get("fspecial"));
set_attack_value(AT_FSPECIAL, AG_HURTBOX_SPRITE, sprite_get("fspecial_hurt"));
set_attack_value(AT_FSPECIAL, AG_OFF_LEDGE, 1);
set_attack_value(AT_FSPECIAL, AG_MUNO_ATTACK_COOLDOWN, -9999);

// startup
set_window_value(AT_FSPECIAL, 1, AG_WINDOW_LENGTH, 15);
set_window_value(AT_FSPECIAL, 1, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_FSPECIAL, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_FSPECIAL, 1, AG_WINDOW_SFX, sfx_dbfz_superdash);
set_window_value(AT_FSPECIAL, 1, AG_WINDOW_SFX_FRAME, 10);

// overshoot
set_window_value(AT_FSPECIAL, 2, AG_WINDOW_LENGTH, 6);
set_window_value(AT_FSPECIAL, 2, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_FSPECIAL, 2, AG_WINDOW_ANIM_FRAME_START, 3);

// loop (windows 3-4)
for (var i = 3; i < 5; i++){
	set_window_value(AT_FSPECIAL, i, AG_WINDOW_LENGTH, 4);
	set_window_value(AT_FSPECIAL, i, AG_WINDOW_ANIM_FRAMES, 2);
	set_window_value(AT_FSPECIAL, i, AG_WINDOW_ANIM_FRAME_START, 5);
}

// endlag
set_window_value(AT_FSPECIAL, 5, AG_WINDOW_TYPE, 7);
set_window_value(AT_FSPECIAL, 5, AG_WINDOW_LENGTH, 8);
set_window_value(AT_FSPECIAL, 5, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_FSPECIAL, 5, AG_WINDOW_ANIM_FRAME_START, 7);

set_num_hitboxes(AT_FSPECIAL, 1);

set_hitbox_value(AT_FSPECIAL, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_FSPECIAL, 1, HG_WINDOW, 2);
set_hitbox_value(AT_FSPECIAL, 1, HG_LIFETIME, 14);
set_hitbox_value(AT_FSPECIAL, 1, HG_HITBOX_X, 0);
set_hitbox_value(AT_FSPECIAL, 1, HG_HITBOX_Y, -36);
set_hitbox_value(AT_FSPECIAL, 1, HG_WIDTH, 64);
set_hitbox_value(AT_FSPECIAL, 1, HG_HEIGHT, 64);
set_hitbox_value(AT_FSPECIAL, 1, HG_PRIORITY, 1);
set_hitbox_value(AT_FSPECIAL, 1, HG_DAMAGE, 5);
set_hitbox_value(AT_FSPECIAL, 1, HG_ANGLE, 60);
set_hitbox_value(AT_FSPECIAL, 1, HG_BASE_KNOCKBACK, 7);
set_hitbox_value(AT_FSPECIAL, 1, HG_KNOCKBACK_SCALING, .5);
set_hitbox_value(AT_FSPECIAL, 1, HG_BASE_HITPAUSE, 11);
set_hitbox_value(AT_FSPECIAL, 1, HG_HITPAUSE_SCALING, 0.6);
set_hitbox_value(AT_FSPECIAL, 1, HG_HIT_SFX, sfx_dbfz_hit_kidan);
set_hitbox_value(AT_FSPECIAL, 1, HG_IGNORES_PROJECTILES, 1);



set_attack_value(AT_FSPECIAL, AG_MUNO_ATTACK_MISC_ADD, "Shorten during frames " + string(get_window_value(AT_FSPECIAL, 1, AG_WINDOW_LENGTH) + 1) + "-" + string(get_window_value(AT_FSPECIAL, 1, AG_WINDOW_LENGTH) + get_window_value(AT_FSPECIAL, 2, AG_WINDOW_LENGTH)) + ", skipping to endlag and destroying hitbox.");