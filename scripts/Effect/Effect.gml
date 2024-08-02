///Effect(X, Y, Effect, Audio)
function Effect(argument0, argument1, argument2, argument3) {

	var X, Y, EffectSprite, EffectAudio;

	X = argument0;
	Y = argument1;

	EffectSprite = argument2;
	EffectAudio = argument3;

	buffer_seek(BufferWrite, buffer_seek_start, 0);

	buffer_write(BufferWrite, buffer_string, "Effect");

	buffer_write(BufferWrite, buffer_u32, X);
	buffer_write(BufferWrite, buffer_u32, Y);

	buffer_write(BufferWrite, buffer_u8, EffectSprite);
	buffer_write(BufferWrite, buffer_u8, EffectAudio);

	ClientSendNear(BufferWrite, X, Y);

}
