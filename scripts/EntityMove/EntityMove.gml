///Move(ID, X, Y, MoveSpeed, Z)
function EntityMove(argument0, argument1, argument2, argument3, argument4) {

	var ID, MoveX, MoveY, MoveZ, MoveSpeed;

	ID = argument0;

	MoveX = argument1;
	MoveY = argument2;
	MoveZ = argument4;
	MoveSpeed = argument3;

	var oEntity = EntityID[? ID];

	oEntity.MoveX = MoveX;
	oEntity.MoveY = MoveY;
	oEntity.MoveZ = MoveZ;

	oEntity.MoveSpeed = MoveSpeed;

	buffer_seek(BufferWrite, buffer_seek_start, 0);

	buffer_write(BufferWrite, buffer_string, "Move");

	buffer_write(BufferWrite, buffer_u16, ID);

	buffer_write(BufferWrite, buffer_s32, MoveX);
	buffer_write(BufferWrite, buffer_s32, MoveY);
	buffer_write(BufferWrite, buffer_u8, MoveZ);
	buffer_write(BufferWrite, buffer_f32, MoveSpeed);

	ClientSendAll(BufferWrite);


}
