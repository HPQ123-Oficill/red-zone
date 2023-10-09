function SQL_LoadBussines() {
	SqlBussines = cache_num_rows();
	printf("[MySQL] Bussines: %d", SqlBussines);
	if(SqlBussines == 0) return true;
	new x, act,i=-1;
	while(++i<SqlBussines) {
		x = i+1;

		cache_get_value_name_int(i, "ID", BizzInfo[x][bID]);
		cache_get_value_name_int(i, "Userid", BizzInfo[x][bUserid]);
		cache_get_value_name_int(i, "Owned", BizzInfo[x][bOwned]);
		cache_get_value_name_int(i, "Fee", BizzInfo[x][bFee]);
		cache_get_value_name_int(i, "Static", BizzInfo[x][bStatic]);
		cache_get_value_name_int(i, "Value", BizzInfo[x][bValue]);
		cache_get_value_name_int(i, "OldValue", BizzInfo[x][bOldValue]);
		cache_get_value_name_int(i, "Status", BizzInfo[x][bStatus]);
		cache_get_value_name_int(i, "Balance", BizzInfo[x][bBalance]);
		cache_get_value_name_float(i, "EnterPosX", BizzInfo[x][bEnterPos][0]);
		cache_get_value_name_float(i, "EnterPosY", BizzInfo[x][bEnterPos][1]);
		cache_get_value_name_float(i, "EnterPosZ", BizzInfo[x][bEnterPos][2]);
		cache_get_value_name_float(i, "ExitPosX", BizzInfo[x][bExitPos][0]);
		cache_get_value_name_float(i, "ExitPosY", BizzInfo[x][bExitPos][1]);
		cache_get_value_name_float(i, "ExitPosZ", BizzInfo[x][bExitPos][2]);
		cache_get_value_name_int(i, "Interior", BizzInfo[x][bInterior]);
		cache_get_value_name_int(i, "VirtualWorld", BizzInfo[x][bVirtualWorld]);
		cache_get_value_name_int(i, "Type", BizzInfo[x][bType]);
		cache_get_value_name_int(i, "Level", BizzInfo[x][bLevel]);

		cache_get_value_name(i, "Owner", BizzInfo[x][bOwner]);
		cache_get_value_name(i, "Description", BizzInfo[x][bDescription]);

		UpdateBizzLabel(x);
		switch(BizzInfo[x][bType]) {
			case 1: act = CreateDynamicActor(76,2308.0903,-10.8133,26.7422,176.9675, 1, 10.0, BizzInfo[x][bVirtualWorld], BizzInfo[x][bInterior]);
			case 2: act = CreateDynamicActor(179, 295.9806,-82.9439,1001.5156,1.2299, 1, 10.0, BizzInfo[x][bVirtualWorld], BizzInfo[x][bInterior]);
			case 3: act = CreateDynamicActor(151,501.6980,-20.2866,1000.6797,90.4864, 1, 10.0, BizzInfo[x][bVirtualWorld], BizzInfo[x][bInterior]);
			case 4: act = CreateDynamicActor(226,-103.7321,-24.2025,1000.7188,0.9657, 1, 10.0, BizzInfo[x][bVirtualWorld], BizzInfo[x][bInterior]);
			case 5: {
				if GetDistanceBetweenPoints(2318.9575,-88.6578,26.4844, BizzInfo[x][bEnterPos][0], BizzInfo[x][bEnterPos][1], BizzInfo[x][bEnterPos][2]) < 10 *then tut_store=x;
				act = CreateDynamicActor(190,-29.1593,-186.8161,1003.5469,0.6056, 1, 10.0, BizzInfo[x][bVirtualWorld], BizzInfo[x][bInterior]);
			}
			case 6: {
				if GetDistanceBetweenPoints(2273.4978,82.0440,26.4844, BizzInfo[x][bEnterPos][0], BizzInfo[x][bEnterPos][1], BizzInfo[x][bEnterPos][2]) < 10 *then tut_clothes=x;
				act = CreateDynamicActor(224,204.3425,-157.8297,1000.5234,180.4840, 1, 10.0, BizzInfo[x][bVirtualWorld], BizzInfo[x][bInterior]);
			}
			case 7: act = CreateDynamicActor(205,376.9858,-65.7571,1001.5078,178.5343, 1, 10.0, BizzInfo[x][bVirtualWorld], BizzInfo[x][bInterior]);
			case 12: act = CreateDynamicActor(155,380.7504,-188.7789,1000.6328,137.6733, 1, 10.0, BizzInfo[x][bVirtualWorld], BizzInfo[x][bInterior]);
			case 15: act = CreateDynamicActor(40,497.9880,-77.4615,998.7651,357.5675, 1, 10.0, BizzInfo[x][bVirtualWorld], BizzInfo[x][bInterior]);
		}
		ApplyDynamicActorAnimation(act, "COP_AMBIENT", "Coplook_loop", 4.0, 0, 1, 1, 1, -1);

		Iter_Add(BizzType[BizzInfo[x][bType]-1], x);
	}
	i=0;
	while(++i<=15) {
		switch(i) {
			case 2: CreateDynamic3DTextLabel("Hello!\nPress Y to buy a weapon", -1, 295.9806,-82.9439,(1001.5156 + 1.15), 5.0);
			case 3: CreateDynamic3DTextLabel("Hello!\nPress Y to buy a drink", -1, 501.6980,-20.2866,(1000.6797 + 1.15), 5.0);
			case 4: CreateDynamic3DTextLabel("Hello!\nTo buy a dildo use /buydildo", -1, -103.7321,-24.2025,(1000.7188 + 1.15), 5.0);
			case 5: CreateDynamic3DTextLabel("Hello!\nType /buy to buy a item", -1,-29.1593,-186.8161,(1003.5469 + 1.15), 5.0);
			case 6: CreateDynamic3DTextLabel("Hello!\nPress Y to buy clothes!", -1, 204.3425,-157.8297,(1000.5234 + 1.15), 5.0);
			case 7: CreateDynamic3DTextLabel("Hello!\nPress Y to buy a hunger", -1, 376.9858,-65.7571,(1001.5078 + 1.15), 5.0);
			case 12: CreateDynamic3DTextLabel("Hello!\nPress Y to buy a pizza", -1,376.3568,-117.2502,(1001.4922 + 1.15), 5.0);
			case 15: CreateDynamic3DTextLabel("Hello!\nPress Y to buy a computer ticket!\n\nDelia (69)", -1,497.9880,-77.4615,(998.7651 + 1.15), 5.0);
		}	
	}
	return true;
}

