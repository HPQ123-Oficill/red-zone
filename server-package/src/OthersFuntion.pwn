
enum E_SKIN_TYPE {
	E_SKIN_COMMON[5],
	E_SKIN_PREMIUM[6],
	E_SKIN_LEGENDARY[1],
}

SetPlayerLevelEx(playerid) return SetPlayerScore(playerid, !PlayerVar[playerid][Acover]?PlayerInfo[playerid][pLevel]:PlayerVar[playerid][AcoverLevel]);
CheckMute(playerid) return PlayerInfo[playerid][pMute]!=0?true:false;
IsPlayerLogged(playerid) return PlayerVar[playerid][IsLogged];
HaveCheckpoint(playerid) return CP[playerid]!=DISABLE_CHECKPOINT?true:false;
IsPlayerAFK(playerid) return PlayerVar[playerid][AFKSeconds]>=15?true:false;
ShowCancelCP(playerid) return ShowPlayerDialog(playerid, DIALOG_CANCELCHECKPOINT, DIALOG_STYLE_MSGBOX, "Cancel Checkpoint", "Do you want to cancel your current checkpoint?", "Yes", "No");
SetPlayerCheckpointEx(playerid, cp, Float:x, Float:y, Float:z, Float:size) {
	CP[playerid] = cp; CPOS[playerid][0] = x; CPOS[playerid][1] = y; CPOS[playerid][2] = z;
	SetPlayerCheckpoint(playerid, x, y, z, size);
	return true; }
SetPlayerPet(playerid) {
	attachplayerpet(playerid);
	gString[0] = EOS;
	format(gString, 100, "{50D654}Lvl. {FFFFFF}%d\n{50D687}%s", PlayerInfo[playerid][pPetLevel], PlayerInfo[playerid][pPetName]);
	Pet[playerid] = Create3DTextLabel(gString, -1, 0.0, 0.0, 0.0, 10.0, 0, 0);
	Attach3DTextLabelToPlayer(Pet[playerid], playerid, -0.2, 0.0, 0.1);
	return true; }
attachplayerpet(playerid) {
	switch(PlayerInfo[playerid][pPet]) {
		case 0: SetPlayerAttachedObject(playerid, 1, 19078, 1, 0.3050, -0.0659, -0.1620, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, 1.0000); // parot
		case 1: SetPlayerAttachedObject(playerid, 1, 1609, 1, 0.3330, 0.0240, -0.1380, -7.6999, 97.3000, -11.0999, 0.1210, 0.0810, 0.1349); // taste
		case 2: SetPlayerAttachedObject(playerid, 1, 19833, 1, 0.2569, 0.0260, -0.1419, 168.0999, 92.0000, 18.5000, 0.1930, 0.1359, 0.1349); // cow
		case 3: SetPlayerAttachedObject(playerid, 1, 11733, 1, 0.2689, 0.0000, -0.1259, 0.0000, 88.8000, 178.2001, 0.1599, 0.1190, 0.1250); // pony
		case 4: SetPlayerAttachedObject(playerid, 1, 1608, 1, 0.3330, -0.0489, -0.1519, -3.2999, 89.8999, 10.1000, 0.0549, 0.0370, 0.0670); // shark
		case 5: SetPlayerAttachedObject(playerid, 1, 18248, 1, 0.3650, 0.0649, -0.2280, 160.6997, 90.6999, 0.0000, 0.0130, 0.0089, 0.0089); // special
	}
	return true; }

RemovePlayerPet(playerid) {
	if(IsPlayerAttachedObjectSlotUsed(playerid, 1)) RemovePlayerAttachedObject(playerid, 1);
	if(IsValidDynamic3DTextLabel(Pet[playerid])) Delete3DTextLabel(Pet[playerid]);
	return true; }
public OnPlayerEditAttachedObject(playerid, response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ, Float:fScaleX, Float:fScaleY, Float:fScaleZ) 
    return printf("SetPlayerAttachedObject(%d, %d, %d, %d, %.4f, %.4f, %.4f, %.4f, %.4f, %.4f, %.4f, %.4f, %.4f)", playerid, index, modelid, boneid, fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ, fScaleX, fScaleY, fScaleZ);

