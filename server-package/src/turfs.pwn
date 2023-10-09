new turfs[MAX_TURFS];
function SQL_LoadTurfs() {
	printf("[MySQL] Loading %d turfs..", cache_num_rows());
	if(!cache_num_rows())
		return true;
	GangZoneCreate(0.0, 0.0, 0.0, 0.0);

	new i=-1; SQL_Turfs = cache_num_rows();
	while(++i<SQL_Turfs) {
		cache_get_value_name_int(i, "ID", TurfInfo[i][tID]);
		cache_get_value_name_float(i, "MinX", TurfInfo[i][tPos][0]);
		cache_get_value_name_float(i, "MinY", TurfInfo[i][tPos][1]);
		cache_get_value_name_float(i, "MaxX", TurfInfo[i][tPos][2]);
		cache_get_value_name_float(i, "MaxY", TurfInfo[i][tPos][3]);
		cache_get_value_name_int(i, "Team", TurfInfo[i][tTeam]);
		turfs[i] = GangZoneCreate(TurfInfo[i][tPos][0], TurfInfo[i][tPos][1], TurfInfo[i][tPos][2], TurfInfo[i][tPos][3]);
	}
	return true;
}

std::GetPlayerTurf(playerid, i=-1) {
	while(++i<SQL_Turfs) 
		if(IsPlayerInArea(playerid, TurfInfo[i][tPos][0], TurfInfo[i][tPos][1], TurfInfo[i][tPos][2], TurfInfo[i][tPos][3]))
			break;

    return i;
}
std::TeamColor(team) {
	new x;
	switch(team) {
		case 3: x = 0x656565AA;
		case 4: x = 0x2ECCFAAA;
		case 8: x = 0xDA65FFAA;
		case 12: x = 0x33C847AA;
		default: x = 0xFFFFFFAA;
	}
	return x;
}

YCMD:turfs(playerid, params[], help) {
	PlayerVar[playerid][TogTurf] = PlayerVar[playerid][TogTurf] ? false : true;
	SCM(playerid, COLOR_WHITE, PlayerVar[playerid][TogTurf] ? ("Ai activat turfurile.") : ("Ai dezactivat turfurile."));
	switch(PlayerVar[playerid][TogTurf]) {
		case false: for(new i = 0; i < SQL_Turfs; i++) GangZoneHideForPlayer(playerid, turfs[i]);
		case true: for(new i = 0; i < SQL_Turfs; i++) {
			GangZoneShowForPlayer(playerid, turfs[i], TeamColor(TurfInfo[i][tTeam]));
			if(WarInfo[i][wTime] != 0) GangZoneFlashForPlayer(playerid, turfs[i], TeamColor(WarInfo[i][wAttacker]));
		}
	}
	return true;
}

