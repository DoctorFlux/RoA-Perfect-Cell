set_attack_value(AT_FSPECIAL_AIR, AG_CATEGORY, 2);
set_attack_value(AT_FSPECIAL_AIR, AG_SPRITE, sprite_get("fspecialair"));
set_attack_value(AT_FSPECIAL_AIR, AG_NUM_WINDOWS, 3);
set_attack_value(AT_FSPECIAL_AIR, AG_HAS_LANDING_LAG, 1);
set_attack_value(AT_FSPECIAL_AIR, AG_OFF_LEDGE, 1);
set_attack_value(AT_FSPECIAL_AIR, AG_LANDING_LAG, 9);
set_attack_value(AT_FSPECIAL_AIR, AG_HURTBOX_SPRITE, sprite_get("fspecialair_hurt"));

set_window_value(AT_FSPECIAL_AIR, 2, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_FSPECIAL_AIR, 2, AG_WINDOW_SFX, sfx_dbfz_swipe_weak1);
set_window_value(AT_FSPECIAL_AIR, 2, AG_WINDOW_SFX_FRAME, 8);
set_window_value(AT_FSPECIAL_AIR, 1, AG_WINDOW_LENGTH, 9);
set_window_value(AT_FSPECIAL_AIR, 1, AG_WINDOW_ANIM_FRAMES, 3);

set_window_value(AT_FSPECIAL_AIR, 2, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_FSPECIAL_AIR, 2, AG_WINDOW_SFX, sfx_dbfz_kidan_fire);
set_window_value(AT_FSPECIAL_AIR, 2, AG_WINDOW_SFX_FRAME, 2);
set_window_value(AT_FSPECIAL_AIR, 2, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_FSPECIAL_AIR, 2, AG_WINDOW_SFX, sfx_dbfz_kidan_fire);
set_window_value(AT_FSPECIAL_AIR, 2, AG_WINDOW_SFX_FRAME, 8);
set_window_value(AT_FSPECIAL_AIR, 2, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_FSPECIAL_AIR, 2, AG_WINDOW_SFX, sfx_dbfz_kidan_fire);
set_window_value(AT_FSPECIAL_AIR, 2, AG_WINDOW_SFX_FRAME, 14);

set_window_value(AT_FSPECIAL_AIR, 2, AG_WINDOW_LENGTH, 20);
set_window_value(AT_FSPECIAL_AIR, 2, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_FSPECIAL_AIR, 2, AG_WINDOW_ANIM_FRAME_START, 3);
set_window_value(AT_FSPECIAL_AIR, 2, AG_WINDOW_HSPEED_TYPE, 1);
set_window_value(AT_FSPECIAL_AIR, 2, AG_WINDOW_VSPEED_TYPE, 1);
set_window_value(AT_FSPECIAL_AIR, 2, AG_WINDOW_HSPEED, 8);
set_window_value(AT_FSPECIAL_AIR, 2, AG_WINDOW_VSPEED, 2);

set_window_value(AT_FSPECIAL_AIR, 3, AG_WINDOW_LENGTH, 9);
set_window_value(AT_FSPECIAL_AIR, 3, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_FSPECIAL_AIR, 3, AG_WINDOW_ANIM_FRAME_START, 6);
set_window_value(AT_FSPECIAL_AIR, 3, AG_WINDOW_HAS_WHIFFLAG, 1);

set_num_hitboxes(AT_FSPECIAL_AIR, 3);

