///EntityPathfind(ID, MoveX, MoveY)
function EntityPathfind(argument0, argument1, argument2) {

	var ID, MoveX, MoveY;

	ID = argument0;

	MoveX = argument1;
	MoveY = argument2;

	if !GridGetCell(MoveX, MoveY)
	{
		var oEntity = EntityID[? ID];

		if (oEntity != undefined)
		{
			if (oEntity.MoveZ == 0)
			{
				oEntity.GoalX = MoveX;
				oEntity.GoalY = MoveY;
	
				if (GridCollisionLine(oEntity.x, oEntity.y, MoveX, MoveY) < 1)
				{
					if mp_grid_path(Map, oEntity.PathID, oEntity.x, oEntity.y, MoveX, MoveY, true)
					{
						oEntity.Pathing = 1;
				
						MoveX = path_get_point_x(oEntity.PathID, oEntity.Pathing);
						MoveY = path_get_point_y(oEntity.PathID, oEntity.Pathing);
					}
					else
					{
						MoveX = oEntity.x;
						MoveY = oEntity.y;
					
						Pathing = -1;
					}
				}
				else
				{
					oEntity.Pathing = -1;
				}
		
				//------------------------------------Animation--------------------------------------//
				var Sprite;
		
				if (oEntity.SpriteHold >= 0)
				{
					Sprite = oEntity.Animation[? "Carry"];
				}
				else
				{
					Sprite = oEntity.Animation[? "Move"];
				}
		
				if (oEntity.Sprite != Sprite)
				{
					EntitySprite(ID, Sprite, -2, oEntity.SpriteHold, oEntity.SpriteHoldAnimation);
				}
				//-----------------------------------------------------------------------------------//
		
				EntityMove(ID, MoveX, MoveY, oEntity.Speed, 0);
			}
		}
	}


}