stock ShowInfo(playerid, const title[], const text[], linie) {
	for(new i=0;i<20;i++) SCM(playerid, -1, " ");
	TextDrawShowForPlayer(playerid, InfoxTD[0]);
	TextDrawShowForPlayer(playerid, InfoxTD[1]);

	InfoxPTD[playerid][0] = CreatePlayerTextDraw(playerid, 318.000000, 190.437500, title);
	PlayerTextDrawLetterSize(playerid, InfoxPTD[playerid][0], 0.706999, 2.531872);
	PlayerTextDrawAlignment(playerid, InfoxPTD[playerid][0], 2);
	PlayerTextDrawColor(playerid, InfoxPTD[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, InfoxPTD[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, InfoxPTD[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, InfoxPTD[playerid][0], 255);
	PlayerTextDrawFont(playerid, InfoxPTD[playerid][0], 3);
	PlayerTextDrawSetProportional(playerid, InfoxPTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, InfoxPTD[playerid][0], 0);
	PlayerTextDrawShow(playerid, InfoxPTD[playerid][0]);

	InfoxPTD[playerid][1] = CreatePlayerTextDraw(playerid, 318.600738, 218.437500, text);
	PlayerTextDrawLetterSize(playerid, InfoxPTD[playerid][1], 0.211999, 1.048749);
	PlayerTextDrawAlignment(playerid, InfoxPTD[playerid][1], 2);
	PlayerTextDrawColor(playerid, InfoxPTD[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, InfoxPTD[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, InfoxPTD[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, InfoxPTD[playerid][1], 255);
	PlayerTextDrawFont(playerid, InfoxPTD[playerid][1], 2);
	PlayerTextDrawSetProportional(playerid, InfoxPTD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, InfoxPTD[playerid][1], 0);
	PlayerTextDrawShow(playerid, InfoxPTD[playerid][1]);

	InfoxPTD[playerid][2] = CreatePlayerTextDraw(playerid, 112.399536, 217.500000 + (linie * 10.00000), "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, InfoxPTD[playerid][2], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, InfoxPTD[playerid][2], 420.000000, 0.460000);
	PlayerTextDrawAlignment(playerid, InfoxPTD[playerid][2], 1);
	PlayerTextDrawColor(playerid, InfoxPTD[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, InfoxPTD[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, InfoxPTD[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, InfoxPTD[playerid][2], 255);
	PlayerTextDrawFont(playerid, InfoxPTD[playerid][2], 4);
	PlayerTextDrawSetProportional(playerid, InfoxPTD[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, InfoxPTD[playerid][2], 0);
	PlayerTextDrawShow(playerid, InfoxPTD[playerid][2]);
	return true;
}

stock HideInfo(playerid) {
	TextDrawHideForPlayer(playerid, InfoxTD[0]);
	TextDrawHideForPlayer(playerid, InfoxTD[1]);
	for(new i=0;i<3;i++) PlayerTextDrawDestroy(playerid, InfoxPTD[playerid][i]);
	return true;
}

ShowChat(playerid, const seconds, const string[]) {
	PlayerTextDrawSetString(playerid, ChatPTD, string);
	PlayerTextDrawShow(playerid, ChatPTD);
	PlayerVar[playerid][ChatHide] = gettime()+seconds;
	return true; }
SetPlayerRaceCheckpointEx(playerid, cp, type, Float:x, Float:y, Float:z, Float:nextx, Float:nexty, Float:nextz, Float:size) {
	CP[playerid] = cp; CPOS[playerid][0] = x; CPOS[playerid][1] = y; CPOS[playerid][2] = z;
	SetPlayerRaceCheckpoint(playerid, type, x, y, z, nextx, nexty, nextz, size);
	return true; }
stock IsMail(const string[],len=-1) {
    if((len=strlen(string))<15) return false;
    if(string[len-4]!='.'||string[len-10]!='@') return false;
    return true;
}

stock randomString(const max, empty=5, const empty_char = ' ', i=0, const chars[] = {"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"}) {
    new _ret[64]; ++empty;
    while(++i<max+1+(empty/max)) _ret[i-1]=i%empty?chars[random(36)]:empty_char;
    return _ret;
}

ShowPlayerInfo(playerid, type) {
	gString[0] = EOS;
	switch(type) {
		case 0: {
			new x = RandomEx(30, 70);
			PlayerInfo[playerid][pServerPoints] += x;
			checkBP(playerid, 14, 300, x);
			UpdateVar(playerid, "ServerPoints", PlayerInfo[playerid][pServerPoints]);
			format(gString, 100, "You passed the level up~n~You received %d Red points", x);
		}
		case 1: gString = "You did job skill up";
	}
	PlayerPlaySound(playerid, 1131, 0.0, 0.0, 0.0);
	TextDrawShowForPlayer(playerid, InfoBoxTD);
	TextDrawShowForPlayer(playerid, InfoTD);
	PlayerTextDrawSetString(playerid, InfoPTD, gString);
	PlayerTextDrawShow(playerid, InfoPTD);
	PlayerVar[playerid][HideTD] = gettime() + 10;
	return true; }
ShowPlayerInfoEx(playerid, const seconds, const string[]) {
	PlayerPlaySound(playerid, 1131, 0.0, 0.0, 0.0);
	TextDrawShowForPlayer(playerid, InfoBoxTD);
	TextDrawShowForPlayer(playerid, InfoTD);
	PlayerTextDrawSetString(playerid, InfoPTD, string);
	PlayerTextDrawShow(playerid, InfoPTD);
	PlayerVar[playerid][HideTD] = gettime() + seconds;
	return true; }
GiveExperience(playerid, experience) {
	PlayerInfo[playerid][pExperience] += experience;
	gString[0] = EOS;
	format(gString, 50, "~b~~h~+%d EXP", experience);
	GameTextForPlayer(playerid, gString, 5000, 1);
	new pvargive[2], bool:levelup;
	while(PlayerInfo[playerid][pExperience] >= MAX_PLAYER_EXPERIENCE*PlayerInfo[playerid][pLevel]) {
		PlayerInfo[playerid][pExperience] -= MAX_PLAYER_EXPERIENCE*PlayerInfo[playerid][pLevel];
		PlayerInfo[playerid][pLevel] ++;
		pvargive[0] += PlayerInfo[playerid][pLevel] * 5000;
		pvargive[1] += PlayerInfo[playerid][pLevel] * 2;	
		levelup=true;
	}
	if(levelup) {
		foreach(new i : Player) {
			if(PlayerInfo[playerid][pSQLID] != PlayerInfo[i][pReferral])
				continue;

			GivePlayerCash(i, pvargive[0]);
			GiveExperience(i, pvargive[1]);
		}
		mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `users` SET `Money` = `Money` + '%d', `Experience`= `Experience` + '%d', `Level` = '%d' WHERE `Referral` = '%d'", pvargive[0], pvargive[1], PlayerInfo[playerid][pLevel], PlayerInfo[playerid][pSQLID]);
		mysql_tquery(SQL, gQuery);
		SetPlayerLevelEx(playerid);
		ShowPlayerInfo(playerid, 0);
	}
	format(gString, 25, "~b~~h~%d", PlayerInfo[playerid][pLevel]);
	PlayerTextDrawSetString(playerid, ExpTD[0], gString);
	format(gString, 25, "~b~~h~%d", PlayerInfo[playerid][pLevel] + 1);
	PlayerTextDrawSetString(playerid, ExpTD[1], gString);
	format(gString, 50, "~b~~h~%d/%d", PlayerInfo[playerid][pExperience], PlayerInfo[playerid][pLevel] * MAX_PLAYER_EXPERIENCE);
	PlayerTextDrawSetString(playerid, ExpTD[2], gString);
	for(new i = 0; i < 3; i++) PlayerTextDrawShow(playerid, ExpTD[i]);
	SetPlayerProgressBarMaxValue(playerid, PlayerVar[playerid][HudProgress][2], MAX_PLAYER_EXPERIENCE*PlayerInfo[playerid][pLevel]);
	SetPlayerProgressBarValue(playerid, PlayerVar[playerid][HudProgress][2], PlayerInfo[playerid][pExperience]);
	ShowPlayerProgressBar(playerid, PlayerVar[playerid][HudProgress][2]);
	PlayerVar[playerid][ExpTime] = gettime()+7;
	return true; }
PlayerLoginQueue(playerid) {
	if(player_selected[playerid] == 15 || IsPlayerLogged(playerid)) return true;
	gString[0] = EOS;
	new x = Iter_Count(LoginQueue[1]);
	format(gString, 100, "%d players in queue (eta: %02d sec)~n~your position: %d", x, (x - (PlayerInLoginQueue)) + 4, (x - (PlayerInLoginQueue + 1)));
	PlayerTextDrawSetString(playerid, InfoxPTD[playerid][1], gString);
	PlayerInLoginQueue++;
	return true;
}
std::totalPlayerSkin(playerid, p=-1) {
	while(++p<MAX_PLAYER_SKIN) if(PlayerInfo[playerid][pSkin][p]==-1) continue;
	return p;
}
std::GivePlayerSkin(playerid, skin, p=-1) {
	while(++p<MAX_PLAYER_SKIN) if(PlayerInfo[playerid][pSkin][p] == -1) break;
	PlayerInfo[playerid][pSkin][p] = skin;
	save_skins(playerid);
	return p;
}
CancelExam(playerid) {
	DestroyVehicle(PlayerVar[playerid][ExamCar]);
	PlayerVar[playerid][IsExam] = false;
	PlayerVar[playerid][ExamCar] = INVALID_VEHICLE_ID;
	DisablePlayerRaceCheckpoint(playerid);
	DestroyDynamicObject(examobj[playerid]);
	CPEx[playerid] = -1;
	return true; }
ChangeRainbowColors(playerid) {
 	rID[playerid] = rID[playerid] >= sizeof RainBowColor - 1 ? 0 : rID[playerid] + 1;
	ChangeVehicleColor(VehicleRainbow[playerid], RainBowColor[rID[playerid]], RainBowColor[rID[playerid]]);
    return true; }
IsVehicleOccupied(vehicleid) return Iter_Count(PlayerInVehicle[vehicleid]);
stock CalculateTime(seconds) {
	gString[0] = EOS;
	format(gString, 13, "%02d:%02d", (seconds / 60), seconds % 60);
	return gString; }
ShowMute(playerid) {
	ClearString();
	format(gString, 65, "You can't talk right now! You are muted. (%d seconds)",PlayerInfo[playerid][pMute]);
	SCM(playerid, COLOR_GREY, gString);
	return true; }

EarsMessage(color, const string[]) {
	if(Iter_Count(Bigears) != 0) foreach(new x : Bigears) SCM(x, color, string);
	return true; }
ProxDetector(Float:radi, playerid, const string[], col) {
	new Float: pOs[3];
	GetPlayerPos(playerid, pOs[0], pOs[1], pOs[2]);
	foreach(new i : StreamedPlayer[playerid]) {
		if(!PlayerToPoint(i, radi, pOs[0], pOs[1], pOs[2]) || GetPlayerInterior(playerid) != GetPlayerInterior(i) || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(i) || Iter_Contains(Bigears, i) || player_selected[i] == 12) continue;
		SCM(i, col, string);
		if(Iter_Count(Spectacting[i])) foreach(new x : Spectacting[i]) SCM(x, col, string); 
	}
	if(Iter_Count(Bigears) != 0) foreach(new i : Bigears) SCM(i, col, string);
	return true; }
ProxDetectorEx(Float:radi, playerid, const string[], col) {
	new Float: pOs[3];
	foreach(new i : StreamedPlayer[playerid]) {
		if(i == playerid) continue;
		GetPlayerPos(i, pOs[0], pOs[1], pOs[2]);
		if(!PlayerToPoint(playerid, radi, pOs[0], pOs[1], pOs[2]) || (GetPlayerInterior(playerid) != GetPlayerInterior(i) || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(i)) || Iter_Contains(Bigears, i)) continue;
		SCM(i, col, string); }
	if(Iter_Count(Bigears) != 0) foreach(new i : Bigears) SCM(i, col, string);
	return true; }
CreateVehicleEx(model, Float:x, Float:y, Float:z, Float:rotation, color1, color2, respawn_delay, addsiren = 0) {
	new vheid = CreateVehicle(model, x, y, z, rotation, color1, color2, respawn_delay, addsiren);
	CarRadio[vheid] = 0;
	Engine[vheid] = false;
	VehicleInfo[vheid][vColor][0] = color1;
	VehicleInfo[vheid][vColor][1] = color2;
	VehiclePos[vheid][0] = x;
	VehiclePos[vheid][1] = y;
	VehiclePos[vheid][2] = z;
	VehiclePos[vheid][3] = rotation;
	Engine[vheid] = false;
	JobCar[vheid] = 0;
	Iter_Add(VarVehicle, vheid);
	if(IsABike(vheid)) {
		new engine, lights, alarm, doors, bonnet, boot, objective;
		GetVehicleParamsEx(vheid, engine, lights, alarm, doors, bonnet, boot, objective);
		SetVehicleParamsEx(vheid, VEHICLE_PARAMS_ON, lights, alarm, doors, bonnet, boot, objective); }
	return vheid; }
DestroyVehicleEx(vehicleid) {
	DestroyVehicle(vehicleid);
	if(Iter_Count(VehicleKeys[vehicleid])) { foreach(new v : VehicleKeys[vehicleid]) Iter_Remove(PlayerKeys[v], vehicleid); }
	Iter_Clear(VehicleKeys[vehicleid]);
	VehicleAcces[vehicleid] = -1;
	Iter_Remove(VarVehicle, vehicleid);
	return true; }
DestroyVehicleExx(vehicleid) {
	DestroyVehicle(vehicleid);
	if(Iter_Count(VehicleKeys[vehicleid])) { foreach(new v : VehicleKeys[vehicleid]) Iter_Remove(PlayerKeys[v], vehicleid); }
	Iter_Clear(VehicleKeys[vehicleid]);
	VehicleAcces[vehicleid] = -1;
	return true; }
RespawnVehicles(playerid, Float: range) {
	new Float: PosX, Float: PosY, Float: PosZ;
	foreach(new vehid : VarVehicle) {
		GetVehiclePos(vehid, PosX, PosY, PosZ);
		if(!PlayerToPoint(playerid, range, PosX,PosY,PosZ) || IsVehicleOccupied(vehid)) continue;
		if(Iter_Contains(VehicleSpawned, vehid)) {
			DestroyVehicleExx(vehid);
			Iter_Remove(VehicleSpawned, vehid);
			Iter_SafeRemove(VarVehicle, vehid, vehid);
			continue;
		}
		SetVehicleToRespawn(vehid); 
	}
	return true; }
IsSeatTaken(vehicleid, seatid) { 
	new bool: x = false;
 	foreach(new i : PlayerInVehicle[vehicleid]) if(GetPlayerVehicleSeat(i) == seatid) return x = true;
    return x; }
AccountMYSQL(const name[]) {
	new x = -2;
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "SELECT * FROM `users` WHERE `name`='%s'", name);
	new Cache: result = mysql_query(SQL, gQuery);
	if(cache_num_rows()) cache_get_value_name_int(0, "Status", x);
	cache_delete(result);
	return x; }
GetPlayerSQLID(sqlid) {
	new x = INVALID_PLAYER_ID;
	foreach(new i : Player) {
		if(!IsPlayerLogged(i) || PlayerInfo[i][pSQLID] != sqlid) continue;

		x = i;
		break; }
	return x; }
RobCamera(playerid) {
	if(!PlayerVar[playerid][IsBizz]) return true;
	switch(BizzInfo[PlayerVar[playerid][IsBizz]][bType]) {
		case 1: SetPlayerCameraPos(playerid, 2317.445556, -17.412902, 29.580722), SetPlayerCameraLookAt(playerid, 2313.408935, -15.134330, 27.706119);
		case 2: SetPlayerCameraPos(playerid, 302.769073, -77.290969, 1004.663085), SetPlayerCameraLookAt(playerid, 298.737792, -79.438232, 1002.628906);
		case 3: SetPlayerCameraPos(playerid, 494.799468, -14.921510, 1004.378173), SetPlayerCameraLookAt(playerid, 497.894989, -18.217782, 1002.244567);
		case 4: SetPlayerCameraPos(playerid, -99.315307, -18.494756, 1003.653747), SetPlayerCameraLookAt(playerid, -102.451820, -21.685426, 1001.421752);
		case 5: SetPlayerCameraPos(playerid, -16.979795, -181.813674, 1005.781799), SetPlayerCameraLookAt(playerid, -21.376651, -183.531478, 1004.133544);
		case 6: SetPlayerCameraPos(playerid, 209.158050, -168.483291, 1003.631042), SetPlayerCameraLookAt(playerid, 206.707275, -164.526885, 1001.803344);
		case 7: SetPlayerCameraPos(playerid, 364.926513, -75.232650, 1004.308715), SetPlayerCameraLookAt(playerid, 368.966003, -72.723327, 1002.764099);
		case 12: SetPlayerCameraPos(playerid, 375.212768, -193.759841, 1003.812988), SetPlayerCameraLookAt(playerid, 378.114410, -190.450164, 1001.440979);
		case 15: SetPlayerCameraPos(playerid, 505.534851, -70.882064, 1001.294311), SetPlayerCameraLookAt(playerid, 501.736511, -73.682052, 999.641235);
	}
	return true;
}

GiveVehicleKey(playerid, vehicleid) { Iter_Add(VehicleKeys[vehicleid], playerid); Iter_Add(PlayerKeys[playerid], vehicleid); }
//RemoveVehicleKey(playerid, vehicleid) { Iter_Remove(VehicleKeys[vehicleid], playerid); Iter_Remove(PlayerKeys[playerid], vehicleid); }
EnterFunction(playerid) {
	if(PlayerVar[playerid][IsPickup] == 0 || PlayerInfo[playerid][pJail] != 0) return false;
	new i = PlayerVar[playerid][IsPickup], x = PickupInfo[i][pkID];
	switch(PickupInfo[i][pkType]) {
		case 1: {
			if(!PlayerToPoint(playerid, 2, HouseInfo[x][hEnterPos][0], HouseInfo[x][hEnterPos][1], HouseInfo[x][hEnterPos][2])) return false;
			if(enterDeelay[playerid]>gettime()) return SCMf(playerid, COLOR_GREY, "[ANTI SPAM] Asteapta %d secunde pentru a intra iar in interior.", enterDeelay[playerid]-gettime());
			if(PlayerInfo[playerid][pTut] < 4) return SCM(playerid, COLOR_GREY, "Nu poti intra intr-o casa. Esti in tutorial!");
			if(GetPlayerVirtualWorld(playerid) != 0) return SCM(playerid, COLOR_LGREEN, "You are in another virtual world");
			if(HouseInfo[x][hStatus] && PlayerInfo[playerid][pHouse] != HouseInfo[x][hID] && !PlayerVar[playerid][Duty]) return GameTextForPlayer(playerid, "~r~Locked", 3000, 1);
			if(InWar[PlayerInfo[playerid][pMember]] != -1) return SCM(playerid, COLOR_GREY, "Nu poti intra intr-o casa in timpul warului.");
			GameTextForPlayer(playerid, "~w~welcome house", 3000, 1);
			if(HouseInfo[x][hRadio] != 0) PlayAudioStreamForPlayer(playerid, RadioLink[HouseInfo[x][hRadio]]);
			SetPlayerPos(playerid, HouseInfo[x][hExitPos][0], HouseInfo[x][hExitPos][1], HouseInfo[x][hExitPos][2]);
			SetPlayerVirtualWorld(playerid, HouseInfo[x][hVirtualWorld]);
			SetPlayerInterior(playerid, HouseInfo[x][hInterior]);	
			PlayerVar[playerid][IsHouses] = x;
		}
		case 2: {
			if(!PlayerToPoint(playerid, 2, BizzInfo[x][bEnterPos][0], BizzInfo[x][bEnterPos][1], BizzInfo[x][bEnterPos][2]) || BizzInfo[x][bStatic]) return false;
			if(enterDeelay[playerid]>gettime()) {
				gString[0] = EOS;
				format(gString, sizeof gString, "[ANTI SPAM] Asteapta %d secunde pentru a intra iar in interior.", enterDeelay[playerid]-gettime());
				SCM(playerid, COLOR_GREY, gString);
				return true;
			}			
			if(GetPlayerVirtualWorld(playerid) != 0 && PlayerInfo[playerid][pTut] > 4) return SCM(playerid, COLOR_LGREEN, "You are in another virtual world");
			if(BizzInfo[x][bStatus] != false && PlayerInfo[playerid][pBussines] != BizzInfo[x][bID] && !PlayerVar[playerid][Duty]) return GameTextForPlayer(playerid, "~r~Locked", 3000, 1);
			if(InWar[PlayerInfo[playerid][pMember]] != -1) return SCM(playerid, COLOR_GREY, "Nu poti intra intr-un biz in timpul warului.");		
			SetPlayerPos(playerid, BizzInfo[x][bExitPos][0], BizzInfo[x][bExitPos][1], BizzInfo[x][bExitPos][2]);
			SetPlayerVirtualWorld(playerid, PlayerInfo[playerid][pTut] < 4 ? playerid + 10 : BizzInfo[x][bVirtualWorld]);
			SetPlayerInterior(playerid, BizzInfo[x][bInterior]);	
			GivePlayerCash(playerid, -BizzInfo[x][bFee]);
			BizzInfo[x][bBalance] += BizzInfo[x][bFee];
			PlayerVar[playerid][IsBizz] = x;
			switch(BizzInfo[x][bType]) {
				case 1: SCM(playerid, COLOR_WHITE, "Use the commands: /withdraw, /deposit, /transfer, /balance.");
				case 4: SCM(playerid, COLOR_WHITE, "Use the commands: /buydildo.");
				case 5: {
					if(!PlayerVar[playerid][Fish][0]) return true;
					GiveJobMoney(playerid, PlayerVar[playerid][Fish][0]+PlayerVar[playerid][Fish][1], !PlayerVar[playerid][Fish][1] ? 1 : 2, 5, 10);
					CheckPlayerMission(playerid, 0, PlayerVar[playerid][Fish][1] != 0 ? 2 : 1);
					PlayerVar[playerid][Fish][0] = 0;
					PlayerVar[playerid][Fish][1] = 0;
				}
				case 7: if(PlayerInfo[playerid][pFaina] != 0) GiveJobMoney(playerid, PlayerInfo[playerid][pFaina]*35, 1, 10, 25), PlayerInfo[playerid][pFaina] = 0;
				case 8: SCM(playerid, COLOR_WHITE, "Use the commands: /dice.");
			}
		}
		case 3: {
			if(!PlayerToPoint(playerid, 2, FactionInfo_[x][fEnterPos][0], FactionInfo_[x][fEnterPos][1], FactionInfo_[x][fEnterPos][2])) return false;
			if(enterDeelay[playerid]>gettime()) {
				gString[0] = EOS;
				format(gString, sizeof gString, "[ANTI SPAM] Asteapta %d secunde pentru a intra iar in interior.", enterDeelay[playerid]-gettime());
				SCM(playerid, COLOR_GREY, gString);
				return true;
			}
			if(PlayerInfo[playerid][pTut] < 4) return SCM(playerid, COLOR_GREY, "Nu poti intra intr-o factiune. Esti in tutorial!");
			if(FactionInfo_[x][fStatus] && PlayerInfo[playerid][pMember] != FactionInfo_[x][fID]) return true;
			SetPlayerPos(playerid, FactionInfo_[x][fExitPos][0], FactionInfo_[x][fExitPos][1], FactionInfo_[x][fExitPos][2]);
			SetPlayerVirtualWorld(playerid, FactionInfo_[x][fVirtualWorld]);
			SetPlayerInterior(playerid, FactionInfo_[x][fInterior]);
			PlayerVar[playerid][IsFaction] = x;
		}
		case 4: {
			new Float:fx,Float:y,Float:z;
			switch(HouseInfo[x][hIntID]) {
				case 1: fx=228.9369,y=1287.2971,z=1082.1406;
				case 2: fx=2286.2483,y=-1137.5818,z=1050.8984;
				case 6: fx=2319.3848,y=-1212.6729,z=1049.0234;
				case 7: fx=2231.7786,y=-1112.2190,z=1050.8828;
				case 8: fx=2263.1267,y=-1132.8730,z=1050.6328;
				case 9: fx=2215.8894,y=-1074.6974,z=1050.4844;
				case 10: fx=269.8523,y=303.6155,z=999.1484;
				case 14: fx=31.3422,y=1345.5013,z=1088.8751;
				case 15: fx=-296.4693,y=1474.6884,z=1088.8750;
				case 16: fx=-268.2626,y=1458.2830,z=1084.3672;
				case 18: fx=2316.2048,y=-1010.9176,z=1054.7188;
				case 19: fx=2492.4807,y=-1708.5692,z=1018.3368;
				case 20: fx=2194.8643,y=-1210.6716,z=1049.0234;
				case 22: fx=2262.7874,y=-1216.7019,z=1049.0234;
				case 24: fx=380.6627,y=1472.8921,z=1080.1875;
				case 25: fx=2363.7668,y=-1127.5186,z=1050.8826;
				case 26: fx=2235.8843,y=-1073.9803,z=1049.0234;
				case 28: fx=220.2875,y=1148.7970,z=1082.609;
				case 30: fx=2459.4749,y=-1699.1110,z=1013.5078;
				case 31: fx=134.6403,y=1379.9502,z=1088.3672;
				default: return true;
			}
			if(GetPlayerDistanceFromPoint(playerid, fx,y,z) > 2.0) return false;
			SetPlayerPos(playerid, 254.1862,-41.5057,1002.0308);
			SetPlayerInterior(playerid, 14);
		}
	}
	PlayerVar[playerid][IsPickup] = false;
	return true; }

std::IsPlayerInArea(playerid, Float:mx,Float:my,Float:mx2,Float:my2,Float:x=0.0,Float:y=0.0,Float:z=0.0) 
	return (GetPlayerPos(playerid,x,y,z)&&x>mx&&x<mx2&&y>my&&y<my2);

ExitFunction(playerid) {
	if(PlayerVar[playerid][IsFaction] == -1 && PlayerVar[playerid][IsBizz] == 0 && PlayerVar[playerid][IsHouses] == 0 || PlayerInfo[playerid][pJail] != 0) return false;
	new i;
	if(PlayerVar[playerid][IsFaction] != -1) {
		i = PlayerVar[playerid][IsFaction];
		if(!PlayerToPoint(playerid, 2, FactionInfo_[i][fExitPos][0], FactionInfo_[i][fExitPos][1], FactionInfo_[i][fExitPos][2])) return false;
		
		SetPlayerPos(playerid, FactionInfo_[i][fEnterPos][0], FactionInfo_[i][fEnterPos][1], FactionInfo_[i][fEnterPos][2]);
		SetPlayerVirtualWorld(playerid, 0);
		SetPlayerInterior(playerid, 0);
		PlayerVar[playerid][IsFaction] = -1;
		enterDeelay[playerid] = gettime()+10;
		return true; }
	if(PlayerVar[playerid][IsBizz] != 0) {
		i = PlayerVar[playerid][IsBizz];
		if(!PlayerToPoint(playerid, 2, BizzInfo[i][bExitPos][0], BizzInfo[i][bExitPos][1], BizzInfo[i][bExitPos][2])) return false;

		SetPlayerPos(playerid, BizzInfo[i][bEnterPos][0], BizzInfo[i][bEnterPos][1], BizzInfo[i][bEnterPos][2]);
		SetPlayerVirtualWorld(playerid, PlayerInfo[playerid][pTut] < 4 ? playerid + 10 : 0);
		SetPlayerInterior(playerid, 0);	
		PlayerVar[playerid][IsBizz] = 0;	
		enterDeelay[playerid] = gettime()+10;
		HaveTicket[playerid] = false;
		return true; }
	if(PlayerVar[playerid][IsHouses] != 0) {
		i = PlayerVar[playerid][IsHouses];
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 254.1862,-41.5057,1002.0308)) {
			switch(HouseInfo[i][hIntID]) {
				case 1: SetPlayerPos(playerid, 228.9369,1287.2971,1082.1406);
				case 2: SetPlayerPos(playerid, 2286.2483,-1137.5818,1050.8984);
				case 6: SetPlayerPos(playerid, 2319.3848,-1212.6729,1049.0234);
				case 7: SetPlayerPos(playerid, 2231.7786,-1112.2190,1050.8828);
				case 8: SetPlayerPos(playerid, 2263.1267,-1132.8730,1050.6328);
				case 9: SetPlayerPos(playerid, 2215.8894,-1074.6974,1050.4844);
				case 10: SetPlayerPos(playerid, 269.8523,303.6155,999.1484);
				case 14: SetPlayerPos(playerid, 31.3422,1345.5013,1088.8750);
				case 15: SetPlayerPos(playerid, -296.4693,1474.6884,1088.8750);
				case 16: SetPlayerPos(playerid, -268.2626,1458.2830,1084.3672);
				case 18: SetPlayerPos(playerid, 2316.2048,-1010.9176,1054.718);
				case 19: SetPlayerPos(playerid, 2492.4807,-1708.5692,1018.336);
				case 20: SetPlayerPos(playerid, 2194.8643,-1210.6716,1049.023);
				case 22: SetPlayerPos(playerid, 2262.7874,-1216.7019,1049.023);
				case 24: SetPlayerPos(playerid, 380.6627,1472.8921,1080.1875);
				case 25: SetPlayerPos(playerid, 2363.7668,-1127.5186,1050.882);
				case 26: SetPlayerPos(playerid, 2235.8843,-1073.9803,1049.023);
				case 28: SetPlayerPos(playerid, 220.2875,1148.7970,1082.6094);
				case 30: SetPlayerPos(playerid, 2459.4749,-1699.1110,1013.507);
				case 31: SetPlayerPos(playerid, 134.6403,1379.9502,1088.3672);
			}
			SetPlayerInterior(playerid, HouseInfo[i][hInterior]);
			return true;
		} 
		if(!PlayerToPoint(playerid, 2, HouseInfo[i][hExitPos][0], HouseInfo[i][hExitPos][1], HouseInfo[i][hExitPos][2])) return false;
		StopAudioStreamForPlayer(playerid);
		SetPlayerPos(playerid, HouseInfo[i][hEnterPos][0], HouseInfo[i][hEnterPos][1], HouseInfo[i][hEnterPos][2]);
		SetPlayerVirtualWorld(playerid, 0);
		SetPlayerInterior(playerid, 0);	
		PlayerVar[playerid][IsHouses] = 0;
		enterDeelay[playerid] = gettime()+10;
		return true; }
	return true; }
SetPlayerClanTag(playerid) {
	new x = GetClan[PlayerInfo[playerid][pClan]];
	switch(PlayerInfo[playerid][pClanTag]) {
		case 0: format(gString, 50, "%s%s", ClanInfo[x][clTag], PlayerInfo[playerid][pName]),_query(256,"update `users` set `name_and_tag` = '%s%s' where `id` = '%i'", ClanInfo[x][clTag], PlayerInfo[playerid][pName],PlayerInfo[playerid][pSQLID]);
		case 1: format(gString, 50, "%s%s", PlayerInfo[playerid][pName], ClanInfo[x][clTag]),_query(256,"update `users` set `name_and_tag` = '%s%s' where `id` = '%i'", PlayerInfo[playerid][pName], ClanInfo[x][clTag],PlayerInfo[playerid][pSQLID]);
		default: format(gString, MAX_PLAYER_NAME, "%s", PlayerInfo[playerid][pName]),_query(256,"update `users` set `name_and_tag` = '%s' where `id` = '%i'", PlayerInfo[playerid][pName],PlayerInfo[playerid][pSQLID]);
	}	
	SetPlayerName(playerid, gString);
	return true; }

static const City[4][8] = {{"Unknown"}, {"LS"}, {"LV"}, {"SF"}};
#define GetCity(%0) City[PlayerCity[%0]]
#define GetCity1(%0) PlayerCity[%0]

AttachTrailer(playerid) {
	new Float:vX, Float:vY, Float:vZ;
	GetVehiclePos(PlayerVar[playerid][Trailer],vX,vY,vZ);
	if((PlayerToPoint(playerid, 30, vX,vY,vZ))&&(PlayerVar[playerid][Trailer]!=GetPlayerVehicleID(playerid)))  AttachTrailerToVehicle(PlayerVar[playerid][Trailer], GetPlayerVehicleID(playerid));
	return true; }
UpdatePlayerFind(playerid) {
	if(!IsPlayerLogged(PlayerVar[playerid][Find])) {
		PlayerVar[playerid][Find] = -1;
		PlayerTextDrawHide(playerid, FindPTD[0]);
		PlayerTextDrawHide(playerid, FindPTD[1]);
		CP[playerid] = DISABLE_CHECKPOINT;
		DisablePlayerCheckpoint(playerid);
		SCM(playerid, COLOR_GREY, "Target has desconnected.");
		return true; }
	new Float: x, Float: y, Float: z, id = PlayerVar[playerid][Find];
	if(PlayerVar[id][MySpec]) x=-1357.8832,y=-14.2912,z=13.8892;
	else if(PlayerVar[id][IsHouses] != 0 && PlayerVar[playerid][IsHouses] == 0) x = HouseInfo[PlayerVar[id][IsHouses]][hEnterPos][0], y = HouseInfo[PlayerVar[id][IsHouses]][hEnterPos][1], z = HouseInfo[PlayerVar[id][IsHouses]][hEnterPos][2];
	else if(PlayerVar[id][IsBizz] != 0 && PlayerVar[playerid][IsBizz] == 0) x = BizzInfo[PlayerVar[id][IsBizz]][bEnterPos][0], y = BizzInfo[PlayerVar[id][IsBizz]][bEnterPos][1], z = BizzInfo[PlayerVar[id][IsBizz]][bEnterPos][2];
	else if(PlayerVar[id][IsFaction] != -1 && PlayerVar[playerid][IsFaction] == -1) x = FactionInfo_[PlayerVar[id][IsFaction]][fEnterPos][0], y = FactionInfo_[PlayerVar[id][IsFaction]][fEnterPos][1], z = FactionInfo_[PlayerVar[id][IsFaction]][fEnterPos][2];
	else GetPlayerPos(id, x, y, z);
	SetPlayerCheckpointEx(playerid, CP_FIND_PLAYER, x, y, z, 3.0);
	gString[0] = EOS;
	format(gString, 160, "~r~~h~~h~~h~%s [%d]~n~~w~~h~Distance: ~y~~h~%.1fm~n~~b~~h~(%s)%s", GetName(id), id, GetPlayerDistanceFromPoint(playerid, x, y, z), GetCity(id), PlayerInfo[playerid][pMember] == 10 && PlayerVar[playerid][HaveContract] != -1 ? !PlayerVar[playerid][Undercover] ? ("~n~~b~~h~~h~~h~Undercover off!") : ("~n~~b~~h~~h~~h~Undercover on") : (""));
	PlayerTextDrawSetString(playerid, FindPTD[1], gString);
	return true; }
IsDeveloper(playerid) return bool:(PlayerInfo[playerid][pSQLID]==NAME_DEVELOPER||PlayerInfo[playerid][pSQLID]==NAME_FOUNDER||PlayerInfo[playerid][pSQLID]==NAME_FOUNDER2);
IsDeveloperOff(const name[]) return bool:(strcmp(name, "HPQ123", true) == 0 || !strcmp(name, "RaduAdv", true));
CrimInRange(Float:radi, playerid,copid) {
	new Float:posx, Float:posy, Float:posz, Float:oldposx, Float:oldposy, Float:oldposz, Float:tempposx, Float:tempposy;
	GetPlayerPos(playerid, oldposx, oldposy, oldposz), GetPlayerPos(copid, posx, posy, posz);
	tempposx = (oldposx -posx),tempposy = (oldposy -posy);
	if(((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi))) return true;
	return false; }
SetVehicleDoor(vehicleid, bool: doorsex) {
	new engine, lights, alarm, doors, bonnet, boot, objective;
	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	SetVehicleParamsEx(vehicleid, engine, lights, alarm, doorsex, bonnet, boot, objective);
	return true; }
FDespawnVehicle(playerid) {
	if(PlayerVar[playerid][FactionObject][0] != -1) DestroyDynamicObject(PlayerVar[playerid][FactionObject][0]);
	if(PlayerVar[playerid][FactionObject][1] != -1) DestroyDynamicObject(PlayerVar[playerid][FactionObject][1]);
	ServerVehicle[PlayerVar[playerid][FactionVehicle]][vFaction] = 0;
	PlayerVar[playerid][TimerCheckSpawns] = 0;
	AddFactionStock(playerid, GetVehicleModel(PlayerVar[playerid][FactionVehicle]));
	DestroyVehicle(PlayerVar[playerid][FactionVehicle]);
	PlayerVar[playerid][FactionVehicle] = INVALID_VEHICLE_ID;
	return true; }
ResetVariable(playerid) {	
	ac_ouvu_vid[playerid]=INVALID_VEHICLE_ID;  					ac_ouvu_tick[playerid]=0;									ac_ouvu_wng[playerid] = 0;
	PlayerVar[playerid][fSpec] = 0;								PlayerVar[playerid][LastCall] = -1;
	SetPlayerDrunkLevel(playerid, 0);							PlayerVar[playerid][DRL] = 0;								lastcommand[playerid] = GetTickCount();
	PlayerVar[playerid][Radio] = 0;								HaveTicket[playerid] = false;
	PlayerVar[playerid][Speeding] = false;						PlayerVar[playerid][ADuty] = false;							PlayerVar[playerid][TimerCheckSpawns] = 0;
	PlayerVar[playerid][HideTD] = false;						PlayerVar[playerid][IsFaction] = -1;
	listitemm[playerid] = -1;									PlayerVar[playerid][IsPhone] = -1;							PlayerVar[playerid][Find] = -1;
	PlayerVar[playerid][BussinesID] = false;					PlayerVar[playerid][AdTime] = -1;					
	PlayerVar[playerid][AdText] = EOS;							PlayerVar[playerid][IsBizz] = 0;						
	PlayerVar[playerid][InviteDice] = -1;						PlayerVar[playerid][Refill] = false;						EditObjectID[playerid] = INVALID_EDIT;
	PlayerRainbow[playerid] = false;							VehicleRainbow[playerid] = -1;								pnsType[playerid] = -1;
	PlayerInfo[playerid][pRaportTime] = -1;						timeDMG[playerid] = 0;
	LastVehicle[playerid] = false;								PlayerVar[playerid][HouseID] = false;						InitFly(playerid);
	PlayerInfo[playerid][pPhone] = 0;							PlayerInfo[playerid][pPassword][0] = EOS;					PlayerInfo[playerid][pAdmin] = false;
	CP[playerid] = DISABLE_CHECKPOINT;							PlayerVar[playerid][Fish][0] = 0;						PlayerVar[playerid][FishTimer] = false;
	PlayerVar[playerid][JobVehicle] = INVALID_VEHICLE_ID;		gunOferID[playerid] = -1;
	PlayerVar[playerid][JobTimeLeft] = false;					PlayerVar[playerid][JobWork] = false;						PlayerVar[playerid][IsExam] = false;
	PlayerVar[playerid][ExamCar] = INVALID_VEHICLE_ID;			PlayerStoned[playerid] = 0;
	PlayerVar[playerid][IsPickup] = false;						PlayerVar[playerid][Duty] = false;							PlayerVar[playerid][RaportTime] = 0;
	PlayerVar[playerid][InvitePlayer] = INVALID_PLAYER_ID;		PlayerVar[playerid][PlayerWanted] = INVALID_PLAYER_ID;		repass[playerid][0] = EOS;
	PlayerVar[playerid][FactionVehicle] = INVALID_VEHICLE_ID;	PlayerVar[playerid][Death] = false;					
	PlayerVar[playerid][WARNING] = false;						PlayerVar[playerid][Sleeping] = false;						PlayerVar[playerid][Fish][1] = 0;
	PlayerVar[playerid][MySpec] = -1;							PlayerVar[playerid][HaveHelp] = -1;
	PlayerVar[playerid][MyHelp] = -1;							PlayerVar[playerid][CrateSelect] = -1;					
	PlayerVar[playerid][CrateTime] = 0;							PlayerVar[playerid][IsSkins] = false;						PlayerVar[playerid][NextPage] = 0;
	PlayerVar[playerid][IsSafezone] = false;					PlayerVar[playerid][Freeze] = false;						EditObjectIDe[playerid] = -1;
	PlayerVar[playerid][MoneyReacvheid] = 0;					PlayerVar[playerid][IsCell] = false;						PlayerVar[playerid][IsLession] = -1;
	PlayerVar[playerid][Reply] = -1;							PlayerVar[playerid][Acover] = false;						PlayerVar[playerid][TC] = 0;
	PlayerVar[playerid][OferLicense] = -1;						PlayerVar[playerid][OferLession] = -1;						
	PlayerVar[playerid][FreeOfer] = -1;							PlayerVar[playerid][FreePrice] = 0;							PlayerVar[playerid][PinLogged] = false;						PlayerVar[playerid][LeftJob] = 0;
	PlayerInfo[playerid][pFaina] = 0;							PlayerVar[playerid][ChatHide] = -1;							PlayerVar[playerid][Trash] = 0;
	PlayerVar[playerid][HaveTrash] = false;						PlayerVar[playerid][Trailer] = 0;							PlayerVar[playerid][preparespawn] = false;
	PlayerVar[playerid][TogTurf] = false;						PlayerInfo[playerid][pEmail][0] = EOS;						TimeTut[playerid]=0;
	PlayerVar[playerid][IsStoreGun] = -1;						PlayerVar[playerid][PinConst][0] = (EOS);					CallType[playerid] = -1;
	PlayerVar[playerid][TradeInvite] = -1;						PlayerVar[playerid][IsTrade] = -1;							RobBackpack[playerid] = false;				
	PlayerVar[playerid][TaxiAmount] = 0;						PlayerVar[playerid][TaxiTotal] = 0;							MatsOffer[playerid] = -1;
	LastCar[playerid] = 0;										PlayerVar[playerid][IsTaxi] = -1;							PlayerVar[playerid][HaveCalls] = -1;
	for(new i = 0; i < 1; i++) CallServiceAccept[playerid][i] = -1, CallService[playerid][i] = false;						PlayerVar[playerid][HaveContract] = -1;
	PlayerVar[playerid][BodyMoney] = 0;							PlayerVar[playerid][Undercover] = false;					MDCOn[playerid] = -1;
	PlayerVar[playerid][Cuff] = false;							PlayerVar[playerid][TicketOffer] = -1;						PlayerVar[playerid][TicketMoney] = 0;
	for(new i = 0; i < 5; i++) gunset[playerid][i] = false;		PlayerVar[playerid][TaxiDuty] = false;						PlayerVar[playerid][ExpTime] = gettime() - 1;
	PaintType[playerid] = 0; 									Voted[playerid] = false;									GiftStep[playerid] = -1;								
	for(new i = 0; i < MAX_TRADE_ACTIONS; i++) TradeObject[playerid][i] = -1;												HideFriendConnect[playerid] = gettime();	
	RobStatus[playerid] = false;								RobTimer[playerid] = 0;										RobActor[playerid] = 0;							
	RobVehicle[playerid] = INVALID_VEHICLE_ID;					LastSpeed[playerid] = 0;									RC[playerid] = 0;
	Helmet[playerid] = false;									Tazer[playerid] = false;
	airplane[playerid] = -1;									PlayerVar[playerid][ServerTimer][0] = 0;					PlayerVar[playerid][ServerTimer][1] = 0;
	UsedFly[playerid] = false;									shotTime[playerid] = 0; 
	JobTime[playerid] = 0;										HideJob[playerid] = -1;										InviteClan[playerid] = -1;
	shot[playerid] = 0;											LiveOffer[playerid] = -1;									NewLive[playerid] = -1;	
	PunctRaport[playerid] = 0;									Question[playerid] = false;									drugCP[playerid] = 0;
	player_selected[playerid] = 0;								DrugOffer[playerid] = -1;
	LastAction[playerid] = gettime();							ActionWarning[playerid] = 0;								
	LastClick[playerid] = -1;		 			
	for(new i=0;i<3;i++) Mark[playerid][i] = 0.0;				PlayerVar[playerid][AFKSeconds] = 0;						p_VendingUseTimer[playerid] = -1;
	MarkVw[playerid] = 0; 										MarkInt[playerid] = 0;										posible_Action[playerid] = INVALID_ACTION;
	PlayerAreaID[playerid] = -1;								CPEx[playerid] = -1;										enterDeelay[playerid] = gettime();								PlayerCity[playerid] = 0;
	PNStage[playerid] = false;									PlayerInfo[playerid][pReferral] = 0;						MoneyAd[playerid] = 0;
	MoneyTy[playerid] = false;									PizzaCP[playerid] = -1;
	for(new i=0;i<4;i++) PizzaHouse[playerid][i] = 0, PizzaObject[playerid][i] = -1;
	PlayerPizza[playerid] = false;
	return true; }

stock LoadTrade(playerid) {
    TradePTD[playerid][0] = CreatePlayerTextDraw(playerid, 225.666641, 116.992660, "Bunurile tale");
    PlayerTextDrawLetterSize(playerid, TradePTD[playerid][0], 0.176999, 1.077332);
    PlayerTextDrawAlignment(playerid, TradePTD[playerid][0], 2);
    PlayerTextDrawColor(playerid, TradePTD[playerid][0], -166);
    PlayerTextDrawSetShadow(playerid, TradePTD[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, TradePTD[playerid][0], 0);
    PlayerTextDrawBackgroundColor(playerid, TradePTD[playerid][0], -231);
    PlayerTextDrawFont(playerid, TradePTD[playerid][0], 2);
    PlayerTextDrawSetProportional(playerid, TradePTD[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, TradePTD[playerid][0], 0);

    TradePTD[playerid][1] = CreatePlayerTextDraw(playerid, 418.333099, 116.992668, "Bunurile lui Red");
    PlayerTextDrawLetterSize(playerid, TradePTD[playerid][1], 0.176999, 1.077332);
    PlayerTextDrawAlignment(playerid, TradePTD[playerid][1], 2);
    PlayerTextDrawColor(playerid, TradePTD[playerid][1], -166);
    PlayerTextDrawSetShadow(playerid, TradePTD[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, TradePTD[playerid][1], 0);
    PlayerTextDrawBackgroundColor(playerid, TradePTD[playerid][1], -231);
    PlayerTextDrawFont(playerid, TradePTD[playerid][1], 2);
    PlayerTextDrawSetProportional(playerid, TradePTD[playerid][1], 1);
    PlayerTextDrawSetShadow(playerid, TradePTD[playerid][1], 0);

    TradePTD[playerid][2] = CreatePlayerTextDraw(playerid, 188.666763, 355.511138, "Adauga");
    PlayerTextDrawLetterSize(playerid, TradePTD[playerid][2], 0.246665, 1.122962);
    PlayerTextDrawTextSize(playerid, TradePTD[playerid][2], 10.000000, 35.000000);
    PlayerTextDrawAlignment(playerid, TradePTD[playerid][2], 2);
    PlayerTextDrawColor(playerid, TradePTD[playerid][2], -65281);
    PlayerTextDrawBoxColor(playerid, TradePTD[playerid][2], 255);
    PlayerTextDrawSetShadow(playerid, TradePTD[playerid][2], 0);
    PlayerTextDrawSetOutline(playerid, TradePTD[playerid][2], 1);
    PlayerTextDrawBackgroundColor(playerid, TradePTD[playerid][2], 47);
    PlayerTextDrawFont(playerid, TradePTD[playerid][2], 1);
    PlayerTextDrawSetProportional(playerid, TradePTD[playerid][2], 1);
    PlayerTextDrawSetShadow(playerid, TradePTD[playerid][2], 0);
    PlayerTextDrawSetSelectable(playerid, TradePTD[playerid][2], true);
    PlayerTextID[playerid][PlayerText:TradePTD[playerid][2]] = 14;

    TradePTD[playerid][3] = CreatePlayerTextDraw(playerid, 262.999816, 355.511138, "Sterge");
    PlayerTextDrawLetterSize(playerid, TradePTD[playerid][3], 0.246665, 1.122962);
    PlayerTextDrawTextSize(playerid, TradePTD[playerid][3], 10.000000, 28.000000);
    PlayerTextDrawAlignment(playerid, TradePTD[playerid][3], 2);
    PlayerTextDrawColor(playerid, TradePTD[playerid][3], -16776961);
    PlayerTextDrawBoxColor(playerid, TradePTD[playerid][3], 255);
    PlayerTextDrawSetShadow(playerid, TradePTD[playerid][3], 0);
    PlayerTextDrawSetOutline(playerid, TradePTD[playerid][3], 1);
    PlayerTextDrawBackgroundColor(playerid, TradePTD[playerid][3], 47);
    PlayerTextDrawFont(playerid, TradePTD[playerid][3], 1);
    PlayerTextDrawSetProportional(playerid, TradePTD[playerid][3], 1);
    PlayerTextDrawSetShadow(playerid, TradePTD[playerid][3], 0);
    PlayerTextDrawSetSelectable(playerid, TradePTD[playerid][3], true);
    PlayerTextID[playerid][PlayerText:TradePTD[playerid][3]] = 13;
    
    TradePTD[playerid][4] = CreatePlayerTextDraw(playerid, 199.666656, 139.392700, "nepregatitt");
    PlayerTextDrawLetterSize(playerid, TradePTD[playerid][4], 0.246665, 1.122962);
    PlayerTextDrawTextSize(playerid, TradePTD[playerid][4], 253.000000, 10.000000);
    PlayerTextDrawAlignment(playerid, TradePTD[playerid][4], 1);
    PlayerTextDrawColor(playerid, TradePTD[playerid][4], -1);
    PlayerTextDrawBoxColor(playerid, TradePTD[playerid][4], 255);
    PlayerTextDrawSetShadow(playerid, TradePTD[playerid][4], 0);
    PlayerTextDrawSetOutline(playerid, TradePTD[playerid][4], 1);
    PlayerTextDrawBackgroundColor(playerid, TradePTD[playerid][4], 47);
    PlayerTextDrawFont(playerid, TradePTD[playerid][4], 3);
    PlayerTextDrawSetProportional(playerid, TradePTD[playerid][4], 1);
    PlayerTextDrawSetShadow(playerid, TradePTD[playerid][4], 0);
    PlayerTextDrawSetSelectable(playerid, TradePTD[playerid][4], true);
    PlayerTextID[playerid][PlayerText:TradePTD[playerid][4]] = 11;

    TradePTD[playerid][5] = CreatePlayerTextDraw(playerid, 390.333312, 139.807510, "nepregatitt");
    PlayerTextDrawLetterSize(playerid, TradePTD[playerid][5], 0.246665, 1.122962);
    PlayerTextDrawTextSize(playerid, TradePTD[playerid][5], 447.000000, 10.000000);
    PlayerTextDrawAlignment(playerid, TradePTD[playerid][5], 1);
    PlayerTextDrawColor(playerid, TradePTD[playerid][5], -1);
    PlayerTextDrawBoxColor(playerid, TradePTD[playerid][5], 255);
    PlayerTextDrawSetShadow(playerid, TradePTD[playerid][5], 0);
    PlayerTextDrawSetOutline(playerid, TradePTD[playerid][5], 1);
    PlayerTextDrawBackgroundColor(playerid, TradePTD[playerid][5], 47);
    PlayerTextDrawFont(playerid, TradePTD[playerid][5], 3);
    PlayerTextDrawSetProportional(playerid, TradePTD[playerid][5], 1);
    PlayerTextDrawSetShadow(playerid, TradePTD[playerid][5], 0);
    PlayerTextDrawSetSelectable(playerid, TradePTD[playerid][5], true);
    PlayerTextID[playerid][PlayerText:TradePTD[playerid][5]] = 12;

    TradePTD[playerid][6] = CreatePlayerTextDraw(playerid, 305.333404, 114.918479, "01:00");
    PlayerTextDrawLetterSize(playerid, TradePTD[playerid][6], 0.298999, 1.405037);
    PlayerTextDrawAlignment(playerid, TradePTD[playerid][6], 1);
    PlayerTextDrawColor(playerid, TradePTD[playerid][6], -65281);
    PlayerTextDrawSetShadow(playerid, TradePTD[playerid][6], 1);
    PlayerTextDrawSetOutline(playerid, TradePTD[playerid][6], 0);
    PlayerTextDrawBackgroundColor(playerid, TradePTD[playerid][6], -234);
    PlayerTextDrawFont(playerid, TradePTD[playerid][6], 2);
    PlayerTextDrawSetProportional(playerid, TradePTD[playerid][6], 1);
    PlayerTextDrawSetShadow(playerid, TradePTD[playerid][6], 1);  
    
    for(new i=0;i<10;i++) {
        TradeTitle[playerid][i] = CreatePlayerTextDraw(playerid, (i<5?182.333343:369.000030), 171.333297 + ((i%5)*33.600000), "title");
        PlayerTextDrawLetterSize(playerid, TradeTitle[playerid][i], 0.225666, 0.965332);
        PlayerTextDrawAlignment(playerid, TradeTitle[playerid][i], 1);
        PlayerTextDrawColor(playerid, TradeTitle[playerid][i], -1);
        PlayerTextDrawSetShadow(playerid, TradeTitle[playerid][i], 0);
        PlayerTextDrawSetOutline(playerid, TradeTitle[playerid][i], 1);
        PlayerTextDrawBackgroundColor(playerid, TradeTitle[playerid][i], 54);
        PlayerTextDrawFont(playerid, TradeTitle[playerid][i], 1);
        PlayerTextDrawSetProportional(playerid, TradeTitle[playerid][i], 1);
        PlayerTextDrawSetShadow(playerid, TradeTitle[playerid][i], 0);

        TradeIcon[playerid][i] = CreatePlayerTextDraw(playerid, (i<5?141.333419:331.666748), 164.955612 + ((i%5) * 33.600000), "");
        PlayerTextDrawLetterSize(playerid, TradeIcon[playerid][i], 0.000000, 0.000000);
        PlayerTextDrawTextSize(playerid, TradeIcon[playerid][i], 29.000000, 31.000000);
        PlayerTextDrawAlignment(playerid, TradeIcon[playerid][i], 1);
        PlayerTextDrawColor(playerid, TradeIcon[playerid][i], -1);
        PlayerTextDrawSetShadow(playerid, TradeIcon[playerid][i], 0);
        PlayerTextDrawSetOutline(playerid, TradeIcon[playerid][i], 0);
        PlayerTextDrawBackgroundColor(playerid, TradeIcon[playerid][i], -235);
        PlayerTextDrawFont(playerid, TradeIcon[playerid][i], 5);
        PlayerTextDrawSetProportional(playerid, TradeIcon[playerid][i], 0);
        PlayerTextDrawSetShadow(playerid, TradeIcon[playerid][i], 0);
        PlayerTextDrawSetPreviewModel(playerid, TradeIcon[playerid][i], 19523);
        PlayerTextDrawSetPreviewRot(playerid, TradeIcon[playerid][i], 0.000000, 0.000000, 348.000000, 0.849843);
    }
    return true;
}
ShowTradeTDs(playerid) {
	LoadTrade(playerid);
	PlayerTextDrawSetString(playerid, TradePTD[playerid][4], "~r~nepregatit");
	PlayerTextDrawSetString(playerid, TradePTD[playerid][5], "~r~nepregatit");
	for(new i=0;i<6;i++) PlayerTextDrawShow(playerid, TradePTD[playerid][i]);
	for(new i=0;i<11;i++) TextDrawShowForPlayer(playerid, TradeTD[i]);
	SelectTextDraw(playerid, 0x00BFFFFF);
	return true; }

std::GetDistanceBetweenPlayers(p1,p2,Float:x=0.0,Float:y=0.0,Float:z=0.0,Float:x2=0.0,Float:y2=0.0,Float:z2=0.0)
	return (GetPlayerPos(p1,x,y,z)&&GetPlayerPos(p2,x2,y2,z2))?floatround(VectorSize(x-x2,y-y2,z-z2)):-1;

DisablePlayerFind(playerid) {
	DisablePlayerCheckpoint(playerid); PlayerVar[playerid][Find] = -1;
	PlayerTextDrawHide(playerid, FindPTD[0]); PlayerTextDrawHide(playerid, FindPTD[1]);
	return true; }
SetPlayerWanted(playerid, level) {
	PlayerInfo[playerid][pWanted] = level;
	UpdateVar(playerid, "Wanted", level);
	SetPlayerWantedLevel(playerid, level);
	PlayerInfo[playerid][pWantedReason] = 600;
	if(level) Iter_Add(Calls[9], playerid);
	else Iter_Remove(Calls[9], playerid);
	if(level > 0) {
		PlayerTextDrawShow(playerid, WantedPTD), Iter_Add(Calls[0], playerid);
		foreach(new i : Factions<1>) if(PlayerVar[i][Duty]) OnPlayerStreamIn(i, playerid);
		foreach(new i : Factions<2>) if(PlayerVar[i][Duty]) OnPlayerStreamIn(i, playerid);
		foreach(new i : Factions<7>) if(PlayerVar[i][Duty]) OnPlayerStreamIn(i, playerid);
	}
	else {
		PlayerTextDrawHide(playerid, WantedPTD); 
		if(Iter_Contains(Calls[0], playerid)) Iter_Remove(Calls[0], playerid);
		foreach(new i : Factions<1>) if(PlayerVar[i][Duty]) OnPlayerStreamOut(i, playerid);
		foreach(new i : Factions<2>) if(PlayerVar[i][Duty]) OnPlayerStreamOut(i, playerid);
		foreach(new i : Factions<7>) if(PlayerVar[i][Duty]) OnPlayerStreamOut(i, playerid);
	}
	return true; }
HideTradeTDs(playerid) {
	for(new i = 0; i < 7; i++) PlayerTextDrawDestroy(playerid, TradePTD[playerid][i]);
	for(new i = 0; i < sizeof(TradeTD); i++) TextDrawHideForPlayer(playerid, TradeTD[i]);
	PlayerVar[playerid][IsTrade] = -1;
	TradeTime[playerid] = 0;
	return true; }

GiftSystem(playerid) {
	GiftStep[playerid] ++;
	new amount, rand = random(150);
	if((Iter_Count(Licitatie[0]) && rand >= 91 && rand <= 95) || (Iter_Count(Licitatie[1]) && rand >= 96 && rand <= 100)) rand = 120;
	if(GiftStep[playerid] <= 15) {
		switch(rand) {
			case 0..40: {
				amount = RandomEx(5000, 15000);
				format(gString, 50, "~g~~h~$%s~n~~w~~h~step: ~r~%d/15", FormatNumber(amount), GiftStep[playerid]);
				PlayerTextDrawSetString(playerid, GiftPTD[1], gString);
				PlayerTextDrawSetPreviewModel(playerid, GiftPTD[0], 1274);
				PlayerTextDrawShow(playerid, GiftPTD[0]);
				if(GiftStep[playerid] == 15) {
					GivePlayerCash(playerid, amount);
					PlayerInfo[playerid][pGiftPoints] -= 200;
					UpdateVar(playerid, "GiftPoints", PlayerInfo[playerid][pGiftPoints]);
					format(gString, 100, "(GiftBox) {FFFFFF}Ai primit $%s.", FormatNumber(amount));
					SCM(playerid, COLOR_MONEY, gString);
				}	
			}
			case 41..60: {
				format(gString, 50, "2 Rob Points~n~~w~~h~step: ~r~%d/15", GiftStep[playerid]);
				PlayerTextDrawSetString(playerid, GiftPTD[1], gString);
				PlayerTextDrawSetPreviewModel(playerid, GiftPTD[0], 1313);
				PlayerTextDrawShow(playerid, GiftPTD[0]);
				if(GiftStep[playerid] == 15) {
					if(PlayerInfo[playerid][pRobExp] > 60)
						return SCM(playerid, COLOR_LGREEN, "Eroare: Ai deja 60 rob points.");

					PlayerInfo[playerid][pRobExp]+=2;
					UpdateVar(playerid, "RobExp", PlayerInfo[playerid][pRobExp]);
					PlayerInfo[playerid][pGiftPoints] -= 200;
					UpdateVar(playerid, "GiftPoints", PlayerInfo[playerid][pGiftPoints]);
					SCM(playerid, COLOR_MONEY, "(GiftBox) {FFFFFF}Ai primit 2 rob points.");
				}
			}
			case 61..75: {
				amount = RandomEx(50, 100);
				format(gString, 50, "~p~~h~%d Experience~n~~w~~h~step: ~r~%d/15", amount, GiftStep[playerid]);
				PlayerTextDrawSetString(playerid, GiftPTD[1], gString);
				PlayerTextDrawSetPreviewModel(playerid, GiftPTD[0], 1314);
				PlayerTextDrawShow(playerid, GiftPTD[0]);
				if(GiftStep[playerid] == 15) {
					GiveExperience(playerid, amount);
					PlayerInfo[playerid][pGiftPoints] -= 200;
					UpdateVar(playerid, "GiftPoints", PlayerInfo[playerid][pGiftPoints]);
					format(gString, 100, "(GiftBox) {FFFFFF}Ai primit %d experenta.", amount);
					SCM(playerid, COLOR_MONEY, gString);
				}
			}
			case 76..80: {
				format(gString, 50, "Clear 1 warn~n~~w~~h~step: ~r~%d/15", GiftStep[playerid]);
				PlayerTextDrawSetString(playerid, GiftPTD[1], gString);
				PlayerTextDrawSetPreviewModel(playerid, GiftPTD[0], 1313);
				PlayerTextDrawShow(playerid, GiftPTD[0]);
				if(GiftStep[playerid] == 15) {
					if(PlayerInfo[playerid][pWarn] <= 0)
						return SCM(playerid, COLOR_LGREEN, "Ai primit gift points inapoi pentru ca nu ai warnings!");

					PlayerInfo[playerid][pWarn]--;
					UpdateVar(playerid, "Warn", PlayerInfo[playerid][pWarn]);
					PlayerInfo[playerid][pGiftPoints] -= 200;
					UpdateVar(playerid, "GiftPoints", PlayerInfo[playerid][pGiftPoints]);
					SCM(playerid, COLOR_MONEY, "(GiftBox) {FFFFFF}Ai primit 1 clear warn.");
				}
			}
			case 81..84: {
				format(gString, 50, "Clear FP~n~~w~~h~step: ~r~%d/15", GiftStep[playerid]);
				PlayerTextDrawSetString(playerid, GiftPTD[1], gString);
				PlayerTextDrawSetPreviewModel(playerid, GiftPTD[0], 2034);
				PlayerTextDrawShow(playerid, GiftPTD[0]);
				if(GiftStep[playerid] == 15) {
					if(PlayerInfo[playerid][pFP] <= 0)
						return SCM(playerid, COLOR_LGREEN, "Ai primit gift points inapoi pentru ca nu ai faction punish!");

					PlayerInfo[playerid][pFP]=0;
					UpdateVar(playerid, "FP", PlayerInfo[playerid][pFP]);
					PlayerInfo[playerid][pGiftPoints] -= 200;
					UpdateVar(playerid, "GiftPoints", PlayerInfo[playerid][pGiftPoints]);
					SCM(playerid, COLOR_MONEY, "(GiftBox) {FFFFFF}Ai primit Clear FP.");
				}
			}
			case 85..87: {
				format(gString, 50, "~b~Perrenial~n~~w~~h~step: ~r~%d/15", GiftStep[playerid]);
				PlayerTextDrawSetString(playerid, GiftPTD[1], gString);
				PlayerTextDrawSetPreviewModel(playerid, GiftPTD[0], 404);
				PlayerTextDrawShow(playerid, GiftPTD[0]);
				if(GiftStep[playerid] == 15) {
					if(GetPlayerTotalVehicle(playerid) >= GetPlayerSlot(playerid))
						return SCM(playerid, COLOR_LGREEN, "Ai primit gift points inapoi pentru ca nu ai un slot liber!");

					GiveVehicle(playerid, 404, true);
					PlayerInfo[playerid][pGiftPoints] -= 200;
					UpdateVar(playerid, "GiftPoints", PlayerInfo[playerid][pGiftPoints]);
					SCM(playerid, COLOR_MONEY, "(GiftBox) {FFFFFF}Ai primit Perrenial.");
				}
			}
			case 88: {
				format(gString, 50, "~b~Sultan~n~~w~~h~step: ~r~%d/15", GiftStep[playerid]);
				PlayerTextDrawSetString(playerid, GiftPTD[1], gString);
				PlayerTextDrawSetPreviewModel(playerid, GiftPTD[0], 560);
				PlayerTextDrawShow(playerid, GiftPTD[0]);
				if(GiftStep[playerid] == 15) {
					if(GetPlayerTotalVehicle(playerid) >= GetPlayerSlot(playerid))
						return SCM(playerid, COLOR_LGREEN, "Ai primit gift points inapoi pentru ca nu ai un slot liber!");

					GiveVehicle(playerid, 560, true);
					PlayerInfo[playerid][pGiftPoints] -= 200;
					UpdateVar(playerid, "GiftPoints", PlayerInfo[playerid][pGiftPoints]);
					SCM(playerid, COLOR_MONEY, "(GiftBox) {FFFFFF}Ai primit Sultan.");
				}
			}
			case 89..92: {
				amount = RandomEx(2, 5);
				format(gString, 75, "~y~%d Premium Points~n~~w~~h~step: ~r~%d/15", amount, GiftStep[playerid]);
				PlayerTextDrawSetString(playerid, GiftPTD[1], gString);
				PlayerTextDrawSetPreviewModel(playerid, GiftPTD[0], 1247);
				PlayerTextDrawShow(playerid, GiftPTD[0]);
				if(GiftStep[playerid] == 15) {
					PlayerInfo[playerid][pPremiumPoints] += amount;
					UpdateVar(playerid, "PremiumPoints", PlayerInfo[playerid][pPremiumPoints]);
					PlayerInfo[playerid][pGiftPoints] -= 200;
					UpdateVar(playerid, "GiftPoints", PlayerInfo[playerid][pGiftPoints]);
					format(gString, 100, "(GiftBox) {FFFFFF}Ai primit %d puncte premium.", amount); 
					SCM(playerid, COLOR_MONEY, gString);
				}
			}
			default: {
				amount = RandomEx(50, 100);
				format(gString, 75, "~b~%d Red points ~n~~w~~h~step: ~r~%d/15", amount, GiftStep[playerid]);
				PlayerTextDrawSetString(playerid, GiftPTD[1], gString);
				PlayerTextDrawSetPreviewModel(playerid, GiftPTD[0], 19131);
				PlayerTextDrawShow(playerid, GiftPTD[0]);
				if(GiftStep[playerid] == 15) {
					PlayerInfo[playerid][pServerPoints] += amount;
					UpdateVar(playerid, "ServerPoints", PlayerInfo[playerid][pServerPoints]);
					checkBP(playerid, 14, 300, amount);
					PlayerInfo[playerid][pGiftPoints] -= 200;
					UpdateVar(playerid, "GiftPoints", PlayerInfo[playerid][pGiftPoints]);
					SCMf(playerid, COLOR_MONEY, "(GiftBox) {FFFFFF}Ai primit %d Red points!", amount);
				}
			}
		}
	} else if(GiftStep[playerid] > 19) {
		PlayerTextDrawHide(playerid, GiftPTD[0]); PlayerTextDrawHide(playerid, GiftPTD[1]);
		TextDrawHideForPlayer(playerid, GiftTD[0]); TextDrawHideForPlayer(playerid, GiftTD[1]);
		GiftStep[playerid] = -1;
		TogglePlayerControllable(playerid, true);
	}
	return true; }
FinishTrade(playerid) {
	new id = PlayerVar[playerid][IsTrade], szString[256], items[128], log[300]; gString[0] = EOS;
	SCM(playerid, COLOR_LIGHTGOLD, "Afacerea a fost finalizata cu succes!");
	SCM(id, COLOR_LIGHTGOLD, "Afacerea a fost finalizata cu succes!");
	strcat(szString, "Ai primit: ");
	player_selected[playerid] = 0;
	player_selected[id] = 0;
	if(TradeObject[playerid][0] != -1) {
		format(gString, 30, " $%s", FormatNumber(TradeObject[playerid][0]));
		strcat(szString, gString);
		format(gString, 75, " $%s [l: $%s]", FormatNumber(TradeObject[playerid][0]), formatBytes(money[playerid]));
		strcat(items, gString);
		GivePlayerCash(id, TradeObject[playerid][0]);
		GivePlayerCash(playerid, -TradeObject[playerid][0]); }	
	if(TradeObject[playerid][1] != -1) {
		new idd = TradeObject[playerid][1];
		format(gString, 60, " Vehicul %s (%d)", GetVehicleName(CarInfo[idd][cModel]), CarInfo[idd][cID]);
		strcat(szString, gString);			
		strcat(items, gString);
		Iter_Remove(MyVehicles<playerid>, idd);
		Iter_Add(MyVehicles<id>, idd);
		format(CarInfo[idd][cOwner], 32, PlayerInfo[id][pName]);
		CarInfo[idd][cUserid] = PlayerInfo[id][pSQLID];
		CarInfo[idd][cOnline] = id;
		VehicleAcces[CarInfo[idd][cSpawned]] = id;
		foreach(new i : VehicleKeys[CarInfo[idd][cSpawned]]) Iter_Remove(PlayerKeys[i], CarInfo[idd][cSpawned]);
		Iter_Clear(VehicleKeys[CarInfo[idd][cSpawned]]);
		GiveVehicleKey(id, CarInfo[idd][cSpawned]);
		SetVehicleDoor(CarInfo[idd][cSpawned], CarInfo[idd][cStatus]);
		gQuery[0] = EOS;
		mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `cars` SET `Owner`='%s', `Userid`='%d' WHERE `ID`='%d'", PlayerInfo[id][pName], PlayerInfo[id][pSQLID], CarInfo[idd][cID]);
		mysql_tquery(SQL, gQuery); }
	if(TradeObject[playerid][2] != -1) {
		GivePlayerSkin(id, TradeObject[playerid][2]);
		for(new i = 0; i < (!PlayerInfo[playerid][pVip] ? 10 : (PlayerInfo[playerid][pVip] + 1) * 10); i++) if(PlayerInfo[playerid][pSkin][i] == TradeObject[playerid][2]) {
			PlayerInfo[playerid][pSkin][i] = -1;
			break;
		}
		SetPlayerSkin(playerid, PlayerInfo[playerid][pGender]?63:18);
		PlayerInfo[playerid][pModel] = PlayerInfo[playerid][pGender]?63:18;
		UpdateVar(playerid, "Model", PlayerInfo[playerid][pGender]?63:18);
		format(gString, 50, " Skin %d (%s)", TradeObject[playerid][2], GetSkinType(TradeObject[playerid][2]));
		strcat(szString, gString);
		strcat(items, gString);
		}
	if(TradeObject[playerid][3] != -1) {
		new house = TradeObject[playerid][3];
		PlayerInfo[id][pHouse] = house;
		UpdateVar(id, "House", PlayerInfo[id][pHouse]);
		PlayerInfo[playerid][pHouse] = -1;
		UpdateVar(playerid, "House", PlayerInfo[playerid][pHouse]);

		HouseInfo[house][hUserid] = PlayerInfo[id][pSQLID];

		format(HouseInfo[house][hOwner], MAX_PLAYER_NAME, GetName(id));
		UpdateHouseLabel(house);

		gQuery[0] = EOS;
		mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `houses` SET `Owner` = '%s', `Userid` = '%i' WHERE `ID` = '%i'", HouseInfo[house][hOwner], HouseInfo[house][hUserid], HouseInfo[house][hID]);
		mysql_tquery(SQL, gQuery);

		format(gString, 50, " House #%d", house);
		strcat(szString, gString);
		strcat(items, gString); }
	if(TradeObject[playerid][4] != -1) {
		new biz = TradeObject[playerid][4];
		PlayerInfo[id][pBussines] = biz;
		UpdateVar(id, "Bussines", PlayerInfo[id][pBussines]);
		PlayerInfo[playerid][pBussines] = -1;
		UpdateVar(playerid, "Bussines", PlayerInfo[playerid][pBussines]);

		BizzInfo[biz][bUserid] = PlayerInfo[id][pSQLID];

		format(BizzInfo[biz][bOwner], MAX_PLAYER_NAME, GetName(id));
		UpdateHouseLabel(biz);

		gQuery[0] = EOS;
		mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `bussines` SET `Owner` = '%i', `Userid` = '%i' WHERE `ID` = '%i'", BizzInfo[biz][bOwner], BizzInfo[biz][bUserid], BizzInfo[biz][bID]);
		mysql_tquery(SQL, gQuery);

		format(gString, 50, " Business #%d", biz);
		strcat(szString, gString);
		strcat(items, gString); }
	if(TradeObject[playerid][5] != -1) {
		new total = TradeObject[playerid][5];
		PlayerInfo[id][pVoucher][0] += total;
		save_vouchers(id);
		PlayerInfo[playerid][pVoucher][0] -= total;
		save_vouchers(playerid);
		format(gString, 50, " Rare Voucher %dx", total);
		strcat(szString, gString);
		strcat(items, gString); 
	}
	if(TradeObject[playerid][6] != -1) {
		new total = TradeObject[playerid][6];
		PlayerInfo[id][pVoucher][1] += total;
		save_vouchers(id);
		PlayerInfo[playerid][pVoucher][2] -= total;
		save_vouchers(playerid);
		format(gString, 50, " Natrox Voucher %dx", total);
		strcat(szString, gString);
		strcat(items, gString); 
	}
	if(TradeObject[playerid][7] != -1) {
		new total = TradeObject[playerid][7];
		PlayerInfo[id][pVoucher][2] += total;
		save_vouchers(id);
		PlayerInfo[playerid][pVoucher][2] -= total;
		save_vouchers(playerid);
		format(gString, 50, " Special Voucher %dx", total);
		strcat(szString, gString);
		strcat(items, gString); 
	}
	checkBP(playerid, 31, 300);
	checkBP(id, 31, 300);
	SCM(id, COLOR_LIGHTGOLD, szString);
	format(log, sizeof(log), "%s(user:%d) a dat [%s]", GetName(playerid), PlayerInfo[playerid][pSQLID], items);	
	items = "";
	szString = "Ai primit: ";
	if(TradeObject[id][0] != -1) {
		format(gString, 30, " $%s", FormatNumber(TradeObject[id][0]));
		strcat(szString, gString);
		format(gString, 75, " $%s [l: $%s]", FormatNumber(TradeObject[id][0]), formatBytes(money[id]));
		strcat(items, gString);
		GivePlayerCash(playerid, TradeObject[id][0]);
		GivePlayerCash(id, -TradeObject[id][0]); }
	if(TradeObject[id][1] != -1) {
		new idd = TradeObject[id][1];
		format(gString, 60, " Vehicul %s (%d)", GetVehicleName(CarInfo[idd][cModel]), CarInfo[idd][cID]);
		strcat(szString, gString);			
		strcat(items, gString);
		Iter_Remove(MyVehicles<id>, idd);
		Iter_Add(MyVehicles<playerid>, idd);
		format(CarInfo[idd][cOwner], 32, PlayerInfo[playerid][pName]);
		CarInfo[idd][cUserid] = PlayerInfo[playerid][pSQLID];
		CarInfo[idd][cOnline] = playerid;
		VehicleAcces[CarInfo[idd][cSpawned]] = playerid;
		foreach(new i : VehicleKeys[CarInfo[idd][cSpawned]]) Iter_Remove(PlayerKeys[i], CarInfo[idd][cSpawned]);
		Iter_Clear(VehicleKeys[CarInfo[idd][cSpawned]]);
		GiveVehicleKey(playerid, CarInfo[idd][cSpawned]);
		SetVehicleDoor(CarInfo[idd][cSpawned], CarInfo[idd][cStatus]);
		gQuery[0] = EOS;
		mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `cars` SET `Owner`='%s', `Userid`='%d' WHERE `ID`='%d'", PlayerInfo[playerid][pName], PlayerInfo[playerid][pSQLID], CarInfo[idd][cID]);
		mysql_tquery(SQL, gQuery); }
	if(TradeObject[id][2] != -1) {
		GivePlayerSkin(playerid, TradeObject[id][2]);
		for(new i = 0; i < (!PlayerInfo[id][pVip] ? 10 : (PlayerInfo[id][pVip] + 1) * 10); i++) if(PlayerInfo[id][pSkin][i] == TradeObject[id][2]) {
			PlayerInfo[id][pSkin][i] = -1; 
			break;
		}
		SetPlayerSkin(id, PlayerInfo[playerid][pGender]?63:18);
		PlayerInfo[id][pModel] = PlayerInfo[playerid][pGender]?63:18;
		UpdateVar(id, "Model", PlayerInfo[playerid][pGender]?63:18);
		format(gString, 50, " Skin %d (%s)", TradeObject[id][2], GetSkinType(TradeObject[id][2]));
		strcat(szString, gString);
		strcat(items, gString);}
	if(TradeObject[id][3] != -1) {
		new house = TradeObject[id][3];
		PlayerInfo[playerid][pHouse] = house;
		UpdateVar(playerid, "House", PlayerInfo[playerid][pHouse]);
		PlayerInfo[id][pHouse] = -1;
		UpdateVar(id, "House", PlayerInfo[id][pHouse]);

		HouseInfo[house][hUserid] = PlayerInfo[playerid][pSQLID];

		format(HouseInfo[house][hOwner], MAX_PLAYER_NAME, GetName(playerid));
		UpdateHouseLabel(house);

		gQuery[0] = EOS;
		mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `houses` SET `Owner` = '%s', `Userid` = '%i' WHERE `ID` = '%i'", HouseInfo[house][hOwner], HouseInfo[house][hUserid], HouseInfo[house][hID]);
		mysql_tquery(SQL, gQuery);

		format(gString, 50, " House #%d", house);
		strcat(szString, gString);
		strcat(items, gString); }
	if(TradeObject[id][4] != -1) {
		new biz = TradeObject[id][4];
		PlayerInfo[playerid][pBussines] = biz;
		UpdateVar(playerid, "Bussines", PlayerInfo[playerid][pBussines]);
		PlayerInfo[id][pBussines] = -1;
		UpdateVar(id, "Bussines", PlayerInfo[id][pBussines]);

		BizzInfo[biz][bUserid] = PlayerInfo[playerid][pSQLID];

		format(BizzInfo[biz][bOwner], MAX_PLAYER_NAME, GetName(playerid));
		UpdateHouseLabel(biz);

		gQuery[0] = EOS;
		mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `bussines` SET `Owner` = '%i', `Userid` = '%i' WHERE `ID` = '%i'", BizzInfo[biz][bOwner], BizzInfo[biz][bUserid], BizzInfo[biz][bID]);
		mysql_tquery(SQL, gQuery);

		format(gString, 50, " Business #%d", biz);
		strcat(szString, gString);
		strcat(items, gString); }
	if(TradeObject[id][5] != -1) {
		new total = TradeObject[id][5];
		PlayerInfo[playerid][pVoucher][0] += total;
		save_vouchers(playerid);
		PlayerInfo[id][pVoucher][0] -= total;
		save_vouchers(id);
		format(gString, 50, " Rare Voucher %dx", total);
		strcat(szString, gString);
		strcat(items, gString); 
	}
	if(TradeObject[id][6] != -1) {
		new total = TradeObject[id][6];
		PlayerInfo[playerid][pVoucher][1] += total;
		save_vouchers(playerid);
		PlayerInfo[id][pVoucher][1] -= total;
		save_vouchers(id);
		format(gString, 50, " Natrox Voucher %dx", total);
		strcat(szString, gString);
		strcat(items, gString); 
	}
	if(TradeObject[id][7] != -1) {
		new total = TradeObject[id][7];
		PlayerInfo[playerid][pVoucher][2] += total;
		save_vouchers(playerid);
		PlayerInfo[id][pVoucher][2] -= total;
		save_vouchers(id);
		format(gString, 50, " Special Voucher %dx", total);
		strcat(szString, gString);
		strcat(items, gString); 
	}
	SCM(playerid, COLOR_LIGHTGOLD, szString);
	
	format(log, sizeof(log), "%s pe [%s], lui %s (user:%d).", log, items, GetName(id), PlayerInfo[id][pSQLID]);
	SendAdminMessage(COLOR_YELLOW, log, 1);
	
	CancelSelectTextDraw(playerid);
	DestroyTradeItems(playerid);
	HideTradeTDs(playerid);
	
	CancelSelectTextDraw(id);
	DestroyTradeItems(id);
 	HideTradeTDs(id);
	return true; }
/*
LoadGunShop(playerid) {
	GunPTD[playerid][0] = CreatePlayerTextDraw(playerid, 103.699996, 25.937500, "box");
	PlayerTextDrawLetterSize(playerid, GunPTD[playerid][0], 0.000000, 3.615998);
	PlayerTextDrawTextSize(playerid, GunPTD[playerid][0], 0.000000, 143.150466);
	PlayerTextDrawAlignment(playerid, GunPTD[playerid][0], 2);
	PlayerTextDrawColor(playerid, GunPTD[playerid][0], -1);
	PlayerTextDrawUseBox(playerid, GunPTD[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, GunPTD[playerid][0], -1523963137);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, GunPTD[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, GunPTD[playerid][0], 255);
	PlayerTextDrawFont(playerid, GunPTD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, GunPTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][0], 0);

	GunPTD[playerid][1] = CreatePlayerTextDraw(playerid, 101.500000, 29.437500, "Ammu]nation");
	PlayerTextDrawLetterSize(playerid, GunPTD[playerid][1], 0.341999, 2.111877);
	PlayerTextDrawAlignment(playerid, GunPTD[playerid][1], 2);
	PlayerTextDrawColor(playerid, GunPTD[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, GunPTD[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, GunPTD[playerid][1], 255);
	PlayerTextDrawFont(playerid, GunPTD[playerid][1], 2);
	PlayerTextDrawSetProportional(playerid, GunPTD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][1], 0);

	GunPTD[playerid][2] = CreatePlayerTextDraw(playerid, 103.799987, 61.137496, "box");
	PlayerTextDrawLetterSize(playerid, GunPTD[playerid][2], 0.000000, 12.680015);
	PlayerTextDrawTextSize(playerid, GunPTD[playerid][2], 0.000000, 143.000000);
	PlayerTextDrawAlignment(playerid, GunPTD[playerid][2], 2);
	PlayerTextDrawColor(playerid, GunPTD[playerid][2], -1);
	PlayerTextDrawUseBox(playerid, GunPTD[playerid][2], 1);
	PlayerTextDrawBoxColor(playerid, GunPTD[playerid][2], 157);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, GunPTD[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, GunPTD[playerid][2], 255);
	PlayerTextDrawFont(playerid, GunPTD[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, GunPTD[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][2], 0);

	GunPTD[playerid][3] = CreatePlayerTextDraw(playerid, 32.400020, 59.800010, " SMG UPGRADES");
	PlayerTextDrawLetterSize(playerid, GunPTD[playerid][3], 0.248500, 1.175624);
	PlayerTextDrawAlignment(playerid, GunPTD[playerid][3], 1);
	PlayerTextDrawColor(playerid, GunPTD[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, GunPTD[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, GunPTD[playerid][3], 255);
	PlayerTextDrawFont(playerid, GunPTD[playerid][3], 2);
	PlayerTextDrawSetProportional(playerid, GunPTD[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][3], 0);

	static const gunTab[8][25] = {
		{" rounds x 60"}, {" lasser"}, {" army tint"}, {" green tint"}, {" orange tint"}, {" LSPD tint"}, {" pink tint"}, {" gold tint ~y~]"}
	};

	for(new i=0;i<8;i++) {
		GunPTD[playerid][i+4] = CreatePlayerTextDraw(playerid, 32.300045, 73.075035 + (i * 13.000000), gunTab[i]);
		PlayerTextDrawLetterSize(playerid, GunPTD[playerid][i+4], 0.207500, 1.071249);
		PlayerTextDrawTextSize(playerid, GunPTD[playerid][i+4], 175.149368, 0.000000);
		PlayerTextDrawAlignment(playerid, GunPTD[playerid][i+4], 1);
		PlayerTextDrawColor(playerid, GunPTD[playerid][i+4], -1);
		PlayerTextDrawUseBox(playerid, GunPTD[playerid][i+4], 1);
		PlayerTextDrawBoxColor(playerid, GunPTD[playerid][i+4], -5963776);
		PlayerTextDrawSetShadow(playerid, GunPTD[playerid][i+4], 0);
		PlayerTextDrawSetOutline(playerid, GunPTD[playerid][i+4], 0);
		PlayerTextDrawBackgroundColor(playerid, GunPTD[playerid][i+4], 255);
		PlayerTextDrawFont(playerid, GunPTD[playerid][i+4], 2);
		PlayerTextDrawSetProportional(playerid, GunPTD[playerid][i+4], 1);
		PlayerTextDrawSetShadow(playerid, GunPTD[playerid][i+4], 0);

		GunPTD[playerid][i+12] = CreatePlayerTextDraw(playerid, 175.899993, 73.437469 + (i * 13.31253), "$5.000");
		PlayerTextDrawLetterSize(playerid, GunPTD[playerid][i+12], 0.226000, 0.983124);
		PlayerTextDrawAlignment(playerid, GunPTD[playerid][i+12], 3);
		PlayerTextDrawColor(playerid, GunPTD[playerid][i+12], -1);
		PlayerTextDrawSetShadow(playerid, GunPTD[playerid][i+12], 0);
		PlayerTextDrawSetOutline(playerid, GunPTD[playerid][i+12], 0);
		PlayerTextDrawBackgroundColor(playerid, GunPTD[playerid][i+12], 255);
		PlayerTextDrawFont(playerid, GunPTD[playerid][i+12], 2);
		PlayerTextDrawSetProportional(playerid, GunPTD[playerid][i+12], 1);
		PlayerTextDrawSetShadow(playerid, GunPTD[playerid][i+12], 0);
	}
	GunPTD[playerid][20] = CreatePlayerTextDraw(playerid, 103.800003, 179.699996, "box");
	PlayerTextDrawLetterSize(playerid, GunPTD[playerid][20], 0.000000, 5.420006);
	PlayerTextDrawTextSize(playerid, GunPTD[playerid][20], 0.000000, 143.000000);
	PlayerTextDrawAlignment(playerid, GunPTD[playerid][20], 2);
	PlayerTextDrawColor(playerid, GunPTD[playerid][20], -1);
	PlayerTextDrawUseBox(playerid, GunPTD[playerid][20], 1);
	PlayerTextDrawBoxColor(playerid, GunPTD[playerid][20], 157);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][20], 0);
	PlayerTextDrawSetOutline(playerid, GunPTD[playerid][20], 0);
	PlayerTextDrawBackgroundColor(playerid, GunPTD[playerid][20], 255);
	PlayerTextDrawFont(playerid, GunPTD[playerid][20], 1);
	PlayerTextDrawSetProportional(playerid, GunPTD[playerid][20], 1);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][20], 0);

	GunPTD[playerid][21] = CreatePlayerTextDraw(playerid, 32.400108, 179.675201, " damage");
	PlayerTextDrawLetterSize(playerid, GunPTD[playerid][21], 0.207500, 1.071249);
	PlayerTextDrawTextSize(playerid, GunPTD[playerid][21], 176.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, GunPTD[playerid][21], 1);
	PlayerTextDrawColor(playerid, GunPTD[playerid][21], -1);
	PlayerTextDrawUseBox(playerid, GunPTD[playerid][21], 1);
	PlayerTextDrawBoxColor(playerid, GunPTD[playerid][21], 16776960);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][21], 0);
	PlayerTextDrawSetOutline(playerid, GunPTD[playerid][21], 0);
	PlayerTextDrawBackgroundColor(playerid, GunPTD[playerid][21], 255);
	PlayerTextDrawFont(playerid, GunPTD[playerid][21], 2);
	PlayerTextDrawSetProportional(playerid, GunPTD[playerid][21], 1);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][21], 0);

	GunPTD[playerid][22] = CreatePlayerTextDraw(playerid, 32.400108, 192.625030, " fire rate");
	PlayerTextDrawLetterSize(playerid, GunPTD[playerid][22], 0.207500, 1.071249);
	PlayerTextDrawTextSize(playerid, GunPTD[playerid][22], 175.069961, 0.000000);
	PlayerTextDrawAlignment(playerid, GunPTD[playerid][22], 1);
	PlayerTextDrawColor(playerid, GunPTD[playerid][22], -1);
	PlayerTextDrawUseBox(playerid, GunPTD[playerid][22], 1);
	PlayerTextDrawBoxColor(playerid, GunPTD[playerid][22], -5963776);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][22], 0);
	PlayerTextDrawSetOutline(playerid, GunPTD[playerid][22], 0);
	PlayerTextDrawBackgroundColor(playerid, GunPTD[playerid][22], 255);
	PlayerTextDrawFont(playerid, GunPTD[playerid][22], 2);
	PlayerTextDrawSetProportional(playerid, GunPTD[playerid][22], 1);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][22], 0);

	GunPTD[playerid][23] = CreatePlayerTextDraw(playerid, 32.500122, 205.799926, " accuracy");
	PlayerTextDrawLetterSize(playerid, GunPTD[playerid][23], 0.207500, 1.071249);
	PlayerTextDrawTextSize(playerid, GunPTD[playerid][23], 175.099945, 0.000000);
	PlayerTextDrawAlignment(playerid, GunPTD[playerid][23], 1);
	PlayerTextDrawColor(playerid, GunPTD[playerid][23], -1);
	PlayerTextDrawUseBox(playerid, GunPTD[playerid][23], 1);
	PlayerTextDrawBoxColor(playerid, GunPTD[playerid][23], -1523963392);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][23], 0);
	PlayerTextDrawSetOutline(playerid, GunPTD[playerid][23], 0);
	PlayerTextDrawBackgroundColor(playerid, GunPTD[playerid][23], 255);
	PlayerTextDrawFont(playerid, GunPTD[playerid][23], 2);
	PlayerTextDrawSetProportional(playerid, GunPTD[playerid][23], 1);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][23], 0);

	GunPTD[playerid][24] = CreatePlayerTextDraw(playerid, 32.200134, 218.912292, " range");
	PlayerTextDrawLetterSize(playerid, GunPTD[playerid][24], 0.207500, 1.071249);
	PlayerTextDrawTextSize(playerid, GunPTD[playerid][24], 175.350357, 0.000000);
	PlayerTextDrawAlignment(playerid, GunPTD[playerid][24], 1);
	PlayerTextDrawColor(playerid, GunPTD[playerid][24], -1);
	PlayerTextDrawUseBox(playerid, GunPTD[playerid][24], 1);
	PlayerTextDrawBoxColor(playerid, GunPTD[playerid][24], -1523963392);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][24], 0);
	PlayerTextDrawSetOutline(playerid, GunPTD[playerid][24], 0);
	PlayerTextDrawBackgroundColor(playerid, GunPTD[playerid][24], 255);
	PlayerTextDrawFont(playerid, GunPTD[playerid][24], 2);
	PlayerTextDrawSetProportional(playerid, GunPTD[playerid][24], 1);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][24], 0);

	GunPTD[playerid][25] = CreatePlayerTextDraw(playerid, 104.500000, 182.425018, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, GunPTD[playerid][25], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, GunPTD[playerid][25], 23.000000, 3.000000);
	PlayerTextDrawAlignment(playerid, GunPTD[playerid][25], 1);
	PlayerTextDrawColor(playerid, GunPTD[playerid][25], -1);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][25], 0);
	PlayerTextDrawSetOutline(playerid, GunPTD[playerid][25], 0);
	PlayerTextDrawBackgroundColor(playerid, GunPTD[playerid][25], 255);
	PlayerTextDrawFont(playerid, GunPTD[playerid][25], 4);
	PlayerTextDrawSetProportional(playerid, GunPTD[playerid][25], 0);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][25], 0);

	GunPTD[playerid][26] = CreatePlayerTextDraw(playerid, 127.199684, 182.425018, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, GunPTD[playerid][26], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, GunPTD[playerid][26], 45.969837, 2.759999);
	PlayerTextDrawAlignment(playerid, GunPTD[playerid][26], 1);
	PlayerTextDrawColor(playerid, GunPTD[playerid][26], -2139062017);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][26], 0);
	PlayerTextDrawSetOutline(playerid, GunPTD[playerid][26], 0);
	PlayerTextDrawBackgroundColor(playerid, GunPTD[playerid][26], 255);
	PlayerTextDrawFont(playerid, GunPTD[playerid][26], 4);
	PlayerTextDrawSetProportional(playerid, GunPTD[playerid][26], 0);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][26], 0);

	GunPTD[playerid][27] = CreatePlayerTextDraw(playerid, 104.399978, 196.862731, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, GunPTD[playerid][27], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, GunPTD[playerid][27], 31.000000, 3.000000);
	PlayerTextDrawAlignment(playerid, GunPTD[playerid][27], 1);
	PlayerTextDrawColor(playerid, GunPTD[playerid][27], -1);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][27], 0);
	PlayerTextDrawSetOutline(playerid, GunPTD[playerid][27], 0);
	PlayerTextDrawBackgroundColor(playerid, GunPTD[playerid][27], 255);
	PlayerTextDrawFont(playerid, GunPTD[playerid][27], 4);
	PlayerTextDrawSetProportional(playerid, GunPTD[playerid][27], 0);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][27], 0);

	GunPTD[playerid][28] = CreatePlayerTextDraw(playerid, 135.299560, 196.762512, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, GunPTD[playerid][28], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, GunPTD[playerid][28], 37.839691, 3.040000);
	PlayerTextDrawAlignment(playerid, GunPTD[playerid][28], 1);
	PlayerTextDrawColor(playerid, GunPTD[playerid][28], -2139062017);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][28], 0);
	PlayerTextDrawSetOutline(playerid, GunPTD[playerid][28], 0);
	PlayerTextDrawBackgroundColor(playerid, GunPTD[playerid][28], 255);
	PlayerTextDrawFont(playerid, GunPTD[playerid][28], 4);
	PlayerTextDrawSetProportional(playerid, GunPTD[playerid][28], 0);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][28], 0);

	GunPTD[playerid][29] = CreatePlayerTextDraw(playerid, 104.099960, 209.812774, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, GunPTD[playerid][29], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, GunPTD[playerid][29], 31.000000, 3.000000);
	PlayerTextDrawAlignment(playerid, GunPTD[playerid][29], 1);
	PlayerTextDrawColor(playerid, GunPTD[playerid][29], -1);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][29], 0);
	PlayerTextDrawSetOutline(playerid, GunPTD[playerid][29], 0);
	PlayerTextDrawBackgroundColor(playerid, GunPTD[playerid][29], 255);
	PlayerTextDrawFont(playerid, GunPTD[playerid][29], 4);
	PlayerTextDrawSetProportional(playerid, GunPTD[playerid][29], 0);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][29], 0);

	GunPTD[playerid][30] = CreatePlayerTextDraw(playerid, 135.399627, 209.887512, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, GunPTD[playerid][30], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, GunPTD[playerid][30], 37.839691, 3.040000);
	PlayerTextDrawAlignment(playerid, GunPTD[playerid][30], 1);
	PlayerTextDrawColor(playerid, GunPTD[playerid][30], -2139062017);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][30], 0);
	PlayerTextDrawSetOutline(playerid, GunPTD[playerid][30], 0);
	PlayerTextDrawBackgroundColor(playerid, GunPTD[playerid][30], 255);
	PlayerTextDrawFont(playerid, GunPTD[playerid][30], 4);
	PlayerTextDrawSetProportional(playerid, GunPTD[playerid][30], 0);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][30], 0);

	GunPTD[playerid][31] = CreatePlayerTextDraw(playerid, 104.099990, 222.537536, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, GunPTD[playerid][31], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, GunPTD[playerid][31], 21.000000, 3.000000);
	PlayerTextDrawAlignment(playerid, GunPTD[playerid][31], 1);
	PlayerTextDrawColor(playerid, GunPTD[playerid][31], -1);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][31], 0);
	PlayerTextDrawSetOutline(playerid, GunPTD[playerid][31], 0);
	PlayerTextDrawBackgroundColor(playerid, GunPTD[playerid][31], 255);
	PlayerTextDrawFont(playerid, GunPTD[playerid][31], 4);
	PlayerTextDrawSetProportional(playerid, GunPTD[playerid][31], 0);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][31], 0);

	GunPTD[playerid][32] = CreatePlayerTextDraw(playerid, 125.299690, 222.312469, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, GunPTD[playerid][32], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, GunPTD[playerid][32], 47.829524, 3.159998);
	PlayerTextDrawAlignment(playerid, GunPTD[playerid][32], 1);
	PlayerTextDrawColor(playerid, GunPTD[playerid][32], -2139062017);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][32], 0);
	PlayerTextDrawSetOutline(playerid, GunPTD[playerid][32], 0);
	PlayerTextDrawBackgroundColor(playerid, GunPTD[playerid][32], 255);
	PlayerTextDrawFont(playerid, GunPTD[playerid][32], 4);
	PlayerTextDrawSetProportional(playerid, GunPTD[playerid][32], 0);
	PlayerTextDrawSetShadow(playerid, GunPTD[playerid][32], 0);
	for(new i=0;i<33;i++) PlayerTextDrawShow(playerid, GunPTD[playerid][i]);
	return true;
}*/
HideTradeItems(playerid) {
	for(new i = 0; i < MAX_TRADE_ACTIONS; i++) TradeObject[playerid][i] = -1;
	new id = PlayerVar[playerid][IsTrade];
	switch(PlayerVar[playerid][TradeType]) {
		case false: {
			for(new i=0;i<5;i++) {
				PlayerTextDrawHide(playerid, TradeTitle[playerid][i]);
				PlayerTextDrawHide(id, TradeTitle[id][i]);	
				PlayerTextDrawHide(playerid, TradeIcon[playerid][i]);
				PlayerTextDrawHide(id, TradeIcon[id][i]);
			}		
			for(new i=11;i<16;i++) {
				TextDrawHideForPlayer(playerid, TradeTD[i]);
				TextDrawHideForPlayer(id, TradeTD[i]);
			}
		}
		case true: {
			for(new i=5;i<10;i++) {
				PlayerTextDrawHide(playerid, TradeTitle[playerid][i]);
				PlayerTextDrawHide(id, TradeTitle[id][i]);	
				PlayerTextDrawHide(playerid, TradeIcon[playerid][i]);
				PlayerTextDrawHide(id, TradeIcon[id][i]);
			}		
			for(new i=16;i<21;i++) {
				TextDrawHideForPlayer(playerid, TradeTD[i]);
				TextDrawHideForPlayer(id, TradeTD[i]);
			}
		}
	}	
	PlayerVar[playerid][TradeItems] = 0;	
	return true; }
DestroyTradeItems(playerid) {
	for(new i = 0; i < MAX_TRADE_ACTIONS; i++) TradeObject[playerid][i] = -1;
	new id = PlayerVar[playerid][IsTrade];
	for(new i=0;i<10;i++) {
		PlayerTextDrawDestroy(playerid, TradeTitle[playerid][i]);
		PlayerTextDrawDestroy(id, TradeTitle[id][i]);	
		PlayerTextDrawDestroy(playerid, TradeIcon[playerid][i]);
		PlayerTextDrawDestroy(id, TradeIcon[id][i]);
	}
	for(new i=11+(PlayerVar[playerid][TradeType]*5);i<16+(PlayerVar[playerid][TradeType]*5);i++) {
		TextDrawHideForPlayer(playerid, TradeTD[i]);
		TextDrawHideForPlayer(id, TradeTD[i]);
	}	
	PlayerVar[playerid][TradeItems] = 0;	
	return true; }
GetPlayerMaxSkin(playerid) return GetPlayerSkins(playerid)>=(PlayerInfo[playerid][pVip]?20:10)?true:false;
GetPlayerSkins(playerid) {
	new x;
	for(new i = 0; i < MAX_PLAYER_SKIN; i++) if(PlayerInfo[playerid][pSkin][i] != -1) x++;
	return x;
}

SetPlayerJail(playerid) {
	if(GetCity1(playerid) == 2) PlayerInfo[playerid][pJailType] = 2;
	else PlayerInfo[playerid][pJailType] = 1;
	UpdateVar(playerid, "JailType", PlayerInfo[playerid][pJailType]);
	PlayerInfo[playerid][pJail] = PlayerInfo[playerid][pWanted] * 300;
	UpdateVar(playerid, "Jail", PlayerInfo[playerid][pJail]);
	PlayerTextDrawShow(playerid, WantedPTD);
	PlayerInfo[playerid][pWanted] = 0;
	UpdateVar(playerid, "Wanted", 0);
	SetPlayerWantedLevel(playerid, 0);
	if(Iter_Contains(Calls[0], playerid)) Iter_Remove(Calls[0], playerid);
	return true; }

enum {
	Duminica,
	Luni,
	Marti,
	Miercuri,
	Joi,
	Vineri,
	Sambata
}

GetWeekDay(day=0, month=0, year=0) {
	new j, e; getdate(year, month, day);
	if(month <= 2) month += 12, --year;
	j = year % 100;
	e = year / 100;
	return ((day + (month+1)*26/10 + j + j/4 + e/4 - 2*e) % 7);
}

save_skins(playerid) {
	mysql_format(SQL, gQuery, sizeof(gQuery), 
		"UPDATE `users` SET `Skins`='%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d' WHERE `id`='%d'",
		PlayerInfo[playerid][pSkin][0], PlayerInfo[playerid][pSkin][1], PlayerInfo[playerid][pSkin][2], PlayerInfo[playerid][pSkin][3],
		PlayerInfo[playerid][pSkin][4], PlayerInfo[playerid][pSkin][5], PlayerInfo[playerid][pSkin][6], PlayerInfo[playerid][pSkin][7],
		PlayerInfo[playerid][pSkin][8], PlayerInfo[playerid][pSkin][9], PlayerInfo[playerid][pSkin][10], PlayerInfo[playerid][pSkin][11],
		PlayerInfo[playerid][pSkin][12], PlayerInfo[playerid][pSkin][13], PlayerInfo[playerid][pSkin][14], PlayerInfo[playerid][pSkin][15],
		PlayerInfo[playerid][pSkin][16], PlayerInfo[playerid][pSkin][17], PlayerInfo[playerid][pSkin][18], PlayerInfo[playerid][pSkin][19],
		PlayerInfo[playerid][pSQLID]);
	mysql_tquery(SQL, gQuery); }

new bool:rulta_data;
PayDay() {
	rulta_data=true;

	new interest, money, xp, pp;  
	GameTextForAll("~y~~h~payday", 500, 1);
	gString[0] = EOS;
	SetTimer("reset_payday", 5000, false);
	foreach(new i : Player) {
		if(!IsPlayerLogged(i)) continue;
		money = 250;
		SCM(i, COLOR_SERVER, "----------------------------------------------------------------------------------");
		SCM(i, COLOR_WHITE, "Your paycheck has arrived; please visit the bank to withdraw your money.");
		format(gString, 100, "Ai jucat %d ore si %d minute pana la acest payday.", PlayerInfo[i][pConnected]/3600, PlayerInfo[i][pConnected]/60);
		SCM(i, COLOR_WHITE, gString);
		SCM(i, COLOR_WHITE, PlayerInfo[i][pRobExp] < 60 ? "Ai primit 2 Rob experience." : "Nu ai primit niciun Rob experience ca ai deja 60 rob/free exp.");
		if(PlayerInfo[i][pMember] != 0) {
			format(gString, 123, "Ai primit $%s drept salariu ca membru al factiuni %s (rank %d)", FormatNumber(PlayerInfo[i][pRank] * 100), FactionInfo_[PlayerInfo[i][pMember] - 1][fName], PlayerInfo[i][pRank]);
			SCM(i, COLOR_ADMCMD, gString);
			money += PlayerInfo[i][pRank] * 100; }

		checkBP(i, 10, 350);

		switch(PlayerInfo[i][pModel]) {
			case 271, 233, 251, 144, 0: {
				if(random(100) < 35) {
					PlayerInfo[i][pPremiumPoints] += pp = RandomEx(2,5);
					SCMf(i, COLOR_LGREEN, "* Ai primit %d puncte premium pentru ca detii un skin special!", pp);
				}
			}
		}

		if(PlayerInfo[i][pFP]) {
			PlayerInfo[i][pFP]--;
			SCMf(i, COLOR_LGREEN, ">> {FFFFFF}Ti-a scazut faction punish, acum ai %d!", PlayerInfo[i][pFP]);
		}

		if(PlayerInfo[i][pJobBoost]) {
			PlayerInfo[i][pJobBoost]--;
			SCMf(i, COLOR_GM, ">> {FFFFFF}Mai ai %d ore de job boost (%d%s)", PlayerInfo[i][pJobBoost], PlayerInfo[i][pJobProcent], "%");
		}

		interest = (GetPlayerBank(i)/2500) * (PlayerInfo[i][pPremiumAccount] ? 2 : 1);
		GivePlayerBank(i, interest);
		SavePlayerBank(i);
		SCM(i, COLOR_WHITE, "You received 50 gift points.");
		PlayerInfo[i][pGiftPoints] += 50;
		PlayerInfo[i][pPlaying] += PlayerInfo[i][pConnected];
		if(PlayerInfo[i][pConnected] > 1800) {
			PlayerInfo[i][pServerPoints] += 30, SCM(i, COLOR_MONEY, "(+) Ai primit 30 Red points pentru ca ai jucat 30 minute.");
			checkBP(i, 14, 300, 30);
			checkBP(i, 12, 150);
		}

		xp=30+((PlayerInfo[i][pLevel]/4)*20);
		GiveExperience(i, (PlayerInfo[i][pConnected] > 1800?xp:xp/2) + GetSkinExp(i));

		checkBP(i, 9, 300, PlayerInfo[i][pConnected]);
		++PlayerInfo[i][pRobExp];
		if(PlayerInfo[i][pRobExp] > 60) PlayerInfo[i][pRobExp] = 60;
		PlayerInfo[i][pConnected] = 0;
		format(gString, 100, "Bank balance: $%s | Bank interest: $%s", formatBytes(bank[i]), FormatNumber(interest));
		SCM(i, COLOR_GREY, gString);
		money -= PlayerInfo[i][pRentroom] != -1 ? HouseInfo[PlayerInfo[i][pRentroom]][hRented] : 0;
		format(gString, 100, "Rent: $%d | Total earnings: $%s", PlayerInfo[i][pRentroom] != -1 ? HouseInfo[PlayerInfo[i][pRentroom]][hRented] : 0, FormatNumber(money));
		SCM(i, COLOR_GREY, gString);
		GivePlayerCash(i, money);
		_query(256, "UPDATE `users` SET `Playing` = '%i', `WeekPlaying` = `WeekPlaying` + '%i', `Connected` = '0', `GiftPoints` = '%i', `JobBoost` = '%i', `RobExp` = '%i', `FP` = '%i', `PremiumPoints` = '%i' WHERE `id` = '%i'", PlayerInfo[i][pPlaying], PlayerInfo[i][pConnected], PlayerInfo[i][pGiftPoints], PlayerInfo[i][pJobBoost], PlayerInfo[i][pRobExp], PlayerInfo[i][pFP], PlayerInfo[i][pPremiumPoints], PlayerInfo[i][pSQLID]);
		SCM(i, COLOR_SERVER, "----------------------------------------------------------------------------------"); }
	FixHour();
	return true; }

redist::reset_payday() return rulta_data=false;

SetPlayerSpawn(playerid) {
	if(PlayerVar[playerid][preparespawn]) {
		SetPlayerPos(playerid, PlayerVar[playerid][LastSpec][0], PlayerVar[playerid][LastSpec][1], PlayerVar[playerid][LastSpec][2]);
		SetPlayerFacingAngle(playerid, PlayerVar[playerid][LastSpec][3]);
		SetPlayerInterior(playerid, PlayerVar[playerid][UnSpec][0]);
		SetPlayerVirtualWorld(playerid, PlayerVar[playerid][UnSpec][1]);
		PlayerVar[playerid][preparespawn] = false;
		return true;
	}
	if(PlayerInfo[playerid][pJail] != 0) {
		new i = random(12);
		SetPlayerInterior(playerid, 6);
		switch(PlayerInfo[playerid][pJailType]) {
			case 1: PlayerVar[playerid][IsFaction] = 0, SetPlayerVirtualWorld(playerid, 1);
			case 2: PlayerVar[playerid][IsFaction] = 6, SetPlayerVirtualWorld(playerid, 7);
			case 10: PlayerVar[playerid][IsFaction] = -1, SetPlayerVirtualWorld(playerid, 10), SetPlayerInterior(playerid, 10), i+=12;
		}
		SetPlayerPos(playerid, JailPos[i][0], JailPos[i][1], JailPos[i][2]);
	} else {
		switch(PlayerInfo[playerid][pSpawnChange]) {
			case 1: {
				new x = PlayerVar[playerid][HouseID];
				PlayerVar[playerid][IsHouses] = x;
				PlayAudioStreamForPlayer(playerid, RadioLink[HouseInfo[x][hRadio]]);	
				SetPlayerPos(playerid, HouseInfo[x][hExitPos][0], HouseInfo[x][hExitPos][1], HouseInfo[x][hExitPos][2]);
				SetPlayerInterior(playerid, HouseInfo[x][hInterior]);
				SetPlayerVirtualWorld(playerid, HouseInfo[x][hVirtualWorld]);
			}
			default: {
				if(PlayerInfo[playerid][pMember]) {
					new x = PlayerInfo[playerid][pMember]-1;
					PlayerVar[playerid][IsFaction] = x;
					SetPlayerPos(playerid, FactionInfo_[x][fExitPos][0], FactionInfo_[x][fExitPos][1], FactionInfo_[x][fExitPos][2]);
					SetPlayerInterior(playerid, FactionInfo_[x][fInterior]);
					SetPlayerVirtualWorld(playerid, FactionInfo_[x][fVirtualWorld]);	
					return true;		
				}

				SetPlayerPos(playerid, 2408.7747,94.1072,26.4727), SetPlayerFacingAngle(playerid, 8.9390);
				SetPlayerInterior(playerid, 0);
				SetPlayerVirtualWorld(playerid, PlayerInfo[playerid][pTut] < 4 ? playerid + 10 : 0);
			}
		}
	}
	return true;
}
std::getSkinColors(skin) {
	switch(skin) {
		case 157 , 158  , 161 , 170, 45 , 41 , 40 , 34 , 29 , 31: return 0xFF009745;
	}
	return 0xFFFFFF45;
}

std::getSkinValue(skin) {
	switch(skin) {
		case 157 , 158  , 161 , 170, 45 , 41 , 40 , 34 , 29 , 31: return 500000;
	}
	return 100;
}

#include <YSI_Coding\y_hooks>
hook OnGameModeInit() {

	speed_TD[0] = TextDrawCreate(520.1669, 371.6667, "particle:lamp_shad_64"); 
	TextDrawTextSize(speed_TD[0], 76.0000, 33.0000);
	TextDrawAlignment(speed_TD[0], 1);
	TextDrawColor(speed_TD[0], 673720351);
	TextDrawBackgroundColor(speed_TD[0], 255);
	TextDrawFont(speed_TD[0], 4);
	TextDrawSetProportional(speed_TD[0], 0);
	TextDrawSetShadow(speed_TD[0], 0);

	speed_TD[1] = TextDrawCreate(578.8068, 349.2500, ""); 
	TextDrawTextSize(speed_TD[1], 69.0000, 51.0000);
	TextDrawAlignment(speed_TD[1], 1);
	TextDrawColor(speed_TD[1], 0xBF2424FF);
	TextDrawFont(speed_TD[1], 5);
	TextDrawSetProportional(speed_TD[1], 0);
	TextDrawBackgroundColor(speed_TD[1], 0);
	TextDrawSetShadow(speed_TD[1], 0);
	TextDrawSetPreviewModel(speed_TD[1], 2153);
	TextDrawSetPreviewRot(speed_TD[1], 0.0000, -15.0000, 90.0000, 1.0000);

	speed_TD[2] = TextDrawCreate(598.5870, 386.5832, "ld_beat:chit"); 
	TextDrawTextSize(speed_TD[2], 20.0000, 20.0000);
	TextDrawAlignment(speed_TD[2], 1);
	TextDrawColor(speed_TD[2], 0xBF2424FF);
	TextDrawBackgroundColor(speed_TD[2], 255);
	TextDrawFont(speed_TD[2], 4);
	TextDrawSetProportional(speed_TD[2], 0);
	TextDrawSetShadow(speed_TD[2], 0);

	speed_TD[3] = TextDrawCreate(560.0659, 345.7499, ""); 
	TextDrawTextSize(speed_TD[3], 67.0000, 55.0000);
	TextDrawAlignment(speed_TD[3], 1);
	TextDrawColor(speed_TD[3], 0xBF2424FF);
	TextDrawFont(speed_TD[3], 5);
	TextDrawSetProportional(speed_TD[3], 0);
	TextDrawBackgroundColor(speed_TD[3], 0);
	TextDrawSetShadow(speed_TD[3], 0);
	TextDrawSetPreviewModel(speed_TD[3], 2153);
	TextDrawSetPreviewRot(speed_TD[3], 0.0000, -15.0000, 90.0000, 1.0000);

	speed_TD[4] = TextDrawCreate(584.4331, 392.4166, "LD_SPAC:white"); 
	TextDrawTextSize(speed_TD[4], 24.0000, 11.0000);
	TextDrawAlignment(speed_TD[4], 1);
	TextDrawColor(speed_TD[4], 0xBF2424FF);
	TextDrawBackgroundColor(speed_TD[4], 255);
	TextDrawFont(speed_TD[4], 4);
	TextDrawSetProportional(speed_TD[4], 0);
	TextDrawSetShadow(speed_TD[4], 0);

	speed_TD[5] = TextDrawCreate(576.0000, 387.0000, "ld_beat:chit");
	TextDrawTextSize(speed_TD[5], 20.0000, 20.0000);
	TextDrawAlignment(speed_TD[5], 1);
	TextDrawColor(speed_TD[5], 0xBF2424FF);
	TextDrawBackgroundColor(speed_TD[5], 255);
	TextDrawFont(speed_TD[5], 4);
	TextDrawSetProportional(speed_TD[5], 0);
	TextDrawSetShadow(speed_TD[5], 0);

	speed_TD[6] = TextDrawCreate(600.3627, 346.3332, "LD_SPAC:white");
	TextDrawTextSize(speed_TD[6], 24.0000, 11.0000);
	TextDrawAlignment(speed_TD[6], 1);
	TextDrawColor(speed_TD[6], 0xBF2424FF);
	TextDrawBackgroundColor(speed_TD[6], 255);
	TextDrawFont(speed_TD[6], 4);
	TextDrawSetProportional(speed_TD[6], 0);
	TextDrawSetShadow(speed_TD[6], 0);

	speed_TD[7] = TextDrawCreate(590.6226, 342.8333, "ld_beat:chit");
	TextDrawTextSize(speed_TD[7], 20.0000, 20.0000);
	TextDrawAlignment(speed_TD[7], 1);
	TextDrawColor(speed_TD[7], 0xBF2424FF);
	TextDrawBackgroundColor(speed_TD[7], 255);
	TextDrawFont(speed_TD[7], 4);
	TextDrawSetProportional(speed_TD[7], 0);
	TextDrawSetShadow(speed_TD[7], 0);

	speed_TD[8] = TextDrawCreate(597.5516, 353.3333, "LD_SPAC:white"); 
	TextDrawTextSize(speed_TD[8], 17.0000, 44.0000);
	TextDrawAlignment(speed_TD[8], 1);
	TextDrawColor(speed_TD[8], 0xBF2424FF);
	TextDrawBackgroundColor(speed_TD[8], 255);
	TextDrawFont(speed_TD[8], 4);
	TextDrawSetProportional(speed_TD[8], 0);
	TextDrawSetShadow(speed_TD[8], 0);

	speed_TD[9] = TextDrawCreate(614.5171, 342.8333, "ld_beat:chit"); 
	TextDrawTextSize(speed_TD[9], 20.0000, 20.0000);
	TextDrawAlignment(speed_TD[9], 1);
	TextDrawColor(speed_TD[9], 0xBF2424FF);
	TextDrawBackgroundColor(speed_TD[9], 255);
	TextDrawFont(speed_TD[9], 4);
	TextDrawSetProportional(speed_TD[9], 0);
	TextDrawSetShadow(speed_TD[9], 0);

	speed_TD[10] = TextDrawCreate(625.1155, 413.0834, "particle:lamp_shad_64"); 
	TextDrawTextSize(speed_TD[10], -131.0000, -67.0000);
	TextDrawAlignment(speed_TD[10], 1);
	TextDrawColor(speed_TD[10], 673720436);
	TextDrawBackgroundColor(speed_TD[10], 255);
	TextDrawFont(speed_TD[10], 4);
	TextDrawSetProportional(speed_TD[10], 0);
	TextDrawSetShadow(speed_TD[10], 0);

	speed_TD[11] = TextDrawCreate(570.0070, 366.1667, "ld_beat:chit");
	TextDrawTextSize(speed_TD[11], 15.0000, 15.0000);
	TextDrawAlignment(speed_TD[11], 1);
	TextDrawColor(speed_TD[11], 336860415);
	TextDrawBackgroundColor(speed_TD[11], 255);
	TextDrawFont(speed_TD[11], 4);
	TextDrawSetProportional(speed_TD[11], 0);
	TextDrawSetShadow(speed_TD[11], 0);

	speed_TD[12] = TextDrawCreate(575.0589, 374.3332, ""); 
	TextDrawTextSize(speed_TD[12], 10.0000, 9.0000);
	TextDrawAlignment(speed_TD[12], 1);
	TextDrawColor(speed_TD[12], 336860415);
	TextDrawBackgroundColor(speed_TD[12], 336860160);
	TextDrawFont(speed_TD[12], 5);
	TextDrawSetProportional(speed_TD[12], 0);
	TextDrawSetShadow(speed_TD[12], 0);
	TextDrawSetPreviewModel(speed_TD[12], 2153);
	TextDrawSetPreviewRot(speed_TD[12], 0.0000, -15.0000, 90.0000, 1.0000);

	speed_TD[13] = TextDrawCreate(568.1330, 373.1668, "ld_beat:chit");
	TextDrawTextSize(speed_TD[13], 15.0000, 15.0000);
	TextDrawAlignment(speed_TD[13], 1);
	TextDrawColor(speed_TD[13], 336860415);
	TextDrawBackgroundColor(speed_TD[13], 255);
	TextDrawFont(speed_TD[13], 4);
	TextDrawSetProportional(speed_TD[13], 0);
	TextDrawSetShadow(speed_TD[13], 0);

	speed_TD[14] = TextDrawCreate(517.4339, 368.5000, "LD_SPAC:white");
	TextDrawTextSize(speed_TD[14], 59.0000, 17.5000);
	TextDrawAlignment(speed_TD[14], 1);
	TextDrawColor(speed_TD[14], 336860415);
	TextDrawBackgroundColor(speed_TD[14], 255);
	TextDrawFont(speed_TD[14], 4);
	TextDrawSetProportional(speed_TD[14], 0);
	TextDrawSetShadow(speed_TD[14], 0);

	speed_TD[15] = TextDrawCreate(511.4421, 366.1667, "ld_beat:chit");
	TextDrawTextSize(speed_TD[15], 15.0000, 15.0000);
	TextDrawAlignment(speed_TD[15], 1);
	TextDrawColor(speed_TD[15], 336860415);
	TextDrawBackgroundColor(speed_TD[15], 255);
	TextDrawFont(speed_TD[15], 4);
	TextDrawSetProportional(speed_TD[15], 0);
	TextDrawSetShadow(speed_TD[15], 0);

	speed_TD[16] = TextDrawCreate(519.3051, 380.1664, "");
	TextDrawTextSize(speed_TD[16], -10.0000, -9.0000);
	TextDrawAlignment(speed_TD[16], 1);
	TextDrawColor(speed_TD[16], 336860415);
	TextDrawBackgroundColor(speed_TD[16], 336860160);
	TextDrawFont(speed_TD[16], 5);
	TextDrawSetProportional(speed_TD[16], 0);
	TextDrawSetShadow(speed_TD[16], 0);
	TextDrawSetPreviewModel(speed_TD[16], 2153);
	TextDrawSetPreviewRot(speed_TD[16], 0.0000, -15.0000, 90.0000, 1.0000);

	speed_TD[17] = TextDrawCreate(509.0996, 373.1667, "ld_beat:chit");
	TextDrawTextSize(speed_TD[17], 15.0000, 15.0000);
	TextDrawAlignment(speed_TD[17], 1);
	TextDrawColor(speed_TD[17], 336860415);
	TextDrawBackgroundColor(speed_TD[17], 255);
	TextDrawFont(speed_TD[17], 4);
	TextDrawSetProportional(speed_TD[17], 0);
	TextDrawSetShadow(speed_TD[17], 0);

	speed_TD[18] = TextDrawCreate(576.0000, 386.5000, "ld_beat:chit"); 
	TextDrawTextSize(speed_TD[18], 20.0000, 20.5000);
	TextDrawAlignment(speed_TD[18], 1);
	TextDrawColor(speed_TD[18], 336860415);
	TextDrawBackgroundColor(speed_TD[18], 255);
	TextDrawFont(speed_TD[18], 4);
	TextDrawSetProportional(speed_TD[18], 0);
	TextDrawSetShadow(speed_TD[18], 0);

	speed_TD[19] = TextDrawCreate(589.0000, 391.0000, "KM/H"); 
	TextDrawLetterSize(speed_TD[19], 0.1287, 1.1566);
	TextDrawAlignment(speed_TD[19], 1);
	TextDrawColor(speed_TD[19], -1);
	TextDrawBackgroundColor(speed_TD[19], 255);
	TextDrawFont(speed_TD[19], 2);
	TextDrawSetProportional(speed_TD[19], 1);
	TextDrawSetShadow(speed_TD[19], 0);

	speed_TD[20] = TextDrawCreate(598.5870, 386.5832, "ld_beat:chit"); 
	TextDrawTextSize(speed_TD[20], 20.0000, 20.0000);
	TextDrawAlignment(speed_TD[20], 1);
	TextDrawColor(speed_TD[20], 336860415);
	TextDrawBackgroundColor(speed_TD[20], 255);
	TextDrawFont(speed_TD[20], 4);
	TextDrawSetProportional(speed_TD[20], 0);
	TextDrawSetShadow(speed_TD[20], 0);

	speed_TD[21] = TextDrawCreate(585.4685, 390.0833, "ld_spac:white"); 
	TextDrawTextSize(speed_TD[21], 23.0000, 13.5000);
	TextDrawAlignment(speed_TD[21], 1);
	TextDrawColor(speed_TD[21], 336860415);
	TextDrawBackgroundColor(speed_TD[21], 255);
	TextDrawFont(speed_TD[21], 4);
	TextDrawSetProportional(speed_TD[21], 0);
	TextDrawSetShadow(speed_TD[21], 0);

	speed_TD[22] = TextDrawCreate(608.795166, 351.286346, "ld_beat:chit");
	TextDrawTextSize(speed_TD[22], 18.000000, 21.000000);
	TextDrawAlignment(speed_TD[22], 1);
	TextDrawColor(speed_TD[22], 0xE93131FF);
	TextDrawBackgroundColor(speed_TD[22], 255);
	TextDrawFont(speed_TD[22], 4);
	TextDrawSetProportional(speed_TD[22], 0);
	TextDrawSetShadow(speed_TD[22], 0);

	speed_TD[23] = TextDrawCreate(596.985961, 348.299682, "ld_beat:chit");
	TextDrawLetterSize(speed_TD[23], 0.000000, 0.000000);
	TextDrawTextSize(speed_TD[23], 11.000000, 13.000000);
	TextDrawAlignment(speed_TD[23], 1);
	TextDrawColor(speed_TD[23], 0xE93131FF);
	TextDrawBackgroundColor(speed_TD[23], 255);
	TextDrawFont(speed_TD[23], 4);
	TextDrawSetProportional(speed_TD[23], 0);
	TextDrawSetShadow(speed_TD[23], 0);

	speed_TD[24] = TextDrawCreate(593.557861, 379.019653, "ld_beat:chit");
	TextDrawLetterSize(speed_TD[24], 0.000000, 0.000000);
	TextDrawTextSize(speed_TD[24], 8.000000, 10.000000);
	TextDrawAlignment(speed_TD[24], 1);
	TextDrawColor(speed_TD[24], 0xE93131FF);
	TextDrawBackgroundColor(speed_TD[24], 255);
	TextDrawFont(speed_TD[24], 4);
	TextDrawSetProportional(speed_TD[24], 0);
	TextDrawSetShadow(speed_TD[24], 0);

	speed_TD[25] = TextDrawCreate(566.196044, 385.466857, "ld_beat:chit");
	TextDrawLetterSize(speed_TD[25], 0.000000, 0.000000);
	TextDrawTextSize(speed_TD[25], 11.000000, 19.000000);
	TextDrawAlignment(speed_TD[25], 1);
	TextDrawColor(speed_TD[25], 336860415);
	TextDrawBackgroundColor(speed_TD[25], 255);
	TextDrawFont(speed_TD[25], 4);
	TextDrawSetProportional(speed_TD[25], 0);
	TextDrawSetShadow(speed_TD[25], 0);

	speed_TD[26] = TextDrawCreate(504.310668, 385.246765, "ld_beat:chit");
	TextDrawLetterSize(speed_TD[26], 0.000000, 0.000000);
	TextDrawTextSize(speed_TD[26], 11.000000, 19.000000);
	TextDrawAlignment(speed_TD[26], 1);
	TextDrawColor(speed_TD[26], 336860415);
	TextDrawBackgroundColor(speed_TD[26], 255);
	TextDrawFont(speed_TD[26], 4);
	TextDrawSetProportional(speed_TD[26], 0);
	TextDrawSetShadow(speed_TD[26], 0);

	speed_TDx[0] = TextDrawCreate(520.1669-80.0, 371.6667-65.0, "particle:lamp_shad_64"); 
	TextDrawTextSize(speed_TDx[0], 76.0000, 33.0000);
	TextDrawAlignment(speed_TDx[0], 1);
	TextDrawColor(speed_TDx[0], 673720351);
	TextDrawBackgroundColor(speed_TDx[0], 255);
	TextDrawFont(speed_TDx[0], 4);
	TextDrawSetProportional(speed_TDx[0], 0);
	TextDrawSetShadow(speed_TDx[0], 0);

	speed_TDx[1] = TextDrawCreate(578.8068-80.0, 349.2500-65.0, ""); 
	TextDrawTextSize(speed_TDx[1], 69.0000, 51.0000);
	TextDrawAlignment(speed_TDx[1], 1);
	TextDrawColor(speed_TDx[1], 0xBF2424FF);
	TextDrawFont(speed_TDx[1], 5);
	TextDrawSetProportional(speed_TDx[1], 0);
	TextDrawBackgroundColor(speed_TDx[1], 0);
	TextDrawSetShadow(speed_TDx[1], 0);
	TextDrawSetPreviewModel(speed_TDx[1], 2153);
	TextDrawSetPreviewRot(speed_TDx[1], 0.0000, -15.0000, 90.0000, 1.0000);

	speed_TDx[2] = TextDrawCreate(598.5870-80.0, 386.5832-65.0, "ld_beat:chit"); 
	TextDrawTextSize(speed_TDx[2], 20.0000, 20.0000);
	TextDrawAlignment(speed_TDx[2], 1);
	TextDrawColor(speed_TDx[2], 0xBF2424FF);
	TextDrawBackgroundColor(speed_TDx[2], 255);
	TextDrawFont(speed_TDx[2], 4);
	TextDrawSetProportional(speed_TDx[2], 0);
	TextDrawSetShadow(speed_TDx[2], 0);

	speed_TDx[3] = TextDrawCreate(560.0659-80.0, 345.7499-65.0, ""); 
	TextDrawTextSize(speed_TDx[3], 67.0000, 55.0000);
	TextDrawAlignment(speed_TDx[3], 1);
	TextDrawColor(speed_TDx[3], 0xBF2424FF);
	TextDrawFont(speed_TDx[3], 5);
	TextDrawSetProportional(speed_TDx[3], 0);
	TextDrawBackgroundColor(speed_TDx[3], 0);
	TextDrawSetShadow(speed_TDx[3], 0);
	TextDrawSetPreviewModel(speed_TDx[3], 2153);
	TextDrawSetPreviewRot(speed_TDx[3], 0.0000, -15.0000, 90.0000, 1.0000);

	speed_TDx[4] = TextDrawCreate(584.4331-80.0, 392.4166-65.0, "LD_SPAC:white"); 
	TextDrawTextSize(speed_TDx[4], 24.0000, 11.0000);
	TextDrawAlignment(speed_TDx[4], 1);
	TextDrawColor(speed_TDx[4], 0xBF2424FF);
	TextDrawBackgroundColor(speed_TDx[4], 255);
	TextDrawFont(speed_TDx[4], 4);
	TextDrawSetProportional(speed_TDx[4], 0);
	TextDrawSetShadow(speed_TDx[4], 0);

	speed_TDx[5] = TextDrawCreate(576.0000-80.0, 387.0000-65.0, "ld_beat:chit");
	TextDrawTextSize(speed_TDx[5], 20.0000, 20.0000);
	TextDrawAlignment(speed_TDx[5], 1);
	TextDrawColor(speed_TDx[5], 0xBF2424FF);
	TextDrawBackgroundColor(speed_TDx[5], 255);
	TextDrawFont(speed_TDx[5], 4);
	TextDrawSetProportional(speed_TDx[5], 0);
	TextDrawSetShadow(speed_TDx[5], 0);

	speed_TDx[6] = TextDrawCreate(600.3627-80.0, 346.3332-65.0, "LD_SPAC:white");
	TextDrawTextSize(speed_TDx[6], 24.0000, 11.0000);
	TextDrawAlignment(speed_TDx[6], 1);
	TextDrawColor(speed_TDx[6], 0xBF2424FF);
	TextDrawBackgroundColor(speed_TDx[6], 255);
	TextDrawFont(speed_TDx[6], 4);
	TextDrawSetProportional(speed_TDx[6], 0);
	TextDrawSetShadow(speed_TDx[6], 0);

	speed_TDx[7] = TextDrawCreate(590.6226-80.0, 342.8333-65.0, "ld_beat:chit");
	TextDrawTextSize(speed_TDx[7], 20.0000, 20.0000);
	TextDrawAlignment(speed_TDx[7], 1);
	TextDrawColor(speed_TDx[7], 0xBF2424FF);
	TextDrawBackgroundColor(speed_TDx[7], 255);
	TextDrawFont(speed_TDx[7], 4);
	TextDrawSetProportional(speed_TDx[7], 0);
	TextDrawSetShadow(speed_TDx[7], 0);

	speed_TDx[8] = TextDrawCreate(597.5516-80.0, 353.3333-65.0, "LD_SPAC:white"); 
	TextDrawTextSize(speed_TDx[8], 17.0000, 44.0000);
	TextDrawAlignment(speed_TDx[8], 1);
	TextDrawColor(speed_TDx[8], 0xBF2424FF);
	TextDrawBackgroundColor(speed_TDx[8], 255);
	TextDrawFont(speed_TDx[8], 4);
	TextDrawSetProportional(speed_TDx[8], 0);
	TextDrawSetShadow(speed_TDx[8], 0);

	speed_TDx[9] = TextDrawCreate(614.5171-80.0, 342.8333-65.0, "ld_beat:chit"); 
	TextDrawTextSize(speed_TDx[9], 20.0000, 20.0000);
	TextDrawAlignment(speed_TDx[9], 1);
	TextDrawColor(speed_TDx[9], 0xBF2424FF);
	TextDrawBackgroundColor(speed_TDx[9], 255);
	TextDrawFont(speed_TDx[9], 4);
	TextDrawSetProportional(speed_TDx[9], 0);
	TextDrawSetShadow(speed_TDx[9], 0);

	speed_TDx[10] = TextDrawCreate(625.1155-80.0, 413.0834-65.0, "particle:lamp_shad_64"); 
	TextDrawTextSize(speed_TDx[10], -131.0000, -67.0000);
	TextDrawAlignment(speed_TDx[10], 1);
	TextDrawColor(speed_TDx[10], 673720436);
	TextDrawBackgroundColor(speed_TDx[10], 255);
	TextDrawFont(speed_TDx[10], 4);
	TextDrawSetProportional(speed_TDx[10], 0);
	TextDrawSetShadow(speed_TDx[10], 0);

	speed_TDx[11] = TextDrawCreate(570.0070-80.0, 366.1667-65.0, "ld_beat:chit");
	TextDrawTextSize(speed_TDx[11], 15.0000, 15.0000);
	TextDrawAlignment(speed_TDx[11], 1);
	TextDrawColor(speed_TDx[11], 336860415);
	TextDrawBackgroundColor(speed_TDx[11], 255);
	TextDrawFont(speed_TDx[11], 4);
	TextDrawSetProportional(speed_TDx[11], 0);
	TextDrawSetShadow(speed_TDx[11], 0);

	speed_TDx[12] = TextDrawCreate(575.0589-80.0, 374.3332-65.0, ""); 
	TextDrawTextSize(speed_TDx[12], 10.0000, 9.0000);
	TextDrawAlignment(speed_TDx[12], 1);
	TextDrawColor(speed_TDx[12], 336860415);
	TextDrawBackgroundColor(speed_TDx[12], 336860160);
	TextDrawFont(speed_TDx[12], 5);
	TextDrawSetProportional(speed_TDx[12], 0);
	TextDrawSetShadow(speed_TDx[12], 0);
	TextDrawSetPreviewModel(speed_TDx[12], 2153);
	TextDrawSetPreviewRot(speed_TDx[12], 0.0000, -15.0000, 90.0000, 1.0000);

	speed_TDx[13] = TextDrawCreate(568.1330-80.0, 373.1668-65.0, "ld_beat:chit");
	TextDrawTextSize(speed_TDx[13], 15.0000, 15.0000);
	TextDrawAlignment(speed_TDx[13], 1);
	TextDrawColor(speed_TDx[13], 336860415);
	TextDrawBackgroundColor(speed_TDx[13], 255);
	TextDrawFont(speed_TDx[13], 4);
	TextDrawSetProportional(speed_TDx[13], 0);
	TextDrawSetShadow(speed_TDx[13], 0);

	speed_TDx[14] = TextDrawCreate(517.4339-80.0, 368.5000-65.0, "LD_SPAC:white");
	TextDrawTextSize(speed_TDx[14], 59.0000, 17.5000);
	TextDrawAlignment(speed_TDx[14], 1);
	TextDrawColor(speed_TDx[14], 336860415);
	TextDrawBackgroundColor(speed_TDx[14], 255);
	TextDrawFont(speed_TDx[14], 4);
	TextDrawSetProportional(speed_TDx[14], 0);
	TextDrawSetShadow(speed_TDx[14], 0);

	speed_TDx[15] = TextDrawCreate(511.4421-80.0, 366.1667-65.0, "ld_beat:chit");
	TextDrawTextSize(speed_TDx[15], 15.0000, 15.0000);
	TextDrawAlignment(speed_TDx[15], 1);
	TextDrawColor(speed_TDx[15], 336860415);
	TextDrawBackgroundColor(speed_TDx[15], 255);
	TextDrawFont(speed_TDx[15], 4);
	TextDrawSetProportional(speed_TDx[15], 0);
	TextDrawSetShadow(speed_TDx[15], 0);

	speed_TDx[16] = TextDrawCreate(519.3051-80.0, 380.1664-65.0, "");
	TextDrawTextSize(speed_TDx[16], -10.0000, -9.0000);
	TextDrawAlignment(speed_TDx[16], 1);
	TextDrawColor(speed_TDx[16], 336860415);
	TextDrawBackgroundColor(speed_TDx[16], 336860160);
	TextDrawFont(speed_TDx[16], 5);
	TextDrawSetProportional(speed_TDx[16], 0);
	TextDrawSetShadow(speed_TDx[16], 0);
	TextDrawSetPreviewModel(speed_TDx[16], 2153);
	TextDrawSetPreviewRot(speed_TDx[16], 0.0000, -15.0000, 90.0000, 1.0000);

	speed_TDx[17] = TextDrawCreate(509.0996-80.0, 373.1667-65.0, "ld_beat:chit");
	TextDrawTextSize(speed_TDx[17], 15.0000, 15.0000);
	TextDrawAlignment(speed_TDx[17], 1);
	TextDrawColor(speed_TDx[17], 336860415);
	TextDrawBackgroundColor(speed_TDx[17], 255);
	TextDrawFont(speed_TDx[17], 4);
	TextDrawSetProportional(speed_TDx[17], 0);
	TextDrawSetShadow(speed_TDx[17], 0);

	speed_TDx[18] = TextDrawCreate(576.0000-80.0, 386.5000-65.0, "ld_beat:chit"); 
	TextDrawTextSize(speed_TDx[18], 20.0000, 20.5000);
	TextDrawAlignment(speed_TDx[18], 1);
	TextDrawColor(speed_TDx[18], 336860415);
	TextDrawBackgroundColor(speed_TDx[18], 255);
	TextDrawFont(speed_TDx[18], 4);
	TextDrawSetProportional(speed_TDx[18], 0);
	TextDrawSetShadow(speed_TDx[18], 0);

	speed_TDx[19] = TextDrawCreate(589.0000-80.0, 391.0000-65.0, "KM/H"); 
	TextDrawLetterSize(speed_TDx[19], 0.1287, 1.1566);
	TextDrawAlignment(speed_TDx[19], 1);
	TextDrawColor(speed_TDx[19], -1);
	TextDrawBackgroundColor(speed_TDx[19], 255);
	TextDrawFont(speed_TDx[19], 2);
	TextDrawSetProportional(speed_TDx[19], 1);
	TextDrawSetShadow(speed_TDx[19], 0);

	speed_TDx[20] = TextDrawCreate(598.5870-80.0, 386.5832-65.0, "ld_beat:chit"); 
	TextDrawTextSize(speed_TDx[20], 20.0000, 20.0000);
	TextDrawAlignment(speed_TDx[20], 1);
	TextDrawColor(speed_TDx[20], 336860415);
	TextDrawBackgroundColor(speed_TDx[20], 255);
	TextDrawFont(speed_TDx[20], 4);
	TextDrawSetProportional(speed_TDx[20], 0);
	TextDrawSetShadow(speed_TDx[20], 0);

	speed_TDx[21] = TextDrawCreate(585.4685-80.0, 390.0833-65.0, "ld_spac:white"); 
	TextDrawTextSize(speed_TDx[21], 23.0000, 13.5000);
	TextDrawAlignment(speed_TDx[21], 1);
	TextDrawColor(speed_TDx[21], 336860415);
	TextDrawBackgroundColor(speed_TDx[21], 255);
	TextDrawFont(speed_TDx[21], 4);
	TextDrawSetProportional(speed_TDx[21], 0);
	TextDrawSetShadow(speed_TDx[21], 0);

	speed_TDx[22] = TextDrawCreate(608.795166-80.0, 351.286346-65.0, "ld_beat:chit");
	TextDrawTextSize(speed_TDx[22], 18.000000, 21.000000);
	TextDrawAlignment(speed_TDx[22], 1);
	TextDrawColor(speed_TDx[22], 0xE93131FF);
	TextDrawBackgroundColor(speed_TDx[22], 255);
	TextDrawFont(speed_TDx[22], 4);
	TextDrawSetProportional(speed_TDx[22], 0);
	TextDrawSetShadow(speed_TDx[22], 0);

	speed_TDx[23] = TextDrawCreate(596.985961-80.0, 348.299682-65.0, "ld_beat:chit");
	TextDrawLetterSize(speed_TDx[23], 0.000000, 0.000000);
	TextDrawTextSize(speed_TDx[23], 11.000000, 13.000000);
	TextDrawAlignment(speed_TDx[23], 1);
	TextDrawColor(speed_TDx[23], 0xE93131FF);
	TextDrawBackgroundColor(speed_TDx[23], 255);
	TextDrawFont(speed_TDx[23], 4);
	TextDrawSetProportional(speed_TDx[23], 0);
	TextDrawSetShadow(speed_TDx[23], 0);

	speed_TDx[24] = TextDrawCreate(593.557861-80.0, 379.019653-65.0, "ld_beat:chit");
	TextDrawLetterSize(speed_TDx[24], 0.000000, 0.000000);
	TextDrawTextSize(speed_TDx[24], 8.000000, 10.000000);
	TextDrawAlignment(speed_TDx[24], 1);
	TextDrawColor(speed_TDx[24], 0xE93131FF);
	TextDrawBackgroundColor(speed_TDx[24], 255);
	TextDrawFont(speed_TDx[24], 4);
	TextDrawSetProportional(speed_TDx[24], 0);
	TextDrawSetShadow(speed_TDx[24], 0);

	speed_TDx[25] = TextDrawCreate(566.196044-80.0, 385.466857-65.0, "ld_beat:chit");
	TextDrawLetterSize(speed_TDx[25], 0.000000, 0.000000);
	TextDrawTextSize(speed_TDx[25], 11.000000, 19.000000);
	TextDrawAlignment(speed_TDx[25], 1);
	TextDrawColor(speed_TDx[25], 336860415);
	TextDrawBackgroundColor(speed_TDx[25], 255);
	TextDrawFont(speed_TDx[25], 4);
	TextDrawSetProportional(speed_TDx[25], 0);
	TextDrawSetShadow(speed_TDx[25], 0);

	speed_TDx[26] = TextDrawCreate(504.310668-80.0, 385.246765-65.0, "ld_beat:chit");
	TextDrawLetterSize(speed_TDx[26], 0.000000, 0.000000);
	TextDrawTextSize(speed_TDx[26], 11.000000, 19.000000);
	TextDrawAlignment(speed_TDx[26], 1);
	TextDrawColor(speed_TDx[26], 336860415);
	TextDrawBackgroundColor(speed_TDx[26], 255);
	TextDrawFont(speed_TDx[26], 4);
	TextDrawSetProportional(speed_TDx[26], 0);
	TextDrawSetShadow(speed_TDx[26], 0);
	return true;
}
stock loadSpeedomter(playerid, vehicleid, i=-1) {
	if IsPlayerConnectedOnPC(playerid) *then {
		SpeedometerPTD[playerid][0] = CreatePlayerTextDraw(playerid, 535.9739, 367.9167, "no fuel"); 
		SpeedometerPTD[playerid][1] = CreatePlayerTextDraw(playerid, 516.0000, 351.0000, "LOCK"); 
		SpeedometerPTD[playerid][2] = CreatePlayerTextDraw(playerid, 538.0000, 351.0000, "ENGINE"); 
		SpeedometerPTD[playerid][3] = CreatePlayerTextDraw(playerid, 566.0000, 351.0000, "LIGHT"); 
		SpeedometerPTD[playerid][4] = CreatePlayerTextDraw(playerid, 597.0000, 364.0000, "0"); 
		SpeedometerPTD[playerid][5] = CreatePlayerTextDraw(playerid, 518.0017, 379.0000, "LD_SPAC:white"); 
		SpeedometerPTD[playerid][6] = CreatePlayerTextDraw(playerid, 518.0017, 379.0000, "LD_SPAC:white");
		SpeedometerPTD[playerid][7] = CreatePlayerTextDraw(playerid, 541.070190, 390.106536, "000000.00 km");
		while(++i<25) TextDrawShowForPlayer(playerid, speed_TD[i]);
	} else {
		SpeedometerPTD[playerid][0] = CreatePlayerTextDraw(playerid, 535.9739-80.0, 367.9167-65.0, "no fuel"); 
		SpeedometerPTD[playerid][1] = CreatePlayerTextDraw(playerid, 516.0000-80.0, 351.0000-65.0, "LOCK"); 
		SpeedometerPTD[playerid][2] = CreatePlayerTextDraw(playerid, 538.0000-80.0, 351.0000-65.0, "ENGINE"); 
		SpeedometerPTD[playerid][3] = CreatePlayerTextDraw(playerid, 566.0000-80.0, 351.0000-65.0, "LIGHT"); 
		SpeedometerPTD[playerid][4] = CreatePlayerTextDraw(playerid, 597.0000-80.0, 364.0000-65.0, "0"); 
		SpeedometerPTD[playerid][5] = CreatePlayerTextDraw(playerid, 518.0017-80.0, 379.0000-65.0, "LD_SPAC:white"); 
		SpeedometerPTD[playerid][6] = CreatePlayerTextDraw(playerid, 518.0017-80.0, 379.0000-65.0, "LD_SPAC:white");
		SpeedometerPTD[playerid][7] = CreatePlayerTextDraw(playerid, 541.070190-80.0, 390.106536-65.0, "000000.00 km");
		while(++i<25) TextDrawShowForPlayer(playerid, speed_TDx[i]); 
	} i=-1;

	new engine, lights, alarm, doors, bonnet, boot, objective;
	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);

	PlayerTextDrawColor(playerid, SpeedometerPTD[playerid][1], !doors ? -1 : -459199745);
	PlayerTextDrawColor(playerid, SpeedometerPTD[playerid][2], !engine ? -1 : -459199745);
	PlayerTextDrawColor(playerid, SpeedometerPTD[playerid][3], !lights ? -1 : -459199745);

	PlayerTextDrawLetterSize(playerid, SpeedometerPTD[playerid][0], 0.1151, 1.0808);
	PlayerTextDrawAlignment(playerid, SpeedometerPTD[playerid][0], 1);
	PlayerTextDrawColor(playerid, SpeedometerPTD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, SpeedometerPTD[playerid][0], 255);
	PlayerTextDrawFont(playerid, SpeedometerPTD[playerid][0], 2);
	PlayerTextDrawSetProportional(playerid, SpeedometerPTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, SpeedometerPTD[playerid][0], 0);

	PlayerTextDrawLetterSize(playerid, SpeedometerPTD[playerid][1], 0.1802, 1.1916);
	PlayerTextDrawAlignment(playerid, SpeedometerPTD[playerid][1], 1);
	PlayerTextDrawBackgroundColor(playerid, SpeedometerPTD[playerid][1], 255);
	PlayerTextDrawFont(playerid, SpeedometerPTD[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, SpeedometerPTD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, SpeedometerPTD[playerid][1], 0);

	PlayerTextDrawLetterSize(playerid, SpeedometerPTD[playerid][2], 0.1802, 1.1916);
	PlayerTextDrawAlignment(playerid, SpeedometerPTD[playerid][2], 1);
	PlayerTextDrawBackgroundColor(playerid, SpeedometerPTD[playerid][2], 255);
	PlayerTextDrawFont(playerid, SpeedometerPTD[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, SpeedometerPTD[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, SpeedometerPTD[playerid][2], 0);

	PlayerTextDrawLetterSize(playerid, SpeedometerPTD[playerid][3], 0.1802, 1.1916);
	PlayerTextDrawAlignment(playerid, SpeedometerPTD[playerid][3], 1);
	PlayerTextDrawBackgroundColor(playerid, SpeedometerPTD[playerid][3], 255);
	PlayerTextDrawFont(playerid, SpeedometerPTD[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, SpeedometerPTD[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, SpeedometerPTD[playerid][3], 0);

	PlayerTextDrawLetterSize(playerid, SpeedometerPTD[playerid][4], 0.2734, 1.5008);
	PlayerTextDrawTextSize(playerid, SpeedometerPTD[playerid][4], -22.0000, 0.0000);
	PlayerTextDrawAlignment(playerid, SpeedometerPTD[playerid][4], 1);
	PlayerTextDrawColor(playerid, SpeedometerPTD[playerid][4], -1);
	PlayerTextDrawSetOutline(playerid, SpeedometerPTD[playerid][4], 1);
	PlayerTextDrawBackgroundColor(playerid, SpeedometerPTD[playerid][4], 134);
	PlayerTextDrawFont(playerid, SpeedometerPTD[playerid][4], 3);
	PlayerTextDrawSetProportional(playerid, SpeedometerPTD[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, SpeedometerPTD[playerid][4], 0);

	PlayerTextDrawTextSize(playerid, SpeedometerPTD[playerid][5], 57.0000, 3.0000);
	PlayerTextDrawAlignment(playerid, SpeedometerPTD[playerid][5], 1);
	PlayerTextDrawBackgroundColor(playerid, SpeedometerPTD[playerid][5], 255);
	PlayerTextDrawFont(playerid, SpeedometerPTD[playerid][5], 4);
	PlayerTextDrawSetProportional(playerid, SpeedometerPTD[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, SpeedometerPTD[playerid][5], 0);

	PlayerTextDrawTextSize(playerid, SpeedometerPTD[playerid][6], 28.5000, 3.0000);
	PlayerTextDrawAlignment(playerid, SpeedometerPTD[playerid][6], 1);
	PlayerTextDrawBackgroundColor(playerid, SpeedometerPTD[playerid][6], 255);
	PlayerTextDrawFont(playerid, SpeedometerPTD[playerid][6], 4);
	PlayerTextDrawSetProportional(playerid, SpeedometerPTD[playerid][6], 0);
	PlayerTextDrawSetShadow(playerid, SpeedometerPTD[playerid][6], 0);

	new idd=FindSpawnID(vehicleid);
	if !VehForNoFuel(GetVehicleModel(vehicleid)) *then
		format(gString, 128, "Fuel %d", Fuel[vehicleid]),
		PlayerTextDrawSetString(playerid, SpeedometerPTD[playerid][0], gString),
		PlayerTextDrawColor(playerid, SpeedometerPTD[playerid][5], 0x9E5F23FF),
		PlayerTextDrawColor(playerid, SpeedometerPTD[playerid][6], -124373249),
		PlayerTextDrawTextSize(playerid, SpeedometerPTD[playerid][6], percentage(Fuel[vehicleid], 100.0) * 0.57, 3.0000);

	else 
		PlayerTextDrawColor(playerid, SpeedometerPTD[playerid][5], 0x717171FF),
		PlayerTextDrawColor(playerid, SpeedometerPTD[playerid][6], 0x4A4A4AFF);

	PlayerTextDrawLetterSize(playerid, SpeedometerPTD[playerid][7], 0.189333, 1.049600);
	PlayerTextDrawTextSize(playerid, SpeedometerPTD[playerid][7], -0.389999, 60.000000);
	PlayerTextDrawAlignment(playerid, SpeedometerPTD[playerid][7], 2);
	PlayerTextDrawColor(playerid, SpeedometerPTD[playerid][7], -1);
	PlayerTextDrawUseBox(playerid, SpeedometerPTD[playerid][7], 1);
	PlayerTextDrawBoxColor(playerid, SpeedometerPTD[playerid][7], 336860415);
	PlayerTextDrawSetShadow(playerid, SpeedometerPTD[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, SpeedometerPTD[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, SpeedometerPTD[playerid][7], 255);
	PlayerTextDrawFont(playerid, SpeedometerPTD[playerid][7], 2);
	PlayerTextDrawSetProportional(playerid, SpeedometerPTD[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, SpeedometerPTD[playerid][7], 0);

	while(++i<7) PlayerTextDrawShow(playerid, SpeedometerPTD[playerid][i]);

	if idd != -1 *then {
		if IsPlayerConnectedOnPC(playerid) *then TextDrawShowForPlayer(playerid,speed_TD[25]), TextDrawShowForPlayer(playerid,speed_TD[26]);
		else TextDrawShowForPlayer(playerid,speed_TDx[25]), TextDrawShowForPlayer(playerid,speed_TDx[26]);
		
		format(gString, 60, "%06.2f km", CarInfo[idd][cOdometer]);
		PlayerTextDrawSetString(playerid,SpeedometerPTD[playerid][7],gString);
		PlayerTextDrawShow(playerid,SpeedometerPTD[playerid][7]);
	}
	return true;
}
stock hideSpeedomter(playerid, i=-1) {
	while(++i<8) {
		if SpeedometerPTD[playerid][i] == PlayerText:INVALID_TEXT_DRAW *then continue;
		PlayerTextDrawDestroy(playerid, SpeedometerPTD[playerid][i]);
		SpeedometerPTD[playerid][i] = PlayerText:INVALID_TEXT_DRAW;
	}

	i=-1;
	if IsPlayerConnectedOnPC(playerid) *then {
		while(++i<29) TextDrawHideForPlayer(playerid, speed_TD[i]);
	} else {
		while(++i<29) TextDrawHideForPlayer(playerid, speed_TDx[i]);
	}
	return true;
}


stock VehForNoFuel(model) {
	switch model do {
		case 481, 509, 510, 417, 425, 447, 460, 464, 465, 469, 476, 487, 488, 497, 501, 511, 512, 513, 519, 520, 548, 553, 563, 577, 592, 593, 430, 446, 452, 453, 454, 472, 473, 484, 493, 595: return true;
	}
	return false;
}


CoolDowns(playerid, id) {
	gString[0] = EOS;
	format(gString, 55, "You can't use this command for %d seconds.", (((PlayerVar[playerid][CoolDown][id]-gettime())/5)*5)+5);
	SCM(playerid, COLOR_LGREEN, gString);
	return true; }
GetCoolDowns(playerid, id) return gettime()<PlayerVar[playerid][CoolDown][id]?true:false;
SetCoolDowns(playerid, id, sec) return PlayerVar[playerid][CoolDown][id] = gettime()+sec;
OOCNews(color, const string[]) {
	foreach(new i : Player) if(PlayerInfo[i][pTog][7] && IsPlayerLogged(i)) SCM(i, color, string);
	return true; }
SetPlayerPose(playerid, x, y, z) {
	new Float: xx, Float: yy, Float: zz;
	GetPlayerPos(playerid, xx, yy, zz); SetPlayerPos(playerid, xx+x, yy+y, zz+z);
	return true; }
HashString(iteration) {
	new str[32] = {'x',...};
	str[iteration] = (EOS);
	return str;
}
IsAPlane(carid) {
	switch(GetVehicleModel(carid)) {
		case 417, 425, 447, 460, 464, 465, 469, 476, 487, 488, 497, 501, 511, 512, 513, 519, 520, 548, 553, 563, 577, 592, 593: return true; }
	return false; }
IsABoat(carid) {
	switch(GetVehicleModel(carid)) {
		case 430, 446, 452, 453, 454, 472, 473, 484, 493, 595: return true; }
	return false; }
SetPlayerFreeze(playerid, const time)
	return (TogglePlayerControllable(playerid, !fbool:time), PlayerVar[playerid][Freeze]=time),1;

save_crates(playerid) {
 	gQuery[0] = EOS;
 	mysql_format(SQL, gQuery, sizeof(gQuery), 
 	"UPDATE `users` SET `Crates`='%i|%i|%i|%i|%i|%i' WHERE `id`='%i'", 
 	PlayerInfo[playerid][pCrate][0], PlayerInfo[playerid][pCrate][1], PlayerInfo[playerid][pCrate][2], 
 	PlayerInfo[playerid][pCrate][3], PlayerInfo[playerid][pCrate][4], PlayerInfo[playerid][pCrate][5],
 	PlayerInfo[playerid][pSQLID]);
 	mysql_tquery(SQL, gQuery);
}
IsABike(carid) {
	switch(GetVehicleModel(carid)) {
		case 481, 509, 510: return true; }
	return false; }
IsABike2(vehicleid) {
	switch (GetVehicleModel(vehicleid)) {
		case 448, 461, 462, 463, 468, 471, 481, 509, 510, 521, 522, 523, 568, 571, 581, 586: return true; }
	return false; }
SetVehicleInterior(vehicleid, interior) return LinkVehicleToInterior(vehicleid, interior);
FixHour() {
	new hour, minute, second;
	gettime(hour, minute, second);
	SetWorldTime(hour + 1);
	SetWeather(10); }
LoopingAnim(playerid, const animlib[], const animname[], Float:speed, looping, lockx, locky, lockz, lp) inAnim[playerid] = gettime(), ApplyAnimation(playerid, animlib, animname, speed, looping, lockx, locky, lockz, lp);
IsPlayerFalling(playerid) {
    switch GetPlayerAnimationIndex(playerid) do {case 958..979,1130,1195,1132: return true;}
    return false; 
}

function DeAMXI(playerid) return AntiDeAMX();
AntiDeAMX() {
	new a[][] = {
 		"Unarmed (Fist)",
 		"Brass K"
 	};
	#pragma unused a
	return true;
}

function ListenThisRadio(id) {
	new x;
	foreach(new i : Player) {
		if(!IsPlayerLogged(i) || PlayerVar[i][Radio] != id) continue;
		x++;
	}
	return x;
}
PlayAudioStreamForPlayersInCar(vehicleid, const url[]) {
    foreach(new i : PlayerInVehicle[vehicleid]) PlayAudioStreamForPlayer(i,url);
    return true; }

stock StopAudioStreamForPlayersInCar(vehicleid) {
    foreach(new i : PlayerInVehicle[vehicleid]) StopAudioStreamForPlayer(i);
    return true;
}

stock _valstr(value) {
	new str[80];
	format(str, sizeof str, "%d", value);
	return str;
}

std::DistanceToPlayer(p1,p2,Float:x=0.0,Float:y=0.0,Float:z=0.0)
	return ((GetPlayerPos(p2,x,y,z)-1)+floatround(GetPlayerDistanceFromPoint(p1,x,y,z)));

LoadColision(i=-1) {
	while(++i<sizeof(coleziuni)) AreaType[CreateDynamicSphere(coleziuni[i][0], coleziuni[i][1], coleziuni[i][2], coleziuni[i][3])]=AREA_COLISION;
	return true; }

UpdateMoney(playerid) {
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `Money`='%s' WHERE `id`='%d'", valueBigInt(money[playerid]), PlayerInfo[playerid][pSQLID]);
	mysql_tquery(SQL, gQuery); }
SavePlayerBank(playerid) {
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `Bank`='%s' WHERE `id`='%d'", valueBigInt(bank[playerid]), PlayerInfo[playerid][pSQLID]);
	mysql_tquery(SQL, gQuery); }

stock MapName(paint, bool: type = false) {
	gString[0] = EOS;
	switch(type) {
		case false: {
			switch(PB_Maps[paint]) {
				case 0: gString = "rc_arena";
				case 1: gString = "farm";
				case 2: gString = "island";
				case 3: gString = "desert";
				case 4: gString = "beach";
				case 5: gString = "forest";		
			}
		}
		case true: {
			switch(paint) {
				case 0: gString = "rc_arena";
				case 1: gString = "farm";
				case 2: gString = "island";
				case 3: gString = "desert";
				case 4: gString = "beach";
				case 5: gString = "forest";		
			}

		}
	}
	return gString;
}
CalculateVote(paintid) {
	if(Iter_Count(PlayerPaint[paintid]) < 2) {
		PB_Status[paintid] = 0;
		SendPaintMessage(paintid+1, COLOR_YELLOW, "Voting was canceled because it is a single player.");
		return true;
	}

	new map;
	if(MapVotes[paintid][0] >= MapVotes[paintid][1] && MapVotes[paintid][0] >= MapVotes[paintid][2] && MapVotes[paintid][0] >= MapVotes[paintid][3] && MapVotes[paintid][0] >= MapVotes[paintid][4] && MapVotes[paintid][0] >= MapVotes[paintid][5]) map = 0;
	else if(MapVotes[paintid][1] >= MapVotes[paintid][0] && MapVotes[paintid][1] >= MapVotes[paintid][2] && MapVotes[paintid][1] >= MapVotes[paintid][3] && MapVotes[paintid][1] >= MapVotes[paintid][4] && MapVotes[paintid][1] >= MapVotes[paintid][5]) map = 1;
	else if(MapVotes[paintid][2] >= MapVotes[paintid][0] && MapVotes[paintid][2] >= MapVotes[paintid][1] && MapVotes[paintid][2] >= MapVotes[paintid][3] && MapVotes[paintid][2] >= MapVotes[paintid][4] && MapVotes[paintid][2] >= MapVotes[paintid][5]) map = 2;
	else if(MapVotes[paintid][3] >= MapVotes[paintid][0] && MapVotes[paintid][3] >= MapVotes[paintid][1] && MapVotes[paintid][3] >= MapVotes[paintid][2] && MapVotes[paintid][3] >= MapVotes[paintid][4] && MapVotes[paintid][3] >= MapVotes[paintid][5]) map = 3;
	else if(MapVotes[paintid][4] >= MapVotes[paintid][0] && MapVotes[paintid][4] >= MapVotes[paintid][1] && MapVotes[paintid][4] >= MapVotes[paintid][2] && MapVotes[paintid][4] >= MapVotes[paintid][3] && MapVotes[paintid][4] >= MapVotes[paintid][5]) map = 4;
	else if(MapVotes[paintid][5] >= MapVotes[paintid][0] && MapVotes[paintid][5] >= MapVotes[paintid][1] && MapVotes[paintid][5] >= MapVotes[paintid][2] && MapVotes[paintid][5] >= MapVotes[paintid][3] && MapVotes[paintid][5] >= MapVotes[paintid][4]) map = 5;
	
	PB_Maps[paintid] = map;
	PB_Time[paintid] = 300;
	PB_Status[paintid] = 2;
	MapVotes[paintid][0] = 0; MapVotes[paintid][1] = 0; MapVotes[paintid][2] = 0; MapVotes[paintid][3] = 0; MapVotes[paintid][4] = 0; MapVotes[paintid][5] = 0; 
	foreach(new i : PlayerPaint[paintid]) if(PaintType[i] == paintid + 1) Voted[i] = false, SpawnPlayer(i);
	return true;
}


stock ScrollBar(&Float:posY, &Float:height, Float:startY, Float:maxHeight, totalItems, pageSize, currentPage = 0) {
    new pages = (totalItems / pageSize) + ((totalItems % pageSize) ? 1 : 0); height = (maxHeight / pages);
    posY = startY; posY += (height * currentPage);
} 

std::SendPaintMessage(p, color, const string[]) {
	foreach(new i : PlayerPaint[p - 1]) SCM(i, color, string);
	return true;
}
PaintSpawn(playerid) {
    SetPlayerArmour(playerid, 0);
    SetPlayerHealth(playerid, 99);	
    new rand = random(sizeof(PaintballSpawns));
	SetPlayerInterior(playerid, 0);
	switch(PB_Maps[PaintType[playerid] - 1]) {
		case 0: {
			SetPlayerPos(playerid, PaintballSpawns[rand][0], PaintballSpawns[rand][1], PaintballSpawns[rand][2]);
			SetPlayerInterior(playerid, 10);
			SetPlayerSkin(playerid, 291);
		}
		case 1: {
			SetPlayerPos(playerid, PaintballSpawns2[rand][0], PaintballSpawns2[rand][1], PaintballSpawns2[rand][2]);
			SetPlayerWorldBounds(playerid, 93.423, -245.2354, 186.846, -175.1681);
			SetPlayerSkin(playerid, 158);
		}	
		case 2: {
			SetPlayerPos(playerid, PaintballSpawns3[rand][0], PaintballSpawns3[rand][1], PaintballSpawns3[rand][2]);
			SetPlayerWorldBounds(playerid, 1400.3, 1099.627, 2854.154, 2711.035);	
			SetPlayerSkin(playerid, 154);	
		}	
		case 3: {
			SetPlayerPos(playerid, PaintballSpawns4[rand][0], PaintballSpawns4[rand][1], PaintballSpawns4[rand][2]);
			SetPlayerWorldBounds(playerid, -712.3504, -852.4849, 1611.547, 1424.701);
			SetPlayerSkin(playerid, 146);
		}	
		case 4: {
			SetPlayerPos(playerid, PaintballSpawns5[rand][0], PaintballSpawns5[rand][1], PaintballSpawns5[rand][2]);
			SetPlayerWorldBounds(playerid, 724.0283, 408.7256, -1775.037, -1915.172);
			SetPlayerSkin(playerid, 45);	
		}	
		case 5: {
			SetPlayerPos(playerid, PaintballSpawns6[rand][0], PaintballSpawns6[rand][1], PaintballSpawns6[rand][2]);
			SetPlayerWorldBounds(playerid, -420.4035, -595.5717, -35.03363, -198.5239);
			SetPlayerSkin(playerid, 27);	
		}			
	}
	LastKillP[playerid] = 0;
	SetPlayerVirtualWorld(playerid, PaintType[playerid]);
	if(PB_Status[PaintType[playerid] - 1] < 2)
		return true;

	switch(PaintType[playerid]) {
	    case 1: {
	        GivePlayerWeapon(playerid, 24, 999); GivePlayerWeapon(playerid, 31, 999);
	        GivePlayerWeapon(playerid, 16, 1);
	    }
	    case 2: GivePlayerWeapon(playerid, 24, 999);
	}
	return true; }

stock Translate32Bit(&store_money, &more_int, const BigInt[]) {
	new value32[10], value64[10];
	switch strfind(BigInt, "-", true) do {
		case -1: {
			if(strlen(BigInt) > 9) {
				strmid(value64, BigInt, 0, strlen(BigInt)-9);
				strmid(value32, BigInt, strlen(BigInt)-9, 25);
				store_money += strval(value64);
				Add64Bit(store_money, more_int, strval(value32));
			}
			else Add64Bit(store_money, more_int, strval(BigInt));
		}
		default: {
			if(strlen(BigInt) > 10) {
				strmid(value64, BigInt, 1, strlen(BigInt)-9);
				strmid(value32, BigInt, strlen(BigInt)-9, 25);
				store_money = store_money-strval(value64) < 0 ? 0 : store_money-strval(value64);
				Add64Bit(store_money, more_int, -strval(value32));
			}
			else Add64Bit(store_money, more_int, strval(BigInt));		
		}
	}
	return true;
}
stock GetWeapon(weaponid) {
	new x[30];
	GetWeaponName(weaponid, x, 30);
	return x;
}

function InvalidWeaponid(weapon) {
	if(weapon < 1 || weapon > 46)
		return true;

	switch(weapon) {
		case 0, 19, 20, 21, 45: return true;
	}
	return false;
}

function GetTotalPlayers() return Iter_Count(Player);

function SetExamCheckpoint(playerid) {
	if(CPEx[playerid] == -1) return true;
	if(CPEx[playerid] == sizeof(DMV)-1) {
		PlayerInfo[playerid][pDriveLicense] = gettime() + (86400 * 30);
		UpdateVar(playerid, "DriveLicense", PlayerInfo[playerid][pDriveLicense]);
		SCM(playerid, COLOR_YELLOW, "Congratulations! You received the license for 30 days.");
		CancelExam(playerid);
		if(PlayerInfo[playerid][pTut] == 1) { 
			for(new i = 0; i < 20; i++) SCM(playerid, COLOR_WHITE, "");
			PlayerInfo[playerid][pTut] ++;
			UpdateVar(playerid, "Tutorial", PlayerInfo[playerid][pTut]);
			SCM(playerid, COLOR_GREY, "Aceasta e o afacere de tip 24/7.");
			SCM(playerid, COLOR_GREY, "In interiorul acestuia poti achizitiona diverse iteme precum: telefon mobil, statie walkie talkie, canistra pentru benzina.");
			SCMEx(playerid, COLOR_GREY, "Dintre toate acestea, telefonul este cel mai important item fiind singura modalitate de a comunica cu un jucator aflat la distanta prin cele doua optiuni disponibile:");
			SCM(playerid, COLOR_GREY, "Apelul telefonic: se poate efecuta tastand comanda /call urmata de numarul de telefon al jucatorului.");
			SCM(playerid, COLOR_GREY, "SMS: se poate trimite SMS catre orice jucator conectat pe server tastand comanda /number <nume jucator / id jucator> doar daca detii o carte de telefoane.");
			SCM(playerid, COLOR_GREY, "Afacerile sunt diferite de diversi jucatori de pe server. Poti achizitiona o afacere incepand cu nivel 10+.");
			TimeType[playerid]=0;
			TimeTut[playerid]=8;
			InterpolateCameraPos(playerid, 2293.788085, -84.329444, 41.093578, 2331.126708, -115.158988, 39.739253, 5000);
			InterpolateCameraLookAt(playerid, 2293.784667, -83.893676, 36.112606, 2329.412841, -111.061767, 37.442424, 5100);
			TogglePlayerControllable(playerid, false);
		}
		return true;
	}
	new x = CPEx[playerid];
	DisablePlayerRaceCheckpoint(playerid);
	if(CPEx[playerid] != sizeof(DMV)-2) SetPlayerRaceCheckpoint(playerid, 0, DMV[x][0], DMV[x][1], DMV[x][2], DMV[x+1][0], DMV[x+1][1], DMV[x+1][2], 5.0);
	else SetPlayerRaceCheckpoint(playerid, 1, DMV[x][0], DMV[x][1], DMV[x][2], 0.0, 0.0, 0.0, 5.0);
	CPEx[playerid] ++;
	return true;
}

std::ShowPlayerTutorial(playerid) {
	gString[0] = EOS;
	switch(PlayerInfo[playerid][pTut]) {
		case 0: {
			format(gString, 160, "Salut %s, bun venit pe rpg.red-zone.ro. Suntem fericiti ca faci parte din cei %d jucatori ce s-au alaturat acestui server intr-un timp asa de scrut.", GetName(playerid), GetTotalUsers());
			SCMEx(playerid, COLOR_GREY, gString);
			SCMf(playerid, COLOR_GREY, "In prezent sunt %d/%d jucatori autentificati pe server.", Iter_Count(Player), MAX_PLAYERS);
			GivePlayerCash(playerid, 500000);
			SCMEx(playerid, COLOR_GREY, "Vei urma un tutorial ce are drept scop initierea ta pe server. Timp de aproximativ 5 minute vei realiza anumite actiuni intr-un mediu separat de ceilati jucatori ai server-ului.");
    		SCM(playerid, -1, "");
    		SCM(playerid, -1, "");

    		format(gString, 128, "%s just registerd (id: %d)", GetName(playerid), PlayerInfo[playerid][pSQLID]);
    		SendAdminMessage(COLOR_LIGHTRED, gString, 1);
    		TogglePlayerControllable(playerid, false);
    		InterpolateCameraPos(playerid, 2250.802490, -28.114511, 122.238197, 2393.312744, 84.020019, 30.496503, 10000);
			InterpolateCameraLookAt(playerid, 2254.199462, -25.375640, 119.796905, 2397.060546, 87.179595, 29.511125, 10100);
    		TimeTut[playerid]=10;
    		TimeType[playerid] = 0;
    		PlayerInfo[playerid][pTut] ++;
    		return true;
		}
		case 1: {
			SCM(playerid, COLOR_ADMCMD, "Mergi la checkpoint-ul marcat de pe minimap si tasteaza </exam> pentru a obtine permisul de conducere auto.");
			SetPlayerCheckpointEx(playerid, CP_DMV, 2303.5789,-68.6851,26.4844, 2.0);
		}
		case 2: {
			SCM(playerid, COLOR_ADMCMD, "Mergi si achizitioneaza-ti un telefon din magazinul marcat pe minimap.");
			SCM(playerid, COLOR_ADMCMD, "Pentru a achizitona un telefon apasa tasta /buy langa NPC-ul din business. Un meniu iti va aparea pe ecran.");
			SetPlayerCheckpointEx(playerid, CP_STORE, 2318.8049,-88.6578,26.4844, 2.0);
		}
		case 3: {
			SCM(playerid, COLOR_ADMCMD, "Mergi si schimba-ti look-ul la afacerea de tip 'Clothing store' marcata pe minimap.");
			SCM(playerid, COLOR_ADMCMD, "Pentru a schimba skin-ul tasteaza comanda </clothes> in business. Un meniu iti va aparea pe ecran. Alege un skin.");
			SetPlayerCheckpointEx(playerid, CP_CLOTHES, 2273.6472,82.0428,26.4844, 2.0);
		}
		case 4: {
			SCM(playerid, COLOR_GREY, "Pentru a vedea actualizarile aduse modului de joc tasteaza in browser red-zone.ro/update");
			SCM(playerid, COLOR_ADMCMD, "Sfarsitul tutorialului. Spor la joc. Ai fost transferat in lumea virtuala 0.");
			PlayerInfo[playerid][pTut]++;
			UpdateVar(playerid, "Tutorial", PlayerInfo[playerid][pTut]);
			if(ServerSystem(0)) {
				new rent = RandomEx(1, SqlHouses);
				PlayerInfo[playerid][pRentroom] = HouseInfo[rent][hID];
				CheckHouse(playerid, rent);
				UpdateVar(playerid, "Rentroom", PlayerInfo[playerid][pRentroom]);
				PlayerInfo[playerid][pSpawnChange] = 1;
				UpdateVar(playerid, "SpawnChange", 1);
				SCMf(playerid, COLOR_WHITE, "Ai primit rent la casa #%d pentru a evita lagu.", HouseInfo[rent][hID]);
			}
			SetPlayerVirtualWorld(playerid, 0);
			ShowPlayerTutorial(playerid);
		}
		case 5: {
			select_carTD[playerid][0] = CreatePlayerTextDraw(playerid, 321.286682, 200.150070, "box");
			PlayerTextDrawLetterSize(playerid, select_carTD[playerid][0], 0.000000, 10.327964);
			PlayerTextDrawTextSize(playerid, select_carTD[playerid][0], 0.000000, 375.000000);
			PlayerTextDrawAlignment(playerid, select_carTD[playerid][0], 2);
			PlayerTextDrawColor(playerid, select_carTD[playerid][0], -1);
			PlayerTextDrawUseBox(playerid, select_carTD[playerid][0], 1);
			PlayerTextDrawBoxColor(playerid, select_carTD[playerid][0], -1605803909);
			PlayerTextDrawSetShadow(playerid, select_carTD[playerid][0], 0);
			PlayerTextDrawSetOutline(playerid, select_carTD[playerid][0], 0);
			PlayerTextDrawBackgroundColor(playerid, select_carTD[playerid][0], 255);
			PlayerTextDrawFont(playerid, select_carTD[playerid][0], 1);
			PlayerTextDrawSetProportional(playerid, select_carTD[playerid][0], 1);
			PlayerTextDrawSetShadow(playerid, select_carTD[playerid][0], 0);
			PlayerTextDrawShow(playerid, select_carTD[playerid][0]);

			select_carTD[playerid][1] = CreatePlayerTextDraw(playerid, 319.985229, 136.800170, "Red-zone");
			PlayerTextDrawLetterSize(playerid, select_carTD[playerid][1], 0.547584, 2.358333);
			PlayerTextDrawAlignment(playerid, select_carTD[playerid][1], 2);
			PlayerTextDrawColor(playerid, select_carTD[playerid][1], -1);
			PlayerTextDrawSetShadow(playerid, select_carTD[playerid][1], 0);
			PlayerTextDrawSetOutline(playerid, select_carTD[playerid][1], 1);
			PlayerTextDrawBackgroundColor(playerid, select_carTD[playerid][1], 95);
			PlayerTextDrawFont(playerid, select_carTD[playerid][1], 0);
			PlayerTextDrawSetProportional(playerid, select_carTD[playerid][1], 1);
			PlayerTextDrawSetShadow(playerid, select_carTD[playerid][1], 0);
			PlayerTextDrawShow(playerid, select_carTD[playerid][1]);

			select_carTD[playerid][2] = CreatePlayerTextDraw(playerid, 321.753845, 184.149917, "select temporar vehicle");
			PlayerTextDrawLetterSize(playerid, select_carTD[playerid][2], 0.217276, 1.337501);
			PlayerTextDrawAlignment(playerid, select_carTD[playerid][2], 2);
			PlayerTextDrawColor(playerid, select_carTD[playerid][2], -1);
			PlayerTextDrawSetShadow(playerid, select_carTD[playerid][2], 0);
			PlayerTextDrawSetOutline(playerid, select_carTD[playerid][2], 1);
			PlayerTextDrawBackgroundColor(playerid, select_carTD[playerid][2], 83);
			PlayerTextDrawFont(playerid, select_carTD[playerid][2], 2);
			PlayerTextDrawSetProportional(playerid, select_carTD[playerid][2], 1);
			PlayerTextDrawSetShadow(playerid, select_carTD[playerid][2], 0);
			PlayerTextDrawShow(playerid, select_carTD[playerid][2]);

			new v=-1;
			while(++v<4) {
				select_carTD[playerid][v+3] = CreatePlayerTextDraw(playerid, 135.682678 + (v * 93.35), 202.250106, "");
				PlayerTextDrawLetterSize(playerid, select_carTD[playerid][v+3], 0.000000, 0.000000);
				PlayerTextDrawTextSize(playerid, select_carTD[playerid][v+3], 90.000000, 90.000000);
				PlayerTextDrawAlignment(playerid, select_carTD[playerid][v+3], 1);
				PlayerTextDrawColor(playerid, select_carTD[playerid][v+3], -1);
				PlayerTextDrawSetShadow(playerid, select_carTD[playerid][v+3], 0);
				PlayerTextDrawSetOutline(playerid, select_carTD[playerid][v+3], 0);
				PlayerTextDrawBackgroundColor(playerid, select_carTD[playerid][v+3], -204);
				PlayerTextDrawFont(playerid, select_carTD[playerid][v+3], 5);
				PlayerTextDrawSetProportional(playerid, select_carTD[playerid][v+3], 0);
				PlayerTextDrawSetShadow(playerid, select_carTD[playerid][v+3], 0);
				PlayerTextDrawSetSelectable(playerid, select_carTD[playerid][v+3], true);
				PlayerTextID[playerid][PlayerText:select_carTD[playerid][v+3]] = v;
				PlayerTextDrawSetPreviewModel(playerid, select_carTD[playerid][v+3], temp_model[v]);
				PlayerTextDrawSetPreviewRot(playerid, select_carTD[playerid][v+3], 0.000000, 0.000000, -25.000000, 1.000000);
				PlayerTextDrawSetPreviewVehCol(playerid, select_carTD[playerid][v+3], 0, 1);
				PlayerTextDrawShow(playerid, select_carTD[playerid][v+3]);

				format(gString, 128, "%s~n~~p~left %d days..~n~~w~~h~top speed %d", GetVehicleName(temp_model[v]), exp_model[v], GetVehicleMaxSpeed(temp_model[v]));
				select_carTD[playerid][v+7] = CreatePlayerTextDraw(playerid, 179.480972 + (v*94.64), 259.466491, gString);
				PlayerTextDrawLetterSize(playerid, select_carTD[playerid][v+7], 0.182606, 1.110001);
				PlayerTextDrawAlignment(playerid, select_carTD[playerid][v+7], 2);
				PlayerTextDrawColor(playerid, select_carTD[playerid][v+7], -1);
				PlayerTextDrawSetShadow(playerid, select_carTD[playerid][v+7], 0);
				PlayerTextDrawSetOutline(playerid, select_carTD[playerid][v+7], 1);
				PlayerTextDrawBackgroundColor(playerid, select_carTD[playerid][v+7], 104);
				PlayerTextDrawFont(playerid, select_carTD[playerid][v+7], 2);
				PlayerTextDrawSetProportional(playerid, select_carTD[playerid][v+7], 1);
				PlayerTextDrawSetShadow(playerid, select_carTD[playerid][v+7], 0);
				PlayerTextDrawShow(playerid, select_carTD[playerid][v+7]);
			}
			player_selected[playerid] = 20;
			SelectTextDraw(playerid, 0xA76938FF);
		}
	}
	format(gString, 50, "Tutorial %d/4", PlayerInfo[playerid][pTut]);
	GameTextForPlayer(playerid, gString, 5000, 1);
	return true;
}

stock ShowPlayerCrate(playerid, listitem) {
	CratePTD[playerid][0] = CreatePlayerTextDraw(playerid, 287.500000, 176.000000, "");
	PlayerTextDrawLetterSize(playerid, CratePTD[playerid][0], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, CratePTD[playerid][0], 68.000000, 55.000000);
	PlayerTextDrawAlignment(playerid, CratePTD[playerid][0], 1);
	PlayerTextDrawColor(playerid, CratePTD[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, CratePTD[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, CratePTD[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, CratePTD[playerid][0], 0);
	PlayerTextDrawFont(playerid, CratePTD[playerid][0], 5);
	PlayerTextDrawSetProportional(playerid, CratePTD[playerid][0], 0);
	PlayerTextDrawSetShadow(playerid, CratePTD[playerid][0], 0);
	PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][0], 999);
	PlayerTextDrawSetPreviewRot(playerid, CratePTD[playerid][0], 0.000000, 0.000000, 0.000000, 1.000000);

	CratePTD[playerid][1] = CreatePlayerTextDraw(playerid, 321.500000, 226.312500, "press open~n~to start");
	PlayerTextDrawLetterSize(playerid, CratePTD[playerid][1], 0.202000, 1.031250);
	PlayerTextDrawAlignment(playerid, CratePTD[playerid][1], 2);
	PlayerTextDrawColor(playerid, CratePTD[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, CratePTD[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, CratePTD[playerid][1], 1);
	PlayerTextDrawBackgroundColor(playerid, CratePTD[playerid][1], 98);
	PlayerTextDrawFont(playerid, CratePTD[playerid][1], 2);
	PlayerTextDrawSetProportional(playerid, CratePTD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, CratePTD[playerid][1], 0);

	CratePTD[playerid][2] = CreatePlayerTextDraw(playerid, 232.500000, 270.937500, "");
	PlayerTextDrawLetterSize(playerid, CratePTD[playerid][2], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, CratePTD[playerid][2], 27.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, CratePTD[playerid][2], 1);
	PlayerTextDrawColor(playerid, CratePTD[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, CratePTD[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, CratePTD[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, CratePTD[playerid][2], 0);
	PlayerTextDrawFont(playerid, CratePTD[playerid][2], 5);
	PlayerTextDrawSetProportional(playerid, CratePTD[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, CratePTD[playerid][2], 0);
	PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][2], 1274);
	PlayerTextDrawSetPreviewRot(playerid, CratePTD[playerid][2], 0.000000, 0.000000, 0.000000, 1.000000);

	CratePTD[playerid][3] = CreatePlayerTextDraw(playerid, 284.000000, 270.937500, "");
	PlayerTextDrawLetterSize(playerid, CratePTD[playerid][3], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, CratePTD[playerid][3], 27.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, CratePTD[playerid][3], 1);
	PlayerTextDrawColor(playerid, CratePTD[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, CratePTD[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, CratePTD[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, CratePTD[playerid][3], 0);
	PlayerTextDrawFont(playerid, CratePTD[playerid][3], 5);
	PlayerTextDrawSetProportional(playerid, CratePTD[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, CratePTD[playerid][3], 0);
	PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][3], 1274);
	PlayerTextDrawSetPreviewRot(playerid, CratePTD[playerid][3], 0.000000, 0.000000, 0.000000, 1.000000);

	CratePTD[playerid][4] = CreatePlayerTextDraw(playerid, 334.000000, 270.937500, "");
	PlayerTextDrawLetterSize(playerid, CratePTD[playerid][4], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, CratePTD[playerid][4], 27.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, CratePTD[playerid][4], 1);
	PlayerTextDrawColor(playerid, CratePTD[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, CratePTD[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, CratePTD[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, CratePTD[playerid][4], 0);
	PlayerTextDrawFont(playerid, CratePTD[playerid][4], 5);
	PlayerTextDrawSetProportional(playerid, CratePTD[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, CratePTD[playerid][4], 0);
	PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][4], 1274);
	PlayerTextDrawSetPreviewRot(playerid, CratePTD[playerid][4], 0.000000, 0.000000, 0.000000, 1.000000);

	CratePTD[playerid][5] = CreatePlayerTextDraw(playerid, 384.000000, 270.937500, "");
	PlayerTextDrawLetterSize(playerid, CratePTD[playerid][5], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, CratePTD[playerid][5], 27.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, CratePTD[playerid][5], 1);
	PlayerTextDrawColor(playerid, CratePTD[playerid][5], -1);
	PlayerTextDrawSetShadow(playerid, CratePTD[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, CratePTD[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, CratePTD[playerid][5], 0);
	PlayerTextDrawFont(playerid, CratePTD[playerid][5], 5);
	PlayerTextDrawSetProportional(playerid, CratePTD[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, CratePTD[playerid][5], 0);
	PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][5], 1274);
	PlayerTextDrawSetPreviewRot(playerid, CratePTD[playerid][5], 0.000000, 0.000000, 0.000000, 1.000000);

	CratePTD[playerid][6] = CreatePlayerTextDraw(playerid, 246.500000, 295.000000, "MONEY");
	PlayerTextDrawLetterSize(playerid, CratePTD[playerid][6], 0.173996, 0.851872);
	PlayerTextDrawAlignment(playerid, CratePTD[playerid][6], 2);
	PlayerTextDrawColor(playerid, CratePTD[playerid][6], -1);
	PlayerTextDrawSetShadow(playerid, CratePTD[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, CratePTD[playerid][6], 1);
	PlayerTextDrawBackgroundColor(playerid, CratePTD[playerid][6], 54);
	PlayerTextDrawFont(playerid, CratePTD[playerid][6], 2);
	PlayerTextDrawSetProportional(playerid, CratePTD[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, CratePTD[playerid][6], 0);

	CratePTD[playerid][7] = CreatePlayerTextDraw(playerid, 298.000000, 294.562500, "MONEY");
	PlayerTextDrawLetterSize(playerid, CratePTD[playerid][7], 0.173996, 0.851872);
	PlayerTextDrawAlignment(playerid, CratePTD[playerid][7], 2);
	PlayerTextDrawColor(playerid, CratePTD[playerid][7], -1);
	PlayerTextDrawSetShadow(playerid, CratePTD[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, CratePTD[playerid][7], 1);
	PlayerTextDrawBackgroundColor(playerid, CratePTD[playerid][7], 54);
	PlayerTextDrawFont(playerid, CratePTD[playerid][7], 2);
	PlayerTextDrawSetProportional(playerid, CratePTD[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, CratePTD[playerid][7], 0);

	CratePTD[playerid][8] = CreatePlayerTextDraw(playerid, 348.500000, 294.125000, "MONEY");
	PlayerTextDrawLetterSize(playerid, CratePTD[playerid][8], 0.173996, 0.851872);
	PlayerTextDrawAlignment(playerid, CratePTD[playerid][8], 2);
	PlayerTextDrawColor(playerid, CratePTD[playerid][8], -1);
	PlayerTextDrawSetShadow(playerid, CratePTD[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, CratePTD[playerid][8], 1);
	PlayerTextDrawBackgroundColor(playerid, CratePTD[playerid][8], 54);
	PlayerTextDrawFont(playerid, CratePTD[playerid][8], 2);
	PlayerTextDrawSetProportional(playerid, CratePTD[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, CratePTD[playerid][8], 0);

	CratePTD[playerid][9] = CreatePlayerTextDraw(playerid, 398.000000, 293.687500, "MONEY");
	PlayerTextDrawLetterSize(playerid, CratePTD[playerid][9], 0.173996, 0.851872);
	PlayerTextDrawAlignment(playerid, CratePTD[playerid][9], 2);
	PlayerTextDrawColor(playerid, CratePTD[playerid][9], -1);
	PlayerTextDrawSetShadow(playerid, CratePTD[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, CratePTD[playerid][9], 1);
	PlayerTextDrawBackgroundColor(playerid, CratePTD[playerid][9], 54);
	PlayerTextDrawFont(playerid, CratePTD[playerid][9], 2);
	PlayerTextDrawSetProportional(playerid, CratePTD[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, CratePTD[playerid][9], 0);

	for(new i=0;i<10;i++) PlayerTextDrawShow(playerid, CratePTD[playerid][i]);
	for(new i=0;i<11;i++) TextDrawShowForPlayer(playerid, CrateTD[i]);
	SelectTextDraw(playerid, 0xE4CD5AFF);
	PlayerVar[playerid][CrateSelect] = listitem; 
	player_selected[playerid] = 13;
	listitemmm[playerid] = 1;
	UpdateCratePrize(playerid, false);
	return true;
}

UpdateCratePrize(playerid, bool:type) {
	if((type?listitemmm[playerid]+1:listitemmm[playerid]-1)+4>CrateInfo[PlayerVar[playerid][CrateSelect]][C_MAX_OBJ] || (type?listitemmm[playerid]+1:listitemmm[playerid]-1) < 0)
		return true;

	listitemmm[playerid]=type?listitemmm[playerid]+1:listitemmm[playerid]-1;
	for(new i=0;i<4;i++) {
		switch(PlayerVar[playerid][CrateSelect]) {
			case 0: {
				switch(listitemmm[playerid]+i) {
					case 0: PlayerTextDrawSetString(playerid, CratePTD[playerid][i+6], "money"), PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][i+2], 1274);
					case 1: PlayerTextDrawSetString(playerid, CratePTD[playerid][i+6], "hidden"), PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][i+2], 365);
					case 2: PlayerTextDrawSetString(playerid, CratePTD[playerid][i+6], "Skin Rare"), PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][i+2], 11745);
					case 3: PlayerTextDrawSetString(playerid, CratePTD[playerid][i+6], "Experience"), PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][i+2], 19134);
				}
				PlayerTextDrawShow(playerid, CratePTD[playerid][i+2]);
			}
			case 1: {
				switch(listitemmm[playerid]+i) {
					case 0: PlayerTextDrawSetString(playerid, CratePTD[playerid][i+6], "money"), PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][i+2], 1274);
					case 1: PlayerTextDrawSetString(playerid, CratePTD[playerid][i+6], "hidden"), PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][i+2], 365);
					case 2: PlayerTextDrawSetString(playerid, CratePTD[playerid][i+6], "Experience"), PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][i+2], 19134);
					case 3: PlayerTextDrawSetString(playerid, CratePTD[playerid][i+6], "PP"), PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][i+2], 1247);
					case 4: PlayerTextDrawSetString(playerid, CratePTD[playerid][i+6], "Neon White"), PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][i+2], 18652);
				}		
				PlayerTextDrawShow(playerid, CratePTD[playerid][i+2]);		
			}
			case 2: {
				switch(listitemmm[playerid]+i) {
					case 0: PlayerTextDrawSetString(playerid, CratePTD[playerid][i+6], "money"), PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][i+2], 1274);
					case 1: PlayerTextDrawSetString(playerid, CratePTD[playerid][i+6], "hidden"), PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][i+2], 365);
					case 2: PlayerTextDrawSetString(playerid, CratePTD[playerid][i+6], "Premium Skin"), PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][i+2], 11745);
					case 3: PlayerTextDrawSetString(playerid, CratePTD[playerid][i+6], "Experience"), PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][i+2], 19134);
					case 4: PlayerTextDrawSetString(playerid, CratePTD[playerid][i+6], "PP"), PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][i+2], 1247);
					case 5: PlayerTextDrawSetString(playerid, CratePTD[playerid][i+6], "Neon Blue"), PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][i+2], 18648);
					case 6: PlayerTextDrawSetString(playerid, CratePTD[playerid][i+6], "Hustler"), PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][i+2], 545);
				}					
				PlayerTextDrawShow(playerid, CratePTD[playerid][i+2]);
			}
		}
	}
	return true;
}

UpdateCrate(playerid) {
	new amount, x=PlayerVar[playerid][CrateSelect]; gString[0] = EOS;
	switch(x) {
		case 0: {
			switch(random(100)) {
				case 0..20: {
					amount = RandomEx(2, 5);
					format(gString, 50, "~y~%d~n~rob points", amount);
					PlayerTextDrawSetString(playerid, CratePTD[playerid][1], gString);
					PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][0], 1313);
					PlayerTextDrawShow(playerid, CratePTD[playerid][0]);	

					if(!PlayerVar[playerid][CrateTime]) {
						PlayerInfo[playerid][pRobExp] += amount;
						UpdateVar(playerid, "RobExp", PlayerInfo[playerid][pRobExp]);
						format(gString, 100, "(( {%s}%s crate {A9C4E4}- %s won %d rob. ))", CrateInfo[x][C_COLOR], CrateInfo[x][C_NAME], GetName(playerid), amount);
						ProxDetector(30, playerid, gString, COLOR_SERVER);
					}
				}
				case 21..40: {
					amount = RandomEx(25, 50);
					format(gString, 50, "~y~%d~n~experience", amount);
					PlayerTextDrawSetString(playerid, CratePTD[playerid][1], gString);
					PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][0], 1314);
					PlayerTextDrawShow(playerid, CratePTD[playerid][0]);	

					if(!PlayerVar[playerid][CrateTime]) {
						GiveExperience(playerid, amount);
						format(gString, 100, "(( {%s}%s crate {A9C4E4}- %s won %d experience. ))", CrateInfo[x][C_COLOR], CrateInfo[x][C_NAME], GetName(playerid), amount);
						ProxDetector(30, playerid, gString, COLOR_SERVER);
					}
				}
				case 41..50: {
					amount = RandomEx(1, 3);
					format(gString, 50, "~y~%d~n~premium points", amount);
					PlayerTextDrawSetString(playerid, CratePTD[playerid][1], gString);
					PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][0], 1247);
					PlayerTextDrawShow(playerid, CratePTD[playerid][0]);	

					if(!PlayerVar[playerid][CrateTime]) {
						PlayerInfo[playerid][pPremiumPoints] += amount;
						UpdateVar(playerid, "PremiumPoints", PlayerInfo[playerid][pPremiumPoints]);
						format(gString, 100, "(( {%s}%s crate {A9C4E4}- %s won %d premium points. ))", CrateInfo[x][C_COLOR], CrateInfo[x][C_NAME], GetName(playerid), amount);
						ProxDetector(30, playerid, gString, COLOR_SERVER);
					}					
				}
				case 51..75: {
					amount = RandomEx(150, 300);
					format(gString, 50, "~p~%d~n~Red points", amount);
					PlayerTextDrawSetString(playerid, CratePTD[playerid][1], gString);
					PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][0], 19131);
					PlayerTextDrawShow(playerid, CratePTD[playerid][0]);	

					if(!PlayerVar[playerid][CrateTime]) {
						PlayerInfo[playerid][pServerPoints] += amount;
						UpdateVar(playerid, "ServerPoints", PlayerInfo[playerid][pServerPoints]);
						checkBP(playerid, 14, 300, amount);
						format(gString, 100, "(( {%s}%s crate {A9C4E4}- %s won %d Red points. ))", CrateInfo[x][C_COLOR], CrateInfo[x][C_NAME], GetName(playerid), amount);
						ProxDetector(30, playerid, gString, COLOR_SERVER);
					}					
				}
				default: {
					amount = RandomEx(5000, 15000);
					format(gString, 50, "$%s~n~money", FormatNumber(amount));
					PlayerTextDrawSetString(playerid, CratePTD[playerid][1], gString);
					PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][0], 1274);
					PlayerTextDrawShow(playerid, CratePTD[playerid][0]);	
					if(!PlayerVar[playerid][CrateTime]) {
						GivePlayerCash(playerid, amount);
						format(gString, 100, "(( {%s}%s crate {A9C4E4}- %s won $%s. ))", CrateInfo[x][C_COLOR], CrateInfo[x][C_NAME], GetName(playerid), FormatNumber(amount));
						ProxDetector(30, playerid, gString, COLOR_SERVER);
					}
				}
			}		
		}
		case 1: {
			switch(random(100)) {
				case 0..30: {
					PlayerTextDrawSetString(playerid, CratePTD[playerid][1], "1x hidden Color");
					PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][0], 365);
					PlayerTextDrawShow(playerid, CratePTD[playerid][0]);	

					if(!PlayerVar[playerid][CrateTime]) {
						PlayerInfo[playerid][pHidden] ++;
						UpdateVar(playerid, "Hidden", PlayerInfo[playerid][pHidden]);
						format(gString, 100, "(( {%s}%s crate {A9C4E4}- %s won 1 hidden color. ))", CrateInfo[x][C_COLOR], CrateInfo[x][C_NAME], GetName(playerid));
						SCMTA(COLOR_SERVER, gString);
					}					
				}
				case 31..50: {
					amount = RandomEx(200, 500);
					format(gString, 50, "%d~n~experience", amount);
					PlayerTextDrawSetString(playerid, CratePTD[playerid][1], gString);
					PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][0], 19134);
					PlayerTextDrawShow(playerid, CratePTD[playerid][0]);	

					if(!PlayerVar[playerid][CrateTime]) {
						GiveExperience(playerid, amount);
						format(gString, 100, "(( {%s}%s crate {A9C4E4}- %s won %d experience. ))", CrateInfo[x][C_COLOR], CrateInfo[x][C_NAME], GetName(playerid), amount);
						SCMTA(COLOR_SERVER, gString);
					}					
				}
				case 51..60: {
					amount = RandomEx(5, 20);
					format(gString, 50, "%d~n~ premium points", amount);
					PlayerTextDrawSetString(playerid, CratePTD[playerid][1], gString);
					PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][0], 1247);
					PlayerTextDrawShow(playerid, CratePTD[playerid][0]);	

					if(!PlayerVar[playerid][CrateTime]) {
						PlayerInfo[playerid][pPremiumPoints] += amount;
						UpdateVar(playerid, "PremiumPoints", PlayerInfo[playerid][pPremiumPoints]);
						format(gString, 100, "(( {%s}%s crate {A9C4E4}- %s won %d premium points. ))", CrateInfo[x][C_COLOR], CrateInfo[x][C_NAME], GetName(playerid), amount);
						SCMTA(COLOR_SERVER, gString);
					}					
				}
				case 61..65: {
					PlayerTextDrawSetString(playerid, CratePTD[playerid][1], "1x~n~neon white");
					PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][0], 18646);
					PlayerTextDrawShow(playerid, CratePTD[playerid][0]);	
					if(!PlayerVar[playerid][CrateTime]) {
						PlayerInfo[playerid][pNeon][0] ++;
						save_neon(playerid);
						format(gString, 100, "(( {%s}%s crate {A9C4E4}- %s won 1x neon white. ))", CrateInfo[x][C_COLOR], CrateInfo[x][C_NAME], GetName(playerid));
						SCMTA(COLOR_SERVER, gString);
					}
				}
				case 66..71: {
					PlayerTextDrawSetString(playerid, CratePTD[playerid][1], "1x~n~neon yellow");
					PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][1], 18646);
					PlayerTextDrawShow(playerid, CratePTD[playerid][0]);	
					if(!PlayerVar[playerid][CrateTime]) {
						PlayerInfo[playerid][pNeon][1] ++;
						save_neon(playerid);
						format(gString, 100, "(( {%s}%s crate {A9C4E4}- %s won 1x neon yellow. ))", CrateInfo[x][C_COLOR], CrateInfo[x][C_NAME], GetName(playerid));
						SCMTA(COLOR_SERVER, gString);
					}
				}
				case 72..80: {
					amount = RandomEx(10, 30);
					format(gString, 50, "~y~%d~n~rob points", amount);
					PlayerTextDrawSetString(playerid, CratePTD[playerid][1], gString);
					PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][0], 1313);
					PlayerTextDrawShow(playerid, CratePTD[playerid][0]);	

					if(!PlayerVar[playerid][CrateTime]) {
						PlayerInfo[playerid][pRobExp] += amount;
						UpdateVar(playerid, "RobExp", PlayerInfo[playerid][pRobExp]);
						format(gString, 100, "(( {%s}%s crate {A9C4E4}- %s won %d rob. ))", CrateInfo[x][C_COLOR], CrateInfo[x][C_NAME], GetName(playerid), amount);
						SCMTA(COLOR_SERVER, gString);
					}
				}
				default: {
					amount = RandomEx(35000, 85000);
					format(gString, sizeof gString, "%s~n~money", FormatNumber(amount));
					PlayerTextDrawSetString(playerid, CratePTD[playerid][1], gString);
					PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][0], 1274);
					PlayerTextDrawShow(playerid, CratePTD[playerid][0]);	
					if(!PlayerVar[playerid][CrateTime]) {
						GivePlayerCash(playerid, amount);
						format(gString, 100, "(( {%s}%s crate {A9C4E4}- %s won $%s. ))", CrateInfo[x][C_COLOR], CrateInfo[x][C_NAME], GetName(playerid), FormatNumber(amount));
						SCMTA(COLOR_SERVER, gString);
					}
				}
			}				
		}
		case 2: {
			switch(random(100)) {
				case 0..15: {
					PlayerTextDrawSetString(playerid, CratePTD[playerid][1], "3x~n~hidden");
					PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][0], 365);
					PlayerTextDrawShow(playerid, CratePTD[playerid][0]);	
					if(!PlayerVar[playerid][CrateTime]) {
						PlayerInfo[playerid][pHidden]+=3;
						UpdateVar(playerid, "Hidden", PlayerInfo[playerid][pHidden]);
						format(gString, 100, "(( {%s}%s crate {A9C4E4}- %s won 3x hidden. ))", CrateInfo[x][C_COLOR], CrateInfo[x][C_NAME], GetName(playerid));
						SCMTA(COLOR_SERVER, gString);
					}
				}
				case 16..30: {
					PlayerTextDrawSetString(playerid, CratePTD[playerid][1], "1x~n~vehicle slot");
					PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][0], 18631);
					PlayerTextDrawShow(playerid, CratePTD[playerid][0]);	
					if(!PlayerVar[playerid][CrateTime]) {
						if(PlayerInfo[playerid][pSlot] >= MAX_PLAYER_VEHICLE) return SCM(playerid, COLOR_GREY, "Ai numarul maxim de sloturi!"), PlayerInfo[playerid][pCrate][2]++;
						PlayerInfo[playerid][pSlot]++;
						UpdateVar(playerid, "Hidden", PlayerInfo[playerid][pHidden]);
						format(gString, 100, "(( {%s}%s crate {A9C4E4}- %s won 1x vehicle slot. ))", CrateInfo[x][C_COLOR], CrateInfo[x][C_NAME], GetName(playerid));
						SCMTA(COLOR_SERVER, gString);
					}
				}
				case 31..35: {
					PlayerTextDrawSetString(playerid, CratePTD[playerid][1], "~n~NRG-500");
					PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][0], 522);
					PlayerTextDrawShow(playerid, CratePTD[playerid][0]);	

					if(!PlayerVar[playerid][CrateTime]) {
						if(GetPlayerTotalVehicle(playerid) >= GetPlayerSlot(playerid))
							return SCM(playerid, COLOR_LGREEN, "Ai primit crate-ul inapoi pentru ca nu ai un slot liber!"), PlayerInfo[playerid][pCrate][2]++;

						GiveVehicle(playerid, 522, true);
						format(gString, 100, "(( {%s}%s crate {A9C4E4}- %s won NRG-500. ))", CrateInfo[x][C_COLOR], CrateInfo[x][C_NAME], GetName(playerid));
						SCMTA(COLOR_SERVER, gString);
					}					
				}
				case 36..50: {
					PlayerTextDrawSetString(playerid, CratePTD[playerid][1], "~n~Hotknife");
					PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][0], 434);
					PlayerTextDrawShow(playerid, CratePTD[playerid][0]);	

					if(!PlayerVar[playerid][CrateTime]) {
						if(GetPlayerTotalVehicle(playerid) >= GetPlayerSlot(playerid))
							return SCM(playerid, COLOR_LGREEN, "Ai primit crate-ul inapoi pentru ca nu ai un slot liber!"), PlayerInfo[playerid][pCrate][2]++;

						GiveVehicle(playerid, 434, true);
						format(gString, 100, "(( {%s}%s crate {A9C4E4}- %s won Hotknife. ))", CrateInfo[x][C_COLOR], CrateInfo[x][C_NAME], GetName(playerid));
						SCMTA(COLOR_SERVER, gString);
					}					
				}
				case 51..70: {
					PlayerTextDrawSetString(playerid, CratePTD[playerid][1], "~n~Primo");
					PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][0], 547);
					PlayerTextDrawShow(playerid, CratePTD[playerid][0]);	

					if(!PlayerVar[playerid][CrateTime]) {
						if(GetPlayerTotalVehicle(playerid) >= GetPlayerSlot(playerid))
							return SCM(playerid, COLOR_LGREEN, "Ai primit crate-ul inapoi pentru ca nu ai un slot liber!"), PlayerInfo[playerid][pCrate][2]++;

						GiveVehicle(playerid, 547, true);
						format(gString, 100, "(( {%s}%s crate {A9C4E4}- %s won Primo. ))", CrateInfo[x][C_COLOR], CrateInfo[x][C_NAME], GetName(playerid));
						SCMTA(COLOR_SERVER, gString);
					}					
				}
				case 71: {
					PlayerTextDrawSetString(playerid, CratePTD[playerid][1], "~n~Infernus");
					PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][0], 487);
					PlayerTextDrawShow(playerid, CratePTD[playerid][0]);	

					if(!PlayerVar[playerid][CrateTime]) {
						if(GetPlayerTotalVehicle(playerid) >= GetPlayerSlot(playerid))
							return SCM(playerid, COLOR_LGREEN, "Ai primit crate-ul inapoi pentru ca nu ai un slot liber!"), PlayerInfo[playerid][pCrate][2]++;

						GiveVehicle(playerid, 411, true);
						format(gString, 100, "(( {%s}%s crate {A9C4E4}- %s won Infernus. ))", CrateInfo[x][C_COLOR], CrateInfo[x][C_NAME], GetName(playerid));
						SCMTA(COLOR_SERVER, gString);
					}					
				}
				case 72..85: {
					PlayerTextDrawSetString(playerid, CratePTD[playerid][1], "~n~Bullet");
					PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][0], 541);
					PlayerTextDrawShow(playerid, CratePTD[playerid][0]);	

					if(!PlayerVar[playerid][CrateTime]) {
						if(GetPlayerTotalVehicle(playerid) >= GetPlayerSlot(playerid))
							return SCM(playerid, COLOR_LGREEN, "Ai primit crate-ul inapoi pentru ca nu ai un slot liber!"), PlayerInfo[playerid][pCrate][2]++;

						GiveVehicle(playerid, 541, true);
						format(gString, 100, "(( {%s}%s crate {A9C4E4}- %s won Bullet. ))", CrateInfo[x][C_COLOR], CrateInfo[x][C_NAME], GetName(playerid));
						SCMTA(COLOR_SERVER, gString);
					}					
				}
				default: {
					PlayerTextDrawSetString(playerid, CratePTD[playerid][1], "~n~Perrenial");
					PlayerTextDrawSetPreviewModel(playerid, CratePTD[playerid][0], 404);
					PlayerTextDrawShow(playerid, CratePTD[playerid][0]);	

					if(!PlayerVar[playerid][CrateTime]) {
						if(GetPlayerTotalVehicle(playerid) >= GetPlayerSlot(playerid))
							return SCM(playerid, COLOR_LGREEN, "Ai primit crate-ul inapoi pentru ca nu ai un slot liber!"), PlayerInfo[playerid][pCrate][2]++;

						GiveVehicle(playerid, 404, true);
						format(gString, 100, "(( {%s}%s crate {A9C4E4}- %s won Perrenial. ))", CrateInfo[x][C_COLOR], CrateInfo[x][C_NAME], GetName(playerid));
						SCMTA(COLOR_SERVER, gString);
					}
				}
			}				
		}
	}
	return true;
}