YCMD:attack(playerid, params[], help) {
	if(!IsMafiot(playerid))
		return SCM(playerid, COLOR_GREY, "Nu esti in mafie.");

	if(PlayerInfo[playerid][pRank] < 4)
		return SCM(playerid, COLOR_LGREEN, "Ai nevoie de rank 4+");

	if(!IsAdmin(playerid, 7)) {
		if(GetCoolDowns(playerid, 21))
			return CoolDowns(playerid, 21);

		new hour, minute, second;
		gettime(hour, minute, second);

		if(hour < 20 && hour > 22)
			return SCM(playerid, COLOR_GREY, "Start war in (20 - 22 hours).");

		if(Iter_Count(Factions<PlayerInfo[playerid][pMember]>) < 3)
			return SCM(playerid, COLOR_GREY, "Nu poti da war cu mai putin de 3 membri online.");
	}

	new i = GetPlayerTurf(playerid);
	if(i == -1)
		return SCM(playerid, COLOR_GREY, "Nu esti pe teritoriu.");

	if(TurfInfo[i][tTeam] == PlayerInfo[playerid][pMember])
		return SCM(playerid, COLOR_GREY, "Detineti deja acest teritoriu.");

	if(FactionInfo_[TurfInfo[i][tTeam] - 1][fMembers] < 3 && !IsAdmin(playerid, 7))
		return SCM(playerid, COLOR_GREY, "Nu poti ataca acest turf.");

	if(InWar[PlayerInfo[playerid][pMember]] != -1) 
		return SCM(playerid, COLOR_WHITE, "Este deja un war activ.");

	if(InWar[TurfInfo[i][tTeam]] != -1) 
		return SCM(playerid, COLOR_WHITE, "Aceasta mafie are deja un war activ.");
	
	WarInfo[i][wTime] = 900;
	WarInfo[i][wAttacker] = PlayerInfo[playerid][pMember];
	WarInfo[i][wFaction] = TurfInfo[i][tTeam];

	WarInfo[i][wKills] = 0;
	WarInfo[i][wKills] = 0;
	WarInfo[i][wDeath] = 0;
	WarInfo[i][wDeath] = 0;
	WarInfo[i][wBest] = -1;
	WarInfo[i][wBest] = -1;
	WarInfo[i][wWorst] = -1;
	WarInfo[i][wWorst] = -1;

	InWar[TurfInfo[i][tTeam]] = i;
	InWar[PlayerInfo[playerid][pMember]] = i;

	WarInfo[i][wScore][TurfInfo[i][tTeam]] = 0.0;
	WarInfo[i][wScore][PlayerInfo[playerid][pMember]] = 0.0;
	WarInfo[i][wFail][TurfInfo[i][tTeam]] = 0;
	WarInfo[i][wFail][PlayerInfo[playerid][pMember]] = 0;

	SetCoolDowns(playerid, 21, 100);

	ClearString();
	format(gString, 75, "[WAR] %s started a war with %s.", FactionInfo_[WarInfo[i][wAttacker] - 1][fName], FactionInfo_[TurfInfo[i][tTeam] - 1][fName]);
	SendAdminMessage(COLOR_LOGS, gString, 1);
	format(gString, 125, "[TURF] %s from your group attacked turf %d (owned by %s).", GetName(playerid), TurfInfo[i][tID], FactionInfo_[TurfInfo[i][tTeam] - 1][fName]);
	SendFactionMessage(PlayerInfo[playerid][pMember], COLOR_MONEY, gString);
	format(gString, 100, "[TURF] %s (%s) has attacked the turf %d owned by your faction.", FactionInfo_[WarInfo[i][wAttacker]-1][fName], GetName(playerid), i);
	SendFactionMessage(TurfInfo[i][tTeam], COLOR_MONEY, gString);
	Iter_Add(Wars, i);
	foreach(new x : Factions<PlayerInfo[playerid][pMember]>) ShowPlayerWar(x, i);
	foreach(new x : Factions<WarInfo[i][wFaction]>) ShowPlayerWar(x, i);
	SetVehicleVw(PlayerInfo[playerid][pMember], 600 + i);
	SetVehicleVw(TurfInfo[i][tTeam], 600 + i);
	return true;
}

ShowPlayerWar(x, i) {
	format(gString, 30, "Turf: %d", TurfInfo[i][tID]);
	PlayerTextDrawSetString(x, WarPTD[2], gString);
	PlayerTextDrawBoxColor(x, WarPTD[6], TeamColors[WarInfo[i][wFaction]]);
	PlayerTextDrawSetString(x, WarPTD[8], FactionInfo_[WarInfo[i][wFaction] - 1][fName]);
	PlayerTextDrawBoxColor(x, WarPTD[5], TeamColors[WarInfo[i][wAttacker]]);
	PlayerTextDrawSetString(x, WarPTD[7], FactionInfo_[WarInfo[i][wAttacker] - 1][fName]);
	for(new y = 0; y < 3; y++) TextDrawHideForPlayer(x, DataT[y]);
	WarKills[x] = 0;
	WarDeath[x] = 0;
	gString[0] = EOS;
	SetPlayerSkin(x, FactionInfo_[PlayerInfo[x][pMember] - 1][fSkin][PlayerInfo[x][pRank] - 1]);
	PlayerTextDrawSetString(x, WarPTD[3], "0");
	PlayerTextDrawSetString(x, WarPTD[4], "0");
	format(gString, 120, "KIlls: %d     Death: %d~n~K/D: 0.0", WarKills[x], WarDeath[x]);
	PlayerTextDrawSetString(x, WarPTD[10], gString);
	for(new y = 0; y < 12; y++) PlayerTextDrawShow(x, WarPTD[y]);
	GangZoneFlashForPlayer(x, turfs[i], TeamColor(WarInfo[i][wAttacker]));
	SetPlayerVirtualWorld(x, 600 + i);
	foreach(new r : StreamedPlayer[x]) {
		if(InWar[PlayerInfo[x][pMember]] != InWar[PlayerInfo[r][pMember]]) continue;
		SetPlayerMarkerForPlayer(x, i, GetPlayerColor(i));
		SetPlayerMarkerForPlayer(i, x, GetPlayerColor(x));
	}
	SCM(x, COLOR_YELLOW, "Ai fost teleportat intr-un Virtual World unde sunt prezenti doar playerii ce participa la war.");
}
HidePlayerWar(playerid) {
	for(new i=0;i!=5;i++) SendDeathMessageToPlayer(playerid, 1001, 1001, 1001);
	for(new i=0;i<3;i++) TextDrawShowForPlayer(playerid, DataT[i]);
	for(new i=0;i<12;i++) PlayerTextDrawHide(playerid, WarPTD[i]);
	SetPlayerVirtualWorld(playerid, 0);
}

