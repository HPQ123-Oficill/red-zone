function SQL_LoadClans() {
	printf("[MySQL] loading %d clans..", cache_num_rows());
	if(cache_num_rows() == 0)
		return true;

	SQL_clans = cache_num_rows();
	new i=-1;
	while(++i<SQL_clans) {
		cache_get_value_name(i, "Name", ClanInfo[i][clName]);
		cache_get_value_name(i, "Tag", ClanInfo[i][clTag]);
		cache_get_value_name(i, "Color", ClanInfo[i][clColor]);
		cache_get_value_name(i, "ChatColor", ClanInfo[i][clChatColor]);

		cache_get_value_name_int(i, "ID", ClanInfo[i][clID]);
		cache_get_value_name_int(i, "Members", ClanInfo[i][clMembers]);
		cache_get_value_name_int(i, "Safebox", ClanInfo[i][clSafebox]);
		cache_get_value_name_int(i, "PP", ClanInfo[i][clPremiumPoints]);
		cache_get_value_name_int(i, "Time", ClanInfo[i][clTime]);

		cache_get_value_name(i, "RankName1", ClanInfo[i][clRankName1]);
		cache_get_value_name(i, "RankName2", ClanInfo[i][clRankName2]);
		cache_get_value_name(i, "RankName3", ClanInfo[i][clRankName3]);
		cache_get_value_name(i, "RankName4", ClanInfo[i][clRankName4]);
		cache_get_value_name(i, "RankName5", ClanInfo[i][clRankName5]);
		cache_get_value_name(i, "RankName6", ClanInfo[i][clRankName6]);
		cache_get_value_name(i, "RankName7", ClanInfo[i][clRankName7]);

		cache_get_value_name(i, "RankColor1", ClanInfo[i][clRankColor1]);
		cache_get_value_name(i, "RankColor2", ClanInfo[i][clRankColor2]);
		cache_get_value_name(i, "RankColor3", ClanInfo[i][clRankColor3]);
		cache_get_value_name(i, "RankColor4", ClanInfo[i][clRankColor4]);
		cache_get_value_name(i, "RankColor5", ClanInfo[i][clRankColor5]);
		cache_get_value_name(i, "RankColor6", ClanInfo[i][clRankColor6]);
		cache_get_value_name(i, "RankColor7", ClanInfo[i][clRankColor7]);

		cache_get_value_name(i, "ClanMotd", ClanInfo[i][clMotd]);

		GetClan[ClanInfo[i][clID]] = i;
	}
	return true;
}


function SQL_LoadClansVehicle() {
	printf("[MySQL] loading %d clans vehicles..", cache_num_rows());
	if(cache_num_rows() == 0)
		return true;

	SQL_clans = cache_num_rows();

	new ORM:ormid;
	for(new x = 0; x < cache_num_rows(); x++) {
		new i = Iter_Free(ClanVehs);

		ormid = orm_create("clans");
		orm_addvar_int(ormid, ClanVeh[i][cvID], "ID");
		orm_addvar_int(ormid, ClanVeh[i][cvModel], "Model");
		orm_addvar_int(ormid, ClanVeh[i][cvColor][0], "Color1");
		orm_addvar_int(ormid, ClanVeh[i][cvColor][1], "Color2");
		orm_addvar_int(ormid, ClanVeh[i][cvClanID], "ClanID");

		orm_addvar_float(ormid, ClanVeh[i][cvPos][0], "X");
		orm_addvar_float(ormid, ClanVeh[i][cvPos][1], "Y");
		orm_addvar_float(ormid, ClanVeh[i][cvPos][2], "Z");
		orm_addvar_float(ormid, ClanVeh[i][cvPos][3], "R");
		orm_apply_cache(ormid, x);

		ClanVeh[i][cvText] = INVALID_OBJECT_ID;

		Iter_Add(ClanVehs, i);
		Iter_Add(ClanVehicles[GetClan[ClanVeh[i][cvClanID]]], i);
	}
	return true;
}

