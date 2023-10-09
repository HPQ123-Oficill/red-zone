// ============================= Functions ===================================== //

std::LoadPlayerCar(playerid) {
	mysql_format(SQL, gQuery, sizeof gQuery, "SELECT * FROM `cars` WHERE `Userid`='%d' LIMIT %d", PlayerInfo[playerid][pSQLID], PlayerInfo[playerid][pSlot]);
	mysql_tquery(SQL, gQuery, #check_p_cars, #iiiii, playerid, -1, -1, -1, -1);
	return true;
}
function check_p_cars(playerid,cache,i,check,idd) {
	cache=cache_num_rows();
	printf("Loading %d vehicle personals on %s", cache, GetName(playerid));
	while(++i<cache) {
		idd = Iter_Free(MyVehicles<>);

		cache_get_value_name(i, "Owner", CarInfo[idd][cOwner]);
		cache_get_value_name(i, "License", CarInfo[idd][cLicense]);
		cache_get_value_name(i, "Text", CarInfo[idd][cText]);
		cache_get_value_name(i, "VipColor", CarInfo[idd][cVipColor]);
		
		cache_get_value_name_int(i, "ID", CarInfo[idd][cID]);
		cache_get_value_name_int(i, "Userid", CarInfo[idd][cUserid]);
		cache_get_value_name_int(i, "Model", CarInfo[idd][cModel]);
		cache_get_value_name_int(i, "Left", CarInfo[idd][cLeft]);
		cache_get_value_name_int(i, "Color1", CarInfo[idd][cColor][0]);
		cache_get_value_name_int(i, "Color2", CarInfo[idd][cColor][1]);  
		cache_get_value_name_int(i, "Fuel", CarInfo[idd][cFuel]);
		cache_get_value_name_int(i, "Neon", CarInfo[idd][cNeon]);
		cache_get_value_name_float(i, "PosX", CarInfo[idd][cPos][0]);
		cache_get_value_name_float(i, "PosY", CarInfo[idd][cPos][1]);
		cache_get_value_name_float(i, "PosZ", CarInfo[idd][cPos][2]);
		cache_get_value_name_float(i, "PosR", CarInfo[idd][cPos][3]);
		cache_get_value_name_float(i, "LastPosX", CarInfo[idd][cLastPos][0]);
		cache_get_value_name_float(i, "LastPosY", CarInfo[idd][cLastPos][1]);
		cache_get_value_name_float(i, "LastPosZ", CarInfo[idd][cLastPos][2]);
		cache_get_value_name_float(i, "LastPosR", CarInfo[idd][cLastPos][3]);
		cache_get_value_name_int(i, "Paintjob", CarInfo[idd][cPaintjob]);
		cache_get_value_name_int(i, "NeonStatus", CarInfo[idd][cNeonStatus]);
		cache_get_value_name_int(i, "Virtual", CarInfo[idd][cVirtual]);
		cache_get_value_name_int(i, "Stage", CarInfo[idd][cStage]);
		cache_get_value_name_int(i, "Days", CarInfo[idd][cDays]);
		cache_get_value_name_float(i, "Health", CarInfo[idd][cHealth]);
		cache_get_value_name_float(i, "Odometer", CarInfo[idd][cOdometer]);
		cache_get_value_name_int(i, "Points", CarInfo[idd][cPoints]);
		cache_get_value_name_int(i, "Status", CarInfo[idd][cStatus]);
		cache_get_value_name_int(i, "Price", CarInfo[idd][cPrice]);
		cache_get_value_name_int(i, "Insurance", CarInfo[idd][cInsurance]);
		cache_get_value_name_int(i, "Rainbow", CarInfo[idd][cRainbow]);
		cache_get_value_name_int(i, "VipStatus", CarInfo[idd][cVipStatus]);

		cache_get_value_name_sscanf(i, Components, 	a<i>[4],  CarInfo[idd][cComponents]);
		cache_get_value_name_sscanf(i, Mod, 		a<i>[14], CarInfo[idd][cMod]);
		cache_get_value_name_sscanf(i, VipPos, 		a<f>[6],  CarInfo[idd][cVipPos]);

		CarInfo[idd][cOnline] = playerid;
		if(CarInfo[idd][cDays] >= CarInfo[idd][cLeft] && CarInfo[idd][cLeft] != 0) {
			if(Iter_Contains(MyVehicles<playerid>, idd)) RemovePlayerKey(playerid, idd);
			_query(128, "DELETE FROM `cars` WHERE `ID`='%d' LIMIT 1", CarInfo[idd][cID]);
			if(CarInfo[idd][cSpawned] != INVALID_VEHICLE) DestroyPlayerCar(idd), CarInfo[idd][cID] = 0;
		}

		CarInfo[idd][cNObj][0] = INVALID_OBJECT_ID;
		CarInfo[idd][cNObj][1] = INVALID_OBJECT_ID;
		CarInfo[idd][cObjectText] = INVALID_OBJECT_ID;
		CarInfo[idd][cTime] = -1;

		GivePlayerKey(playerid, idd);
	}
	return true;
}
YCMD:givekey(playerid, params[], help) {
	if(Iter_Count(MyVehicles<playerid>) == 0)
		return SCM(playerid, COLOR_GREY, "Nu ai masini personale.");

	if(sscanf(params, "u", params[0]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/givekey [playerid/name]");

	if(!IsPlayerConnected(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(!IsPlayerLogged(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not logged.");

	if(playerid == params[0])
		return true;

	if(!PlayerOfRangeToPlayer(playerid, 5, params[0]))
		return SCM(playerid, COLOR_GREY, "Acel player nu este langa tine.");

	if(!IsPlayerInAnyVehicle(playerid))
		return SCM(playerid, COLOR_GREY, "Nu esti intr-un vehicul.");

	new idd = GetPlayerCar(playerid);
	if(idd == -1)
		return SCM(playerid, COLOR_GREY, "Nu esti intr-un vehiucl personal.");

	if(Iter_Contains(PlayerKeys[params[0]], CarInfo[idd][cSpawned]))
		return SCM(playerid, COLOR_GREY, "I-ai dat deja cheile de la aceata masina.");

	GiveVehicleKey(params[0], CarInfo[idd][cSpawned]);
	SetVehicleDoor(CarInfo[idd][cSpawned], CarInfo[idd][cStatus]);

	ClearString();
	format(gString, 100, "I-ai oferit cheile de la masina %s (%d) lui %s.", GetVehicleName(CarInfo[idd][cModel]), CarInfo[idd][cSpawned], GetName(params[0]));
	SCM(playerid, COLOR_SERVER, gString);
	format(gString, 100, "%s ti-a oferit cheile de la masina %s.", GetName(playerid), GetVehicleName(CarInfo[idd][cModel]));
	SCM(params[0], COLOR_YELLOW, gString);
	return true;
}

function GetPlayerCar(playerid) {
	new carid = FindSpawnID(GetPlayerVehicleID(playerid), false);
	if(carid == -1) return -1;
	if(CarInfo[carid][cUserid] == PlayerInfo[playerid][pSQLID]) return carid;
	return -1;
}

function EditObjectVehicle(playerid, idd) {
	new Float: Pos[6];
	gString[0] = EOS;
	GetVehiclePos(GetPlayerVehicleID(playerid), Pos[0], Pos[1], Pos[2]);


	if(CarInfo[idd][cObjectText] != INVALID_OBJECT_ID) DestroyDynamicObject(CarInfo[idd][cObjectText]);
	CarInfo[idd][cObjectText] = CreateDynamicObject(19327, Pos[0]+CarInfo[idd][cVipPos][0], Pos[1]+CarInfo[idd][cVipPos][1], Pos[2]+CarInfo[idd][cVipPos][2], CarInfo[idd][cVipPos][3], CarInfo[idd][cVipPos][4], CarInfo[idd][cVipPos][5], 0, 0, 0);
	format(gString, sizeof(gString), "{%s}%s", CarInfo[idd][cVipColor], CarInfo[idd][cText]);
	SetDynamicObjectMaterialText(CarInfo[idd][cObjectText], 0, gString, OBJECT_MATERIAL_SIZE_256x128, "Arial", 30, 1, 0xFFFFFFFF, 0, 1);
	EditDynamicObject(playerid, CarInfo[idd][cObjectText]);
	EditObjectID[playerid] = EDIT_VIPTEXT;
	EditObjectIDe[playerid] = idd;
	return true;
}

function AttachVipText(idd) {
	if(strlen(CarInfo[idd][cText]) < 3) return true;
	if(CarInfo[idd][cVipStatus]) return true;
	gString[0] = EOS;
	if(CarInfo[idd][cObjectText] != INVALID_OBJECT_ID) DestroyDynamicObject(CarInfo[idd][cObjectText]);
	CarInfo[idd][cObjectText] = CreateDynamicObject(19327,0,0,0,0,0,0);
	format(gString, 50, "{%s}%s", CarInfo[idd][cVipColor], CarInfo[idd][cText]);
	SetDynamicObjectMaterialText(CarInfo[idd][cObjectText], 0, gString, OBJECT_MATERIAL_SIZE_256x128, "Arial", 30, 1, 0xFFFFFFFF, 0, 1);
	AttachDynamicObjectToVehicle(CarInfo[idd][cObjectText], CarInfo[idd][cSpawned], CarInfo[idd][cVipPos][0], CarInfo[idd][cVipPos][1], CarInfo[idd][cVipPos][2], CarInfo[idd][cVipPos][3], CarInfo[idd][cVipPos][4], CarInfo[idd][cVipPos][5]);
	return true;
}

RemoveNeonAttach(idd) {
	for(new i=0;i<2;i++) if(CarInfo[idd][cNObj][i] != INVALID_OBJECT_ID) DestroyDynamicObject(CarInfo[idd][cNObj][i]), CarInfo[idd][cNObj][i] = INVALID_OBJECT_ID;
}

function AttachNeon(idd) {
	if(CarInfo[idd][cSpawned] == INVALID_VEHICLE)
		return true;
	
	if(!CarInfo[idd][cNeon])
		return true;

	RemoveNeonAttach(idd);

	if(CarInfo[idd][cNeonStatus]) return true;

	if(!IsABike2(CarInfo[idd][cSpawned])) {
		for(new i=0;i<2;i++) CarInfo[idd][cNObj][i] = CreateDynamicObject(NeonObj[0][CarInfo[idd][cNeon] - 1],0,0,0,0,0,0);
		AttachDynamicObjectToVehicle(CarInfo[idd][cNObj][0], CarInfo[idd][cSpawned], -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		AttachDynamicObjectToVehicle(CarInfo[idd][cNObj][1], CarInfo[idd][cSpawned], 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
	} else {
		if(CarInfo[idd][cNObj][0] != INVALID_OBJECT_ID) DestroyDynamicMapIcon(CarInfo[idd][cNObj][0]);
		CarInfo[idd][cNObj][0] = CreateDynamicObject(NeonObj[0][CarInfo[idd][cNeon] - 1],0,0,0,0,0,0);
		AttachDynamicObjectToVehicle(CarInfo[idd][cNObj][0], CarInfo[idd][cSpawned], -0.000000, 0.000000, -0.534999, 0.000000, 0.000000, 0.000000);
	}
	return true;
}

function SetPlayerCarTime(carid) return CarInfo[carid][cTime] = (gettime() + DESPAWN_TIME);
function GetPlayerCarTime(carid) return CarInfo[carid][cTime]-gettime();

#define CheckDespawnTime(%0) \
	gettime()>=CarInfo[%0][cTime]

function GetVehicleTotalUpgrade(carid) {
	new x = 0;
	x = CarInfo[carid][cRainbow] ? x + 1 : x;
	x = strlen(CarInfo[carid][cText]) > 3 ? x + 1 : x;
	x = CarInfo[carid][cNeon] != 0 ? x + 1 : x;
	x = CarInfo[carid][cStage] ? x+1:x;
	return x;
}

stock GetVehicleUpgrades(carid) {
	gQuery[0] = EOS;
	if(CarInfo[carid][cRainbow]) strcat(gQuery, "{1aeaed}[R] ");
	if(strlen(CarInfo[carid][cText]) > 3) strcat(gQuery, "{f7ff00}[V] ");
	if(CarInfo[carid][cStage]) format(gQuery, 125, "%s{5297D5}[S: %d/4] ", gQuery, CarInfo[carid][cStage]);
	if(CarInfo[carid][cNeon]) strcat(gQuery, NeonColor[CarInfo[carid][cNeon] - 1]), strcat(gQuery, "[N]");
	return GetVehicleTotalUpgrade(carid) != 0 ? gQuery : ("none");
}


std::CheckPlayerVehicles() return Iter_Free(MyVehicles<>);
std::RemovePlayerKey(playerid, key) return Iter_Remove(MyVehicles<playerid>, key);

function CheckVehicles(carid) {
	new x = -1;
	foreach(new idd : All(MyVehicles<>)) {
		if(CarInfo[idd][cID] == carid) {
			x = idd;
			break;
		}
	}
	return x;
}

function ShowPlayerVehicle(playerid) {
	if(GetPlayerTotalVehicle(playerid) == 0) 
		return SCM(playerid, COLOR_LGREEN, "You don't own a car");

	new szDialog[100 * MAX_PLAYER_VEHICLE] = {"Vehicul\tStatus\tUpgrades\tTime despawn\n"}, x = 0; gString[0] = EOS;
	foreach(new idd : MyVehicles<playerid>) {
		new time_car[] = {"not spawned"};
		if(CarInfo[idd][cSpawned]!=INVALID_VEHICLE) {
			if(CarInfo[idd][cTime] > gettime()) format(time_car, sizeof time_car, "%02d:%02d", (CarInfo[idd][cTime] - gettime())/60, (CarInfo[idd][cTime] - gettime()) % 60);
			else time_car[0]=0, strcat(time_car, !IsVehicleOccupied(CarInfo[idd][cSpawned])?"soon":"-");
		}
		format(gString, 100, "%s\t%s\t%s\t%s\t%s\n", 
		GetVehicleName(CarInfo[idd][cModel]), 
		CarInfo[idd][cSpawned]!= 0?IsVehicleOccupied(CarInfo[idd][cSpawned])?("{F3C92E}[occupeid]"):("{0C370A}[spawned]"):("{FB0404}[despawned]"),
		GetVehicleUpgrades(idd), time_car);
		strcat(szDialog, gString);
		PlayerInfo[playerid][pCarKey][x] = idd, x++;
	}
	//if(Iter_Count(MyVehicles<playerid>) >= 3) strcat(szDialog, "Spawn all vehicles\n");
	format(gString, 30, "My vehicles: %d/%d", GetPlayerTotalVehicle(playerid), GetPlayerSlot(playerid));
	Dialog_ShowPages(playerid, DIALOG_V, DIALOG_STYLE_TABLIST_HEADERS, gString, szDialog, "Select", "Close");
	return true;
}

Dialog:DIALOG_V(playerid, response, listitem, inputtext[]) {
	if(!response) 
		return true;

	listitemm[playerid] = PlayerInfo[playerid][pCarKey][listitem];
	Dialog_Show(playerid, DIALOG_VV, DIALOG_STYLE_LIST, "Vehicle Menu", "Vehicle Info\nSpawn vehicle\nTow vehicle (last known location)\nLocate vehicle\nDebug vehicle (unstuck)\nReissue insurance\nVehicle upgrades\nDespawn Vehicle\nVIP Wheels", "Select", "Back");
	return true;
}

Dialog:DIALOG_VV(playerid, response, listitem, inputtext[]) {
	if(!response) return ShowPlayerVehicle(playerid);
	new idd = listitemm[playerid];
	switch(listitem) {
		case 0: ShowCarInfo(playerid, idd);
		case 1: {
			if(IsVehicleOccupied(CarInfo[idd][cSpawned]) > 0) return SCM(playerid, COLOR_LGREEN, "Acel vehicul este ocupat.");
			if(CarInfo[idd][cSpawned] == INVALID_VEHICLE) CreatePlayerCar(idd), SCM(playerid, COLOR_GREY, "Your car has been park location.");
			else {
				GetVehicleHealth(CarInfo[idd][cSpawned], CarInfo[idd][cHealth]);
				if(CarInfo[idd][cHealth] < 250)
					return SCM(playerid, COLOR_GREY, "Nu poti respawna masina momentan.");

				GetVehicleDamageStatus(CarInfo[idd][cSpawned], CarInfo[idd][cComponents][0], CarInfo[idd][cComponents][1], CarInfo[idd][cComponents][2], CarInfo[idd][cComponents][3]);
				SetVehicleToRespawn(CarInfo[idd][cSpawned]), SetPlayerCarTime(idd), SCM(playerid, COLOR_GREY, "Your car has been spawned.");
				SetVehicleHealth(CarInfo[idd][cSpawned], CarInfo[idd][cHealth] > 250 ? CarInfo[idd][cHealth] : 999.0);
				UpdateVehicleDamageStatus(CarInfo[idd][cSpawned], CarInfo[idd][cComponents][0], CarInfo[idd][cComponents][1], CarInfo[idd][cComponents][2], CarInfo[idd][cComponents][3]);
			}
		}
		case 2: {
			if(CarInfo[idd][cSpawned] == INVALID_VEHICLE) return CreatePlayerCar(idd);
			if(IsVehicleOccupied(CarInfo[idd][cSpawned]) > 0) return SCM(playerid, COLOR_LGREEN, "Acel vehicul este ocupat.");
			DestroyPlayerCar(idd);
			CreatePlayerCar(idd);
			SCM(playerid, COLOR_GREY, "Your car has been last known location.");
		}
		case 3: {
			if(CarInfo[idd][cSpawned] == INVALID_VEHICLE) 
				return SCM(playerid, COLOR_WHITE, "You did not spawn the vehicle.");

			if(GetVehicleVirtualWorld(CarInfo[idd][cSpawned]) != 0)
				return SCM(playerid, COLOR_GREY, "Acel vehicul nu poate fi localizat pentru ca este in alt virtual world.");

			if(HaveCheckpoint(playerid)) return ShowCancelCP(playerid);

			new Float: Pos[3];
			GetVehiclePos(CarInfo[idd][cSpawned], Pos[0], Pos[1], Pos[2]);
			SetPlayerCheckpointEx(playerid, CP_NORMAL, Pos[0], Pos[1], Pos[2], 5.0);
			format(gString, sizeof(gString), "Mergi la punctul rosu de pe minimap pentru a ajunge la masina. Distanta: %.0fm.", GetPlayerDistanceFromPoint(playerid, Pos[0], Pos[1], Pos[2]));
			SCM(playerid, COLOR_YELLOW, gString);
		}
		case 4: Dialog_Show(playerid, DIALOG_DEBUGCAR, DIALOG_STYLE_MSGBOX, "Debug vehicle", "Your vehicle will be crashing into an Las Ventruas parking", "Yes", "Back");
		case 5: {
			if(CarInfo[idd][cPoints] >= 10) 
				return SCM(playerid, COLOR_LGREEN, "You already have 10 insurance points.");

			format(gString, sizeof(gString), "buy insurance for $%s, you have %d/10 insurance points.", FormatNumber(CarInfo[idd][cInsurance]), CarInfo[idd][cPoints]);
			Dialog_Show(playerid, DIALOG_BUYPOINTS, DIALOG_STYLE_INPUT, "Buy Insurance Points", gString, "Buy", "Back");
		}
		case 6: {
			format(gString, sizeof gString, "%s\n%s\nNeon Upgrades", CarInfo[idd][cRainbow] ? ("{FF0000}You already upgraded to the rainbow") : ("Upgrade to Rainbow Vehicle - {FFFF00}200 premium points"), strlen(CarInfo[idd][cText]) > 2 ? ("{FFFFFF}Edit VIP text") : ("Upgrade to VIP Vehicle - {FFFF00}200 premium points"));
			Dialog_Show(playerid, DIALOG_VUPGRADES, DIALOG_STYLE_LIST, "Vehicle Upgrades", gString, "Select", "Back");
		}
		case 7: {
			if(CarInfo[idd][cSpawned] == INVALID_VEHICLE)
				return SCM(playerid, COLOR_GREY, "Nu este spawnat vehiculul.");

			if(IsVehicleOccupied(CarInfo[idd][cSpawned]))
				return SCM(playerid, COLOR_GREY, "Acel vehicul este ocupat.");

			if((CarInfo[idd][cTime] - gettime()) > (DESPAWN_TIME - 60))
				return SCM(playerid, COLOR_GREY, "Nu poti despawna acest vehicul in mai putin de un minut.");
			
			DestroyPlayerCar(idd);
			SCM(playerid, COLOR_WHITE, "Vehiculul a fost despawnat.");
		}
		case 8: {
			if(!PlayerInfo[playerid][pVip]) return true;
			if(CarInfo[idd][cSpawned] == INVALID_VEHICLE)
				return SCM(playerid, COLOR_GREY, "Nu este spawnat vehiculul.");

			if(!IsPlayerInVehicle(playerid, CarInfo[idd][cSpawned]))
				return SCM(playerid, COLOR_LGREEN, "Eroare: Nu esti in acel vehicul!");

			Dialog_Show(playerid, DIALOG_WHEELS, DIALOG_STYLE_LIST, "legendary Wheels", "Shadow\nCutter\nSwitch\nDollar", "Ok", "Exit");
		}
	}
	return true;
}
Dialog:DIALOG_DEBUGCAR(playerid, response, listitem, inputtext[]) {
	new idd = listitemm[playerid];

	if(!response) 
		return Dialog_Show(playerid, DIALOG_VV, DIALOG_STYLE_LIST, "Vehicle Menu", "Vehicle Info\nSpawn vehicle\nTow vehicle (last known location)\nLocate vehicle\nDebug vehicle (unstuck)\nReissue insurance\nVehicle upgrades\nDespawn Vehicle\nVIP Wheels", "Select", "Back");

	if(CarInfo[idd][cSpawned] == INVALID_VEHICLE) CreatePlayerCar(idd);
	if(IsVehicleOccupied(CarInfo[idd][cSpawned]) > 0) return bool:true;

	new x = random(sizeof(DebugVehiclePos));
	SetVehiclePos(CarInfo[idd][cSpawned], DebugVehiclePos[x][0], DebugVehiclePos[x][1], DebugVehiclePos[x][2]);
	SetVehicleZAngle(CarInfo[idd][cSpawned], DebugVehiclePos[x][3]);
	for(new i = 0; i < 4; i++) {
		CarInfo[idd][cPos][i] = DebugVehiclePos[x][i];
		CarInfo[idd][cLastPos][i] = DebugVehiclePos[x][i];
	}	
	UpdateCar(idd);
	SCM(playerid, COLOR_GREY, "[Debug Vehicle] The vehicle was parked on a parking lot in the city las Venturas.");
	return true;
}
Dialog:DIALOG_BUYPOINTS(playerid, response, listitem, inputtext[]) {
	new idd = listitemm[playerid];

	if(!response) 
		return Dialog_Show(playerid, DIALOG_VV, DIALOG_STYLE_LIST, "Vehicle Menu", "Vehicle Info\nSpawn vehicle\nTow vehicle (last known location)\nLocate vehicle\nDebug vehicle (unstuck)\nReissue insurance\nVehicle upgrades\nDespawn Vehicle\nVIP Wheels", "Select", "Back");

	if(!IsNumeric(inputtext)) return bool:true;
	if(GetPlayerCash(playerid) < CarInfo[idd][cInsurance] * strval(inputtext)) 
		return SCM(playerid, COLOR_LGREEN, "You don't have this amount of money.");

	if(CarInfo[idd][cPoints]+strval(inputtext) > 10) 
		return SCM(playerid, COLOR_GREY, "You have too many insurance points maximum 10.");

	GivePlayerCash(playerid, -CarInfo[idd][cInsurance] * strval(inputtext));
	CarInfo[idd][cPoints] += strval(inputtext);

	format(gString, sizeof(gString), "(-) You paid $%s for %d insurance points.", FormatNumber(CarInfo[idd][cInsurance] * strval(inputtext)), strval(inputtext));
	SCM(playerid, COLOR_GREEN3, gString);
	return true;
}
Dialog:DIALOG_VUPGRADES(playerid, response, listitem, inputtext[]) {
	if(!response) 
		return Dialog_Show(playerid, DIALOG_VV, DIALOG_STYLE_LIST, "Vehicle Menu", "Vehicle Info\nSpawn vehicle\nTow vehicle (last known location)\nLocate vehicle\nDebug vehicle (unstuck)\nReissue insurance\nVehicle upgrades\nDespawn Vehicle\nVIP Wheels", "Select", "Back");
	
	new idd = listitemm[playerid];

	switch(listitem) {
		case 0: {
			if(CarInfo[idd][cRainbow]) 
				return SCM(playerid, COLOR_GREY, "It's already a rainbow.");

			Dialog_Show(playerid, DIALOG_RAINBOW, DIALOG_STYLE_MSGBOX, "Upgrade to rainbow:", "You are sure you want to upgrade your vehicle to the rainbow costs 200 premium points.", "Yes", "Back");		
		}
		case 1: {
			if(strlen(CarInfo[idd][cText]) < 3) 
				return Dialog_Show(playerid, DIALOG_VIP, DIALOG_STYLE_MSGBOX, "Upgrade to VIP:", "You are sure you want to upgrade your vehicle to the VIP costs 200 premium points.", "Yes", "Back");					

			format(gString, sizeof(gString), "Type\tAmount\nVip text color\t%s\nEdit vip pos\nEdit vip name\t{%s}%s\nVip status\t%s", CarInfo[idd][cVipColor], CarInfo[idd][cVipColor], CarInfo[idd][cText], CarInfo[idd][cVipStatus] ? ("{FFFFFF}Disabled") : ("{FFFF00}Enabled"));
			Dialog_Show(playerid, DIALOG_EDITVIP, DIALOG_STYLE_TABLIST_HEADERS, "Edit VIP text:", gString, "Select", "Close");
		}
		case 2: {
			if(IsAPlane(CarInfo[idd][cSpawned]) || IsABike(CarInfo[idd][cSpawned]) || IsABoat(CarInfo[idd][cSpawned]))
				return SCM(playerid, COLOR_GREY, "Nu poti pune neon pe acest vehicul.");

			new szString[200];
			strcat(szString, "Option\tAmount\n");
			for(new i = 0; i < 6; i++) {
				format(gString, 30, "%s%s Neon\t%d\n", NeonColor[i], Neon[i], PlayerInfo[playerid][pNeon][i]);
				strcat(szString, gString);
			}
			if(CarInfo[idd][cNeon]!=0) strcat(szString, !CarInfo[idd][cNeonStatus]?("Neon Status: {00FF00}Enabled"):("Neon Status: {FF0000}Disabled"));
			Dialog_Show(playerid, DIALOG_NEON, DIALOG_STYLE_TABLIST_HEADERS, "Neon Upgrade", szString, "Select", "Close");
		}
	}
	return true;
}
Dialog:DIALOG_VIP(playerid, response, listitem, inputtext[]) {
	new idd = listitemm[playerid];
	if(!response) return Dialog_ShowEx(playerid, DIALOG_VUPGRADES, DIALOG_STYLE_LIST, "Vehicle Upgrades", "%s\n%s", "Select", "Back", CarInfo[idd][cRainbow] ? ("{FF0000}You already upgraded to the rainbow") : ("{FFFFFF}Upgrade to Rainbow Vehicle - {FFFF00}200 premium points"), strlen(CarInfo[idd][cText]) > 3 ? ("{FFFFFF}Edit VIP text") : ("{FFFFFF}Upgrade to VIP Vehicle - {FFFF00}200 premium points"));

	if(PlayerInfo[playerid][pPremiumPoints] < 200)
		return SCM(playerid, COLOR_LGREEN, "You need 200 premium points to upgrade your VIP.");

	PlayerInfo[playerid][pPremiumPoints] -= 200;
	UpdateVar(playerid, "PremiumPoints", PlayerInfo[playerid][pPremiumPoints]);

	SCM(playerid, COLOR_YELLOW, "Congratulations! You upgraded your VIP vehicle for 200 premium points.");
	SCM(playerid, COLOR_WHITE, "To edit text: /v > upgrade vehicles > edit vip.");

	strmid(CarInfo[idd][cText], PlayerInfo[playerid][pName], 0, 24);
	update.gQuery("cars", "text", CarInfo[idd][cText], "ID", CarInfo[idd][cID]);

	array_set:<Float>CarInfo[idd][cVipPos] => [0.0, 6];
	array_set:<string>CarInfo[idd][cVipColor] => ['F', 6];
	
	AttachVipText(idd);
	return true;
}

Dialog:DIALOG_RAINBOW(playerid, response, listitem, inputtext[]) {
	new idd = listitemm[playerid];
	if(!response) 
		return Dialog_ShowEx(playerid, DIALOG_VUPGRADES, DIALOG_STYLE_LIST, "Vehicle Upgrades", "%s\n%s", "Select", "Back", CarInfo[idd][cRainbow] ? ("{FF0000}You already upgraded to the rainbow") : ("Upgrade to Rainbow Vehicle - {FFFF00}200 premium points"), strlen(CarInfo[idd][cText]) > 3 ? ("{FFFFFF}Edit VIP text") : ("Upgrade to VIP Vehicle - {FFFF00}200 premium points"));

	if(CarInfo[idd][cRainbow])
		return SCM(playerid, COLOR_LGREEN, "It's already a rainbow.");

	if(PlayerInfo[playerid][pPremiumPoints] < 200)
		return SCM(playerid, COLOR_LGREEN, "You need 200 premium points to upgrade your rainbow.");

	PlayerInfo[playerid][pPremiumPoints] -= 200;
	UpdateVar(playerid, "PremiumPoints", PlayerInfo[playerid][pPremiumPoints]);

	CarInfo[idd][cRainbow] = true;

	SCM(playerid, COLOR_YELLOW, "Congratulations! You upgraded your rainbow vehicle for 200 premium points.");
	SCM(playerid, COLOR_WHITE, "To activate rainbow you have the command: /rainbowspeed <1/2/3>.");

	update.gQuery("cars", "Rainbow", CarInfo[idd][cRainbow], "ID", CarInfo[idd][cID]);
	return true;
}
Dialog:DIALOG_VIPCOLOR(playerid, response, listitem, inputtext[]) {
	new idd = listitemm[playerid];
	if(!response) return Dialog_ShowEx(playerid, DIALOG_EDITVIP, DIALOG_STYLE_TABLIST_HEADERS, "Edit VIP text:", "Type\tAmount\nVip text color\t%s\nEdit vip pos\nEdit vip name\t{%s}%s\nVip status\t%s", "Select", "Close", CarInfo[idd][cVipColor], CarInfo[idd][cVipColor], CarInfo[idd][cText], CarInfo[idd][cVipStatus] ? ("{FFFFFF}Disabled") : ("{FF0000}Enabled"));

	if(EditObjectID[playerid] == EDIT_VIPTEXT)
		return SCM(playerid, COLOR_WHITE, "Nu poti folosi aceasta functie in timp ce editezi.");

	if(strlen(inputtext) < 6 || strlen(inputtext) > 6) 
		return SCM(playerid, COLOR_GREY, "Invalid color code.");

	format(CarInfo[idd][cVipColor], 10, inputtext);
	SCMf(playerid, COLOR_PINK, "The new color vip is: {%s}%s", inputtext, CarInfo[idd][cText]);
	AttachVipText(idd);

	update.gQuery("cars", "VipColor", CarInfo[idd][cVipColor], "ID", CarInfo[idd][cID]);
	return true;
}
Dialog:DIALOG_VIPNAME(playerid, response, listitem, inputtext[]) {
	new idd = listitemm[playerid];
	if(!response) return Dialog_ShowEx(playerid, DIALOG_EDITVIP, DIALOG_STYLE_TABLIST_HEADERS, "Edit VIP text:", "Type\tAmount\nVip text color\t%s\nEdit vip pos\nEdit vip name\t{%s}%s\nVip status\t%s", "Select", "Close", CarInfo[idd][cVipColor], CarInfo[idd][cVipColor], CarInfo[idd][cText], CarInfo[idd][cVipStatus] ? ("{000000}Disabled") : ("{FFFFFF}Enabled"));

	if(EditObjectID[playerid] == EDIT_VIPTEXT)
		return SCM(playerid, COLOR_WHITE, "Nu poti folosi aceasta functie in timp ce editezi.");

	if(strlen(inputtext) < 3 || strlen(inputtext) > 30) 
		return SCM(playerid, COLOR_GREY, "Invalid VIP name.");

	mysql_escape_string(inputtext, CarInfo[idd][cText]);
	AttachVipText(idd);

	update.gQuery("cars", "Text", CarInfo[idd][cText], "ID", CarInfo[idd][cID]);
	SCMf(playerid, COLOR_PINK, "The new vip name is: {%s}%s", CarInfo[idd][cVipColor], inputtext);
	return true;
}
Dialog:DIALOG_NEON(playerid, response, listitem, inputtext[]) {
	if(!response)
		return bool:true;

	new idd =listitemm[playerid];
	if(listitem<6) {
		if(PlayerInfo[playerid][pNeon][listitem] < 1)
			return SCM(playerid, COLOR_LGREEN, "Nu ai un neon de acest tip.");

		listitemmm[playerid] = listitem;

		if(CarInfo[idd][cNeon] != 0) SCM(playerid, COLOR_RED, "[Warning]{FFFFFF} Ai deja un neon pus pe aceasta masina, daca vei pune altu vei pierde pe cel curent.");
		format(gString, 100, "{C3C3C3}Esti sigur ca vrei sa pui acest %s%s Neon{C3C3C3} pe masina %s?", NeonColor[listitem], Neon[listitem], GetVehicleName(CarInfo[listitemm[playerid]][cModel]));
		Dialog_Show(playerid, DIALOG_FNEON, DIALOG_STYLE_MSGBOX, "Confirm Neon:", gString, "Continue", "Close");
	} else {
		CarInfo[idd][cNeonStatus] = CarInfo[idd][cNeonStatus] ? false : true;
		switch(CarInfo[idd][cNeonStatus]) {
			case true: for(new i = 0; i < 2; i++) if(CarInfo[idd][cNObj][i] != INVALID_OBJECT_ID) DestroyDynamicObject(CarInfo[idd][cNObj][i]), CarInfo[idd][cNObj][i] = INVALID_OBJECT_ID;
			case false: AttachNeon(idd), Streamer_Update(playerid);
		}
		update.gQuery("cars", "NeonStatus", CarInfo[idd][cNeonStatus], "ID", CarInfo[idd][cID]);
		SCM(playerid, COLOR_GREY, !CarInfo[idd][cNeonStatus] ? "Ai activat neoanele." : "Ai dezactivat neoanele.");
	}
	return true;
}
Dialog:DIALOG_FNEON(playerid, response, listitem, inputtext[]) {
	if(!response)
		return bool:true;

	new idd = listitemm[playerid];
	listitem = listitemmm[playerid];
	CarInfo[idd][cNeon] = (listitem + 1);
	PlayerInfo[playerid][pNeon][listitem] --;
	format(gString, 100, "{ff0000}[Neon System] {FFFFFF}Ti-ai pus %s Neon pe masina %s.", Neon[listitem], GetVehicleName(CarInfo[idd][cModel]));
	SCM(playerid, COLOR_WHITE, gString);
	if(!CarInfo[idd][cNeonStatus]) {
		AttachNeon(idd);
		Streamer_Update(playerid);
	}
	save_neon(playerid);
	update.gQuery("cars", "Neon", CarInfo[idd][cNeon], "ID", CarInfo[idd][cID]);
	return true;
}
function CreatePlayerCar(idd) {
	CarInfo[idd][cSpawned] = CreateVehicleEx(CarInfo[idd][cModel], CarInfo[idd][cPos][0], CarInfo[idd][cPos][1], CarInfo[idd][cPos][2], CarInfo[idd][cPos][3], CarInfo[idd][cColor][0], CarInfo[idd][cColor][1], -1, 0);
	if(CarInfo[idd][cHealth] > 250) SetVehicleHealth(CarInfo[idd][cSpawned], CarInfo[idd][cHealth]);
	else SetVehicleHealth(CarInfo[idd][cSpawned], 999);
	UpdateVehicleDamageStatus(CarInfo[idd][cSpawned], CarInfo[idd][cComponents][0], CarInfo[idd][cComponents][1], CarInfo[idd][cComponents][2], CarInfo[idd][cComponents][3]);
	SetVehicleVirtualWorld(CarInfo[idd][cSpawned], CarInfo[idd][cVirtual]);
	if(CarInfo[idd][cOnline] != -1) {
		VehicleAcces[CarInfo[idd][cSpawned]] = CarInfo[idd][cOnline];	
		GiveVehicleKey(CarInfo[idd][cOnline], CarInfo[idd][cSpawned]);
	}
	AttachNeon(idd);
	SetTunning(idd);
	AttachVipText(idd);
	SetPlayerCarTime(idd);
	gQuery[0] = EOS;
	Fuel[CarInfo[idd][cSpawned]] = CarInfo[idd][cFuel];
	new engine, lights, alarm, doors, bonnet, boot, objective;
	GetVehicleParamsEx(CarInfo[idd][cSpawned], engine, lights, alarm, doors, bonnet, boot, objective);
	SetVehicleParamsEx(CarInfo[idd][cSpawned], engine, lights, alarm, CarInfo[idd][cStatus], bonnet, boot, objective);
	VehicleOwned[CarInfo[idd][cSpawned]] = 1;
	VehicleSQL[CarInfo[idd][cSpawned]] = idd;
	return true;
}

YCMD:rainbowspeed(playerid, params[], help) {
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return true;
	if(!ServerSystem(6))
		return SCM(playerid, COLOR_GREY, "Acest system este dezactivat momentan.");

	if(GetCoolDowns(playerid, 17)) return CoolDowns(playerid, 17);

	if(!PlayerInfo[playerid][pTog][6])
		return SCM(playerid, COLOR_GREY, "Acest sistem este dezactivat din (/tog -> rainbow).");
	new idd = GetPlayerCar(playerid);
	if(idd == -1) return true;
	if(!CarInfo[idd][cRainbow]) return SCM(playerid, COLOR_LGREEN, "This vehicle is not a rainbow");
	
	new speed;
    if(sscanf(params, "i", speed)) return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/rainbowspeed [Speed 0/3]");
    if(1 < speed > 3) return SCM(playerid, COLOR_GREY, "Rainbow speed 1 - 3.");
    gString[0] = EOS;
 	format(gString, sizeof(gString), "Your rainbow speed is now %d.", speed);
    SCM(playerid, COLOR_YELLOW, gString);
    SetCoolDowns(playerid, 17, 10);
    if(PlayerRainbow[playerid] != 0) {
   		if(Iter_Contains(Rainbows[PlayerRainbow[playerid]], playerid)) Iter_Remove(Rainbows[PlayerRainbow[playerid]], playerid);
   	}
   	PlayerInfo[playerid][pVehRainbow] = speed;
   	UpdateVar(playerid, "Rainbow", speed);
   	if(!PlayerInfo[playerid][pTog][6]) return true;
   	rID[playerid] = 62;
   	VehicleRainbow[playerid] = CarInfo[idd][cSpawned];
   	PlayerRainbow[playerid] = speed;
   	if(speed != 0) Iter_Add(Rainbows[speed], playerid);
   	else ChangeVehicleColor(CarInfo[idd][cSpawned], CarInfo[idd][cColor][0], CarInfo[idd][cColor][1]);
	return true;
}

function SetTunning(idd) {
	SetVehicleDoor(CarInfo[idd][cSpawned], CarInfo[idd][cStatus]);
	for(new i = 0; i < 14; i++) if(CarInfo[idd][cMod][i] != 0) AddVehicleComponent(CarInfo[idd][cSpawned], CarInfo[idd][cMod][i]);
	SetVehicleNumberPlate(CarInfo[idd][cSpawned], CarInfo[idd][cLicense]);
	ChangeVehiclePaintjob(CarInfo[idd][cSpawned], CarInfo[idd][cPaintjob]);
	return true;
}

stock FindSpawnID(car, bool: type = false) {
	switch(type) {
		case false: if(VehicleOwned[car] == 1) return VehicleSQL[car];
		case true: if(VehicleOwned[car] == 2) return VehicleSQL[car];
	}
	return -1;
}
function GetPlayerTotalVehicle(id) return Iter_Count(MyVehicles<id>);

function DestroyPlayerCar(idd) {
	VehicleOwned[CarInfo[idd][cSpawned]] = INVALID_VEHICLE;
	VehicleSQL[CarInfo[idd][cSpawned]] = INVALID_VEHICLE;
	CarInfo[idd][cTime] = -1;
	Engine[CarInfo[idd][cSpawned]] = false;
	CarInfo[idd][cFuel] = Fuel[CarInfo[idd][cSpawned]];
	GetVehicleDamageStatus(CarInfo[idd][cSpawned], CarInfo[idd][cComponents][0], CarInfo[idd][cComponents][1], CarInfo[idd][cComponents][2], CarInfo[idd][cComponents][3]);
	GetVehicleHealth(CarInfo[idd][cSpawned], CarInfo[idd][cHealth]);
	for(new i = 0; i < 2; i++) if(CarInfo[idd][cNObj][i] != INVALID_OBJECT_ID) DestroyDynamicObject(CarInfo[idd][cNObj][i]), CarInfo[idd][cNObj][i] = INVALID_OBJECT_ID;
	if(CarInfo[idd][cObjectText] != INVALID_OBJECT_ID) DestroyDynamicObject(CarInfo[idd][cObjectText]), CarInfo[idd][cObjectText] = INVALID_OBJECT_ID;
	UpdateCar(idd);
	DestroyVehicleEx(CarInfo[idd][cSpawned]);
	CarInfo[idd][cSpawned] = INVALID_VEHICLE;
	return true;
}

function UpdateCar(idd) {
	new query[1000];
	mysql_format(SQL, query, sizeof(query), "UPDATE `cars` SET `Color1`='%d', `Color2`='%d', `License`='%s', `PosX`='%f', `PosY`='%f', `PosZ`='%f', `PosR`='%f', `Virtual`='%d', `Status`='%d', `Price`='%d', `Fuel`='%d', `LastPosX`='%f', `LastPosY`='%f', `LastPosZ`='%f', `LastPosR`='%f', `Points`='%d', `Insurance`='%d', `Odometer`='%f', `Health`='%f', `Components`='%d|%d|%d|%d', `idd` = '0' WHERE `ID`='%d'",
		CarInfo[idd][cColor][0], CarInfo[idd][cColor][1], CarInfo[idd][cLicense], CarInfo[idd][cPos][0], CarInfo[idd][cPos][1], CarInfo[idd][cPos][2], CarInfo[idd][cPos][3], CarInfo[idd][cVirtual], CarInfo[idd][cStatus], 
	CarInfo[idd][cPrice], CarInfo[idd][cFuel], CarInfo[idd][cLastPos][0], CarInfo[idd][cLastPos][1], CarInfo[idd][cLastPos][2], CarInfo[idd][cLastPos][3], CarInfo[idd][cPoints], CarInfo[idd][cInsurance], CarInfo[idd][cOdometer], CarInfo[idd][cHealth], 
	CarInfo[idd][cComponents][0], CarInfo[idd][cComponents][1], CarInfo[idd][cComponents][2], CarInfo[idd][cComponents][3], CarInfo[idd][cID]);
	mysql_tquery(SQL, query, "", "");
	return true;
}

function UpdateCar2(idd) {
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `cars` SET `Userid`='%d', `Owner`='%s' WHERE `ID`='%d'", CarInfo[idd][cUserid], CarInfo[idd][cOwner], CarInfo[idd][cID]);
	mysql_tquery(SQL, gQuery);
	return true;
}


function GetPlayerSlot(playerid) return PlayerInfo[playerid][pSlot];

function GivePlayerKey(playerid, key) return Iter_Add(MyVehicles<playerid>, key);
// =================================== Comands ======================================== //


YCMD:checkv(playerid, params[], help) {
	if(!IsAdmin(playerid, 5)) 
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new id;
	if(sscanf(params, "u", id))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/checkv [playerid/name]");

	if(!IsPlayerConnected(id))
		return SCM(playerid, COLOR_GREY, "Not player connected.");

	if(GetPlayerTotalVehicle(id) == 0) 
		return SCM(playerid, COLOR_LGREEN, "That player has no vehicle.");

	gString[0] = EOS;
	foreach(new idd : MyVehicles<id>) {
		format(gString, sizeof(gString),"[ID: %d] %s[%d] | age: %d | km: %.0f | colors: %d, %d", CarInfo[idd][cID], GetVehicleName(CarInfo[idd][cModel]), CarInfo[idd][cSpawned], CarInfo[idd][cDays], CarInfo[idd][cOdometer], CarInfo[idd][cColor][0], CarInfo[idd][cColor][1]);
		SCM(playerid, COLOR_LGREEN, gString);
	}
	return true;
}

YCMD:v(playerid, params[], help) return ShowPlayerVehicle(playerid);

YCMD:vremove(playerid, params[], help) {
	if(!IsAdmin(playerid, 7)) 
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	if(IsPlayerInAnyVehicle(playerid)) {
		new carid = FindSpawnID(GetPlayerVehicleID(playerid), false);
		if(carid == -1) return SCM(playerid, COLOR_GREY, "Aceasta masina nu a fost gasita in baza de date.");
	    new id = CarInfo[carid][cOnline];
	    if(id == -1) return true;
	    if(PlayerInfo[id][pAdmin]<=PlayerInfo[playerid][pAdmin]&&id!=playerid) return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta comanda pe aceasta masina.");
		RemovePlayerKey(id, carid);
		gQuery[0] = EOS;
		mysql_format(SQL, gQuery, sizeof(gQuery), "DELETE FROM `cars` WHERE `ID`='%d' LIMIT 1", CarInfo[carid][cID]);
		mysql_tquery(SQL, gQuery, "", "");

		gString[0] = EOS;
		format(gString, sizeof(gString), "%s[user: %d]'s %s [car: %d] was deleted [/vremove] by Admin %s[admin: %d]", CarInfo[carid][cOwner], CarInfo[carid][cUserid], GetVehicleName(CarInfo[carid][cModel]), CarInfo[carid][cID], GetName(playerid), PlayerInfo[playerid][pSQLID]);
		SendAdminMessage(COLOR_DARKNICERED, gString, 6);
		if(CarInfo[carid][cSpawned] != INVALID_VEHICLE) DestroyPlayerCar(carid), CarInfo[carid][cID] = 0;
	} else {
		new idd;
		if(sscanf(params, "i", idd))
			return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/vremove [carid]");	

		new carid = CheckVehicles(idd);
		if(carid == -1) return SCM(playerid, COLOR_GREY, "This vehicle was not found in the database.");
		new id = CarInfo[carid][cOnline];
		if(id == -1) return true;
		if(PlayerInfo[id][pAdmin]<=PlayerInfo[playerid][pAdmin]&&id!=playerid) return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta comanda pe aceasta masina.");
		RemovePlayerKey(id, carid);

		gQuery[0] = EOS;
		mysql_format(SQL, gQuery, sizeof(gQuery), "DELETE FROM `cars` WHERE `ID`='%d' LIMIT 1", CarInfo[carid][cID]);
		mysql_tquery(SQL, gQuery, "", "");		

		gString[0] = EOS;
		format(gString, sizeof(gString), "%s[user: %d]'s %s [car: %d] was deleted [/vremove] by Admin %s[admin: %d]", CarInfo[carid][cOwner], CarInfo[carid][cUserid], GetVehicleName(CarInfo[carid][cModel]), CarInfo[carid][cID], GetName(playerid), PlayerInfo[playerid][pSQLID]);
		SendAdminMessage(COLOR_DARKNICERED, gString, 6);
		if(CarInfo[carid][cSpawned] != INVALID_VEHICLE) DestroyPlayerCar(carid), CarInfo[carid][cID] = 0;
	}
	return true;
}

YCMD:vowner(playerid, params[], help) {
	if(!IsAdmin(playerid, 7)) 
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	if(IsPlayerInAnyVehicle(playerid) ? sscanf(params, "u", params[0]) : sscanf(params, "ui", params[0], params[1]))
		return SCM(playerid, COLOR_GREY, IsPlayerInAnyVehicle(playerid) ? "Syntax: {FFFFFF}/vowner: [playerid/name]" : "Syntax: {FFFFFF}/vowner: [playerid/name] [veicleid]");

	new idd = FindSpawnID((IsPlayerInAnyVehicle(playerid) ? GetPlayerVehicleID(playerid) : params[1]), false);
	if(idd == -1) return SCM(playerid, COLOR_GREY, "This vehicle was not found in the database.");

	if(!IsPlayerConnected(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(!IsPlayerLogged(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not logged.");

	if(GetPlayerTotalVehicle(params[0]) >= GetPlayerSlot(params[0]))
		return SCM(playerid, COLOR_GREY, "Acel player are maximu de vehicule personale.");

	new id = CarInfo[idd][cOnline];

	if(CarInfo[idd][cOnline] != -1) RemovePlayerKey(id, idd);
	GivePlayerKey(params[0], idd);

	gQuery[0] = EOS; gString[0] = EOS;
	mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `cars` SET `Userid` = '%i', `Owner` = '%e' WHERE `ID` = '%i' LIMIT 1", PlayerInfo[params[0]][pSQLID], GetName(params[0]), CarInfo[idd][cID]);
	mysql_tquery(SQL, gQuery);

	format(gString, sizeof gString, "/vowner: %s[user: %d]'s %s [car: %d] was owner modifed in %s[user: %d] by Admin %s[admin: %d]", 
		CarInfo[idd][cOwner], CarInfo[idd][cUserid], GetVehicleName(CarInfo[idd][cModel]), CarInfo[idd][cID], GetName(params[0]), PlayerInfo[params[0]][pSQLID], GetName(playerid), PlayerInfo[playerid][pSQLID]);
	
	SendAdminMessage(COLOR_ADMCMD, gString, 6);
	CarInfo[idd][cUserid] = PlayerInfo[params[0]][pSQLID];
	format(CarInfo[idd][cOwner], MAX_PLAYER_NAME, GetName(params[0]));
	CarInfo[idd][cOnline] = params[0];
	VehicleAcces[CarInfo[idd][cSpawned]] = params[0];
	foreach(new i : VehicleKeys[CarInfo[idd][cSpawned]]) Iter_Remove(PlayerKeys[i], CarInfo[idd][cSpawned]);
	Iter_Clear(VehicleKeys[CarInfo[idd][cSpawned]]);
	GiveVehicleKey(playerid, CarInfo[idd][cSpawned]);
	SetVehicleDoor(CarInfo[idd][cSpawned], CarInfo[idd][cStatus]);
	return true;
}
redist::SQL_InsertVehicle(admin, playerid, model, bool: shop, premium) {
	new idd = CheckPlayerVehicles();
	CarInfo[idd][cID] = cache_insert_id();
	GivePlayerKey(playerid, idd);
	CarInfo[idd][cUserid] = PlayerInfo[playerid][pSQLID];
	CarInfo[idd][cModel] = model;
	CarInfo[idd][cColor][0] = true;
	CarInfo[idd][cColor][1] = true;
	strmid(CarInfo[idd][cOwner], PlayerInfo[playerid][pName], 0, strlen(PlayerInfo[playerid][pName]), 255);
	strmid(CarInfo[idd][cLicense], "NewCar", 0, 6, 255);
	new Float: Pos[4];
	GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
	GetPlayerFacingAngle(playerid, Pos[3]);
	new rr = random(sizeof(DealerPos));
	for(new i = 0; i < 4; i++) {
		if(premium != 3) {
			CarInfo[idd][cPos][i] = Pos[i];
			CarInfo[idd][cLastPos][i] = Pos[i];
		} else {
			CarInfo[idd][cPos][i] = DealerPos[rr][i]; 
			CarInfo[idd][cLastPos][i] = DealerPos[rr][i];
		}
		CarInfo[idd][cComponents][i] = 0;
	}
	CarInfo[idd][cVirtual] = 0;
	CarInfo[idd][cDays] = 0;			CarInfo[idd][cHealth] = 999.0; 		CarInfo[idd][cOdometer] = 0.0;
	CarInfo[idd][cPoints] = 5;			CarInfo[idd][cStatus] = true;		CarInfo[idd][cPrice] = 1;
	CarInfo[idd][cInsurance] = 1000;	CarInfo[idd][cFuel] = 100;			CarInfo[idd][cRainbow] = false;
	CarInfo[idd][cText] = EOS;			CarInfo[idd][cVipStatus] = false;
	CarInfo[idd][cPaintjob] = 3;		CarInfo[idd][cLeft] = premium != 3 ? 0 : admin;		
	CarInfo[idd][cOnline] = playerid;	CarInfo[idd][cNeon] = 0;
	for(new i = 0; i < 14; i++) 		CarInfo[idd][cMod][i] = 0;
	gQuery[0] = EOS;
	if(CarInfo[idd][cLeft] != 0) {
		mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `cars` SET `Left`='%d' WHERE `ID`='%d'", CarInfo[idd][cLeft], CarInfo[idd][cID]);
		mysql_tquery(SQL, gQuery, "", "");		
	}
	CreatePlayerCar(idd);
	UpdateCar(idd);
	UpdateCar2(idd);
	if(premium == 3)
		return true;
	
	gString[0] = EOS;
	switch(shop) {
		case false: {
			format(gString, sizeof(gString), "%s[user: %d] %s [car: %d] was created [/vcreate] by Admin %s[admin: %d]", PlayerInfo[playerid][pName], PlayerInfo[playerid][pSQLID], GetVehicleName(CarInfo[idd][cModel]), CarInfo[idd][cID], GetName(admin), PlayerInfo[admin][pSQLID]);
			SendAdminMessage(COLOR_YELLOW, gString, 7);
		}
		case true: {
			format(gString, sizeof(gString), "Shop: %s[user: %d] si-a achizitionat un %s %sdin shop.", GetName(playerid), PlayerInfo[playerid][pSQLID], GetVehicleName(model), premium == 1? ("PREMIUM ") : (""));
			SendAdminMessage(COLOR_YELLOW, gString, 1);
		}
	}
	return true;
}

function SQL_InsertVehicleEx(playerid, model, bool:park) {
	new idd = CheckPlayerVehicles();
	CarInfo[idd][cID] = cache_insert_id();
	GivePlayerKey(playerid, idd);
	CarInfo[idd][cUserid] = PlayerInfo[playerid][pSQLID];
	CarInfo[idd][cModel] = model;
	CarInfo[idd][cColor][0] = true;
	CarInfo[idd][cColor][1] = true;
	strmid(CarInfo[idd][cOwner], PlayerInfo[playerid][pName], 0, strlen(PlayerInfo[playerid][pName]), 255);
	strmid(CarInfo[idd][cLicense], "NewCar", 0, 6, 255);
	if(!park) {
		new Float: Pos[4];
		GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
		GetPlayerFacingAngle(playerid, Pos[3]);
		for(new i = 0; i < 4; i++) {
			CarInfo[idd][cPos][i] = Pos[i]; 
			CarInfo[idd][cLastPos][i] = Pos[i];
			CarInfo[idd][cComponents][i] = 0;
		}
	} else {
		new y = random(sizeof(DealerPos));
		for(new i = false; i < 4; i++) {
			CarInfo[idd][cPos][i] = CarInfo[idd][cLastPos][i] = DealerPos[y][i];
			CarInfo[idd][cComponents][i] = false;
		}
	}
	CarInfo[idd][cVirtual] = 0;
	CarInfo[idd][cDays] = 0;			CarInfo[idd][cHealth] = 999.0; 		CarInfo[idd][cOdometer] = 0.0;
	CarInfo[idd][cPoints] = 5;			CarInfo[idd][cStatus] = true;		CarInfo[idd][cPrice] = 1;
	CarInfo[idd][cInsurance] = 1000;	CarInfo[idd][cFuel] = 200;			CarInfo[idd][cRainbow] = false;
	CarInfo[idd][cText] = EOS;			CarInfo[idd][cVipStatus] = false;
	CarInfo[idd][cPaintjob] = 3;		CarInfo[idd][cLeft] = 0;		
	CarInfo[idd][cOnline] = playerid;	CarInfo[idd][cNeon] = 0;
	for(new i = 0; i < 14; i++) 		CarInfo[idd][cMod][i] = 0;
	gQuery[0] = EOS;
	if(CarInfo[idd][cLeft] != 0) {
		mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `cars` SET `Left`='%d' WHERE `ID`='%d'", CarInfo[idd][cLeft], CarInfo[idd][cID]);
		mysql_tquery(SQL, gQuery, "", "");		
	}
	CreatePlayerCar(idd);
	UpdateCar(idd);
	UpdateCar2(idd);
	return true;
}

YCMD:vcreate(playerid, params[], help) {
	if(!IsAdmin(playerid, 7))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new id, model;
	if(sscanf(params, "ui", id, model))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/vcreate [playerid/name] [model]");

	if(model < 400 || model > 611)
		return SCM(playerid, COLOR_GREY, "Model invalid.");

	if(!IsPlayerConnected(id))
		return SCM(playerid, COLOR_GREY, "Acel player nu este connectat.");

	if(GetPlayerTotalVehicle(id) == GetPlayerSlot(id))
		return SCM(playerid, COLOR_LGREEN, "Eroare: Acel player are maximum de vehicule personale.");

	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "INSERT INTO cars (Model) VALUES (%d)", model);
	mysql_tquery(SQL, gQuery, "SQL_InsertVehicle", "iiiii", playerid, id, model, false, false);
	return true;
}
 
GiveVehicle(playerid, model, bool:park=false) {
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "INSERT INTO cars (Model) VALUES (%d)", model);
	mysql_tquery(SQL, gQuery, "SQL_InsertVehicleEx", "iib", playerid, model, park);
}

save_neon(playerid) {
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, 100, "UPDATE `users` SET `Neon` = '%d|%d|%d|%d|%d|%d' WHERE `id` = '%d'", 
		PlayerInfo[playerid][pNeon][0], PlayerInfo[playerid][pNeon][1], PlayerInfo[playerid][pNeon][2], PlayerInfo[playerid][pNeon][3],
		PlayerInfo[playerid][pNeon][4], PlayerInfo[playerid][pNeon][5], PlayerInfo[playerid][pSQLID]);
	mysql_tquery(SQL, gQuery);
}

YCMD:removetuning(playerid, params[], help) {
	new i,idd;
	if((idd = GetPlayerCar(playerid)) == -1)
		return true;

	do {
		if(CarInfo[idd][cMod][i]) 
			RemoveVehicleComponent(CarInfo[idd][cSpawned], CarInfo[idd][cMod][i]);
		
		CarInfo[idd][cMod][i] = 0; i++;
	}
	while(i<14);
	ChangeVehiclePaintjob(CarInfo[idd][cSpawned], 3); CarInfo[idd][cPaintjob] = 3;
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `cars` SET `Mod`='%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i' WHERE `ID`='%d'", CarInfo[idd][cMod][0], CarInfo[idd][cMod][1], CarInfo[idd][cMod][2],
		CarInfo[idd][cMod][3], CarInfo[idd][cMod][4], CarInfo[idd][cMod][5], CarInfo[idd][cMod][6], CarInfo[idd][cMod][7], CarInfo[idd][cMod][8], CarInfo[idd][cMod][9],
		CarInfo[idd][cMod][10], CarInfo[idd][cMod][11], CarInfo[idd][cMod][12], CarInfo[idd][cMod][13], CarInfo[idd][cID]);
	mysql_tquery(SQL, gQuery, "", "");

	mysql_format(SQL, gQuery, 128, "UPDATE `cars` SET `Paintjob` = '3' WHERE `ID` = '%i'", CarInfo[idd][cID]);
	mysql_tquery(SQL, gQuery);

	SCM(playerid, -1, "Tuningul de pe masina a fost inlaturat.");
	return true;
}

YCMD:park(playerid, params[], help) {
	if(!IsPlayerInAnyVehicle(playerid) || GetPlayerState(playerid) != PLAYER_STATE_DRIVER) 
		return true;

	if(PlayerVar[playerid][IsSafezone])
		return SCM(playerid, COLOR_GREY, "Nu poti parca in safezone!");

	new carid = GetPlayerCar(playerid);
	if(carid == -1) return true;
	new Float: Health;
	GetVehicleHealth(CarInfo[carid][cSpawned], Health);
	if(Health < 800) return SCM(playerid, COLOR_GREY, "Your vehicle does not exceed 800 hp.");
	GetVehiclePos(CarInfo[carid][cSpawned], CarInfo[carid][cPos][0], CarInfo[carid][cPos][1], CarInfo[carid][cPos][2]);
	GetVehicleZAngle(CarInfo[carid][cSpawned], CarInfo[carid][cPos][3]);
	CarInfo[carid][cLastPos][0] = CarInfo[carid][cPos][0];
	CarInfo[carid][cLastPos][1] = CarInfo[carid][cPos][1];
	CarInfo[carid][cLastPos][2] = CarInfo[carid][cPos][2];
	CarInfo[carid][cLastPos][3] = CarInfo[carid][cPos][3];
	CarInfo[carid][cVirtual] = GetPlayerVirtualWorld(playerid);
	DestroyPlayerCar(carid);
	CreatePlayerCar(carid);
	PutPlayerInVehicle(playerid, CarInfo[carid][cSpawned], 0);
	SCM(playerid, COLOR_GREY, "The car was parked successfully.");
	return 1;
}


YCMD:apark(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	if(!IsPlayerInAnyVehicle(playerid) || GetPlayerState(playerid) != PLAYER_STATE_DRIVER) 
		return true;

	if(PlayerVar[playerid][IsSafezone])
		return SCM(playerid, COLOR_GREY, "Nu poti parca in safezone!");

	new carid = FindSpawnID(GetPlayerVehicleID(playerid));
	if(carid == -1) return true;
	new Float: Health;
	GetVehicleHealth(CarInfo[carid][cSpawned], Health);
	GetVehiclePos(CarInfo[carid][cSpawned], CarInfo[carid][cPos][0], CarInfo[carid][cPos][1], CarInfo[carid][cPos][2]);
	GetVehicleZAngle(CarInfo[carid][cSpawned], CarInfo[carid][cPos][3]);
	CarInfo[carid][cLastPos][0] = CarInfo[carid][cPos][0];
	CarInfo[carid][cLastPos][1] = CarInfo[carid][cPos][1];
	CarInfo[carid][cLastPos][2] = CarInfo[carid][cPos][2];
	CarInfo[carid][cLastPos][3] = CarInfo[carid][cPos][3];
	CarInfo[carid][cVirtual] = GetPlayerVirtualWorld(playerid);
	DestroyPlayerCar(carid);
	CreatePlayerCar(carid);
	PutPlayerInVehicle(playerid, CarInfo[carid][cSpawned], 0);
	SCM(playerid, COLOR_GREY, "The car was parked successfully.");
	return 1;
}

YCMD:towcar(playerid, params[]) {
	new car = -1, string[50 * MAX_VEHICLES]; gString[0] = EOS;
	foreach(new idd : MyVehicles<playerid>) {
		if(CarInfo[idd][cSpawned] == INVALID_VEHICLE) continue;

		strcatf(string, "%s {FFFFFF}%s\n", CarInfo[idd][cSpawned] != INVALID_VEHICLE ? ("{00FF00}(spawned)") : ("{FF0000}(despawned)"), GetVehicleName(CarInfo[idd][cModel]));
		PlayerInfo[playerid][pCarKey][++car] = idd;
	}
	if(car == -1) SCM(playerid, COLOR_LGREEN, "Nu ai niciun vehicul spawnat.");
	else ShowPlayerDialog(playerid, DIALOG_TOWCAR, DIALOG_STYLE_LIST, "Tow Car", string, "Select", "Close");
	return true;
}
YCMD:findcar(playerid, params[]) {
	if(HaveCheckpoint(playerid)) 
		return ShowCancelCP(playerid);

	new car = -1, string[50 * MAX_VEHICLES]; gString[0] = EOS;
	foreach(new idd : MyVehicles<playerid>) {
		if(CarInfo[idd][cSpawned] == INVALID_VEHICLE) continue;

		strcatf(string, "%s {FFFFFF}%s\n", CarInfo[idd][cSpawned] != INVALID_VEHICLE ? ("{00FF00}(spawned)") : ("{FF0000}(despawned)"), GetVehicleName(CarInfo[idd][cModel]));
		PlayerInfo[playerid][pCarKey][++car] = idd;
	}
	if(car == -1) SCM(playerid, COLOR_LGREEN, "Nu ai niciun vehicul spawnat.");
	else ShowPlayerDialog(playerid, DIALOG_FINDCAR, DIALOG_STYLE_LIST, "Find Car", string, "Select", "Close");
	return true;
}
cmd:carplate(playerid, params[]) {
	if(!IsPlayerInAnyVehicle(playerid))
		return true;

	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
		return true;

	new carid = GetPlayerCar(playerid);
	if(carid == -1)
		return SCM(playerid, COLOR_LGREEN, "Eroare: Nu esti in vehiculul tau personal!");

	if(GetPlayerCash(playerid) < 250)
		return SCM(playerid, COLOR_GREY, "Nu ai $250!");

	listitemm[playerid] = carid;
	ShowPlayerDialog(playerid, DIALOG_CARPLATE, DIALOG_STYLE_INPUT, "Change Plate", "Enter the text you want to put in the flat:", "Select", "Back");
	return true;
}

YCMD:carcolor(playerid, params[], help) {
	if(!IsPlayerInAnyVehicle(playerid))
		return SCM(playerid, COLOR_LGREEN, "Eroare: Nu te afli intr-un vehicul.");

	if(GetPlayerCar(playerid) == -1) 
		return SCM(playerid, COLOR_LGREEN, "Eroare: Acest vehicul nu iti apartine.");

	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) 
		return SCM(playerid, COLOR_LGREEN, "You have to be behind the wheel.");

	if(GetPlayerCash(playerid) < 2500)
		return SCM(playerid, COLOR_LGREEN, "You don't have $2,500");

	new carid = GetPlayerCar(playerid);
	new slot, color;
	if(sscanf(params, "ii", slot, color))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/carcolor [1/2] [colors]");

	if(color < 0 || color > 255) 
		return SCM(playerid, COLOR_GREY, "Invalid colors.");

	if(slot < 1 || slot > 2) return true;
	listitemm[playerid] = color;
	PlayerVar[playerid][Stock] = slot;
	if(color > 127) {
		if(PlayerInfo[playerid][pHidden] < 1) 
			return SCM(playerid, COLOR_WHITE, "You do not have a hidden one, use /shop to buy.");

		ShowPlayerDialog(playerid, DIALOG_PLACEHIDD, DIALOG_STYLE_MSGBOX, "Hidden colors:", "Esti sigur ca vrei sa pui o culoare hidden pe acest vehicul?", "Yes", "No");
		return true;
	}
	if(CarInfo[carid][cColor][slot-1] > 127) return ShowPlayerDialog(playerid, DIALOG_CHANGEHIDD, DIALOG_STYLE_MSGBOX, "Change colors:", "Esti sigur ca vrei sa pui aceasta culoare pe masina\nVei pierde culoare hidden.", "Yes", "No");
	CarInfo[carid][cColor][slot-1] = color;
	VehicleInfo[CarInfo[carid][cSpawned]][vColor][slot-1] = color;
	ChangeVehicleColor(CarInfo[carid][cSpawned], CarInfo[carid][cColor][0], CarInfo[carid][cColor][1]);

	SCM(playerid, COLOR_MONEY, "(-) you paid $2,500 to change the color.");
	GivePlayerCash(playerid, -2500);
	return 1;
}
YCMD:swapcolors(playerid, params[], help) {
	if(!IsPlayerInAnyVehicle(playerid))
		return SCM(playerid, COLOR_LGREEN, "Eroare: Nu te afli intr-o masina.");

	if(GetPlayerCar(playerid) == -1)
		return SCM(playerid, COLOR_LGREEN, "Eroare: Acest vehicul nu iti apartine.");
	
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
		return SCM(playerid, COLOR_LGREEN, "Eroare: Trebuie sa fi la volanul vehicului.");

	if(GetPlayerCash(playerid) < 5000)
		return SCM(playerid, COLOR_LGREEN, "Eroare: Nu ai $5,000");

	new color1, color2, carid = GetPlayerCar(playerid);
	color1 = CarInfo[carid][cColor][0];
	color2 = CarInfo[carid][cColor][1];

	CarInfo[carid][cColor][0] = color2;
	CarInfo[carid][cColor][1] = color1;
	ChangeVehicleColor(CarInfo[carid][cSpawned], CarInfo[carid][cColor][0], CarInfo[carid][cColor][1]);
	GivePlayerCash(playerid, -5000);
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `cars` SET `color1`='%d', `color2`='%d' WHERE `ID`='%d'", CarInfo[carid][cColor][0], CarInfo[carid][cColor][1], CarInfo[carid][cID]);
	mysql_tquery(SQL, gQuery, "", "");	
	SCM(playerid, COLOR_LGREEN, "culorile masini au fost inversate.");
	return 1;
}