function SetVehicleVw(factionid, vw) {
	foreach(new x : VarVehicle) if(ServerVehicle[x][vFaction] == factionid) SetVehicleVirtualWorld(x, vw);
	return true;
}

function WeaponObject(wid) {
	switch(wid) {
		case 1: return 331; 
		case 2: return 332; 
		case 3: return 333; 
		case 5: return 334; 
		case 6: return 335; 
		case 7: return 336; 
		case 10: return 321; 
		case 11: return 322; 
		case 12: return 323; 
		case 13: return 324; 
		case 14: return 325; 
		case 15: return 326; 
		case 23: return 347; 
		case 24: return 348; 
		case 25: return 349; 
		case 26: return 350; 
		case 27: return 351; 
		case 28: return 352; 
		case 29: return 353; 
		case 30: return 355; 
		case 31: return 356; 
		case 33: return 357; 
		case 4: return 335; 
		case 34: return 358; 
		case 41: return 365; 
		case 42: return 366; 
		case 43: return 367; 
	}
	return false;
}

YCMD:top(playerid, params[]) {
	new faction[4];
	for(new i = 1; i <= SQL_Turfs; i++) {
		switch(TurfInfo[i][tTeam]) {
			case 3: faction[0] ++;
			case 4: faction[1] ++;
			case 8: faction[2] ++;
			case 12: faction[3] ++;
		}
	}
	SCM(playerid, COLOR_WHITE, " --- Top Turfs --- ");
	gString[0] = EOS;
	format(gString, 100, "{%s}%s{FFFFFF} - %d turfs.", FactionInfo_[2][fColor], FactionInfo_[2][fName], faction[0]);
	SCM(playerid, COLOR_WHITE, gString);
	format(gString, 100, "{%s}%s{FFFFFF} - %d turfs.", FactionInfo_[3][fColor], FactionInfo_[3][fName], faction[1]);
	SCM(playerid, COLOR_WHITE, gString);
	format(gString, 100, "{%s}%s{FFFFFF} - %d turfs.", FactionInfo_[7][fColor], FactionInfo_[7][fName], faction[2]);
	SCM(playerid, COLOR_WHITE, gString);
	format(gString, 100, "{%s}%s{FFFFFF} - %d turfs.", FactionInfo_[11][fColor], FactionInfo_[11][fName], faction[3]);
	SCM(playerid, COLOR_WHITE, gString);
	return true;
}

YCMD:wars(playerid, params[], help) {
	if(!Iter_Count(Wars)) 
		return SCM(playerid, COLOR_GREY, "Nu este niciun war!");

	gString[0] = EOS;
	SCM(playerid, COLOR_MONEY, "[WARS]:");
	foreach(new w : Wars) {
		format(gString, 150, "%s [score: %0.1f] - %s [score: %0.1f] on turf %d. Time left: %02d:%02d", FactionInfo_[WarInfo[w][wAttacker] - 1][fName], WarInfo[w][wScore][WarInfo[w][wAttacker]], FactionInfo_[WarInfo[w][wFaction] - 1][fName], WarInfo[w][wScore][WarInfo[w][wFaction]], w, WarInfo[w][wTime]/60, WarInfo[w][wTime] % 60);
		SCM(playerid, -1, gString);
	}	
	return true;
}

