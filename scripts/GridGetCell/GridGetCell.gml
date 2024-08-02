///GridGetCell(X, Y)
function GridGetCell(argument0, argument1) {

	var X, Y;

	X = argument0;
	Y = argument1;

	var CellX = floor(X/48), CellY = floor(Y/48);

	if (mp_grid_get_cell(Map, CellX, CellY) == -1)
	{
		return true;
	}
	else
	{
		return false;
	}


}
