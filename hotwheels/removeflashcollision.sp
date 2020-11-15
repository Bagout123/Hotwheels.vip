#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR ""
#define PLUGIN_VERSION "0.00"

#include <sourcemod>
#include <sdktools>

#pragma newdecls required

public Plugin myinfo = 
{
	name = "",
	author = PLUGIN_AUTHOR,
	description = "",
	version = PLUGIN_VERSION,
	url = ""
};

public void OnEntityCreated(int iEntity, const char[] sClassName)
{
	 if (StrContains(sClassName, "_projectile") != -1)
	 {
          CreateTimer(0.0, GrenadeThrown, EntIndexToEntRef(iEntity));
         }
}

public Action GrenadeThrown(Handle timer, any iEntityRef)
{
    int iEntity = EntRefToEntIndex(iEntityRef);
    if (IsValidEntity(iEntity))
        SetEntProp(iEntity, Prop_Send, "m_CollisionGroup", 2);
}

//add this if you want.. i think it can be annoying.. 
//it does DISABLE FLASHBOOST at the moment though!!
//change the flashboosting because it doesnt work well anyway?