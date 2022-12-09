set_attack_value(AT_DSPECIAL_2, AG_CATEGORY, 2);
set_attack_value(AT_DSPECIAL_2, AG_SPRITE, sprite_get("dspecial_2"));
set_attack_value(AT_DSPECIAL_2, AG_NUM_WINDOWS, 3);
set_attack_value(AT_DSPECIAL_2, AG_HAS_LANDING_LAG, 4);
set_attack_value(AT_DSPECIAL_2, AG_OFF_LEDGE, 1);
set_attack_value(AT_DSPECIAL_2, AG_HURTBOX_SPRITE, hurtbox_spr);

// startup
set_window_value(AT_DSPECIAL_2, 1, AG_WINDOW_LENGTH, 8);
set_window_value(AT_DSPECIAL_2, 1, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_DSPECIAL_2, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_DSPECIAL_2, 1, AG_WINDOW_SFX, sfx_dbfz_sbomb_fire);
set_window_value(AT_DSPECIAL_2, 1, AG_MUNO_WINDOW_INVUL, -2);

// charging
set_window_value(AT_DSPECIAL_2, 2, AG_WINDOW_LENGTH, 16);
set_window_value(AT_DSPECIAL_2, 2, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(AT_DSPECIAL_2, 2, AG_WINDOW_ANIM_FRAME_START, 2);
set_window_value(AT_DSPECIAL_2, 2, AG_MUNO_WINDOW_INVUL, -2);

// endlag
set_window_value(AT_DSPECIAL_2, 3, AG_WINDOW_LENGTH, 16);
set_window_value(AT_DSPECIAL_2, 3, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(AT_DSPECIAL_2, 3, AG_WINDOW_ANIM_FRAME_START, 6);
set_window_value(AT_DSPECIAL_2, 3, AG_MUNO_WINDOW_INVUL, -2);

set_num_hitboxes(AT_DSPECIAL_2, 1);

set_hitbox_value(AT_DSPECIAL_2, 1, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_WINDOW, 3);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_LIFETIME, 60); // 30
set_hitbox_value(AT_DSPECIAL_2, 1, HG_HITBOX_X, 20);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_HITBOX_Y, -48);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_WIDTH, 48);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_HEIGHT, 48);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_PRIORITY, 1);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_DAMAGE, 2);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_ANGLE, 90);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_BASE_KNOCKBACK, 7);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_KNOCKBACK_SCALING, 0);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_BASE_HITPAUSE, 20);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_HITPAUSE_SCALING, 0);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_HIT_SFX, sfx_dbfz_sbomb_hit);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_SDI_MULTIPLIER, 0.001);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_MUNO_HITBOX_NAME, "Projectile");

set_hitbox_value(AT_DSPECIAL_2, 1, HG_PROJECTILE_SPRITE, sprite_get("sbomb_traveling"));
set_hitbox_value(AT_DSPECIAL_2, 1, HG_PROJECTILE_ANIM_SPEED, 0.4);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_PROJECTILE_MASK, -1);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_PROJECTILE_HSPEED, 20);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_PROJECTILE_VSPEED, 10);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_PROJECTILE_GROUND_BEHAVIOR, 1);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_PROJECTILE_WALL_BEHAVIOR, 1);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_PROJECTILE_IS_TRANSCENDENT, 1); // 0

set_hitbox_value(AT_DSPECIAL_2, 2, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_DSPECIAL_2, 2, HG_WINDOW, 3);
set_hitbox_value(AT_DSPECIAL_2, 2, HG_LIFETIME, 10);
set_hitbox_value(AT_DSPECIAL_2, 2, HG_WIDTH, 96);
set_hitbox_value(AT_DSPECIAL_2, 2, HG_HEIGHT, 96);
set_hitbox_value(AT_DSPECIAL_2, 2, HG_PRIORITY, 1);
set_hitbox_value(AT_DSPECIAL_2, 2, HG_DAMAGE, 3);
set_hitbox_value(AT_DSPECIAL_2, 2, HG_ANGLE, 90);
set_hitbox_value(AT_DSPECIAL_2, 2, HG_BASE_KNOCKBACK, 4);
set_hitbox_value(AT_DSPECIAL_2, 2, HG_KNOCKBACK_SCALING, 0);
set_hitbox_value(AT_DSPECIAL_2, 2, HG_BASE_HITPAUSE, 5);
set_hitbox_value(AT_DSPECIAL_2, 2, HG_HITPAUSE_SCALING, 0);
set_hitbox_value(AT_DSPECIAL_2, 2, HG_HIT_SFX, sfx_dbfz_hit_weak);
set_hitbox_value(AT_DSPECIAL_2, 2, HG_VISUAL_EFFECT, 304);
set_hitbox_value(AT_DSPECIAL_2, 2, HG_SDI_MULTIPLIER, 0.25);
set_hitbox_value(AT_DSPECIAL_2, 2, HG_MUNO_HITBOX_NAME, "Multihit");

set_hitbox_value(AT_DSPECIAL_2, 2, HG_PROJECTILE_SPRITE, sprite_get("sbomb_multihit"));
set_hitbox_value(AT_DSPECIAL_2, 2, HG_PROJECTILE_ANIM_SPEED, 0.4);
set_hitbox_value(AT_DSPECIAL_2, 2, HG_PROJECTILE_MASK, -1);
set_hitbox_value(AT_DSPECIAL_2, 2, HG_PROJECTILE_HSPEED, 0);
set_hitbox_value(AT_DSPECIAL_2, 2, HG_PROJECTILE_VSPEED, 0);
set_hitbox_value(AT_DSPECIAL_2, 2, HG_PROJECTILE_GROUND_BEHAVIOR, 1);
set_hitbox_value(AT_DSPECIAL_2, 2, HG_PROJECTILE_WALL_BEHAVIOR, 1);
set_hitbox_value(AT_DSPECIAL_2, 2, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
set_hitbox_value(AT_DSPECIAL_2, 2, HG_PROJECTILE_IS_TRANSCENDENT, 1);

set_hitbox_value(AT_DSPECIAL_2, 3, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_WINDOW, 3);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_LIFETIME, 10);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_WIDTH, 96);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_HEIGHT, 96);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_PRIORITY, 1);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_DAMAGE, 2);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_ANGLE, 270);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_TECHABLE, 2);
// set_hitbox_value(AT_DSPECIAL_2, 3, HG_ANGLE_FLIPPER, 7);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_BASE_KNOCKBACK, 7);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_KNOCKBACK_SCALING, 0.3); // 0.7
set_hitbox_value(AT_DSPECIAL_2, 3, HG_BASE_HITPAUSE, 15);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_HITPAUSE_SCALING, 0);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_HIT_SFX, sfx_dbfz_hit_broken);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_VISUAL_EFFECT, 304);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_MUNO_HITBOX_NAME, "Launcher");

set_hitbox_value(AT_DSPECIAL_2, 3, HG_PROJECTILE_SPRITE, sprite_get("sbomb_multihit"));
set_hitbox_value(AT_DSPECIAL_2, 3, HG_PROJECTILE_ANIM_SPEED, 0.4);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_PROJECTILE_MASK, -1);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_PROJECTILE_HSPEED, 0);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_PROJECTILE_VSPEED, 0);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_PROJECTILE_GROUND_BEHAVIOR, 1);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_PROJECTILE_WALL_BEHAVIOR, 1);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_PROJECTILE_IS_TRANSCENDENT, 1);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_PROJECTILE_ENEMY_BEHAVIOR, 0);