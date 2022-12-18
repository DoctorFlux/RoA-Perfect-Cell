/*
 * The stats below are taken from Zetterburn, replacing Sandbert's overpowered
 * movement stats. The ATTACKS are still in their overpowered form in this
 * template, so be sure to make the ones for your character weaker.
 * 
 * Base Cast Frame Data:
 * docs.google.com/spreadsheets/d/19UtK7xG2c-ehxdlhCFKMpM4_IHSG-EXFgXLJaunE79I
 */

// STAT NAME		ZETTER VALUE   BASECAST RANGE   NOTES

// Physical size
char_height         = 80;       //                  not zetterburn's. this is just cosmetic anyway
knockback_adj       = 1;		// 0.9  -  1.2

// Ground movement
walk_speed          = 3.25;		// 3    -  4.5
walk_accel          = 0.2;		// 0.2  -  0.5
walk_turn_time      = 6;	    // 6
initial_dash_time   = 10;		// 8    -  16
initial_dash_speed  = 7;		// 4    -  9
dash_speed          = 6.5;		// 5    -  9
dash_turn_time      = 8;		// 8    -  20
dash_turn_accel     = 1.5;		// 0.1  -  2
dash_stop_time      = 6;		// 4    -  6
dash_stop_percent   = 0.35;		// 0.25 -  0.5
ground_friction     = 0.5;		// 0.3  -  1
moonwalk_accel      = 1.3;		// 1.2  -  1.4
    
// Air movement
leave_ground_max    = 6;		// 4    -  8
max_jump_hsp        = 6;		// 4    -  8
air_max_speed       = 5;  		// 3    -  7		prepatch: 4
jump_change         = 3;		// 3
air_accel           = 0.3;		// 0.2  -  0.4
prat_fall_accel     = 0.85;		// 0.25 -  1.5
air_friction        = 0.04;		// 0.02 -  0.07
max_fall            = 9;		// 6    -  11
fast_fall           = 13;		// 11   -  16
gravity_speed       = 0.55;		// 0.3  -  0.6
hitstun_grav        = 0.5;		// 0.45 -  0.53

// Jumps
jump_start_time     = 5;		// 5                this stat is automatically decreased by 1 after init.gml (dan moment), so its "real value" is 4. if you change this during a match, 4 is the value you should reset it to
jump_speed          = 11;		// 7.6  -  12       okay, zetter's is actually 10.99 but... come on
short_hop_speed     = 6;		// 4    -  7.4
djump_speed         = 11;		// 6    -  12       absa's is -1 because of her floaty djump
djump_accel         = 0;        // -1.4 -  0        absa's is -1.4, all other chars are 0. only works if the   djump_accel_end_time   variable is also set. floaty djumps should be adjusted by feel based on your char's gravity
djump_accel_end_time= 0;        //                  the amount of time that   djump_accel   is applied for
max_djumps          = 1;		// 0    -  3        the 0 is elliana because she has hover instead
walljump_hsp        = 7;		// 4    -  7
walljump_vsp        = 8;		// 7    -  10
land_time           = 4;		// 4    -  6
prat_land_time      = 24;		// 3    -  24       zetterburn's is 3, but that's ONLY because his uspecial is so slow. safer up b (or other move) = longer pratland time to compensate

// Shield-button actions
wave_friction       = 0.15;		// 0    -  0.15
roll_forward_max    = 9;        // 9    -  11
roll_backward_max   = 9;        // 9    -  11       always the same as forward
wave_land_time      = 12;		// 6    -  12
wave_land_adj       = 1.2;		// 1.2  -  1.5      idk what zetterburn's is
air_dodge_speed     = 7.5;      // 7.5  -  8
techroll_speed      = 10;       // 8    -  11



// Character-specific assets init

//Sprites
spr_nspecial_proj = sprite_get("nspecial_proj");
spr_example = sprite_get("example"); // sprites/example_stripX.png

// SFX
sfx_dstrong = sound_get("sfx_mol_flash_explode");
sfx_walk = sound_get("walksound");
sfx_dbfz_charge = sound_get("ARC_BTL_CMN_Charge_Start");

sfx_dbfz_elbow = sound_get("ARC_BTL_GKN_HeavyElbow_A");
sfx_dbfz_elbow_start = sound_get("ARC_BTL_GKN_HeavyElbow_Basa");

