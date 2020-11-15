#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR "Bagout"
#define PLUGIN_VERSION "0.00"

#include <sourcemod>
#include <sdktools>

#pragma newdecls required

public Plugin myinfo = 
{
	name = "Commands",
	author = PLUGIN_AUTHOR,
	description = "",
	version = PLUGIN_VERSION,
	url = ""
};

public void OnPluginStart()
{
	RegConsoleCmd("sm_commands", CommandsList, "Lists Commands");
}

public Action CommandsList(int client, int args)
{
	PrintToChat(client, "[\x06hotwheels.vip\x01] The available commands are: \x04!vip !guns !commands !rtv !nominate ");
	

}

//lmk if you want these in a cfg I offered earlier but you said no.. 
//if you don't want to recompile this everytime to change the list of commands you should use cfgs 
//but I know you dont really like touching server stuff that much so ive left it like this

/*
public Action CommandsList(int client, int args)
{
	char path[256]; 
	BuildPath(Path_SM, path, 256, "configs/commands.txt");
	Handle file = OpenFile(path, "r", false, "GAME");
	if (file)

}
*/