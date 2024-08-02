///Attack(Weapon, Target)
function Attack(argument0, argument1) {

	var Weapon, Target;

	Weapon = argument0;
	Target = argument1;

	var WeaponDamage, WeaponProjectile;

	WeaponDamage = Weapon[? "Damage"];
	WeaponProjectile = Weapon[? "Projectile"];

	if (WeaponProjectile != SpriteHold)
	{
		EntitySprite(ID, Animation[? "Strike"], -3, SpriteHold, SpriteHoldAnimation);
	}
	else EntitySprite(ID, Animation[? "Strike"], -3, -1, 0);

	//Melee
	if (WeaponProjectile >= 0)
	{
		ProjectileCreate(x, y, WeaponProjectile, WeaponDamage, Target);
	
		Effect(x, y, SpriteID[? "effectchop"], 2);
	}
	else
	{
		EntityDamage(Target, WeaponDamage);
	}


}
