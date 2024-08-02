function BehaviorGrow() {
	if (SpriteAnimation < SpriteNumber[? Sprite]-1)
	{
		EntitySprite(ID, Sprite, SpriteAnimation+1, SpriteHold, SpriteHoldAnimation);
	}
	else
	{
		//EntityCreate(Sprite, 0, x+irandom_range(-80, 80), y+irandom_range(-80, 80));
	
		BehaviorTimer = -1;
	}


}
