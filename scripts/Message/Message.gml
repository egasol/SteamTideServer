///Message(Text, X, Y, Color, Static)
function Message(argument0, argument1, argument2, argument3, argument4) {

	var Text, X, Y, Color, Static;

	Text = argument0;

	X = argument1;
	Y = argument2;

	Color = argument3;
	Static = argument4;

	buffer_seek(BufferWrite, buffer_seek_start, 0);

	buffer_write(BufferWrite, buffer_string, "Message");

	buffer_write(BufferWrite, buffer_string, Text);

	buffer_write(BufferWrite, buffer_u32, X);
	buffer_write(BufferWrite, buffer_u32, Y);

	buffer_write(BufferWrite, buffer_u32, Color);
	buffer_write(BufferWrite, buffer_bool, Static);

	ClientSendAll(BufferWrite);


}
