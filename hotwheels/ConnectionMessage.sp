#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR "Bagout"
#define PLUGIN_VERSION "0.00"

#include <sourcemod>
#include <sdktools>

#pragma newdecls required

public Plugin myinfo = 
{
	name = "Connection Message",
	author = PLUGIN_AUTHOR,
	description = "",
	version = PLUGIN_VERSION,
	url = ""
};

public void OnClientPutInServer(int client)
{
	CreateTimer(5.0, MessageSend, client);
}

public Action MessageSend(Handle timer, int client)
{
	if (IsClientConnected(client) && IsClientInGame(client))
	{
		PrintToChat(client, "[\x06hotwheels.vip\x01] Welcome to the \x04hotwheels.vip \x01movement server!");
		PrintToChat(client, "type \x04!commands \x01to see a list of all the \x04commands.");
	}
}

//i should put all of these in one.. 
//but when you request things one by one and when I have uni shit to do 
//I just tried to push it out for you as fast as possible
//probably more resource friendly to have it all in one plugin