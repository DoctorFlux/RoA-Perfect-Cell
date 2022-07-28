// phone - frontend

if object_index == asset_get("cs_playerbg_obj"){
	CORE_css_draw();
	exit;
}

CORE_general();
CORE_tips();
CORE_patches();
CORE_cheats();
CORE_frame_data();
CORE_muno_compatibility();



/*
╔═══════════════════════════════════════════════════════════════════════════╗
║																			║
║ CSS Draw																	║
║																			║
╚═══════════════════════════════════════════════════════════════════════════╝

Set parameters that are used by the CSS drawing code.

*/

#define CORE_css_draw

// The number of alt costumes your char has, up to 32.
num_alts = 12;

// Whether or not to display a name for each alt.
use_alt_names = true;

// Which color slot in your char's colors.gml to use for certain UI elements.
// Type "noone" to make it always white.
// (you can also change it to different values depending on the alt, by using
// get_player_color(player))
alt_ui_recolor = 0;

// The list of names for the alts, if enabled.
alt_names = [
	"Perfect Cell",
	"Cell Jr.",
	"Frieza",
	"Golden Frieza",
	"Majin Buu",
	"Hit",
	"Jiren",
	"Spoilers",
	"Trans-form",
	"Manga",
	"Gameboy",
	"Abyss",
	];



/*
╔═══════════════════════════════════════════════════════════════════════════╗
║																			║
║ General Settings															║
║																			║
╚═══════════════════════════════════════════════════════════════════════════╝

Set miscellaneous values to customize how your character interacts with the
MunoPhone Touch.

*/

#define CORE_general

// Character's name, used in a couple of places in the phone.
// (if you delete this line, it'd just use the config.ini name)
muno_char_name = "Goku";
muno_char_id = 10;

// Whether or not the phone sprite should recolor w/ your alt costume.
// (set to "true" if you make a custom phone sprite in your char's colors)
phone.uses_shader = false;

// If you use a custom phone sprite that's taller than the default, enter how
// much taller it is here. (measured in ingame pixels; so if editing the default
// phone sprite, multiply it by two)
phone.extra_top_size = 8;

// Set to true and the "Fast Graphics" feature will be enabled; see _readme.gml.
phone.supports_fast_graphics = true;

// Set to true and the phone will NOT activate Fast Fraphics when FPS gets low.
phone.dont_fast = false;

// Set to true and this will DISABLE a lot of the phone's side utilities.
// If you're porting the phone to an existing char and don't need any of these
// features, you might as well turn on lightweight to save a tiny bit of
// performance. (see _docs.gml for a full list of what this disables)
phone.lightweight = false;



/*
╔═══════════════════════════════════════════════════════════════════════════╗
║																			║
║ Tips																		║
║																			║
╚═══════════════════════════════════════════════════════════════════════════╝

Add Tips to your character, giving info on how to play or trivia. You can add
both text and images. It's recommended to keep these short-and-sweet, as in the
examples.

Use the initTip() function to start a new Tip:

	initTip(name);

Then, use the following functions to add content or paragraphs:

	initWords(text)
	
	initWords_ext(text, alignment, color, indent, ignore_height)
	
	initImage(sprite, frame)
	
	initImage_ext(sprite, frame, alignment, xscale, yscale, uses_shader, color,
		alpha, ignore_height, crop_left, crop_right, crop_up, crop_down)

Glossary:
	
	"_ext" at the end of a function name means an extended version of the
		function it's named after - giving you more formatting options.
	
	"alignment" can be the GML constants fa_left, fa_center, or fa_right.
	
	"color" can be any GML color, e.g. c_red, #00ff00, or make_color_hsv(...).
		Set this to a string (e.g. "h"), and it will be colored to the main
		color of whichever phone app the text is being displayed in.
	
	"indent" basically allows you to put any amount of "tabs" to the left of a
		paragraph.
	
	"sprite" can be any sprite index, e.g. sprite_get(...) or asset_get(...).
	
	"ignore_height" prevents this element from pushing the one below it
		downward. Set this to true to achieve effects such as two elements
		being side-by-side.
	
	"frame" can be 0 or any positive number for a static image, or a negative
		number for an animated image. The size of the negative number determines
		the framerate; -1 is the fastest, -2 is half as fast, -3 a third, etc.
	
	"uses_shader" determines whether or not the image should recolor with the
		character's alt costumes.
	
	"crop_left", "crop_right", etc allow you to crop an image by determining how
		far from the image's offset it should be drawn. Set all four to "noone"
		and it will use the entire image (including empty space).

NOTE: It's recommended to separate each paragraph into its own initWords() line,
so that things like page breaks can work properly.

*/

