///EntityDestroy(ID)
function EntityDestroy(argument0) {

	var ID;

	ID = argument0;

	var oEntity = EntityID[? ID];

	if (oEntity.SpriteHold >= 0)
	{
		EntityCreate(oEntity.SpriteHold, oEntity.SpriteHoldAnimation, oEntity.x, oEntity.y, 0, 0, 0);
	}

	instance_destroy(oEntity);

	ds_map_delete(EntityID, ID);

	var UnitIndex = ds_list_find_index(UnitList, oEntity);

	if (UnitIndex >= 0) ds_list_delete(UnitList, UnitIndex);

	buffer_seek(BufferWrite, buffer_seek_start, 0);

	buffer_write(BufferWrite, buffer_string, "Destroy");

	buffer_write(BufferWrite, buffer_u16, ID);

	ClientSendAll(BufferWrite);


}
