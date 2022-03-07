var atk = 49;

set_attack_value(atk, AG_CATEGORY, 2);
set_attack_value(atk, AG_SPRITE, sprite_get("dspecial_2"));
set_attack_value(atk, AG_NUM_WINDOWS, 5);
set_attack_value(atk, AG_HAS_LANDING_LAG, 4);
set_attack_value(atk, AG_OFF_LEDGE, 1);
set_attack_value(atk, AG_HURTBOX_SPRITE, sprite_get("empty_sprite"));
set_attack_value(atk, AG_MUNO_ATTACK_NAME, "Final Smash");
set_attack_value(atk, AG_MUNO_ATTACK_MISC_ADD, "Requires the Final Smash Buddy to use.");

set_window_value(atk, 1, AG_WINDOW_LENGTH, 18);
set_window_value(atk, 1, AG_WINDOW_ANIM_FRAMES, 6);
set_window_value(atk, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(atk, 1, AG_WINDOW_SFX, sfx_dbfz_teleport);
set_window_value(atk, 1, AG_WINDOW_SFX_FRAME, 12);
set_window_value(atk, 1, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);

set_window_value(atk, 2, AG_WINDOW_TYPE, 7);
set_window_value(atk, 2, AG_WINDOW_LENGTH, 10);
set_window_value(atk, 2, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(atk, 2, AG_WINDOW_ANIM_FRAME_START, 7);
set_window_value(atk, 2, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);

// startup
set_window_value(atk, 3, AG_WINDOW_LENGTH, 8);
set_window_value(atk, 3, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(atk, 3, AG_WINDOW_HAS_SFX, 1);
set_window_value(atk, 3, AG_WINDOW_SFX, sfx_dbfz_sbomb_fire);

// charging
set_window_value(atk, 4, AG_WINDOW_LENGTH, 16);
set_window_value(atk, 4, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(atk, 4, AG_WINDOW_ANIM_FRAME_START, 2);

// endlag
set_window_value(atk, 5, AG_WINDOW_LENGTH, 16);
set_window_value(atk, 5, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(atk, 5, AG_WINDOW_ANIM_FRAME_START, 6);

set_num_hitboxes(atk, 1);

set_hitbox_value(atk, 1, HG_HITBOX_TYPE, 2);
set_hitbox_value(atk, 1, HG_WINDOW, 5);
set_hitbox_value(atk, 1, HG_LIFETIME, 300);
set_hitbox_value(atk, 1, HG_HITBOX_X, 40);
set_hitbox_value(atk, 1, HG_HITBOX_Y, -440);
set_hitbox_value(atk, 1, HG_WIDTH, 800);
set_hitbox_value(atk, 1, HG_HEIGHT, 800);
set_hitbox_value(atk, 1, HG_PRIORITY, 1);
set_hitbox_value(atk, 1, HG_DAMAGE, 5);
set_hitbox_value(atk, 1, HG_ANGLE, 40);
set_hitbox_value(atk, 1, HG_BASE_KNOCKBACK, 12);
set_hitbox_value(atk, 1, HG_KNOCKBACK_SCALING, 1.0);
set_hitbox_value(atk, 1, HG_BASE_HITPAUSE, 2);
set_hitbox_value(atk, 1, HG_EXTRA_HITPAUSE, 0);
set_hitbox_value(atk, 1, HG_HITPAUSE_SCALING, 0);
set_hitbox_value(atk, 1, HG_HIT_SFX, sfx_dbfz_hit_medium);
set_hitbox_value(atk, 1, HG_SDI_MULTIPLIER, 0.001);
set_hitbox_value(atk, 1, HG_MUNO_HITBOX_NAME, "Projectile");

set_hitbox_value(atk, 1, HG_PROJECTILE_SPRITE, sprite_get("super_spirit_bomb"));
set_hitbox_value(atk, 1, HG_PROJECTILE_ANIM_SPEED, 0.4);
set_hitbox_value(atk, 1, HG_PROJECTILE_MASK, -1);
set_hitbox_value(atk, 1, HG_PROJECTILE_HSPEED, 20);
set_hitbox_value(atk, 1, HG_PROJECTILE_VSPEED, 20);
set_hitbox_value(atk, 1, HG_PROJECTILE_GROUND_BEHAVIOR, 1);
set_hitbox_value(atk, 1, HG_PROJECTILE_WALL_BEHAVIOR, 1);
set_hitbox_value(atk, 1, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
set_hitbox_value(atk, 1, HG_PROJECTILE_PLASMA_SAFE, 1);
set_hitbox_value(atk, 1, HG_PROJECTILE_IS_TRANSCENDENT, 1);