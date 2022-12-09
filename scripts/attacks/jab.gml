set_attack_value(AT_JAB, AG_SPRITE, sprite_get("jab"));
set_attack_value(AT_JAB, AG_NUM_WINDOWS, 3);
set_attack_value(AT_JAB, AG_HURTBOX_SPRITE, sprite_get("jab_hurt"));

set_window_value(AT_JAB, 1, AG_WINDOW_LENGTH, 9);
set_window_value(AT_JAB, 1, AG_WINDOW_ANIM_FRAMES, 3);

set_window_value(AT_JAB, 2, AG_WINDOW_LENGTH, 4);
set_window_value(AT_JAB, 2, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_JAB, 2, AG_WINDOW_ANIM_FRAME_START, 3);

set_window_value(AT_JAB, 3, AG_WINDOW_LENGTH, 9);
set_window_value(AT_JAB, 3, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_JAB, 3, AG_WINDOW_ANIM_FRAME_START, 4);

set_num_hitboxes(AT_JAB, 1);

set_hitbox_value(AT_JAB, 1, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_JAB, 1, HG_PROJECTILE_SPRITE, sprite_get("jab_proj"));
set_hitbox_value(AT_JAB, 1, HG_PROJECTILE_ANIM_SPEED, 2);
set_hitbox_value(AT_JAB, 1, HG_PROJECTILE_MASK, -1);
set_hitbox_value(AT_JAB, 1, HG_HITBOX_X, 30);
set_hitbox_value(AT_JAB, 1, HG_HITBOX_Y, -56);
set_hitbox_value(AT_JAB, 1, HG_PROJECTILE_VSPEED, 15);
set_hitbox_value(AT_JAB, 1, HG_PROJECTILE_HSPEED, 20);
set_hitbox_value(AT_JAB, 1, HG_HITBOX_GROUP, -1);
set_hitbox_value(AT_JAB, 1, HG_WINDOW, 2);
set_hitbox_value(AT_JAB, 1, HG_WINDOW_CREATION_FRAME, 1);
set_hitbox_value(AT_JAB, 1, HG_PROJECTILE_WALL_BEHAVIOR, 0);
set_hitbox_value(AT_JAB, 1, HG_PROJECTILE_GROUND_BEHAVIOR, 0);
set_hitbox_value(AT_JAB, 1, HG_PROJECTILE_ENEMY_BEHAVIOR, 0);
set_hitbox_value(AT_JAB, 1, HG_LIFETIME, 10);
set_hitbox_value(AT_JAB, 1, HG_WIDTH, 20);
set_hitbox_value(AT_JAB, 1, HG_HEIGHT, 20);
set_hitbox_value(AT_JAB, 1, HG_PRIORITY, 3);
set_hitbox_value(AT_JAB, 1, HG_DAMAGE, 2);
set_hitbox_value(AT_JAB, 1, HG_ANGLE, 40);
set_hitbox_value(AT_JAB, 1, HG_VISUAL_EFFECT, 140);
set_hitbox_value(AT_JAB, 1, HG_PROJECTILE_DESTROY_EFFECT, 140);
set_hitbox_value(AT_JAB, 1, HG_BASE_KNOCKBACK, 6);
set_hitbox_value(AT_JAB, 1, HG_BASE_HITPAUSE, 4);