sfx_dbfz_hit_weak = sound_get("ARC_BTL_CMN_Hit_Small-A");
sfx_dbfz_hit_medium = sound_get("ARC_BTL_CMN_Hit_Midle-A");
sfx_dbfz_hit_strong = sound_get("ARC_BTL_CMN_Hit_Large-A");
sfx_dbfz_hit_broken = sound_get("ARC_BTL_CMN_Hit_XLarge");
sfx_dbfz_hit_kidan = sound_get("ARC_BTL_CMN_Hit_kidan");
sfx_dbfz_hit_jab3 = sound_get("ARC_BTL_GKN_Atk5A_3rd_Hit");

sfx_dbfz_kame_charge = sound_get("ARC_BTL_GKN_Kamehame_Chrg");
sfx_dbfz_kame_fire = sound_get("ARC_BTL_GKN_Kamehame_Fire");

sfx_dbfz_kidan_charge = sound_get("ARC_BTL_CMN_kidan_Chrg");
sfx_dbfz_kidan_fire = sound_get("ARC_BTL_CMN_kidan_Fire1");

sfx_dbfz_energyfield_chrg = sound_get("ARC_BTL_CEN_EnergyField_Chrg");
sfx_dbfz_energyfield_fire = sound_get("ARC_BTL_CEN_EnergyField_Fire");

sfx_dbfz_sbomb_fire = sound_get("ARC_BTL_GKN_Gnkdm_Fire");
sfx_dbfz_sbomb_hit = sound_get("ARC_BTL_GKN_Gnkdm_Hit");
sfx_dbfz_sbomb_impact = sound_get("ARC_BTL_GKN_Gnkdm_Impct");

sfx_dbfz_swipe_weak1 = sound_get("ARC_BTL_CMN_Furi_Hook");
sfx_dbfz_swipe_weak2 = sound_get("ARC_BTL_CMN_Furi_Short-A");
sfx_dbfz_swipe_medium1 = sound_get("ARC_BTL_CMN_Furi_Hiji");
sfx_dbfz_swipe_medium2 = sound_get("ARC_BTL_CMN_Furi_Keri");
sfx_dbfz_swipe_heavy1 = sound_get("ARC_BTL_CMN_Furi_YokoKeri");

sfx_dbfz_superdash = sound_get("ARC_BTL_CMN_homingdash");

sfx_dbfz_teleport = sound_get("ARC_BTL_CMN_TLP_Short");
sfx_dbfz_teleport_end = sound_get("ARC_BTL_CMN_TLP_End");

// VFX
vfx_afterimage = hit_fx_create(sprite_get("vfx_afterimage"), 24);
vfx_afterimage_ssj1 = hit_fx_create(sprite_get("vfx_afterimage_ssj1"), 24);
vfx_afterimage_ssj3 = hit_fx_create(sprite_get("vfx_afterimage_ssj3"), 24);
vfx_ftilt_destroy = hit_fx_create(sprite_get("vfx_ftilt_destroy"), 12);
vfx_utilt_spawn = hit_fx_create(sprite_get("vfx_utilt_spawn"), 16);
vfx_nspecial_fire = hit_fx_create(sprite_get("vfx_nspecial_fire"), 16);
vfx_kaioken_start = hit_fx_create(sprite_get("vfx_kaioken_start"), 24);
vfx_ssj_start = hit_fx_create(sprite_get("vfx_ssj_start"), 24);
vfx_ssj3_lightning = hit_fx_create(sprite_get("vfx_ssj3_lightning"), 24);

// Variables
small_sprites = true;
aerial_pratfall_timer = 0; // uspecial
uspecial_can_target = true;
funny_broken_mode = false;

ki = 0;
ki_max = 1000;
ki_meter = 0; // visible amt, lerps to ki

meter_full_alpha = 0;
meter_full_splash_timer = 0;

kaioken = 0; // holds the value of what the meter WILL be after kaioken
kaioken_add = 400;
kaioken_recoil_tick = 0; // ticks up to manage recoil dmg

var alt_cur = get_player_color(player);
original_palette = [];

for (var i = 0; i < 8; i++){
	original_palette[i] = make_color_rgb(
	    get_color_profile_slot_r(alt_cur, i),
	    get_color_profile_slot_g(alt_cur, i),
	    get_color_profile_slot_b(alt_cur, i)
	    );
}

blue_color = original_palette[0]

var hair = [
	make_color_rgb(
		color_get_blue(original_palette[4]),
		color_get_green(original_palette[4]),
		color_get_red(original_palette[4])
		),
	make_color_rgb(
		color_get_blue(original_palette[5]),
		color_get_green(original_palette[5]),
		color_get_red(original_palette[5])
		)];

