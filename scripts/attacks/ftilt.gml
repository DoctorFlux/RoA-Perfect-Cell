set_attack_value(AT_FTILT, AG_SPRITE, sprite_get("ftilt"));
set_attack_value(AT_FTILT, AG_NUM_WINDOWS, 3);
set_attack_value(AT_FTILT, AG_HURTBOX_SPRITE, sprite_get("ftilt_hurt"));

set_window_value(AT_FTILT, 1, AG_WINDOW_LENGTH, 12);
set_window_value(AT_FTILT, 1, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_FTILT, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_FTILT, 1, AG_WINDOW_SFX, sfx_dbfz_kidan_fire);
set_window_value(AT_FTILT, 1, AG_WINDOW_SFX_FRAME, 10);

set_window_value(AT_FTILT, 2, AG_WINDOW_LENGTH, 3);
set_window_value(AT_FTILT, 2, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_FTILT, 2, AG_WINDOW_ANIM_FRAME_START, 3);

set_window_value(AT_FTILT, 3, AG_WINDOW_LENGTH, 16);
set_window_value(AT_FTILT, 3, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(AT_FTILT, 3, AG_WINDOW_ANIM_FRAME_START, 4);
set_window_value(AT_FTILT, 3, AG_WINDOW_HAS_WHIFFLAG, 0);

set_num_hitboxes(AT_FTILT, 2);

set_hitbox_value(AT_FTILT, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_FTILT, 1, HG_WINDOW, 2);
set_hitbox_value(AT_FTILT, 1, HG_LIFETIME, 3);
set_hitbox_value(AT_FTILT, 1, HG_HITBOX_X, 24);
set_hitbox_value(AT_FTILT, 1, HG_HITBOX_Y, -40);
set_hitbox_value(AT_FTILT, 1, HG_WIDTH, 64);
set_hitbox_value(AT_FTILT, 1, HG_HEIGHT, 80);
set_hitbox_value(AT_FTILT, 1, HG_SHAPE, 2);
set_hitbox_value(AT_FTILT, 1, HG_PRIORITY, 2);
set_hitbox_value(AT_FTILT, 1, HG_DAMAGE, 2);
set_hitbox_value(AT_FTILT, 1, HG_ANGLE, 361);
set_hitbox_value(AT_FTILT, 1, HG_BASE_KNOCKBACK, 8);
set_hitbox_value(AT_FTILT, 1, HG_BASE_HITPAUSE, 7);
set_hitbox_value(AT_FTILT, 1, HG_HITSTUN_MULTIPLIER, 0.7);
set_hitbox_value(AT_FTILT, 1, HG_HIT_SFX, sfx_dbfz_hit_medium);
set_hitbox_value(AT_FTILT, 1, HG_HITBOX_GROUP, 2);
set_hitbox_value(AT_FTILT, 1, HG_VISUAL_EFFECT_X_OFFSET, 16);
set_hitbox_value(AT_FTILT, 1, HG_MUNO_HITBOX_NAME, "Melee");

set_hitbox_value(AT_FTILT, 2, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_FTILT, 2, HG_WINDOW, 3);
// set_hitbox_value(AT_FTILT, 2, HG_WINDOW_CREATION_FRAME, 1);
set_hitbox_value(AT_FTILT, 2, HG_LIFETIME, 16); // 10
set_hitbox_value(AT_FTILT, 2, HG_HITBOX_X, 40); // 20
set_hitbox_value(AT_FTILT, 2, HG_HITBOX_Y, -48);
set_hitbox_value(AT_FTILT, 2, HG_WIDTH, 32);
set_hitbox_value(AT_FTILT, 2, HG_HEIGHT, 24);
set_hitbox_value(AT_FTILT, 2, HG_PRIORITY, 1);
set_hitbox_value(AT_FTILT, 2, HG_DAMAGE, 5);
set_hitbox_value(AT_FTILT, 2, HG_ANGLE, 80);
set_hitbox_value(AT_FTILT, 2, HG_BASE_KNOCKBACK, 7);
set_hitbox_value(AT_FTILT, 2, HG_KNOCKBACK_SCALING, .3);
set_hitbox_value(AT_FTILT, 2, HG_BASE_HITPAUSE, 10);
set_hitbox_value(AT_FTILT, 2, HG_HITPAUSE_SCALING, .4);
set_hitbox_value(AT_FTILT, 2, HG_HIT_SFX, sfx_dbfz_hit_kidan);
set_hitbox_value(AT_FTILT, 2, HG_MUNO_HITBOX_NAME, "Projectile");

set_hitbox_value(AT_FTILT, 2, HG_PROJECTILE_SPRITE, sprite_get("ftilt_proj"));
set_hitbox_value(AT_FTILT, 2, HG_PROJECTILE_ANIM_SPEED, 0.4);
set_hitbox_value(AT_FTILT, 2, HG_PROJECTILE_MASK, -1);
set_hitbox_value(AT_FTILT, 2, HG_PROJECTILE_HSPEED, 18); // 25
set_hitbox_value(AT_FTILT, 2, HG_PROJECTILE_VSPEED, 0);

if !has_rune("A") exit;

set_hitbox_value(AT_FTILT, 2, HG_DAMAGE, 10);
set_hitbox_value(AT_FTILT, 2, HG_ANGLE, 40);
set_hitbox_value(AT_FTILT, 2, HG_BASE_KNOCKBACK, 9);
set_hitbox_value(AT_FTILT, 2, HG_KNOCKBACK_SCALING, .6);
set_hitbox_value(AT_FTILT, 2, HG_BASE_HITPAUSE, 16);
set_hitbox_value(AT_FTILT, 2, HG_HITPAUSE_SCALING, .8);
set_hitbox_value(AT_FTILT, 2, HG_HIT_SFX, sfx_dbfz_hit_strong);
set_hitbox_value(AT_FTILT, 2, HG_PROJECTILE_HSPEED, 40);