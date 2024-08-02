function ReadMove(argument0) {
	var PlayerID = argument0;

	var MoveX, MoveY, oPlayer;

	MoveX = buffer_read(BufferRead, buffer_u32);
	MoveY = buffer_read(BufferRead, buffer_u32);

	oPlayer = EntityID[? PlayerID];

	if (oPlayer != undefined)
	{
		oPlayer.Pickup = false;
		oPlayer.Target = false;

		if (oPlayer.UseTimer <= 0)
		{
			EntityPathfind(PlayerID, MoveX, MoveY);
		}
	}


}
