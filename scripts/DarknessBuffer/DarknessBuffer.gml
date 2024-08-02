function DarknessBuffer(argument0){
	var Darkness;

	Darkness = argument0;

	Value = make_colour_hsv(0, 0, 255*Darkness);

	buffer_seek(BufferWrite, buffer_seek_start, 0);

	buffer_write(BufferWrite, buffer_string, "Darkness");

	buffer_write(BufferWrite, buffer_u16, Value);
}