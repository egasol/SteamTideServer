if (--Tick == 0)
{
	if (Time++ == 24) Time = 0;
	
	Darkness = (1+cos(2*pi*Time/24))/2;
	
	//ds_list_add(Output, "Time: "+string(Time)+":00");
	
	if (Time > 22 || Time < 4)
	{
		if (ds_list_size(ClientsList) > 0)
		{
			repeat(irandom_range(1, 2))
			{
				var Sprite, X, Y;
			
				Sprite = choose("spider", "wolf");
			
				do
				{
					X = irandom(room_width);
					Y = irandom(room_height);
				}
				until !GridGetCell(X, Y);
			
				EntityCreate(SpriteID[? Sprite], -2, X, Y, 0, 0, 0);
			}
		}
	}
	
	DarknessBuffer((1+cos(2*pi*Time/24))/2);
	
	ClientSendAll(BufferWrite);
	
	Tick = TickMax;
}