///EntityCreate(Sprite, SpriteAnimation, X, Y, MoveX, MoveY, MoveZ)
function EntityCreate(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	var Sprite, SpriteAnimation, X, Y, MoveX, MoveY, MoveZ;

	Sprite = argument0;
	SpriteAnimation = argument1;

	X = argument2;
	Y = argument3;

	MoveX = argument4;
	MoveY = argument5;
	MoveZ = argument6;

	if (MoveX == 0) MoveX = X;
	if (MoveY == 0) MoveY = Y;

	var oEntity = instance_create_depth(X, Y, 0, Entity);

	oEntity.ID = EntityNextID;

	EntityID[? EntityNextID] = oEntity;
	EntityNextID++;

	oEntity.MoveX = MoveX;
	oEntity.MoveY = MoveY;
	oEntity.MoveZ = MoveZ;
	oEntity.MoveSpeed = 2;

	oEntity.GoalX = oEntity.MoveX;
	oEntity.GoalY = oEntity.MoveY;
	oEntity.Pathing = -1;

	oEntity.SpriteHold = -1;
	oEntity.SpriteHoldAnimation = 0;

	oEntity.Sprite = Sprite;
	oEntity.SpriteAnimation = SpriteAnimation;
	oEntity.Animation = AnimationList[? Sprite];

	var Behavior = BehaviorList[? Sprite];

	if (Behavior != undefined)
	{
		oEntity.BehaviorScript = Behavior[? "Script"];
		oEntity.BehaviorTimer = Behavior[? "Timer"];
		oEntity.HealthMax = Behavior[? "Health"];
		oEntity.Health = oEntity.HealthMax;
	
		/*-----------Check if monster(movespeed?)------------*/
		oEntity.PathID = path_add();
		oEntity.Target = false;
		/*---------------------------------------------------*/
	
		oEntity.alarm = irandom_range(oEntity.BehaviorTimer, oEntity.BehaviorTimer*2);
	}
	else oEntity.Health = 0;
	
	var Stats = StatsList[? Sprite];

	if (Stats != undefined)
	{
		oEntity.HealthMax = Stats[? "Health"];
		oEntity.Damage = Stats[? "Damage"];
		oEntity.Speed = Stats[? "Speed"];
		oEntity.Skill = Stats[? "Skill"];
	
		oEntity.Health = oEntity.HealthMax;
		oEntity.PathID = path_add();
		oEntity.Target = false;
	
		ds_list_add(UnitList, oEntity);
	}

	var LightRadius = LightsourceList[? Sprite];

	if (LightRadius != undefined)
	{
		oEntity.Light = LightRadius;
	}
	else oEntity.Light = 0;

	buffer_seek(BufferWrite, buffer_seek_start, 0);

	buffer_write(BufferWrite, buffer_string, "Create");
	
	EntityDataBuffer(oEntity);

	ClientSendAll(BufferWrite);

	return oEntity;


}
