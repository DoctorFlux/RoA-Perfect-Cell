set_attack_value(AT_EXTRA_1, AG_SPRITE, sprite_get("walk"));
set_attack_value(AT_EXTRA_1, AG_NUM_WINDOWS, 1);
set_attack_value(AT_EXTRA_1, AG_OFF_LEDGE, 1);
set_attack_value(AT_EXTRA_1, AG_CATEGORY, 2);
set_attack_value(AT_EXTRA_1, AG_HURTBOX_SPRITE, hurtbox_spr);
set_attack_value(AT_EXTRA_1, AG_MUNO_ATTACK_EXCLUDE, 1);

set_window_value(AT_EXTRA_1, 1, AG_WINDOW_LENGTH, 36);
set_window_value(AT_EXTRA_1, 1, AG_WINDOW_ANIM_FRAMES, 8);
set_window_value(AT_EXTRA_1, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_EXTRA_1, 1, AG_WINDOW_SFX, sfx_dbfz_teleport);
set_window_value(AT_EXTRA_1, 1, AG_WINDOW_SFX_FRAME, 0);

set_num_hitboxes(AT_EXTRA_1, 1);

set_hitbox_value(AT_EXTRA_1, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_EXTRA_1, 1, HG_WINDOW, 1);
set_hitbox_value(AT_EXTRA_1, 1, HG_WINDOW_CREATION_FRAME, 4);
set_hitbox_value(AT_EXTRA_1, 1, HG_LIFETIME, 1);
set_hitbox_value(AT_EXTRA_1, 1, HG_HITBOX_X, 0);
set_hitbox_value(AT_EXTRA_1, 1, HG_HITBOX_Y, -32);
set_hitbox_value(AT_EXTRA_1, 1, HG_WIDTH, 128);
set_hitbox_value(AT_EXTRA_1, 1, HG_HEIGHT, 128);
set_hitbox_value(AT_EXTRA_1, 1, HG_SHAPE, 0);
set_hitbox_value(AT_EXTRA_1, 1, HG_PRIORITY, 2);
set_hitbox_value(AT_EXTRA_1, 1, HG_DAMAGE, 0);
set_hitbox_value(AT_EXTRA_1, 1, HG_EXTRA_HITPAUSE, 60);
set_hitbox_value(AT_EXTRA_1, 1, HG_BASE_KNOCKBACK, 1);