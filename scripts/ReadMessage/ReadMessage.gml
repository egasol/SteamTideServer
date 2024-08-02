function ReadMessage(argument0) {
	var PlayerID = argument0;

	var Text;

	Text = buffer_read(BufferRead, buffer_string);

	if (string_char_at(Text, 0) != "/")
	{
		var oPlayer = EntityID[? PlayerID];
	
		if (oPlayer != undefined)
		{
			Message(Text, oPlayer.x, oPlayer.y-96, c_yellow, true);
		}
	
		ds_list_add(Output, string(PlayerID)+": "+Text);
	}
	else if (Text == "/respawn")
	{
		if (EntityID[? PlayerID] == undefined)
		{
			var X, Y, Players;
		
			Players = instance_number(Player);

			if (Players > 0)
			{
				//Spawn at an existing player
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
		}
	}
	/*
	else if (Text == "/eat")
	{
		var oPlayer = EntityID[? PlayerID];
	
		if (oPlayer != undefined)
		{
			var Heal = FoodList[? oPlayer.SpriteHold];
		
			if (Heal != undefined)
			{
				EntitySprite(PlayerID, oPlayer.Sprite, oPlayer.SpriteAnimation, -1, 0);
			
				oPlayer.Health = clamp(oPlayer.Health+Heal, 0, oPlayer.HealthMax);
		
				EntityStatus(PlayerID, 0, false);
			
				Message("+"+string(Heal), oPlayer.x, oPlayer.y, c_lime, false);
			}
		}
	}
	*/
	else if (Text == "/use")
	{
		var oPlayer = EntityID[? PlayerID];
	
		if (oPlayer != undefined)
		{
			var Heal = FoodList[? oPlayer.SpriteHold];
		
			if (Heal != undefined)
			{
				EntitySprite(PlayerID, oPlayer.Sprite, oPlayer.SpriteAnimation, -1, 0);
			
				oPlayer.Health = clamp(oPlayer.Health+Heal, 0, oPlayer.HealthMax);
		
				EntityStatus(PlayerID, 0, false);
			
				Message("+"+string(Heal), oPlayer.x, oPlayer.y, c_lime, false);
			}
			else
			{
				if (SpriteName[? oPlayer.SpriteHold] == "FlintShovel")
				{
					var X, Y;
			
					X = oPlayer.x+random_range(-32, 32);
					Y = oPlayer.y+random_range(-32, 32);
			
					EntityCreate(SpriteID[? "Clay"], 0, oPlayer.x, oPlayer.y, X, Y, 48);
			
					Effect(oPlayer.x, oPlayer.y, SpriteID[? "effectchop"], 0);
			
					oPlayer.UseTimer = 60;
				}
				else if (oPlayer.SpriteHold = SpriteID[? "fishingrod"] && oPlayer.SpriteHoldAnimation = 1)
				{
					/*
					var Distance, Direction;

					Distance = point_distance(oPlayer.x, oPlayer.y, X, Y);
					Direction = point_direction(oPlayer.x, oPlayer.y, X, Y);

					Distance = clamp(Distance, 32, 192);

					X = oPlayer.x+lengthdir_x(Distance, Direction);
					Y = oPlayer.y+lengthdir_y(Distance, Direction);

					if GridGetCell(X, Y)
					{
						Effect(X, Y, SpriteID[? "effectwater"], 3);
		
						if (irandom(6) == 0)
						{
							var Sprite, SpriteAnimation;
			
							Sprite = SpriteID[? "fish"];
							SpriteAnimation = irandom(SpriteNumber[? Sprite]-1);
			
							EntityCreate(Sprite, SpriteAnimation, X, Y, oPlayer.x, oPlayer.y, 48);
						}
					}
					*/
				}
			}
		}
	}
	else if (Text == "/switch")
	{
		var oPlayer = EntityID[? PlayerID];
	
		if (oPlayer != undefined)
		{
			var Sprite, SpriteAnimation, PlayerSprite;
		
			Sprite = oPlayer.SpriteHold;
			SpriteAnimation = oPlayer.SpriteHoldAnimation;
		
			if (oPlayer.Inventory >= 0)
			{
				PlayerSprite = oPlayer.Animation[? "Carry"];
			}
			else PlayerSprite = oPlayer.Animation[? "Move"];
		
			EntitySprite(PlayerID, PlayerSprite, -2, oPlayer.Inventory, oPlayer.InventoryAnimation);
		
			oPlayer.Inventory = Sprite;
			oPlayer.InventoryAnimation = SpriteAnimation;
		}
	}
	else Command(PlayerID, Text)


}
