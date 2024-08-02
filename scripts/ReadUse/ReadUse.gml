function ReadUse(argument0) {
	var PlayerID = argument0;

	var UseID, oPlayer, oTarget;

	UseID = buffer_read(BufferRead, buffer_u16);

	oPlayer = EntityID[? PlayerID];
	oTarget = EntityID[? UseID];

	if (oPlayer != undefined && oTarget != undefined)
	{
		oPlayer.Pickup = false;
		oPlayer.Target = oTarget;
	
		var Distance;
	
		Distance = point_distance(oPlayer.x, oPlayer.y, oTarget.x, oTarget.y)
	
		if (Distance > oPlayer.UseRange)
		{
			EntityPathfind(PlayerID, oTarget.x, oTarget.y);
		}
	}


}