YCMD:tutorial(playerid, params[]) {
	if(PlayerInfo[playerid][pTut] > 3)
		return true;

	switch(PlayerInfo[playerid][pTut]) {
		case 1: {
			SCM(playerid, COLOR_GREY, "Dute la checkpointu pe minimapa pentru a primi licenta de drving. Cand ajungi acolo (/exam).");
			if(CPEx[playerid] == -1) SetPlayerCheckpointEx(playerid, CP_NORMAL, 2303.5789,-68.6851,26.4844, 2.0);
		}
		case 2: {
			SCM(playerid, COLOR_GREY, "Urmatorul pas pe care trebuie sa-l faci este de a-ti lua telefon, carte de telefon si credit dintr-un 24/7.");
			SCM(playerid, COLOR_GREY, "Pentru a localiza un biz de acest tip, foloseste comanda (/gps).");
			SetPlayerCheckpointEx(playerid, CP_NORMAL, 2318.8623,-88.6583,26.4844, 2.0);
			PlayerVar[playerid][Selected][0] = true;
			PlayerVar[playerid][Selected][1] = true;
			PlayerVar[playerid][Selected][2] = true;
		}
		case 3: {
			SCM(playerid, COLOR_GREY, "Urmatorul pas pe care trebuie sa-l faci este de a-ti schimba skinul.");
			SCM(playerid, COLOR_GREY, "Pentru a localiza un biz de tip Binco, foloseste comanda (/gps).");
			SetPlayerCheckpointEx(playerid, CP_NORMAL, 2273.4978,82.0440,26.4844, 2.0);
		}
	}
	gString[0] = EOS;
	format(gString, 50, "Tutorial %d/4", PlayerInfo[playerid][pTut]);
	GameTextForPlayer(playerid, gString, 5000, 1);	
	return true;
}

