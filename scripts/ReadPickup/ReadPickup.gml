function ReadPickup(argument0) {
	var PlayerID = argument0;

	var PickupID, oPlayer, oPickup;

	PickupID = buffer_read(BufferRead, buffer_u16);

	oPlayer = EntityID[? PlayerID];
	oPickup = EntityID[? PickupID];

	if (oPlayer != undefined && oPickup != undefined)
	{
		oPlayer.Pickup = oPickup;
		oPlayer.Target = false;
	
		var Distance = point_distance(oPlayer.x, oPlayer.y, oPickup.x, oPickup.y);

		if (Distance > oPlayer.UseRange)
		{
			EntityPathfind(PlayerID, oPickup.x, oPickup.y);
		}
	}


}
