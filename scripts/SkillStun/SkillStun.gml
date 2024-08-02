///SkillStunAOE(X, Y)
function SkillStun(argument0, argument1, argument2){
	var oCaster, X, Y;

	oCaster = argument0;

	X = argument1;
	Y = argument2;

	var List = UnitAOE(List, oCaster.x, oCaster.y, 160);

	for (var i = 0; i < ds_list_size(List); i++)
	{
		EntityDamage(List[| i ], 1);
	}

	ds_list_destroy(List);
}