redist::SQL_LoadSvVehicle() {
	printf("[MySQL] loading %d global vehicles.", cache_num_rows());
	CountGlobalVehicle = cache_num_rows();
	if(cache_num_rows() == 0)
		return true;

	new x=-1;
	while(++x<CountGlobalVehicle) {
		new i = x+1;
		
		cache_get_value_name_int(x, "ID", ServerVehicle[i][vID]);
		cache_get_value_name_int(x, "Model", ServerVehicle[i][vModel]);
		cache_get_value_name_int(x, "Color1", ServerVehicle[i][vColor][0]);
		cache_get_value_name_int(x, "Color2", ServerVehicle[i][vColor][1]);
		cache_get_value_name_int(x, "Faction", ServerVehicle[i][vFaction]);
		
		cache_get_value_name_float(x, "X", ServerVehicle[i][vPos][0]);
		cache_get_value_name_float(x, "Y", ServerVehicle[i][vPos][1]);
		cache_get_value_name_float(x, "Z", ServerVehicle[i][vPos][2]);
		cache_get_value_name_float(x, "R", ServerVehicle[i][vPos][3]);

		ServerVehicle[i][vVehID] = CreateVehicleEx(ServerVehicle[i][vModel], ServerVehicle[i][vPos][0], ServerVehicle[i][vPos][1], ServerVehicle[i][vPos][2], ServerVehicle[i][vPos][3], ServerVehicle[i][vColor][0], ServerVehicle[i][vColor][1], -1, 0);
		Fuel[ServerVehicle[i][vVehID]] = 100;
	}
	new act = CreateActor(29,1895.2506,-2006.4684,13.5469,81.7174),vv=-1;
	SetActorVirtualWorld(act, 999);
	ApplyActorAnimation(act, "ped", "ARRESTgun", 4.0, 0, 1, 1, 1, -1);
	SetVehicleVirtualWorld((vv=CreateVehicle(541,1897.0492,-2007.3451,13.1614,112.3237,154,1, -1)), 999);
	SetVehicleParamsEx(vv, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_ON, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_ON, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF);
	return true;
}

