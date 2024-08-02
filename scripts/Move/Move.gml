///Move(MoveX, MoveY, MoveSpeed)
function Move(argument0, argument1, argument2) {

	var MoveX, MoveY, MoveSpeed;

	MoveX = argument0;
	MoveY = argument1;
	MoveSpeed = argument2;

	var Distance, Direction;

	Distance = point_distance(x, y, MoveX, MoveY);
	Direction = point_direction(x, y, MoveX, MoveY);

	if (Distance > MoveSpeed)
	{
		x += lengthdir_x(MoveSpeed, Direction);
		y += lengthdir_y(MoveSpeed, Direction);
	
		return true;
	}
	else
	{
		if (Pathing >= 0)
		{
			if (++Pathing < path_get_number(PathID))
			{
				//Path Follow
				MoveX = path_get_point_x(PathID, Pathing);
				MoveY = path_get_point_y(PathID, Pathing);
			
				EntityMove(ID, MoveX, MoveY, MoveSpeed, 0);
			}
			else
			{
				//Path End
				Pathing = -1;
			
				x = MoveX;
				y = MoveY;
			}
		}
		else
		{
			//Move End
			x = MoveX;
			y = MoveY;
		
			MoveZ = 0;
		
			//Water
			if (GridGetCell(MoveX, MoveY))// && Health == 0)
			{
				Effect(MoveX, MoveY, SpriteID[? "effectwater"], 3);
			
				EntityDestroy(ID);
			}
		}
	
		return false;
	}


}
