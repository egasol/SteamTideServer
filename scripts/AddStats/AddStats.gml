///AddStats(Name, Health, Damage, Speed, Skill)
function AddStats(argument0, argument1, argument2, argument3, argument4){
	var Name, Health, Damage, Speed, Skill;

	Name = argument0;
	Health = argument1;
	Damage = argument2;
	Speed = argument3;
	Skill = argument4;

	var Sprite, Stats;

	Sprite = SpriteID[? Name];

	Stats = ds_map_create();

	Stats[? "Health"] = Health;
	Stats[? "Damage"] = Damage;
	Stats[? "Speed"] = Speed;
	Stats[? "Skill"] = asset_get_index(Skill);

	StatsList[? Sprite] = Stats;
}