function UpdateBizzLabel(bussinesid) {
	gString[0] = EOS;
	new value[70], fee[70], rent[30];
	if BizzInfo[bussinesid][bPickupid]!=-1 *then DestroyPickup(BizzInfo[bussinesid][bPickupid]);
	if BizzInfo[bussinesid][bLabel]!=Text3D:-1 *then Delete3DTextLabel(BizzInfo[bussinesid][bLabel]);
	DestroyDynamicMapIcon(BizzInfo[bussinesid][bMapIcon]);
	if(BizzInfo[bussinesid][bType] == 13) rent = "\n{3B6EEB}(/rentveh)";
	if(BizzInfo[bussinesid][bValue] > 0) format(value, sizeof(value), "\n{3B6EEB}$%s (/buybiz)", FormatNumber(BizzInfo[bussinesid][bValue]));
	if(BizzInfo[bussinesid][bFee] > 0) format(fee, sizeof(fee), "\n{FFFFFF}Fee: {3B6EEB}%s", FormatNumber(BizzInfo[bussinesid][bFee])); 
	switch(BizzInfo[bussinesid][bType]) {
		case 14: {
			switch(BizzInfo[bussinesid][bOwned]) {
				case false: format(gString, sizeof(gString), "{FFFFFF}%s\n{E19D1A}PaintBall Arnea\n{FFFFFF}Owner: {E19D1A}The State%s\n{FFFFFF}Use ({E19D1A}/paint{FFFFFF}) to enter in this arena", BizzInfo[bussinesid][bDescription], value);
				case true: format(gString, sizeof(gString), "{FFFFFF}%s\n{E19D1A}PaintBall Arnea\n{FFFFFF}Owner: {E19D1A}%s%s\n{FFFFFF}Use ({E19D1A}/paint{FFFFFF}) to enter in this arena", BizzInfo[bussinesid][bDescription], BizzInfo[bussinesid][bOwner], value);
			}
		}
		default: {
			switch(BizzInfo[bussinesid][bOwned]) {
				case false: format(gString, sizeof(gString), "{3B6EEB}%s\n{FFFFFF}ID: {3B6EEB}%d\n{FFFFFF}Owner: {3B6EEB}The State\n{FFFFFF}Level: {3B6EEB}%d%s%s%s", BizzInfo[bussinesid][bDescription], BizzInfo[bussinesid][bID], BizzInfo[bussinesid][bLevel], fee, value, rent);
				case true: format(gString, sizeof(gString), "{3B6EEB}%s\n{FFFFFF}ID: {3B6EEB}%d\n{FFFFFF}Owner: {3B6EEB}%s\n{FFFFFF}Level: {3B6EEB}%d%s%s%s", BizzInfo[bussinesid][bDescription], BizzInfo[bussinesid][bID], BizzInfo[bussinesid][bOwner], BizzInfo[bussinesid][bLevel], fee, value, rent);
			}
		}
	}
	BizzInfo[bussinesid][bMapIcon] = CreateDynamicMapIcon(BizzInfo[bussinesid][bEnterPos][0], BizzInfo[bussinesid][bEnterPos][1], BizzInfo[bussinesid][bEnterPos][2], bMapIcons[BizzInfo[bussinesid][bType]-1], 0,0,0,-1,1000.0);
	new pickupid;
	switch(BizzInfo[bussinesid][bType]) {
		case 13: pickupid = CreatePickup(19134, 23, BizzInfo[bussinesid][bEnterPos][0], BizzInfo[bussinesid][bEnterPos][1], BizzInfo[bussinesid][bEnterPos][2]);
		case 14: pickupid = CreatePickup(1313, 23, BizzInfo[bussinesid][bEnterPos][0], BizzInfo[bussinesid][bEnterPos][1], BizzInfo[bussinesid][bEnterPos][2]);
		case 15: pickupid = CreatePickup(19893, 23, BizzInfo[bussinesid][bEnterPos][0], BizzInfo[bussinesid][bEnterPos][1], BizzInfo[bussinesid][bEnterPos][2]);
		default: pickupid = CreatePickup(1239, 23, BizzInfo[bussinesid][bEnterPos][0], BizzInfo[bussinesid][bEnterPos][1], BizzInfo[bussinesid][bEnterPos][2]);
	}
	PickupInfo[pickupid][pkType] = 2;
	PickupInfo[pickupid][pkID] = bussinesid;
	BizzInfo[bussinesid][bPickupid] = pickupid;
	BizzInfo[bussinesid][bLabel] = Create3DTextLabel(gString, 0xFFFFFFFF, BizzInfo[bussinesid][bEnterPos][0], BizzInfo[bussinesid][bEnterPos][1], BizzInfo[bussinesid][bEnterPos][2], 10.0);
	return true;
}

