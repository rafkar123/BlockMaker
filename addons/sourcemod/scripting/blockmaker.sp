/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
------Block Maker
	A requested plugin to revamp the private CS:GO block maker, and the
	old cs1.6 block maker.
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<*/
#pragma semicolon 1
#define PLUGIN_VERSION "0.0.0-DEV"
public Plugin:myinfo = {
	name = "Block Maker: Source",
	author = "github.com/MitchDizzle/BlockMaker/contributors.md",
	description = "Blocks that have certain properties/effects.",
	version = PLUGIN_VERSION,
	url = "github.com/MitchDizzle/BlockMaker/"
}

new Handle:g_hEnabled;
new bool:g_bEnabled = true;

//This will probably change, just need a structure to store the templates in.
enum BlockConfig {
	String:BlockName[32],
	String:BlockModel[255],
	Float:BlockOffset[3],
	Float:BlockAngles[3],
	BlockSkin,
	//This point below we will need to save these per-block for the saving mechanics. (we cant get EntProp data for these.)
	String:BlockSound[64],
	String:BlockSound2[64],
	BlockColor[4],
	BlockColor2[4],
	BlockType,
	String:BlockArg[64],
	BlockAttCount, //a count of the attachments for the block temp.
	BlockAtt[2], //max of 2 attachments per block seems fair? (we have a limited amount of entities) This will be the entity reference of the attached prop.
}
new blockTemplates[25][BlockConfig];

/*
Should we use an Enum struct to hold the data for each entity?
Or have a variable for each entity?
"
enum BlockStruct {
	String:BlockSound[64],
	String:BlockSound2[64],
	BlockColor[4],
	BlockColor2[4],
	BlockType,
	String:BlockArg[64],
	BlockAttCount,
	BlockAtt[2],
}
new blocks[2048][BlockStruct];
new Handle:playerBlocks[MAXPLAYERS+1] = INVALID_HANDLE;
"
And have a CreateArray(); which hold the entity indices for all the blocks a player owns, which will reflect the 'blocks' variable
*/

public OnPluginStart() {

	g_hEnabled = CreateConVar("sm_blockmaker_enabled", "1", "Block Maker Enabled?");
	HookConVarChange(g_hEnabled, OnCvarChanged);

	//Version ConVar
	CreateConVar("sm_blockmaker_version", PLUGIN_VERSION, "Block Maker Version", FCVAR_PLUGIN|FCVAR_SPONLY|FCVAR_REPLICATED|FCVAR_NOTIFY);
	
	//Admin Commands
	RegAdminCmd("sm_bm", Cmd_Blockmaker, ADMFLAG_CHEATS);
	RegAdminCmd("sm_blockmaker", Cmd_Blockmaker, ADMFLAG_CHEATS);
	RegAdminCmd("sm_createblock", Cmd_CreateBlock, ADMFLAG_ROOT);
}

/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
------OnCvarChanged		(type: Convar Change)
	Basically gets the new values and saves them.
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<*/
public OnCvarChanged(Handle:cvar, const String:oldVal[], const String:newVal[]) {
	if(cvar == g_hEnabled)
		g_bEnabled = StrEqual(newVal, "0", false) ? false : true;
}

/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
------Cmd_Blockmaker		(type: Command)
	The BlockMaker menu and, and the advanced create block.
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<*/
public Action:Cmd_Blockmaker(client, args)
{
	if(!g_bEnabled)
		return Plugin_Handled;
	
	// Todo...open easy blockmaker menu
	
	return Plugin_Handled;
}

public Action:Cmd_CreateBlock(client, args)
{
	if(!g_bEnabled)
		return Plugin_Handled;
	
	// Todo...create block (advanced)
	
	return Plugin_Handled;
}

/*
Dev Note:
Note my idea is that the player can manually change everything about the block from the color, secondary color, model (of presets or a command etc.) to the block's args.

We can save the blocks as a keyvalue in the data/blockmaker/MAPNAME_##.txt
I need to make an example of one looks like..

We would need a variable to hold:
- Block Type
- Block Args 
- (etc.)
Everything else you can get from the entity as we are saving them
*/