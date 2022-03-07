// arg: cur_vc

if !voice exit;

var pool = [];

for (var i = 0; i < array_length(vb_idxes); i++){
	if cur_vc % vb_idxes[i] == 0{
		var grabbed_arr = vbs[vb_idxes[i]];
		for (var j = 0; j < array_length(grabbed_arr); j++){
			array_push(pool, grabbed_arr[j]);
		}
	}
}

if array_length(pool) == 0 exit;

var selected = pool[min(random_func(cur_vc, array_length(pool), true), array_length(pool) - 1)];

if selected != noone{
	var str = string(selected);
	if selected < 100 str = "0" + str;
	if selected < 10 str = "0" + str;
	
	sound_stop(voice_playing_sound);
	voice_playing_sound = sound_play(sound_get("vc" + (voice == VC_EN ? "EN" : "JP") + "_vgkn" + str), false, noone, 1.2);
}