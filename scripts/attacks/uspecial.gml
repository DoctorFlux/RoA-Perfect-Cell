set_attack_value(AT_USPECIAL, AG_CATEGORY, 2);
set_attack_value(AT_USPECIAL, AG_SPRITE, sprite_get("uspecial"));
set_attack_value(AT_USPECIAL, AG_NUM_WINDOWS, 2);
set_attack_value(AT_USPECIAL, AG_OFF_LEDGE, 1);
set_attack_value(AT_USPECIAL, AG_HURTBOX_SPRITE, hurtbox_spr);
set_attack_value(AT_USPECIAL, AG_USES_CUSTOM_GRAVITY, 1);
set_attack_value(AT_USPECIAL, AG_MUNO_ATTACK_COOLDOWN, -9999);

set_window_value(AT_USPECIAL, 1, AG_WINDOW_LENGTH, 18);
set_window_value(AT_USPECIAL, 1, AG_WINDOW_ANIM_FRAMES, 6);
set_window_value(AT_USPECIAL, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_USPECIAL, 1, AG_WINDOW_SFX, sfx_dbfz_teleport);
set_window_value(AT_USPECIAL, 1, AG_WINDOW_SFX_FRAME, 12);
set_window_value(AT_USPECIAL, 1, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);

set_window_value(AT_USPECIAL, 2, AG_WINDOW_TYPE, 7);
set_window_value(AT_USPECIAL, 2, AG_WINDOW_LENGTH, 10);
set_window_value(AT_USPECIAL, 2, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_USPECIAL, 2, AG_WINDOW_ANIM_FRAME_START, 7);
set_window_value(AT_USPECIAL, 2, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);

if !has_rune("H") exit;

set_window_value(AT_USPECIAL, 1, AG_WINDOW_LENGTH, 6);
set_window_value(AT_USPECIAL, 1, AG_WINDOW_SFX_FRAME, 0);

set_window_value(AT_USPECIAL, 2, AG_WINDOW_TYPE, 0);