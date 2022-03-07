set_attack_value(AT_NSPECIAL, AG_CATEGORY, 2);
set_attack_value(AT_NSPECIAL, AG_SPRITE, sprite_get("nspecial"));
set_attack_value(AT_NSPECIAL, AG_NUM_WINDOWS, 8);
set_attack_value(AT_NSPECIAL, AG_HAS_LANDING_LAG, 4);
set_attack_value(AT_NSPECIAL, AG_OFF_LEDGE, 1);
set_attack_value(AT_NSPECIAL, AG_AIR_SPRITE, sprite_get("nspecial_air"));
set_attack_value(AT_NSPECIAL, AG_HURTBOX_SPRITE, hurtbox_spr);
set_attack_value(AT_NSPECIAL, AG_MUNO_ATTACK_COOLDOWN, 120);
set_attack_value(AT_NSPECIAL, AG_MUNO_ATTACK_CD_SPECIAL, 1);
set_attack_value(AT_NSPECIAL, AG_MUNO_ATTACK_MISC_ADD, "The number of multi-hits, as well as the final hit's power, will change depending on A) the charge of the move and B) the distance from the opponent.");

// startup
set_window_value(AT_NSPECIAL, 1, AG_WINDOW_LENGTH, 10);
set_window_value(AT_NSPECIAL, 1, AG_WINDOW_ANIM_FRAMES, 2);

// charge loop
set_window_value(AT_NSPECIAL, 2, AG_WINDOW_TYPE, 9);
set_window_value(AT_NSPECIAL, 2, AG_WINDOW_LENGTH, 12);
set_window_value(AT_NSPECIAL, 2, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_NSPECIAL, 2, AG_WINDOW_ANIM_FRAME_START, 2);
set_window_value(AT_NSPECIAL, 2, AG_MUNO_WINDOW_EXCLUDE, 1);

// post-charge
set_window_value(AT_NSPECIAL, 3, AG_WINDOW_LENGTH, 16); // 4
set_window_value(AT_NSPECIAL, 3, AG_WINDOW_ANIM_FRAMES, 4); // 1
set_window_value(AT_NSPECIAL, 3, AG_WINDOW_ANIM_FRAME_START, 2); // 5

// beam overshoot
set_window_value(AT_NSPECIAL, 4, AG_WINDOW_LENGTH, 3);
set_window_value(AT_NSPECIAL, 4, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_NSPECIAL, 4, AG_WINDOW_ANIM_FRAME_START, 12);

// beam loop
set_window_value(AT_NSPECIAL, 5, AG_WINDOW_TYPE, 9);
set_window_value(AT_NSPECIAL, 5, AG_WINDOW_LENGTH, 12);
set_window_value(AT_NSPECIAL, 5, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_NSPECIAL, 5, AG_WINDOW_ANIM_FRAME_START, 13);

// last hit
set_window_value(AT_NSPECIAL, 6, AG_WINDOW_LENGTH, 5);
set_window_value(AT_NSPECIAL, 6, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_NSPECIAL, 6, AG_WINDOW_ANIM_FRAME_START, 13);

// endlag
set_window_value(AT_NSPECIAL, 7, AG_WINDOW_LENGTH, 12); // also change in atk update
set_window_value(AT_NSPECIAL, 7, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_NSPECIAL, 7, AG_WINDOW_ANIM_FRAME_START, 13);

// endlag pt 2
set_window_value(AT_NSPECIAL, 8, AG_WINDOW_LENGTH, 12);
set_window_value(AT_NSPECIAL, 8, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_NSPECIAL, 8, AG_WINDOW_ANIM_FRAME_START, 16);

set_attack_value(AT_NSPECIAL, AG_MUNO_ATTACK_ENDLAG, string(get_window_value(AT_NSPECIAL, 7, AG_WINDOW_LENGTH)));
set_attack_value(AT_NSPECIAL, AG_MUNO_ATTACK_MISC_ADD, "Endlag increases with charge.");

set_num_hitboxes(AT_NSPECIAL, 0);