function PlayerWar(i, days, mounth, year, hour, minute) {
	gString[0] = EOS;
	new w = InWar[PlayerInfo[i][pMember]], member = PlayerInfo[i][pMember];
    if(GetPlayerVirtualWorld(i) != 600 + w && !GetPlayerInterior(i)) {
    	SCM(i, COLOR_YELLOW, "Ai fost teleportat intr-un Virtual World unde sunt prezenti doar playerii ce participa la war.");
   		SetPlayerVirtualWorld(i, InWar[PlayerInfo[i][pMember]] + 600);
   	}
   	if(IsPlayerInArea(i, TurfInfo[w][tPos][0], TurfInfo[w][tPos][1], TurfInfo[w][tPos][2], TurfInfo[w][tPos][3])) {
   		if(IsPlayerInAnyVehicle(i)) RemovePlayerFromVehicle(i);
   		if(WarInfo[w][wAttacker] == member) WarInfo[w][wAP][member] ++;
		WarInfo[w][wScore][member] += 0.012;
	}
	format(gString, 30, "%02d:%02d", WarInfo[w][wTime]/60, WarInfo[w][wTime] % 60);
	PlayerTextDrawSetString(i, WarPTD[1], gString);
	format(gString, 15, "%.0f", WarInfo[w][wScore][WarInfo[w][wAttacker]]);
	PlayerTextDrawSetString(i, WarPTD[3], gString);
	format(gString, 15, "%.0f", WarInfo[w][wScore][WarInfo[w][wFaction]]);
	PlayerTextDrawSetString(i, WarPTD[4], gString);
   	new kd = WarDeath[i] < 1 ? 0 : WarKills[i]/WarDeath[i];
	format(gString, 75, "KIlls: %d     Death: %d~n~K/D: %.1f~n~%02d.%02d.%02d / %d:%d", WarKills[i], WarDeath[i], kd, days, mounth, year, hour, minute);
	PlayerTextDrawSetString(i, WarPTD[10], gString);
	return true;
}

