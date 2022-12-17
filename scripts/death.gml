ssj = 0;
funny_broken_mode = false;

voice_play(VB_DEATH);

if instance_exists(grabp) grabp.state = PS_HITSTUN;

#define voice_play(idx)

cur_vc = idx;
user_event(0);