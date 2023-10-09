#define MAX_FRIENDS (60)

new PlayerText: FriendConnectPTD[3], HideFriendConnect[MAX_PLAYERS], FriendID[MAX_PLAYERS][3][MAX_FRIENDS], MyFriends[MAX_PLAYERS];

LoadFriends(playerid) {
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof gQuery, "SELECT * FROM `friends` WHERE `Userid` = '%i' LIMIT %i", PlayerInfo[playerid][pSQLID], MAX_FRIENDS);
	mysql_tquery(SQL, gQuery, "SQL_Cache_Friends", "i", playerid);
}

function SQL_Cache_Friends(playerid) {
	MyFriends[playerid] = cache_num_rows();
	if(!MyFriends[playerid]) return true;
	new FriendIDe, time = gettime()+10; gString[0] = EOS;
	if(PlayerInfo[playerid][pPhone] != 0) format(gString, 100, "~y~friend connected~n~~n~~w~name: %s~n~number: %d~n~ID: %d", GetName(playerid), PlayerInfo[playerid][pPhone], playerid);
	else format(gString, 100, "~y~friend connected~n~~n~~w~name: %s~n~number: none~n~ID: %d", GetName(playerid), playerid);
	for(new i=0;i<MyFriends[playerid];i++) {
		cache_get_value_name_int(0, "ByStatus", FriendIDe);

		if(FriendIDe==-1) continue;

		PlayerTextDrawSetString(FriendIDe, FriendConnectPTD[2], gString);
		PlayerTextDrawSetPreviewModel(FriendIDe, FriendConnectPTD[1], PlayerInfo[playerid][pModel]);
		for(new x=0;x<3;x++) PlayerTextDrawShow(FriendIDe, FriendConnectPTD[x]);
		HideFriendConnect[FriendIDe] = time;
	}
	return true;
}

YCMD:friends(playerid, params[], help) {
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof gQuery, "SELECT * FROM `friends` WHERE `AddBy` = '%i' LIMIT %i", PlayerInfo[playerid][pSQLID], MAX_FRIENDS);
	mysql_tquery(SQL, gQuery, #SQL_Cache_Player_Friends, #i, playerid);
	return true;
}
function SQL_Cache_Player_Friends(playerid) {
	new szString[MAX_FRIENDS*((MAX_PLAYER_NAME*2)+10)], friendName[MAX_PLAYER_NAME]; MyFriends[playerid] = cache_num_rows();
	strcat(szString, "{DFB858}[+]Add Friends\n");
	for(new i=0;i<MyFriends[playerid];i++) {
		cache_get_value_name_int(0, "ID", FriendID[playerid][0][i]);
		cache_get_value_name_int(0, "Status", FriendID[playerid][1][i]);
		cache_get_value_name_int(0, "Userid", FriendID[playerid][2][i]);
		cache_get_value_name(0, "Name", friendName);

		if(FriendID[playerid][1][i] == -1) format(gString, (MAX_PLAYER_NAME*2)+10, "{DE4343}[offline] {FFFFFF}%s\n", friendName);
		else format(gString, (MAX_PLAYER_NAME*2)+10, "{3EAD31}[online] {FFFFFF}%s (%d)\n", friendName, FriendID[playerid][1][i]);
		strcat(szString, gString);
	}
	ShowPlayerDialog(playerid, DIALOG_FRIENDS, DIALOG_STYLE_LIST, "Friends", szString, "Select", "Close");
	return true;
}