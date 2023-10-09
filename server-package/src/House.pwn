function SQL_LoadHouses() {
	SqlHouses = cache_num_rows();
	printf("[MySQL] Houses: %d", SqlHouses);
	if(SqlHouses == 0) return true;
	new pickupid, x=-1,i=-1, aleapos[50], areaid;
	while(++i<SqlHouses) {
		x = i+1;

		cache_get_value_name_int(i, "ID", HouseInfo[x][hID]);
		cache_get_value_name_int(i, "Userid", HouseInfo[x][hUserid]);
		cache_get_value_name_int(i, "Owned", HouseInfo[x][hOwned]);
		cache_get_value_name_int(i, "Rented", HouseInfo[x][hRented]);
		cache_get_value_name_int(i, "Value", HouseInfo[x][hValue]);
		cache_get_value_name_int(i, "OldValue", HouseInfo[x][hOldValue]);
		cache_get_value_name_int(i, "Radio", HouseInfo[x][hRadio]);
		cache_get_value_name_int(i, "Status", HouseInfo[x][hStatus]);
		cache_get_value_name_int(i, "Balance", HouseInfo[x][hBalance]);
		cache_get_value_name_float(i, "EnterPosX", HouseInfo[x][hEnterPos][0]);
		cache_get_value_name_float(i, "EnterPosY", HouseInfo[x][hEnterPos][1]);
		cache_get_value_name_float(i, "EnterPosZ", HouseInfo[x][hEnterPos][2]);
		cache_get_value_name_float(i, "ExitPosX", HouseInfo[x][hExitPos][0]);
		cache_get_value_name_float(i, "ExitPosY", HouseInfo[x][hExitPos][1]);
		cache_get_value_name_float(i, "ExitPosZ", HouseInfo[x][hExitPos][2]);
		cache_get_value_name_int(i, "Interior", HouseInfo[x][hInterior]);
		cache_get_value_name_int(i, "VirtualWorld", HouseInfo[x][hVirtualWorld]);
		cache_get_value_name_int(i, "Size", HouseInfo[x][hSize]);
		cache_get_value_name_int(i, "Level", HouseInfo[x][hLevel]);
		cache_get_value_name_bool(i, "Heal", HouseInfo[x][hHeal]);

		cache_get_value_name_int(i, "InteriorID", HouseInfo[x][hIntID]);

		cache_get_value_name_int(i, "Alea", HouseInfo[x][hAlea]);
		cache_get_value_name(i, "AleaPos", aleapos);

		cache_get_value_name(i, "Owner", HouseInfo[x][hOwner]);
		cache_get_value_name(i, "Description", HouseInfo[x][hDescription]);
		sscanf(aleapos, "p<,>ffff", HouseInfo[x][hAleaX], HouseInfo[x][hAleaY], HouseInfo[x][hAleaZ], HouseInfo[x][hAleaZAngle]);
	
		cache_get_value_name_float(i, "xPC", HouseInfo[x][hPCx]);
		cache_get_value_name_float(i, "yPC", HouseInfo[x][hPCy]);
		cache_get_value_name_float(i, "zPC", HouseInfo[x][hPCz]);
		cache_get_value_name_float(i, "rPC", HouseInfo[x][hPCr]);

		cache_get_value_name_bool(i, "PC", HouseInfo[x][hComputer]);

		if(HouseInfo[x][hComputer]) {
			HouseInfo[x][hObjPC] = CreateDynamicObject(19893, HouseInfo[x][hPCx], HouseInfo[x][hPCy], HouseInfo[x][hPCz], 0.0, 0.0, HouseInfo[x][hPCr], HouseInfo[x][hVirtualWorld], -1, -1, 300.00);
			SetDynamicObjectMaterial(HouseInfo[x][hObjPC], 1, 8419, "vgsbldng1", "black32", 0xFFFFFFFF);

			areaid = CreateDynamicSphere(HouseInfo[x][hPCx], HouseInfo[x][hPCy], HouseInfo[x][hPCz], 1.5, HouseInfo[x][hVirtualWorld]), AreaType[areaid] = AREA_PC, AreaID[areaid] = i;
		}
		switch(HouseInfo[x][hIntID]) {
			case 2: pickupid = CreatePickup(19197, 23, 2286.2483,-1137.5818,1050.8984, HouseInfo[x][hVirtualWorld]), PickupInfo[pickupid][pkID] = x,PickupInfo[pickupid][pkType] = 4;
			case 6: pickupid = CreatePickup(19197, 23, 2319.3848,-1212.6729,1049.0234, HouseInfo[x][hVirtualWorld]), PickupInfo[pickupid][pkID] = x,PickupInfo[pickupid][pkType] = 4;
			case 7: pickupid = CreatePickup(19197, 23, 2231.7786,-1112.2190,1050.8828, HouseInfo[x][hVirtualWorld]), PickupInfo[pickupid][pkID] = x,PickupInfo[pickupid][pkType] = 4;
			case 8: pickupid = CreatePickup(19197, 23, 2263.1267,-1132.8730,1050.6328, HouseInfo[x][hVirtualWorld]), PickupInfo[pickupid][pkID] = x,PickupInfo[pickupid][pkType] = 4;
			case 9: pickupid = CreatePickup(19197, 23, 2215.8894,-1074.6974,1050.4844, HouseInfo[x][hVirtualWorld]), PickupInfo[pickupid][pkID] = x,PickupInfo[pickupid][pkType] = 4;
			case 10: pickupid = CreatePickup(19197, 23, 269.8523,303.6155,999.1484, HouseInfo[x][hVirtualWorld]), PickupInfo[pickupid][pkID] = x,PickupInfo[pickupid][pkType] = 4;
			case 14: pickupid = CreatePickup(19197, 23, 31.3422,1345.5013,1088.8750, HouseInfo[x][hVirtualWorld]), PickupInfo[pickupid][pkID] = x,PickupInfo[pickupid][pkType] = 4;
			case 15: pickupid = CreatePickup(19197, 23, -296.4693,1474.6884,1088.8750, HouseInfo[x][hVirtualWorld]), PickupInfo[pickupid][pkID] = x,PickupInfo[pickupid][pkType] = 4;
			case 16: pickupid = CreatePickup(19197, 23, -268.2626,1458.2830,1084.3672, HouseInfo[x][hVirtualWorld]), PickupInfo[pickupid][pkID] = x,PickupInfo[pickupid][pkType] = 4;
			case 18: pickupid = CreatePickup(19197, 23, 2316.2048,-1010.9176,1054.7188, HouseInfo[x][hVirtualWorld]), PickupInfo[pickupid][pkID] = x,PickupInfo[pickupid][pkType] = 4;
			case 19: pickupid = CreatePickup(19197, 23, 2492.4807,-1708.5692,1018.3368, HouseInfo[x][hVirtualWorld]), PickupInfo[pickupid][pkID] = x,PickupInfo[pickupid][pkType] = 4;
			case 20: pickupid = CreatePickup(19197, 23, 2194.8643,-1210.6716,1049.0234, HouseInfo[x][hVirtualWorld]), PickupInfo[pickupid][pkID] = x,PickupInfo[pickupid][pkType] = 4;
			case 22: pickupid = CreatePickup(19197, 23, 2262.7874,-1216.7019,1049.0234, HouseInfo[x][hVirtualWorld]), PickupInfo[pickupid][pkID] = x,PickupInfo[pickupid][pkType] = 4;
			case 24: pickupid = CreatePickup(19197, 23, 380.6627,1472.8921,1080.1875, HouseInfo[x][hVirtualWorld]), PickupInfo[pickupid][pkID] = x,PickupInfo[pickupid][pkType] = 4;
			case 25: pickupid = CreatePickup(19197, 23, 2363.7668,-1127.5186,1050.8826, HouseInfo[x][hVirtualWorld]), PickupInfo[pickupid][pkID] = x,PickupInfo[pickupid][pkType] = 4;
			case 26: pickupid = CreatePickup(19197, 23, 2235.8843,-1073.9803,1049.0234, HouseInfo[x][hVirtualWorld]), PickupInfo[pickupid][pkID] = x,PickupInfo[pickupid][pkType] = 4;
			case 27: pickupid = CreatePickup(19197, 23, 2235.8894,-1073.8762,1049.0234, HouseInfo[x][hVirtualWorld]), PickupInfo[pickupid][pkID] = x,PickupInfo[pickupid][pkType] = 4;
			case 28: pickupid = CreatePickup(19197, 23, 220.2875,1148.7970,1082.6094, HouseInfo[x][hVirtualWorld]), PickupInfo[pickupid][pkID] = x,PickupInfo[pickupid][pkType] = 4;
			case 30: pickupid = CreatePickup(19197, 23, 2459.4749,-1699.1110,1013.5078, HouseInfo[x][hVirtualWorld]), PickupInfo[pickupid][pkID] = x,PickupInfo[pickupid][pkType] = 4;
			case 31: pickupid = CreatePickup(19197, 23, 134.6403,1379.9502,1088.3672, HouseInfo[x][hVirtualWorld]), PickupInfo[pickupid][pkID] = x,PickupInfo[pickupid][pkType] = 4;
		}
	}
	AreaType[CreateDynamicSphere(229.140380, 1284.449707, 1082.102294, 2.0)] = AREA_CHANGE_SKIN;
	AreaType[CreateDynamicSphere(332.1139,1478.1002,1084.4364, 2.0)] = AREA_CHANGE_SKIN;
	AreaType[CreateDynamicSphere(-42.5636,1412.7637,1084.4297, 2.0)] = AREA_CHANGE_SKIN;
	AreaType[CreateDynamicSphere(301.0141,05.7334, 1003.5391, 2.0)] = AREA_CHANGE_SKIN;
	AreaType[CreateDynamicSphere(248.8150,304.0549, 999.1484, 2.0)] = AREA_CHANGE_SKIN;
	AreaType[CreateDynamicSphere(225.3807,1196.8967, 1080.2667, 2.0)] = AREA_CHANGE_SKIN;
	AreaType[CreateDynamicSphere(479.2804,1411.3636, 1080.2714, 2.0)] = AREA_CHANGE_SKIN;
	AreaType[CreateDynamicSphere(84.5245, 1331.9456, 1083.8687, 2.0)] = AREA_CHANGE_SKIN;
	AreaType[CreateDynamicSphere(374.9809, 1410.8448, 1081.3363, 2.0)] = AREA_CHANGE_SKIN;
	AreaType[CreateDynamicSphere(451.1642,1403.3712,1084.3080, 2.0)] = AREA_CHANGE_SKIN;
	AreaType[CreateDynamicSphere(303.3804, 1472.1492, 1080.2651, 2.0)] = AREA_CHANGE_SKIN;
	AreaType[CreateDynamicSphere(224.6453,1152.0764,1082.6168, 2.0)] = AREA_CHANGE_SKIN;
	AreaType[CreateDynamicSphere(254.8370, 1252.3988, 1084.2578, 2.0)] = AREA_CHANGE_SKIN;
	AreaType[CreateDynamicSphere(254.7036, 1252.4862, 1084.2578, 2.0)] = AREA_CHANGE_SKIN;
	AreaType[CreateDynamicSphere(240.9370, 1026.5930, 1088.3125, 2.0)] = AREA_CHANGE_SKIN;
	AreaType[CreateDynamicSphere(241.9386, 1074.9402, 1084.1875, 2.0)] = AREA_CHANGE_SKIN;
	AreaType[CreateDynamicSphere(230.2136, 1107.6259, 1080.9922, 2.0)] = AREA_CHANGE_SKIN;
	AreaType[CreateDynamicSphere(257.7556, -42.8485, 1002.0234, 2.0)] = AREA_CHANGE_SKIN;

	i=0;
	while(++i<=SqlHouses) UpdateHouseLabel(i);
	return true;
}
function UpdateHouseLabel(houseid) {
	gString[0] = EOS;
	new value[70], rent[70];
	if HouseInfo[houseid][hPickupid]!=-1 *then DestroyPickup(HouseInfo[houseid][hPickupid]);
	if HouseInfo[houseid][hLabel]!=Text3D:-1 *then Delete3DTextLabel(HouseInfo[houseid][hLabel]);
	if(HouseInfo[houseid][hValue] != 0) format(value, sizeof(value), "\n{C60E0E}$%s (/buyhouse)", FormatNumber(HouseInfo[houseid][hValue]));
	if(HouseInfo[houseid][hRented] > 0) format(rent, sizeof(rent), "\n{FFFFFF}Rent: {C60E0E}$%s {FFFFFF}(/rentroom)", FormatNumber(HouseInfo[houseid][hRented]));
	new pickupid;
	switch(HouseInfo[houseid][hOwned]) {
		case false: {
			format(gString, sizeof(gString), "{C60E0E}%s\n{FFFFFF}ID: {C60E0E}%d\n{FFFFFF}Size: {C60E0E}%s\n{FFFFFF}Owner: {C60E0E}The State\n{FFFFFF}Level: {C60E0E}%d%s", HouseInfo[houseid][hDescription], HouseInfo[houseid][hID], GetHouseSize(HouseInfo[houseid][hSize]), HouseInfo[houseid][hLevel], value);
			pickupid = CreatePickup(1273, 23, HouseInfo[houseid][hEnterPos][0], HouseInfo[houseid][hEnterPos][1], HouseInfo[houseid][hEnterPos][2]);
		}
		case true: {
			format(gString, sizeof(gString), "{C60E0E}%s\n{FFFFFF}ID: {C60E0E}%d\n{FFFFFF}Size: {C60E0E}%s\n{FFFFFF}Owner: {C60E0E}%s\n{FFFFFF}Level: {C60E0E}%d%s%s", HouseInfo[houseid][hDescription], HouseInfo[houseid][hID], GetHouseSize(HouseInfo[houseid][hSize]), HouseInfo[houseid][hOwner], HouseInfo[houseid][hLevel], rent, value);
			pickupid = CreatePickup(1272, 23, HouseInfo[houseid][hEnterPos][0], HouseInfo[houseid][hEnterPos][1], HouseInfo[houseid][hEnterPos][2]);
		}
	}
	PickupInfo[pickupid][pkType] = 1;
	PickupInfo[pickupid][pkID] = houseid;
	HouseInfo[houseid][hPickupid] = pickupid;
	HouseInfo[houseid][hLabel] = Create3DTextLabel(gString, 0xFFFFFFD1, HouseInfo[houseid][hEnterPos][0], HouseInfo[houseid][hEnterPos][1], HouseInfo[houseid][hEnterPos][2], 10.0);
	return true;
}

