///PlayerCheckNear(X, Y, W, H);
function PlayerCheckNear(argument0, argument1, argument2, argument3) {

	var X, Y, W, H;

	X = argument0;
	Y = argument1;

	W = argument2;
	H = argument3;

	var Players, oPlayer;

	Players = instance_number(Player);

	for (var i = 0; i < Players; i++)
	{
		oPlayer = instance_find(Player, i);
	
		var pX = clamp(oPlayer.x, W, room_width-W), pY = clamp(oPlayer.y, H, room_height-H);
	
		if (pX > X-W && pX < X+W && pY > Y-H && pY < Y+H)
		{
			return true;
		}
	}

	return false;


}