YCMD:createvehicle(playerid, params[], help) {
	if(!IsAdmin(playerid, 7))
		return true;

	new model, color[2];
	if(sscanf(params, "iii", model, color[0], color[1]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/createvehicle [model] [color 1] [color 2]");

	if(model < 400 || model > 611) 
		return SCM(playerid, COLOR_GREY, "Invalid model.");

	if(color[0] < 1 || color[0] > 255)
		return SCM(playerid, COLOR_GREY, "Invalid Color 1.");

	if(color[1] < 1 || color[1] > 255)
		return SCM(playerid, COLOR_GREY, "Invalid Color 2.");

	new Float: X, Float: Y, Float: Z, Float: R;
	GetPlayerPos(playerid, X, Y, Z);
	GetPlayerFacingAngle(playerid, R);

	new i = CreateVehicleEx(model, X, Y, Z, R, color[0], color[1], -1, 0);
	Fuel[i] = 100;
	PutPlayerInVehicle(playerid, i, 0);
	ServerVehicle[i][vModel] = model;
	ServerVehicle[i][vColor][0] = color[0];
	ServerVehicle[i][vColor][1] = color[1];
	ServerVehicle[i][vPos][0] = X;
	ServerVehicle[i][vPos][1] = Y;
	ServerVehicle[i][vPos][2] = Z;
	ServerVehicle[i][vPos][3] = R;
	ServerVehicle[i][vVehID] = i;

	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "INSERT INTO `servervehicle` (`Model`, `Color1`, `Color2`, `X`, `Y`, `Z`, `R`) VALUES ('%d', '%d', '%d', '%f', '%f', '%f', '%f')", model, color[0], color[1], X, Y, Z, R);
	mysql_tquery(SQL, gQuery, "SQL_CacheVehicleID", "ii", playerid, i);
	return true;
}

function SQL_CacheVehicleID(playerid, vehicleid) {
	gString[0] = EOS;
	format(gString, sizeof(gString), "/createvehicle: %s a create un vehicul %s[SQLID: %d] pe server.", GetName(playerid), GetVehicleName(ServerVehicle[vehicleid][vModel]), cache_insert_id());
	SendAdminMessage(COLOR_ADMCMD, gString, 6);
	ServerVehicle[vehicleid][vID] = cache_insert_id();
	CountGlobalVehicle++;
	return true;
}
YCMD:vpark(playerid, params[], help) {
	if(!IsAdmin(playerid, 7))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	if(!IsPlayerInAnyVehicle(playerid))
		return SCM(playerid, COLOR_GREY, "Nu esti intr-o masina.");

	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
		return SCM(playerid, COLOR_GREY, "Nu esti la volan.");

	new i = GetPlayerVehicleID(playerid);
	if(ServerVehicle[i][vVehID] == 0) 
		return SCM(playerid, COLOR_GREY, "Acest vehicul nu a fost gasit in baza de date.");

	new Float: Pos[4];
	GetVehiclePos(i, Pos[0], Pos[1], Pos[2]);
	GetVehicleZAngle(i, Pos[3]);

	DestroyVehicleEx(ServerVehicle[i][vVehID]);
	ServerVehicle[i][vVehID] = CreateVehicleEx(ServerVehicle[i][vModel], Pos[0], Pos[1], Pos[2], Pos[3], ServerVehicle[i][vColor][0], ServerVehicle[i][vColor][1], -1, 0);
	Fuel[i] = 100;
	PutPlayerInVehicle(playerid, i, 0);

	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `servervehicle` SET `X`='%f', `Y`='%f', `Z`='%f', `R`='%f' WHERE `ID`='%d'", Pos[0], Pos[1], Pos[2], Pos[3], ServerVehicle[i][vID]);
	mysql_tquery(SQL, gQuery, "", "");

	gString[0] = EOS;
	format(gString, sizeof(gString), "/vpark: %s a parcat vehiculul %s[SQLID: %d].", GetName(playerid), GetVehicleName(ServerVehicle[i][vModel]), ServerVehicle[i][vID]);
	SendAdminMessage(COLOR_ADMCMD, gString, 6);
	return true;
}

YCMD:vdelete(playerid, params[], help) {
	if(!IsAdmin(playerid, 7))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	if(!IsPlayerInAnyVehicle(playerid))
		return SCM(playerid, COLOR_GREY, "Nu esti intr-o masina.");

	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
		return SCM(playerid, COLOR_GREY, "Nu esti la volan.");

	new i = GetPlayerVehicleID(playerid);
	if(ServerVehicle[i][vVehID] == 0) 
		return SCM(playerid, COLOR_GREY, "Acest vehicul nu a fost gasit in baza de date.");

	DestroyVehicleEx(ServerVehicle[i][vVehID]);
	ServerVehicle[i][vVehID] = INVALID_VEHICLE;
	ServerVehicle[i][vFaction] = 0;

	CountGlobalVehicle--;

	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "DELETE FROM `servervehicle` WHERE `ID`='%d'", ServerVehicle[i][vID]);
	mysql_tquery(SQL, gQuery, "", "");

	gString[0] = EOS;
	format(gString, sizeof(gString), "/vdelete: %s a sters vehiculul %s[SQLID: %d].", GetName(playerid), GetVehicleName(ServerVehicle[i][vModel]), ServerVehicle[i][vID]);
	SendAdminMessage(COLOR_ADMCMD, gString, 6);
	return true;
}