function SQL_InsertClanVehicle(playerid, model, clanid) {
	new i = Iter_Free(ClanVehs);
	ClanVeh[i][cvID] = cache_insert_id();
	ClanVeh[i][cvModel] = model;
	ClanVeh[i][cvClanID] = clanid;
	ClanVeh[i][cvColor][0] = 1;
	ClanVeh[i][cvColor][1] = 1;

	new rd = random(sizeof(DealerPos));
	for(new y = 0; y < 4; y++) ClanVeh[i][cvPos][y] = DealerPos[rd][y];

	Iter_Add(ClanVehs, i);
	Iter_Add(ClanVehicles[GetClan[clanid]], i);

	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `clanvehicles` SET `ClanID` = '%i', `X` = '%f', `Y` = '%f', `Z` = '%f', `R` = '%f' WHERE `ID` = '%i'", clanid, ClanVeh[i][cvPos][0], ClanVeh[i][cvPos][1], ClanVeh[i][cvPos][2], ClanVeh[i][cvPos][3], ClanVeh[i][cvID]);
	mysql_tquery(SQL, gQuery);
	CreateClanVehicle(i);

	gString[0] = EOS;
	format(gString, 100, "{%s}[CLAN VEHICLES] %s a achizitionat un %s pentru clan.", ClanInfo[GetClan[clanid]][clColor], GetName(playerid), GetVehicleName(model));
	SCM(playerid, COLOR_WHITE, gString);
	return true;
}

function CreateClanVehicle(idd) {
	ClanVeh[idd][cvSpawned] = CreateVehicleEx(ClanVeh[idd][cvModel], ClanVeh[idd][cvPos][0], ClanVeh[idd][cvPos][1], ClanVeh[idd][cvPos][2], ClanVeh[idd][cvPos][3], ClanVeh[idd][cvColor][0], ClanVeh[idd][cvColor][0], -1, 0);
	SetVehicleNumberPlate(ClanVeh[idd][cvSpawned], ClanInfo[GetClan[ClanVeh[idd][cvClanID]]][clName]);
	Fuel[ClanVeh[idd][cvSpawned]] = 100;
	AttachClanText(idd);
	VehicleOwned[ClanVeh[idd][cvSpawned]] = 2;
	VehicleSQL[ClanVeh[idd][cvSpawned]] = idd;
	return true;
}

function DestroyClanVehicle(idd) {
	DestroyVehicleEx(ClanVeh[idd][cvSpawned]);
	DestroyDynamicObject(ClanVeh[idd][cvText]);
	VehicleOwned[ClanVeh[idd][cvSpawned]] = 0;
	VehicleSQL[ClanVeh[idd][cvSpawned]] = 0;
	ClanVeh[idd][cvSpawned] = 0;
	return true;
}
YCMD:clans(playerid, params[]) {
	new string[50]; gString = "#. Name\tMembers Online\n";
	for(new c = 0; c < SQL_clans; c++) {
		format(string, 50, "%d. {%s}%s\t%d/%d\n", ClanInfo[c][clID], ClanInfo[c][clColor], ClanInfo[c][clName], Iter_Count(Clans[c]), ClanInfo[c][clMembers]);
		strcat(gString, string);
	}
	ShowPlayerDialog(playerid, DIALOG_ONLINE, DIALOG_STYLE_TABLIST_HEADERS, "Clans", gString, "Close", "");
	return true;
}

function GetCarClan(playerid, vehicleid) {
	new idd = FindSpawnID(vehicleid, true);
	if(idd == -1) return -1;
	return ClanVeh[idd][cvClanID] == PlayerInfo[playerid][pClan] ? idd : -1;
}
YCMD:cpark(playerid, params[], help) {
	if(GetClan[PlayerInfo[playerid][pClan]] == -1)
		return SCM(playerid, COLOR_GREY, "You not a clan member");

	if(PlayerInfo[playerid][pClanRank] < 6)
		return true;

	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) 
		return true;

	new carid = GetCarClan(playerid, GetPlayerVehicleID(playerid));
	if(carid == -1) return SCM(playerid, COLOR_GREY, "Acest vehicul nu face parte din clanul tau.");
	new Float: Health;
	GetVehicleHealth(ClanVeh[carid][cvSpawned], Health);
	if(Health < 800) return SCM(playerid, COLOR_GREY, "Your vehicle does not exceed 800 hp.");
	if(PlayerToPoint(playerid, 50, -2423.1172,336.0612,36.4407)) return SCM(playerid, COLOR_GREY, "You can't park a car around the spawn.");
	GetVehiclePos(ClanVeh[carid][cvSpawned], ClanVeh[carid][cvPos][0], ClanVeh[carid][cvPos][1], ClanVeh[carid][cvPos][2]);
	GetVehicleZAngle(ClanVeh[carid][cvSpawned], ClanVeh[carid][cvPos][3]);
	DestroyClanVehicle(carid);
	CreateClanVehicle(carid);
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `clanvehicles` SET `X` = '%f', `Y` = '%f', `Z` = '%f', `R` = '%f' WHERE `ID` = '%d'", ClanVeh[carid][cvPos][0], ClanVeh[carid][cvPos][1], ClanVeh[carid][cvPos][2], ClanVeh[carid][cvPos][3], ClanVeh[carid][cvID]);
	mysql_tquery(SQL, gQuery);
	PutPlayerInVehicle(playerid, ClanVeh[carid][cvSpawned], 0);
	SCM(playerid, COLOR_GREY, "The car was parked successfully.");
	return 1;
}

