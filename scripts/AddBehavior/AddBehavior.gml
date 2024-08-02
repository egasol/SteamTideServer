///AddBehavior(SpriteName, BehaviorScript, BehaviorTimer, Health, SpriteNameCorpse)
function AddBehavior(argument0, argument1, argument2, argument3) {

	var BehaviourSpriteName, BehaviorScript, BehaviorTimer, Health;

	BehaviourSpriteName = argument0;
	BehaviorScript = argument1;
	BehaviorTimer = argument2;
	Health = argument3;

	var Sprite, Behavior;

	Sprite = SpriteID[? BehaviourSpriteName];

	Behavior = ds_map_create();

	Behavior[? "Script"] = asset_get_index(BehaviorScript);
	Behavior[? "Timer"] = BehaviorTimer;
	Behavior[? "Health"] = Health;

	BehaviorList[? Sprite] = Behavior;


}
