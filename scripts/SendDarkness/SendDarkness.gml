///SendDarkness(ID, Value)
function SendDarkness(argument0, argument1) {

	var ID, Value;

	ID = argument0;
	Value = argument1;

	buffer_seek(BufferWrite, buffer_seek_start, 0);

	buffer_write(BufferWrite, buffer_string, "Darkness");

	buffer_write(BufferWrite, buffer_u16, Value);

	if (ID >= 0)
	{
		network_send_packet(ID, BufferWrite, buffer_tell(BufferWrite));
	}
	else ClientSendAll(BufferWrite);


}
