///SkillJump(oEntity, X, Y)
function SkillJump(argument0, argument1, argument2) {

	var oEntity, X, Y;

	oEntity = argument0;

	X = argument1;
	Y = argument2;

	var Distance, Direction;

	Distance = point_distance(oEntity.x, oEntity.y, X, Y);
	Direction = point_direction(oEntity.x, oEntity.y, X, Y);

	Distance = clamp(Distance, 32, 128);

	X = oEntity.x+lengthdir_x(Distance, Direction);
	Y = oEntity.y+lengthdir_y(Distance, Direction);
	/*
	if GridGetCell(X, Y)
	{
		var t = GridCollisionLine(oEntity.x, oEntity.y, X, Y);

		X = oEntity.x+(0.9)*t*(X-oEntity.x);
		Y = oEntity.y+(0.9)*t*(Y-oEntity.y);
	}
	*/

	EntityMove(oEntity.ID, X, Y, 4, 32);


}