#define CORE_tips

initTip("SSJ Meter");
initWords("Goku's iconic Super Saiyan form appears in Rivals as a mid-match transformation - and you don't even need Abyss Runes or a Smash Ball!");
initWords("The Ki Meter at the bottom of the screen fills up as you deal damage to opponents, and it also fills (much more slowly) when you receive damage. When it's full, press DSpecial to turn Super Saiyan for a limited time!");
initImage(sprite_get("dspecial"), -5);
initWords("In Super Saiyan form, you can cancel normal attacks into a Special or Strong on-hit, dash more quickly, and launch opponents further with Strongs... at the cost of taking more knockback.");

initTip("DSpecial: Kaioken");
initWords("You're unlikely to fill the Ki Meter more than once per match by normal means... but if you want to push your limits, you can use DSpecial to enter Kaioken!");
initWords("In this state, Goku deals more damage and gains Ki over time... but takes 20 recoil damage over the course of the Kaioken timer.");
initImage_ext(sprite_get("vfx_kaioken_start"), -5, fa_center, 1, 1, true, c_white, 1, true, noone, noone, noone, noone);
initImage(sprite_get("dspecial"), -5);
initWords("You can also hold DSpecial for a while to ''fast forward'' the Kaioken state, basically getting the whole thing over with.");

initTip("Transformation Hitbox");
initWords("Goku's ''powering up'' pose during DSpecial has a hitbox at the very start, and if it connects, you can cancel it into any action!");
initImage(sprite_get("dspecial"), -5);

initTip("DSpecial: Spirit Bomb");
initWords("While in SSJ form, Goku's DSpecial is a powerful Spirit Bomb! This drains the rest of your Ki meter and channels it into a powerful combo move.");
initWords("It homes in on enemies (unless they're behind the projectile), and then deals a number of rapid hits that depends on how much Ki charge you had left.");
initImage_ext(sprite_get("dspecial_2"), -5, fa_center, 2, 2, true, c_white, 1, true, noone, noone, noone, noone);
initImage_ext(sprite_get("sbomb_multihit"), 0, fa_right, 1, 1, true, c_white, 1, true, noone, noone, noone, noone);

var ssj_shortcuts = [
	"how",
	"Nothing",
	"Attack",
	"Jump",
	"Jump + Shield or Attack + Shield",
	"Shield",
	];

