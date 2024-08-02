function ReadSkill(argument0) {
	var PlayerID = argument0;

	var SkillName, TargetID, X, Y;

	SkillName = buffer_read(BufferRead, buffer_string);

	TargetID = buffer_read(BufferRead, buffer_s32);

	X = buffer_read(BufferRead, buffer_u32);
	Y = buffer_read(BufferRead, buffer_u32);

	var oPlayer = EntityID[? PlayerID];

	if (oPlayer != undefined)
	{
		var Cost = 4;
	
		if (oPlayer.UseTimer <= 0 && oPlayer.MoveZ == 0 && oPlayer.Mana >= Cost)
		{
			oPlayer.Mana -= Cost;
		
			EntityStatus(oPlayer.ID, 1, true);
		
			script_execute(Scripts[? SkillName], oPlayer, X, Y);
		
			//oPlayer.Pathing = -1;
		
			//oPlayer.UseTimer = 20;
		}
	}


}
