///GridCollisionLine(X1, Y1, X2, Y2)
function GridCollisionLine(argument0, argument1, argument2, argument3) {

	var X1, Y1, X2, Y2;

	X1 = argument0;
	Y1 = argument1;

	X2 = argument2;
	Y2 = argument3;

	var GridWidth = 48, GridHeight = 48;

	/*------------------------Collisions------------------------*/
	var X, Y, CellX, CellY, tX = 1, tY = 1;

	var V, V1, V2;

	//Vertical Lines: Negative Direction
	if (X2 > X1)
	{
		V1 = ceil(X1/GridWidth)*GridWidth;
		V2 = ceil((X2+1)/GridWidth)*GridWidth;
	
		for (V = V1; V <= V2; V += GridWidth)
		{
			tX = (V-X1)/(X2-X1);
		
			X = X1+tX*(X2-X1);
			Y = Y1+tX*(Y2-Y1);
		
			CellX = floor(X/GridWidth);
			CellY = floor(Y/GridHeight);
		
			if (mp_grid_get_cell(Map, CellX, CellY) == -1) break;
		}
	}

	//Vertical Lines: Negative Direction
	if (X2 < X1)
	{
		V1 = floor(X1/GridWidth)*GridWidth;
		V2 = floor((X2-1)/GridWidth)/GridWidth;
	
		for (V = V1; V >= V2; V -= GridWidth)
		{
			tX = (V-X1)/(X2-X1);
		
			X = X1+tX*(X2-X1);
			Y = Y1+tX*(Y2-Y1);
		
			CellX = floor((X-1)/GridWidth);
			CellY = floor(Y/GridHeight);
		
			if (mp_grid_get_cell(Map, CellX, CellY) == -1) break;
		}
	}

	var H, H1, H2

	//Horisontal Lines: Positive Direction
	if (Y2 > Y1)
	{
		H1 = ceil(Y1/GridHeight)*GridHeight;
		H2 = ceil((Y2+1)/GridHeight)*GridHeight;
	
		for (H = H1; H <= H2; H += GridHeight)
		{
			tY = (H-Y1)/(Y2-Y1);
		
			X = X1+tY*(X2-X1);
			Y = Y1+tY*(Y2-Y1);
		
			CellX = floor(X/GridWidth);
			CellY = floor(Y/GridHeight);
		
			if (mp_grid_get_cell(Map, CellX, CellY) == -1) break;
		}
	}

	//Horisontal Lines: Negative Direction
	if (Y2 < Y1)
	{
		H1 = floor(Y1/GridHeight)*GridHeight;
		H2 = floor((Y2-1)/GridHeight)*GridHeight;
	
		for (H = H1; H >= H2; H -= GridHeight)
		{
			tY = (H-Y1)/(Y2-Y1);
		
			X = X1+tY*(X2-X1);
			Y = Y1+tY*(Y2-Y1);
		
			CellX = floor(X/GridWidth);
			CellY = floor((Y-1)/GridHeight);
		
			if (mp_grid_get_cell(Map, CellX, CellY) == -1) break;
		}
	}

	return min(1, tX, tY);
	/*
	X = X1+t*(X2-X1);
	Y = Y1+t*(Y2-Y1);
	*/


}