function WarSystem() {
	foreach(new w : Wars) {
		if(WarInfo[w][wTime] != 0) {
			WarInfo[w][wTime] --;
			if(!WarInfo[w][wAP][WarInfo[w][wAttacker]]) WarInfo[w][wFail][WarInfo[w][wAttacker]] ++;
			else WarInfo[w][wFail][WarInfo[w][wAttacker]] = 0;
			if(WarInfo[w][wTime] == 0 || WarInfo[w][wFail][WarInfo[w][wAttacker]] >= 10) {
				WarInfo[w][wTime] = 0;
				SetVehicleVw(WarInfo[w][wFaction], 0);
				SetVehicleVw(WarInfo[w][wAttacker], 0);
				gQuery[0] = EOS;
				mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `turfs` SET `Team` = '%d' WHERE `ID` = '%d'", !WarInfo[w][wAP][WarInfo[w][wAttacker]] ? WarInfo[w][wFaction] : WarInfo[w][wScore][WarInfo[w][wAttacker]] > WarInfo[w][wScore][WarInfo[w][wFaction]] ? WarInfo[w][wAttacker] : WarInfo[w][wFaction], TurfInfo[w][tID]);
				mysql_tquery(SQL, gQuery);
				foreach(new i : Factions<WarInfo[w][wFaction]>) {
					HidePlayerWar(i);
					if(!WarInfo[w][wAP][WarInfo[w][wAttacker]]) {
						format(gString, 150, "War-ul dintre %s si %s pentru teritoriul %d a luat sfarsit. %s a parasit teritoriul.", FactionInfo_[WarInfo[w][wAttacker] - 1][fName], FactionInfo_[WarInfo[w][wFaction] - 1][fName], w, FactionInfo_[WarInfo[w][wAttacker] - 1][fName]);
						SCM(i, COLOR_LIGHTBLUE, gString);
						if(PlayerVar[i][TogTurf]) {
							GangZoneHideForPlayer(i, turfs[w]);
							GangZoneShowForPlayer(i, turfs[w], TeamColor(WarInfo[w][wFaction]));
						}	
					} else {
						format(gString, 150, "War-ul dintre %s si %s pentru teritoriul %d a luat sfarsit. Se afiseaza tabela cu scoruri...", FactionInfo_[WarInfo[w][wAttacker] - 1][fName], FactionInfo_[WarInfo[w][wFaction] - 1][fName], w);
						SCM(i, COLOR_LIGHTBLUE, gString);
						if(WarInfo[w][wScore][WarInfo[w][wAttacker]] > WarInfo[w][wScore][WarInfo[w][wFaction]]) {
							format(gString, 200, "%s au castigat teritoriul %d. Scor intre mafii: %s %.2f - %.2f %s.", 
							FactionInfo_[WarInfo[w][wAttacker] - 1][fName], w, 
							FactionInfo_[WarInfo[w][wAttacker] - 1][fName], WarInfo[w][wScore][WarInfo[w][wAttacker]], WarInfo[w][wScore][WarInfo[w][wFaction]], FactionInfo_[WarInfo[w][wFaction] - 1][fName]);
						} else {
							format(gString, 200, "%s au castigat teritoriul %d. Scor intre mafi: %s %.2f - %.2f %s.", 
							FactionInfo_[WarInfo[w][wFaction] - 1][fName], w, 
							FactionInfo_[WarInfo[w][wAttacker] - 1][fName], WarInfo[w][wScore][WarInfo[w][wAttacker]], WarInfo[w][wScore][WarInfo[w][wFaction]], FactionInfo_[WarInfo[w][wFaction] - 1][fName]);			
						}
						SCM(i, COLOR_LIGHTBLUE, gString);	
						if(WarInfo[w][wBest] != -1) format(gString, 150, "Cel mai bun jucator: %s (Kills: %d | Deaths: %d)", IsPlayerLogged(WarInfo[w][wBest]) ? GetName(WarInfo[w][wBest]) : ("Null"), WarKills[WarInfo[w][wBest]], WarDeath[WarInfo[w][wBest]]);
						else gString = "Cel mai bun jucator: Null";
						SCM(i, COLOR_LIGHTBLUE, gString);	
						if(WarInfo[w][wBest] != -1) format(gString, 150, "Cel mai slab jucator: %s (Kills: %d | Deaths: %d)", IsPlayerLogged(WarInfo[w][wWorst]) ? GetName(WarInfo[w][wWorst]) : ("Null"), WarKills[WarInfo[w][wWorst]], WarDeath[WarInfo[w][wWorst]]);
						else gString = "Cel mai slab jucator: Null";
						SCM(i, COLOR_LIGHTBLUE, gString);	
						format(gString, 150, "Scorul tau a fost: Kills: %d - Deaths: %d", WarKills[i], WarDeath[i]);
						SCM(i, COLOR_LIGHTBLUE, gString);
						if(PlayerVar[i][TogTurf]) {
							GangZoneHideForPlayer(i, turfs[w]);
							GangZoneShowForPlayer(i, turfs[w], WarInfo[w][wScore][WarInfo[w][wAttacker]] > WarInfo[w][wScore][WarInfo[w][wFaction]] ? TeamColor(WarInfo[w][wAttacker]) : TeamColor(WarInfo[w][wFaction]));
						}	
					}
				}
				foreach(new i : Factions<WarInfo[w][wAttacker]>) {
					HidePlayerWar(i);
					if(!WarInfo[w][wAP][WarInfo[w][wAttacker]]) {
						format(gString, 150, "War-ul dintre %s si %s pentru teritoriul %d a luat sfarsit. %s a parasit teritoriul.", FactionInfo_[WarInfo[w][wAttacker] - 1][fName], FactionInfo_[WarInfo[w][wFaction] - 1][fName], w, FactionInfo_[WarInfo[w][wAttacker] - 1][fName]);
						SCM(i, COLOR_LIGHTBLUE, gString);
						if(PlayerVar[i][TogTurf]) {
							GangZoneHideForPlayer(i, turfs[w]);
							GangZoneShowForPlayer(i, turfs[w], TeamColor(WarInfo[w][wFaction]));
						}
					} else {
						format(gString, 150, "War-ul dintre %s si %s pentru teritoriul %d a luat sfarsit. Se afiseaza tabela cu scoruri...", FactionInfo_[WarInfo[w][wAttacker] - 1][fName], FactionInfo_[WarInfo[w][wFaction] - 1][fName], w);
						SCM(i, COLOR_LIGHTBLUE, gString);
						if(WarInfo[w][wScore][WarInfo[w][wAttacker]] > WarInfo[w][wScore][WarInfo[w][wFaction]]) {
							format(gString, 200, "%s au castigat teritoriul %d. Scor intre mafii: %s %.2f - %.2f %s.", 
							FactionInfo_[WarInfo[w][wAttacker] - 1][fName], w, 
							FactionInfo_[WarInfo[w][wAttacker] - 1][fName], WarInfo[w][wScore][WarInfo[w][wAttacker]], WarInfo[w][wScore][WarInfo[w][wFaction]], FactionInfo_[WarInfo[w][wFaction] - 1][fName]);
						} else {
							format(gString, 200, "%s au castigat teritoriul %d. Scor intre mafi: %s %.2f - %.2f %s.", 
							FactionInfo_[WarInfo[w][wFaction] - 1][fName], w, 
							FactionInfo_[WarInfo[w][wAttacker] - 1][fName], WarInfo[w][wScore][WarInfo[w][wAttacker]], WarInfo[w][wScore][WarInfo[w][wFaction]], FactionInfo_[WarInfo[w][wFaction] - 1][fName]);			
						}
						SCM(i, COLOR_LIGHTBLUE, gString);	
						if(WarInfo[w][wBest] != -1) format(gString, 150, "Cel mai bun jucator: %s (Kills: %d | Deaths: %d)", IsPlayerLogged(WarInfo[w][wBest]) ? GetName(WarInfo[w][wBest]) : ("Null"), WarKills[WarInfo[w][wBest]], WarDeath[WarInfo[w][wBest]]);
						else gString = "Cel mai bun jucator: Null";
						SCM(i, COLOR_LIGHTBLUE, gString);	
						if(WarInfo[w][wBest] != -1) format(gString, 150, "Cel mai slab jucator: %s (Kills: %d | Deaths: %d)", IsPlayerLogged(WarInfo[w][wWorst]) ? GetName(WarInfo[w][wWorst]) : ("Null"), WarKills[WarInfo[w][wWorst]], WarDeath[WarInfo[w][wWorst]]);
						else gString = "Cel mai slab jucator: Null";
						SCM(i, COLOR_LIGHTBLUE, gString);	
						format(gString, 150, "Scorul tau a fost: Kills: %d - Deaths: %d", WarKills[i], WarDeath[i]);
						SCM(i, COLOR_LIGHTBLUE, gString);
						if(PlayerVar[i][TogTurf]) {
							GangZoneHideForPlayer(i, turfs[w]);
							GangZoneShowForPlayer(i, turfs[w], WarInfo[w][wScore][WarInfo[w][wAttacker]] > WarInfo[w][wScore][WarInfo[w][wFaction]] ? TeamColor(WarInfo[w][wAttacker]) : TeamColor(WarInfo[w][wFaction]));
						}
					}
				}
				InWar[WarInfo[w][wFaction]] = -1;
				InWar[WarInfo[w][wAttacker]] = -1;
				TurfInfo[w][tTeam] = !WarInfo[w][wAP][WarInfo[w][wAttacker]] ? WarInfo[w][wFaction] : WarInfo[w][wScore][WarInfo[w][wAttacker]] > WarInfo[w][wScore][WarInfo[w][wFaction]] ? WarInfo[w][wAttacker] : WarInfo[w][wFaction];
				for(new r = 0; r < MAX_PICKUPS; r++) if(PickupInfo[r][pkWar] == w + 1) DestroyDropPickip(r);
				SetTimerEx("RemoveIter", 100, false, "i", w);
				continue;
			}
			WarInfo[w][wAP][WarInfo[w][wAttacker]] = 0;
		}
	}
	return true;
}
function RemoveIter(war) return Iter_Remove(Wars, war);