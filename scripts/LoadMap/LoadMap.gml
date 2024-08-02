function LoadMap(argument0) {
	var FileRead;

	FileRead = argument0;

	MapSeed = file_text_read_real(FileRead);

	if (MapSeed <= 0)
	{
		randomize();
		ds_list_add(Output, "Seed randomized");
	}
	else
	{
		random_set_seed(MapSeed)
		ds_list_add(Output, "Seed set to "+string(MapSeed));
	}

	globalvar Map, WorldWidth, WorldHeight, WorldCellWidth, WorldCellHeight, WorldGridWidth, WorldGridHeight;

	WorldWidth = room_width;
	WorldHeight = room_height;

	WorldCellWidth = 48;
	WorldCellHeight = 48;

	WorldGridWidth = floor(WorldWidth/WorldCellWidth);
	WorldGridHeight = floor(WorldHeight/WorldCellHeight);

	Map = mp_grid_create(0, 0, WorldGridWidth, WorldGridHeight, WorldCellWidth, WorldCellHeight);

	//----------------------------------Water Generator----------------------------------//

	mp_grid_clear_all(Map);

	//Borders
	for (var i = 0; i < WorldGridWidth; i++)
	{
		mp_grid_add_cell(Map, i, 0);
		mp_grid_add_cell(Map, i, WorldGridHeight-1);
	}

	for (var i = 0; i < WorldGridHeight; i++)
	{
		mp_grid_add_cell(Map, 0, i);
		mp_grid_add_cell(Map, WorldGridWidth-1, i);
	}

	var X, Y, W, H, Lakes, LakeSizes;

	Lakes = file_text_read_real(FileRead);
	LakeSizes = file_text_read_real(FileRead);

	file_text_readln(FileRead);

	//Lakes
	repeat (Lakes)
	{
		X = random(room_width);
		Y = random(room_height);
	
		repeat (LakeSizes)
		{
			X += random_range(-128, 128);
			Y += random_range(-128, 128);
		
			W = random_range(48, 192);
			H = random_range(48, 192);
		
			mp_grid_add_rectangle(Map, X-W, Y-H, X+W, Y+H);
		}
	}

	//-------------------------------Generate Formations-------------------------------//
	var Line, X, Y, Sprite, Subimage, Groves, Amount, R1, R2;

	while !file_text_eof(FileRead)
	{
		Line = file_text_read_string(FileRead);
	
		file_text_readln(FileRead);
	
		if (Line == "<formation>")
		{
			Groves = file_text_read_real(FileRead);

			file_text_readln(FileRead);
		
			for (var i = 0; i < Groves; i++)
			{
				X[i] = random(room_width);
				Y[i] = random(room_height);
			}
		}
		else
		{
			Sprite = Line;
			Subimage = file_text_read_real(FileRead);
			Amount = file_text_read_real(FileRead);
			R1 = file_text_read_real(FileRead);
			R2 = file_text_read_real(FileRead);
		
			file_text_readln(FileRead);
		
			for (var i = 0; i < Groves; i++)
			{
				AddGrove(X[i], Y[i], R1, R2, SpriteID[? Sprite], Subimage, Amount);
			}
		}
	}


}
