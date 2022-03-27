VB_ATK_SMALL = 		2;
VB_ATK_MED = 		3;
VB_ATK_BIG = 		5;
VB_DEATH = 			11;
VB_HURT = 			19;
VB_TAUNT = 			29;
VB_KAMEHAME =		31;
VB_HA = 			37;

vb_idxes = [
	VB_ATK_SMALL,
	VB_ATK_MED,
	VB_ATK_BIG,
	VB_DEATH,
	VB_HURT,
	VB_TAUNT,
	VB_KAMEHAME,
	VB_HA,
	]

vbs = [];

vbs[VB_ATK_SMALL] = [
	noone,
	noone,
	noone,
	100,
	101,
	102,
	103,
	106,
	112,
	];
vbs[VB_ATK_MED] = [
	noone,
	noone,
	noone,
	107,
	108,
	109,
	116,
	118,
	121,
	124,
	];
vbs[VB_ATK_BIG] = [
	noone,
	noone,
	noone,
	102,
	104,
	105,
	115,
	212,
	210,
	207,
	205,
	]
vbs[VB_DEATH] = [
	noone,
	noone,
	noone,
	noone,
	noone,
	006,
	007,
	008,
	009,
	010,
	011,
	012,
	013,
	014,
	015,
	016,
	017,
	018,
	019,
	022,
	028,
	031,
	]
vbs[VB_HURT] = [
	noone,
	noone,
	noone,
	noone,
	000,
	001,
	002,
	003,
	004,
	005,
	]
vbs[VB_TAUNT] = [
	123,
	128,
	200,
	206,
	400,
	401,
	402,
	403,
	404,
	500,
	704,
	]
vbs[VB_KAMEHAME] = [ // right now just Goku´s not Cell´s
	998,
	999,
	]
vbs[VB_HA] = [ // right now just Goku´s not Cell´s 
	612,
	614,
	]