function BehaviorWander() {
	var Range = 400; //240

	if PlayerCheckNear(x, y, 512, 384)
	{
		var oPlayer, Distance, MoveX, MoveY;
	
		oPlayer = instance_nearest(x, y, Player);
	
		Distance = point_distance(oPlayer.x, oPlayer.y, x, y);
	
		if (Distance < Range)
		{
			//Flee
			var Direction = point_direction(oPlayer.x, oPlayer.y, x, y);
		
			MoveX = x+round(lengthdir_x(Range, Direction));
			MoveY = y+round(lengthdir_y(Range, Direction));
		
			var Loops = 10;
		
			while (GridCollisionLine(x, y, MoveX, MoveY) < 1)
			{
				Direction += 12;
			
				MoveX = x+round(lengthdir_x(Range, Direction));
				MoveY = y+round(lengthdir_y(Range, Direction));
			
				if (Loops-- == 0) break;
			}
		
			EntityMove(ID, MoveX, MoveY, Speed, 0);
		
			alarm = 20;
		}
		else
		{
			//Wander
			MoveX = x+irandom_range(-Range, Range);
			MoveY = y+irandom_range(-Range, Range);
		
			//MoveX = clamp(MoveX, xstart-Range, xstart+Range);
			//MoveY = clamp(MoveY, ystart-Range, ystart+Range);
		
			if (GridCollisionLine(x, y, MoveX, MoveY) == 1)
			{
				EntityMove(ID, MoveX, MoveY, Speed, 0);
			}
		}
	}


}
