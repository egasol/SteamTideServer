///Combine(self, other)
function Combine(argument0, argument1) {

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

	CombinationPrevious = SpriteNameHoldPrevious+"["+SpriteHoldAnimationPrevious+"]"
						+SpriteNamePrevious+"["+SpriteAnimationPrevious+"]";

	if (CombineList[? CombinationPrevious] != undefined)
	{
		var SpriteNameHoldNext, SpriteHoldAnimationNext, 
			SpriteNameNext, SpriteAnimationNext, 
			StringTemporary, Pos;
	
		//SpriteNameHoldNext
		StringTemporary = CombineList[? CombinationPrevious];
	
		Pos = string_pos("[", StringTemporary);
		SpriteNameHoldNext = string_copy(StringTemporary, 0, Pos-1);
	
		//SpriteHoldAnimationNext
		StringTemporary = string_delete(StringTemporary, 1, Pos);
	
		Pos = string_pos("]", StringTemporary);
		SpriteHoldAnimationNext = real(string_copy(StringTemporary, 0, Pos-1));
	
		//SpriteNameNext
		StringTemporary = string_delete(StringTemporary, 1, Pos);
	
		Pos = string_pos("[", StringTemporary);
		SpriteNameNext = string_copy(StringTemporary, 0, Pos-1);
	
		//SpriteAnimationNext
		StringTemporary = string_delete(StringTemporary, 1, Pos);
	
		Pos = string_pos("]", StringTemporary);
		SpriteAnimationNext = real(string_copy(StringTemporary, 0, Pos-1));
	
		//Create
		StringTemporary = string_delete(StringTemporary, 1, Pos);
	
		Pos = string_pos("[", StringTemporary);
	
		if (Pos != 0)
		{
			var SpriteNew, SpriteAnimationNew;
		
			SpriteNew = string_copy(StringTemporary, 0, Pos-1);
		
			StringTemporary = string_delete(StringTemporary, 1, Pos);
		
			Pos = string_pos("]", StringTemporary);
			SpriteAnimationNew = real(string_copy(StringTemporary, 0, Pos-1));
		
			var X, Y, Range = 60;
		
			X = oEntity.x+irandom_range(-Range, Range);
			Y = oEntity.y+irandom_range(0, Range);
		
			EntityCreate(SpriteID[? SpriteNew], SpriteAnimationNew, oEntity.x, oEntity.y, X, Y, 32);
		}
	
		//Effect
		Effect(oEntity.x, oEntity.y, SpriteID[? "effectchop"], 1);
		//Message(SpriteNameNext, oEntity.x, oEntity.y);
	
		//Update Hold Thing
		if (SpriteNameHoldNext != "empty")
			EntitySprite(oPlayer.ID, Animation[? "Carry"], -2, SpriteID[? SpriteNameHoldNext], SpriteHoldAnimationNext);
		else
			EntitySprite(oPlayer.ID, Animation[? "Move"], -2, -1, 0);
	
		//Change Thing
		if (SpriteNameNext != "empty")
		{
			var Sprite = SpriteID[? SpriteNameNext];
		
			EntitySprite(oEntity.ID, Sprite, SpriteAnimationNext, oEntity.SpriteHold, oEntity.SpriteHoldAnimation);
		}
		else EntityDestroy(oEntity.ID);
	
		return true;
	}
	else return false;


}
