
#include <a_samp>

native SendClientCheck(playerid, type, arg, offset, size);
forward OnClientCheckResponse(playerid, actionid, memaddr, retndata);

public OnFilterScriptInit()
{
    print("Android check has been successfully loaded.");
}

public OnFilterScriptExit()
{
    print("\n--------------------------------------");
    print(" Android check filterscript unloaded");
    print("--------------------------------------\n");
}

public OnPlayerConnect(playerid) {
    SendClientCheck(playerid, 0x48, 0, 0, 2);
    return 1;
}

public OnClientCheckResponse(playerid, actionid, memaddr, retndata) {
    if actionid == 48 *then SetPVarInt(playerid, "YourDevice", 0);
    else SetPVarInt(playerid, "YourDevice", 1);
    new name[24];
    GetPlayerName(playerid, name, 24);
    printf("%s %d %d %d %d", name, actionid, memaddr, retndata, GetPVarInt(playerid, "YourDevice"));
    return true;
}