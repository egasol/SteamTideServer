function ClientDisconnect(argument0, argument1) {
	var ClientID, ClientIP;

	ClientID = argument0;
	ClientIP = argument1;

	ds_list_delete(ClientsList, ds_list_find_index(ClientsList, ClientID));

	if (EntityID[? ClientID] != undefined)
	{
		EntityDestroy(ClientID);
	}

	ds_list_add(Output, ClientIP+" (socket: "+string(ClientID)+") disconnected.");


}
