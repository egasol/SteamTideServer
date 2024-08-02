draw_set_color(c_white);
draw_text(0, 0, "--------------------Server--------------------");

var OutputSize = ds_list_size(Output), OutputY;

for (var i = 0; i < OutputSize; i++)
{
	OutputY = +16+(i+OutputScroll)*16;
	
	draw_text(0, OutputY, Output[| i]);
}

/****/
var Units = ds_list_size(UnitList);

for (var i = 0; i < Units; i++)
{
	var oEntity = UnitList[| i];
	
	draw_text(500, i*16, SpriteName[? oEntity.Sprite]+": health="+string(oEntity.Health));
}