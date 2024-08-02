///SkillKnockback(oEntity, X, Y)
function SkillKnockback(argument0, argument1, argument2) {

	var oEntity, X, Y;

	oEntity = argument0;

	X = argument1;
	Y = argument2;

	var oTarget = oEntity.Target;

	if (oTarget != false && instance_exists(oTarget))
	{
		var DistanceTarget = point_distance(oEntity.x, oEntity.y, oTarget.x, oTarget.y);
	
		if (DistanceTarget < 96)
		{
			var Distance = 128, Direction;
	
			Direction = point_direction(oEntity.x, oEntity.y, X, Y);
	
			X = oTarget.x+lengthdir_x(Distance, Direction);
			Y = oTarget.y+lengthdir_y(Distance, Direction);
	
			EntitySprite(oEntity.ID, oEntity.Animation[? "Strike"], -3, oEntity.SpriteHold, oEntity.SpriteHoldAnimation);
	
			EntityMove(oTarget.ID, X, Y, 2, 64);
		}
	
		EntityMove(oEntity.ID, oEntity.x, oEntity.y, oEntity.MoveSpeed, 0);
	}


}