set_hitbox_value(AT_NSPECIAL, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_NSPECIAL, 1, HG_WINDOW, 4);
set_hitbox_value(AT_NSPECIAL, 1, HG_LIFETIME, 1);
set_hitbox_value(AT_NSPECIAL, 1, HG_WIDTH, 64);
set_hitbox_value(AT_NSPECIAL, 1, HG_HEIGHT, 64);
set_hitbox_value(AT_NSPECIAL, 1, HG_SHAPE, 2);
set_hitbox_value(AT_NSPECIAL, 1, HG_PRIORITY, 3);
set_hitbox_value(AT_NSPECIAL, 1, HG_DAMAGE, 1);
set_hitbox_value(AT_NSPECIAL, 1, HG_ANGLE, 70);
set_hitbox_value(AT_NSPECIAL, 1, HG_BASE_KNOCKBACK, 1);
set_hitbox_value(AT_NSPECIAL, 1, HG_KNOCKBACK_SCALING, 0);
set_hitbox_value(AT_NSPECIAL, 1, HG_BASE_HITPAUSE, 3);
set_hitbox_value(AT_NSPECIAL, 1, HG_HITPAUSE_SCALING, 0);
set_hitbox_value(AT_NSPECIAL, 1, HG_SDI_MULTIPLIER, 0.00001);
set_hitbox_value(AT_NSPECIAL, 1, HG_HIT_SFX, sfx_dbfz_hit_weak);
set_hitbox_value(AT_NSPECIAL, 1, HG_EXTENDED_PARRY_STUN, 1);
set_hitbox_value(AT_NSPECIAL, 1, HG_IGNORES_PROJECTILES, 1);
set_hitbox_value(AT_NSPECIAL, 1, HG_MUNO_HITBOX_ACTIVE, "16");
set_hitbox_value(AT_NSPECIAL, 1, HG_MUNO_HITBOX_NAME, "Multihit");

set_hitbox_value(AT_NSPECIAL, 2, HG_HITBOX_TYPE, 1); // also change these stats in hit_player.gml
set_hitbox_value(AT_NSPECIAL, 2, HG_WINDOW, 6);
set_hitbox_value(AT_NSPECIAL, 2, HG_LIFETIME, 5);
set_hitbox_value(AT_NSPECIAL, 2, HG_WIDTH, 64);
set_hitbox_value(AT_NSPECIAL, 2, HG_HEIGHT, 64);
set_hitbox_value(AT_NSPECIAL, 2, HG_SHAPE, 2);
set_hitbox_value(AT_NSPECIAL, 2, HG_PRIORITY, 3);
set_hitbox_value(AT_NSPECIAL, 2, HG_DAMAGE, 4);
set_hitbox_value(AT_NSPECIAL, 2, HG_ANGLE, 45);
set_hitbox_value(AT_NSPECIAL, 2, HG_BASE_KNOCKBACK, 7);
set_hitbox_value(AT_NSPECIAL, 2, HG_KNOCKBACK_SCALING, 0.8);
set_hitbox_value(AT_NSPECIAL, 2, HG_BASE_HITPAUSE, 9);
set_hitbox_value(AT_NSPECIAL, 2, HG_HITPAUSE_SCALING, 0.5);
set_hitbox_value(AT_NSPECIAL, 2, HG_VISUAL_EFFECT, 304);
set_hitbox_value(AT_NSPECIAL, 2, HG_HIT_LOCKOUT, 5);
set_hitbox_value(AT_NSPECIAL, 2, HG_HIT_SFX, sfx_dbfz_hit_jab3);
set_hitbox_value(AT_NSPECIAL, 2, HG_EXTENDED_PARRY_STUN, 1);
set_hitbox_value(AT_NSPECIAL, 2, HG_IGNORES_PROJECTILES, 1);
set_hitbox_value(AT_NSPECIAL, 2, HG_MUNO_HITBOX_ACTIVE, "23");
set_hitbox_value(AT_NSPECIAL, 2, HG_MUNO_HITBOX_NAME, "Finisher");