stock GetMissionName(MissionID) {
	gString[0] = EOS;
	switch(MissionID) {
		case 0: gString = "Prinde peste si vinde-i";
		case 1: gString = "Omoara un player";
		case 2: gString = "Arunca-te cu parasuta dintr-un avion/elicopter";
		case 3: gString = "Viziteaza muntele chiliad";
		case 4: gString = "Viziteaza stadionul de baseball din Las Venturas";
		case 5: gString = "Localizeaza un player folosind comanda /find";
		case 6: gString = "Du-te la un clothing store si schimbati skinul";
		case 7: gString = "Pune contract pe o persona folosind comanda /contract";
		case 8: gString = "Pune un anunt la CNN folosind comanda /ad";
		case 9: gString = "Colecteaza 20 kg de gunoi";
		case 10: gString = "Livreaza 5 cutii de pizza";
		case 11: gString = "Livreaza 10 cutii de pizza";
		case 12: gString = "Colecteaza 15.000 de materiale folosind jobul Arms Dealer";
		case 13: gString = "Colecteaza 20.000 de materiale folosind jobul Arms Dealer";
		case 14: gString = "Repara masina la PNS de 3 ori";
		case 15: gString = "Repara masina la PNS de 5 ori";
		default: gString = "Invalid Misson";
	}
	return gString;
}