YCMD:ccarcolor(playerid, params[], help) {
	if(GetClan[PlayerInfo[playerid][pClan]] == -1)
		return SCM(playerid, COLOR_GREY, "Nu faci parte dintr-un clan.");

	if(PlayerInfo[playerid][pClanRank] < 6)
		return SCM(playerid, COLOR_GREY, "Ai nevoie de rank 6+ pentru a folosi aceasta comanda.");

	if(!IsPlayerInAnyVehicle(playerid))
		return SCM(playerid, COLOR_LGREEN, "Eroare: Nu te afli intr-un vehicul.");

	new carid = GetCarClan(playerid, GetPlayerVehicleID(playerid));
	if(carid == -1)
		return true;

	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) 
		return SCM(playerid, COLOR_LGREEN, "You have to be behind the wheel.");

	if(GetPlayerCash(playerid) < 2500)
		return SCM(playerid, COLOR_LGREEN, "You don't have $2,500");

	new slot, color;
	if(sscanf(params, "ii", slot, color))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/carcolor [1/2] [colors]");

	if(color < 0 || color > 255) 
		return SCM(playerid, COLOR_GREY, "Invalid colors.");

	if(slot < 1 || slot > 2) return true;

	ClanVeh[carid][cvColor][slot-1] = color;
	VehicleInfo[ClanVeh[carid][cvSpawned]][vColor][slot-1] = color;
	ChangeVehicleColor(ClanVeh[carid][cvSpawned], ClanVeh[carid][cvColor][0], ClanVeh[carid][cvColor][1]);

	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `clanvehicles` SET `Color%d` = '%d' WHERE `ID` = '%d'", slot, color, ClanVeh[carid][cvID]);
	mysql_tquery(SQL, gQuery);

	SCM(playerid, COLOR_MONEY, "(-) you paid $2,500 to change the color.");
	GivePlayerCash(playerid, -2500);
	return 1;
}

