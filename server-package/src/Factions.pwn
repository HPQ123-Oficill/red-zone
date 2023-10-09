redist::SQL_LoadFactions() {
	printf("[MySQL] Factions: %d", cache_num_rows());
	if(!cache_num_rows()) return true;
	SQL_Factions = cache_num_rows();
	new i=-1,skin[40], raport[8][25];
	while(++i<SQL_Factions) {
		cache_get_value_name_int(i, "ID", FactionInfo_[i][fID]);
		cache_get_value_name_int(i, "MaxMembers", FactionInfo_[i][fMaxMembers]);
		cache_get_value_name_int(i, "Level", FactionInfo_[i][fLevel]);
		cache_get_value_name_int(i, "Balance", FactionInfo_[i][fBalance]);
		cache_get_value_name_int(i, "Drugs", FactionInfo_[i][fDrugs]);
		cache_get_value_name_int(i, "Mats",FactionInfo_[i][fMats]);
		cache_get_value_name_int(i, "Status", FactionInfo_[i][fStatus]);
		cache_get_value_name_int(i, "VirtualWorld", FactionInfo_[i][fVirtualWorld]);
		cache_get_value_name_int(i, "Interior", FactionInfo_[i][fInterior]);

		cache_get_value_name(i, "Motd", FactionInfo_[i][fMotd]);

		cache_get_value_name_float(i, "EnterPosX", FactionInfo_[i][fEnterPos][0]);
		cache_get_value_name_float(i, "EnterPosY", FactionInfo_[i][fEnterPos][1]);
		cache_get_value_name_float(i, "EnterPosZ", FactionInfo_[i][fEnterPos][2]);
		cache_get_value_name_float(i, "ExitPosX", FactionInfo_[i][fExitPos][0]);
		cache_get_value_name_float(i, "ExitPosY", FactionInfo_[i][fExitPos][1]);
		cache_get_value_name_float(i, "ExitPosZ", FactionInfo_[i][fExitPos][2]);
		
		cache_get_value_name(i, "Rank1", fRankNames[i][0]);
		cache_get_value_name(i, "Rank2", fRankNames[i][1]);
		cache_get_value_name(i, "Rank3", fRankNames[i][2]);
		cache_get_value_name(i, "Rank4", fRankNames[i][3]);
		cache_get_value_name(i, "Rank5", fRankNames[i][4]);
		cache_get_value_name(i, "Rank6", fRankNames[i][5]);
		cache_get_value_name(i, "Rank7", fRankNames[i][6]);

		cache_get_value_name(i, "Skins", skin);
		cache_get_value_name(i, "RaportRank1", raport[0]);
		cache_get_value_name(i, "RaportRank2", raport[1]);
		cache_get_value_name(i, "RaportRank3", raport[2]);
		cache_get_value_name(i, "RaportRank4", raport[3]);
		cache_get_value_name(i, "RaportRank5", raport[4]);
		cache_get_value_name(i, "RaportRank6", raport[5]);
		cache_get_value_name(i, "RaportRank7", raport[6]);

		cache_get_value_name(i, "Name", FactionInfo_[i][fName]);
		cache_get_value_name(i, "Color", FactionInfo_[i][fColor]);

		strmid(FactionInfo_[i][fLeader], "None", 0, 5);
		mysql_format(SQL, gQuery, 100, "SELECT * FROM `users` WHERE `Member` = '%i' LIMIT %i", FactionInfo_[i][fID], FactionInfo_[i][fMaxMembers]);
		mysql_tquery(SQL, gQuery, "SQL_Cache_members", "d", i);
		mysql_format(SQL, gQuery, 100, "SELECT * FROM `users` WHERE `Rank` = '7' AND `Member` = '%i' LIMIT %i", FactionInfo_[i][fID], FactionInfo_[i][fMaxMembers]);
		mysql_tquery(SQL, gQuery, "SQL_cache_leader", "d", i);
		new x=0;
		while(++x<8) sscanf(raport[x], "p<|>iii", FactionRaport[i+1][x][0], FactionRaport[i+1][x][1], FactionRaport[i+1][x][2]);
		sscanf(skin, "p<|>iiiiii", FactionInfo_[i][fSkin][0], FactionInfo_[i][fSkin][1], FactionInfo_[i][fSkin][2], FactionInfo_[i][fSkin][3], FactionInfo_[i][fSkin][4], FactionInfo_[i][fSkin][5]);
		FactionInfo_[i][fSkin][6] = FactionInfo_[i][fSkin][5];
		updateFactionLabel(i);
	}	
	return true;
}

cmd:fdeposit(playerid, params[]) {
	if(!PlayerInfo[playerid][pMember] || PlayerVar[playerid][IsFaction] == -1) return true;

	if(PlayerInfo[playerid][pMember] != FactionInfo_[PlayerVar[playerid][IsFaction]][fID])
		return SCM(playerid, COLOR_LGREEN, "Eroare: Nu esti in factiunea ta!");

	if(PlayerVar[playerid][IsTrade] != -1) return SCM(playerid, COLOR_LGREEN, "Eroare: Nu poti folosi aceasta comanda atata timp cat esti implicat intr-o afacere!");
	ShowPlayerDialog(playerid, DIALOG_FDEPOSIT, DIALOG_STYLE_LIST, "Faction deposit", "Money\nMaterials\nDrugs", "Ok", "Exit");
	return true;
}

function SQL_Cache_members(f) return FactionInfo_[f][fMembers] = cache_num_rows();
function SQL_cache_leader(f) return cache_num_rows()?cache_get_value_name(0, "name", FactionInfo_[f][fLeader]):1;

updateFactionLabel(i) {
	format(gString, sizeof(gString), "{%s}%s's{FFFFFF} HQ\n{FFFFFF}(%s)", FactionInfo_[i][fColor], FactionInfo_[i][fName], FactionInfo_[i][fStatus] ? ("Locked") : ("Unlocked"));
	FactionInfo_[i][fLabel] = Create3DTextLabel(gString, -1, FactionInfo_[i][fEnterPos][0], FactionInfo_[i][fEnterPos][1], FactionInfo_[i][fEnterPos][2], 10.0);
	new pickupid;
	switch(i) {
		case 0, 1: pickupid = 1247;
		case 2, 3, 8: pickupid = 1313;
		default: pickupid = 1314;
	}
	FactionInfo_[i][fPickup] = CreatePickup(pickupid, 23, FactionInfo_[i][fEnterPos][0], FactionInfo_[i][fEnterPos][1], FactionInfo_[i][fEnterPos][2]);
	PickupInfo[FactionInfo_[i][fPickup]][pkType] = 3;
	PickupInfo[FactionInfo_[i][fPickup]][pkID] = i;
	if(i < 2) CreateDynamicMapIcon(FactionInfo_[i][fEnterPos][0], FactionInfo_[i][fEnterPos][1], FactionInfo_[i][fEnterPos][2], 30, -1);	
}

function SQL_LoadSeif() {
	new seif = cache_num_rows();
	printf("[MySQL] Loading %d seifs..", seif);
	if(!seif)
		return true;
	
	new ORM:ormid = orm_create("seif");
	for(new i = 0; i < seif; i++) {
		orm_addvar_int(ormid, SeifInfo[i][sID], "ID");
		orm_addvar_int(ormid, SeifInfo[i][sFaction], "Faction");
		orm_addvar_int(ormid, SeifInfo[i][sDrugs], "Drugs");
		orm_addvar_int(ormid, SeifInfo[i][sMaterials], "Materials");
		orm_addvar_int(ormid, SeifInfo[i][sMoney], "Money");

		orm_addvar_float(ormid, SeifInfo[i][sX], "X");
		orm_addvar_float(ormid, SeifInfo[i][sY], "Y");
		orm_addvar_float(ormid, SeifInfo[i][sZ], "Z");

		orm_apply_cache(ormid, i);
		format(gString, 100, "%s\nGroup Safe", FactionInfo_[i][fName]);
		Create3DTextLabel(gString, COLOR_YELLOW, SeifInfo[i][sX], SeifInfo[i][sY], SeifInfo[i][sZ], 5.0);
		CreatePickup(1274, 23, SeifInfo[i][sX], SeifInfo[i][sY], SeifInfo[i][sZ]);
	}
	return true;
}

YCMD:lc(playerid, params[], help) {
	if((PlayerInfo[playerid][pRank] != 7 || !PlayerInfo[playerid][pMember]) && !IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_LGREEN, "Only leaders/admins can use this command.");

	if(sscanf(params, "s[128]", params)) 
		return SCM(playerid, COLOR_GREY, "Syntax: /lc{FFFFFF}[text]");

	gString[0] = EOS;
	if(PlayerInfo[playerid][pRank] == 7) format(gString, 165, "(/l) %s Leader %s: %s", FactionInfo_[PlayerInfo[playerid][pMember] - 1][fName], GetName(playerid), params);
	else format(gString, 165, "(/lc) %s %s: %s", PlayerInfo[playerid][pAdmin]?("Admin"):("Helper"), GetName(playerid), params);

	foreach(new i : All(_Player<>)) SCM(i, 0x67AAB1FF, gString);
	return true;
}

cmd:fmotd(playerid, params[]) {
	if(PlayerInfo[playerid][pMember] == 0) return SCM(playerid,COLOR_GREY, "Nu esti intr-o factiune.");
	if(PlayerInfo[playerid][pRank] < 5) return SCM(playerid,COLOR_GREY, "Nu ai rank 5.");
	if(sscanf(params, "s[180]", params)) return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/fmotd <text>");
	new f = PlayerInfo[playerid][pMember] - 1;
	strmid(FactionInfo_[f][fMotd], params, 0, 128);
	format(gString, sizeof gString, "(FMOTD): %s", params);
	SendFactionMessage(PlayerInfo[playerid][pMember],COLOR_YELLOW, gString);
	_query(256, "UPDATE `factions` SET `Motd`='%s' WHERE `ID`='%d'",FactionInfo_[f][fMotd], FactionInfo_[f][fID]);
	return true;
}

YCMD:leaders(playerid, params[]) {
	SCM(playerid, COLOR_SERVER, "-------------- Leaders Online ------------------------------");
	gString[0] = EOS;
	foreach(new i : _Player<LEADER>) {
		format(gString, 128, "Leader: %s(%d) - {%s}%s", GetName(i), i, FactionInfo_[PlayerInfo[i][pMember] - 1][fColor], FactionInfo_[PlayerInfo[i][pMember] - 1][fName]);
		SCM(playerid, -1, gString);
	}
 	SCM(playerid, COLOR_SERVER, "----------------------------------------------------------------------");
	return 1;
}

YCMD:instructors(playerid, params[]) {
	SCM(playerid, COLOR_SERVER, "-------------- Instructors Online ------------------------------");
	gString[0] = EOS;
	foreach(new i : Factions<7>) {
		if(PlayerInfo[i][pRank] != 7) continue;
		format(gString, 128, "Instructor: %s{FFFFFF} %s(%d) - Number: %d", PlayerVar[i][AFKSeconds]<60?("{00FF00}[ACTIVE]"):("{FFFF00}[AFK]"), GetName(i), i, PlayerInfo[i][pPhone]);
		SCM(playerid, -1, gString);
	}
	SCM(playerid, COLOR_SERVER, "----------------------------------------------------------------------");
	if(Iter_Count(Factions<7>)!=0) format(gString, 60,"Instructors online: %d", Iter_Count(Factions<7>)), SCM(playerid, COLOR_LGREEN, gString);
	else SCM(playerid, COLOR_LGREEN,"Instructors not online at the moment.");
 	SCM(playerid, COLOR_SERVER, "----------------------------------------------------------------------");
	return 1;
}

function GetPlayerSkinFaction(playerid) return PlayerInfo[playerid][pMember] != 0 ? FactionInfo_[PlayerInfo[playerid][pMember] - 1][fSkin][PlayerInfo[playerid][pRank] - 1] : 250;

