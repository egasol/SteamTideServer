///SkillSlash(oCaster, X, Y)
function SkillSlash(argument0, argument1, argument2) {

	var oCaster, X, Y;

	oCaster = argument0;

	X = argument1;
	Y = argument2;

	var Entities, EntityIndex, oEntity, Distance, Direction, ToX, ToY;;

	Entities = ds_map_size(EntityID);
	EntityIndex = ds_map_find_first(EntityID);

	for (var i = 0; i < Entities; i++)
	{
		if (EntityIndex != oCaster.ID)
		{
			oEntity = EntityID[? EntityIndex];
		
			if (oEntity != undefined)
			{
				Distance = point_distance(oCaster.x, oCaster.y, oEntity.x, oEntity.y);
		
				if (Distance < 128)
				{
					Direction = point_direction(oCaster.x, oCaster.y, oEntity.x, oEntity.y);
			
					ToX = oEntity.x+lengthdir_x(128, Direction);
					ToY = oEntity.y+lengthdir_y(128, Direction);
			
					EntityMove(oEntity.ID, ToX, ToY, 2, 32);
				}
			}
		}
	
		EntityIndex = ds_map_find_next(EntityID, EntityIndex);
	}


}
