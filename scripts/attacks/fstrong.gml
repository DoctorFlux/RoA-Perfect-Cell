set_attack_value(AT_FSTRONG, AG_SPRITE, sprite_get("fstrong"));
set_attack_value(AT_FSTRONG, AG_NUM_WINDOWS, 4);
set_attack_value(AT_FSTRONG, AG_HAS_LANDING_LAG, 3);
set_attack_value(AT_FSTRONG, AG_STRONG_CHARGE_WINDOW, 1);
set_attack_value(AT_FSTRONG, AG_HURTBOX_SPRITE, sprite_get("fstrong_hurt"));

set_window_value(AT_FSTRONG, 1, AG_WINDOW_LENGTH, 12);
set_window_value(AT_FSTRONG, 1, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_FSTRONG, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_FSTRONG, 1, AG_WINDOW_SFX, asset_get("sfx_ori_ustrong_charge"));

set_window_value(AT_FSTRONG, 2, AG_WINDOW_LENGTH, 4);
set_window_value(AT_FSTRONG, 2, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_FSTRONG, 2, AG_WINDOW_ANIM_FRAME_START, 3);
set_window_value(AT_FSTRONG, 2, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_FSTRONG, 2, AG_WINDOW_SFX, sfx_dbfz_elbow);

set_window_value(AT_FSTRONG, 3, AG_WINDOW_LENGTH, 3);
set_window_value(AT_FSTRONG, 3, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_FSTRONG, 3, AG_WINDOW_ANIM_FRAME_START, 4);

set_window_value(AT_FSTRONG, 4, AG_WINDOW_LENGTH, 16);
set_window_value(AT_FSTRONG, 4, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(AT_FSTRONG, 4, AG_WINDOW_ANIM_FRAME_START, 5);
set_window_value(AT_FSTRONG, 4, AG_WINDOW_HAS_WHIFFLAG, 1);

set_num_hitboxes(AT_FSTRONG, 1);

set_hitbox_value(AT_FSTRONG, 1, HG_MUNO_HITBOX_NAME, "Normal");
set_hitbox_value(AT_FSTRONG, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_FSTRONG, 1, HG_WINDOW, 3);
set_hitbox_value(AT_FSTRONG, 1, HG_LIFETIME, 3);
set_hitbox_value(AT_FSTRONG, 1, HG_HITBOX_X, 24);
set_hitbox_value(AT_FSTRONG, 1, HG_HITBOX_Y, -40);
set_hitbox_value(AT_FSTRONG, 1, HG_WIDTH, 128);
set_hitbox_value(AT_FSTRONG, 1, HG_HEIGHT, 64);
set_hitbox_value(AT_FSTRONG, 1, HG_SHAPE, 2);
set_hitbox_value(AT_FSTRONG, 1, HG_PRIORITY, 1);
set_hitbox_value(AT_FSTRONG, 1, HG_DAMAGE, 10);
set_hitbox_value(AT_FSTRONG, 1, HG_ANGLE, 45);
set_hitbox_value(AT_FSTRONG, 1, HG_BASE_KNOCKBACK, 9);
set_hitbox_value(AT_FSTRONG, 1, HG_KNOCKBACK_SCALING, 1.05); // 0.9
set_hitbox_value(AT_FSTRONG, 1, HG_BASE_HITPAUSE, 14);
set_hitbox_value(AT_FSTRONG, 1, HG_HITPAUSE_SCALING, 0.9);
set_hitbox_value(AT_FSTRONG, 1, HG_VISUAL_EFFECT, 304);
set_hitbox_value(AT_FSTRONG, 1, HG_HIT_SFX, sfx_dbfz_hit_strong);
set_hitbox_value(AT_FSTRONG, 1, HG_HIT_LOCKOUT, 10);

set_hitbox_value(AT_FSTRONG, 2, HG_MUNO_HITBOX_NAME, "SSJ");
set_hitbox_value(AT_FSTRONG, 2, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_FSTRONG, 2, HG_WINDOW, 3);
set_hitbox_value(AT_FSTRONG, 2, HG_LIFETIME, 3);
set_hitbox_value(AT_FSTRONG, 2, HG_HITBOX_X, 24);
set_hitbox_value(AT_FSTRONG, 2, HG_HITBOX_Y, -40);
set_hitbox_value(AT_FSTRONG, 2, HG_WIDTH, 128);
set_hitbox_value(AT_FSTRONG, 2, HG_HEIGHT, 64);
set_hitbox_value(AT_FSTRONG, 2, HG_SHAPE, 2);
set_hitbox_value(AT_FSTRONG, 2, HG_PRIORITY, 2);
set_hitbox_value(AT_FSTRONG, 2, HG_DAMAGE, 10);
set_hitbox_value(AT_FSTRONG, 2, HG_ANGLE, 45);
set_hitbox_value(AT_FSTRONG, 2, HG_BASE_KNOCKBACK, 9);
set_hitbox_value(AT_FSTRONG, 2, HG_KNOCKBACK_SCALING, 1.3); // 1.2
set_hitbox_value(AT_FSTRONG, 2, HG_BASE_HITPAUSE, 14);
set_hitbox_value(AT_FSTRONG, 2, HG_HITPAUSE_SCALING, 0.9);
set_hitbox_value(AT_FSTRONG, 2, HG_VISUAL_EFFECT, 304);
set_hitbox_value(AT_FSTRONG, 2, HG_HIT_SFX, sfx_dbfz_hit_broken);
set_hitbox_value(AT_FSTRONG, 2, HG_HIT_LOCKOUT, 10);