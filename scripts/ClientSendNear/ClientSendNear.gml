///ClientSendAll(Buffer, X, Y)
function ClientSendNear(argument0, argument1, argument2) {

	var Buffer, X, Y;

	Buffer = argument0;

	X = argument1;
	Y = argument2;

	var Clients, ClientID;

	Clients = ds_list_size(ClientsList);

	for (var i = 0; i < Clients; i++)
	{
		ClientID = ClientsList[| i];
	
		var oPlayer = EntityID[? ClientID];
	
		if (oPlayer != undefined)
		{
			var W = 512, H = 384;
		
			if (oPlayer.x > X-W && oPlayer.x < X+W && oPlayer.y > Y-H && oPlayer.y < Y+H)
			{
				network_send_packet(ClientID, Buffer, buffer_tell(Buffer));
			}
		}
	}


}