YCMD:sellhousetostate(playerid, params[], help) {
	if(PlayerInfo[playerid][pHouse] == -1)
		return SCM(playerid, COLOR_GREY, "Nu ai o casa.");

	if(PlayerVar[playerid][IsTrade] != -1)
		return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta functie in timp ce faci trade.");

	new i = PlayerVar[playerid][HouseID];
	gString[0] = EOS;
	format(gString, sizeof(gString), "you are about to sell the house.\nAre you sure you want to sell the house for $%s?", FormatNumber(HouseInfo[i][hOldValue]/2));
	ShowPlayerDialog(playerid, DIALOG_HSTATESELL, DIALOG_STYLE_MSGBOX, "Sell House to state:", gString, "Sell", "Close");
	return true;
}

YCMD:asellhouse(playerid, params[], help) {
	if(!IsAdmin(playerid, 6))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	if(sscanf(params, "i", params[0]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/asellhouse [houseid]");

	if(!ValidHouse(params[0]))
		return SCM(playerid, COLOR_GREY, "invalid houseid.");

	new i = params[0];
	HouseInfo[i][hOwned] = false;
	format(HouseInfo[i][hOwner], 24, "The State");
	HouseInfo[i][hValue] = HouseInfo[i][hOldValue];

	UpdateHouseLabel(i);

	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `houses` SET `Owned`='0', `Owner`='The State', `Value`='%d' WHERE `ID`='%d'", HouseInfo[i][hValue], HouseInfo[i][hID]);
	mysql_tquery(SQL, gQuery);
	mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `users` SET `House` = '-1', `SpawnChange` = '0' WHERE `House` = '%i'", HouseInfo[i][hID]);
	mysql_tquery(SQL, gQuery);
	foreach(new x : Player) {
		if(PlayerInfo[x][pHouse]==HouseInfo[i][hID]) {
			PlayerInfo[x][pHouse] = -1;
			PlayerInfo[x][pSpawnChange] = 0;
			format(gString, 128, "* Admin %s ti-a vandut casa la stat.", GetName(playerid));
			SCM(x, COLOR_YELLOW, gString);
			break;
		}
	}
	format(gString, sizeof(gString), "/asellhouse: %s a vandut casa %d la stat.", GetName(playerid), HouseInfo[i][hID]);
	SendAdminMessage(COLOR_ADMCHAT, gString, 6);
	return true;
}

YCMD:sleep(playerid, params[], help) {
	if(!IsHouse(playerid))
		return SCM(playerid, COLOR_GREY, "Nu ai rent la o casa. Pentru asta foloseste [/rentroom].");

	if(PlayerVar[playerid][IsHouses] != PlayerVar[playerid][HouseID])
		return SCM(playerid, COLOR_GREY, "Nu te afli in casa ta.");

	PlayerVar[playerid][Sleeping] = PlayerVar[playerid][Sleeping] ? false : true;

	switch(PlayerVar[playerid][Sleeping]) {
		case true: {
			TogglePlayerControllable(playerid, false);
			SCM(playerid, COLOR_PINK, "Now sleep.");
			SCM(playerid, COLOR_LGREEN, "Recommendation: If you want to leave the game on the bar, we recommend that you first press the ESC key to avoid any problems.");
			LoopingAnim(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
			SetPlayerHealth(playerid, 99);
			SetPlayerColor(playerid, 0x707070FF);
			Tazer[playerid] = false;
			if(PlayerVar[playerid][Duty]) {
				PlayerVar[playerid][Duty] = false;
				SCM(playerid, COLOR_PINK, "Nu mai esti duty.");
				if(PlayerVar[playerid][FactionVehicle] != INVALID_VEHICLE_ID) FDespawnVehicle(playerid);
				SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
				SetPlayerArmour(playerid, 0);
				ResetPlayerWeapons(playerid);
			}		
		}
		case false: {
			TogglePlayerControllable(playerid, true);
			ClearAnimations(playerid);
			SCM(playerid, COLOR_PINK, "Welcome back!");
			SetTeamColor(playerid);
			SetPlayerHealth(playerid, 99);
		}
	}
	return true;
}

stock GetHouseSize(size) {
	new x[10];
	switch(size) {
		case 1: x = "Small";
		case 2: x = "Medium";
		case 3: x = "Big";
	}
	return x;
}

function SQL_InsertHouse(playerid, price, level, size, e, Float: x, Float: y, Float: z) {
	SqlHouses ++;
	new i = SqlHouses;
	HouseInfo[i][hID] = cache_insert_id();
	HouseInfo[i][hValue] = price;
	HouseInfo[i][hOldValue] = price;
	HouseInfo[i][hEnterPos][0] = x;
	HouseInfo[i][hEnterPos][1] = y;
	HouseInfo[i][hEnterPos][2] = z;
	HouseInfo[i][hExitPos][0] = InteriorPos[e][0];
	HouseInfo[i][hExitPos][1] = InteriorPos[e][1];
	HouseInfo[i][hExitPos][2] = InteriorPos[e][2];
	HouseInfo[i][hInterior] = GetHouseInterior[e];
	HouseInfo[i][hVirtualWorld] = HouseInfo[i][hID];
	HouseInfo[i][hSize] = size;
	HouseInfo[i][hLevel] = level;

	format(HouseInfo[i][hDescription], 32, "None");

	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `houses` SET `VirtualWorld`='%d' WHERE `ID`='%d'", HouseInfo[i][hID], HouseInfo[i][hID]);
	mysql_tquery(SQL, gQuery, "", "");

	gString[0] = EOS;
	format(gString, sizeof(gString), "* House[id: %d] | Price: %s | level: %d | size: %s was created [/createhouse] by Admin %s[admin: %d]", HouseInfo[i][hID], FormatNumber(HouseInfo[i][hValue]), HouseInfo[i][hLevel], GetHouseSize(size), GetName(playerid), PlayerInfo[playerid][pSQLID]);
	SendAdminMessage(COLOR_YELLOW, gString, 7);

	UpdateHouseLabel(i);
	return true;
}

function CheckHouse(playerid, id) {
	for(new i = 1; i <= SqlHouses; i++) {
		if(HouseInfo[i][hID] == id) {
			PlayerVar[playerid][HouseID] = i;
			break;
		}
	}
	return -1;
}

function IsHouse(playerid) {
	if(PlayerInfo[playerid][pHouse] != -1) return PlayerInfo[playerid][pHouse];
	else if(PlayerInfo[playerid][pRentroom] != -1) return PlayerInfo[playerid][pRentroom];
	return false;
}

function SQL_HouseInfo(playerid, i) {
	new renter = cache_num_rows();
	gString[0] = EOS;
	format(gString, sizeof(gString), "House ID: %d\nDescription: %s\nSize: %s\nHouse Old Values: $%s\nRenters: %d\nRent: $%s\nBalance: $%s\nSell House: %s%s", HouseInfo[i][hID], HouseInfo[i][hDescription], GetHouseSize(HouseInfo[i][hSize]), FormatNumber(HouseInfo[i][hOldValue]), renter, FormatNumber(HouseInfo[i][hRented]), FormatNumber(HouseInfo[i][hBalance]), HouseInfo[i][hValue] != 0 ? ("$") : (""), HouseInfo[i][hValue] != 0 ? (FormatNumber(HouseInfo[i][hValue])) : ("None"));
	ShowPlayerDialog(playerid, DIALOG_HINFO, DIALOG_STYLE_MSGBOX, "House Info", gString, "Back", "Close");
	return true;
}

function ValidHouse(houseid) {
	if(houseid > SqlHouses) return false;
	if(HouseInfo[houseid][hID] != 0) return true;
	return false;
}

function GetHouseID(houseid) {
	new x;
	for(new i = 1; i <= SqlHouses; i++) {
		if(HouseInfo[i][hID] == houseid) {
			x = i;
			break;
		}
	}
	return x;
}
// ============================================== Commmands ============================== //

YCMD:createhouse(playerid, params[], help) {
	if(!IsAdmin(playerid, 7))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	if(SqlHouses >= MAX_HOUSES) {
		gString[0] = EOS;
		format(gString, sizeof(gString), "There can be a maximum of %d houses", MAX_HOUSES);
		SCM(playerid, COLOR_GREY, gString);
		return true;
	}

	new price, level, size;
	if(sscanf(params, "iii", price, level, size)){
		SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/createhouse [price] [level] [size]");
		SCM(playerid, COLOR_WHITE, "size: (1) Small / (2) Medium / (3) Big");
		return true;
	}

	if(1 < price > 2000000000)
		return SCM(playerid, COLOR_GREY, "Price Invalid.");

	if(1 < size > 3)
		return SCM(playerid, COLOR_GREY, "Size Invalid");

	new Float: Pos[3], i;
	GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
	switch(size) {
		case 1: i = RandomEx(0, 10);
		case 2:	i = RandomEx(11, 32);
		case 3: i = RandomEx(33, 35);
	}

	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "INSERT INTO houses (EnterPosX, EnterPosY, EnterPosZ, ExitPosX, ExitPosY, ExitPosZ, Value, OldValue, Size, Level, Interior, InteriorID) VALUES (%f, %f, %f, %f, %f, %f, %d, %d, %d, %d, %d, %i)", Pos[0], Pos[1], Pos[2], InteriorPos[i][0], InteriorPos[i][1], InteriorPos[i][2], price, price, size, level, GetHouseInterior[i], i+1);
	mysql_tquery(SQL, gQuery, "SQL_InsertHouse", "iiiiifff", playerid, price, level, size, i, Pos[0], Pos[1], Pos[2]);
	return true;
}

YCMD:home(playerid, params[], help) {
	if(!IsHouse(playerid)) 
		return SCM(playerid, COLOR_GREY, "Nu ai o casa.");
	new x;

	if(PlayerInfo[playerid][pHouse] != -1) x = GetHouseID(PlayerInfo[playerid][pHouse]);
	else x = GetHouseID(PlayerInfo[playerid][pRentroom]);

	SetPlayerCheckpointEx(playerid, CP_NORMAL, HouseInfo[x][hEnterPos][0], HouseInfo[x][hEnterPos][1], HouseInfo[x][hEnterPos][2], 2.0);
	gString[0] = EOS;
	format(gString, sizeof(gString), "Mergi la punctul rosu de pe minimap pentru a ajunge la casa ta. Distanta: %.0fm.", GetPlayerDistanceFromPoint(playerid, HouseInfo[x][hEnterPos][0], HouseInfo[x][hEnterPos][1], HouseInfo[x][hEnterPos][2]));
	SCM(playerid, COLOR_YELLOW, gString);	
	return true;
}

YCMD:buyhouse(playerid, params[], help) {
	if(PlayerInfo[playerid][pHouse] != -1) 
		return SCM(playerid, COLOR_LGREEN, "You already have a house.");

	gString[0] = EOS;
	new x = PlayerVar[playerid][IsPickup], i = PickupInfo[x][pkID];
	if(PickupInfo[x][pkType] != 1) 
		return true;

	if(!PlayerToPoint(playerid, 2, HouseInfo[i][hEnterPos][0], HouseInfo[i][hEnterPos][1], HouseInfo[i][hEnterPos][2]))
		return true;

	if(HouseInfo[i][hOwned]) return SCM(playerid, COLOR_GREY, "Aceasta casa nu este la vanzare.");

	if(PlayerInfo[playerid][pLevel] < HouseInfo[i][hLevel]) {
		format(gString, sizeof(gString), "You need level %d to buy this house.", HouseInfo[i][hLevel]);
		SCM(playerid, COLOR_GREY, gString);
		return true;
	}	

	if(GetPlayerCash(playerid) < HouseInfo[i][hValue]) {
		format(gString, sizeof(gString), "You need $%s to buy this house.", FormatNumber(HouseInfo[i][hValue]));
		SCM(playerid, COLOR_GREY, gString);
		return true;
	}

	GivePlayerCash(playerid, -HouseInfo[i][hValue]);
	if(HouseInfo[i][hOwned] != false) {
		new p = GetPlayerSQLID(HouseInfo[i][hUserid]);
		if(p != INVALID_PLAYER_ID) {
			GivePlayerBank(p, HouseInfo[i][hValue]);
			format(gString, sizeof(gString), "%s[%d] ti-a cumparat casa pentru suma de $%s.", GetName(playerid), playerid, FormatNumber(HouseInfo[i][hValue]));
			SCM(p, COLOR_MONEY, gString);
			PlayerInfo[playerid][pHouse] = -1;
			PlayerVar[playerid][HouseID] = false;
		}
		gQuery[0] = EOS;
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `Bank`=`Bank`+'%d', `House`='-1' WHERE `id`='%d'", HouseInfo[i][hValue], HouseInfo[i][hUserid]);
		mysql_tquery(SQL, gQuery, "", "");
	}
	format(gString, sizeof(gString), "Congratulations! you bought house id %d for $%s.", HouseInfo[i][hID], FormatNumber(HouseInfo[i][hValue]));
	SCM(playerid, COLOR_YELLOW, gString);
	GiveHouse(playerid, i);
	SetPlayerPos(playerid, HouseInfo[i][hExitPos][0], HouseInfo[i][hExitPos][1], HouseInfo[i][hExitPos][2]);
	SetPlayerInterior(playerid, HouseInfo[i][hInterior]);
	SetPlayerVirtualWorld(playerid, HouseInfo[i][hVirtualWorld]);
	PlayerVar[playerid][IsHouses] = i;
	return true;
}

function GiveHouse(playerid, i) {
	format(HouseInfo[i][hOwner], MAX_PLAYER_NAME, PlayerInfo[playerid][pName]);
	HouseInfo[i][hOwned] = true;
	HouseInfo[i][hUserid] = PlayerInfo[playerid][pSQLID];
	PlayerInfo[playerid][pHouse] = HouseInfo[i][hID];
	HouseInfo[i][hValue] = false;
	UpdateVar(playerid, "House", PlayerInfo[playerid][pHouse]);

	if(PlayerInfo[playerid][pRentroom] != -1) {
		PlayerInfo[playerid][pRentroom] = -1;
		UpdateVar(playerid, "Rentroom", -1);
	}
	PlayerVar[playerid][HouseID] = i;
	PlayerVar[playerid][IsHouses] = i;
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `houses` SET `Owner`='%s', `Owned`='%d', `Userid`='%d', `Value`='0' WHERE `ID`='%d'", HouseInfo[i][hOwner], HouseInfo[i][hOwned], HouseInfo[i][hUserid], HouseInfo[i][hID]);
	mysql_tquery(SQL, gQuery, "", "");
	UpdateHouseLabel(i);
	return true;
}

YCMD:givehouse(playerid, params[], help) {
	if(!IsAdmin(playerid, 7))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new id, hid;
	if(sscanf(params, "ui", id, hid))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/givehouse [playerid/name] [houseid]");

	if(!ValidHouse(hid))
		return SCM(playerid, COLOR_GREY, "Invalid houseid");

	new hidd = GetHouseID(hid);

	GiveHouse(id, hidd);
	gString[0] = EOS;
	format(gString, sizeof(gString), "* %s[admin: %d] give house[id: %d] %s[user: %d].", PlayerInfo[playerid][pName], PlayerInfo[playerid][pSQLID], hid, PlayerInfo[id][pName], PlayerInfo[id][pSQLID]);
	SendAdminMessage(COLOR_YELLOW, gString, 6);
	format(gString, sizeof(gString), "Admin %s ti-a dat casa cu id %d.", GetName(playerid), hid);
	SCM(id, COLOR_WHITE, gString);
	return true;
}
alias:housemenu("hmenu");
YCMD:housemenu(playerid, params[], help) {
	if(PlayerInfo[playerid][pHouse] == -1)
		return SCM(playerid, COLOR_GREY, "You do not own a House");

	if(PlayerVar[playerid][IsTrade] != -1)
		return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta functie in timp ce faci trade.");

	ShowPlayerDialog(playerid, DIALOG_HMENU, DIALOG_STYLE_LIST, "House Menu", "House Info\nHouse Description\nSet Rent\nWithdraw\nDeposit\nDoors Status\nSell House\nHouse Radio\nHouse Upgrades", "Select", "Cancel");
	return true;
}

YCMD:unrentroom(playerid, params[], help) {
	if(PlayerInfo[playerid][pRentroom] == -1)
		return SCM(playerid, COLOR_GREY, "You not rent a house.");

	PlayerInfo[playerid][pSpawnChange] = 0;
	PlayerInfo[playerid][pRentroom] = -1;
	SCM(playerid, COLOR_PINK, "You unrentroom.");
	UpdateVar(playerid, "Rentroom", -1);
	UpdateVar(playerid, "Spawnchange", 0);
	return true;
}

YCMD:rentroom(playerid, params[], help) {
	if(PlayerInfo[playerid][pRentroom] != -1) return SCM(playerid, COLOR_GREY, "You already rent a house.");
	if(PlayerInfo[playerid][pHouse] != -1) return SCM(playerid, COLOR_GREY, "You already have a house.");

	new x = PlayerVar[playerid][IsPickup], i = PickupInfo[x][pkID];
	if(PickupInfo[x][pkType] != 1) 
		return true;

	if(!PlayerToPoint(playerid, 2, HouseInfo[i][hEnterPos][0], HouseInfo[i][hEnterPos][1], HouseInfo[i][hEnterPos][2]))
		return true;

	if(HouseInfo[i][hRented] == 0) 
		return SCM(playerid, COLOR_GREY, "Aceasta casa nu are rentu activ.");

	PlayerInfo[playerid][pRentroom] = HouseInfo[i][hID];
	UpdateVar(playerid, "Rentroom", PlayerInfo[playerid][pRentroom]);

	PlayerInfo[playerid][pSpawnChange] = 1;
	UpdateVar(playerid, "Spawnchange", 1);

	PlayerVar[playerid][HouseID] = i;
	PlayerVar[playerid][IsHouses] = i;
	SetPlayerPos(playerid, HouseInfo[i][hExitPos][0], HouseInfo[i][hExitPos][1], HouseInfo[i][hExitPos][2]);
	SetPlayerInterior(playerid, HouseInfo[i][hInterior]);
	SetPlayerVirtualWorld(playerid, HouseInfo[i][hVirtualWorld]);			

	SCM(playerid, COLOR_YELLOW, "You took a rent at this house.");
	return true;
}

YCMD:movehouse(playerid, params[], help) {
	if(!IsAdmin(playerid, 7))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new id;
	if(sscanf(params, "i", id))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/movehouse [houseid]");

	if(!ValidHouse(id)) return SCM(playerid, COLOR_GREY, "Invalid House.");
	listitemm[playerid] = id;
	ShowPlayerDialog(playerid, DIALOG_MOVEHOUSE, DIALOG_STYLE_LIST, "Move House", "Interior Pos\nExterior Pos\nAlea House Vehicle\nGarage Pos", "Select", "Close");
	return true;
}

YCMD:gotohouse(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new id;
	if(sscanf(params, "i", id))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/gotohouse [houseid]");

	if(!ValidHouse(id)) return SCM(playerid, COLOR_GREY, "Invalid Hosue ID.");

	SetPlayerPos(playerid, HouseInfo[id][hEnterPos][0], HouseInfo[id][hEnterPos][1], HouseInfo[id][hEnterPos][2]);
	SetPlayerVirtualWorld(playerid, 0);
	SetPlayerInterior(playerid, 0);

	gString[0] = EOS;
	format(gString, sizeof(gString), "You teleported home %d.", id);
	SCM(playerid, COLOR_YELLOW, gString);
	return true;
}

YCMD:edithouse(playerid, params[], help) {
	if(!IsAdmin(playerid, 7))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new id, type, amount;
	if(sscanf(params, "iii", id, type, amount)) {
		SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/edithouse [houseid] [type] [amount]");
		SCM(playerid, COLOR_GREY, "type: (1) Level / (2) Price / (3) Owned / (4) Status");
		return true;
	}
	if(!ValidHouse(id)) return SCM(playerid, COLOR_GREY, "Invalid House ID.");
	if(1 < type > 4) return SCM(playerid, COLOR_GREY, "Invalid Type.");

	new x = GetHouseID(id), types[20];
	gQuery[0] = EOS;
	switch(type) {
		case 1: {
			HouseInfo[x][hLevel] = amount;

			mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `houses` SET `Level`='%d' WHERE `ID`='%d'", HouseInfo[x][hLevel], HouseInfo[x][hID]);
			mysql_tquery(SQL, gQuery, "", "");
			types = "level";
			UpdateHouseLabel(x);
		}
		case 2: {
			if(0 < amount > 500000000) return SCM(playerid, COLOR_GREY, "Invalid Amount.");
			HouseInfo[x][hValue] = amount;

			mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `houses` SET `Value`='%d' WHERE `ID`='%d'", HouseInfo[x][hValue], HouseInfo[x][hID]);
			mysql_tquery(SQL, gQuery, "", "");
			types = "Price";
			UpdateHouseLabel(x);
		}
		case 3: {
			if(0 < amount > 1) return SCM(playerid, COLOR_GREY, "Invalid Amount.");
			if(amount == 0) {
				mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `houses` SET `Owned`='0', `Userid`='0', `Owner`='The State' WHERE `ID`='%d'", HouseInfo[x][hID]);
				mysql_tquery(SQL, gQuery, "", "");
				foreach(new i : Player) {
					if(PlayerInfo[i][pHouse] == HouseInfo[x][hID]) {
						PlayerInfo[i][pHouse] = -1;
						break;
					}
				}
				mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `House`='-1' WHERE `id`='%d'", HouseInfo[x][hUserid]);
				mysql_tquery(SQL, gQuery, "", "");

				HouseInfo[x][hOwned] = false;
				HouseInfo[x][hUserid] = false;
				format(HouseInfo[x][hOwner], MAX_PLAYER_NAME, "The State");
			} else {
				mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `houses` SET `Owned`='%d' WHERE `ID`='%d'", amount, HouseInfo[x][hID]);
				mysql_tquery(SQL, gQuery, "", "");		
				HouseInfo[x][hOwned] = true;		
			}
			types = "Owned";
			UpdateHouseLabel(x);
		}
		case 4: {
			if(0 < amount > 1) return SCM(playerid, COLOR_GREY, "Invalid Amount.");
			switch(amount) {
				case 0: HouseInfo[x][hStatus] = false; 
				case 1: HouseInfo[x][hStatus] = true;
			} 
			types = "Status";
			UpdateHouseLabel(x);

			mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `houses` SET `Status`='%d' WHERE `ID`='%d'", amount, HouseInfo[x][hID]);
			mysql_tquery(SQL, gQuery, "", "");	
		}
	}
	gString[0] = EOS;
	format(gString, sizeof(gString), "* %s[admin: %d] update house[id: %d] %s: %s.", PlayerInfo[playerid][pName], PlayerInfo[playerid][pSQLID], HouseInfo[x][hID], types, FormatNumber(amount));
	SendAdminMessage(COLOR_YELLOW, gString, 7);
	return true;
}

YCMD:findhouse(playerid, params[], help) {
	if(HaveCheckpoint(playerid)) return ShowCancelCP(playerid);

	new id;
	if(sscanf(params, "i", id))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/findhouse [houseid]");

	if(!ValidHouse(id)) return SCM(playerid, COLOR_GREY, "Invalid House ID.");
	new x = GetHouseID(id);

	SetPlayerCheckpointEx(playerid, CP_NORMAL, HouseInfo[x][hEnterPos][0], HouseInfo[x][hEnterPos][1], HouseInfo[x][hEnterPos][2], 2.0);

	gString[0] = EOS;
	format(gString, sizeof(gString), "Mergi la punctul rosu de pe minimap pentru a ajunge la casa aleasa de tine. Distanta: %.0fm.", GetPlayerDistanceFromPoint(playerid, HouseInfo[x][hEnterPos][0], HouseInfo[x][hEnterPos][1], HouseInfo[x][hEnterPos][2]));
	SCM(playerid, COLOR_YELLOW, gString);
	return true;
}