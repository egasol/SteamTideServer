///SpriteAdd(Name, Images, OriginX, OriginY)
function AddSprite(argument0, argument1, argument2, argument3) {

	var Name, Images, OriginX, OriginY;

	Name = argument0;
	Images = argument1;
	OriginX = argument2;
	OriginY = argument3;

	var ID = ds_map_size(SpriteID);

	SpriteID[? Name] = ID;
	SpriteName[? ID] = Name;
	SpriteNumber[? ID] = Images;
	SpriteOriginX[? ID] = OriginX;
	SpriteOriginY[? ID] = OriginY;


}