function GetMissionMaxValue(MissionID) {
	new x;
	switch(MissionID) {
		case 0: x = 10;
		case 9: x = 20;
		case 10: x = 5;
		case 11: x = 10;
		case 12: x = 15000;
		case 13: x = 20000;
		case 14: x = 3;
		case 15: x = 5;
		default: x = 1;
	}
	return x;
}

function CheckPlayerMission(playerid, x, give) {
	for(new m = 0; m < 3; m++) if(PlayerMission[playerid][m][1] == x && !PlayerMission[playerid][m][2]) {
		PlayerMission[playerid][m][0] += give;
		SCM(playerid, COLOR_YELLOW, " ------- ");
		GetPlayerMission(playerid, m);
		if(PlayerMission[playerid][m][0] >= GetMissionMaxValue(PlayerMission[playerid][m][1])) GiveMissionBonus(playerid, m);
	}
	Save_Missions(playerid);
	return true;
}

function GivePlayerMission(playerid) {
	for(new i = 0; i < 3; i++) {
		PlayerMission[playerid][i][0] = 0, PlayerMission[playerid][i][1] = random(16), PlayerMission[playerid][i][2] = false;
	}
	new bool:x=true;
	while(x) {
		if(PlayerMission[playerid][1][1] != PlayerMission[playerid][0][1]) break;
		PlayerMission[playerid][1][1] = random(16);
	}
	while(x) {
		if(PlayerMission[playerid][2][1] != PlayerMission[playerid][1][1]) break;
		PlayerMission[playerid][2][1] = random(16);
	}
	Save_Missions(playerid);
	UpdateVar(playerid, "DailyQuest", 1);
	return true;
}

