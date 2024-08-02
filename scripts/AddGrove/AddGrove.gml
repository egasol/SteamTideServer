///AddGrove(GroveX, GroveY, InnerRadius, InnerSprite, InnerSubimage, InnerAmount, OuterRadius, OuterSprite, OuterSubimage, OuterAmount)
function AddGrove(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	var GroveX, GroveY, R1, R2, Sprite, SpriteSubimage, Amount;

	GroveX = argument0;
	GroveY = argument1;

	R1 = argument2;
	R2 = argument3;

	Sprite = argument4;
	SpriteSubimage = argument5;
	Amount = argument6;

	var X, Y, Subimage;

	for (var i = 0; i < Amount; i++)
	{
		if (SpriteSubimage == -4)
		{
			Subimage = irandom(SpriteNumber[? Sprite]-1);
		}
		else Subimage = SpriteSubimage;
	
		var Distance = random_range(R1, R2), Direction = random(360);
		
		X = round(GroveX+lengthdir_x(Distance, Direction));
		Y = round(GroveY+lengthdir_y(Distance, Direction));
		
		if (X > 0 && X < room_width && Y > 0 && Y < room_height)
		{
			if !GridGetCell(X, Y)
			{
				EntityCreate(Sprite, Subimage, X, Y, 0, 0, 0);
			}
		}
	}
}
