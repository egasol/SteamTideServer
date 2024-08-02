Move(MoveX, MoveY, MoveSpeed);

//Pickup
if (Pickup != false)
{
	if instance_exists(Pickup)
	{
		if  (MoveZ == 0)
		{
			var DistanceMove, DistancePickup;
	
			DistanceMove = point_distance(MoveX, MoveY, Pickup.x, Pickup.y);
			DistancePickup = point_distance(x, y, Pickup.x, Pickup.y);
	
			if (Pathing >= 0)
			{
				DistanceMove = point_distance(GoalX, GoalY, Pickup.x, Pickup.y);
			}
	
			if (DistanceMove > PickupRange)
			{
				EntityPathfind(ID, Pickup.x, Pickup.y);
			}
	
			if (DistancePickup <= PickupRange && Pickup.MoveZ == 0)
			{
				if (Pickup.Health == 0)
				{
					if (SpriteHold >= 0)
					{
						EntityCreate(SpriteHold, SpriteHoldAnimation, Pickup.x, Pickup.y, 0, 0, 0);
					}
		
					//For picking up animals
					if (Pickup.Animation != undefined) Pickup.Sprite = Pickup.Animation[? "Move"];
		
					EntitySprite(ID, Animation[? "Carry"], -2, Pickup.Sprite, Pickup.SpriteAnimation);
		
					EntityDestroy(Pickup.ID);
		
					Pickup = false;
		
					EntityMove(ID, x, y, MoveSpeed, 0);
				}
				else Pickup = false;
			}
		}
	}
	else Pickup = false;
}

//Use
if (Target != false)
{
	if instance_exists(Target)
	{
		if (UseTimer <= 0 && MoveZ == 0)
		{
			var DistanceMove, DistanceUse;
	
			DistanceMove = point_distance(MoveX, MoveY, Target.x, Target.y);
			DistanceUse = point_distance(x, y, Target.x, Target.y);
			
			if (Pathing >= 0)
			{
				DistanceMove = point_distance(GoalX, GoalY, Target.x, Target.y);
			}
			
			if (DistanceMove > UseRange)
			{
				EntityPathfind(ID, Target.x, Target.y);
			}
		
			if (DistanceUse <= UseRange && Target.MoveZ == 0)
			{
				var Weapon = WeaponList[? SpriteHold];
				
				if (Weapon != undefined && Target.Health > 0)
				{
					if (Target.BehaviorScript == BehaviorGrow)
					{
						//Farm
						if CombineExists(self, Target)
						{
							Effect(Target.x, Target.y, SpriteID[? "effectchop"], 0);
							
							EntitySprite(ID, Animation[? "Strike"], -3, SpriteHold, SpriteHoldAnimation);
							
							Target.Health--;
						}
					}
					else
					{
						Attack(Weapon, Target);
					}
			
					UseTimer = Weapon[? "Speed"];
				}
				else
				{
					if (!Combine(self, Target) && Target.Health == 0)
					{
						var Distance = 32, Direction = point_direction(x, y, Target.x, Target.y);
						
						X = Target.x+lengthdir_x(Distance, Direction);
						Y = Target.y+lengthdir_y(Distance, Direction);
						
						EntityMove(Target.ID, X, Y, Target.MoveSpeed, 16);
					}
			
					Target = false;
				}
				
				EntityMove(ID, x, y, MoveSpeed, 0);
			}
		}
	}
	else Target = false;
}

if (UseTimer > 0)
{
	if (UseTimer-- <= 0)
	{
		EntitySprite(ID, Animation[? "Carry"], -2, SpriteHold, SpriteHoldAnimation);
	}
}

if (Mana < ManaMax) Mana += 0.01;