YCMD:editvehicle(playerid, params[], help) {
	if(!IsAdmin(playerid, 7))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	if(!IsPlayerInAnyVehicle(playerid))
		return SCM(playerid, COLOR_GREY, "Nu esti intr-o masina.");

	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
		return SCM(playerid, COLOR_GREY, "Nu esti la volan.");

	new i = GetPlayerVehicleID(playerid);
	if(ServerVehicle[i][vVehID] == 0) 
		return SCM(playerid, COLOR_GREY, "Acest vehicul nu a fost gasit in baza de date.");

	new type[24], value;
	if(sscanf(params, "s[24]i", type, value)) {
		SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/editvehicle [type] [value]");
		SCM(playerid, COLOR_GREY, "Type: {FFFFFF}Model, Color1, Color2, Faction");
		return true;
	}

	gQuery[0] = EOS;
	gString[0] = EOS;
	if(strcmp("Model", type, true) == 0) {
		ServerVehicle[i][vModel] = value;
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `servervehicle` SET `Model`='%d' WHERE `ID`='%d'", value, ServerVehicle[i][vID]);
		mysql_tquery(SQL, gQuery, "", "");
	}
	else if(strcmp("Color1", type, true) == 0) {
		ServerVehicle[i][vColor][0] = value;
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `servervehicle` SET `Color1`='%d' WHERE `ID`='%d'", value, ServerVehicle[i][vID]);
		mysql_tquery(SQL, gQuery, "", "");
	}
	else if(strcmp("Color2", type, true) == 0) {
		ServerVehicle[i][vColor][1] = value;
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `servervehicle` SET `Color2`='%d' WHERE `ID`='%d'", value, ServerVehicle[i][vID]);
		mysql_tquery(SQL, gQuery, "", "");
	}
	else if(strcmp("Faction", type, true) == 0) {
		ServerVehicle[i][vFaction] = value;
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `servervehicle` SET `Faction`='%d' WHERE `ID`='%d'", value, ServerVehicle[i][vID]);
		mysql_tquery(SQL, gQuery, "", "");
		format(gString, sizeof gString, "/editvehicle: %s a editat %s vehicului %s[%d].", GetName(playerid), type, GetVehicleName(ServerVehicle[i][vModel]), ServerVehicle[i][vID]);
		SendAdminMessage(COLOR_ADMCMD, gString, 6);
		return true;
	}
	else {
		SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/editvehicle [type] [value]");
		SCM(playerid, COLOR_GREY, "Type: {FFFFFF}Model, Color1, Color2, Faction");
		return true;
	}

	DestroyVehicleEx(ServerVehicle[i][vVehID]);
	CreateVehicleEx(ServerVehicle[i][vModel], ServerVehicle[i][vPos][0], ServerVehicle[i][vPos][1], ServerVehicle[i][vPos][2], ServerVehicle[i][vPos][3], ServerVehicle[i][vColor][0], ServerVehicle[i][vColor][1], -1, 0);
	PutPlayerInVehicle(playerid, i, 0);
	format(gString, sizeof(gString), "/editvehicle: %s a editat %s vehicului %s[%d].", GetName(playerid), type, GetVehicleName(ServerVehicle[i][vModel]), ServerVehicle[i][vID]);
	SendAdminMessage(COLOR_ADMCMD, gString, 6);
	return true;
}

YCMD:vinfo(playerid, params[], help) {
	if(!IsAdmin(playerid, 7))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	if(!IsPlayerInAnyVehicle(playerid))
		return SCM(playerid, COLOR_GREY, "Nu esti intr-o masina.");

	new i = GetPlayerVehicleID(playerid);
	if(ServerVehicle[i][vVehID] == 0) 
		return SCM(playerid, COLOR_GREY, "Acest vehicul nu a fost gasit in baza de date.");

	gString[0] = EOS;
	format(gString, sizeof(gString), "Vehicle: %s[model: %d]\nSQLID: %d\nColor 1: %d\nColor 2: %d\nFaction: {FFFFFF}%s (%d)", GetVehicleName(ServerVehicle[i][vModel]), ServerVehicle[i][vModel], ServerVehicle[i][vID], ServerVehicle[i][vColor][0], ServerVehicle[i][vColor][1], GetFactionName(i), ServerVehicle[i][vFaction]);
	ShowPlayerDialog(playerid, DIALOG_ONLINE, DIALOG_STYLE_MSGBOX, "Vehicle Info:", gString, "Close", "");
	return true;
}