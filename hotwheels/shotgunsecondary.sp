#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR "Bagout"
#define PLUGIN_VERSION "0.00"

#include <sourcemod>
#include <sdktools>
#include <cstrike>
#include <smlib>

#pragma newdecls required


char g_sSavedWeapon[MAXPLAYERS + 1][32];

public Plugin myinfo = 
{
	name = "Shotgun Secondary for SGB",
	author = PLUGIN_AUTHOR,
	description = "",
	version = PLUGIN_VERSION,
	url = ""
};

public void OnPluginStart()
{
	AddCommandListener(CommandDrop, "drop");
}

public Action CommandDrop(int client, const char[] command, int args)
{
	int wep = GetPlayerWeaponSlot(client, 0);
	if (Client_GetActiveWeapon(client) == GetPlayerWeaponSlot(client, 0))
	{
		char weapon[32];
		GetClientWeapon(client, weapon, sizeof(weapon));
		if (StrEqual("weapon_nova", weapon))
		{
		
			RemovePlayerItem(client, wep);
			int c = GivePlayerItem(client, g_sSavedWeapon[client]);
			if (c == -1)GivePlayerItem(client, "weapon_nova");
		}
		else
		{
			g_sSavedWeapon[client] = weapon;
			RemovePlayerItem(client, wep);
			PrintToChat(client, "[\x06hotwheels.vip\x01] Your weapon \x04%s\x01 has been put to reserve", weapon[7]);
			GivePlayerItem(client, "weapon_nova");
		}
	}	
	return Plugin_Continue;
}

// not sure how to add it as a primary in itself.. would need extension coding probably and more engine knowledge
//this is much easier and im not willing to spend more than 10 hours when this easily does the trick, unless you really want to pay me