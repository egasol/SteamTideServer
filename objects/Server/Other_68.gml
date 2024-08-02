var PacketType, PacketID, PacketIP;

PacketType = async_load[? "type"];
PacketID = async_load[? "id"];

if (PacketType == network_type_data)
{
	BufferRead = async_load[? "buffer"];
	
	var Keyword = buffer_read(BufferRead, buffer_string);
	
	script_execute(Scripts[? Keyword], PacketID);
}
else if (PacketType == network_type_connect)
{
	var PacketSocket = async_load[? "socket"], PacketIP = async_load[? "ip"];
	
	ClientConnect(PacketSocket, PacketIP);
}
else if (PacketType == network_type_disconnect)
{
	var PacketSocket = async_load[? "socket"], PacketIP = async_load[? "ip"];
	
	ClientDisconnect(PacketSocket, PacketIP);
}