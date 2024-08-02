///EntityDamage(Target, Damage)
function EntityDamage(argument0, argument1) {

	var Target, Damage;

	Target = argument0;
	Damage = argument1;

	Target.Health -= Damage;

	Message(Damage, Target.x, Target.y, c_red, false);
	Effect(Target.x, Target.y, SpriteID[? "effectblood"], 0);
	EntityStatus(Target.ID, 0, false);

	if (Target.Health <= 0)
	{
		EntityCreate(Target.Animation[? "Corpse"], 0, Target.x, Target.y, 0, 0, 0);
	
		EntityDestroy(Target.ID);
	}


}
