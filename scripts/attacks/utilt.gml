set_attack_value(AT_UTILT, AG_SPRITE, sprite_get("utilt"));
set_attack_value(AT_UTILT, AG_NUM_WINDOWS, 6);
set_attack_value(AT_UTILT, AG_HURTBOX_SPRITE, sprite_get("utilt_hurt"));

set_window_value(AT_UTILT, 1, AG_WINDOW_LENGTH, 8);
set_window_value(AT_UTILT, 1, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_UTILT, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_UTILT, 1, AG_WINDOW_SFX, sfx_dbfz_swipe_weak1);
set_window_value(AT_UTILT, 1, AG_WINDOW_SFX_FRAME, 6);

set_window_value(AT_UTILT, 2, AG_WINDOW_LENGTH, 3);
set_window_value(AT_UTILT, 2, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_UTILT, 2, AG_WINDOW_ANIM_FRAME_START, 2);

set_window_value(AT_UTILT, 3, AG_WINDOW_LENGTH, 12);
set_window_value(AT_UTILT, 3, AG_WINDOW_ANIM_FRAMES, 5);
set_window_value(AT_UTILT, 3, AG_WINDOW_ANIM_FRAME_START, 3);
set_window_value(AT_UTILT, 3, AG_WINDOW_HAS_WHIFFLAG, 1);

set_window_value(AT_UTILT, 4, AG_WINDOW_LENGTH, 8);
set_window_value(AT_UTILT, 4, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_UTILT, 4, AG_WINDOW_ANIM_FRAME_START, 8);
set_window_value(AT_UTILT, 4, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_UTILT, 4, AG_WINDOW_SFX, sfx_dbfz_swipe_weak2);
set_window_value(AT_UTILT, 4, AG_WINDOW_SFX_FRAME, 6);

set_window_value(AT_UTILT, 5, AG_WINDOW_LENGTH, 3);
set_window_value(AT_UTILT, 5, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_UTILT, 5, AG_WINDOW_ANIM_FRAME_START, 10);

set_window_value(AT_UTILT, 6, AG_WINDOW_LENGTH, 15);
set_window_value(AT_UTILT, 6, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_UTILT, 6, AG_WINDOW_ANIM_FRAME_START, 11);
set_window_value(AT_UTILT, 6, AG_WINDOW_HAS_WHIFFLAG, 1);

set_num_hitboxes(AT_UTILT, 2);

set_hitbox_value(AT_UTILT, 1, HG_MUNO_HITBOX_NAME, "Melee");

set_hitbox_value(AT_UTILT, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_UTILT, 1, HG_WINDOW, 2);
set_hitbox_value(AT_UTILT, 1, HG_LIFETIME, 3);
set_hitbox_value(AT_UTILT, 1, HG_HITBOX_X, 16);
set_hitbox_value(AT_UTILT, 1, HG_HITBOX_Y, -48);
set_hitbox_value(AT_UTILT, 1, HG_WIDTH, 48);
set_hitbox_value(AT_UTILT, 1, HG_HEIGHT, 96);
set_hitbox_value(AT_UTILT, 1, HG_PRIORITY, 2);
set_hitbox_value(AT_UTILT, 1, HG_DAMAGE, 6);
set_hitbox_value(AT_UTILT, 1, HG_ANGLE, 80);
set_hitbox_value(AT_UTILT, 1, HG_BASE_KNOCKBACK, 9);
set_hitbox_value(AT_UTILT, 1, HG_KNOCKBACK_SCALING, .5);
set_hitbox_value(AT_UTILT, 1, HG_BASE_HITPAUSE, 9);
set_hitbox_value(AT_UTILT, 1, HG_HITPAUSE_SCALING, .5);
set_hitbox_value(AT_UTILT, 1, HG_HIT_SFX, sfx_dbfz_hit_medium);
set_hitbox_value(AT_UTILT, 1, HG_HITBOX_GROUP, 1);
set_hitbox_value(AT_UTILT, 1, HG_HIT_LOCKOUT, 7);

set_hitbox_value(AT_UTILT, 2, HG_MUNO_HITBOX_NAME, "Melee (Stomp)");

