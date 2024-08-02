///AddAnimation(SpriteNameBase, SpriteStrikeName, SpriteCarryName, SpriteCorpseName)
function AddAnimation(argument0, argument1, argument2, argument3) {

	var SpriteNameBase, SpriteStrikeName, SpriteCarryName, SpriteCorpseName;

	SpriteNameBase = argument0;
	SpriteStrikeName = argument1;
	SpriteCarryName = argument2;
	SpriteCorpseName = argument3;

	var Sprite, SpriteStrike, SpriteCarry, SpriteCorpse, Animation;

	Sprite = SpriteID[? SpriteNameBase];
	SpriteStrike = SpriteID[? SpriteStrikeName];
	SpriteCarry = SpriteID[? SpriteCarryName];
	SpriteCorpse = SpriteID[? SpriteCorpseName];

	Animation = ds_map_create();

	if (Sprite != undefined)		Animation[? "Move"] = Sprite;

	if (SpriteStrike != undefined)	Animation[? "Strike"] = SpriteStrike; else Animation[? "Strike"] = Sprite;

	if (SpriteCarry != undefined)	Animation[? "Carry"] = SpriteCarry; else Animation[? "Carry"] = Sprite;

	if (SpriteCorpse != undefined)	Animation[? "Corpse"] = SpriteCorpse; else Animation[? "Corpse"] = Sprite;

	AnimationList[? Sprite] = Animation;


}