// initSsj(id, name, hairstyle, color, color_dark)
// hair: 0 normal, 1 ssj1, 2 ssj3
// colors are in hex RGB
ssjs = [];
SSJ_NONE			= initSsj(0, "Base",				0, hair[0], hair[1]);
SSJ_1	    		= initSsj(1, "Super Saiyan 1",		1, $ffe07e, $e39500);
SSJ_3	    		= initSsj(2, "Super Saiyan 3",		2, $ffe07e, $e39500);
SSJ_GOD	    		= initSsj(3, "Super Saiyan God",	0, $ff3c7d, $b80050);
SSJ_BLUE    		= initSsj(4, "Super Saiyan Blue",	1, $54edf9, $007bbf);
SSJ_UI      		= initSsj(5, "Ultra Instinct",		0, $c1dfe7, $6688aa);
SSJ_ROSE      		= initSsj(6, "Super Saiyan Rosé",	1, $eab1cb, $d95f8f);

ssj = SSJ_NONE;
was_ssj = 0;

kaioken_red_light = $8493ff;
kaioken_red_dark = $181eff;

has_goku_beam = true; // TEMP; will be in phone
doing_goku_beam = false; // TEMP; will be in phone
beam_newest_hbox = noone; // TEMP; will be in phone

current_sprite_set = 0;
num_sprite_sets = 1;

voice_playing_sound = noone;

VC_NONE = 0;
VC_EN = 1;
VC_JP = 2;

voice = VC_NONE;

if (get_synced_var( player ) == 0) {
	voice = VC_NONE;
}
if (get_synced_var( player ) == 1) {
	voice = VC_EN;
}
if (get_synced_var( player ) == 2) {
	voice = VC_JP;
}

checked_sprite_names = [
    "idle", 
    "crouch", 
    "walk", 
    "walkturn", 
    "dash", 
    "dashstart", 
    "dashstop", 
    "dashturn", 
    
    "hurt",
    "hurtground",
    "bighurt",
    "uphurt",
    "downhurt",
    "bouncehurt",
    "spinhurt", 
    
    "jumpstart", 
    "jump", 
    "doublejump", 
    "walljump", 
    "pratfall", 
    "land", 
    "landinglag", 
    
    "parry", 
    "roll_forward", 
    "roll_backward", 
    "airdodge", 
    "waveland", 
    "tech", 
    
    "jab", 
    "dattack", 
    "ftilt", 
    "dtilt", 
    "utilt", 
    "nair", 
    "fair", 
    "bair", 
    "uair", 
    "dair", 
    "fstrong", 
    "ustrong", 
    "dstrong", 
    "nspecial", 
    "nspecial_air", 
    "fspecial", 
    "uspecial", 
    "dspecial", 
    "taunt",
    
    "phone_open",
    "intro",
    ];

var a = 0;

VB_ATK_SMALL = 		2;
VB_ATK_MED = 		3;
VB_ATK_BIG = 		5;
VB_ATK_HUGE = 		7;
VB_DEATH = 			11;
VB_KAIOKEN = 		13;
VB_SPIRIT_BOMB = 	17;
VB_HURT = 			19;
VB_METER_FULL = 	23;
VB_TAUNT = 			29;
VB_KAMEHAME =		31;
VB_HA = 			37;
VB_BARRIER =	    41;

vb_idxes = [
	VB_ATK_SMALL,
	VB_ATK_MED,
	VB_ATK_BIG,
	VB_ATK_HUGE,
	VB_DEATH,
	VB_KAIOKEN,
	VB_SPIRIT_BOMB,
	VB_HURT,
	VB_METER_FULL,
	VB_TAUNT,
	VB_KAMEHAME,
	VB_HA,
	VB_BARRIER,
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
	121,
	213,
	];
vbs[VB_ATK_MED] = [
	noone,
	noone,
	noone,
	104,
	105,
	107,
	109,
	];
vbs[VB_ATK_BIG] = [
	noone,
	noone,
	noone,
	115,
	116,
	118,
	119,
	124,
	201,
	202,
	203,
	204,
	205,
	207,
	212,
	]
vbs[VB_ATK_HUGE] = [
	noone,
	noone,
	noone,
	noone,
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
	020,
	022,
	031,
	]
vbs[VB_KAIOKEN] = [
	noone,
	]
