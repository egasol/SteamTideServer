function BehaviorAggressive() {
	var Range = (1+Server.Darkness)*240;

	if PlayerCheckNear(x, y, 512, 384)
	{
		var TargetNear, TargetNearDistance;
	
		TargetNear = instance_nearest(x, y, Player);
		TargetNearDistance = point_distance(TargetNear.x, TargetNear.y, x, y);
	
		if (TargetNearDistance < Range)
		{
			Target = TargetNear;
		
			if (Skill >= 0 && irandom(5) == 0)
			{
				show_debug_message(Skill);
			
				script_execute(Skill, self, Target.x, Target.y)
			
				alarm = 40;
			}
			else if (TargetNearDistance < 48)
			{
				EntitySprite(ID, Animation[? "Strike"], -3, SpriteHold, SpriteHoldAnimation);
			
				EntityDamage(Target, Damage);
			
				EntityMove(ID, x, y, 0, 0);
			}
			else
			{
				EntityPathfind(ID, Target.x, Target.y);
			}
		
			alarm = 40;
		}
		else
		{
			Target = false;
		
			//Wander
			var MoveX, MoveY;
		
			MoveX = x+irandom_range(-Range, Range);
			MoveY = y+irandom_range(-Range, Range);
		
			//MoveX = clamp(MoveX, xstart-Range, xstart+Range);
			//MoveY = clamp(MoveY, ystart-Range, ystart+Range);
		
			if (GridCollisionLine(x, y, MoveX, MoveY) == 1)
			{
				EntitySprite(ID, Animation[? "Move"], -2, SpriteHold, SpriteHoldAnimation);
		
				EntityMove(ID, MoveX, MoveY, MoveSpeed, 0);
			}
		}
	}


}
