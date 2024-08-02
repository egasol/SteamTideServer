if instance_exists(Target)
{
	var MoveDistance, MoveDirection;

	MoveDistance = point_distance(x, y, Target.x, Target.y);
	MoveDirection = point_direction(x, y, Target.x, Target.y);
	
	if (MoveDistance > Speed)
	{
		x += lengthdir_x(Speed, MoveDirection);
		y += lengthdir_y(Speed, MoveDirection);
	}
	else
	{
		EntityDamage(Target, Damage);
		
		if (Sprite = SpriteID[? "spear"])
		{
			EntityCreate(Sprite, 0, x, y, 0, 0, 0);
		}
		
		instance_destroy();
	}
}
else instance_destroy();