YCMD:factions(playerid, params[], help) {
	new szDialog[1250]; gString[0] = EOS;

	strcat(szDialog, "#\tName\tMembers\tStatus\n");
	for(new i = 0; i < SQL_Factions; i++) {
		format(gString, 100, "%d.\t{%s}%s\t%d/%d\t%s\n", i + 1, FactionInfo_[i][fColor], FactionInfo_[i][fName], FactionInfo_[i][fMembers], FactionInfo_[i][fMaxMembers], FactionInfo_[i][fStatus] ? ("{FFFF00}Deschise") : ("Inchise"));
		strcat(szDialog, gString);
	}
	ShowPlayerDialog(playerid, DIALOG_FACTIONS, DIALOG_STYLE_TABLIST_HEADERS, "Factions", szDialog, "Select", "Close");
	return true;
}
YCMD:findhq(playerid, params[], help) {
	if(HaveCheckpoint(playerid))
		return ShowCancelCP(playerid);

	if(sscanf(params, "i", params[0]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/findhq [factionid]");

	if(params[0] < 1 || params[0] > SQL_Factions)
		return SCM(playerid, COLOR_GREY, "Invalid Faction.");

	params[0] --;
	SetPlayerCheckpointEx(playerid, CP_NORMAL, FactionInfo_[params[0]][fEnterPos][0], FactionInfo_[params[0]][fEnterPos][1], FactionInfo_[params[0]][fEnterPos][2], 3.0);
	ClearString();
	format(gString, 135, "Mergi la punctul rosu de pe minimap pentru a ajunge la factiunea %s. Distanta: %.0fm.", FactionInfo_[params[0]][fName], GetPlayerDistanceFromPoint(playerid, FactionInfo_[params[0]][fEnterPos][0], FactionInfo_[params[0]][fEnterPos][1], FactionInfo_[params[0]][fEnterPos][2]));
	SCM(playerid, COLOR_YELLOW, gString);
	return true;
}

YCMD:invite(playerid, params[], help) {
	if(PlayerInfo[playerid][pMember] == 0)
		return SCM(playerid, COLOR_GREY, "Nu esti intr-o factiune.");

	if(PlayerInfo[playerid][pRank] < 6) 
		return SCM(playerid,COLOR_GREY, "Nu ai rank 6+.");

	new id;
	if(sscanf(params, "u", id))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/invite [playerid/name]");

	if(playerid == id) 
		return SCM(playerid, COLOR_GREY, "Nu poti sa iti dai singur o invitatie.");

	if(!IsPlayerConnected(id))
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(!PlayerOfRangeToPlayer(playerid, 5, id))
		return SCM(playerid, COLOR_GREY, "Nu esti langa acel player.");
		
	if(PlayerInfo[id][pMember] != 0)
		return SCM(playerid, COLOR_GREY, "Acel player este deja intr-o factiune.");

	if(PlayerInfo[id][pLevel] < FactionInfo_[PlayerInfo[playerid][pMember] - 1][fLevel]) {
		format(gString, 50, "Acel player are nevoie de level %d.", FactionInfo_[PlayerInfo[playerid][pMember] - 1][fLevel]);
		SCM(playerid, COLOR_GREY, gString);
		return true;
	}

	if(PlayerInfo[id][pFP] != 0)
		return SCM(playerid, COLOR_GREY, "Acel player are faction punish.");

	if(PlayerVar[playerid][InvitePlayer] == id)
		return SCM(playerid, COLOR_WHITE, "I-ai mai trimis o invitatie acelui player.");

	if(FactionInfo_[PlayerInfo[playerid][pMember] - 1][fMembers] >= FactionInfo_[PlayerInfo[playerid][pMember] - 1][fMaxMembers])
		return SCM(playerid, COLOR_LGREEN, "Ai numarul maxim de memberi.");

	mysql_format(SQL, gQuery, sizeof gQuery, "SELECT * FROM `faction_apply` WHERE `Username` = '%s' LIMIT 1", PlayerInfo[id][pName]);
	mysql_tquery(SQL, gQuery, #cache_faction_apply, #ii, playerid, id);
	return true;
}

redist::cache_faction_apply(playerid, id) {
	if(!cache_num_rows())
		return SCM(playerid, COLOR_GREY, "Acel player nu a aplicat la factiunea ta!");

	new status;
	cache_get_value_name_int(0, "Status", status);

	if(status != 1)
		return SCM(playerid, COLOR_GREY, "Aplicata lui nu a fost acceptata.");

	PlayerVar[playerid][InvitePlayer] = id;

	SCM(playerid, COLOR_PINK, "I-ai trimis o invitatie in factiunea ta.");
	
	gString[0] = EOS;
	format(gString, sizeof(gString), "%s te-a invitat in factiunea %s [/accept invite %d].", GetName(playerid), FactionInfo_[PlayerInfo[playerid][pMember]-1][fName], playerid);
	SCM(id, COLOR_PINK, gString);
	return true;
}

YCMD:quitgroup(playerid, params[], help) {
	if(!PlayerInfo[playerid][pMember])
		return SCM(playerid, COLOR_LGREEN, "Nu faci parte dintr-o factiune.");

	if(PlayerInfo[playerid][pRank] == 7)
		return SCM(playerid, COLOR_LGREEN, "Nu poti da quit faction ca leader.");

	gString[0] = EOS;
	format(gString, 100, "Esti sigur ca vrei sa iesi din facitune %s?", FactionInfo_[PlayerInfo[playerid][pMember] - 1][fName]);

	ShowPlayerDialog(playerid, DIALOG_QUITGROUP, DIALOG_STYLE_MSGBOX, "Quit grup:", gString, "Yes", "No");
	return true;
}

stock GetRankName(playerid) return fRankNames[PlayerInfo[playerid][pMember] - 1][PlayerInfo[playerid][pRank]-1];

stock wantedName(id) {
	ClearString();
	switch(id) {
		case 0: gString = "Furt Vehicul";
		case 1: gString = "Apel Nefondat 112";
		case 2: gString = "Atacare Civil";
		case 3: gString = "Neconformare Ordin";
		case 4: gString = "Patrundere Teren Guvernamental";
		case 5: gString = "Rapire Civil";
		case 6: gString = "Posesie/Folosire Droguri";
		case 7: gString = "Atacare Politist";
		case 8: gString = "Neplata Amenda";
		case 9: gString = "Drive-By";
		case 10: gString = "Mituire Politist";
		case 11: gString = "Omorare Civil";
		case 12: gString = "Rapire Politist";
		case 13: gString = "Omorare Politist";
		case 14: gString = "Fugar";
		case 15: gString = "Complice";		
	}
	return gString;
}

YCMD:arrest(playerid, params[], help) {
	if(!IsCop(playerid))
		return SCM(playerid, COLOR_GREY, "Nu esti politist.");

	if(!PlayerToPoint(playerid, 5, 1526.8956,-1678.1160,5.8906) && !PlayerToPoint(playerid, 5, 2281.4104,2428.3030,3.2734))
		return SCM(playerid, COLOR_GREY, "Nu te aflii in locul unde poti aresta.");

	if(sscanf(params, "u", params[0]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/arrest [playerid/name]");

	if(!IsPlayerConnected(params[0]))
		return true;

	if(!PlayerOfRangeToPlayer(playerid, 5, params[0]))
		return SCM(playerid, COLOR_GREY, "Acel player nu este langa tine.");

	if(PlayerInfo[params[0]][pWanted] == 0)
		return SCM(playerid, COLOR_GREY, "Acel player nu are wanted.");

	GameTextForPlayer(playerid, "running suspect bonus!", 3000, 1);
	GivePlayerCash(playerid, PlayerInfo[playerid][pWanted] * 2000);			

	if(PlayerVar[params[0]][Cuff]) {
		PlayerVar[params[0]][Cuff] = false;
		SetPlayerSpecialAction(params[0], SPECIAL_ACTION_NONE);
		RemovePlayerAttachedObject(params[0], 1);
		TogglePlayerControllable(params[0], 1);
	}

	checkBP(playerid, 22, 150);
	AddFactionRaport(playerid, 0, 1);
	ShowMDC(playerid, params[0]);
	format(gString, 100, "Ai primit $%d bonus pentru prinderea suspectului %s.", PlayerInfo[params[0]][pWanted] * 2000, GetName(params[0]));
	SCM(playerid, COLOR_PURPLE, gString);
	format(gString, 100, "%s arrested suspect %s, issuing a fine of $%d with a sentance of %d seconds.", GetName(playerid), GetName(params[0]), PlayerInfo[params[0]][pWanted] * 2000, PlayerInfo[params[0]][pWanted] * 300);
	SCMTA(COLOR_RED, gString);
	format(gString, 100, "* %s is now in jail thanks to: %s", GetName(params[0]), GetName(playerid));
	ProxDetector(20.0, playerid, gString, COLOR_PURPLE);
	SetPlayerJail(params[0]);
	return true;
}

cmd:showmotd(playerid) {
	if(!PlayerInfo[playerid][pMember]) return true;
	SCMf(playerid, COLOR_YELLOW, "%s", FactionInfo_[PlayerInfo[playerid][pMember] - 1][fMotd]);
	return true;
}

YCMD:free(playerid, params[], help) {
	if(!IsCop(playerid))
		return SCM(playerid, COLOR_GREY, "Nu esti politist");

	if(sscanf(params, "ui", params[0], params[1]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/free [playerid/name] [price]");

	if(!IsPlayerConnected(params[0]) || !IsPlayerLogged(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(!PlayerOfRangeToPlayer(playerid, 5, params[0]))
		return SCM(playerid, COLOR_GREY, "Acel player nu este langa tine.");

	if(PlayerInfo[params[0]][pJail] == 0)
		return SCM(playerid, COLOR_GREY, "Acel player nu este in inchisoare.");

	if(params[1] < 50000 || params[1] > 500000)
		return SCM(playerid, COLOR_GREY, "Invalid Price (50.000$ - 500.000$).");

	ClearString();
	format(gString, 100, "You offered free for %s with $%s", GetName(params[0]), FormatNumber(params[1]));
	SCM(playerid, COLOR_LIGHTBLUE, gString);
	format(gString, 100, "The %s policeman offered me the freedom in the amount of $%s (/accept free %d).", GetName(playerid), FormatNumber(params[1]), playerid);
	SCM(params[0], 0x2EA9EBFF, gString);
	PlayerVar[playerid][FreePrice] = params[1];
	PlayerVar[playerid][FreeOfer] = params[0];
	return true;
}

YCMD:su(playerid, params[], help) {
	if(!IsCop(playerid)) 
		return SCM(playerid, COLOR_LGREEN, "Nu faci parte dintr-un departament!");

	if(!PlayerVar[playerid][Duty]) 
		return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta comanda deoarece nu esti la datorie!");

	if(sscanf(params, "u", params[0])) 
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/suspect [playerid/name]");
	
	if(!IsPlayerConnected(params[0]) && !IsPlayerLogged(params[0])) 
		return SCM(playerid, COLOR_GREY, "Acel player nu este conectat!");

	if(params[0] == playerid) 
		return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta comanda asupra ta!");
	
	if(IsCop(params[0]))
		return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta comanda pe acel player.");

	new szDialog[750];
	ClearString();
	strcat(szDialog, "Nume\tNivel wanted\tDrept de predare\n");
	for(new i = 0; i < 16; i++) {
		format(gString, 50, "%s\t%d\t%s\n", wantedName(i), wantedList[i][0], (wantedList[i][1] == 1) ? ("Fara") : ("Da"));
		strcat(szDialog, gString);
	}
	format(gString, 50, "%s (%d)", GetName(params[0]), params[0]);
	ShowPlayerDialog(playerid, DIALOG_SUSPECT, DIALOG_STYLE_TABLIST_HEADERS, gString, szDialog, "Select", "Close");	
	SetPVarInt(playerid, "Userid", params[0]);
	return true;
}

YCMD:f(playerid, params[], help) {
	if(!PlayerInfo[playerid][pMember])
		return SCM(playerid, COLOR_LGREEN, "Nu faci parte dintr-o factiune.");

	if(IsCop(playerid))
		return SCM(playerid, COLOR_GREY, "Nu poti folosii comanda aceasta. (/r)");

	if(!PlayerInfo[playerid][pTog][2])
		return SCM(playerid, COLOR_GREY, "Ai faction chat-ul dezactivat (/tog).");

	if(CheckMute(playerid)) return ShowMute(playerid);

	new f = PlayerInfo[playerid][pMember] - 1;

	if(FactionInfo_[f][fBlockRank] >= PlayerInfo[playerid][pRank])
		return SCMf(playerid, COLOR_GREY, "In momentul de fata poate vorbi pe chat-ul doar membrii cu rank %d+", FactionInfo_[f][fBlockRank]);

	new text[64];
	if(sscanf(params, "s[64]", text))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/f [text]");

	new bool: x = false;
	ClearString();
	for(new i = 0; i < SQL_Reclame; i++) {
		if(strfind(text, ReclameName[i], true) != -1) {
			format(gString, sizeof gString, "Reclama: %s type (%s) '%s'.", GetName(playerid), ReclameName[i], text);
			SendAdminMessage(COLOR_RED, gString, 1);
			x = true;
			break;
		}
	}		
	if(x) return false;

	gString[0] = EOS;
	format(gString, sizeof(gString), "* %s %s: %s", GetRankName(playerid), GetName(playerid), text);
	SendTeamMessage(PlayerInfo[playerid][pMember], 0x00D5FFFF, gString);
	return true;
}

YCMD:r(playerid, params[], help) {
	if(!IsCop(playerid))
		return SCM(playerid, COLOR_GREY, "Nu faci parte din factiunea politiei.");

	if(CheckMute(playerid)) return ShowMute(playerid);

	if(!PlayerInfo[playerid][pTog][2]) 
		return SCM(playerid, COLOR_GREY, "Chatul factiunii a fost oprit (/tog)!");
	
	if(sscanf(params, "s[120]", params)) 
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/r [text]");

	new bool: x = false;
	ClearString();
	for(new i = 0; i < SQL_Reclame; i++) {
		if(strfind(params, ReclameName[i], true) != -1) {
			format(gString, sizeof gString, "Reclama: %s type (%s) '%s'.", GetName(playerid), ReclameName[i], params);
			SendAdminMessage(COLOR_RED, gString, 1);
			x = true;
			break;
		}
	}		
	if(x) return false;

	format(gString, 170, "\"%s, over\"", GetRankName(playerid), GetName(playerid), params);
	SetPlayerChatBubble(playerid, gString, COLOR_WHITE, 20.0, 10000);

	ClearString();
	format(gString, 170, "* %s %s: %s, over.", GetRankName(playerid), GetName(playerid), params);
	SendTeamMessage(PlayerInfo[playerid][pMember], 0x8D8DFFFF, gString);
	return true;
}

YCMD:members(playerid, params[], help) {
	if(PlayerInfo[playerid][pMember] == 0) 
		return SCM(playerid, COLOR_GREY, "Nu faci parte dintr-o factiune.");
	
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof gQuery, "SELECT * FROM `users` WHERE `users`.`Member` = '%d' ORDER BY `users`.`Rank` DESC LIMIT %d", PlayerInfo[playerid][pMember], FactionInfo_[PlayerInfo[playerid][pMember] - 1][fMaxMembers]);
	mysql_tquery(SQL, gQuery, "SQL_ShowFactionMembers", "ii", playerid, FactionInfo_[PlayerInfo[playerid][pMember] - 1][fMaxMembers]);
	return true;
}
function SQL_ShowFactionMembers(playerid, max) {
	new szString[1030], name[MAX_PLAYER_NAME], laston[30], pvar[4], ORM:ormid;
	ClearString();
	new f = PlayerInfo[playerid][pMember] - 1;
	if(PlayerInfo[playerid][pRank] < 6) strcat(szString, "#. Name\tRank - FW\tStatus\tDays\n");
	else format(szString,sizeof szString, "#. Name\tRank - FW\tStatus\tDays\n%s\n", !FactionInfo_[f][fStatus]?("{00FF00}Deschide aplicatiile"):("{FF0000}Inchide aplicatiile"));
	for(new i = 0; i < cache_num_rows(); i++) {
		ormid = orm_create("users");

		orm_addvar_string(ormid, name, MAX_PLAYER_NAME, "name");
		orm_addvar_string(ormid, laston, 30, "LastOn");

		orm_addvar_int(ormid, pvar[0], "Rank");
		orm_addvar_int(ormid, pvar[1], "FWarn");
		orm_addvar_int(ormid, pvar[2], "Days");
		orm_addvar_int(ormid, pvar[3], "Status");

		orm_apply_cache(ormid, i);

		format(PlayerSelected[playerid][i], MAX_PLAYER_NAME, name);
		
        if(pvar[3] != -1) format(gString, 100, "%d. %s (%d)\t%d - %d/3\tOnline\t%d\n", i+1, name, pvar[3], pvar[0], pvar[1], (gettime() - pvar[2])/86400);
        else format(gString, 100, "%d. %s\t%d - %d/3\t%s\t%d\n", i+1, name, pvar[0], pvar[1], laston, (gettime() - pvar[2])/86400);
     	
     	strcat(szString, gString);
	}
	format(gString, 50, "Members (%d/%d)", cache_num_rows(), max);
	ShowPlayerDialog(playerid, DIALOG_MEMBERS, DIALOG_STYLE_TABLIST_HEADERS, gString, szString, "Ok", "Exit");
	return true;
}

function PlayCopSound() {
	for(new i = 0; i < 2; i++) {
		foreach(new x : Factions<i+1>) PlayerPlaySound(i, 2606, 0, 0, 0);
	}
	return true;
}

YCMD:government(playerid, params[], help) {
	if(!IsCop(playerid)) 
		return SCM(playerid, COLOR_GREY, "Nu faci parte din factiunea politiei.");

	if(PlayerInfo[playerid][pRank] < 5) 
		return SCM(playerid, COLOR_GREY, "Ai nevoie de rank 5 pentru a folosi aceasta comanda.");

	new hour,minute,second;
	gettime(hour,minute,second);
	if(hour >= 00 && hour < 8) 
		return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta comanda in intervalul 00-08.");

	if(sscanf(params, "s[250]", params)) 
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/gov [text]");

	new bool: x = false;
	ClearString();
	for(new i = 0; i < SQL_Reclame; i++) {
		if(strfind(params, ReclameName[i], true) != -1) {
			format(gString, sizeof gString, "Reclama: %s type (%s) '%s'.", GetName(playerid), ReclameName[i], params);
			SendAdminMessage(COLOR_RED, gString, 1);
			x = true;
			break;
		}
	}		
	if(x) return false;
	
	SCMTA(COLOR_WHITE, "-------------------------- Anunt Guvernamental --------------------------");
	ClearString();
	format(gString, sizeof(gString), "%s %s: %s", GetRankName(playerid), GetName(playerid), params);
	SCMExx(0x5776FFFF, gString);
	return true;
}

function SendTeamMessage(member, color, string[]) {
	foreach(new i : Factions<member>) if(PlayerInfo[i][pTog][2]) SCM(i, color, string);
	return true;
}

function SendFactionMessage(factionid, color, const string[]) {
	foreach(new i : Factions<factionid>) SCM(i, color, string);
	return true;
}

YCMD:fvr(playerid, params[], help) {
	if(!PlayerInfo[playerid][pMember])
		return SCM(playerid, COLOR_GREY, "Nu esti intr-o factiune.");

	if(GetCoolDowns(playerid, 23))
		return CoolDowns(playerid, 23);

	if(PlayerInfo[playerid][pRank] < 6)
		return SCM(playerid, COLOR_GREY, "Nu ai rank-ul 6+.");

	if(!IsMafiot(playerid)) {
		foreach(new i : Player) {
			if(PlayerVar[playerid][FactionVehicle] == INVALID_VEHICLE_ID)
				continue;

			if(IsVehicleOccupied(PlayerVar[playerid][FactionVehicle]))
				continue;

			FDespawnVehicle(playerid);
		}
	} else {
		foreach(new i : VarVehicle) {
			if(ServerVehicle[i][vFaction] != PlayerInfo[playerid][pMember] || IsVehicleOccupied(i))
				continue;

			SetVehicleToRespawn(i);
		}
	}
	SetCoolDowns(playerid, 23, 30);
	gString[0] = EOS;
	format(gString, sizeof(gString), "[fvr] %s a respawnat toate masinile nefolosite.", GetName(playerid));
	SendFactionMessage(PlayerInfo[playerid][pMember], COLOR_PINK, gString);
	return true;
}

stock VehicleCop(vehicleid) return ServerVehicle[vehicleid][vFaction] != 1 && ServerVehicle[vehicleid][vFaction] != 2 && ServerVehicle[vehicleid][vFaction] != 11 ? false : true;

YCMD:m(playerid, params[], help) {
	new text[64];
	if(!IsCop(playerid)) 
		return SCM(playerid, COLOR_GREY, "Nu esti politist.");

	if(sscanf(params, "s[64]", text)) 
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/m [text]");

	if(!PlayerVar[playerid][Duty]) 
		return SCM(playerid, COLOR_LGREEN, "Nu poti folosi aceasta comanda deoarece nu esti la datorie!");

	if(!IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Trebuie sa fii intr-un vehicul.");

	if(!VehicleCop(GetPlayerVehicleID(playerid))) 
		return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta optiune pe acest vehicul.");

	gString[0] = EOS;
	switch(PlayerInfo[playerid][pMember]) {
		case 1: format(gString, 110, "> Ofiter %s: %s <", GetName(playerid), text);
		case 2: format(gString, 110, "> Agent %s: %s <", GetName(playerid), text);
		case 3: format(gString, 110, "> Soldat %s: %s <", GetName(playerid), text);
	}
	ProxDetector(60.0, playerid, gString, COLOR_YELLOW);
	return true;
}

std::getPlayerGuns(playerid) return gunset[playerid][0]+gunset[playerid][1]+gunset[playerid][2]+gunset[playerid][3]+gunset[playerid][4];

IsCop(playerid) {
	switch(PlayerInfo[playerid][pMember]) {
		case 1, 2, 11: return true; }
	return false;
}
IsMafiot(playerid) {
	switch(PlayerInfo[playerid][pMember]) {
		case 3, 4, 8, 12: return true; }
	return false;
}
YCMD:setguns(playerid, params[]) {
	if(!IsMafiot(playerid))
		return SCM(playerid, COLOR_GREY, "Nu esti intr-o mafie.");

	if(!PlayerVar[playerid][Duty])
		return SCM(playerid, COLOR_LGREEN, "Eroare: Nu esti duty!");

	gString[0] = EOS;
	strcat(gString, "Gun\tMinim rank\tStatus\n");
	for(new i = 0; i < 5; i++) {
		GetWeaponName(GunSetModel[0][i], params, 24);
		format(params, 50, "%s\t%d+\t%s\n", params, GunSetModel[4][i], gunset[playerid][i] ? ("{00ff00}selected") : ("{ff0000}not selected"));
		strcat(gString, params);
	}
	ShowPlayerDialog(playerid, DIALOG_SETGUN, DIALOG_STYLE_TABLIST_HEADERS, "Set Gun:", gString, "Select", "Close");
	return true;
}

YCMD:duty(playerid, params[], help) {
	new member = PlayerInfo[playerid][pMember];
	if(!member)
		return SCM(playerid, COLOR_GREY, "You not a member.");

	switch(member) {
		case 9,10: return SCM(playerid, COLOR_LGREEN, "Aceasta comanda nu este disponibila pentru factiunea ta.");
	}

	if(PlayerVar[playerid][IsFaction] == -1 && PlayerVar[playerid][IsHouses] == 0)
		return SCM(playerid, COLOR_GREY, "Nu te afli in hq sau in casa ta.");

	switch(PlayerVar[playerid][Duty]) {
		case true: {
			SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
			if(IsCop(playerid)) {
				ResetPlayerWeapons(playerid);
				SetPlayerHealth(playerid, 99);
				SetPlayerArmour(playerid, 0);
			}
			if(PlayerVar[playerid][FactionVehicle] != INVALID_VEHICLE_ID) FDespawnVehicle(playerid);
			SCM(playerid, COLOR_PINK, "Now you are out of debt.");
			PlayerVar[playerid][Duty] = false;
		}
		case false: {
			if(IsCop(playerid)) {
				if(PlayerInfo[playerid][pWeaponLicense] < gettime())
					return SCM(playerid, COLOR_GREY, "Nu ai licenta de arme.");

				GivePlayerWeapon(playerid, 24, 500);
				GivePlayerWeapon(playerid, 31, 500);
				GivePlayerWeapon(playerid, 3, 1);
				GivePlayerWeapon(playerid, 29, 500);
				SetPlayerHealth(playerid, 99);
				SetPlayerArmour(playerid, 99);
				format(gString, 70, "%s takes some guns and a badge from this locker.", GetName(playerid));
				ProxDetector(10.0, playerid, gString, COLOR_PURPLE); 
			}
			Tazer[playerid] = false;
			SCM(playerid, COLOR_PINK, "Now you're on duty");
			SetPlayerSkin(playerid, FactionInfo_[member - 1][fSkin][PlayerInfo[playerid][pRank] - 1]);
			PlayerVar[playerid][Duty] = true;
		}
	}
	return true;
}

function SetTeamColor(playerid) return SetPlayerColor(playerid, TeamColors[PlayerInfo[playerid][pMember]]);

stock GetFactionName(factionid) {
	gString[0] = EOS;
	if(!ServerVehicle[factionid][vFaction]) gString = "None";
	else format(gString, 32, FactionInfo_[ServerVehicle[factionid][vFaction] - 1][fName]);
	return gString;
}

YCMD:svf(playerid, params[], help) {
	if(!PlayerInfo[playerid][pMember])
		return SCM(playerid, COLOR_GREY, "You're not in a faction");
	
	if(IsMafiot(playerid))
		return SCM(playerid, COLOR_GREY, "You're faction not valabile.");
	
	else if(!PlayerVar[playerid][Duty] && PlayerInfo[playerid][pMember] != 9 && PlayerInfo[playerid][pMember] != 10)
		return SCM(playerid, COLOR_GREY, "You're not duty");

	if(PlayerVar[playerid][FactionVehicle] != INVALID_VEHICLE_ID)
		return SCM(playerid, COLOR_GREY, "Ai deja un vehicul spawnat.");

	if(IsPlayerInAnyVehicle(playerid))
		return true;

	new x = PlayerInfo[playerid][pMember];
	if(IsCop(playerid)) {
		x=-1;
		new f=0;
		while(f<SQL_Factions) {
			switch(f) {
				case 1, 2, 11: if(PlayerToPoint(playerid, 3, VehFInfo[f][vfX], VehFInfo[f][vfY], VehFInfo[f][vfZ])) { x=f; break; }
			}
			f++;
		}
		if(x==-1) return SCM(playerid, COLOR_GREY, "Nu esti in locul de unde poti spawna un vehicul.");
	}
	else if(!PlayerToPoint(playerid, 3, VehFInfo[x][vfX], VehFInfo[x][vfY], VehFInfo[x][vfZ]))
		return SCM(playerid, COLOR_GREY, "Nu esti in locul de unde poti spawna un vehicul.");

	listitemm[playerid] = x;
	new szDialog[500];
	strcat(szDialog, "Model\tRank\tStock\n");
	for(new i = 0; i < 10; i++) {
		if(VehFInfo[x][vfModel][i] == -1)
			continue;

		format(szDialog, sizeof(szDialog), "%s%s\t%s+%d\t%d\n", szDialog, GetVehicleName(VehFInfo[x][vfModel][i]), PlayerInfo[playerid][pRank] >= VehFInfo[x][vfRank][i] ? ("{50DB6F}") : ("{FF0000}"), VehFInfo[x][vfRank][i], VehFInfo[x][vfStock][i]);
	}
	ShowPlayerDialog(playerid, DIALOG_SVF, DIALOG_STYLE_TABLIST_HEADERS, "Spawn vehicle:", szDialog, "Select", "Cancel");
	return true;
}

function GiveCrime(playerid, declare, const reason[]) {
	ClearString();
	format(gString, 100, "Ai comis o noua crima (%s), raportata de %s. Wanted actual: %d.", reason, declare != -1 ? GetName(declare) : ("Unknown"), PlayerInfo[playerid][pWanted]);
	SCM(playerid, COLOR_RED, gString);
	format(gString, 120, "Dispatch: %s [%d] has commited a crime: %s. Reporter: %s. New wanted level: %d.",GetName(playerid),playerid,reason, declare != -1 ? GetName(declare) : ("Unknown"),PlayerInfo[playerid][pWanted]);
	format(PlayerInfo[playerid][pCrime], 34, reason);
	format(PlayerInfo[playerid][pCrimeReport], MAX_PLAYER_NAME, declare != -1 ? GetName(declare) : ("Unknown"));
	UpdateVarStr(playerid, "Crime", PlayerInfo[playerid][pCrime]);
	UpdateVarStr(playerid, "CrimeReport", PlayerInfo[playerid][pCrimeReport]);
	SendTeamMessage(1, 0x2e64feFF, gString);
	SendTeamMessage(2, 0x2e64feFF, gString);
	return true;
}

YCMD:so(playerid, params[], help) {
	if(!IsCop(playerid)) 
		return true;

	if(GetCoolDowns(playerid, 13)) 
		return CoolDowns(playerid, 13);

	if(!PlayerVar[playerid][Duty]) 
		return SCM(playerid, COLOR_LGREEN, "Nu poti folosi aceasta comanda deoarece nu esti la datorie!");
	
	if(sscanf(params, "u", params[0])) 
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/so [playerid/name]");

	if(!PlayerOfRangeToPlayer(playerid, 30, params[0])) 
		return SCM(playerid, COLOR_GREY, "Acel player nu se afla in raza ta!");

	if(params[0] == playerid) 
		return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta comanda asupra ta!");
	

	SetCoolDowns(playerid, 13, 5);
	gString[0] = EOS;
	if(PlayerInfo[params[0]][pWanted] != 0) format(gString, 150, "> %s: {4F90FF}%s{FFFF00}, esti cautat de politie. Opreste-te imediat sau risti wanted! <", GetName(playerid), GetName(params[0]));
	else if(PlayerInfo[params[0]][pWanted] == 0 && IsPlayerInAnyVehicle(params[0])) format(gString, 150, "> %s: {4F90FF}%s{FFFF00}, trage pe dreapta imediat! <", GetName(playerid), GetName(params[0]));
	else format(gString, 150, "> %s: {4F90FF}%s{FFFF00}, esti cautat de politie. Opreste-te imediat sau risti wanted! <", GetName(playerid), GetName(params[0]));
	ProxDetector(30.0, playerid, gString, COLOR_YELLOW);
	return true;
}

YCMD:mdc(playerid, params[]) {
	if(!IsCop(playerid))
		return SCM(playerid, COLOR_GREY, "Nu esti in politie.");

	if(!PlayerVar[playerid][Duty])
		return SCM(playerid, COLOR_GREY, "Nu esti duty");

	if(sscanf(params, "u", params[0]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/mdc [playerid/name]");

	if(!IsPlayerConnected(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(!IsPlayerLogged(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not logged.");

	ShowMDC(playerid, params[0]);
	return true;
}

function ShowMDC(playerid, id) {
	if(PlayerInfo[id][pWanted] == 0) 
		return SCM(playerid, COLOR_GREY, "Acel player nu are wanted!");

	MDCOn[id] = playerid;

	gString[0] = EOS;
	SCM(playerid, -1, "------------------------------------------- MDC -------------------------------------------");	
	format(gString, 150, "Name: %s (%d) | Wanted: {FFFB00}%d{FFFFFF} | Wanted Time: %d minutes | Chased by %d cops", GetName(id), id, PlayerInfo[id][pWanted], PlayerInfo[id][pWantedReason]/60, ChasedBy(id));
	SCM(playerid, -1, gString);
	format(gString, 100, "%s - reporter: %s", PlayerInfo[id][pCrime], PlayerInfo[id][pCrimeReport]);
	SCM(playerid, -1, gString);
	SCM(playerid, -1, "----------------------------------------------------------------------------------------------");
	return true;
}

YCMD:wanted(playerid, params[]) {
	if(!IsCop(playerid))
		return SCM(playerid, COLOR_GREY, "Nu esti politist.");

	if(!PlayerVar[playerid][Duty])
		return SCM(playerid, COLOR_GREY, "Nu esti duty.");

	if(!Iter_Count(Calls[9]))
		return SCM(playerid, COLOR_GREY, "Nu sunt suspecti connectati.");

	if(HaveCheckpoint(playerid))
		return ShowCancelCP(playerid);

	gString[0] = EOS;
	new szString[500], Float: Pos[3], x;
	strcat(szString, "Name\tWanted Level\tDistance\tChased by\n");
	foreach(new i : Calls[9]) {
		format(gString, 75, "%s (%d)\tWanted %d\t%.1fm\t%d cops\n", GetName(i), i, PlayerInfo[i][pWanted], GetPlayerDistanceFromPoint(playerid, Pos[0], Pos[1], Pos[2]), ChasedBy(playerid));
		strcat(szString, gString);
		PlayerCalls[playerid][x] = i;
		x++;
	}
	format(gString, 50, "Wanted online: %d", Iter_Count(Calls[9]));
	ShowPlayerDialog(playerid, DIALOG_WANTED, DIALOG_STYLE_TABLIST_HEADERS, gString, szString, "Select", "Close");
	return true;
}

YCMD:cuff(playerid, params[], help) {
    if(!IsCop(playerid)) 
    	return SCM(playerid, COLOR_GREY, "Nu esti politist.");

	if(sscanf(params, "u", params[0])) 
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/cuff [playerid/name]");
	
	if(!IsPlayerConnected(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(IsCop(params[0]))
		return true;

	if(!PlayerVar[playerid][Duty]) 
		return SCM(playerid, COLOR_LGREEN, "Nu poti folosi aceasta comanda deoarece nu esti la datorie!");
	
	if(PlayerVar[params[0]][Cuff]) 
		return true;

	if(!PlayerOfRangeToPlayer(playerid, 8, params[0]))
		return SCM(playerid, -1, "Acel player nu este langa tine.");

	if(params[0] == playerid) 
		return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta comanda asupra ta!");

	if(!IsPlayerInAnyVehicle(params[0])) 
		return true;

	if(!GetPlayerWantedLevel(params[0]))
		return SCM(playerid, COLOR_GREY, "Acel player nu are wanted!");

	TogglePlayerControllable(params[0], false);

	gString[0] = EOS;
	format(gString, 75, "* %s has handcuffed %s.", GetName(playerid), GetName(params[0]));
	ProxDetector(30.0, playerid, gString, COLOR_PURPLE);
	format(gString, sizeof gString, "* %s il are in custodia sa pe %s.", GetName(playerid), GetName(params[0]));
	SendFactionMessage(1, COLOR_LIGHTBLUE, gString);
	SendFactionMessage(2, COLOR_LIGHTBLUE, gString);
	SendFactionMessage(11, COLOR_LIGHTBLUE, gString);
	PlayerVar[params[0]][Cuff] = true;
	SetPlayerAttachedObject(params[0], 1, 19418, 6, -0.011000, 0.028000, -0.022000, -15.600012, -33.699977, -81.700035, 0.891999, 1.000000, 1.168000);
	SetPlayerSpecialAction(params[0], SPECIAL_ACTION_CUFFED);
	return true;
}

YCMD:cf(playerid, params[], help) {
	if(sscanf(params, "u", params[0])) 
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/cf [playerid/name]");

	if(!IsPlayerConnected(params[0])) 
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) 
		return true;

	if(!IsPlayerInVehicle(params[0], GetPlayerVehicleID(playerid))) 
		return SCM(playerid, COLOR_LGREEN, "Acel player nu este in vehiculul tau!");

	if(!PlayerInfo[params[0]][pWanted]) 
		return SCM(playerid, COLOR_LGREEN, "Acel player nu are wanted!");

	gString[0] = EOS;
	format(gString, 100, "* %s %s: %s este la mine, over.", GetRankName(playerid), GetName(playerid), GetName(params[0]));
	SendTeamMessage(2, COLOR_DEPART2, gString);
	SendTeamMessage(1, COLOR_DEPART2, gString);
	SendTeamMessage(7, COLOR_DEPART2, gString);	
	TogglePlayerControllable(params[0], false);
	format(gString, 60, "* %s has handcuffed %s.", GetName(playerid), GetName(params[0]));
	ProxDetector(30.0, playerid, gString, COLOR_PURPLE);
	PlayerVar[params[0]][Cuff] = true;
	SetPlayerAttachedObject(params[0], 1, 19418, 6, -0.011000, 0.028000, -0.022000, -15.600012, -33.699977, -81.700035, 0.891999, 1.000000, 1.168000);
	SetPlayerSpecialAction(params[0], SPECIAL_ACTION_CUFFED);	
	return true;
}

YCMD:d(playerid, params[], help) {
	if((!PlayerInfo[playerid][pRank] || !PlayerInfo[playerid][pMember]) && !IsAdmin(playerid, 1))
		return true;

	if(CheckMute(playerid)) return ShowMute(playerid);
	if(sscanf(params, "s[128]", params)) return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/d <text>");
	gString[0] = EOS;
	format(gString, 175, "* %s %s: %s, over.", !IsAdmin(playerid, 1) ? GetRankName(playerid) : ("Admin"), GetName(playerid), params);
	SendTeamMessage(2, COLOR_DEPART2, gString);
	SendTeamMessage(1, COLOR_DEPART2, gString);
	SendTeamMessage(7, COLOR_DEPART2, gString);
	SendTeamMessage(6, COLOR_DEPART2, gString);
	SendAdminMessage(COLOR_DEPART2, gString, 1);	
	return true;
}

YCMD:ticket(playerid, params[], help) {
	if(!IsCop(playerid)) 
		return SCM(playerid, COLOR_GREY, "Nu esti politist.");

	if(GetCoolDowns(playerid, 25))
		return CoolDowns(playerid, 25);

	if(!IsCop(playerid)) 
		return SCM(playerid, COLOR_LGREEN, "Nu poti folosi aceasta comanda!");

	if(!PlayerVar[playerid][Duty]) 
		return SCM(playerid, COLOR_LGREEN, "Eroare: Nu esti la datorie!");

	if(sscanf(params, "u", params[0])) 
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/ticket [playerid/name]");

	if(!IsPlayerConnected(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(!PlayerOfRangeToPlayer(playerid, 8, params[0])) 
		return SCM(playerid, -1, "Acel player nu este langa tine.");

	if(IsCop(params[0]))
		return SCM(playerid, COLOR_GREY, "Nu poti da amenda unui politist!");
							
	new szDialog[300]; gString[0] = EOS;	
	for(new i = 0; i < 7; i++) {
		format(gString, 100, "%s ($%d)\n", ticketName(i), ticketValue(i)); 
		strcat(szDialog, gString);
	}
	format(gString, 50, "Ticket > %s", GetName(params[0]));
	ShowPlayerDialog(playerid, DIALOG_TICKET, DIALOG_STYLE_LIST, gString, szDialog, "Ok", "Cancel");					
	listitemm[playerid] = params[0];				
	return true;
}



stock ticketName(id) {
	gString[0] = EOS;
	switch(id) {
		case 0: gString = "- Parcatul neregulamentar";
		case 1: gString = "- Condus neregulamentar";
		case 2: gString = "- Incurcarea celorlalti participanti la trafic";
		case 3: gString = "- Folosirea hidraulicelor pe un drum public";
		case 4: gString = "- Folosirea de NOS";
		case 5: gString = "- Headlights off (Faruri oprite)";
		case 6: gString = "- Mers pe partea carosabila";	
		case 7: gString = "- Condus fara casca";	
	}
	return gString;
}

stock ticketValue(id) {
	new x;
	switch(id) {
		case 0: x = 1500;
		case 1: x = 2000;
		case 2: x = 2500;
		case 3: x = 1500;
		case 4: x = 3000;
		case 5: x = 1000;
		case 6: x = 3000;
		case 7: x = 1500;
	}
	return x;
}

YCMD:uncuff(playerid, params[], help) {
    if(!IsCop(playerid)) 
    	return SCM(playerid, COLOR_GREY, "Nu esti politist.");

	if(!PlayerVar[playerid][Duty]) 
		return SCM(playerid, COLOR_LGREEN, "Nu poti folosi aceasta comanda deoarece nu esti la datorie!");

	if(sscanf(params, "u", params[0])) 
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/uncuff [playerid/name]");
	
	if(!IsPlayerConnected(params[0])) 
		return SCM(playerid, COLOR_GREY, "Player not connected");

	if(!PlayerOfRangeToPlayer(playerid, 8, params[0])) 
		return SCM(playerid, -1, "Acel player nu este langa tine.");

	if(params[0] == playerid) 
		return true;
	
	if(!PlayerVar[params[0]][Cuff]) 
		return true;

	TogglePlayerControllable(params[0], true);

	gString[0] = EOS;
	format(gString, 60, "* %s has uncuffed %s.", GetName(playerid), GetName(params[0]));
	ProxDetector(30.0, playerid, gString, COLOR_PURPLE);
	format(gString, 50, "* Ai fost descatusat de %s.", GetName(playerid));
	SCM(params[0], COLOR_LIGHTBLUE, gString);
	PlayerVar[params[0]][Cuff] = false;
	SetPlayerSpecialAction(params[0], SPECIAL_ACTION_NONE);
	RemovePlayerAttachedObject(params[0], 1);
	return true;
}

function ChasedBy(playerid) {
	new x;
	foreach(new i : Player) if(IsPlayerLogged(i) && MDCOn[playerid] == i && PlayerVar[i][Find] == playerid) x++;
	return x;
}

function AddFactionStock(playerid, model) {
	for(new i = 0; i < 13; i++) {
		if(VehFInfo[svfFaction[playerid]][vfModel][i] != model)
			continue;

		VehFInfo[svfFaction[playerid]][vfStock][i] ++;
		break;
	}
	return true;
}

YCMD:dvf(playerid, params[], help) {
	if(!PlayerInfo[playerid][pMember])
		return SCM(playerid, COLOR_GREY, "Nu esti intr-o factiune.");

	if(PlayerVar[playerid][FactionVehicle] == INVALID_VEHICLE_ID) 
		return SCM(playerid, COLOR_GREY, "Nu ai un vehicul spawnat.");

	FDespawnVehicle(playerid);
	GameTextForPlayer(playerid, "~w~~h~Ai despawnat vehiculul factiuni.", 5000, 3);
	return true;
}

YCMD:lvf(playerid, params[], help) {
	if(!PlayerInfo[playerid][pMember])
		return SCM(playerid, COLOR_GREY, "Nu faci parte dintr-o factiune.");

	if(PlayerVar[playerid][FactionVehicle] == INVALID_VEHICLE_ID)
		return SCM(playerid, COLOR_LGREEN, "Nu ai un vehicul spawnat.");
	
	if(HaveCheckpoint(playerid))
		return ShowCancelCP(playerid);

	new Float: Pos[3];
	GetVehiclePos(PlayerVar[playerid][FactionVehicle], Pos[0], Pos[1], Pos[2]);
	SetPlayerCheckpointEx(playerid, CP_NORMAL, Pos[0], Pos[1], Pos[2], 5.0);

	SCM(playerid, COLOR_YELLOW, "Ti-a fost pus un checkpoint pe minimap la masina ta spawnata.");
	return true;
}

YCMD:fare(playerid, params[], help) {
	if(PlayerInfo[playerid][pMember] != 5)
		return SCM(playerid, COLOR_GREY, "Nu esti in taxi.");

	if(PlayerVar[playerid][TaxiDuty]) {
		PlayerVar[playerid][TaxiDuty] = false;
		PlayerVar[playerid][TaxiAmount] = 0;
		GivePlayerCash(playerid, PlayerVar[playerid][TaxiTotal]);
		gString[0] = EOS;
		format(gString, 100, "Nu mai esti duty, ai castigat $%s.", FormatNumber(PlayerVar[playerid][TaxiTotal]));
		SCM(playerid, COLOR_WHITE, gString);
		PlayerVar[playerid][TaxiTotal] = 0;
		foreach(new i : PlayerInVehicle[GetPlayerVehicleID(playerid)]) PlayerTextDrawHide(i, TaxiPTD), PlayerVar[i][IsTaxi] = -1;
		return true;
	}

	if(!IsPlayerInAnyVehicle(playerid))
		return SCM(playerid, COLOR_GREY, "Nu esti intr-o masina.");

	if(ServerVehicle[GetPlayerVehicleID(playerid)][vFaction] != 5)
		return SCM(playerid, COLOR_GREY, "Nu te afli intr-un taxi.");

	params[0] = 100;

	PlayerVar[playerid][TaxiAmount] = params[0];

	PlayerVar[playerid][TaxiDuty] = true;
	gString[0] = EOS;
	format(gString, 100, "Taxi Driver %s is now on duty for $%s, use [/service].", GetName(playerid), FormatNumber(PlayerVar[playerid][TaxiAmount]));
	SCMTA(0x00C700FF, gString);

	foreach(new x : PlayerInVehicle[GetPlayerVehicleID(playerid)]) {
		PlayerVar[x][TaxiTotal] = 0;
		UpdateTaxi(x, playerid);
		PlayerVar[x][IsTaxi] = playerid;
		if(CP[x] == CP_FIND_PLAYER && PlayerVar[x][Find] == playerid) DisablePlayerFind(playerid);
		CallServiceAccept[x][0] = -1;

		if(playerid == x)
			continue;

		if(GetPlayerCash(playerid) < params[0]) {
			SCM(playerid, COLOR_GREY, "Nu ai bani necesari pentru taxi.");
			RemovePlayerFromVehicle(playerid);
			break;
		}
	}
	return true;
}

std::IsGangMember(playerid) {
	switch(PlayerInfo[playerid][pMember]) {
		case 3,4,8,12: return true;
	}
	return false;
}

std::getGunsValue(playerid,x=0,i=-1) {
	while(++i<5) if(gunset[playerid][i]) x += GunSetModel[3][i];
	return x;
}

std::getGunsMats(playerid,x=0,i=-1) {
	while(++i<5) if(gunset[playerid][i]) x += GunSetModel[2][i];
	return x;
}

YCMD:order(playerid, params[], help) {
	if(!PlayerInfo[playerid][pMember])
		return SCM(playerid, COLOR_GREY, "Nu esti intr-o factiune.");

	if(PlayerInfo[playerid][pWeaponLicense] < gettime())
		return SCM(playerid, COLOR_GREY, "Nu ai licenta de arme.");

	if(!PlayerVar[playerid][Duty] && PlayerInfo[playerid][pMember] != 9)
		return SCM(playerid, COLOR_LGREEN, "Eroare: Nu esti duty!");

	switch(PlayerInfo[playerid][pMember]) {
		case 3,4,8,12: {
			if(PlayerVar[playerid][IsFaction] != 2 && PlayerVar[playerid][IsFaction] != 3 && PlayerVar[playerid][IsFaction] != 7 && PlayerVar[playerid][IsFaction] != 11)
				return SCM(playerid, COLOR_GREY, "Nu esti in HQ.");

			if(!getPlayerGuns(playerid))
				return SCM(playerid, COLOR_GREY, "You dont't have any weapon set for order! Type /setguns.");

			if(GetPlayerCash(playerid) < getGunsValue(playerid)) return SCM(playerid, COLOR_GREY, "Nu ai suficienti banii.");

			for(new i = 0; i < 5; i++) if(gunset[playerid][i]) GivePlayerWeapon(playerid, GunSetModel[0][i], GunSetModel[1][i]);
			GivePlayerCash(playerid, -getGunsValue(playerid));
			gString[0] = EOS;
			format(gString, 150, "(Faction) {FFFFFF}Ai cumparat armele setate si ai platit $%s.", FormatNumber(getGunsValue(playerid)));
			SCM(playerid, COLOR_PINK, gString);
		}
		case 9: {
			if(PlayerVar[playerid][IsFaction] != 8)
				return SCM(playerid, COLOR_GREY, "Nu esti in HQ.");

			if(PlayerVar[playerid][HaveContract] == -1)
				return SCM(playerid, COLOR_GREY, "Nu ai un contract.");

			if(sscanf(params, "i", params[0])) {
				SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/order [weaponid]");
				SCM(playerid, COLOR_WHITE, "(1). Knife (50 $) | (2). SD-Pistol (300 $) | (3). Sniper (600 $)");
				return true;
			}

			switch(params[0]) {
				case 1: {
					if(GetPlayerCash(playerid) < 50) return SCM(playerid, COLOR_GREY, "Nu ai aceasta suma de bani.");
					GivePlayerWeapon(playerid, 4, 200);
					SCM(playerid, COLOR_MONEY, "Ti-ai cumparat un cutit la pretul de 50$.");
					GivePlayerCash(playerid, -50);
				}
				case 2: {
					if(GetPlayerCash(playerid) < 300) return SCM(playerid, COLOR_GREY, "Nu ai aceasta suma de bani.");
					GivePlayerWeapon(playerid, 23, 200);
					SCM(playerid, COLOR_MONEY, "Ti-ai cumparat un SD-Pistol la pretul de 300$.");
					GivePlayerCash(playerid, -300);
				}
				case 3: {
					if(GetPlayerCash(playerid) < 600) return SCM(playerid, COLOR_GREY, "Nu ai aceasta suma de bani.");
					GivePlayerWeapon(playerid, 34, 200);
					SCM(playerid, COLOR_MONEY, "Ti-ai cumparat un Sniper la pretul de 600$.");
					GivePlayerCash(playerid, -600);
				}
				default: return SCM(playerid, COLOR_GREY, "Invalid id.");
			}
		}
	}
	return true;
}

YCMD:mycontract(playerid, params[], help) {
	if(PlayerInfo[playerid][pMember] != 9) 
		return SCM(playerid, COLOR_GREY, "Nu esti Hitman!");

	if(PlayerVar[playerid][HaveContract] == -1) 
		return SCM(playerid, COLOR_GREY, "Nu ai un contract.");

	new p=PlayerVar[playerid][HaveContract];
	new faction[60] = {"None"}, job[60] = {"None"};
	if(PlayerInfo[p][pMember]) format(faction, sizeof faction, "{%s}%s", FactionInfo_[PlayerInfo[p][pMember] - 1][fColor], FactionInfo_[PlayerInfo[p][pMember] - 1][fName]);

	if(PlayerInfo[p][pJob]) format(job, sizeof job, "%s", JobInfo[PlayerInfo[p][pJob]-1][jName]);

	format(gString, sizeof gString, "Tinta: %s\nNivel: %d\nFactiune: %s\nJob: %s\nIncarcerat: %s", GetName(p), PlayerInfo[p][pLevel], faction, job, PlayerInfo[p][pJail]?("Yes"):("No"));
	ShowPlayerDialog(playerid, DIALOG_ONLINE, DIALOG_STYLE_LIST, "Your Contract", gString, "Close", "");
	return true;
}

YCMD:cancelhit(playerid, params[], help) {
	if(PlayerInfo[playerid][pMember] != 9) 
		return SCM(playerid, COLOR_GREY, "Nu esti Hitman!");

	if(PlayerVar[playerid][HaveContract] == -1) 
		return SCM(playerid, COLOR_GREY, "Nu ai un contract.");

	new id = PlayerVar[playerid][HaveContract];
	gString[0] = EOS;
	format(gString, 100, "**(( HA Dispatch: Hitman %s (%d) a anulat contractul sau. ))**", GetName(playerid), playerid);
	SendFactionMessage(10, COLOR_LIGHTBLUE, gString);
	PlayerVar[playerid][HaveContract] = -1;
	Iter_Add(Calls[8], id);
	return true;
}

YCMD:clear(playerid, params[], help) {
	if(!IsCop(playerid)) 
		return SCM(playerid, COLOR_GREY, "Nu faci parte din factiunea politiei.");

	if(sscanf(params, "u", params[0])) 
		return SCM(playerid,COLOR_GREY, "Syntax: {FFFFFF}/clear [playerid/name]");

	if(!IsPlayerConnected(params[0])) 
		return SCM(playerid, COLOR_GREY, "Acel player nu este conectat.");

	if(!IsPlayerLogged(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not logged.");

	if(params[0] == playerid) 
		return SCM(playerid, COLOR_WHITE, "You cannot clear yourself.");

	if(!PlayerInfo[params[0]][pWanted]) 
		return SCM(playerid, COLOR_LGREEN, "Eroare: Acel player nu are wanted!");

	gString[0] = EOS;
	format(gString, 75, "%s has cleared all your warrants!", GetName(playerid));
	SCM(params[0], COLOR_LIGHTRED, gString);
	format(gString, 125, "Dispatch: %s has cleared all the warrants on %s.", GetName(playerid), GetName(params[0]));
	SendTeamMessage(7, COLOR_LIGHTBLUE, gString);
	SendTeamMessage(2, COLOR_LIGHTBLUE, gString);
	SendTeamMessage(1, COLOR_LIGHTBLUE, gString);
	SetPlayerWanted(params[0], 0);
	return true;
}

YCMD:raport(playerid, params[], help) {
	if(IsMafiot(playerid)) return true;

	if(!PlayerInfo[playerid][pMember])
		return SCM(playerid, COLOR_GREY, "Nu esti intr-o factiune.");

	if(PlayerInfo[playerid][pRank] > 5)
		return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta comanda peste rank 6+");

	showRaport(playerid, playerid);
	SCM(playerid, COLOR_WHITE, "Raportul tau se reseteaza in fiecare duminca la ora 22!");
	/*
	new time = PlayerInfo[playerid][pRaportTime] - gettime();
	format(gString, 130, "The raport will be processed in: {D7FFB3}%d days. %d hours. %d minutes and %d seconds left.", time/86400, (time/3600) % 24, ((time/60) % 60), time % 60);
	SCM(playerid, COLOR_WHITE, gString);*/
	return true;
}

cmd:checkraport(playerid, params[]) {
	if(PlayerInfo[playerid][pRank] < 6)
		return true;

	new id;
	if(sscanf(params, #u, id))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/checkraport [username/id]");

	if(!IsPlayerConnected(id))
		return SCM(playerid, COLOR_GREY, "Acel player nu este connectat");

	if(!IsPlayerLogged(id))
		return SCM(playerid, COLOR_GREY, "Acel player nu este logat!");

	if(PlayerInfo[id][pMember] != PlayerInfo[playerid][pMember])
		return SCM(playerid, COLOR_LGREEN, "Eroare: Acel player nu este in factiunea ta!");

	showRaport(playerid, id);

	return true;
}

std::showRaport(targetid, playerid) {
	SCM(targetid, COLOR_WHITE, "");
	SCM(targetid, 0x4A6188FF, "Faction Raport:");
	gString[0] = EOS;
	new fid = PlayerInfo[playerid][pMember], rank = PlayerInfo[playerid][pRank];
	format(gString, 125, "Faction: {D7FFB3}%s (rank: %d). %d days.", FactionInfo_[fid-1][fName], PlayerInfo[playerid][pRank], (gettime() - PlayerInfo[playerid][pFDays])/86400);
	SCM(targetid, COLOR_WHITE, gString);
	format(gString, 75, "Function(s): {D7FFB3}%s", IsAdmin(playerid, 1) ? ("Admin (-50%% raport)") : IsHelper(playerid, 1) ? ("Helper (-50%% raport)") : ("none"));
	SCM(targetid, COLOR_WHITE, gString);
	switch(PlayerInfo[playerid][pMember]) {
		case 1, 2, 11: {
			format(gString, 50, "Runners: {D7FFB3}%d/%d", PlayerInfo[playerid][pFPoints][0], (IsAdmin(playerid, 1) || IsHelper(playerid, 1)) ? FactionRaport[fid][rank][0] / 2 : FactionRaport[fid][rank][0]);
			SCM(targetid, COLOR_WHITE, gString);
			format(gString, 50, "Tickets: {D7FFB3}%d/%d", PlayerInfo[playerid][pFPoints][1], (IsAdmin(playerid, 1) || IsHelper(playerid, 1)) ? FactionRaport[fid][rank][1] / 2 : FactionRaport[fid][rank][1]);
			SCM(targetid, COLOR_WHITE, gString);
			format(gString, 50, "License confiscated: {D7FFB3}%d/%d", PlayerInfo[playerid][pFPoints][2], (IsAdmin(playerid, 1) || IsHelper(playerid, 1)) ? FactionRaport[fid][rank][2] / 2 : FactionRaport[fid][rank][2]);
			SCM(targetid, COLOR_WHITE, gString);
		}
		case 3,4,8,12: {
			format(gString, 50, "Materials: {D7FFB3}%d/%d", PlayerInfo[playerid][pFPoints][0], (IsAdmin(playerid, 1) || IsHelper(playerid, 1)) ? FactionRaport[fid][rank][0] / 2 : FactionRaport[fid][rank][0]);
			SCM(targetid, COLOR_WHITE, gString);
			format(gString, 50, "Drugs: {D7FFB3}%d/%d", PlayerInfo[playerid][pFPoints][1], (IsAdmin(playerid, 1) || IsHelper(playerid, 1)) ? FactionRaport[fid][rank][1] / 2 : FactionRaport[fid][rank][1]);
			SCM(targetid, COLOR_WHITE, gString);
		}
		case 5: {
			format(gString, 50, "Players shipped: {D7FFB3}%d/%d", PlayerInfo[playerid][pFPoints][0], (IsAdmin(playerid, 1) || IsHelper(playerid, 1)) ? FactionRaport[fid][rank][0] / 2 : FactionRaport[fid][rank][0]);
			SCM(targetid, COLOR_WHITE, gString);
		}
		case 6: {
			format(gString, 50, "Players healed: {D7FFB3}%d/%d", PlayerInfo[playerid][pFPoints][0], (IsAdmin(playerid, 1) || IsHelper(playerid, 1)) ? FactionRaport[fid][rank][0] / 2 : FactionRaport[fid][rank][0]);
			SCM(targetid, COLOR_WHITE, gString);
		}
		case 7: {
			format(gString, 50, "License ofered: {D7FFB3}%d/%d", PlayerInfo[playerid][pFPoints][0], (IsAdmin(playerid, 1) || IsHelper(playerid, 1)) ? FactionRaport[fid][rank][0] / 2 : FactionRaport[fid][rank][0]);
			SCM(targetid, COLOR_WHITE, gString);
		}
		case 9: {
			format(gString, 50, "Contracts: {D7FFB3}%d/%d", PlayerInfo[playerid][pFPoints][0], (IsAdmin(playerid, 1) || IsHelper(playerid, 1)) ? FactionRaport[fid][rank][0] / 2 : FactionRaport[fid][rank][0]);
			SCM(targetid, COLOR_WHITE, gString);
		}
		case 10: {
			format(gString, 50, "News: {D7FFB3}%d/%d", PlayerInfo[playerid][pFPoints][0], (IsAdmin(playerid, 1) || IsHelper(playerid, 1)) ? FactionRaport[fid][rank][0] / 2 : FactionRaport[fid][rank][0]);
			SCM(targetid, COLOR_WHITE, gString);
			format(gString, 50, "Livestreams: {D7FFB3}%d/%d", PlayerInfo[playerid][pFPoints][1], (IsAdmin(playerid, 1) || IsHelper(playerid, 1)) ? FactionRaport[fid][rank][1] / 2 : FactionRaport[fid][rank][1]);
			SCM(targetid, COLOR_WHITE, gString);
		}
	}
	format(gString, 100, "Raport status: %s", CheckRaport(playerid, PlayerInfo[playerid][pMember], PlayerInfo[playerid][pRank]) ? ("{00ff00}Complete") : ("{ff0000}Incomplete"));
	SCM(targetid, COLOR_WHITE, gString);
	return true;
}

YCMD:editfaction(playerid, params[], help) {
	if(!IsAdmin(playerid, 6))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	if(sscanf(params, "i", params[0]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/editfaction [factionid]");

	if(params[0] < 1 || params[0] > MAX_FACTIONS)
		return SCM(playerid, COLOR_GREY, "Invalid factions.");
	
	listitemm[playerid] = params[0];
	ShowPlayerDialog(playerid, DIALOG_EDITFACTION, DIALOG_STYLE_LIST, "Edit faction", "Raport\nRank Name\nEdit Position\nEdit Name\nEdit svf", "Select", "Close");
	return true;
}

YCMD:news(playerid, params[], help) {
	if(!PlayerInfo[playerid][pMember])
		return SCM(playerid, COLOR_GREY, "Nu esti intr-o factiune.");

	if(PlayerInfo[playerid][pMember] != 10)
		return SCM(playerid, COLOR_GREY, "Nu faci parte din news reports.");

	if(GetCoolDowns(playerid, 20))
		return CoolDowns(playerid, 20);

	if(CheckMute(playerid)) return ShowMute(playerid);

	if(!IsPlayerInAnyVehicle(playerid) && ServerVehicle[GetPlayerVehicleID(playerid)][vFaction] != PlayerInfo[playerid][pMember])
		return SCM(playerid, COLOR_GREY, "Nu esti intr-un din vehiculul factiuni.");

	if(sscanf(params, "s[150]", params))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/news [text]");

	gString[0] = EOS;
	format(gString, 175, "News: %s: %s", GetName(playerid), params);
	OOCNews(COLOR_NEWS, gString);
	AddFactionRaport(playerid, 0, 1);
	SetCoolDowns(playerid, 20, 60);
	return true;
}

YCMD:givelicense(playerid, params[], help) {
	if(!PlayerInfo[playerid][pMember])
		return SCM(playerid, COLOR_GREY, "Nu esti intr-o factiune.");

	if(PlayerInfo[playerid][pMember] != 7)
		return SCM(playerid, COLOR_GREY, "Nu faci parte din factiunea School Instrucotr.");

	if(!PlayerVar[playerid][Duty])
		return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta comanda daca nu esti la datorie.");

	new id;
	if(sscanf(params, "us[24]", id, params))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/givelicense [playerid/name] [license]"), SCM(playerid, COLOR_GREY, "License: {FFFFFF}Fly, Boat, Weapon."), 1;
	
	if(PlayerVar[id][IsLession] != playerid)
		return SCM(playerid, COLOR_GREY, "Acel player nu are o lectie pornita.");

	if(!IsPlayerConnected(id))
		return SCM(playerid, COLOR_GREY, "Playet not connected.");

	if(!IsPlayerLogged(id))
		return SCM(playerid, COLOR_GREY, "Player not logged.");

	if(!PlayerOfRangeToPlayer(playerid, 5, id))
		return SCM(playerid, COLOR_GREY, "Nu esti langa acel player.");

	if(PlayerInfo[id][pLevel] < 3)
		return SCM(playerid, COLOR_GREY, "Acel player nu are level 3+.");

	if(GetPlayerCash(id) < 300000)
		return SCM(playerid, COLOR_GREY, "Acel player nu are $300.000.");

	if(PlayerVar[playerid][OferLicense]==id) 
		return SCM(playerid, COLOR_GREY, "I-ai dat deja o cerere acelui jucator.");

	if(strcmp(params, "fly", true) == 0) PlayerVar[id][TypeLicense] = 1;
	else if(strcmp(params, "weapon", true) == 0) PlayerVar[id][TypeLicense] = 2;
	else if(strcmp(params, "boat", true) == 0) PlayerVar[id][TypeLicense] = 3;
	else return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/givelicense [playerid/name] [license]"), SCM(playerid, COLOR_GREY, "License: {FFFFFF}Fly, Boat, Weapon."), 1;
	PlayerVar[playerid][OferLicense] = id;
	gString[0] = EOS;
	format(gString, 125, "* I-ai oferit licenta de %s lui %s.", params, GetName(id));
	SCM(playerid, COLOR_LIGHTBLUE, gString);
	format(gString, 125, "* %s ti-a oferit licenta de %s (/accept license %d).", GetName(playerid), params, playerid);
	SCM(id, COLOR_LIGHTBLUE, gString);
	return true;
}

UninvitePlayerFaction(id, fp) {
	if(PlayerVar[id][FactionVehicle] != INVALID_VEHICLE_ID) FDespawnVehicle(id);
	if(Iter_Contains(Factions<PlayerInfo[id][pMember]>, id)) Iter_Remove(Factions<PlayerInfo[id][pMember]>, id);
	FactionInfo_[PlayerInfo[id][pMember] - 1][fMembers] --;
	gQuery[0] = EOS;
	if(PlayerInfo[id][pRank] == 7) format(FactionInfo_[PlayerInfo[id][pMember] - 1][fLeader], MAX_PLAYER_NAME, "None");
	if(InWar[PlayerInfo[id][pMember]] != -1) for(new y = 0; y < 12; y++) PlayerTextDrawHide(id, WarPTD[y]);
	PlayerInfo[id][pMember] = 0;
	PlayerInfo[id][pRank] = 0;
	PlayerInfo[id][pSpawnChange] = 0;
	PlayerInfo[id][pFP] = fp;
	PlayerInfo[id][pFWarn] = 0;
	if(PlayerVar[id][Undercover]) {
		foreach(new i : Player) ShowPlayerNameTagForPlayer(i, id, true);
		PlayerVar[id][Undercover] = false;
		SCM(id, COLOR_WHITE, "Nu mai esti undercover.");
	}
	if(PlayerInfo[id][pAdmin] || PlayerInfo[id][pHelper]) {}
	else Iter_Remove(_Player<LEADER>, id);
	SetPlayerSkin(id, PlayerInfo[id][pModel]);
	Tazer[id] = false;
	UpdateVar(id, "Spawnchange", 0);
	UpdateVar(id, "Member", 0);
	UpdateVar(id, "Rank", 0);
	UpdateVar(id, "Punish", fp);
	UpdateVar(id, "FWarn", 0);

	if(PlayerVar[id][Duty]) PlayerVar[id][Duty] = false;

	SetPlayerColor(id, COLOR_WHITE);
	foreach(new y : StreamedPlayer[id]) SetPlayerMarkerForPlayer(y, id, COLOR_WHITE & 0xFFFFFF00);
	return true;
}

YCMD:startlesson(playerid, params[]) {
	if(PlayerInfo[playerid][pMember] != 7)
		return SCM(playerid, COLOR_LGREEN, "Nu faci parte din facitune School Instrucotr.");

	if(!PlayerVar[playerid][Duty])
		return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta comanda daca nu esti la datorie.");

	if(sscanf(params, "u", params[0]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/startlesson [playerid/name]");

	if(!IsPlayerConnected(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(!IsPlayerLogged(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not logged.");

	if(PlayerVar[playerid][IsLession] != -1 || PlayerVar[params[0]][IsLession] != -1)
		return SCM(playerid, COLOR_GREY, "Tu sau acel player este deja intr-o sessiune.");

	if(PlayerInfo[params[0]][pLevel] < 3)
		return SCM(playerid, COLOR_GREY, "Acel player nu are level 3+.");

	if(!PlayerOfRangeToPlayer(playerid, 5, params[0]))
		return SCM(playerid, COLOR_GREY, "Nu esti langa acel player.");	

	PlayerVar[playerid][OferLession] = params[0];

	gString[0] = EOS;
	format(gString, 125, "Instructorul %s doreste sa inceapa o lectie cu tine. (/accept lesson %d)", GetName(playerid), playerid);
	SCM(params[0], COLOR_LIGHTBLUE, gString);
	format(gString, 75, "Invitatie a fost trimisa lui %s.", GetName(params[0]));
	SCM(playerid, COLOR_LIGHTBLUE, gString);	
	return true;
}
YCMD:stoplesson(playerid, params[]) {
	if(PlayerVar[playerid][IsLession] == -1)
		return SCM(playerid, COLOR_GREY, "Nu esti intr-o lectie.");

	new id = PlayerVar[playerid][IsLession];
	PlayerVar[playerid][IsLession] = -1;
	SCM(playerid, COLOR_LIGHTBLUE, "Lectia a fost terminata!");
	if(!IsPlayerConnected(id))
		return true;

	PlayerVar[id][IsLession] = -1;
	SCM(id, COLOR_LGREEN, "Lectia a fost terminata!");
	return true;
}

function StartRaportLession(playerid) {
	new y, mu, d, h, m, s;
	getdate(y, mu, d);
	gettime(h, m, s);
	for(new i = 0; i < 3; i++) PlayerInfo[playerid][pFPoints][i] = 0;
	PlayerInfo[playerid][pRaportTime] = gettime() + (86400*7);
	UpdateVar(playerid, "RaportExpire", PlayerInfo[playerid][pRaportTime]);
	save_raport(playerid);
	return true;
}

function CheckRaport(playerid, fid, rank) {
	new totalraport = FactionRaport[fid][rank][0] + FactionRaport[fid][rank][1] + FactionRaport[fid][rank][2];
	if(PlayerInfo[playerid][pFPoints][0] + PlayerInfo[playerid][pFPoints][1] + PlayerInfo[playerid][pFPoints][2] >= ((PlayerInfo[playerid][pAdmin] != 0 || PlayerInfo[playerid][pHelper] != 0) ? (totalraport/2) : (totalraport))) return true;
	return false;
}

function CheckFactionRaport(playerid) {
	/*
	if(gettime() < PlayerInfo[playerid][pRaportTime] && PlayerInfo[playerid][pRaportTime] != -1)
		return true;

	gString[0] = EOS;
	if(CheckRaport(playerid, PlayerInfo[playerid][pMember], PlayerInfo[playerid][pRank])) {
		SCM(playerid, COLOR_YELLOW, "Faction Raport completed.");
		if(PlayerInfo[playerid][pRank] > 6) {
			PlayerInfo[playerid][pRank] = PlayerInfo[playerid][pRank] + 1 > 5 ? 5 : PlayerInfo[playerid][pRank] + 1;
			format(gString, 100, "congratulations! You went to rank %d in faction %s", PlayerInfo[playerid][pRank], FactionInfo_[PlayerInfo[playerid][pMember] - 1][fName]);
			SCM(playerid, COLOR_YELLOW, gString);
			UpdateVar(playerid, "Rank", PlayerInfo[playerid][pRank]);
		}
		StartRaportLession(playerid);
		return true;
	}
	SCM(playerid, COLOR_YELLOW, "Faction Raport not completed.");
	if(PlayerInfo[playerid][pRank] != 1) {
		SCM(playerid, COLOR_YELLOW, "You got a warn faction. Reason: Incomplete Report.");
		PlayerInfo[playerid][pFWarn] ++;
		UpdateVar(playerid, "FWarn", PlayerInfo[playerid][pFWarn]);
		StartRaportLession(playerid);
		return true;
	}
	SCM(playerid, COLOR_YELLOW, "You were kicked out of the faction without Faction punish. Reason: Incomplete Report.");
	PlayerInfo[playerid][pMember] = 0;
	PlayerInfo[playerid][pRank] = 0;
	PlayerInfo[playerid][pFP] = 0;
	UpdateVar(playerid, "Punish", 60);
	UpdateVar(playerid, "Rank", 0);
	UpdateVar(playerid, "Member", 0);
	gString[0] = EOS;
	format(gString, sizeof gString, "was uninvited by AdmBot from %s (rank %d) after %d days, without FP. Reason: incomplete faction raport", FactionInfo_[PlayerInfo[playerid][pMember]-1][fName], PlayerInfo[playerid][pRank], (gettime()-PlayerInfo[playerid][pFDays])/86400);
	mysql_format(SQL, gQuery, sizeof gQuery, "INSERT INTO `faction_logs` (`text`, `Userid`, `ByUserid`) VALUES ('%e', '%i', '-1')", gString, PlayerInfo[playerid][pSQLID]);
	mysql_tquery(SQL, gQuery);
	SpawnPlayer(playerid);*/
	return true;
}

YCMD:live(playerid, params[], help) {
	if(PlayerInfo[playerid][pMember] != 10) 
		return SCM(playerid, COLOR_GREY, "Nu faci parte din factiunea News Reporters.");

	if(NewLive[playerid] != -1) 
		return SCM(playerid, COLOR_GREY, "Esti deja intr-un live.");

	if(PlayerInfo[playerid][pRank] < 3) 
		return SCM(playerid, -1, "Trebuie sa ai minim rank 3 pentru a da live!");

	if(!IsPlayerInAnyVehicle(playerid))
		return SCM(playerid, COLOR_GREY, "Nu te afli intr-un vehicul.");

	if(ServerVehicle[GetPlayerVehicleID(playerid)][vFaction] != 10)
		return SCM(playerid, COLOR_GREY, "Nu esti intr-un vehicul a-l factiuni.");

	new id;
	if(sscanf(params, "u",id)) 
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/live [playerid/name]");

	if(!IsPlayerConnected(id)) 
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(!PlayerOfRangeToPlayer(playerid, 5, id)) 
		return SCM(playerid, -1, "Acel player nu este langa tine.");

	new hour,minute,second;
	gettime(hour,minute,second);
	if(hour >= 00 && hour < 8) 
		return SCM(playerid, COLOR_LIGHTRED, "Nu poti folosi aceasta comanda in intervalul 00-08.");

	if(id == playerid) 
		return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta comanda asupra ta!");

	params[0] = EOS;
	format(params, 150, "**(( NR Dispatch: Reporter %s (%d) e pe cale sa inceapa un interviu cu %s (%d). ))**", GetName(playerid), playerid, GetName(id), id);
	SCM(playerid, COLOR_LIGHTBLUE, params);
	format(params, 100, "* I-ai oferit lui %s o conversatie Live.", GetName(id));
	SCM(playerid, COLOR_LIGHTBLUE, params);
	format(params, 150, "* %s ti-a oferit o conversatie live. (/accept live %d) pentru a accepta.", GetName(playerid), playerid);
	SCM(id, COLOR_LIGHTBLUE, params);
	LiveOffer[playerid] = id;
	return true;
}

stock RaportName(const raportid, const index) {
	gString[0] = EOS;
	switch(raportid) {
		case 1, 2, 11: {
			switch(index) {
				case 0: gString = "Runners";
				case 1: gString = "Tickets";
				case 2: gString = "Confiscated";
			}
		}
		case 5: gString = "Players shipped";
		case 6: gString = "Players healed";
		case 8: gString = "Progress Raport";
		case 9: gString = "Contracts";
		case 10: {
			switch(index) {
				case 0: gString = "News";
				case 1: gString = "Livestreams";
			}
		}
	}
	return gString;
}

YCMD:confiscate(playerid, params[], help) {
	if(!IsCop(playerid))
		return SCM(playerid, COLOR_LGREEN, "Nu esti politist");

	if(!PlayerVar[playerid][Duty])
		return SCM(playerid, COLOR_GREY, "Nu esti la datorie.");

	if(PlayerInfo[playerid][pRank] < 2)
		return SCM(playerid, COLOR_LGREEN, "Ai nevoie de rank 2+");

	if(GetCoolDowns(playerid, 24))
		return CoolDowns(playerid, 24);

	new id, item[15];
	if(sscanf(params, "us[15]", id, item)) {
		SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/confiscate [playerid/name] [license]");
		SCM(playerid, COLOR_GREY, "Confiscate: {FFFFFF}driving, drugs, weapon");
		return true;
	}

	if(!IsPlayerConnected(id))
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(!IsPlayerLogged(id))
		return SCM(playerid, COLOR_GREY, "Player not logged.");

	if(!PlayerOfRangeToPlayer(playerid, 8, id))
		return SCM(playerid, COLOR_GREY, "Nu te afli langa acel player.");

	if(IsCop(id))
		return SCM(playerid, COLOR_GREY, "Nu poti confisca itemele unui politist.");

	gString[0] = EOS;
	if(strcmp(item, "driving", true) == 0) {
		if(PlayerInfo[id][pDrvingSuspend] > gettime())
			return SCM(playerid, COLOR_GREY, "Acel player are deja licenta de driving suspendata.");

		format(gString, 100, "* Officer %s ti-a confiscat licenta condus.", GetName(playerid));
		PlayerInfo[id][pDrvingSuspend] = gettime() + (2 * 3600);
		UpdateVar(id, "DrivingSuspend", PlayerInfo[id][pDrvingSuspend]);
		PlayerInfo[id][pDriveLicense] = gettime();
		UpdateVar(id, "DriveLicense", gettime());
	}
	else if(strcmp(item, "weapon", true) == 0) {
		if(PlayerInfo[id][pDrvingSuspend] > gettime())
			return SCM(playerid, COLOR_GREY, "Acel player are deja licenta de driving suspendata.");

		format(gString, 100, "* Officer %s ti-a confiscat licenta arme.", GetName(playerid));
		PlayerInfo[id][pWeaponSuspend] = gettime() + (2 * 3600);
		UpdateVar(id, "WeaponSuspend", PlayerInfo[id][pWeaponSuspend]);
		PlayerInfo[id][pWeaponLicense] = gettime();
		UpdateVar(id, "WeaponLicense", gettime());

		ResetPlayerWeapons(id);
	}
	else if(strcmp(item, "drugs", true) == 0)  PlayerInfo[id][pDrugs] = 0, UpdateVar(id, "Drugs", PlayerInfo[id][pDrugs]), format(gString, 100, "* Officer %s ti-a confiscat drogurile.", GetName(playerid));
	else {
		SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/confiscate [playerid/name] [license] ");
		SCM(playerid, COLOR_GREY, "Confiscate: {FFFFFF}driving, drugs, weapon");
		return true;
	}
	SetCoolDowns(playerid, 24, 60);
	SCM(id, COLOR_LIGHTBLUE, gString);
	format(gString, 100, "* %s has confiscated %s's %s.", GetName(playerid), GetName(id), item);
    SendTeamMessage(1, 0x2e64feFF, gString);
    SendTeamMessage(2, 0x2e64feFF, gString);
    SendTeamMessage(7, 0x2e64feFF, gString);
    AddFactionRaport(playerid, 2, 1);
	return true;
}

YCMD:frisk(playerid, params[], help) {
	if(!IsCop(playerid)) 
		return SCM(playerid, COLOR_GREY, "Nu esti plitist.");

	new id;
	if(sscanf(params, "u", id)) 
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/frisk [playerid/name]");

	if(!IsPlayerConnected(id)) 
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(!IsPlayerLogged(id))
		return SCM(playerid, COLOR_GREY, "Player not logged.");

	if(!PlayerOfRangeToPlayer(playerid, 8, id)) 
		return SCM(playerid, -1, "Acel player nu este langa tine.");

	if(id == playerid) 
		return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta comanda asupra ta!");
	
	gString[0] = EOS;
	format(gString, 50, "** Lucrurile lui %s **", GetName(id));
	SCM(playerid, COLOR_WHITE, gString);
	format(gString, 100, "%s, grame de droguri: %d", PlayerInfo[id][pDrugs] != 0 ? ("Droguri") : ("Buzunar gol"), PlayerInfo[id][pDrugs]);
	SCM(playerid, 0xFFFFFFAA, gString);
	format(gString, 100, "%s, materiale: %d", PlayerInfo[id][pMats] != 0 ? ("Materiale") : ("Buzunar gol"), PlayerInfo[id][pMats]);
	SCM(playerid, 0xFFFFFFAA, gString);
	new Player_Weapons[13], Player_Ammos[13], i, weaponName[35];
	for(i = 1;i <= 12;i++) {
		GetPlayerWeaponData(id, i, Player_Weapons[i], Player_Ammos[i]);
		if(Player_Weapons[i] != 0) {
			GetWeaponName(Player_Weapons[i], weaponName,255);
			format(gString, 100,"* %s, Arma:{FFFFFF} %s, Gloanta:{FFFFFF} %d", GetName(id), weaponName, Player_Ammos[i]);
			SCM(playerid, 0xFFFFFFAA, gString);
		}
	}
	format(gString, 150, "* %s l-a verificat pe %s pentru lucruri ilegale.", GetName(playerid), GetName(id));
	ProxDetector(30.0, playerid, gString, COLOR_PURPLE);
    return true;
}

YCMD:tazer(playerid, params[]) {
	if(!IsCop(playerid)) 
		return SCM(playerid, COLOR_GREY, "Nu esti politist.");

	if(!PlayerVar[playerid][Duty])
		return SCM(playerid, COLOR_GREY, "Nu esti la datorie.");

	if(GetPlayerWeapon(playerid) != 24) 
		return SCM(playerid,COLOR_GREY, "Pentru a activa tazer-ul, trebuie sa ai un Deagle in mana!");
	
	Tazer[playerid] = !Tazer[playerid];
	switch(Tazer[playerid]) {
		case 1: format(params, 75, "* %s equiped a taser.", GetName(playerid)), ProxDetector(30.0, playerid, params, COLOR_PURPLE);				
		case 0: SCM(playerid, -1, "Tazer off!");
	}
	return true;
}

function EndLive(playerid) {
	new id = NewLive[playerid];
	gString[0] = EOS;
	format(gString, 75, "%s a iesit din live.", GetName(playerid));
	SCM(id, COLOR_YELLOW, gString);
	SCM(playerid, COLOR_YELLOW, "Ai iesit din live.");

	if(PlayerInfo[playerid][pMember] == 10 && PunctRaport[id] > 5) AddFactionRaport(playerid, 1, 1), PunctRaport[id] = 0;
	else if(PlayerInfo[id][pMember] == 10 && PunctRaport[playerid] > 5) AddFactionRaport(id, 1, 1), PunctRaport[playerid] = 0;

	TogglePlayerControllable(playerid, true);
	TogglePlayerControllable(id, true);
	Questions = false;
	NewLive[playerid] = -1;
	NewLive[id] = -1;
	return true;
}

YCMD:questions(playerid, params[], help) {
	if(PlayerInfo[playerid][pMember] != 10) 
		return true;

	SCM(playerid, COLOR_LGREEN, !Questions ? "Acum playerii pot trimite intrebari!" : "Acum playerii nu mai pot trimite intrebari!");
	Questions = Questions ? false : true;
	return true;
}
YCMD:question(playerid, params[], help) {
	if(Question[playerid]) 
		return SCM(playerid, -1, "Nu poti pune mai multe intrebari!");

	if(!Questions) return SCM(playerid, COLOR_GREY, "Nu se pot pune intrebari acum!");

	if(PlayerInfo[playerid][pLevel] < 3) 
		return SCM(playerid, COLOR_GREY, "Pentru a folosi aceasta comanda, ai nevoie de minim nivel 3!");

	if(NewLive[playerid] != -1)
		return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta comanda.");

	if(sscanf(params, "s[180]", params)) return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/question [text]");
	if(strlen(params) < 10) return SCM(playerid, -1, "Intrebare prea mica!");
	gString[0] = EOS;
	format(gString, sizeof(gString), "Intrebare de la %s (%d): %s", GetName(playerid), playerid, params);
	SendFactionMessage(11, COLOR_YELLOW, gString);
	Question[playerid] = true;
	SCM(playerid, COLOR_YELLOW, "Intrebare trimisa!");
	format(QuestText[playerid], 144, params);
	return true;
}

YCMD:endlive(playerid, params[]) {
	if(PlayerInfo[playerid][pMember] != 10)
		return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta comanda.");

	if(NewLive[playerid] == -1)
		return SCM(playerid, COLOR_GREY, "Nu esti live.");

	EndLive(playerid);
	return true;
}

YCMD:aq(playerid, params[], help) {
	if(PlayerInfo[playerid][pMember] != 10) 
		return true;

	if(NewLive[playerid] == -1) 
		return SCM(playerid, COLOR_LGREEN, "Nu esti intr-un live!");

	if(!Questions) 
		return SCM(playerid, COLOR_GREY, "Nu poti accepta intrebari acum!");

	new id;
	if(sscanf(params, "u", id)) 
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/aq [playerid/name]");

	if(!IsPlayerConnected(id)) 
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(!IsPlayerLogged(id))
		return SCM(playerid, COLOR_GREY, "Player not logged.");

	if(!Question[id])
		return SCM(playerid, -1, "Acel player nu a pus o intrebare!");

	Question[id] = false;
	gString[0] = EOS;
	format(gString, sizeof gString, "Intrebare de la %s: %s", GetName(id), QuestText[id]);
	SCMTA(COLOR_LIGHTGREEN, gString);
	return true;
}

function AddFactionRaport(playerid, const index, const value) {
	PlayerInfo[playerid][pFPoints][index] += value, save_raport(playerid);
	save_raport(playerid);
	new string[50];
	new sv_points = RandomEx(1,5);
	PlayerInfo[playerid][pServerPoints] += sv_points;
	SCMf(playerid, COLOR_MONEY, "Ai primit %d aky points!", sv_points);
	format(string, 50, "%s: %d", RaportName(PlayerInfo[playerid][pMember], index), PlayerInfo[playerid][pFPoints][index]);
	SCM(playerid, COLOR_YELLOW, string);
	return true;
}
save_raport(playerid) {
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, 100, "UPDATE `users` SET `Raport` = '%d|%d|%d' WHERE `id` = '%d'", PlayerInfo[playerid][pFPoints][0], PlayerInfo[playerid][pFPoints][1], PlayerInfo[playerid][pFPoints][2], PlayerInfo[playerid][pSQLID]);
	mysql_tquery(SQL, gQuery);
}

YCMD:undercover(playerid, params[], help) {
	if(PlayerInfo[playerid][pMember] != 9)
		return SCM(playerid, COLOR_GREY, "Nu esti hitman");

	if(PlayerVar[playerid][HaveContract] == -1)
		return SCM(playerid, COLOR_LGREEN, "Nu poti fi subacoperire daca nu ai primit un contract.");

	PlayerVar[playerid][Undercover] = PlayerVar[playerid][Undercover] ? false:true;
	switch(PlayerVar[playerid][Undercover]) {
		case true: {
			if(PlayerVar[playerid][IsFaction] != 8)
				return SCM(playerid, COLOR_GREY, "Nu esti in HQ.");

			gString[0] = EOS;
			format(gString, 125, "**(( HA Dispatch: Hitman %s (%d) este acum sub acoperire. ))**", GetName(playerid), playerid);
			SendTeamMessage(10, 0x2C6CBFFF, gString);
		    SCM(playerid, COLOR_WHITE, "Acum esti undercover.");
		    SetPlayerSkin(playerid, FactionInfo_[PlayerInfo[playerid][pMember] - 1][fSkin][PlayerInfo[playerid][pRank] - 1]);
			foreach(new i : Player) ShowPlayerNameTagForPlayer(i, playerid, false);
		}
		case false: {
			foreach(new i : Player) ShowPlayerNameTagForPlayer(i, playerid, true);
			SCM(playerid, COLOR_WHITE, "Nu mai esti undercover.");
			SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
		}
	}
	return true;
}

YCMD:contracts(playerid, params[], help) {
	if(PlayerInfo[playerid][pMember] != 9)
		return SCM(playerid, COLOR_GREY, "Nu esti in hitman.");


	SCM(playerid, COLOR_GREY, " ---- Contracts ----");
	gString[0] = EOS;
	format(gString, 50, "Au fost gasite %d contracte.", Iter_Count(Calls[8]));
	SCM(playerid, COLOR_LGREEN, gString);
	return true;
}

YCMD:gethit(playerid, params[], help) {
	if(PlayerInfo[playerid][pMember] != 9) 
		return SCM(playerid, COLOR_GREY, "Nu esti Hitman!");

	if(PlayerVar[playerid][IsFaction] != 8)
		return SCM(playerid, COLOR_GREY, "Nu esti in HQ.");

	if(PlayerVar[playerid][HaveContract] != -1) 
		return SCM(playerid, COLOR_GREY, "Ai deja un contract.");

	if(!Iter_Count(Calls[8]))
		return SCM(playerid, COLOR_GREY, "Momentan nu sunt contracte.");

	PlayerVar[playerid][HaveContract] = Iter_Random(Calls[8]);
	Iter_Remove(Calls[8], PlayerVar[playerid][HaveContract]);

	new Float: Pos[3];
	PlayerVar[playerid][Find] = PlayerVar[playerid][HaveContract];
	GetPlayerPos(PlayerVar[playerid][HaveContract], Pos[0], Pos[1], Pos[2]);

	PlayerTextDrawSetPreviewModel(playerid, FindPTD[1], GetPlayerSkin(PlayerVar[playerid][HaveContract]));
	PlayerTextDrawShow(playerid, FindPTD[0]);
	PlayerTextDrawShow(playerid, FindPTD[1]);

	UpdatePlayerFind(playerid);

	if(PlayerInfo[playerid][pPhoneStatus])
		SCM(playerid, COLOR_RED, "Atentie: Nu ai telefonul inchis.");

	gString[0] = EOS;
	format(gString, 150, "**(( HA Dispatch: Hitman %s (%d) a preluat un nou contract pentru suma de %d$. ))**", GetName(playerid), playerid, PlayerVar[PlayerVar[playerid][HaveContract]][BodyMoney]);
	SendFactionMessage(10, COLOR_LIGHTBLUE, gString);
	return true;
}

YCMD:leavehit(playerid, params[], help) {
	if(PlayerInfo[playerid][pMember] != 9) 
		return SCM(playerid, COLOR_GREY, "Nu esti Hitman!");

	if(PlayerVar[playerid][IsFaction] != 8)
		return SCM(playerid, COLOR_GREY, "Nu esti in HQ.");

	if(PlayerVar[playerid][HaveContract] == -1) 
		return SCM(playerid, COLOR_GREY, "Nu ai un contract!");

	if(!Iter_Count(Calls[8]))
		return SCM(playerid, COLOR_GREY, "Momentan nu sunt contracte.");

	new p = PlayerVar[playerid][HaveContract];
	PlayerVar[playerid][HaveContract] = -1;
	Iter_Add(Calls[8], p);

	PlayerVar[playerid][Find] = -1;
	PlayerTextDrawHide(playerid, FindPTD[0]);
	PlayerTextDrawHide(playerid, FindPTD[1]);
	CP[playerid] = DISABLE_CHECKPOINT;
	DisablePlayerCheckpoint(playerid);

	gString[0] = EOS;
	format(gString, 150, "**(( HA Dispatch: Hitman %s (%d) a renuntat la un contract pentru suma de %d$. ))**", GetName(playerid), playerid, PlayerVar[PlayerVar[playerid][HaveContract]][BodyMoney]);
	SendFactionMessage(10, COLOR_LIGHTBLUE, gString);
	return true;
}

YCMD:service(playerid, params[]) {
	if(HaveCheckpoint(playerid))
		return ShowCancelCP(playerid);

	gString[0] = EOS;
	format(gString, 150, "Type\tOnline\n{%s}Taxi\t%d\n{%s}Paramedic\t%d\n{%s}Instructors\t%d\n", FactionInfo_[4][fColor], Iter_Count(Factions<5>), FactionInfo_[5][fColor], Iter_Count(Factions<6>), FactionInfo_[6][fColor], Iter_Count(Factions<7>));
	ShowPlayerDialog(playerid, DIALOG_SERVICE, DIALOG_STYLE_TABLIST_HEADERS, "Service:", gString, "Select", "Close");
	return true;
}

cmd:blockchat(playerid, params[]) {
	if(PlayerInfo[playerid][pRank] < 6)
		return SCM(playerid, COLOR_GREY, "Ai nevoie de rank +6!");

	new rank;
	if(sscanf(params, "i", rank))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/blockchat [rank]");

	if(rank < 0 || rank > 5) return SCM(playerid, COLOR_GREY, "invalid!");

	FactionInfo_[PlayerInfo[playerid][pMember] - 1][fBlockRank] = rank;
	format(gString, sizeof gString, "%s %s a blocat chat-ul de la rank %d in jos.", PlayerInfo[playerid][pRank]!=6?("Leader"):("Co-Leader"), GetName(playerid), rank);
	SendFactionMessage(PlayerInfo[playerid][pMember], COLOR_LIGHTBLUE, gString);
	return true;
}

YCMD:calls(playerid, params[]) {
	if(!PlayerInfo[playerid][pMember])
		return SCM(playerid, COLOR_GREY, "Nu faci parte dintr-o factiune.");

	if(IsCop(playerid))
		return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta comanda ca politist.");

	if(!Iter_Count(Calls[PlayerInfo[playerid][pMember] - 1]))
		return SCM(playerid, COLOR_GREY, "Nu a apelat nimeni la serviciile tale.");

	gString[0] = EOS;
	new szString[500], Float: Pos[3], x;	
	strcat(szString, "Name\tDistance\n");
	foreach(new i : Calls[PlayerInfo[playerid][pMember] - 1]) {
		GetPlayerPos(i, Pos[0], Pos[1], Pos[2]);
		format(gString, 75, "%s (%d)\t%.0fm\n", GetName(i), i, GetPlayerDistanceFromPoint(playerid, Pos[0], Pos[1], Pos[2]));
		strcat(szString, gString);
		PlayerCalls[playerid][x] = i;
		x++;
	}
	ShowPlayerDialog(playerid, DIALOG_CALLS, DIALOG_STYLE_TABLIST_HEADERS, "Calls:", szString, "Select", "Close");
	return true;
}

function UpdateTaxi(playerid, id) {
	gString[0] = EOS;
	format(gString, 75, "money %s: ~g~$%s~n~~w~fare: ~g~$%s", PlayerInfo[playerid][pMember] != 5 ? ("spent") : ("earned"), FormatNumber(PlayerVar[playerid][TaxiTotal]), FormatNumber(PlayerVar[id][TaxiAmount]));
	PlayerTextDrawSetString(playerid, TaxiPTD, gString);
	PlayerTextDrawShow(playerid, TaxiPTD);
	return true;
}