set_hitbox_value(AT_FSPECIAL_AIR, 1, HG_HIT_SFX, sfx_dbfz_hit_kidan);
set_hitbox_value(AT_FSPECIAL_AIR, 1, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_FSPECIAL_AIR, 1, HG_PROJECTILE_SPRITE, sprite_get("jab_proj"));
set_hitbox_value(AT_FSPECIAL_AIR, 1, HG_PROJECTILE_ANIM_SPEED, 2);
set_hitbox_value(AT_FSPECIAL_AIR, 1, HG_PROJECTILE_MASK, -1);
set_hitbox_value(AT_FSPECIAL_AIR, 1, HG_HITBOX_X, 30);
set_hitbox_value(AT_FSPECIAL_AIR, 1, HG_HITBOX_Y, -56);
set_hitbox_value(AT_FSPECIAL_AIR, 1, HG_PROJECTILE_VSPEED, 15);
set_hitbox_value(AT_FSPECIAL_AIR, 1, HG_PROJECTILE_HSPEED, 20);
set_hitbox_value(AT_FSPECIAL_AIR, 1, HG_HITBOX_GROUP, -1);
set_hitbox_value(AT_FSPECIAL_AIR, 1, HG_WINDOW, 2);
set_hitbox_value(AT_FSPECIAL_AIR, 1, HG_WINDOW_CREATION_FRAME, 2);
set_hitbox_value(AT_FSPECIAL_AIR, 1, HG_PROJECTILE_WALL_BEHAVIOR, 0);
set_hitbox_value(AT_FSPECIAL_AIR, 1, HG_PROJECTILE_GROUND_BEHAVIOR, 0);
set_hitbox_value(AT_FSPECIAL_AIR, 1, HG_PROJECTILE_ENEMY_BEHAVIOR, 0);
set_hitbox_value(AT_FSPECIAL_AIR, 1, HG_LIFETIME, 30);
set_hitbox_value(AT_FSPECIAL_AIR, 1, HG_WIDTH, 20);
set_hitbox_value(AT_FSPECIAL_AIR, 1, HG_HEIGHT, 20);
set_hitbox_value(AT_FSPECIAL_AIR, 1, HG_PRIORITY, 3);
set_hitbox_value(AT_FSPECIAL_AIR, 1, HG_DAMAGE, 4);
set_hitbox_value(AT_FSPECIAL_AIR, 1, HG_ANGLE, 60);
set_hitbox_value(AT_FSPECIAL_AIR, 1, HG_BASE_KNOCKBACK, 6);
set_hitbox_value(AT_FSPECIAL_AIR, 1, HG_KNOCKBACK_SCALING, .6);
set_hitbox_value(AT_FSPECIAL_AIR, 1, HG_BASE_HITPAUSE, 6);
set_hitbox_value(AT_FSPECIAL_AIR, 1, HG_HITPAUSE_SCALING, .4);
set_hitbox_value(AT_FSPECIAL_AIR, 1, HG_PROJECTILE_DESTROY_EFFECT, -1);

set_hitbox_value(AT_FSPECIAL_AIR, 2, HG_HIT_SFX, sfx_dbfz_hit_kidan);
set_hitbox_value(AT_FSPECIAL_AIR, 2, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_FSPECIAL_AIR, 2, HG_PROJECTILE_SPRITE, sprite_get("jab_proj"));
set_hitbox_value(AT_FSPECIAL_AIR, 2, HG_PROJECTILE_ANIM_SPEED, 2);
set_hitbox_value(AT_FSPECIAL_AIR, 2, HG_PROJECTILE_MASK, -1);
set_hitbox_value(AT_FSPECIAL_AIR, 2, HG_HITBOX_X, 30);
set_hitbox_value(AT_FSPECIAL_AIR, 2, HG_HITBOX_Y, -56);
set_hitbox_value(AT_FSPECIAL_AIR, 2, HG_PROJECTILE_VSPEED, 15);
set_hitbox_value(AT_FSPECIAL_AIR, 2, HG_PROJECTILE_HSPEED, 20);
set_hitbox_value(AT_FSPECIAL_AIR, 2, HG_HITBOX_GROUP, -1);
set_hitbox_value(AT_FSPECIAL_AIR, 2, HG_WINDOW, 2);
set_hitbox_value(AT_FSPECIAL_AIR, 2, HG_WINDOW_CREATION_FRAME, 8);
set_hitbox_value(AT_FSPECIAL_AIR, 2, HG_PROJECTILE_WALL_BEHAVIOR, 0);
set_hitbox_value(AT_FSPECIAL_AIR, 2, HG_PROJECTILE_GROUND_BEHAVIOR, 0);
set_hitbox_value(AT_FSPECIAL_AIR, 2, HG_PROJECTILE_ENEMY_BEHAVIOR, 0);
set_hitbox_value(AT_FSPECIAL_AIR, 2, HG_LIFETIME, 30);
set_hitbox_value(AT_FSPECIAL_AIR, 2, HG_WIDTH, 20);
set_hitbox_value(AT_FSPECIAL_AIR, 2, HG_HEIGHT, 20);
set_hitbox_value(AT_FSPECIAL_AIR, 2, HG_PRIORITY, 3);
set_hitbox_value(AT_FSPECIAL_AIR, 2, HG_DAMAGE, 4);
set_hitbox_value(AT_FSPECIAL_AIR, 2, HG_ANGLE, 60);
set_hitbox_value(AT_FSPECIAL_AIR, 2, HG_BASE_KNOCKBACK, 6);
set_hitbox_value(AT_FSPECIAL_AIR, 2, HG_KNOCKBACK_SCALING, .6);
set_hitbox_value(AT_FSPECIAL_AIR, 2, HG_BASE_HITPAUSE, 6);
set_hitbox_value(AT_FSPECIAL_AIR, 2, HG_HITPAUSE_SCALING, .4);
set_hitbox_value(AT_FSPECIAL_AIR, 2, HG_PROJECTILE_DESTROY_EFFECT, -1);

