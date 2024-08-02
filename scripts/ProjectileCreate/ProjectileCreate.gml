///ProjectileCreate(X, Y, Sprite, Damage, Target)
function ProjectileCreate(argument0, argument1, argument2, argument3, argument4) {

	var X, Y, Sprite, Damage, Target;

	X = argument0;
	Y = argument1;

	Sprite = argument2;
	Damage = argument3;
	Target = argument4;

	var oProjectile = instance_create_depth(X, Y, 0, Projectile)
	{
		oProjectile.Sprite = Sprite;
		oProjectile.Target = Target;
		oProjectile.Damage = Damage;
		oProjectile.Speed = 6;
	}

	buffer_seek(BufferWrite, buffer_seek_start, 0);

	buffer_write(BufferWrite, buffer_string, "Projectile");

	buffer_write(BufferWrite, buffer_u32, X);
	buffer_write(BufferWrite, buffer_u32, Y);

	buffer_write(BufferWrite, buffer_s8, Sprite);

	buffer_write(BufferWrite, buffer_u16, Target.ID);

	ClientSendAll(BufferWrite);


}
