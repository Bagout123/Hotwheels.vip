#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR "Bagout"
#define PLUGIN_VERSION "0.00"

#include <sourcemod>
#include <sdktools>
#include <sdkhooks>

#pragma newdecls required

public Plugin myinfo = 
{
	name = "Unlimited flashes",
	author = PLUGIN_AUTHOR,
	description = "",
	version = PLUGIN_VERSION,
	url = ""
};

public void OnEntityCreated(int entity, const char[] classname)
{
    if (strcmp(classname, "flashbang_projectile", false) == 0)
    {
        SDKHook(entity, SDKHook_SpawnPost, Grenade_SpawnPost);
    }
    
}

public Action Grenade_SpawnPost(int entity)
{
	SDKUnhook(entity, SDKHook_SpawnPost, Grenade_SpawnPost);
    int owner = GetEntPropEnt(entity, Prop_Send, "m_hOwnerEntity");
        
    if (owner != -1)
    {
      	GivePlayerItem(owner, "weapon_flashbang");
    }
}

//told u it was 7 lines cam no way would i charge for this x