set_hitbox_value(AT_UTILT, 2, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_UTILT, 2, HG_WINDOW, 5);
set_hitbox_value(AT_UTILT, 2, HG_LIFETIME, 3);
set_hitbox_value(AT_UTILT, 2, HG_HITBOX_X, 32);
set_hitbox_value(AT_UTILT, 2, HG_HITBOX_Y, -16);
set_hitbox_value(AT_UTILT, 2, HG_WIDTH, 48);
set_hitbox_value(AT_UTILT, 2, HG_HEIGHT, 32);
set_hitbox_value(AT_UTILT, 2, HG_PRIORITY, 2);
set_hitbox_value(AT_UTILT, 2, HG_DAMAGE, 2);
set_hitbox_value(AT_UTILT, 2, HG_ANGLE, 45);
set_hitbox_value(AT_UTILT, 2, HG_BASE_KNOCKBACK, 4);
set_hitbox_value(AT_UTILT, 2, HG_KNOCKBACK_SCALING, 0);
set_hitbox_value(AT_UTILT, 2, HG_BASE_HITPAUSE, 4);
set_hitbox_value(AT_UTILT, 2, HG_HITPAUSE_SCALING, 0);
set_hitbox_value(AT_UTILT, 2, HG_HIT_SFX, sfx_dbfz_hit_weak);
set_hitbox_value(AT_UTILT, 2, HG_HITBOX_GROUP, 2);

set_hitbox_value(AT_UTILT, 3, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_UTILT, 3, HG_WINDOW, 5);
set_hitbox_value(AT_UTILT, 3, HG_LIFETIME, 10);
set_hitbox_value(AT_UTILT, 3, HG_HITBOX_X, 96);
set_hitbox_value(AT_UTILT, 3, HG_HITBOX_Y, -48);
set_hitbox_value(AT_UTILT, 3, HG_WIDTH, 32);
set_hitbox_value(AT_UTILT, 3, HG_HEIGHT, 80);
set_hitbox_value(AT_UTILT, 3, HG_PRIORITY, 1);
set_hitbox_value(AT_UTILT, 3, HG_DAMAGE, 6);
set_hitbox_value(AT_UTILT, 3, HG_ANGLE, 90);
set_hitbox_value(AT_UTILT, 3, HG_BASE_KNOCKBACK, 8);
set_hitbox_value(AT_UTILT, 3, HG_KNOCKBACK_SCALING, .6);
set_hitbox_value(AT_UTILT, 3, HG_BASE_HITPAUSE, 10);
set_hitbox_value(AT_UTILT, 3, HG_HITPAUSE_SCALING, .55);
set_hitbox_value(AT_UTILT, 3, HG_HIT_SFX, sfx_dbfz_hit_kidan);
set_hitbox_value(AT_UTILT, 3, HG_MUNO_HITBOX_NAME, "Projectile");

set_hitbox_value(AT_UTILT, 3, HG_PROJECTILE_SPRITE, sprite_get("utilt_proj"));
set_hitbox_value(AT_UTILT, 3, HG_PROJECTILE_ANIM_SPEED, 0.4);
set_hitbox_value(AT_UTILT, 3, HG_PROJECTILE_MASK, -1);
set_hitbox_value(AT_UTILT, 3, HG_PROJECTILE_HSPEED, 0);
set_hitbox_value(AT_UTILT, 3, HG_PROJECTILE_VSPEED, -20);
set_hitbox_value(AT_UTILT, 3, HG_PROJECTILE_WALL_BEHAVIOR, 1);
set_hitbox_value(AT_UTILT, 3, HG_PROJECTILE_GROUND_BEHAVIOR, 1);
set_hitbox_value(AT_UTILT, 3, HG_PROJECTILE_DOES_NOT_REFLECT, 1);
set_hitbox_value(AT_UTILT, 3, HG_PROJECTILE_PARRY_STUN, 1);

if !has_rune("B") exit;

set_hitbox_value(AT_UTILT, 3, HG_DAMAGE, 10);
set_hitbox_value(AT_UTILT, 3, HG_ANGLE, 90);
set_hitbox_value(AT_UTILT, 3, HG_BASE_KNOCKBACK, 9);
set_hitbox_value(AT_UTILT, 3, HG_KNOCKBACK_SCALING, .9);
set_hitbox_value(AT_UTILT, 3, HG_BASE_HITPAUSE, 16);
set_hitbox_value(AT_UTILT, 3, HG_HITPAUSE_SCALING, .8);
set_hitbox_value(AT_UTILT, 3, HG_HIT_SFX, sfx_dbfz_hit_strong);
set_hitbox_value(AT_UTILT, 3, HG_PROJECTILE_VSPEED, -40);