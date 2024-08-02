///CombineExists(self, other)
function CombineExists(argument0, argument1) {

	var oPlayer, oEntity;

	oPlayer = argument0;
	oEntity = argument1;

	var SpriteNameHoldPrevious, SpriteHoldAnimationPrevious, 
		SpriteNamePrevious, SpriteAnimationPrevious, 
		CombinationPrevious;

	if (oPlayer.SpriteHold >= 0)
	{
		SpriteNameHoldPrevious = SpriteName[? oPlayer.SpriteHold];
		SpriteHoldAnimationPrevious = string(oPlayer.SpriteHoldAnimation);
	}
	else
	{
		SpriteNameHoldPrevious = "empty";
		SpriteHoldAnimationPrevious = "0";
	}

	SpriteNamePrevious = SpriteName[? oEntity.Sprite];
	SpriteAnimationPrevious = string(oEntity.SpriteAnimation);

	CombinationPrevious = SpriteNameHoldPrevious+"["+SpriteHoldAnimationPrevious+"]"+
							SpriteNamePrevious+"["+SpriteAnimationPrevious+"]";

	if ds_map_exists(CombineList, CombinationPrevious)
		return true;
	else
		return false;


}
