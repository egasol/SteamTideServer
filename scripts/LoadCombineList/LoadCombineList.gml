function LoadCombineList() {
	/*
	//hemp
	CombineList[? "flint.0.hemp.1"] = "flint.0.hemp.0.hempfiber.0";
	CombineList[? "flint.2.hemp.1"] = "flint.2.hemp.0.hempfiber.0";
	CombineList[? "hempfiber.0.branch.2"] = "empty.0.hempstring.0";
	CombineList[? "branch.2.hempfiber.0"] = "empty.0.hempstring.0";
	CombineList[? "empty.0.hempstring.0"] = "hempfiber.0.branch.2";
	CombineList[? "branch.2.hempstring.0"] = "empty.0.hempstring.1";
	CombineList[? "hempstring.0.branch.2"] = "empty.0.hempstring.1";
	CombineList[? "empty.0.hempstring.1"] = "empty.0.hempstring.2";
	CombineList[? "empty.0.hempstring.2"] = "branch.2.branch.2.hempstring.3";

	//bow
	CombineList[? "hempstring.3.branch.3"] = "empty.0.bow.0";
	CombineList[? "branch.3.hempstring.3"] = "empty.0.bow.0";

	//firetool
	CombineList[? "branch.2.bow.0"] = "empty.0.firetool.0";

	//slingshot
	CombineList[? "hempstring.3.branch.0"] = "empty.0.slingshot.0";
	CombineList[? "branch.0.hempstring.3"] = "empty.0.slingshot.0";

	//flintknife
	CombineList[? "flint.0.branch.2"] = "flint.0.craft_knife.0";
	CombineList[? "flint.2.branch.2"] = "flint.0.craft_knife.0";
	CombineList[? "flint.2.craft_knife.0"] = "empty.0.craft_knife.1";
	CombineList[? "hempstring.3.craft_knife.1"] = "empty.0.flintknife.0";

	//spear
	CombineList[? "flint.0.branch.3"] = "flint.0.craft_spear.0";
	CombineList[? "flint.2.branch.3"] = "flint.0.craft_spear.0";
	CombineList[? "flint.0.craft_spear.0"] = "empty.0.craft_spear.1";
	CombineList[? "hempstring.3.craft_spear.1"] = "empty.0.spear.0";

	//flint
	CombineList[? "stone.0.flint.0"] = "empty.0.flint.1.stone.0";
	CombineList[? "empty.0.flint.1"] = "flint.3.flint.2";

	//fishing rod
	CombineList[? "hempstring.3.branch.2"] = "empty.0.fishingrod.1";

	//campfire
	CombineList[? "branch.0.stone.4"] = "empty.0.campfire.0";
	CombineList[? "branch.1.stone.4"] = "empty.0.campfire.0";
	CombineList[? "branch.2.stone.4"] = "empty.0.campfire.0";
	CombineList[? "branch.3.stone.4"] = "empty.0.campfire.0";

	CombineList[? "firetool.0.campfire.0"] = "empty.0.campfireburning.-1";

	//craft axe
	CombineList[? "flint.3.branch.2"] = "empty.0.branch&flint.0";
	CombineList[? "branch.2.flint.3"] = "empty.0.branch&flint.0";
	CombineList[? "stone.0.branch&flint.0"] = "stone.0.flintaxe.0";

	//Cut branch
	CombineList[? "flintaxe.0.branch.3"] = "flintaxe.0.branch.2.branch.2";

	//cut trees failure
	CombineList[? "branch&flint.0.tree.0"] = "branch.2.tree.0.flint.3";
	CombineList[? "branch&flint.0.tree.1"] = "branch.2.tree.1.flint.3";
	CombineList[? "branch&flint.0.tree.2"] = "branch.2.tree.2.flint.3";
	CombineList[? "branch&flint.0.tree.3"] = "branch.2.tree.3.flint.3";
	CombineList[? "branch&flint.0.tree.4"] = "branch.2.tree.4.flint.3";

	CombineList[? "branch&flint.0.treesmall.0"] = "branch.2.treesmall.0.flint.3";
	CombineList[? "branch&flint.0.treesmall.1"] = "branch.2.treesmall.1.flint.3";
	CombineList[? "branch&flint.0.treesmall.2"] = "branch.2.treesmall.2.flint.3";
	CombineList[? "branch&flint.0.treesmall.3"] = "branch.2.treesmall.3.flint.3";
	CombineList[? "branch&flint.0.treesmall.4"] = "branch.2.treesmall.4.flint.3";
	CombineList[? "branch&flint.0.treesmall.5"] = "branch.2.treesmall.5.flint.3";

	//cut trees success
	CombineList[? "flintaxe.0.tree.0"] = "flintaxe.0.stump.0.wood.0";
	CombineList[? "flintaxe.0.tree.1"] = "flintaxe.0.stump.1.wood.1";
	CombineList[? "flintaxe.0.tree.2"] = "flintaxe.0.stump.2.wood.2";
	CombineList[? "flintaxe.0.tree.3"] = "flintaxe.0.stump.3.wood.3";
	CombineList[? "flintaxe.0.tree.4"] = "flintaxe.0.stump.4.wood.4";

	CombineList[? "flintaxe.0.treesmall.0"] = "flintaxe.0.stumpsmall.0.branch.0";
	CombineList[? "flintaxe.0.treesmall.1"] = "flintaxe.0.stumpsmall.0.branch.1";
	CombineList[? "flintaxe.0.treesmall.2"] = "flintaxe.0.stumpsmall.0.branch.2";
	CombineList[? "flintaxe.0.treesmall.3"] = "flintaxe.0.stumpsmall.0.branch.2";
	CombineList[? "flintaxe.0.treesmall.4"] = "flintaxe.0.stumpsmall.0.branch.3";
	CombineList[? "flintaxe.0.treesmall.5"] = "flintaxe.0.stumpsmall.0.branch.3";

	//combine pile of stones
	CombineList[? "stone.0.stone.0"] = "empty.0.stone.1";
	CombineList[? "stone.0.stone.1"] = "empty.0.stone.2";
	CombineList[? "stone.0.stone.2"] = "empty.0.stone.3";
	CombineList[? "stone.0.stone.3"] = "empty.0.stone.4";
	CombineList[? "stone.1.stone.0"] = "empty.0.stone.2";
	CombineList[? "stone.1.stone.1"] = "empty.0.stone.3";
	CombineList[? "stone.1.stone.2"] = "empty.0.stone.4";
	CombineList[? "stone.2.stone.0"] = "empty.0.stone.3";
	CombineList[? "stone.2.stone.1"] = "empty.0.stone.4";
	CombineList[? "stone.3.stone.0"] = "empty.0.stone.4";

	//pick stone from pile of stones
	CombineList[? "empty.0.stone.0"] = "stone.0.empty.0";
	CombineList[? "empty.0.stone.1"] ="stone.0.stone.0";
	CombineList[? "empty.0.stone.2"] ="stone.0.stone.1";
	CombineList[? "empty.0.stone.3"] ="stone.0.stone.2";
	CombineList[? "empty.0.stone.4"] ="stone.0.stone.3";

	//combine pile of wood
	CombineList[? "wood.0.wood.0"] = "empty.0.wood.1";
	CombineList[? "wood.0.wood.1"] = "empty.0.wood.2";
	CombineList[? "wood.0.wood.2"] = "empty.0.wood.3";
	CombineList[? "wood.0.wood.3"] = "empty.0.wood.4";
	CombineList[? "wood.1.wood.0"] = "empty.0.wood.2";
	CombineList[? "wood.1.wood.1"] = "empty.0.wood.3";
	CombineList[? "wood.1.wood.2"] = "empty.0.wood.4";
	CombineList[? "wood.2.wood.0"] = "empty.0.wood.3";
	CombineList[? "wood.2.wood.1"] = "empty.0.wood.4";
	CombineList[? "wood.3.wood.0"] = "empty.0.wood.4";

	//pick wood from pile of wood
	CombineList[? "empty.0.wood.0"] = "wood.0.empty.0";
	CombineList[? "empty.0.wood.1"] ="wood.0.wood.0";
	CombineList[? "empty.0.wood.2"] ="wood.0.wood.1";
	CombineList[? "empty.0.wood.3"] ="wood.0.wood.2";
	CombineList[? "empty.0.wood.4"] ="wood.0.wood.3";
	*/


}