initTip("Other SSJ Forms");
initWords("Goku is known for pushing his limits in a number of increasingly-powerful Super forms.");
initWords("In Rivals, you can access several of Goku's forms, but they're just for looks - their strength is all the same.");
initWords("Pick your favorite one by pressing a button at the exact same time you transform with DSpecial!");
for (var i = 1; i < array_length(ssjs) - 1; i++){
	var cur = ssjs[i];
	initWords_ext(cur.name + ":", fa_left, cur.color, 0, true);
	initWords_ext("
	" + ssj_shortcuts[i], fa_left, c_white, 1, false);
}
initWords_ext("Note: the Goku Black palette will instead always enter the SSJ Rosé form.", fa_left, c_white, 0, true);

initTip("NSpecial: Kamehameha");
initWords("What else would Goku's NSpecial be?");
initWords("The longer it's charged, the more distance it travels. The more distance it has left to travel by the time it reaches the enemy, the more damage and knockback it deals.");
initWords("If two Kamehamehas clash, you'll get into a beam struggle! Mash B to overpower your opponent.");
initImage_ext(sprite_get("nspecial"), -5, fa_right, -2, 2, true, c_white, 1, true, noone, noone, noone, noone);
initImage_ext(sprite_get("nspecial"), -5, fa_left, 2, 2, true, c_white, 1, false, noone, noone, noone, noone);
initWords("P.S. SSJ form gives you a little bit of charge for free!");

initTip("FSpecial: Superdash");
initWords("Goku's NSpecial and FSpecial both use the same system for precise aim.");
initWords("You can hold straight up or down to angle the attack, but adding horizontal inputs allows you to choose a shallower or steeper angle.");
initImage(sprite_get("fspecial"), -5);
initWords("Try it out with NSpecial, using the angle-preview arrow indicator for reference.");
initWords("P.S. During FSpecial, hold directly backward to slow down.");

initTip("USpecial: Instant Transmission");
initWords("Goku's USpecial, unlike Forsburn's, slides along terrain rather than passing through it... which makes sense, if you think about how it works in DBZ. You can still go through platforms, though.");
initWords("Separately, you can cancel the endlag into an Aerial or NSpecial... but if you fail to hit an opponent, you'll enter pratfall.");
initImage(sprite_get("uspecial"), -5);
initWords("In SSJ form, Goku will (once per airtime) auto-target any enemy who is in hitstun! Hold shield to cancel this in favor of manual aim.");
initWords_ext("Also, SSJ form removes the normal once-per-airtime use limit of FSpecial and Uspecial. (They still have pratfall, and there's a short cooldown - but now you can use them again after hitting an enemy successfully.)", fa_left, c_white, 0, true);

initTip("F/UTilt: Ki Blasts");
initWords("FTilt and the second hit of UTilt are both mid-range Ki blasts, which are excellent for poking and even performing combos!");
initWords("UTilt can be aimed left or right by holding the control stick.");
initImage_ext(sprite_get("ftilt"), -5, fa_right, 2, 2, true, c_white, 1, true, noone, noone, noone, noone);
initImage_ext(sprite_get("utilt"), -5, fa_left, 2, 2, true, c_white, 1, false, noone, noone, noone, noone);

initTip("DAttack: Heavy Elbow");
initWords("Goku's DAttack is a fast elbow strike!");
initWords("If you go off an edge with this move, you'll have much less ending lag.");
initImage(sprite_get("dattack"), -5);



/*
╔═══════════════════════════════════════════════════════════════════════════╗
║																			║
║ Patches																	║
║																			║
╚═══════════════════════════════════════════════════════════════════════════╝

Keep a record of your character's update history, and at the end, also give
credits to the developer(s) of the character or any assets used.

Use the initPatch() function to start a new Patch:

	initPatch(version_number, date)

If the "date" field is set to an empty string, then the Patch will act more like
a Tip - mainly useful for making an "About [character]" page.

Use the same functions as in the Tips app to populate the Patch with text and
images.

Here are two more content functions, which are designed for use in Patches but
also work in Tips:

	initHeader(text)
	initSection(text)

These are basically shortcuts for two different types of formatted text.
initHeader() is a text heading that is colored either blue or green, depending
on whether it's a Tip or a Patch. initSection() is an indented block of text.

These are handy for dividing a Tip/Patch into sections, such as different moves
in a Patch.

*/

#define CORE_patches

initPatch("1.11", "27 June, 2022");
initHeader("User Interface");
initSection("The language switch option is now its own button instead of being tied to cycling through the alts.
The HUD sprite now updates to reflect the current SSJ form.");

initPatch("1.10", "02 June, 2022");
initHeader("DAir - Nerfs");
initSection("The spike at the start of the move is now a sweetspot (near the tip of his feet) instead of the entire hitbox.");
initHeader("FStrong - Nerfs");
initSection("Hitbox size reduced, position adjusted.
Knockback growth (non-SSJ) 1.05 --> 1.0.");
initHeader("UStrong - Nerfs");
initSection("Endlag 15 --> 20.");

initPatch("1.9", "10 March, 2022");
initHeader("DTilt - Buffs");
initSection("SSJ only: startup 8 --> 6.");

initPatch("1.8", "20 February, 2022");
initHeader("General - Bugfixes");
initSection("Fixed sprite size.");

initPatch("1.7", "22 November, 2021");
initHeader("NSpecial - Nerfs");
initSection("Air version now has pratfall.");
initHeader("Rolls - Clarity");
initSection("Afterimage now moves in the direction of the roll / tech.
Adjusted afterimage timing.");

initPatch("1.6", "29 October, 2021");
initHeader("DTilt - Buffs");
initSection("SSJ only: startup 10 --> 8.");
initHeader("NSpecial - Bugfixes");
initSection("Fixed whiff pratfall after USpecial.");

initPatch("1.5", "04 October, 2021");
initHeader("NSpecial - Nerfs");
initSection("Base endlag 16 --> 24; adjusted animation timing to match.");
initHeader("FSpecial - QoL");
initSection("By holding back on the control stick, you can now halve Goku's flight speed.
This also happens when parried.");
initHeader("DSpecial - Buffs, Nerfs");
initSection("Spirit Bomb projectile lifetime 30 --> 60.
Spirit Bomb homing ability greatly reduced.
Air stall reduced while charging meter.");
initHeader("FTilt - Nerfs");
initSection("Adjusted projectile's spawn position, lifetime, and travel speed - covers the same distance but at a reduced speed.");
initHeader("UAir - Nerfs");
initSection("Knockback growth 0.8 --> 0.7.");

initPatch("1.4", "24 September, 2021");
initHeader("NSpecial - Nerfs, Buffs, Aesthetics");
initSection("Post-charge startup 4 --> 16.
Can no longer break projectiles.
Initial beam juice 30 --> 60 (SSJ: 90 --> 120).
Added vfx and sfx to releasing the charge.");
initHeader("DTilt - Nerfs");
initSection("Endlag 10 --> 13.
SSJ only: startup 6 --> 10.");
initHeader("DSpecial - QoL");
initSection("There's no longer a time limit on the held DSpecial power-up, so you can go from empty to full in one go if you want.");
initHeader("Jab 2 - Aesthetics");
initSection("Edited Goku's hair during this animation.");

initPatch("1.3", "22 September, 2021");
initHeader("Ki Meter - Nerfs");
initSection("Goku now loses a bit of ki when hit during Super Saiyan form.");
initHeader("SSJ - Aesthetics");
initSection("SSJ forms' hair and vfx are now unshaded when using the Early Access alt.");

initPatch("1.2", "21 September, 2021");
initHeader("NSpecial - Nerfs");
initSection("Endlag now increases with charge.");
initHeader("USpecial - Nerfs, Bugfixes, Adjustments");
initSection("SSJ homing teleport now limits the height of both Goku and the opponent.
Teleporting, hitting an enemy with Nair 1, and then whiffing a different aerial no longer causes pratfall.
Cancel into NSpecial now limits vertical speed.");
initHeader("DSpecial - Adjustments, Bugfixes, QoL");
initSection("Spirit Bomb launcher knockback growth 0.7 --> 0.3.
Spirit Bomb now visibly deflects when hit by an enemy attack.
Spirit Bomb now reflects on parry.
Added a second way to access the SSJ Blue form.");
initHeader("FTilt - Buffs");
initSection("Can now be used during the cooldown, but only as a melee attack.");
initHeader("DAttack - Nerfs");
initSection("Endlag 16 --> 18.
Travel distance reduced.");
initHeader("FAir - Buffs");
initSection("Moved non-sweetspot hitbox forward.");
initHeader("UAir - Nerfs");
initSection("Knockback growth 0.9 --> 0.8.");
initHeader("DAir - Buffs");
initSection("Can now be reversed on startup.");
initHeader("DStrong - Buffs");
initSection("Sourspot knockback growth 0.7 --> 0.8.")
initHeader("Taunt - Buffs?");
initSection("Can now be held.");
initHeader("General - Bugfixes");
initSection("Corrected animation timings for tech roll.");

initPatch("1.1", "20 September, 2021");
initHeader("Stats - Buffs");
initSection("Air speed 4 --> 5.");
initHeader("Ki Meter - Buffs");
initSection("On-hit ki gain multiplier 4 --> 5.
Goku now receives a small amount of ki when getting hit (multiplier 1).");
initHeader("USpecial - Nerfs");
initSection("No longer passes through solid terrain (but does pass through platforms).");
initHeader("DTilt - Buffs");
initSection("Endlag 15 --> 10.");
initHeader("BAir - Adjustments");
initSection("Angle flipper 0 --> 6.");
initHeader("UAir - Buffs");
initSection("Endlag 12 --> 10.
Knockback growth 0.5 --> 0.9.");
initHeader("DAir - Buffs");
initSection("Endlag 10 --> 4.");
initHeader("FStrong, UStrong - Buffs");
initSection("Knockback growth 0.9/1.2 --> 1.05/1.3.");
initHeader("UTilt - Bugfixes");
initSection("Hit 2's input now works with tilt stick up. (Aiming still requires the left analog stick.)");
initHeader("Final Smash - Nerfs?");
initSection("Deals less damage in Rivals of Fighter.");

initPatch("1.0", "19 September, 2021");
initHeader("General");
initSection("The character was released.");

initPatch("About Goku", "");
initHeader("Original IP");
initSection("The owners of Dragon Ball");
initHeader("Character by");
initSection("Muno - byMuno.com");
initHeader("Moveset concept by");
initSection("Doctor Flux");
initHeader("SFX from");
initSection("Dragon Ball FighterZ");
initHeader("Compatible with");
initSection("Abyss Runes, Trummel & Alto, Otto, Steve, Link, Kirby, Final Smash Buddy");



/*
╔═══════════════════════════════════════════════════════════════════════════╗
║																			║
║ Cheats																	║
║																			║
╚═══════════════════════════════════════════════════════════════════════════╝

Create options for players to change how the character plays, either as silly
fun bonuses or useful training utilities (e.g. filling a meter instantly).

Use the initCheat() function to create a Cheat:

	CHEAT_[NAME_HERE] = initCheat(name, [options], [option_names], description)

Glossary:
	
	"CHEAT_[NAME_HERE]" is a variable that stores the ID of the Cheat. In the
		example below, CHEAT_FLY is equal to 0. This is necessary for
		referencing your cheat later in your character's code.
	
	"[options]" is an array of the possible values that the Cheat can have. A
		simple example is [0, 1] for on and off, but it could also be something
		like [0, 1, 5, 9] or ["Cherry", "Strawberry", ""].
	
	"[option_names]" is an array of the displayed names for the options given in
		"[options]". It should be the same length as "[options]", and each entry
		should be a string.
	
To access a Cheat's current value inside your character's code, grab the entry
in the "phone_cheats" array at the index of the "CHEAT_" variable. For example:

	// update.gml
	
	if phone_cheats[CHEAT_FLY] == 1{
		vsp = -2;
	}

The "phone_cheats" array entry holds whatever value you defined in "[options]",
for the Cheat's current setting. (e.g. "phone_cheats" could contain a string,
not just a number)

You can also run code only at the moment that the Cheat was clicked on, by
using the "phone_cheats_updated" array (each entry is just true or false):
	
	// update.gml
	
	if phone_cheats_updated[CHEAT_FLY]{
		phone_cheats_updated[CHEAT_FLY] = 0; // you have to reset it yourself
		if phone_cheats[CHEAT_FLY]{
			print("Flight started");
		}
		else{
			print("Flight ended");
		}
	}

Pro tip: having a Cheat with only a single option is useful if you just need a
"click button to do X" thing for your character, e.g. "click to reset meter to
zero".

*/

#define CORE_cheats

CHEAT_KI		= initCheat("Infinite Ki Meter", [0, 1], ["Off", "On"], "Force the Ki Meter to always be full, useful for testing SSJ combos.");
CHEAT_TRAILER	= initCheat("Trailer Mode", [0, 1], ["Off", "On"], "Disable the Ki Meter on the HUD, to help get cleaner clips for trailers or videos.");



/*
╔═══════════════════════════════════════════════════════════════════════════╗
║																			║
║ Frame Data																║
║																			║
╚═══════════════════════════════════════════════════════════════════════════╝

Customise the Frame Data guide.

*/

#define CORE_frame_data

// Reorder this list to change the order that moves appear in the guide!
phone.move_ordering = [
	AT_JAB,
	AT_FTILT,
	AT_DTILT,
	AT_UTILT,
	AT_DATTACK,
	AT_FSTRONG,
	AT_USTRONG,
	AT_DSTRONG,
	AT_FSTRONG_2,
	AT_USTRONG_2,
	AT_DSTRONG_2,
	AT_NAIR,
	AT_FAIR,
	AT_BAIR,
	AT_UAIR,
	AT_DAIR,
	AT_NSPECIAL,
	AT_NSPECIAL_AIR,
	AT_NSPECIAL_2,
	AT_FSPECIAL,
	AT_FSPECIAL_AIR,
	AT_FSPECIAL_2,
	AT_USPECIAL,
	AT_USPECIAL_GROUND,
	AT_USPECIAL_2,
	AT_DSPECIAL,
	AT_DSPECIAL_AIR,
	AT_DSPECIAL_2,
	AT_NTHROW,
	AT_FTHROW,
	AT_UTHROW,
	AT_DTHROW,
	AT_EXTRA_1,
	AT_EXTRA_2,
	AT_EXTRA_3,
	AT_TAUNT,
	AT_TAUNT_2,
	AT_PHONE,
	2,
	3,
	39,
	42,
	43,
	44,
	45,
	46,
	47,
	48,
	49,
	50
];

// Whether or not to include the "Stats" page.
phone.include_stats = true;

// Notes for the "Stats" page - put "-" for no notes.
phone.stats_notes = "-";

// Whether or not to include a custom data page, which can hold any values you
// want - useful for data that's specific to your character's mechanics.
phone.include_custom = false;

// The name of the custom page.
phone.custom_name = "Example Custom Data"

// The content of the custom page.
initCFDHeader("Article lifetime");
initCFDBody("100 frames");
initCFDHeader("Second value");
initCFDBody("459");
initCFDBody("epic");



/*
╔═══════════════════════════════════════════════════════════════════════════╗
║																			║
║ Muno Character Compatibility												║
║																			║
╚═══════════════════════════════════════════════════════════════════════════╝

Add bonus features and interactions with Muno's characters, like a codec for
Trummel & Alto.

If you don't feel like adding one of them, you can just comment out the lines
of code.

*/

#define CORE_muno_compatibility

/*
Trummel codec:

initCodec(gimmick)
initCodecPage(speaker, expression, gimmick, text)

The variable trummel_id is initially set to noone (-4). When Trummel opens this
char's codec, trummel_id is set to Trummel's object ID.

Codec speaker handles:
SPK_TRUM: Trum
SPK_ALTO: Alto
SPK_OTTO: Otto
SPK_CODA: Coda
SPK_ECHO: Tempo
SPK_MINE: Steve (i dont normally use this one... like, what is he supposed to say?? the funny oof noise? you can if you want)
SPK_SEGA: Sonic (see above)

Codec gimmicks:
there aren't any

Page gimmick handles:
GIM_CHOMP			make the enemy ftilt
GIM_CLONE 			display 2 speakers
GIM_LAUGH_TRACK		play the funny haha sound
GIM_SKIP 			advance the page immediately when the text finishes
GIM_DIE				die
GIM_SHUT_UP			no chatter sfx
GIM_HOWL			make the enemy dspecial
GIM_SHADER			use your char's shaders (palette swaps) for the speaker portrait
GIM_TEXTBOX			text color				is set to the value of the	spr_custom_trummel_textbox	variable in the player object
GIM_COLOR			textbox sprite index	is set to the value of the	spr_custom_trummel_color	variable in the player object

To use multiple gimmicks on a single page, MULTIPLY them together.
*/

initCodec(0); // this should just always be 0, because there are no codec gimmicks
initCodecPage(SPK_ALTO, 3, 0, "Hey! It's him! Goku!");
initCodecPage(SPK_TRUM, 0, 0, "TRUE");
initCodecPage(SPK_OTTO, 0, 0, "This guy's not to be messed around with, you know.");
initCodecPage(SPK_OTTO, 1, 0, "He's a seasoned fighter, with experience against interdimensional threats.");
initCodecPage(SPK_ALTO, 2, 0, "Including the... ''God of Destruction'' Beerus? Goodness.");
initCodecPage(SPK_TRUM, 0, 0, "dbz doesnt mess around huh");
initCodecPage(SPK_CODA, 0, 0, "He's got a lot to show for it in Rivals, too.");
initCodecPage(SPK_CODA, 0, 0, "Goku can transform into one of several Super Saiyan forms, which all act the same.");
initCodecPage(SPK_CODA, 0, 0, "Super Saiyan Goku gets access to powerful cancel combos and more powerful Strong Attacks, plus a giant Spirit Bomb.");
initCodecPage(SPK_OTTO, 0, 0, "The other form is his red-colored Kaioken state, which he can access whenever he wants for a small damage boost.");
initCodecPage(SPK_ECHO, 2, 0, "That meter fills up super slowly as he deals damage... I bet he can probably only use it once per match!");
initCodecPage(SPK_CODA, 1, 0, "Yes... but Goku can push his limits with Kaioken to fill it early, at the cost of self-damage.");
initCodecPage(SPK_ALTO, 9, 0, "So it's like a gamble! Maybe we can exploit that if he gets cocky.");
initCodecPage(SPK_OTTO, 9, 0, "Goku also becomes more vulnerable to launches when in Super Saiyan form.");
initCodecPage(SPK_ALTO, 4, 0, "We have our gameplan, then - let him push his luck, and then punish him for it!");
initCodecPage(SPK_TRUM, 0, 0, "hope its more punishable than buster chord");

// Otto bobblehead.
otto_bobblehead_sprite = sprite_get("_pho_example_bobble_head");

// Otto bobblehead body. (optional, don't really need this)
otto_bobblebody_sprite = sprite_get("_pho_example_bobble_body");

// Steve death message.
steve_death_message = "Steve's power level was too low";

// Link spear. (determines which spear your char will drop the first time)
link_spear_drop = 1;

/*
Spear IDs:

1: Traveler's Spear
2: Knight's Halberd
3: Wooden Mop
4: Spiked Boko Spear
5: Flamespear
6: Frostspear
7: Thunderspear
8: Guardian Spear
*/



/*
╔═══════════════════════════════════════════════════════════════════════════╗
║																			║
║ Behind-The-Scenes															║
║																			║
╚═══════════════════════════════════════════════════════════════════════════╝

This is the end of the stuff you need to worry about!

Below this point are just all of the functions used to make the above sections
work.

It's not recommended to edit anything below here unless you know what you're
doing and have a good reason to.

*/

#define initTip(tip_name)

array_push(phone.tips, {
	name: tip_name,
	objs: [],
	page_starts: [0]
});

phone.currently_edited_obj = phone.tips[array_length(phone.tips) - 1];

initWords_ext("- " + tip_name + " -", fa_center, phone.apps[phone.APP_TIPS].color, 0, 0);

#define initPatch(patch_version, patch_date)

array_push(phone.patches, {
	name: (patch_date == "" ? "" : "v") + patch_version,
	objs: [],
	page_starts: [0]
});

phone.currently_edited_obj = phone.patches[array_length(phone.patches) - 1];

if patch_date == ""{
	initWords_ext("- " + patch_version + " -", fa_center, phone.apps[phone.APP_PATCHES].color, 0, 0);
}
else{
	initWords_ext("- v" + patch_version + ": " + patch_date + " -", fa_center, phone.apps[phone.APP_PATCHES].color, 0, 0);
}

#define initHeader(obj_text)

initWords_ext(obj_text, fa_left, "h", 0, 0);

#define initSection(obj_text)

initWords_ext(obj_text, fa_left, c_white, 1, 0);

#define initWords(obj_text)

array_push(phone.currently_edited_obj.objs, {
	type: 0,
	text: obj_text,
	align: fa_left,
	color: c_white,
	indent: 0,
	side_by_side: false
});

#define initWords_ext(obj_text, obj_align, obj_color, obj_indent, obj_ignore_height)

array_push(phone.currently_edited_obj.objs, {
	type: 0,
	text: obj_text,
	align: obj_align,
	color: obj_color,
	indent: obj_indent,
	side_by_side: obj_ignore_height
});

#define initImage(obj_sprite, obj_frame)

array_push(phone.currently_edited_obj.objs, {
	type: 1,
	sprite: obj_sprite,
	frame: obj_frame,
	align: fa_center,
	xscale: 2,
	yscale: 2,
	uses_shader: 1,
	color: c_white,
	alpha: 1,
	margin_l: noone,
	margin_r: noone,
	margin_u: noone,
	margin_d: noone,
	needs_auto_margins: true,
	side_by_side: false
});

#define initImage_ext(obj_sprite, obj_frame, obj_align, obj_xscale, obj_yscale, obj_uses_shader, obj_color, obj_alpha, obj_ignore_height, obj_l, obj_r, obj_u, obj_d)

array_push(phone.currently_edited_obj.objs, {
	type: 1,
	sprite: obj_sprite,
	frame: obj_frame,
	align: obj_align,
	xscale: obj_xscale,
	yscale: obj_yscale,
	uses_shader: obj_uses_shader,
	color: obj_color,
	alpha: obj_alpha,
	margin_l: obj_l,
	margin_r: obj_r,
	margin_u: obj_u,
	margin_d: obj_d,
	needs_auto_margins: (obj_l == noone && obj_r == noone && obj_u == noone && obj_d == noone),
	side_by_side: obj_ignore_height
});

#define initCheat(ch_name, ch_opt, ch_opt_name, ch_desc)

array_push(phone.cheats, {
	name: ch_name,
	options: ch_opt,
	option_names: ch_opt_name,
	description: ch_desc,
	on: 0
});

array_push(phone_cheats, ch_opt[0]);
array_push(phone_cheats_updated, 0);
return array_length(phone.cheats) - 1;

#define initCFDHeader(text)

array_push(phone.custom_fd_content, {
	type: 0, // header
	content: text
});

#define initCFDBody(text)

array_push(phone.custom_fd_content, {
	type: 1, // body
	content: text
});

#define initCodec(cd_gimmick)

if "trummel_codecs" not in self trummel_codecs = [];

var new_cdc = {
	gimmick: cd_gimmick,
	pages: []
};

array_push(trummel_codecs, new_cdc);

#define initCodecPage(cd_speaker, cd_expression, cd_gimmick, cd_text)

var new_page = {
	speaker: cd_speaker,
	expression: cd_expression,
	gimmick: cd_gimmick,
	text: cd_text
};

array_push(trummel_codecs[array_length(trummel_codecs) - 1].pages, new_page);

#define initSpeaker(idx, speak_name, speak_sprite)

if "trummel_speakers" not in self trummel_speakers = [];

trummel_speakers[idx] = {
	name: speak_name,		// Name displayed while talking
	sprite: speak_sprite	// Sprite of face
};

return idx * -1;