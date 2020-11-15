#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR "Bagout"
#define PLUGIN_VERSION "0.00"

#include <sourcemod>
#include <sdktools>

#pragma newdecls required

public Plugin myinfo = 
{
	name = "Vip chat colours",
	author = PLUGIN_AUTHOR,
	description = "",
	version = PLUGIN_VERSION,
	url = ""
};

char g_sColours[12][32] =  {".default", ".red", ".purple", ".green", ".lime", ".lightred", ".grey", ".yellow", ".lightgrey", ".lightblue", ".blue", ".pink"};
char g_sColours2[12][32] =  {"\x01", "\x02", "\x03", "\x04", "\x06", "\x07", "\x08", "\x09", "\x0A", "\x0B", "\x0C", "\x0E"};

public void OnPluginStart()
{
	
}

public Action OnClientSayCommand(int client, const char[] command, const char[] args)
{
	if (GetUserFlagBits(client) & ADMFLAG_CUSTOM1 == ADMFLAG_CUSTOM1 || GetUserFlagBits(client) & ADMFLAG_ROOT == ADMFLAG_ROOT || GetUserFlagBits(client) & ADMFLAG_CUSTOM6 == ADMFLAG_CUSTOM6)
	{
		char Message[256];
		Format(Message, sizeof(Message), "%s", args);
		int replacements;
		for (int i = 0; i <=11; i++)
		{
			
			int add = ReplaceString(Message, 256, g_sColours[i], g_sColours2[i]);
			replacements = replacements + add;
			
		}
		if (replacements == 0)
		{
			return Plugin_Continue;
		}
		else
		{
			FakeClientCommandEx(client, "say %s");
			/*
			removed because the colour is weird.. shame we cant use client team colours without using protobuf
			if (GetClientTeam(client) == 2)
			{
				PrintToChatAll(" \x09%N\x01: %s", client, Message);

			}
			if (GetClientTeam(client) == 3)
			{
				PrintToChatAll(" \x0B%N\x01: %s", client, Message);
			}
			*/
			return Plugin_Handled;
		}
	}
	return Plugin_Continue;
}