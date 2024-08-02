///AddWeapon(SpriteName, WeaponDamage, WeaponType, WeaponSpeed, WeaponProjectile)
function AddWeapon(argument0, argument1, argument2, argument3, argument4) {

	var WeaponSpriteName, WeaponDamage, WeaponRange, WeaponSpeed, WeaponProjectile;

	WeaponSpriteName = argument0;

	WeaponDamage = argument1;
	WeaponRange = argument2;
	WeaponSpeed = argument3;
	WeaponProjectile = argument4;

	var Sprite, Weapon;

	Sprite = SpriteID[? WeaponSpriteName];

	Weapon = ds_map_create();

	Weapon[? "Damage"] = WeaponDamage;
	Weapon[? "Range"] = WeaponRange;
	Weapon[? "Speed"] = WeaponSpeed;

	if (WeaponProjectile != "none")
	{
		Weapon[? "Projectile"] = SpriteID[? WeaponProjectile];
	}
	else Weapon[? "Projectile"] = -1;

	WeaponList[? Sprite] = Weapon;


}
