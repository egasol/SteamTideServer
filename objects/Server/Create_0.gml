SERVER_STARTED = false;

globalvar Port, ClientsMax, BufferWrite, ClientsList, URL, 
			EntityID, EntityNextID, UnitList, 
			SpriteID, SpriteIDs, SpriteName, SpriteNumber, SpriteOriginX, SpriteOriginY, 
			BehaviorList, StatsList, AnimationList, WeaponList, FoodList, LightsourceList, CombineList;

Port = 6510;
ClientsMax = 32;

BufferWrite = buffer_create(2048, buffer_grow, 1);

ClientsList = ds_list_create();

Scripts = ds_map_create();

Scripts[? "Join"] = ReadJoin;
Scripts[? "Move"] = ReadMove;
Scripts[? "Pickup"] = ReadPickup;
Scripts[? "Drop"] = ReadDrop;
Scripts[? "Use"] = ReadUse;
Scripts[? "Message"] = ReadMessage;
Scripts[? "Skill"] = ReadSkill;

Scripts[? "Jump"] = SkillJump;
Scripts[? "Knockback"] = SkillKnockback;
Scripts[? "Stun"] = SkillStun;
Scripts[? "Slash"] = SkillSlash;

EntityID = ds_map_create();
EntityNextID = ClientsMax;

UnitList = ds_list_create();

SpriteID = ds_map_create();
SpriteName = ds_map_create();
SpriteNumber = ds_map_create();
SpriteOriginX = ds_map_create();
SpriteOriginY = ds_map_create();

BehaviorList = ds_map_create();
StatsList = ds_map_create();
AnimationList = ds_map_create();
WeaponList = ds_map_create();
FoodList = ds_map_create();
LightsourceList = ds_map_create();
CombineList = ds_map_create();

MapSeed = noone;
Tick = 0;
TickMax = 3000;

URL = "http://steamtide.com/"; //"http://localhost/"

//var FileNameSprites, FileNameRecipes, FileNameMap;

FileNameSprites = "sprites.txt";
FileNameRecipes = "recipes.txt";
FileNameMap = "map.txt";

FileGetSprites = http_get_file(URL+FileNameSprites, FileNameSprites);
FileGetRecipes = http_get_file(URL+FileNameRecipes, FileNameRecipes);
FileGetMap = noone;

OutputScroll = 0;
Output = ds_list_create();

ds_list_add(Output, "Loading resources from: "+URL);