YCMD:editbiz(playerid, params[], help) {
	if(!IsAdmin(playerid, 7))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new id, type, amount;
	if(sscanf(params, "iii", id, type, amount)) {
		SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/editbiz [bussinesid] [type] [amount]");
		SCM(playerid, COLOR_GREY, "type: (1) Level / (2) Price / (3) Owned / (4) Status");
		return true;
	}
	if(!ValidBussines(id)) return SCM(playerid, COLOR_GREY, "Invalid House ID.");
	if(1 < type > 4) return SCM(playerid, COLOR_GREY, "Invalid Type.");

	new x = id, types[20];
	gQuery[0] = EOS;
	switch(type) {
		case 1: {
			HouseInfo[x][hLevel] = amount;

			mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `bussines` SET `Level`='%d' WHERE `ID`='%d'", BizzInfo[x][bLevel], BizzInfo[x][bID]);
			mysql_tquery(SQL, gQuery, "", "");
			types = "level";
			UpdateBizzLabel(x);
		}
		case 2: {
			if(0 < amount > 500000000) return SCM(playerid, COLOR_GREY, "Invalid Amount.");
			BizzInfo[x][bValue] = amount;

			mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `houses` SET `Value`='%d' WHERE `ID`='%d'", BizzInfo[x][bValue], BizzInfo[x][bID]);
			mysql_tquery(SQL, gQuery, "", "");
			types = "Price";
			UpdateBizzLabel(x);
		}
		case 3: {
			if(0 < amount > 1) return SCM(playerid, COLOR_GREY, "Invalid Amount.");
			if(amount == 0) {
				mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `houses` SET `Owned`='0', `Userid`='0', `Owner`='The State' WHERE `ID`='%d'", BizzInfo[x][bID]);
				mysql_tquery(SQL, gQuery, "", "");
				foreach(new i : Player) {
					if(PlayerInfo[i][pBussines] == BizzInfo[x][bID]) {
						PlayerInfo[i][pBussines] = -1;
						break;
					}
				}
				mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `House`='-1' WHERE `id`='%d'", BizzInfo[x][bUserid]);
				mysql_tquery(SQL, gQuery, "", "");

				BizzInfo[x][bOwned] = false;
				BizzInfo[x][bUserid] = false;
				format(BizzInfo[x][bOwner], MAX_PLAYER_NAME, "The State");
			} else {
				mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `houses` SET `Owned`='%d' WHERE `ID`='%d'", amount, BizzInfo[x][bID]);
				mysql_tquery(SQL, gQuery, "", "");		
				BizzInfo[x][bOwned] = true;		
			}
			types = "Owned";
			UpdateBizzLabel(x);
		}
		case 4: {
			if(0 < amount > 1) return SCM(playerid, COLOR_GREY, "Invalid Amount.");
			BizzInfo[x][bStatus] = amount?true:false;
			types = "Status";
			UpdateBizzLabel(x);

			mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `houses` SET `Status`='%d' WHERE `ID`='%d'", amount, BizzInfo[x][bID]);
			mysql_tquery(SQL, gQuery, "", "");	
		}
	}
	gString[0] = EOS;
	format(gString, sizeof(gString), "* %s[admin: %d] update house[id: %d] %s: %s.", PlayerInfo[playerid][pName], PlayerInfo[playerid][pSQLID], BizzInfo[x][bID], types, FormatNumber(amount));
	SendAdminMessage(COLOR_YELLOW, gString, 7);
	return true;
}