YCMD:deleteclan(playerid, params[]) {
	if(!IsAdmin(playerid, 6))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	if(sscanf(params, "i", params[0]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/deleteclan [clanid]");

	if(GetClan[params[0]] == -1)
		return SCM(playerid, COLOR_GREY, "Invalid clan ID.");

	new idd = GetClan[params[0]];

	gString[0] = EOS;
	format(gString, 100, "(/deleteclan) {FFFFFF}Admin %s a sters clanu %s (ID: %d)", GetName(playerid), ClanInfo[idd][clName], ClanInfo[idd][clID]);
	SendAdminMessage(COLOR_LIGHTRED, gString, 6);

	RemoveClan(idd);
	return true;
}

function RemoveClan(id) {
	foreach(new i : ClanVehicles[id]) if(ClanVeh[i][cvSpawned] != 0) DestroyVehicleEx(ClanVeh[i][cvSpawned]);
	foreach(new i : Clans[id]) {
		SCM(i, COLOR_YELLOW, "Ai fost scos din clan.");
		PlayerInfo[i][pClan] = 0;
		if(PlayerInfo[i][pClanTag] > 1) SetPlayerName(i, PlayerInfo[i][pName]);
	}
	Iter_Clear(ClanVehicles[id]);
	Iter_Clear(Clans[id]);

	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof gQuery, "DELETE FROM `clanvehicles` WHERE `ClanID` = '%i'", ClanInfo[id][clID]);
	mysql_tquery(SQL, gQuery);
	mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `users` SET `Clan` = '0' WHERE `Clan` = '%i'", ClanInfo[id][clID]);
	mysql_tquery(SQL, gQuery);
	mysql_format(SQL, gQuery, sizeof gQuery, "DELETE FROM `clans` WHERE `ID` = '%i'", ClanInfo[id][clID]);
	mysql_tquery(SQL, gQuery);
	GetClan[ClanInfo[id][clID]] = -1;
	return true;
}

YCMD:cmembers(playerid, parmas[], help) {
	if(GetClan[PlayerInfo[playerid][pClan]] == -1)
		return SCM(playerid, COLOR_GREY, "Nu faci parte dintr-un clan.");

	new x = GetClan[PlayerInfo[playerid][pClan]]; gString[0] = EOS;
	foreach(new i : Clans[x]) {
		format(gString, sizeof gString, "%s%s (%d), ", gString, GetName(i), i);		
	}
	SCMEx(playerid, COLOR_WHITE, gString);
	format(gString, 55, "Au fost gasiti %d jucatori connectati in clan.", Iter_Count(Clans[GetClan[PlayerInfo[playerid][pClan]]]));
	SCM(playerid, COLOR_LGREEN, gString);
	return true;
}

YCMD:cinvite(playerid, params[]) {
	if(GetClan[PlayerInfo[playerid][pClan]] == -1)
		return SCM(playerid, COLOR_GREY, "Nu esti intr-un clan.");

	if(PlayerInfo[playerid][pClanRank] < 6)
		return SCM(playerid, COLOR_GREY, "Ai nevoie de rank 6+");

	if(sscanf(params, "u", params[0]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/cinvite [playerid/name]");

	if(!IsPlayerConnected(params[0]))
		return true;

	if(GetClan[PlayerInfo[params[0]][pClan]] != -1)
		return SCM(playerid, COLOR_GREY, "Acel player este deja intr-un clan.");

	if(InviteClan[playerid] == params[0])
		return SCM(playerid, COLOR_WHITE, "I-ai trimis deja o invitatie.");

	InviteClan[playerid] = params[0];

	gString[0] = EOS;
	format(gString, 125, "I-ai trimis o invitatie lui %s in clanul %s.", GetName(params[0]), ClanInfo[GetClan[PlayerInfo[playerid][pClan]]][clName]);
	SCM(playerid, COLOR_SERVER, gString);
	format(gString, 150, "Ai primit o invitatie in clanul %s primita de la %s. (/accept cinvite %d)", ClanInfo[GetClan[PlayerInfo[playerid][pClan]]][clName], GetName(playerid), playerid);
	SCM(params[0], COLOR_LIGHTBLUE, gString);
	return true;
}

YCMD:quitclan(playerid, params[]) {
	if(GetClan[PlayerInfo[playerid][pClan]] == -1)
		return SCM(playerid, COLOR_GREY, "Nu faci parte dintr-un clan.");

	if(PlayerInfo[playerid][pClanRank] == 7)
		return SCM(playerid, COLOR_GREY, "Nu poti iesi din clan pentru ca ai rank 7.");

	new x = GetClan[PlayerInfo[playerid][pClan]];

	gString[0] = EOS;
	format(gString, 125, "Esti sigur ca vrei sa iesi din clanul %s?", ClanInfo[x][clName]);
	ShowPlayerDialog(playerid, DIALOG_QUITCLAN, DIALOG_STYLE_MSGBOX, "Quit Clan", gString, "Yes", "No");
	return true;
}

function AttachClanText(idd) {
	gString[0] = EOS;
	new x = GetClan[ClanVeh[idd][cvClanID]];
	if(ClanVeh[idd][cvText] != INVALID_OBJECT_ID) DestroyDynamicObject(ClanVeh[idd][cvText]);
	ClanVeh[idd][cvText] = CreateDynamicObject(19327,0,0,0,0,0,0);
	format(gString, 50, "{%s}%s", ClanInfo[x][clColor], ClanInfo[x][clTag]);
	SetDynamicObjectMaterialText(ClanVeh[idd][cvText], 0, gString, OBJECT_MATERIAL_SIZE_256x128, "Arial", 30, 1, 0xFFFFFFFF, 0, 1);
	switch(ClanVeh[idd][cvModel]) {
		case 411: AttachDynamicObjectToVehicle(ClanVeh[idd][cvText], ClanVeh[idd][cvSpawned], -0.044, -1.909, 0.245, -85.2, 1.7, -359.178);
		case 541: AttachDynamicObjectToVehicle(ClanVeh[idd][cvText], ClanVeh[idd][cvSpawned], 0.01, -1.817, 0.37, -78.2, 0.0, -1.554);
		case 409: AttachDynamicObjectToVehicle(ClanVeh[idd][cvText], ClanVeh[idd][cvSpawned], 0.043, -1.812, 0.8, -90.2, -1.3, -2.783);
		case 560: AttachDynamicObjectToVehicle(ClanVeh[idd][cvText], ClanVeh[idd][cvSpawned], 0.05, -1.928, 0.387, -89.6, -1.7, -363.011);
	}
	return true;
}

stock GetPlayerClanRankName(playerid) {
	new x[25], i = GetClan[PlayerInfo[playerid][pClan]];
	switch(PlayerInfo[playerid][pClanRank]) {
		case 1: format(x, 25, ClanInfo[i][clRankName1]);
		case 2: format(x, 25, ClanInfo[i][clRankName2]);
		case 3: format(x, 25, ClanInfo[i][clRankName3]);
		case 4: format(x, 25, ClanInfo[i][clRankName4]);
		case 5: format(x, 25, ClanInfo[i][clRankName5]);
		case 6: format(x, 25, ClanInfo[i][clRankName6]);
		case 7: format(x, 25, ClanInfo[i][clRankName7]);
	} 
	return x;
}


stock GetPlayerClanRankColor(playerid) {
	new x[10], i = GetClan[PlayerInfo[playerid][pClan]];
	switch(PlayerInfo[playerid][pClanRank]) {
		case 1: format(x, 10, ClanInfo[i][clRankColor1]);
		case 2: format(x, 10, ClanInfo[i][clRankColor2]);
		case 3: format(x, 10, ClanInfo[i][clRankColor3]);
		case 4: format(x, 10, ClanInfo[i][clRankColor4]);
		case 5: format(x, 10, ClanInfo[i][clRankColor5]);
		case 6: format(x, 10, ClanInfo[i][clRankColor6]);
		case 7: format(x, 10, ClanInfo[i][clRankColor7]);
	} 
	return x;
}

YCMD:clan(playerid, params[], help) {
	if(GetClan[PlayerInfo[playerid][pClan]] == -1)
		return SCM(playerid, COLOR_GREY, "You not member a clan");

	ShowPlayerDialog(playerid, DIALOG_CLAN, DIALOG_STYLE_LIST, "Clan Menu", "Members\nClan Tag\nVehicles\nSafebox\nSettings", "Select", "Close");
	return true;
}

YCMD:cv(playerid, parmas[], help) {
	if(GetClan[PlayerInfo[playerid][pClan]] == -1)
		return true;

	new szString[500], r = 0;
	strcat(szString, "[{00ff00}+{FFFFFF}] Buy clan vehicle\n");
	foreach(new i : ClanVehicles[GetClan[PlayerInfo[playerid][pClan]]]) {
		format(gString, 100, "%d. %s%s\n", r + 1, ClanVeh[i][cvSpawned] != INVALID_VEHICLE ? IsVehicleOccupied(ClanVeh[i][cvSpawned]) ? ("[{FFFF00}occupied{FFFFFF}] ") : ("[{00FF00}spawned{FFFFFF}] ") : ("[{FF0000}despawned{FFFFFF}] "), GetVehicleName(ClanVeh[i][cvModel]));
		strcat(szString, gString);
		r++;
		PlayerInfo[playerid][pCarKey][r] = i;
	}
	ShowPlayerDialog(playerid, DIALOG_CLANVEH, DIALOG_STYLE_LIST, "Clan Vehicle:", szString, "Select", "Close");
	return true;
}

YCMD:c(playerid, params[], help) {
	if(GetClan[PlayerInfo[playerid][pClan]] == -1)
		return SCM(playerid, COLOR_GREY, "You not member a clan");

	if(!PlayerInfo[playerid][pTog][5])
		return SCM(playerid, COLOR_GREY, "Clan chat it is disabled (/tog).");

	new text[128], x = GetClan[PlayerInfo[playerid][pClan]];
	if(sscanf(params, "s[128]", text))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/c [text]");


	gString[0] = EOS;
	format(gString, sizeof(gString), "{%s}[CLAN] {%s}%s {%s}%s: %s", ClanInfo[x][clColor], GetPlayerClanRankColor(playerid), GetPlayerClanRankName(playerid), ClanInfo[x][clChatColor], PlayerInfo[playerid][pName], text);

	foreach(new i : Clans[x]) {
		if(!PlayerInfo[i][pTog][5])
			continue;

		SCM(i, COLOR_WHITE, gString);
	}
	return true;
}

function SendClanMessage(playerid, color, string[]) {
	foreach(new i : Clans[GetClan[PlayerInfo[playerid][pClan]]]) SCM(i, color, gString);	
	return true;
}