function ReadJoin(argument0) {
	var PlayerID = argument0;

	//Send existing entities to new player
	var Entities, EntityIndex, oEntity;

	Entities = ds_map_size(EntityID);
	EntityIndex = ds_map_find_first(EntityID);

	for (var i = 0; i < Entities; i++)
	{
		oEntity = EntityID[? EntityIndex];
	
		buffer_seek(BufferWrite, buffer_seek_start, 0);
	
		buffer_write(BufferWrite, buffer_string, "Create");
	
		EntityDataBuffer(oEntity);
	
		network_send_packet(PlayerID, BufferWrite, buffer_tell(BufferWrite));
	
		EntityIndex = ds_map_find_next(EntityID, EntityIndex);
	}

	//Send map grid to new player
	var X = 0, Y = 0, W = WorldGridWidth, H = WorldGridHeight, Cell;

	buffer_seek(BufferWrite, buffer_seek_start, 0);

	buffer_write(BufferWrite, buffer_string, "Map");

	buffer_write(BufferWrite, buffer_u32, X);
	buffer_write(BufferWrite, buffer_u32, Y);

	buffer_write(BufferWrite, buffer_u32, W);
	buffer_write(BufferWrite, buffer_u32, H);

	for (var j = Y; j < Y+H; j++)
	{
		for (var i = X; i < X+W; i++)
		{
			Cell = mp_grid_get_cell(Map, i, j);
		
			buffer_write(BufferWrite, buffer_bool, (Cell == 0));
		}
	}

	network_send_packet(PlayerID, BufferWrite, buffer_tell(BufferWrite));

	//Create Player
	var Players = instance_number(Player);

	if (Players > 0)
	{
		//Spawn at a player
		var oPlayer = Player;
		//var oPlayer = instance_find(Player, irandom(Players)-1);
	
		X = oPlayer.x;
		Y = oPlayer.y;
	}
	else
	{
		//Spawn at a random location
		do
		{
			X = irandom(room_width);
			Y = irandom(room_height);
		}
		until !GridGetCell(X, Y);
	}

	PlayerCreate(PlayerID, X, Y);

	DarknessBuffer(Darkness);

	network_send_packet(PlayerID, BufferWrite, buffer_tell(BufferWrite));


}
