function ClientConnect(argument0, argument1) {
	var ClientID, ClientIP;

	ClientID = argument0;
	ClientIP = argument1;

	ds_list_add(ClientsList, ClientID);

	var SpritesTotal, SpriteNameIndex;

	SpritesTotal = ds_map_size(SpriteName);
	SpriteNameIndex = ds_map_find_first(SpriteName);

	buffer_seek(BufferWrite, buffer_seek_start, 0);

	buffer_write(BufferWrite, buffer_string, "Join");

	buffer_write(BufferWrite, buffer_u8, ClientID);

	//Map
	buffer_write(BufferWrite, buffer_u32, room_width);
	buffer_write(BufferWrite, buffer_u32, room_height);

	//Sprites
	buffer_write(BufferWrite, buffer_string, URL+"uploads/");
	buffer_write(BufferWrite, buffer_u8, SpritesTotal);

	for (var i = 0; i < SpritesTotal; i++)
	{
		buffer_write(BufferWrite, buffer_u8, SpriteNameIndex);
		buffer_write(BufferWrite, buffer_string, SpriteName[? SpriteNameIndex]);
		buffer_write(BufferWrite, buffer_u8, SpriteNumber[? SpriteNameIndex]);
		buffer_write(BufferWrite, buffer_u16, SpriteOriginX[? SpriteNameIndex]);
		buffer_write(BufferWrite, buffer_u16, SpriteOriginY[? SpriteNameIndex]);
	
		SpriteNameIndex = ds_map_find_next(SpriteName, SpriteNameIndex);
	}

	network_send_packet(ClientID, BufferWrite, buffer_tell(BufferWrite));

	ds_list_add(Output, ClientIP+" (socket: "+string(ClientID)+") connected.");


}