set_hitbox_value(AT_FSPECIAL_AIR, 3, HG_HIT_SFX, sfx_dbfz_hit_kidan);
set_hitbox_value(AT_FSPECIAL_AIR, 3, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_FSPECIAL_AIR, 3, HG_PROJECTILE_SPRITE, sprite_get("jab_proj"));
set_hitbox_value(AT_FSPECIAL_AIR, 3, HG_PROJECTILE_ANIM_SPEED, 2);
set_hitbox_value(AT_FSPECIAL_AIR, 3, HG_PROJECTILE_MASK, -1);
set_hitbox_value(AT_FSPECIAL_AIR, 3, HG_HITBOX_X, 30);
set_hitbox_value(AT_FSPECIAL_AIR, 3, HG_HITBOX_Y, -56);
set_hitbox_value(AT_FSPECIAL_AIR, 3, HG_PROJECTILE_VSPEED, 15);
set_hitbox_value(AT_FSPECIAL_AIR, 3, HG_PROJECTILE_HSPEED, 20);
set_hitbox_value(AT_FSPECIAL_AIR, 3, HG_HITBOX_GROUP, -1);
set_hitbox_value(AT_FSPECIAL_AIR, 3, HG_WINDOW, 2);
set_hitbox_value(AT_FSPECIAL_AIR, 3, HG_WINDOW_CREATION_FRAME, 14);
set_hitbox_value(AT_FSPECIAL_AIR, 3, HG_PROJECTILE_WALL_BEHAVIOR, 0);
set_hitbox_value(AT_FSPECIAL_AIR, 3, HG_PROJECTILE_GROUND_BEHAVIOR, 0);
set_hitbox_value(AT_FSPECIAL_AIR, 3, HG_PROJECTILE_ENEMY_BEHAVIOR, 0);
set_hitbox_value(AT_FSPECIAL_AIR, 3, HG_LIFETIME, 30);
set_hitbox_value(AT_FSPECIAL_AIR, 3, HG_WIDTH, 20);
set_hitbox_value(AT_FSPECIAL_AIR, 3, HG_HEIGHT, 20);
set_hitbox_value(AT_FSPECIAL_AIR, 3, HG_PRIORITY, 3);
set_hitbox_value(AT_FSPECIAL_AIR, 3, HG_DAMAGE, 4);
set_hitbox_value(AT_FSPECIAL_AIR, 3, HG_ANGLE, 60);
set_hitbox_value(AT_FSPECIAL_AIR, 3, HG_BASE_KNOCKBACK, 6);
set_hitbox_value(AT_FSPECIAL_AIR, 3, HG_KNOCKBACK_SCALING, .6);
set_hitbox_value(AT_FSPECIAL_AIR, 3, HG_BASE_HITPAUSE, 6);
set_hitbox_value(AT_FSPECIAL_AIR, 3, HG_HITPAUSE_SCALING, .4);
set_hitbox_value(AT_FSPECIAL_AIR, 3, HG_PROJECTILE_DESTROY_EFFECT, -1);
