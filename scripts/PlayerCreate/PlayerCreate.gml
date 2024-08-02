///PlayerCreate(ID, X, Y)
function PlayerCreate(argument0, argument1, argument2) {

	var PlayerID, X, Y;

	PlayerID = argument0;

	X = argument1;
	Y = argument2;

	var oPlayer = instance_create_depth(X, Y, 0, Player);

	oPlayer.ID = PlayerID;

	oPlayer.MoveX = oPlayer.x;
	oPlayer.MoveY = oPlayer.y;
	oPlayer.MoveZ = 0;

	oPlayer.GoalX = oPlayer.MoveX;
	oPlayer.GoalY = oPlayer.MoveY;
	oPlayer.Pathing = -1;
	oPlayer.PathID = path_add();

	oPlayer.Sprite = SpriteID[? "human"];
	oPlayer.SpriteAnimation = -2;
	oPlayer.Animation = AnimationList[? oPlayer.Sprite];

	oPlayer.SpriteHold = -1;
	oPlayer.SpriteHoldAnimation = 0;

	oPlayer.Inventory = -1;
	oPlayer.InventoryAnimation = 0;

	oPlayer.Speed = 2;
	oPlayer.MoveSpeed = oPlayer.Speed;

	oPlayer.HealthMax = 24;
	oPlayer.Health = oPlayer.HealthMax;

	oPlayer.ManaMax = 12;
	oPlayer.Mana = oPlayer.ManaMax;

	//oPlayer.BehaviorScript = -1;

	oPlayer.Light = 0;

	EntityID[? PlayerID] = oPlayer;

	//UnitList[? PlayerID] = oPlayer;
	ds_list_add(UnitList, oPlayer);

	buffer_seek(BufferWrite, buffer_seek_start, 0);

	buffer_write(BufferWrite, buffer_string, "Create");
	
	EntityDataBuffer(oPlayer);

	ClientSendAll(BufferWrite);


}
