function ReadDrop(argument0) {
	var PlayerID = argument0;

	var X, Y, oPlayer;

	X = buffer_read(BufferRead, buffer_u32);
	Y = buffer_read(BufferRead, buffer_u32);

	oPlayer = EntityID[? PlayerID];

	if (oPlayer != undefined)
	{
		if (oPlayer.SpriteHold >= 0)
		{
			var Distance, Direction;
		
			Distance = clamp(point_distance(oPlayer.x, oPlayer.y, X, Y), 24, 128);
			Direction = point_direction(oPlayer.x, oPlayer.y, X, Y);
		
			X = oPlayer.x+lengthdir_x(Distance, Direction);
			Y = oPlayer.y+lengthdir_y(Distance, Direction);
		
			//----------Avoid throwing things with health in water---------//
			var Behavior = BehaviorList[? oPlayer.SpriteHold];
		
			if (Behavior != undefined)
			{
				if (Behavior[? "Health"] > 0)
				{
					var t = (0.9)*GridCollisionLine(oPlayer.x, oPlayer.y, X, Y);
				
					X = oPlayer.x+t*(X-oPlayer.x);
					Y = oPlayer.y+t*(Y-oPlayer.y);
				}
			}
			//-------------------------------------------------------------//
		
			EntityCreate(oPlayer.SpriteHold, oPlayer.SpriteHoldAnimation, oPlayer.x, oPlayer.y, X, Y, 64);
	
			//EntitySprite(PlayerID, SpriteID[? "human"], oPlayer.SpriteAnimation, -1, 0);
			EntitySprite(PlayerID, oPlayer.Animation[? "Move"], oPlayer.SpriteAnimation, -1, 0);
		}
	}


}