enum {
	BIZ_NONE,
	BIZ_BANK,
	BIZ_GUNSHOP,
	BIZ_CLUB,
	BIZ_SEXSHOP,
	BIZ_STORE,
	BIZ_BINCO,
	BIZ_CASINO,
	BIZ_CNN,
	BIZ_GAS,
	BIZ_PNS,
	BIZ_PIZZA,
	BIZ_RENTCAR,
	BIZ_PAINTBALL
}

stock GetPlayerBizzType(playerid, biz) return (BizzInfo[PlayerVar[playerid][IsBizz]][bType]!=biz)?false:true;

stock GetBizzType(type) {
	new x[30];
	switch(type) {
		case 1: x = "Bank";
		case 2: x = "Gun Shop";
		case 3: x = "Club";
		case 4: x = "Sex Shop";
		case 5: x = "24/7";
		case 6: x = "Binco";
		case 7: x = "Burger";
		case 8: x = "Casino";
		case 9: x = "CNN";
		case 10: x = "Gas Station";
		case 11: x = "PNS";
		case 12: x = "Pizza";
		case 13: x = "Rent Car";
		case 14: x = "Paintball";
		case 15: x = "Internet Coffee";
		default: x = "Unknown";
	}
	return x;
}

YCMD:rentveh(playerid, params[], help) {
	new i = PlayerVar[playerid][IsPickup], x = PickupInfo[i][pkID];
	if(PickupInfo[i][pkType] != 2)
		return SCM(playerid, COLOR_GREY, "Nu esti la rent car.");

	if(!PlayerToPoint(playerid, 3.0, BizzInfo[x][bEnterPos][0], BizzInfo[x][bEnterPos][1], BizzInfo[x][bEnterPos][2]) || BizzInfo[x][bType] != 13)
		return SCM(playerid, COLOR_GREY, "Nu esti la rent car.");
	
	if(PlayerVar[playerid][RentVehicle] != 0)
		return SCM(playerid, COLOR_GREY, "Ai deja un vehicul inchiriat.");

	if(GetPlayerVirtualWorld(playerid) != 0)
		return SCM(playerid, COLOR_LGREEN, "Nu poti folosi aceasta comanda din alt virtual world.");

	ClearString();
	format(gString, sizeof gString, "Model\tStock\nSultan\t%d\nLandstalker\t%d\nSentinel\t%d\nSolair\t%d\nFaggio\t%d\nFreeway\t%d\nPCJ-600\t%d\nQuad\t%d", RentStock[0], RentStock[1], RentStock[2], RentStock[3], RentStock[4], RentStock[5], RentStock[6], RentStock[7]);
	ShowPlayerDialog(playerid, DIALOG_RENT, DIALOG_STYLE_TABLIST_HEADERS, "Rent Vehicle:", gString, "Select", "Close");
	return true;
}

