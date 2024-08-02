var FileGetID, FileStatus, FilePath;

FileGetID = ds_map_find_value(async_load, "id");
FileStatus = ds_map_find_value(async_load, "status");
FilePath = ds_map_find_value(async_load, "result");

if (FileStatus == 0)
{
	var FileRead = file_text_open_read(FilePath);
	
	if (FileGetID == FileGetSprites)
	{
		var i = 0, Name, Number, OffsetX, OffsetY;
		
		while !file_text_eof(FileRead)
		{
			Name = file_text_read_string(FileRead);
			Number = file_text_read_real(FileRead);
			OffsetX = file_text_read_real(FileRead);
			OffsetY = file_text_read_real(FileRead);
			
			file_text_readln(FileRead);
			
			AddSprite(Name, Number, OffsetX, OffsetY);
			
			// ds_list_add(Output, "     "+Name);
			
			i++;
		}
		
		ds_list_add(Output, string(i)+" sprites loaded.");
	}
	
	if (FileGetID == FileGetRecipes)
	{
		var i = 0, StringCombine, StringResult;
		
		while !file_text_eof(FileRead)
		{
			StringCombine = file_text_read_string(FileRead);
			
			file_text_readln(FileRead);
			
			StringResult = file_text_read_string(FileRead);
			
			file_text_readln(FileRead);
			file_text_readln(FileRead);
			
			CombineList[? StringCombine] = StringResult;
			
			//ds_list_add(Output, "     "+StringCombine+" + "+StringResult);
			
			i++;
		}
		
		ds_list_add(Output, string(i)+" recipes loaded.");
	}
	
	if (FileGetID == FileGetMap)
	{
		LoadMap(FileRead);
	}
	
	file_text_close(FileRead);
}

if (SERVER_STARTED == false)
{
	if (ds_map_size(SpriteID) > 0 && ds_map_size(CombineList) > 0)
	{
		if (MapSeed == noone)
		{
			LoadBehaviorList();
			LoadStatsList();
			LoadAnimationList();
			LoadWeaponList();
			LoadFoodList();
			LoadLightsourceList();
			//LoadMap();
			
			FileGetMap = http_get_file(URL+FileNameMap, FileNameMap);
		}
		else
		{
			network_create_server(network_socket_tcp, Port, ClientsMax);

			Tick = TickMax;
			Time = 10;
		
			Darkness = 0;

			ds_list_add(Output, "Server started");
		
			SERVER_STARTED = true;
		}
	}
}