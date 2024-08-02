///EntitySprite(ID, Sprite, SpriteAnimation, SpriteHold, SpriteHoldAnimation)
function EntitySprite(argument0, argument1, argument2, argument3, argument4) {
	/*
	Maybe change so that if sprite/animation argument is -1 then do not change sprite/animation
	*/

	var ID, Sprite, SpriteAnimation, SpriteHold, SpriteHoldAnimation;

	ID = argument0;

	Sprite = argument1;
	SpriteAnimation = argument2;

	SpriteHold = argument3;
	SpriteHoldAnimation = argument4;

	var oEntity = EntityID[? ID];

	if (oEntity.Sprite != Sprite || oEntity.SpriteAnimation != SpriteAnimation || SpriteAnimation < 0)
	{
		oEntity.Sprite = Sprite;
		oEntity.SpriteAnimation = SpriteAnimation;

		oEntity.SpriteHold = SpriteHold;
		oEntity.SpriteHoldAnimation = SpriteHoldAnimation;

		//GetBehavior
		var Behavior = BehaviorList[? Sprite];

		if (Behavior != undefined)
		{
			oEntity.BehaviorScript = Behavior[? "Script"];
			oEntity.BehaviorTimer = Behavior[? "Timer"];
			oEntity.HealthMax = Behavior[? "Health"];
	
			oEntity.alarm = oEntity.BehaviorTimer;
		}

		//GetWeapon
		var Weapon = WeaponList[? SpriteHold];

		if (Weapon != undefined)
		{
			oEntity.UseRange = Weapon[? "Range"];
		} else oEntity.UseRange = 24;
	
		//Light
		var LightRadius, LightRadiusHold;
	
		LightRadius = LightsourceList[? Sprite];
		LightRadiusHold = LightsourceList[? SpriteHold];
	
		if (LightRadius != undefined || LightRadiusHold != undefined)
		{
			var Radius;
		
			if (LightRadius != undefined) Radius = LightRadius;
			if (LightRadiusHold != undefined) Radius = LightRadiusHold;
		
			oEntity.Light = Radius;
		
			EntityLight(ID, oEntity.Light);
		}
		else if (oEntity.Light > 0)
		{
			oEntity.Light = 0;
		
			EntityLight(ID, 0);
		}

		//Networking
		buffer_seek(BufferWrite, buffer_seek_start, 0);

		buffer_write(BufferWrite, buffer_string, "Sprite");

		buffer_write(BufferWrite, buffer_u16, ID);

		buffer_write(BufferWrite, buffer_s8, Sprite);
		buffer_write(BufferWrite, buffer_s8, SpriteAnimation);

		buffer_write(BufferWrite, buffer_s8, SpriteHold);
		buffer_write(BufferWrite, buffer_s8, SpriteHoldAnimation);

		ClientSendAll(BufferWrite);
	}


}