function DestroyRentCar(playerid) {
	DestroyVehicleEx(PlayerVar[playerid][RentVehicle]);
	VehicleAcces[PlayerVar[playerid][RentVehicle]] = -1;
	switch(GetVehicleModel(PlayerVar[playerid][RentVehicle])) {
		case 560: RentStock[0] ++;
		case 400: RentStock[1] ++;
		case 405: RentStock[2] ++;
		case 458: RentStock[3] ++;
		case 462: RentStock[4] ++;
		case 463: RentStock[5] ++;
		case 461: RentStock[6] ++;
		case 471: RentStock[7] ++;
	}
	if(Iter_Contains(Renters, playerid)) Iter_Remove(Renters, playerid);
	PlayerVar[playerid][RentVehicle] = 0;
	return true;
}

function PlayerGunObject(playerid) {
	for(new i = 0; i < 9; i++) StoreGun[playerid][i] = CreatePlayerObject(playerid, GunModel[0][i], GunPosOld[i][0], GunPosOld[i][1], GunPosOld[i][2], GunPosOld[i][3], GunPosOld[i][4], GunPosOld[i][5], 50.0);
	return true;
}

YCMD:unrentveh(playerid, params[], help) {
	if(!PlayerVar[playerid][RentVehicle])
		return SCM(playerid, COLOR_GREY, "Nu ai un vehicul inchiriat.");

	DestroyRentCar(playerid);
	GameTextForPlayer(playerid, "~w~~h~vehiculul a fost despawnat!", 5000, 3);
	return true;
}

YCMD:createbiz(playerid, params[], help) {
	if(!IsAdmin(playerid, 7))
		return true;

	new type, price, level;
	if(sscanf(params, "iii", type, price, level)) {
		SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/createbiz: [type] [price] [level]");
		SCM(playerid, COLOR_WHITE, "type: (1) Bank / (2) Gun Shop / (3) Club / (4) Sex Shop / (5) 24/7 / (6) Binco / (7) Burger / (8) Casino");
		SCM(playerid, COLOR_WHITE, "type: (9) CNN / (10) Gas Station / (11) PNS / (12) Pizza / (13) rentcar / (14) PaintBall / (15) Internet Coffee");
		return true;
	}
	if(SqlBussines >= MAX_BUSSINES) return SCM(playerid, COLOR_GREY, "Bussines MAX.");
	if(1 < type > 15)
		return SCM(playerid, COLOR_GREY, "Invalid Type ID.");

	if(1 < price > 2000000000) 
		return SCM(playerid, COLOR_GREY, "Invalid Money.");

	new Float: Pos[3];
	GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);

	type --;
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "INSERT INTO `bussines` (EnterPosX, EnterPosY, EnterPosZ, ExitPosX, ExitPosY, ExitPosZ, Interior, Type, Value, OldValue, Level) VALUES (%f, %f, %f, %f, %f, %f, %d, %d, %d, %d, %d)",
		Pos[0], Pos[1], Pos[2], bInteriorPos[type][0], bInteriorPos[type][1], bInteriorPos[type][2], bInteriors[type], type+1, price, price, level);
	mysql_tquery(SQL, gQuery, "SQL_InsertBussines", "iiiifff", playerid, type+1, price, level, Pos[0], Pos[1], Pos[2]);
	return true;
}

function ValidBussines(bussinesid) return BizzInfo[bussinesid][bID] != 0 ? (true):(false);