vbs[VB_SPIRIT_BOMB] = [
	noone,
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
vbs[VB_METER_FULL] = [
	noone,
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
	600,
	601,
	]
vbs[VB_KAMEHAME] = [ // NOTE: these are actually from dbfz *ssj* goku.
	998,
	999,
	]
vbs[VB_HA] = [
	612,
	614,
	]
vbs[VB_BARRIER] = [
	210,
	210,
	]


swallowed = 0;
kirbyability = 16;

fs_char_portrait_y = 86;
fs_char_chosen_final_smash = "custom";
fs_meter_x = 40;
fs_meter_y = -28;

//fspecial
grabp = noone;
fspec_hb = noone;
grabx = 0;

//uspecial
startp = [0, 0];
prev_pos = x;

//dstrong
startpos = 0;
b1_pos = [];
b2_pos = [];
b3_pos = [];
b4_pos = [];
b5_pos = [];
b6_pos = [];

//dspecial
dsp_ch = 0;

// Animation Info

// Misc. animation speeds
idle_anim_speed     = 0.15;
crouch_anim_speed   = 0.1;
walk_anim_speed     = 0.175;
dash_anim_speed     = 0.2;
pratfall_anim_speed = 0.25;

// Jumps
double_jump_time    = 40;		// 24   -  40
walljump_time       = 32;		// 18   -  32
wall_frames         = 2;		// may or may not actually work... dan pls

// Parry
dodge_startup_frames    = 1;
dodge_active_frames     = 2;
dodge_recovery_frames   = 3;

// Tech
tech_active_frames      = 2;
tech_recovery_frames    = 2;

// Tech roll
techroll_startup_frames     = 2;
techroll_active_frames      = 1;
techroll_recovery_frames    = 2;

// Airdodge
air_dodge_startup_frames    = 1;
air_dodge_active_frames     = 1;
air_dodge_recovery_frames   = 2;

// Roll
roll_forward_startup_frames     = 2;
roll_forward_active_frames      = 1;
roll_forward_recovery_frames    = 2;
roll_back_startup_frames        = 2;
roll_back_active_frames         = 1;
roll_back_recovery_frames       = 2;

// Crouch
crouch_startup_frames   = 2;
crouch_active_frames    = 1;
crouch_recovery_frames  = 2;

/*

Muno's Words of Wisdom: Due to a Certified Dan Moment, you must duplicate the
last frame of your crouch animation. So like, if your animation has 10 frames
total, add an 11th that's the copy of the 10th. You do NOT include this 11th
frame in the crouch_recovery_frames or etc; configure these values AS IF there
were only 10 frames.

The reason for this is that otherwise, the crouch just glitches out at the end
of the standing-up animation. Dan Moment

*/



// Hurtbox sprites
hurtbox_spr = sprite_get("hurt_box")
crouchbox_spr       = sprite_get("crouch_hurt_box");
air_hurtbox_spr     = -1; // -1 = use hurtbox_spr
hitstun_hurtbox_spr = -1; // -1 = use hurtbox_spr

// Victory
set_victory_bg(sprite_get("victory"));
set_victory_theme(sound_get("win_goku"));

// Movement SFX
land_sound          = asset_get("sfx_land_light");
landing_lag_sound   = asset_get("sfx_land_med");
waveland_sound      = asset_get("sfx_waveland_ran"); // recommended to try out all 14 base cast wavedash sfx (see sfx page in roa manual)
jump_sound          = asset_get("sfx_jumpground");
djump_sound         = asset_get("sfx_jumpair");
air_dodge_sound     = asset_get("sfx_quick_dodge");

// Visual offsets for when you're in Ranno's bubble
bubble_x = 0;
bubble_y = 8;

//misc vars
phone_arrow_cooldown = 0;
phone_darkened_player_color = make_color_rgb(
	color_get_red	(get_player_hud_color(player)) * 0.25,
	color_get_green	(get_player_hud_color(player)) * 0.25,
	color_get_blue	(get_player_hud_color(player)) * 0.25
	);
phone_blastzone_r = room_width - get_stage_data(SD_X_POS) + get_stage_data(SD_SIDE_BLASTZONE);
phone_blastzone_l = get_stage_data(SD_X_POS) - get_stage_data(SD_SIDE_BLASTZONE);


muno_event_type = 0;
user_event(14);



#define initSsj(num, name, hairstyle, color, color_dark)

ssjs[num] = {
	name: name,
	hairstyle: hairstyle,
	color: make_color_rgb(color_get_blue(color), color_get_green(color), color_get_red(color)),
	color_dark: make_color_rgb(color_get_blue(color_dark), color_get_green(color_dark), color_get_red(color_dark))
};

return num;