function GiveMissionBonus(playerid, i) {
	new money = RandomEx(500, 1500), exp = RandomEx(10, 20), sv_points = RandomEx(20, 25);
	GiveExperience(playerid, exp);
	GivePlayerCash(playerid, money);
	PlayerInfo[playerid][pServerPoints] += sv_points;
	checkBP(playerid, 14, 300, sv_points);
	gString[0] = EOS;
	PlayerMission[playerid][i][2] = true;
	format(gString, 100, "Ai terminat missiunea si ai primit $%s, %d experience si %d Red points.", FormatNumber(money), exp, sv_points);
	SCM(playerid, COLOR_WHITE, gString);
	SCM(playerid, COLOR_YELLOW, " ------- ");
	checkBP(playerid, 5, 150); 
	return true;
}

function GetPlayerMission(playerid, i) {
	gString[0] = EOS;
	gString[249] = GetMissionMaxValue(PlayerMission[playerid][i][1]);
	format(gString, 100, "Mission %d: {FFFFFF}%s. Progress: %d/%d", i + 1, GetMissionName(PlayerMission[playerid][i][1]), PlayerMission[playerid][i][0] > gString[249] ? gString[249] : PlayerMission[playerid][i][0], gString[249]);
	SCM(playerid, COLOR_YELLOW, gString);
	return true;
}