function ShowGun(playerid, bool: type) {
	new last = PlayerVar[playerid][LastStoreGun], x;
	x = PlayerVar[playerid][IsStoreGun] = type ? (PlayerVar[playerid][IsStoreGun] + 1 > 8 ? 0 : PlayerVar[playerid][IsStoreGun] + 1) : (PlayerVar[playerid][IsStoreGun] - 1 < 0 ? 8 : PlayerVar[playerid][IsStoreGun] - 1); 
	PlayerVar[playerid][LastStoreGun] = x;
	ClearString();
	format(gString, 100, "%s - ~g~$%s", StoreGunsName[x], FormatNumber(GunsType[1][x]));
	PlayerTextDrawSetString(playerid, GunPTD, gString);
	MovePlayerObject(playerid, StoreGun[playerid][x], GunPosNew[x][0], GunPosNew[x][1], GunPosNew[x][2], 5.0, GunPosNew[x][3], GunPosNew[x][4], GunPosNew[x][5]);
	MovePlayerObject(playerid, StoreGun[playerid][last], GunPosOld[last][0], GunPosOld[last][1], GunPosOld[last][2], 5.0, GunPosOld[last][3], GunPosOld[last][4], GunPosOld[last][5]);
	if(last == 2 && x == 3 || last == 0 && x == 8) {
		InterpolateCameraPos(playerid, 290.385040, -83.352043, 1003.680541, 300.971069, -82.572586, 1004.199401, 3000);
		InterpolateCameraLookAt(playerid, 294.033416, -83.447189, 1000.262878, 300.956634, -87.493240, 1003.312316, 3100);
		return true;
	}
	if(last == 9 && x == 8 || last == 8 && x == 0 || last == 3 && x == 2) {
		InterpolateCameraPos(playerid, 300.971038, -82.572586, 1004.199401, 290.700836, -83.294578, 1003.611938, 3000);
		InterpolateCameraLookAt(playerid, 301.118194, -87.496719, 1003.344238, 294.236206, -83.328765, 1000.076416, 3100);
	}
	return true;
}

YCMD:buybiz(playerid, params[], help) {
	if(PlayerInfo[playerid][pBussines] != -1) 
		return SCM(playerid, COLOR_LGREEN, "You already have a business.");

	gString[0] = EOS;
	for(new i = 1; i <= SqlBussines; i++) {
		if(PlayerToPoint(playerid, 2, BizzInfo[i][bEnterPos][0], BizzInfo[i][bEnterPos][1], BizzInfo[i][bEnterPos][2])) {
			if(BizzInfo[i][bOwned]) return SCM(playerid, COLOR_GREY, "Acest biz nu este la vanzare.");	

			if(PlayerInfo[playerid][pLevel] < BizzInfo[i][bLevel]) {
				format(gString, sizeof(gString), "You need level %d to buy this bussines.", BizzInfo[i][bLevel]);
				SCM(playerid, COLOR_GREY, gString);
				return true;
			}		
			if(GetPlayerCash(playerid) < BizzInfo[i][bValue]) {
				format(gString, sizeof(gString), "You need $%s to buy this bussines.", FormatNumber(BizzInfo[i][bValue]));
				SCM(playerid, COLOR_GREY, gString);
				return true;
			}
			GivePlayerCash(playerid, -BizzInfo[i][bValue]);
			if(BizzInfo[i][bOwned] != false) {
				new p = GetPlayerSQLID(BizzInfo[i][bUserid]);
				if(p != INVALID_PLAYER_ID) {
					GivePlayerBank(p, BizzInfo[i][bValue]);
					format(gString, sizeof(gString), "%s[%d] ti-a cumparat biz-ul pentru suma de $%s.", GetName(playerid), playerid, FormatNumber(BizzInfo[i][bValue]));
					SCM(p, COLOR_MONEY, gString);
					PlayerInfo[playerid][pBussines] = -1;
					PlayerVar[playerid][BussinesID] = -1;
				}
				gQuery[0] = EOS;
				mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `Bank`=`Bank`+'%d', `Bussines`='-1' WHERE `id`='%d'", BizzInfo[i][bValue], BizzInfo[i][bUserid]);
				mysql_tquery(SQL, gQuery, "", "");
			}
			format(gString, sizeof(gString), "Congratulations! you bought bussines id %d for $%s.", BizzInfo[i][bID], FormatNumber(BizzInfo[i][bValue]));
			SCM(playerid, COLOR_YELLOW, gString);
			GiveBussines(playerid, i);
			break;
		}
	}
	return true;
}

YCMD:givebiz(playerid, params[], help) {
	if(!IsAdmin(playerid, 7))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new id, bid;
	if(sscanf(params, "ui", id, bid))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/givebiz [playerid/name] [bussinesid]");

	if(!ValidBussines(bid))
		return SCM(playerid, COLOR_GREY, "Invalid bussinesid");

	GiveBussines(id, bid);
	gString[0] = EOS;
	format(gString, sizeof(gString), "* %s[admin: %d] give bussines %s[id: %d] %s[user: %d].", PlayerInfo[playerid][pName], PlayerInfo[playerid][pSQLID], GetBizzType(BizzInfo[bid][bType]), BizzInfo[bid][bID], PlayerInfo[playerid][pName], PlayerInfo[id][pSQLID]);
	SendAdminMessage(COLOR_YELLOW, gString, 6);
	format(gString, sizeof(gString), "Admin %s ti-a dat bussines-ul %s[id: %d].", GetName(playerid), GetBizzType(BizzInfo[bid][bType]), BizzInfo[bid][bID]);
	SCM(id, COLOR_WHITE, gString);
	return true;
}

