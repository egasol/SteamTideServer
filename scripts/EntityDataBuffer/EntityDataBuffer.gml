///EntityGetData(oEntity)
function EntityDataBuffer(argument0) {

	var oEntity = argument0;

	buffer_write(BufferWrite, buffer_u16, oEntity.ID);

	buffer_write(BufferWrite, buffer_u32, oEntity.x);
	buffer_write(BufferWrite, buffer_u32, oEntity.y);

	buffer_write(BufferWrite, buffer_u32, oEntity.MoveX);
	buffer_write(BufferWrite, buffer_u32, oEntity.MoveY);
	buffer_write(BufferWrite, buffer_u8, oEntity.MoveZ);
	buffer_write(BufferWrite, buffer_f32, oEntity.MoveSpeed);

	buffer_write(BufferWrite, buffer_s8, oEntity.Sprite);
	buffer_write(BufferWrite, buffer_s8, oEntity.SpriteAnimation);

	buffer_write(BufferWrite, buffer_s8, oEntity.SpriteHold);
	buffer_write(BufferWrite, buffer_s8, oEntity.SpriteHoldAnimation);

	buffer_write(BufferWrite, buffer_u16, oEntity.Light);
}