Save_Missions(playerid) {
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `Missions`='%d|%d|%d|%d|%d|%d|%d|%d|%d' WHERE `id`='%d'", 
		PlayerMission[playerid][0][0], PlayerMission[playerid][0][1], PlayerMission[playerid][0][2],
		PlayerMission[playerid][1][0], PlayerMission[playerid][1][1], PlayerMission[playerid][1][2],
		PlayerMission[playerid][2][0], PlayerMission[playerid][2][1], PlayerMission[playerid][2][2],
	PlayerInfo[playerid][pSQLID]);
	mysql_tquery(SQL, gQuery, "", "");
}

std::checker(const string[],pos=-1,length=-1,bool:ax=false) {
	if(strlen(string) < 7) return false;
	length=strlen(string);
    while(++pos<length) if string[pos]>'@'&&string[pos]<'[' *then continue; else { ax=true; break; }
    if !ax *then return false;
    while(++pos<length) if string[pos]<'0'||string[pos]>'9' *then continue; else return true;
    return false;
}

std::BanPlayer(playerid, days, type, const banned[], const reason[]) {
	mysql_format(SQL, gQuery, sizeof(gQuery), "INSERT INTO `bans` (`Userid`, `Name`, `Permanent`, `Time`, `Reason`, `ByBanned`) VALUES ('%d', '%s', '%d', '%d', '%s', '%s')",
		PlayerInfo[playerid][pSQLID], PlayerInfo[playerid][pName], !days ? 1 : 0, (gettime() + (type * 86400)), reason, banned);
	mysql_tquery(SQL, gQuery, "Cache_Insert_Ban_IDD", "iiis", days, playerid, type, reason);	
	return true;
}