YCMD:sellbiztostate(playerid, params[], help) {
	if(PlayerInfo[playerid][pBussines] == -1)
		return SCM(playerid, COLOR_GREY, "Nu ai un business.");

	if(PlayerVar[playerid][IsTrade] != -1)
		return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta functie in timp ce faci trade.");
	
	gString[0] = EOS;
	format(gString, sizeof(gString), "you are about to sell the business.\nAre you sure you want to sell the business for $%s?", FormatNumber(BizzInfo[PlayerInfo[playerid][pBussines]][bOldValue]/2));
	ShowPlayerDialog(playerid, DIALOG_SELLBIZTOSTATE, DIALOG_STYLE_MSGBOX, "Sell Business to state:", gString, "Sell", "Close");
	return true;
}

YCMD:asellbiz(playerid, params[], help) {
	if(!IsAdmin(playerid, 6))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	new i;
	if(sscanf(params, "i", i))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/asellbiz [businessid]");

	if(!ValidBussines(i))
		return SCM(playerid, COLOR_GREY, "Invalid business id");

	gString[0] = EOS;
	BizzInfo[i][bOwned] = false;
	format(BizzInfo[i][bOwner], 24, "The State");
	BizzInfo[i][bValue] = BizzInfo[i][bOldValue];

	foreach(new x : Player) {
		if(PlayerInfo[playerid][pBussines] == BizzInfo[i][bID]) {
			PlayerInfo[playerid][pBussines] = -1;
			format(gString, 128, "* Admin %s ti-a vandut casa la stat.", GetName(playerid));
			SCM(x, COLOR_YELLOW, gString);
			break;
		}
	}

	UpdateBizzLabel(i);

	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `bussines` SET `Owned`='0', `Owner`='The State', `Value`='%d' WHERE `ID`='%d'", BizzInfo[i][bValue], BizzInfo[i][bID]);
	mysql_tquery(SQL, gQuery, "", "");
	mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `Bussines`='-1' WHERE `Bussines` = '%i'", BizzInfo[i][bID]);
	mysql_tquery(SQL, gQuery, "", "");
	format(gString, sizeof gString, "* Admin %s a vandut casa %d la stat", BizzInfo[i][bID]);
	SendAdminMessage(COLOR_ADMCHAT, gString, 6);
	return true;
}

YCMD:movebiz(playerid, params[], help) {
	if(!IsAdmin(playerid, 7))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new id;
	if(sscanf(params, "i", id))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/movebussines [houseid]");

	if(!ValidBussines(id)) return SCM(playerid, COLOR_GREY, "Invalid Bussines.");
	listitemm[playerid] = id;
	ShowPlayerDialog(playerid, DIALOG_MOVEBIZ, DIALOG_STYLE_LIST, "Move House", "Interior Pos\nExterior Pos", "Select", "Close");
	return true;
}

YCMD:bizmenu(playerid, params[], help) {
	if(PlayerInfo[playerid][pBussines] == -1)
		return SCM(playerid, COLOR_GREY, "Nu ai un bussines.");

	if(PlayerVar[playerid][IsTrade] != -1)
		return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta functie in timp ce faci trade.");

	ShowPlayerDialog(playerid, DIALOG_BMENU, DIALOG_STYLE_LIST, "Bizz Menu", "Bizz Info\nBizz Description\nSet Fee\nWithdraw\nDeposit\nBizz Status\nSell Bizz", "Select", "Close");
	return true;
}

function CheckBussines(playerid, id) {
	for(new i = 1; i <= SqlBussines; i++) {
		if(BizzInfo[i][bID] == id) {
			PlayerVar[playerid][BussinesID] = i;
			break;
		}
	}
	return -1;
}


function GiveBussines(playerid, i) {
	format(BizzInfo[i][bOwner], MAX_PLAYER_NAME, PlayerInfo[playerid][pName]);
	BizzInfo[i][bOwned] = true;
	BizzInfo[i][bUserid] = PlayerInfo[playerid][pSQLID];
	BizzInfo[i][bValue] = 0;
	PlayerInfo[playerid][pBussines] = BizzInfo[i][bID];
	UpdateVar(playerid, "Bussines", PlayerInfo[playerid][pBussines]);

	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `bussines` SET `Owner`='%s', `Owned`='%d', `Userid`='%d', `Value`='0' WHERE `ID`='%d'", BizzInfo[i][bOwner], BizzInfo[i][bOwned], BizzInfo[i][bUserid], BizzInfo[i][bID]);
	mysql_tquery(SQL, gQuery, "", "");
	PlayerVar[playerid][BussinesID] = i;
	UpdateBizzLabel(i);
	return true;
}

