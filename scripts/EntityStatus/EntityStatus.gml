///EntityStatus(ID, Status, Private)
function EntityStatus(argument0, argument1, argument2) {

	var ID, Status, Private;

	ID = argument0;

	Status = argument1;
	Private = argument2;

	var oEntity = EntityID[? ID];

	buffer_seek(BufferWrite, buffer_seek_start, 0);

	buffer_write(BufferWrite, buffer_string, "Status");

	buffer_write(BufferWrite, buffer_u16, ID);

	buffer_write(BufferWrite, buffer_u8, Status);

	if (Status == 0)
	{
		buffer_write(BufferWrite, buffer_f32, oEntity.HealthMax);
		buffer_write(BufferWrite, buffer_f32, oEntity.Health);
	}
	else if (Status == 1)
	{
		buffer_write(BufferWrite, buffer_f32, oEntity.ManaMax);
		buffer_write(BufferWrite, buffer_f32, oEntity.Mana);
	}

	if (Private == false)
	{
		ClientSendNear(BufferWrite, oEntity.x, oEntity.y);
	}
	else network_send_packet(ID, BufferWrite, buffer_tell(BufferWrite));

}
