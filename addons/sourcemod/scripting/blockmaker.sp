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

public OnPluginStart() {

	g_hEnabled = CreateConVar("sm_blockmaker_enabled", "1", "Block Maker Enabled?");
	HookConVarChange(g_hEnabled, OnCvarChanged);

	//Version ConVar
	CreateConVar("sm_blockmaker_version", PLUGIN_VERSION, "Block Maker Version", FCVAR_PLUGIN|FCVAR_SPONLY|FCVAR_REPLICATED|FCVAR_NOTIFY);
	
	//Admin Commands
	RegAdminCmd("sm_blockmaker", Cmd_Blockmaker, ADMFLAG_ROOT);
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