function SQL_InsertBussines(playerid, type, price, level, Float: xx, Float: yy, Float: zz) {
	SqlBussines ++;
	new x = SqlBussines;
	gQuery[0] = EOS;
	gString[0] = EOS;

	BizzInfo[x][bID] = cache_insert_id();
	BizzInfo[x][bValue] = price;
	BizzInfo[x][bOldValue] = price;
	BizzInfo[x][bLevel] = level;
	BizzInfo[x][bType] = type;
	BizzInfo[x][bLevel] = level;
	switch(type) {
		case 9, 10, 11, 13, 14: {
			BizzInfo[x][bStatic] = true;
			mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `bussines` SET `Static`='1' WHERE `ID`='%d'", BizzInfo[x][bID]);
			mysql_tquery(SQL, gQuery, "", "");
		}
	}
	Iter_Add(BizzType[type-1], x);
	type --;
	BizzInfo[x][bInterior] = bInteriors[type];
	BizzInfo[x][bVirtualWorld] = BizzInfo[x][bID];
	BizzInfo[x][bEnterPos][0] = xx;
	BizzInfo[x][bEnterPos][1] = yy;
	BizzInfo[x][bEnterPos][2] = zz;
	for(new i = 0; i < 3; i++) BizzInfo[x][bExitPos][i] = bInteriorPos[type][i];

	format(BizzInfo[x][bDescription], 32, GetBizzType(type+1));

	mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `bussines` SET `VirtualWorld`='%d', `Description`='%s' WHERE `ID`='%d'", BizzInfo[x][bVirtualWorld], BizzInfo[x][bDescription], BizzInfo[x][bID]);
	mysql_tquery(SQL, gQuery, "", "");

	format(gString, sizeof(gString), "* Bussinses[id: %d] | Price: %s | level: %d | Type: %s was created [/createbiz] by Admin %s[admin: %d]", BizzInfo[x][bID], FormatNumber(BizzInfo[x][bValue]), BizzInfo[x][bLevel], GetBizzType(type+1), GetName(playerid), PlayerInfo[playerid][pSQLID]);
	SendAdminMessage(COLOR_YELLOW, gString, 7);

	UpdateBizzLabel(x);
	return true;
}

YCMD:gotobiz(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new x;
	if(sscanf(params, "i", x))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/gotobiz [bussinesid]");

	if(!ValidBussines(x)) return SCM(playerid, COLOR_GREY, "Invalid Bussinses ID.");

	SetPlayerPos(playerid, BizzInfo[x][bEnterPos][0], BizzInfo[x][bEnterPos][1], BizzInfo[x][bEnterPos][2]);
	SetPlayerVirtualWorld(playerid, 0);
	SetPlayerInterior(playerid, 0);
	
	gString[0] = EOS;
	format(gString, sizeof(gString), "You teleported bussines id %d.", BizzInfo[x][bID]);
	SCM(playerid, COLOR_YELLOW, gString);
	return true;
}
YCMD:findbiz(playerid, params[], help) {
	if(HaveCheckpoint(playerid)) return ShowCancelCP(playerid);

	new x;
	if(sscanf(params, "i", x))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/findbiz [bussinesid]");

	if(!ValidBussines(x)) return SCM(playerid, COLOR_GREY, "Invalid Bussinses ID.");

	SetPlayerCheckpointEx(playerid, CP_NORMAL, BizzInfo[x][bEnterPos][0], BizzInfo[x][bEnterPos][1], BizzInfo[x][bEnterPos][2], 2.0);

	gString[0] = EOS;
	format(gString, sizeof(gString), "Mergi la punctul rosu de pe minimap pentru a ajunge la bizul ales de tine. Distanta: %.0fm.", GetPlayerDistanceFromPoint(playerid, BizzInfo[x][bEnterPos][0], BizzInfo[x][bEnterPos][1], BizzInfo[x][bEnterPos][2]));
	SCM(playerid, COLOR_YELLOW, gString);
	return true;
}