function Cache_Insert_Ban_IDD(days, id, type, const reason[]) {
	KickEx(id);
	switch(type) {
		case 0: format(gString, sizeof(gString), "AdmBot: %s has been permanent banned by AdmBot, reason: %s", GetName(id), reason);	
		case 1: format(gString, sizeof(gString), "AdmBot: %s was banned by AdmBot for %d days, reason: %s", GetName(id), days, reason);
		case 2: return true;
	}
	SCMTA(COLOR_LIGHTRED, gString);	
	return true;
}

stock GetSystemName(y){
	new x[30];
	switch(y) {
		case 0: x = "House spawn";
		case 1: x = "Teleport-Hack";
		case 2: x = "Teleport-To-Checkpoint";
		case 3: x = "Fly-Hack";
		case 4: x = "Speed-Hack";
		case 5: x = "AirBrake-Hack";
		case 6: x = "Rainbow system";
		case 7: x = "Speed system";
		case 8: x = "Warp to vehicle hack";
		case 9: x = "Health-Hack";
		case 10: x = "Armour-hack";
		case 11: x = "Licitatie system";
		case 12: x = "Weapon Hack";
		case 13: x = "Fake Kill";
	}
	return x;
}

function ServerSystem(SystemID) return ServerInfo_[sSystem][SystemID] ? true : false;

std::ShowStats(playerid, targetid, x=-1) {
	new job[30], house[15], biz[15];
	if(PlayerInfo[targetid][pJob] != 0) format(job, 30, JobInfo[PlayerInfo[targetid][pJob]-1][jName]);
	else job = "None";

	if(PlayerInfo[playerid][pHouse] == -1) house = "No house";
	else format(house, 15, "House %d", PlayerInfo[playerid][pHouse]);

	if(PlayerInfo[playerid][pBussines] == -1) biz = "No business";
	else format(biz, 15, "Business %d", PlayerInfo[playerid][pBussines]);

	gString[0] = EOS;
	SCM(playerid, COLOR_GM, " --- ");
	SCMf(playerid, COLOR_WHITE, "%s [%d] | Played %d hours and %d minutes | Phone: %s (number: %d, credit: $%d) | Job: %s", GetName(targetid), targetid, PlayerInfo[targetid][pPlaying] / 3600, (PlayerInfo[targetid][pPlaying] / 60) % 60, PlayerInfo[targetid][pPhone] != 0 ? ("Yes") : ("No"), PlayerInfo[targetid][pPhone], PlayerInfo[targetid][pCredit], job);
	SCMf(playerid, COLOR_GM, "Account: {FFFFFF}Level: %d (%d/%d experience) | Gender: %s | Warns: %d/3", PlayerInfo[targetid][pLevel], PlayerInfo[targetid][pExperience], MAX_PLAYER_EXPERIENCE*PlayerInfo[targetid][pLevel], !PlayerInfo[targetid][pGender] ? ("Female") : ("Male"), PlayerInfo[playerid][pWarn]);
	SCMf(playerid, COLOR_GM, "Economy: {FFFFFF}Money: $%s (cash) | $%s (bank) | %s | %s", formatBytes(money[targetid]), formatBytes(bank[targetid]), biz, house);
	SCMf(playerid, COLOR_GM, "Shop: {FFFFFF}%s | Premium Account: %s | Hidden: %d | Premium Points: %d | Red Points: %d", PlayerInfo[targetid][pVip] ? ("VIP Account") : ("Normal Account"), PlayerInfo[playerid][pPremiumAccount] ? ("Yes") : ("No"), PlayerInfo[targetid][pHidden], PlayerInfo[targetid][pPremiumPoints], PlayerInfo[playerid][pServerPoints]);
	if((x=GetClan[PlayerInfo[targetid][pClan]])!=-1) SCMf(playerid, COLOR_GM, "Clan: {FFFFFF}%s | Rank: %d ({%s}%s{FFFFFF}) | Clan warns: %d/3", ClanInfo[x][clName], PlayerInfo[targetid][pClanRank], ClanInfo[x][clColor], ClanInfo[x][clTag], PlayerInfo[targetid][pClanWarn]);
	SCMf(playerid, COLOR_GM, "Faction: {FFFFFF}%s | Faction Warns: %d/3 | Faction Punish: %d/30", PlayerInfo[targetid][pMember] != 0 ? FactionInfo_[PlayerInfo[targetid][pMember] - 1] : ("None"), PlayerInfo[targetid][pFWarn], PlayerInfo[targetid][pFP]);	
	SCMf(playerid, COLOR_GM, "Other: {FFFFFF}Rob experience %d/60 | Materials: %d | Drugs: %d | %d/%d vehicle slots used", PlayerInfo[targetid][pRobExp], PlayerInfo[targetid][pMats], PlayerInfo[targetid][pDrugs], GetPlayerTotalVehicle(targetid), PlayerInfo[targetid][pSlot]);
	SCMf(playerid, COLOR_GM, "Other: {FFFFFF}Neon [W: %d, Y: %d, G: %d, B: %d, P: %d, R: %d] | Gift Points: %d/600", PlayerInfo[targetid][pNeon][0], PlayerInfo[targetid][pNeon][1], PlayerInfo[targetid][pNeon][2], PlayerInfo[targetid][pNeon][3], PlayerInfo[targetid][pNeon][4], PlayerInfo[targetid][pNeon][5], PlayerInfo[targetid][pGiftPoints]);
	if IsAdmin(playerid, 1) *then SCMf(playerid, COLOR_GM, "Admin: {FFFFFF}Virtual World: %d | Interior: %d | SQLID: %d | AFK: %d Seconds | Near Players: %d", GetPlayerVirtualWorld(targetid), GetPlayerInterior(targetid), PlayerInfo[targetid][pSQLID], PlayerVar[targetid][AFKSeconds], Iter_Count(StreamedPlayer[targetid]));
	if IsAdmin(targetid, 1) || IsHelper(targetid, 1) *then SCMf(playerid, COLOR_GM, "%s raport: {FFFFFF}%d today points (total: %d) | %s warns: %d.", IsHelper(targetid, 1)?("Helper"):("Admin"), PlayerInfo[targetid][pSTR], PlayerInfo[targetid][pTR], IsHelper(targetid, 1)?("Helper"):("Admin"), IsHelper(targetid, 1)?PlayerInfo[targetid][pHW]:PlayerInfo[targetid][pAW]);
	SCM(playerid, COLOR_GM, " --- ");
	return true;
}
PreloadAnimLib(playerid, const animlib[]) ApplyAnimation(playerid,animlib,"Null",0.0,0,0,0,0,0);

ResetAllAnimation(playerid) {
	PreloadAnimLib(playerid,"BOMBER"); PreloadAnimLib(playerid,"RAPPING"); PreloadAnimLib(playerid,"SHOP"); PreloadAnimLib(playerid,"BEACH"); PreloadAnimLib(playerid,"SMOKING"); PreloadAnimLib(playerid,"FOOD"); PreloadAnimLib(playerid,"ON_LOOKERS"); PreloadAnimLib(playerid,"DEALER"); PreloadAnimLib(playerid,"CRACK"); PreloadAnimLib(playerid,"CARRY"); PreloadAnimLib(playerid,"COP_AMBIENT"); PreloadAnimLib(playerid,"PARK");
    PreloadAnimLib(playerid,"INT_HOUSE"); PreloadAnimLib(playerid,"PED"); PreloadAnimLib(playerid,"MISC"); PreloadAnimLib(playerid,"OTB"); PreloadAnimLib(playerid,"BD_Fire"); PreloadAnimLib(playerid,"BENCHPRESS"); PreloadAnimLib(playerid,"KISSING"); PreloadAnimLib(playerid,"BSKTBALL"); PreloadAnimLib(playerid,"MEDIC"); PreloadAnimLib(playerid,"SWORD"); PreloadAnimLib(playerid,"POLICE"); PreloadAnimLib(playerid,"SUNBATHE"); 
    PreloadAnimLib(playerid,"FAT"); PreloadAnimLib(playerid,"WUZI"); PreloadAnimLib(playerid,"SWEET"); PreloadAnimLib(playerid,"ROB_BANK"); PreloadAnimLib(playerid,"GANGS"); PreloadAnimLib(playerid,"RIOT"); PreloadAnimLib(playerid,"GYMNASIUM"); PreloadAnimLib(playerid,"CAR");
    PreloadAnimLib(playerid,"CAR_CHAT"); PreloadAnimLib(playerid,"GRAVEYARD"); PreloadAnimLib(playerid,"POOL"); PreloadAnimLib(playerid,"SPRAYCAN");
}

std::SendAdminMessage(color, const string[], level) { foreach(new i : _Player<ADMIN>) if(PlayerInfo[i][pAdmin] >= level) SCMEx(i, color, string); return true; }

function SendAdminHelperMessage(color, string[]) {
	foreach(new i : All(_Player<>)) if(IsAdmin(i,1)||IsHelper(i,1)) SCM(i,color,string);
	return true;
}

function SetVehiclePosExe(vehicleid, xx, yy, zz) {
	new Float: x, Float: y, Float: z;
	GetVehiclePos(vehicleid, x, y, z);
	SetVehiclePos(vehicleid, xx+x, yy+y, zz+z);
	return true;
}

std::UpdateVar(playerid, const varname[], amount) {
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `%e`='%i' WHERE `id`='%i'", varname, amount, PlayerInfo[playerid][pSQLID]);
	mysql_tquery(SQL, gQuery, "", "");
	return true;
}

std::UpdateVarStr(playerid, const varname[], const amount[]) {
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `%e`='%e' WHERE `id`='%i'", varname, amount, PlayerInfo[playerid][pSQLID]);
	mysql_tquery(SQL, gQuery, "", "");
	return true;
}

std::UpdateVarFloat(playerid, const varname[], Float: amount) {
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `%e`='%f' WHERE `id`='%i'", varname, amount, PlayerInfo[playerid][pSQLID]);
	mysql_tquery(SQL, gQuery, "", "");
	return true;
}

function LoockVehicles(playerid, carid) {
	new engine, lights, alarm, doors, bonnet, boot, objective;
	GetVehicleParamsEx(carid, engine, lights, alarm, doors, bonnet, boot, objective);
	doors = doors != 1 ? true : false;
	SetVehicleParamsEx(carid, engine, lights, alarm, doors, bonnet, boot, objective);	
	foreach(new i : PlayerInVehicle[carid]) {
		if(GetPlayerState(i) == PLAYER_STATE_DRIVER) {
			if(engine) PlayerTextDrawColor(playerid, SpeedometerPTD[playerid][1], -459199745);
			else PlayerTextDrawColor(playerid, SpeedometerPTD[playerid][1], -1);
			break;
		}
	}
	PlayerTextDrawShow(playerid, SpeedometerPTD[playerid][1]);
	format(gString, sizeof(gString), "~w~%s~n~%s", GetVehicleName(GetVehicleModel(carid)), doors != 1 ? ("~g~unlocked") : ("~r~locked"));
	GameTextForPlayer(playerid, gString, 5000, 3);
	PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
	return true;
}

function LockVehicle(playerid) {
	new car;

	if(IsPlayerInAnyVehicle(playerid)) car = GetPlayerVehicleID(playerid);
	else car = GetPlayerClosestVehicle(playerid);

	if(car == INVALID_VEHICLE) return true;
	if(!IsPlayerNearVehicle(playerid, car, 5) || !Iter_Contains(PlayerKeys[playerid], car)) return true;

	new engine,lights,alarm,doors,bonnet,boot,objective;
	GetVehicleParamsEx(car,engine,lights,alarm,doors,bonnet,boot,objective);
	new carid = FindSpawnID(car, false);
	doors = doors != 1 ? true : false;
	if(carid != -1) {
		CarInfo[carid][cStatus] = doors?true:false;
		gQuery[0] = EOS;
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `cars` SET `Status`='%d' WHERE `ID`='%d'", CarInfo[carid][cStatus], CarInfo[carid][cID]);
		mysql_tquery(SQL, gQuery, "", "");	
	}
	SetVehicleParamsEx(car,engine,lights,alarm, doors,bonnet,boot,objective);

	foreach(new i : PlayerInVehicle[car]) {
		if(GetPlayerState(i) == PLAYER_STATE_DRIVER) {
			if(engine) PlayerTextDrawColor(playerid, SpeedometerPTD[playerid][1], -459199745);
			else PlayerTextDrawColor(playerid, SpeedometerPTD[playerid][1], -1);
			break;
		}
	}
	format(gString, sizeof(gString), "~w~%s~n~%s", GetVehicleName(GetVehicleModel(car)), doors != 1 ? ("~g~unlocked") : ("~r~locked"));
	GameTextForPlayer(playerid, gString, 5000, 3);
	PlayerTextDrawShow(playerid, SpeedometerPTD[playerid][1]);
	PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
	return true;
}

stock GetIPP(playerid) {
	new ipp[16];
	GetPlayerIp(playerid,ipp,16);
	return ipp;
}

stock SCMEx(playerid, color, const text[]) {
	new string[300], szText1[180], szText2[180];
	if(strlen(text) > 130) {
		strmid(szText1, text, 130, 256);
		strmid(szText2, text, 0, 130);
		format(string, sizeof(string), "%s", szText2);
		SCM(playerid, color, string);
		format(string, sizeof(string), "... %s", szText1);
		SCM(playerid, color, string);
	}
	else SCM(playerid, color, text);
	return true;
}
stock SCMExx(color, const text[]) {
	new string[300], szText1[180], szText2[180];
	if(strlen(text) > 130) {
		strmid(szText1, text, 130, 256);
		strmid(szText2, text, 0, 130);
		format(string, sizeof(string), "%s", szText2);
		SendClientMessageToAll(color, string);
		format(string, sizeof(string), "... %s", szText1);
		SendClientMessageToAll(color, string);
	}
	else SendClientMessageToAll(color, text);
	return true;
}

std::IsPlayerNearVehicle(p,v,Float:r,Float:x=0.0,Float:y=0.0,Float:z=0.0)
	return bool:(GetVehiclePos(v,x,y,z)&&IsPlayerInRangeOfPoint(p,r,x,y,z));

stock Add64Bit(&ammount_store, &ammount_more, value) {
	if(!value) return true;
	new rest = 0;
	new allowed = 2000000000-ammount_more;
	if(value <= allowed) ammount_more += value;
	else ammount_more += allowed, value -= allowed, rest = value;
	if(ammount_more >= 1000000000) {
		ammount_more -= 1000000000;
		ammount_store++;
	}
	else if(ammount_store > 0 && ammount_more < 1000000000) {
		ammount_store--;
		ammount_more+= 1000000000;
	}
	if(rest > 0) {
		if(ammount_more+rest > 2000000000) allowed = 2000000000-ammount_more, ammount_more += allowed, rest -= allowed;
		else ammount_more += rest, rest = 0;
	}
	for(new i = 0; i < 3; i++) {
		if(ammount_more >= 1000000000) {
			ammount_more -= 1000000000;
			ammount_store++;
		}	
	}
	if(ammount_more < 0) ammount_more = 0;
	return true;
}

function ArataMoney(playerid, bool:type, money) {
	if(money == 0) return true;
	gString[0] = EOS;
	MoneyAd[playerid] = (MoneyTy[playerid]==type)?MoneyAd[playerid]+money:money;
	MoneyTy[playerid]=type;
	PlayerTextDrawSetString(playerid, MoneyTD, gString);
	PlayerTextDrawShow(playerid, MoneyTD);
	PlayerVar[playerid][MoneyShow] = gettime() + 5;
	return true;
}

function ClearString() return gString[0] = (EOS);

std::PlayerOfRangeToPlayer(const player, Float:range, const target, Float:x=0.0,Float:y=0.0,Float:z=0.0)
	return bool:(GetPlayerPos(target,x,y,z)&&GetPlayerDistanceFromPoint(player,x,y,z)<range);

function AdmBot(playerid, const reason[]) {
	if(IsAdmin(playerid, 6))
		return true;

	format(gString, 144, "AdmBot: %s has been kicked by AdmBot, reason: %s.", GetName(playerid), reason);
	SCMTA(COLOR_LIGHTRED, gString);
	SCMf(playerid, COLOR_SERVER, "You kicked reason %s.", reason);
	SCM(playerid, COLOR_WHITE, "Stop using cheating!");
	KickEx(playerid);
	return true;
}
function ShowCarInfo(playerid, idd) {
	format(gString, sizeof(gString), "Vehicle Model: %s (%d)\nDistance Traveled: %.0f KM\nVehicle Age: %d days\nInsurance Price: $%s\nInsurance Points: %d\nTunning Locations: Not Available\nTop speed: %d km/h\nUpgrades: %s",
		GetVehicleName(CarInfo[idd][cModel]), CarInfo[idd][cSpawned], CarInfo[idd][cOdometer], CarInfo[idd][cDays], FormatNumber(CarInfo[idd][cInsurance]), CarInfo[idd][cPoints], GetVehicleMaxSpeed(CarInfo[idd][cModel]), GetVehicleUpgrades(idd));

	ShowPlayerDialog(playerid, DIALOG_VINFO, DIALOG_STYLE_MSGBOX, "Vehicle Info", gString, "Close", "");
	return true;
}
function AddTradeItem(playerid, type, amount) {
	new tid, pid, id = PlayerVar[playerid][IsTrade], bool: VehColor = false, Models; gString[0] = EOS;
	if(PlayerVar[playerid][TradeItems] == 5) return true;
	tid = PlayerVar[playerid][TradeType] ? PlayerVar[playerid][TradeItems] + 16 : PlayerVar[playerid][TradeItems] + 11;
	pid = PlayerVar[playerid][TradeType] ? PlayerVar[playerid][TradeItems] + 5 : PlayerVar[playerid][TradeItems];		

	PlayerVar[playerid][TradeItems] ++;
	TextDrawShowForPlayer(playerid, TradeTD[tid]);
	TextDrawShowForPlayer(id, TradeTD[tid]);
	TradeObject[playerid][type] = amount;
	switch(type) {
		case 0: format(gString, 20, "$%s", FormatNumber(amount)), Models = 1212;
		case 1: Models = GetVehicleModel(CarInfo[amount][cSpawned]), format(gString, 50, "%s~n~Click on icon for info..", GetVehicleName(Models)), VehColor = true;
		case 2: format(gString, 50, "Current Skin~n~%d (%s)", amount, GetSkinType(amount)), Models = amount;			
		case 3: format(gString, 50, "House #%d", amount), Models = 1273;
		case 4: format(gString, 50, "Business #%d", amount), Models = 1239;
		case 5: format(gString, 50, "%dx Rare Voucher", amount), Models = 1581;
		case 6: format(gString, 50, "%dx Natrox Voucher", amount), Models = 1581;
		case 7: format(gString, 50, "%dx Special Voucher", amount), Models = 1581;
	}
	PlayerTextDrawSetPreviewModel(playerid, TradeIcon[playerid][pid], Models);
	PlayerTextDrawSetPreviewModel(id, TradeIcon[playerid][pid], Models);	
	if(VehColor) {
		PlayerTextDrawSetPreviewVehCol(playerid, TradeIcon[playerid][pid], CarInfo[amount][cColor][0], CarInfo[amount][cColor][1]);
		PlayerTextDrawSetPreviewVehCol(id, TradeIcon[id][pid], CarInfo[amount][cColor][0], CarInfo[amount][cColor][1]);
		PlayerTextDrawSetSelectable(playerid, TradeIcon[playerid][pid], true);
		PlayerTextDrawSetSelectable(id, TradeIcon[id][pid], true);
		PlayerTextID[playerid][PlayerText:TradeIcon[playerid][pid]] = pid;
		PlayerTextID[id][PlayerText:TradeIcon[id][pid]] = pid;
	}
	PlayerTextDrawSetString(playerid, TradeTitle[playerid][pid], gString);
	PlayerTextDrawSetString(id, TradeTitle[id][pid], gString);
	PlayerTextDrawShow(playerid, TradeTitle[playerid][pid]);	
	PlayerTextDrawShow(id, TradeTitle[id][pid]);	
	PlayerTextDrawShow(playerid, TradeIcon[playerid][pid]);	
	PlayerTextDrawShow(id, TradeIcon[id][pid]);		
	return true;
}

function HaveAirBrake(playerid) {
	switch(GetPlayerAnimationIndex(playerid)) {
		case 505, 1231, 1195, 1196, 1197, 1141, 1137, 1541, 1544: return true;
	}
	return false;
}



stock Date() {
	new x[30], hour, minute, second, year, mounth, day;
	gettime(hour, minute, second);
	getdate(year, mounth, day);
	format(x, sizeof x, "%d-%02d-%02d %02d:%02d:%02d", year, mounth, day, hour, minute, second);
	return x;
}
stock ServerColors(id) {
	new x[11];
	switch(id) {
		case 0: x = "FFFFFF";
		case 1: x = "0BA10B"; 
		case 2: x = "D1FF99";
		case 3: x = "FF3D98";
		case 4: x = "F9FF3D";
		case 5: x = "FFEF85";			
		case 6: x = "3DE5FF";			
		case 7: x = "FFAB3D";			
		case 8: x = "A13DFF";			
		case 9: x = "FFC27D";			
		case 10: x = "FFA3A3";			
		case 11: x = "C5A3FF";							
	}
	return x;
}
std::Format64Bit(ammount_store, ammount_more, const chars[] = ".", length=-1) {
	if(!ammount_store) format(gString, 15, "%d", ammount_more);
	else format(gString, 25, "%d%09d", ammount_store, ammount_more);
	length=strlen(gString);
    while((length-=3)>0) strins(gString, chars, length);
    return gString;
}
std::FormatNumber(const number, const chars[] = ".", length=-1) {
	new num[32];
	format(num,32,"%d",number),length=strlen(num);
    while((length-=3)>0) strins(num, chars, length);
    return num;
}
std::GetClosestVehicle(playerid, Float:lastd=300.0,vehicle=-1,Float:x=0.0,Float:y=0.0,Float:z=0.0,Float:dist=0.0) {
    GetPlayerPos(playerid,x,y,z);
    foreach(new i : StreamedVehicle[playerid]) if((dist=GetVehicleDistanceFromPoint(i,x,y,z))<lastd) lastd=dist,vehicle=i;
    return vehicle;
}
std::GetPlayerClosestVehicle(playerid, Float:lastd=999999999.9,vehicle=-1,Float:x=0.0,Float:y=0.0,Float:z=0.0,Float:dist=0.0) {
    GetPlayerPos(playerid,x,y,z);
    foreach(new i : PlayerKeys[playerid]) if((dist=GetVehicleDistanceFromPoint(i,x,y,z))<lastd) lastd=dist,vehicle=i;
    return vehicle;
}

stock GetName(playerid) {
	new playername[MAX_PLAYER_NAME];
	if(!PlayerVar[playerid][Acover]) format(playername, MAX_PLAYER_NAME, PlayerInfo[playerid][pName]);
	else GetPlayerName(playerid, playername, MAX_PLAYER_NAME);
	return playername;
}

stock GetNameEx(playerid) {
	new playername[MAX_PLAYER_NAME];
	GetPlayerName(playerid, playername, MAX_PLAYER_NAME);
	return playername;
}
std::IsNumeric(const string[],i=-1,j=-1) {
    j=strlen(string);
    while(++i<j) if string[i]>'/'&&string[i]<':' *then continue; else return false;
    return true;
}