///ClientSendAll(Buffer)
function ClientSendAll(argument0) {

	var Buffer = argument0;

	var Clients, Client, ClientID;

	Clients = ds_list_size(ClientsList);

	for (Client = 0; Client < Clients; Client++)
	{
		ClientID = ds_list_find_value(ClientsList, Client);
	
		network_send_packet(ClientID, Buffer, buffer_tell(Buffer));
	}


}
