///SkillJump(oEntity, X, Y)
function SkillFishing(argument0, argument1, argument2) {

	var oEntity, X, Y;

	oEntity = argument0;

	X = argument1;
	Y = argument2;

	if (oEntity.SpriteHold = SpriteID[? "fishingrod"] && oEntity.SpriteHoldAnimation = 1)
	{
		var Distance, Direction;

		Distance = point_distance(oEntity.x, oEntity.y, X, Y);
		Direction = point_direction(oEntity.x, oEntity.y, X, Y);

		Distance = clamp(Distance, 32, 192);

		X = oEntity.x+lengthdir_x(Distance, Direction);
		Y = oEntity.y+lengthdir_y(Distance, Direction);

		if GridGetCell(X, Y)
		{
			Effect(X, Y, SpriteID[? "effectwater"], 3);
		
			if (irandom(6) == 0)
			{
				var Sprite, SpriteAnimation;
			
				Sprite = SpriteID[? "fish"];
				SpriteAnimation = irandom(SpriteNumber[? Sprite]-1);
			
				EntityCreate(Sprite, SpriteAnimation, X, Y, oEntity.x, oEntity.y, 48);
			}
		}
	}


}
