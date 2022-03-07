set_attack_value(AT_USTRONG, AG_CATEGORY, 2);
set_attack_value(AT_USTRONG, AG_SPRITE, sprite_get("ustrong"));
set_attack_value(AT_USTRONG, AG_NUM_WINDOWS, 4);
set_attack_value(AT_USTRONG, AG_HAS_LANDING_LAG, 1);
set_attack_value(AT_USTRONG, AG_LANDING_LAG, 8);
set_attack_value(AT_USTRONG, AG_STRONG_CHARGE_WINDOW, 1);
set_attack_value(AT_USTRONG, AG_HURTBOX_SPRITE, sprite_get("ustrong_hurt"));

set_window_value(AT_USTRONG, 1, AG_WINDOW_LENGTH, 6);
set_window_value(AT_USTRONG, 1, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_USTRONG, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_USTRONG, 1, AG_WINDOW_SFX, asset_get("sfx_ori_ustrong_charge"));

set_window_value(AT_USTRONG, 2, AG_WINDOW_LENGTH, 6);
set_window_value(AT_USTRONG, 2, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_USTRONG, 2, AG_WINDOW_ANIM_FRAME_START, 2);
set_window_value(AT_USTRONG, 2, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_USTRONG, 2, AG_WINDOW_SFX, sfx_dbfz_elbow);
set_window_value(AT_USTRONG, 2, AG_WINDOW_SFX_FRAME, 2);

set_window_value(AT_USTRONG, 3, AG_WINDOW_LENGTH, 3);
set_window_value(AT_USTRONG, 3, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_USTRONG, 3, AG_WINDOW_ANIM_FRAME_START, 4);

set_window_value(AT_USTRONG, 4, AG_WINDOW_LENGTH, 15);
set_window_value(AT_USTRONG, 4, AG_WINDOW_ANIM_FRAMES, 5);
set_window_value(AT_USTRONG, 4, AG_WINDOW_ANIM_FRAME_START, 5);
set_window_value(AT_USTRONG, 4, AG_WINDOW_HAS_WHIFFLAG, 1);

set_num_hitboxes(AT_USTRONG, 1);

set_hitbox_value(AT_USTRONG, 1, HG_MUNO_HITBOX_NAME, "Normal");
set_hitbox_value(AT_USTRONG, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_USTRONG, 1, HG_WINDOW, 3);
set_hitbox_value(AT_USTRONG, 1, HG_LIFETIME, 3);
set_hitbox_value(AT_USTRONG, 1, HG_HITBOX_X, 16);
set_hitbox_value(AT_USTRONG, 1, HG_HITBOX_Y, -64);
set_hitbox_value(AT_USTRONG, 1, HG_WIDTH, 48);
set_hitbox_value(AT_USTRONG, 1, HG_HEIGHT, 110);
set_hitbox_value(AT_USTRONG, 1, HG_SHAPE, 0);
set_hitbox_value(AT_USTRONG, 1, HG_PRIORITY, 1);
set_hitbox_value(AT_USTRONG, 1, HG_DAMAGE, 9);
set_hitbox_value(AT_USTRONG, 1, HG_ANGLE, 90);
set_hitbox_value(AT_USTRONG, 1, HG_BASE_KNOCKBACK, 9);
set_hitbox_value(AT_USTRONG, 1, HG_KNOCKBACK_SCALING, 1.05); // 0.9
set_hitbox_value(AT_USTRONG, 1, HG_BASE_HITPAUSE, 11);
set_hitbox_value(AT_USTRONG, 1, HG_HITPAUSE_SCALING, .5);
set_hitbox_value(AT_USTRONG, 1, HG_VISUAL_EFFECT, 304);
set_hitbox_value(AT_USTRONG, 1, HG_VISUAL_EFFECT_Y_OFFSET, -10);
set_hitbox_value(AT_USTRONG, 1, HG_HIT_SFX, sfx_dbfz_hit_strong);
set_hitbox_value(AT_USTRONG, 1, HG_HIT_LOCKOUT, 10);

set_hitbox_value(AT_USTRONG, 2, HG_MUNO_HITBOX_NAME, "SSJ");
set_hitbox_value(AT_USTRONG, 2, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_USTRONG, 2, HG_WINDOW, 3);
set_hitbox_value(AT_USTRONG, 2, HG_LIFETIME, 3);
set_hitbox_value(AT_USTRONG, 2, HG_HITBOX_X, 16);
set_hitbox_value(AT_USTRONG, 2, HG_HITBOX_Y, -64);
set_hitbox_value(AT_USTRONG, 2, HG_WIDTH, 48);
set_hitbox_value(AT_USTRONG, 2, HG_HEIGHT, 110);
set_hitbox_value(AT_USTRONG, 2, HG_SHAPE, 0);
set_hitbox_value(AT_USTRONG, 2, HG_PRIORITY, 2);
set_hitbox_value(AT_USTRONG, 2, HG_DAMAGE, 9);
set_hitbox_value(AT_USTRONG, 2, HG_ANGLE, 90);
set_hitbox_value(AT_USTRONG, 2, HG_BASE_KNOCKBACK, 9);
set_hitbox_value(AT_USTRONG, 2, HG_KNOCKBACK_SCALING, 1.3); // 1.2
set_hitbox_value(AT_USTRONG, 2, HG_BASE_HITPAUSE, 11);
set_hitbox_value(AT_USTRONG, 2, HG_HITPAUSE_SCALING, .5);
set_hitbox_value(AT_USTRONG, 2, HG_VISUAL_EFFECT, 304);
set_hitbox_value(AT_USTRONG, 2, HG_VISUAL_EFFECT_Y_OFFSET, -10);
set_hitbox_value(AT_USTRONG, 2, HG_HIT_SFX, sfx_dbfz_hit_broken);
set_hitbox_value(AT_USTRONG, 2, HG_HIT_LOCKOUT, 10);

if !has_rune("F") exit;


set_hitbox_value(AT_USTRONG, 1, HG_DAMAGE, 13);
set_hitbox_value(AT_USTRONG, 1, HG_BASE_KNOCKBACK, 10);
set_hitbox_value(AT_USTRONG, 1, HG_KNOCKBACK_SCALING, 1.1);
set_hitbox_value(AT_USTRONG, 1, HG_BASE_HITPAUSE, 16);
set_hitbox_value(AT_USTRONG, 1, HG_HITPAUSE_SCALING, .7);

set_hitbox_value(AT_USTRONG, 2, HG_DAMAGE, 13);
set_hitbox_value(AT_USTRONG, 2, HG_BASE_KNOCKBACK, 10);
set_hitbox_value(AT_USTRONG, 2, HG_KNOCKBACK_SCALING, 1.4);
set_hitbox_value(AT_USTRONG, 2, HG_BASE_HITPAUSE, 16);
set_hitbox_value(AT_USTRONG, 2, HG_HITPAUSE_SCALING, .7);