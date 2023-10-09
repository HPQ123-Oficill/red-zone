function IsAdmin(playerid, level) return PlayerInfo[playerid][pAdmin] >= level ? true : false;
function IsHelper(playerid, level) return PlayerInfo[playerid][pHelper] >= level ? true : false;

// ================================== Comands =================================== //

new action_time[MAX_PLAYERS];
YCMD:gotolv(playerid, params[], help) {
	if(!IsAdmin(playerid, 1)) 
		return SCM(playerid, COLOR_WHITE,AdminOnly);

	SetPlayerInterior(playerid, 0);
	PlayerVar[playerid][IsHouses] = 0;
	PlayerVar[playerid][IsBizz] = 0;
	PlayerVar[playerid][IsFaction] = -1;
	SetPlayerVirtualWorld(playerid,0);
	return GetPlayerState(playerid) == 2 ? SetVehiclePos(GetPlayerVehicleID(playerid), 1699.2, 1435.1, 10.7) : SetPlayerPos(playerid, 1699.2,1435.1, 10.7);
}


YCMD:gotols(playerid, params[], help) {
	if(!IsAdmin(playerid, 1)) 
		return SCM(playerid, COLOR_WHITE, AdminOnly);
	
	SetPlayerInterior(playerid, 0);
	PlayerVar[playerid][IsHouses] = 0;
	PlayerVar[playerid][IsBizz] = 0;
	PlayerVar[playerid][IsFaction] = -1;
	SetPlayerVirtualWorld(playerid,0);
	return GetPlayerState(playerid) == 2 ? SetVehiclePos(GetPlayerVehicleID(playerid), 1529.6,-1691.2,13.3) : SetPlayerPos(playerid, 1529.6,-1691.2,13.3);
}
YCMD:ppforall(playerid, params[], help) {
	if(!IsAdmin(playerid, 6))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	if action_time[playerid] > gettime() *then
		return SCMf(playerid, COLOR_WHITE, "Asteapta %d secunde pentru a folosi iar aceasta comanda!", action_time[playerid]-gettime());

	if(sscanf(params, "i", params[0]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/ppforall [amount]");

	action_time[playerid] = gettime()+10;
	if params[0] > 100 *then return SCM(playerid, COLOR_GREY, "Invalid premium points (Poti oferi maxim 100 premium points).");

	ClearString();
	format(gString, 100, "Ai primit %s puncte premium de la administrator %s.", FormatNumber(params[0]), GetName(playerid));
	foreach(new i : Player) {
		if(!IsPlayerLogged(i)) continue;

		PlayerInfo[i][pPremiumPoints] += params[0];
		SCM(i, COLOR_YELLOW, gString);
	}
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `users` SET `PremiumPoints` = `PremiumPoints` + '%d' WHERE `Status` != '-1'", params[0]);
	mysql_tquery(SQL, gQuery);
	return true;
}

alias:fnc("forcename");
cmd:fnc(playerid, params[]) {
	if(!IsAdmin(playerid, 4))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new id;
	if(sscanf(params, "u", id))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/fnc [username/playerid]");

	if(!IsPlayerConnected(id))
		return SCM(playerid, COLOR_GREY, "Acel player nu este conectat.");

	if(!IsPlayerLogged(id))
		return SCM(playerid, COLOR_GREY, "Acel player nu este logat!");

	format(gString, sizeof gString, "Admin %s te obliga sa iti schimbi numele!", GetName(playerid));
	ShowPlayerDialog(id, DIALOG_FNAME, DIALOG_STYLE_INPUT, "Forcename:", gString, "Done", "");
	return true;
}

YCMD:levelupall(playerid, params[], help) {
	if(!IsAdmin(playerid, 6)) 
		return SCM(playerid, COLOR_GREY, AdminOnly);

	if action_time[playerid] > gettime() *then
		return SCMf(playerid, COLOR_WHITE, "Asteapta %d secunde pentru a folosi iar aceasta comanda!", action_time[playerid]-gettime());
	
	action_time[playerid] = gettime()+10;

	gString[0] = EOS;
	format(gString, 150, "* Administratorul %s ti-a dat un level up ca bonus! ", GetName(playerid));
	foreach(new i : Player) {
		if(!IsPlayerLogged(i)) continue;

		PlayerInfo[i][pLevel] ++;
		SetPlayerLevelEx(i);
		SCM(i, COLOR_YELLOW, gString);
	}
	mysql_tquery(SQL, "UPDATE `users` SET `Level` = `Level` + '1' WHERE `Status` != '-1'");
	return true;
}

YCMD:moneyforall(playerid, params[], help) {
	if(!IsAdmin(playerid, 5))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	if action_time[playerid] > gettime() *then
		return SCMf(playerid, COLOR_WHITE, "Asteapta %d secunde pentru a folosi iar aceasta comanda!", action_time[playerid]-gettime());
	
	if(sscanf(params, "s[20]", params))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/moneyforall [amount]");

	if !isBigInt(params) *then
		return true;

	if strlen(params) > 8 *then return SCM(playerid, COLOR_GREY, "Invalid money (Poti oferi maxim $100.000.000).");
	action_time[playerid] = gettime()+10;

	ClearString();
	format(gString, 100, "Ai primit $%s de la administrator %s.", formatStrNumber(params), GetName(playerid));
	foreach(new i : Player) {
		if(!IsPlayerLogged(i))
			continue;

		converBytes(money[i],params);
		SCM(i, COLOR_YELLOW, gString);
	}
	return true;
}
YCMD:suspend(playerid, params[], help) {
	if(!IsAdmin(playerid, 3))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new id, license[15], hours;
	if(sscanf(params, "us[15]i", id, license, hours)) {
		SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/suspend [playerid/name] [license] [hours]");
		SCM(playerid, COLOR_GREY, "license: {FFFFFF}driving, fly, weapon, boat");
		return true;
	}

	if(hours < 0 || hours > 10)
		return SCM(playerid, COLOR_GREY, "Invalid Hours (0 - 10 hours).");

	if(!IsPlayerConnected(id))
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(!IsPlayerLogged(id))
		return SCM(playerid, COLOR_GREY, "Player not logged.");

	if(strcmp(license, "driving", true) == 0) {
		PlayerInfo[id][pDrvingSuspend] = gettime() + (hours * 3600);
		UpdateVar(id, "DrivingSuspend", PlayerInfo[id][pDrvingSuspend]);
		PlayerInfo[id][pDriveLicense] = gettime();
		UpdateVar(id, "DriveLicense", gettime());
		SetPlayerPose(id, 0, 0, 5);
	}
	else if(strcmp(license, "fly", true) == 0) {
		PlayerInfo[id][pFlySuspend] = gettime() + (hours * 3600);
		UpdateVar(id, "FlySuspend", PlayerInfo[id][pFlySuspend]);
		PlayerInfo[id][pFlyLicense] = gettime();
		UpdateVar(id, "FlyLicense", gettime());
	}
	else if(strcmp(license, "weapon", true) == 0) {
		PlayerInfo[id][pWeaponSuspend] = gettime() + (hours * 3600);
		UpdateVar(id, "WeaponSuspend", PlayerInfo[id][pWeaponSuspend]);
		PlayerInfo[id][pWeaponLicense] = gettime();
		UpdateVar(id, "WeaponLicense", gettime());
	}
	else if(strcmp(license, "boat", true) == 0) {
		PlayerInfo[id][pBoatSuspend] = gettime() + (hours * 3600);
		UpdateVar(id, "BoatSuspend", PlayerInfo[id][pBoatSuspend]);
		PlayerInfo[id][pBoatLicense] = gettime();
		UpdateVar(id, "BoatLicense", gettime());
	} else {
		SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/suspend [playerid/name] [license] [hours]");
		SCM(playerid, COLOR_GREY, "license: {FFFFFF}driving, fly, weapon, boat");
		return true;
	}
	gString[0] = EOS;
	format(gString, 150, "/suspend: Admin %s i-a suspendat lui %s licenta de %s pentru %d ore.", GetName(playerid), GetName(id), license, hours);
	SendAdminMessage(COLOR_ADMCMD, gString, 1);
	format(gString, 165, "Administartor %s ti-a suspendat licenta de %s pentrun %d ore.", GetName(playerid), license, hours);
	SCM(id, COLOR_RED, gString); 
	return true;
}

YCMD:giveskin(playerid, params[], help) {
	if(PlayerInfo[playerid][pAdmin] < 6)
		return SCM(playerid, COLOR_GREY, AdminOnly);

	new id, skin;
	if(sscanf(params, "ui", id, skin))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/giveskin [playerid/name] [skinid]");

	if(!IsPlayerConnected(id))
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(skin < 0 || skin > 310)
		return SCM(playerid, COLOR_GREY, "Invalid Skin.");

	if(GetPlayerMaxSkin(id) == MAX_PLAYER_SKIN)
		return SCM(playerid, COLOR_GREY, "That player has the maximum number of skins.");

	GivePlayerSkin(id, skin);
	gString[0] = EOS;
	format(gString, 100, "/giveskin: %s has give to %s skin %d | type: %s", GetName(playerid), GetName(id), skin, GetSkinType(skin));
	SendAdminMessage(COLOR_ADMCMD, gString, 1);
	return true;
}

YCMD:gotosf(playerid, params[], help) {
	if(!IsAdmin(playerid, 1)) 
		return SCM(playerid, COLOR_WHITE,AdminOnly);

	SetPlayerInterior(playerid,0);
	PlayerVar[playerid][IsHouses] = 0;
	PlayerVar[playerid][IsBizz] = 0;
	PlayerVar[playerid][IsFaction] = -1;
	SetPlayerVirtualWorld(playerid,0);
	return GetPlayerState(playerid) == 2 ? SetVehiclePos(GetPlayerVehicleID(playerid), -1417.0,-295.8,14.1) : SetPlayerPos(playerid, -1417.0,-295.8,14.1);
}

YCMD:gotospawn(playerid, params[], help) {
	if(!IsAdmin(playerid, 1)) 
		return SCM(playerid, COLOR_WHITE,AdminOnly);

	SetPlayerInterior(playerid,0);
	PlayerVar[playerid][IsHouses] = 0;
	PlayerVar[playerid][IsBizz] = 0;
	PlayerVar[playerid][IsFaction] = -1;
	SetPlayerVirtualWorld(playerid,0);	
	return GetPlayerState(playerid) == 2 ? SetVehiclePos(GetPlayerVehicleID(playerid), 1674.3214,1448.9183,10.7829) : SetPlayerPos(playerid, 1674.3214,1448.9183,10.7829);
}

YCMD:cc(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return true;
	
	foreach(new i : Player) {
		if(PlayerInfo[i][pAdmin] < 1) for(new x = 0; x < 100; x++) SCM(i, -1, "");
	}
	gString[0] = EOS;
	format(gString, sizeof(gString), "Warning: %s cleared the chat.", GetName(playerid));
	SendAdminMessage(COLOR_RED, gString, 1);
	return true;
}

YCMD:cmc(playerid, params[], help) {
	if(!IsAdmin(playerid, 3))
		return true;
	
	foreach(new i : Player) {
		if(PlayerInfo[i][pAdmin] <= PlayerInfo[playerid][pAdmin]) for(new x = 0; x < 100; x++) SCM(i, -1, "");
	}
	gString[0] = EOS;
	format(gString, sizeof(gString), "Warning: %s cleared the chat.", GetName(playerid));
	SendAdminMessage(COLOR_RED, gString, 1);
	return true;
}

CMD:setskin(playerid, params[], help) {
	if(!IsAdmin(playerid, 6))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	new id, skinid;
	if(sscanf(params, "ui", id, skinid))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/setskin [playerid/name] [skinid]");

	if(!IsPlayerConnected(id))
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(skinid < 0 || skinid > 306)
		return SCM(playerid, COLOR_GREY, "Invalid skinid");

	SetPlayerSkin(id, skinid);
	PlayerInfo[id][pModel] = skinid;
	UpdateVar(id, "Model", skinid);

	gString[0] = EOS;
	format(gString, sizeof(gString), "/setskin: %s skin set %s skinid %d.", GetName(playerid), GetName(id), skinid);
	SendAdminMessage(COLOR_PINK, gString, 3);
	format(gString, sizeof(gString), "* Admin %s ti-a setat skin-ul %d.", GetName(playerid), skinid);
	SCM(id, COLOR_YELLOW, gString);
	return true;
}

YCMD:agl(playerid, params[], help) {
	if(!IsAdmin(playerid, 6))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	new id, amount[24];
	if(sscanf(params, "us[25]", id, amount))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/agl [playerid/name] [type]"), SCM(playerid,COLOR_GREY, "Type: {FFFFFF}Driving, weapon, fly, boat, all");

	if(!IsPlayerConnected(id))
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(strcmp(amount, "driving", true) == 0) {
		PlayerInfo[id][pDriveLicense] = gettime() + (86400 * 7);
		UpdateVar(id, "DriveLicense", PlayerInfo[id][pDriveLicense]);
	}
	else if(strcmp(amount, "weapon", true) == 0) {
		PlayerInfo[id][pWeaponLicense] = gettime() + (86400 * 7);
		UpdateVar(id, "WeaponLicense", PlayerInfo[id][pWeaponLicense]);
	}
	else if(strcmp(amount, "fly", true) == 0) {
		PlayerInfo[id][pFlyLicense] = gettime() + (86400 * 7);
		UpdateVar(id, "FlyLicense", PlayerInfo[id][pFlyLicense]);
	}
	else if(strcmp(amount, "boat", true) == 0) {
		PlayerInfo[id][pBoatLicense] = gettime() + (86400 * 7);
		UpdateVar(id, "BoatLicense", PlayerInfo[id][pBoatLicense]);
	}
	else if(strcmp(amount, "all", true) == 0) {
		PlayerInfo[id][pDriveLicense] = PlayerInfo[id][pFlyLicense] = PlayerInfo[id][pBoatLicense] = PlayerInfo[id][pWeaponLicense] = gettime() + (86400 * 7);
		UpdateVar(id, "DriveLicense", PlayerInfo[id][pDriveLicense]);
		UpdateVar(id, "WeaponLicense", PlayerInfo[id][pWeaponLicense]);
		UpdateVar(id, "FlyLicense", PlayerInfo[id][pFlyLicense]);
		UpdateVar(id, "BoatLicense", PlayerInfo[id][pBoatLicense]);
		format(gString, sizeof(gString), "Admin %s ti-a dat toate licentele pentru 7 zile.", GetName(playerid));
		SCM(id, COLOR_YELLOW, gString);
		format(gString, sizeof(gString), "I-ai dat toate licentele lui %s.", GetName(id));
		SCM(playerid, COLOR_LIGHTBLUE, gString);
		return true;
	}
	else return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/agl [playerid/name] [type]"), SCM(playerid,COLOR_GREY, "Type: {FFFFFF}Driving, weapon, fly, boat, all");

	format(gString, sizeof(gString), "Admin %s ti-a dat licenta de %s pentru 30 zile.", GetName(playerid), amount);
	SCM(id, COLOR_YELLOW, gString);
	format(gString, sizeof(gString), "I-ai dat licenta de %s lui %s.", amount, GetName(id));
	SCM(playerid, COLOR_LIGHTBLUE, gString);
	return true;
}

cmd:resetraport(playerid, params[]) {
	if(!IsAdmin(playerid, 5))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new factionid;
	if(sscanf(params, #i, factionid))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/resetraport [factionid]");

	if(factionid < 1 || factionid > MAX_FACTIONS)
		return SCM(playerid, COLOR_LGREEN, "Invalid faction ID!");

	foreach(new i : Factions<factionid>) {
		PlayerInfo[i][pFPoints][0]=PlayerInfo[i][pFPoints][1]=PlayerInfo[i][pFPoints][2]=0;
		SCMf(i, COLOR_YELLOW, "* Raport-ul tau a fost resetat de catre admin %s", GetName(playerid));
	}
	_query(256,"UPDATE `users` SET `Raport` = '0|0|0' WHERE `Member` = '%i'", factionid);

	format(gString, sizeof gString, "(/resetraport) {FFFFFF}Admin %s a resetat raport-ul factiunii %s (ID: %d)", GetName(playerid), FactionInfo_[factionid][fName], factionid);
	SendAdminMessage(COLOR_GM, gString, 1);
	return true;
}

YCMD:aaa3(playerid, params[], help) {
	if(!IsAdmin(playerid, 1)) return true;
	SetPlayerPos(playerid, -1657.4263,-165.0130,14.1484);
	SetPlayerVirtualWorld(playerid, 0);
	SetPlayerInterior(playerid, 0);
	return true;
}
YCMD:aaa2(playerid, params[], help) {
	if(!IsAdmin(playerid, 1)) return true;
	SetPlayerPos(playerid, -1657.4263,-165.0130,14.1484);
	SetPlayerVirtualWorld(playerid, 1337);
	SetPlayerInterior(playerid, 0);
	return true;
}
YCMD:afklist(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	gString[0] = EOS;
	SCM(playerid, COLOR_SERVER, "----- AFK List -----");
	new x = 0;
	foreach(new i : Player) {
		if(PlayerVar[i][AFKSeconds] > 15) {
			format(gString, 50, "%s: %d seconds", GetName(i), PlayerVar[i][AFKSeconds]);
			SCM(playerid, -1, gString);
			x++;
		}
	}
	if(!x) return SCM(playerid, COLOR_GREY, "Nu sunt playeri afk.");
	format(gString, 70, "* Sunt %d playeri AFK.", x);
	SCM(playerid, COLOR_LGREEN, gString);
	return true;
}

YCMD:givegun(playerid, params[], help) {
	if(!IsAdmin(playerid, 2))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new id, weapon, ammo;
	if(sscanf(params, "uii", id, weapon, ammo))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/givegun [playerid/name] [weaponid] [gloante]");

	if(PaintType[playerid] != 0 && !IsAdmin(playerid, 6))
		return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta arma in paint.");

	if(!IsPlayerConnected(id))
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(InvalidWeaponid(weapon))
		return SCM(playerid, COLOR_GREY, "Invalid Weapon.");

	if(PlayerInfo[id][pWeaponLicense] < gettime())
		return SCM(playerid, COLOR_GREY, "Acel player nu are licenta de arme.");

	GivePlayerWeapon(id, weapon, ammo);

	gString[0] = EOS;
	format(gString, sizeof(gString), "/givegun: %s give gun %s weapon: %s and ammo %d.", GetName(playerid), GetName(id), GetWeapon(weapon), ammo);
	SendAdminMessage(COLOR_PINK, gString, 2);
	format(gString, sizeof(gString), "* Admin %s ti-a dat: %s cu %d gloante.", GetName(playerid), GetWeapon(weapon), ammo);
	SCM(playerid, COLOR_YELLOW, gString);
	return true;
}

YCMD:o(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new text[128];
	if(sscanf(params, "s[128]", text))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/o [text]");

	gString[0] = EOS;
	format(gString, sizeof(gString), "(( Admin %s: %s ))", GetName(playerid), text);
	SCMTA(COLOR_SERVER, gString);
	return true;
}

YCMD:gotocp(playerid, params[], help) {
	if(!IsAdmin(playerid, 6))
		return true;

	if(!HaveCheckpoint(playerid))
		return SCM(playerid, COLOR_GREY, "Nu ai un checkpoint activ.");

	if(!IsPlayerInAnyVehicle(playerid)) SetPlayerPos(playerid, CPOS[playerid][0], CPOS[playerid][1], CPOS[playerid][2]);
	else SetVehiclePos(GetPlayerVehicleID(playerid), CPOS[playerid][0], CPOS[playerid][1], CPOS[playerid][2]);
	SCM(playerid, COLOR_GREY, "Te-ai teleportat la checkpoint.");
	return true;}

YCMD:setvw(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new id, vw;
	if(sscanf(params, "ui", id, vw))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/setvw [playerid/name] [virtualid]");

	if(!IsPlayerConnected(id))
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(!IsPlayerLogged(id))
		return SCM(playerid, COLOR_GREY, "Player not logged.");

	SetPlayerVirtualWorld(id, vw);
	if(IsPlayerInAnyVehicle(playerid)) SetVehicleVirtualWorld(GetPlayerVehicleID(playerid), vw);
	gString[0] = EOS;
	format(gString, sizeof(gString), "%s has set virtual %s %d", GetName(playerid), GetName(id), vw);
	SendAdminMessage(COLOR_WHITE, gString, 1);
	format(gString, sizeof(gString), "%s has set you virtual %d", GetName(playerid), vw);
	SCM(id, COLOR_WHITE, gString);
	return true;
}

YCMD:setint(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new id, int;
	if(sscanf(params, "ui", id, int))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/setint [playerid/name] [interiorid]");

	if(!IsPlayerConnected(id))
		return SCM(playerid, COLOR_GREY, "Not player connected.");

	SetPlayerInterior(id, int);
	if(IsPlayerInAnyVehicle(playerid)) LinkVehicleToInterior(GetPlayerVehicleID(playerid), int);
	gString[0] = EOS;
	format(gString, sizeof(gString), "%s has set interior %s %d", GetName(playerid), GetName(id), int);
	SendAdminMessage(COLOR_WHITE, gString, 1);
	format(gString, sizeof(gString), "%s has set you interior %d", GetName(playerid), int);
	SCM(playerid, COLOR_WHITE, gString);
	return true;
}

YCMD:gotojob(playerid, params[], help) {
	if(!IsAdmin(playerid, 2))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	new string[32]; gString[0] = EOS;
	for(new i = 0; i < Sqljobs; i++) format(string, sizeof(string), "%s\n", JobInfo[i][jName]), strcat(gString, string);
	ShowPlayerDialog(playerid, DIALOG_GOTOJOB, DIALOG_STYLE_LIST, "Goto job:", gString, "Select", "Close");
	return true;
}

YCMD:gotom(playerid, params[], help) {
	if(!IsAdmin(playerid, 1)) 
		return SCM(playerid, COLOR_WHITE, AdminOnly);

	if(GetPlayerState(playerid) == 2) SetVehiclePos(GetPlayerVehicleID(playerid), -2317.8091,-1637.5575,483.7031);
	else SetPlayerPos(playerid,-2317.8091,-1637.5575,483.7031);
	SetPlayerInterior(playerid,0);
	SetPlayerVirtualWorld(playerid,0);
	return true;
}

YCMD:sethp(playerid, params[], help) {
	if(!IsAdmin(playerid, 4)) 
		return SCM(playerid, COLOR_WHITE, AdminOnly);

	if(PaintType[playerid] != 0 && !IsAdmin(playerid, 6))
		return SCM(playerid, COLOR_GREY, "Nu poti folosi comanda asta in paint.");

	new id, Float: health;
	if(sscanf(params, "uf", id, health))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/sethp [playerid/name] [health]");

	if(!IsPlayerConnected(id)) 
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(PlayerInfo[playerid][pAdmin] < PlayerInfo[id][pAdmin]) return true;
	
	SetPlayerHealth(id, health);
	gString[0] = EOS;
	format(gString, sizeof(gString), "/sethp: %s set %s health %0.2f.", GetName(playerid), GetName(id), health);
	SendAdminMessage(COLOR_ADMCMD, gString, 1);
	return true;
}

YCMD:flip(playerid, params[], help) {
	if(!IsAdmin(playerid, 1)) return true;
	if(!IsPlayerInAnyVehicle(playerid)) return true;
    new Float:angle;
    GetVehicleZAngle(GetPlayerVehicleID(playerid), angle);
    SetVehicleZAngle(GetPlayerVehicleID(playerid), angle);
	return true;
}

YCMD:closestcar(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	if(IsPlayerInAnyVehicle(playerid))
		return SCM(playerid, COLOR_WHITE, "You're already in a car.");

	new vehicleid = GetClosestVehicle(playerid), Float:angle;
	if(GetVehicleVirtualWorld(vehicleid) == GetPlayerVirtualWorld(playerid)) {
	    GetVehicleZAngle(vehicleid, angle);
	    SetVehicleZAngle(vehicleid, angle);
		PutPlayerInVehicle(playerid, vehicleid, 0);
		gString[0] = EOS;
		format(gString, sizeof(gString), "You teleported to the vehicle %d.", vehicleid);
		SCM(playerid, COLOR_GREY, gString);
	}
	return true;
}

YCMD:alock(playerid, params[], help) {
	if(!IsAdmin(playerid, 1)) 
		return true;

	if(!IsPlayerInAnyVehicle(playerid)) {
		new vehicleid = GetClosestVehicle(playerid), Float: Pos[3];
		GetVehiclePos(vehicleid, Pos[0], Pos[1], Pos[2]);
		if(PlayerToPoint(playerid, 5, Pos[0], Pos[1], Pos[2])) LoockVehicles(playerid, vehicleid);
		else {
			new vehid;
			if(sscanf(params, "i", vehid))
				return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/alock [vehicleid]");

			LoockVehicles(playerid, vehicleid);
		}
	} else LoockVehicles(playerid, GetPlayerVehicleID(playerid));
	return true;
}


YCMD:gotoxyz(playerid, params[], help) {
	if(!IsAdmin(playerid, 5)) return SCM(playerid, COLOR_WHITE, AdminOnly);
	new string[128],interior,vw;
	new Float:x, Float:y, Float:z;
	if(sscanf(params, "p<,>fffii", x,y,z,interior,vw)) return SCM(playerid,COLOR_GREY, "Syntax: {FFFFFF}/gotoxyz <x> <y> <z> <interior> <virtual world>");
	SetPlayerPos(playerid, x, y, z);
	format(string, sizeof(string), "Te-ai teleportat cu succes. (%0.1f,%0.1f,%0.1f | int: %d | vw: %d)",x,y,z,interior, vw);
	SCM(playerid,COLOR_LGREEN, string);
	SetPlayerVirtualWorld(playerid, vw);
	SetPlayerInterior(playerid,interior);
	return true;
}

YCMD:slap(playerid, params[], help) {
	if(!IsAdmin(playerid, 1)) return true;
	new id;
	if(sscanf(params, "u",id)) 
		return SCM(playerid,COLOR_GREY, "Syntax: {FFFFFF}/slap <playerid/name>");
	
	if(!IsPlayerConnected(id)) 
		return SCM(playerid, COLOR_GREY, "Acel player nu este conectat.");

	if(PlayerInfo[id][pAdmin] > PlayerInfo[playerid][pAdmin]) 
		return SCM(playerid, COLOR_GREY, "Nu poti executa aceasta comanda pe acel player!");

	if(PaintType[playerid] != 0 && !IsAdmin(playerid, 6))
		return SCM(playerid, COLOR_GREY, "Nu poti folosi comanda asta in paint.");
	
	SetPlayerPose(id, 0, 0, 5);
	gString[0] = EOS;
	format(gString, sizeof(gString), "%s slapped you.", GetName(playerid));
	SCM(id, COLOR_PINK, gString);
	format(gString, sizeof(gString), "You slapped %s.", GetName(id));
	SCM(playerid, COLOR_PINK, gString);	
	return true;
}
YCMD:up(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	SetPlayerPose(playerid, 0, 0, 5);
	return true;
}

YCMD:down(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	if(!IsPlayerInAnyVehicle(playerid)) SetPlayerPose(playerid, 0, 0, -5);
	else SetVehiclePosExe(GetPlayerVehicleID(playerid), 0, 0, -5);
	return true;
}

YCMD:getcar(playerid, params[], help) {
	if(!IsAdmin(playerid, 1)) return true;

	new vehicleid;
	if(sscanf(params, "i", vehicleid))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/getcar [vehicleid]");

	if(PaintType[playerid] != 0 && !IsAdmin(playerid, 6))
		return SCM(playerid, COLOR_GREY, "Nu poti folosi comanda asta in paint.");

	gString[0] = EOS;
	format(gString, sizeof(gString), "You got the car %d.", vehicleid);
	SCM(playerid, COLOR_WHITE, gString);
	new Float: Pos[3];
	GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
	SetVehiclePos(vehicleid, Pos[0], Pos[1]+5, Pos[2]);
	SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
	SetVehicleInterior(vehicleid, GetPlayerInterior(playerid));
	return true;
}
YCMD:gotocar(playerid, params[], help) {
	if(!IsAdmin(playerid, 2)) return true;

	new vehicleid;
	if(sscanf(params, "i", vehicleid))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/gotocar [vehicleid]");

	if(PaintType[playerid] != 0 && !IsAdmin(playerid, 6))
		return SCM(playerid, COLOR_GREY, "Nu poti folosi comanda asta in paint.");

	if(IsPlayerInAnyVehicle(playerid))
		return SCM(playerid, COLOR_LGREEN, "You cannot use this command from a vehicle.");	

	gString[0] = EOS;
	format(gString, sizeof(gString), "You teleported to vehicle %d.", vehicleid);
	SCM(playerid, COLOR_WHITE, gString);
	SetPlayerVirtualWorld(playerid, GetVehicleVirtualWorld(vehicleid));
	new Float: Pos[3];
	GetVehiclePos(vehicleid, Pos[0], Pos[1], Pos[2]);
	SetPlayerPos(playerid, Pos[0], Pos[1]+3, Pos[2]);
	return true;
}

YCMD:givepp(playerid, params[], help) {
	if(!IsAdmin(playerid, 6))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new id, value, reason[32];
	if(sscanf(params, "uis[32]", id, value, reason))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/givepp [playerid/name] [amount] [reason]");

	if(!IsPlayerConnected(id)) 
		return SCM(playerid, COLOR_GREY, "Acel player nu este connectat.");

	PlayerInfo[id][pPremiumPoints] += value;
	UpdateVar(playerid, "PremiumPoints", PlayerInfo[id][pPremiumPoints]);


	gString[0] = EOS;
	format(gString, sizeof(gString), "The %s[admin: %d] admin gave %s[user: %d] %d premium points reason: %s.", GetName(playerid), PlayerInfo[playerid][pSQLID], GetName(id), PlayerInfo[id][pSQLID], value, reason);
	SendAdminMessage(COLOR_ADMCMD, gString, 6);
	format(gString, sizeof(gString), "%s admin gave you %d premium points reason: %s", GetName(playerid), value, reason);
	SCM(id, COLOR_YELLOW, gString);
	return true;
}

YCMD:givemoney(playerid, params[], help) {
	if(!IsAdmin(playerid, 6)) 
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	//if action_time[playerid] > gettime() *then
	//	return SCMf(playerid, COLOR_WHITE, "Asteapta %s secunde pentru a folosi iar aceasta comanda!", action_time[playerid]-gettime());

	new id, money[20];
	if(sscanf(params, "us[20]", id, money))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/givemoney [playerid/name] [money]");

	if(!IsPlayerConnected(id)) 
		return SCM(playerid, COLOR_GREY, "Invalid Player.");

	if !isBigInt(money) *then 
		return true;

	action_time[playerid] = gettime()+10;

	converBytes(money[id], money);

	gString[0] = EOS;
	format(gString, sizeof(gString), "Admin %s give %s $%s.", GetName(playerid), GetName(id), formatStrNumber(money));
	SendAdminMessage(COLOR_WHITE, gString, 5);
	format(gString, sizeof(gString), "%s give you $%s.", GetName(playerid), formatStrNumber(money));
	SCM(id, COLOR_YELLOW, gString);
	return true;
}

YCMD:debugmoney(playerid) return SCMf(playerid, -1, "%d", bytes32(money[playerid]));

YCMD:fly(playerid, params[], help) {
	if(!IsAdmin(playerid, 1)) 
		return true;

	if(PaintType[playerid] != 0 && !IsAdmin(playerid, 6))
		return SCM(playerid, COLOR_GREY, "Nu poti folosi comanda asta in paint.");
	
	if(IsPlayerInAnyVehicle(playerid)) {
		new Float: x, Float:y, Float:z;
		GetVehicleVelocity(GetPlayerVehicleID(playerid), x, y, z);		
		SetVehicleVelocity(GetPlayerVehicleID(playerid),x, y, z + 0.5);	
		return true;
	}
	switch(UsedFly[playerid]) {
		case 0: {
			StartFly(playerid);
			UsedFly[playerid] = true;
			SetPlayerHealth(playerid, INFINITY);
		}
		case 1: {
			StopFly(playerid);
			UsedFly[playerid] = false;
			SetPlayerHealth(playerid, 99);
			SCM(playerid, 0xFFADADFF, "Fly mode off.");
		}
	}
	return true;
}

YCMD:mark(playerid, params[], help) {
	if(!IsAdmin(playerid, 1)) return true;
	GetPlayerPos(playerid, Mark[playerid][0], Mark[playerid][1], Mark[playerid][2]);
	SCM(playerid, COLOR_WHITE, "Pozitile au fost salvate.");
	MarkInt[playerid] = GetPlayerInterior(playerid);
	MarkVw[playerid] = GetPlayerVirtualWorld(playerid);
	return true;
}

YCMD:gotomark(playerid, params[], help) {
	if(!IsAdmin(playerid, 1)) return true;
	PlayerVar[playerid][IsHouses] = 0;
	PlayerVar[playerid][IsBizz] = 0;
	PlayerVar[playerid][IsFaction] = -1;
	SetPlayerInterior(playerid, MarkInt[playerid]);
	SetPlayerVirtualWorld(playerid, MarkVw[playerid]);
	SetPlayerPos(playerid, Mark[playerid][0], Mark[playerid][1], Mark[playerid][2]);
	SCM(playerid, COLOR_WHITE, "Ai fost teleportat la mark.");
	return true;
}

alias:makeleader("setleader");
YCMD:makeleader(playerid, params[]) {
	if(!IsAdmin(playerid, 5))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	new id, factionid;
	if(sscanf(params, "ui", id, factionid))
		return SCM(playerid,COLOR_GREY, "Syntax: {FFFFFF}/makeleader [playerid/name] [factionid]");

	if(1 < factionid > MAX_FACTIONS)
		return SCM(playerid, COLOR_GREY, "Invalid faction id.");

	if(!IsPlayerConnected(id))
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(PlayerInfo[id][pFP] != 0)
		return SCM(playerid, COLOR_GREY, "Acel player are faction punish.");

	if(FactionInfo_[factionid - 1][fMembers] >= FactionInfo_[factionid - 1][fMaxMembers])
		return SCM(playerid, COLOR_LGREEN, "Acea factiune are numarul maxim de memberi.");


	if(PlayerInfo[id][pRank] >= 7 && PlayerInfo[id][pMember] != 0)
		return SCM(playerid, COLOR_GREY, "Acel player este deja leader.");

	gQuery[0] = EOS;
	if(PlayerInfo[id][pMember] != 0) {
		Iter_Remove(Factions<PlayerInfo[id][pMember]>, playerid);
		FactionInfo_[PlayerInfo[id][pMember] - 1][fMembers] --;
	}
	FactionInfo_[factionid - 1][fMembers] ++;
	PlayerInfo[id][pMember] = factionid;
	PlayerInfo[id][pRank] = 7;
	UpdateVar(id, "Member", factionid);
	UpdateVar(id, "Rank", 7);

	if(PlayerInfo[id][pAdmin] || PlayerInfo[id][pHelper]) {}
	else Iter_Add(_Player<LEADER>, id);

	PlayerInfo[id][pSpawnChange] = 2;
	UpdateVar(id, "Spawnchange", 2);

	PlayerInfo[id][pTog][2] = true;
	save_tog(id);

	format(FactionInfo_[factionid - 1][fLeader], MAX_PLAYER_NAME, PlayerInfo[id][pName]);
	Iter_Add(Factions<factionid>, id);

	PlayerInfo[id][pFDays] = gettime();
	UpdateVar(id, "Days", gettime());
	SetPlayerColor(id, TeamColors[factionid]);
	foreach(new y : StreamedPlayer[id]) SetPlayerMarkerForPlayer(y, id, (GetPlayerColor(id) & 0xFFFFFF00));
	StartRaportLession(id);

	format(gString, sizeof gString, "was promoted to leader in the faction %s by admin %s", FactionInfo_[PlayerInfo[id][pMember]-1][fName], GetName(playerid));
	new year, mounth, day, hour, minute, second; getdate(year, mounth, day), gettime(hour, minute, second);
	mysql_format(SQL, gQuery, sizeof gQuery, "INSERT INTO `faction_logs` (`text`, `Userid`, `ByUserid`, `time`) VALUES ('%e', '%i', '%i', '%d-%d-%d %d:%d')", gString, PlayerInfo[id][pSQLID], PlayerInfo[playerid][pSQLID], year, mounth, day, hour, minute);
	mysql_tquery(SQL, gQuery);

	gString[0] = EOS;
	format(gString, sizeof(gString), "Admin %s i-a dat leader lui %s in factiunea %s.", GetName(playerid), GetName(id), FactionInfo_[factionid-1][fName]);
	SendAdminMessage(COLOR_ADMCMD, gString, 1);
	format(gString, sizeof(gString), "Admin %s te-a promovat la functia de leader in factiunea %s.", GetName(playerid), FactionInfo_[factionid-1][fName]);
	SCM(id, COLOR_YELLOW, gString);
	return true;
}

YCMD:gotohq(playerid, params[], help) {
	if(!IsAdmin(playerid, 2))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	if(PaintType[playerid] != 0 && !IsAdmin(playerid, 6))
		return SCM(playerid, COLOR_GREY, "Nu poti folosi comanda asta in paint.");

	new hq;
	if(sscanf(params, "i", hq))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/gotohq [hqid]");

	if(hq < 1 || hq > MAX_FACTIONS+1) 
		return SCM(playerid, COLOR_GREY, "Invalid HQ.");

	SetPlayerPos(playerid, FactionInfo_[hq-1][fEnterPos][0], FactionInfo_[hq-1][fEnterPos][1], FactionInfo_[hq-1][fEnterPos][2]);
	gString[0] = EOS;
	format(gString, sizeof(gString), "Te-ai teleportat la hq %s.", FactionInfo_[hq-1][fName]);
	SCM(playerid, COLOR_WHITE, gString);
	SetPlayerVirtualWorld(playerid, 0);
	SetPlayerInterior(playerid, 0);
	PlayerVar[playerid][IsFaction] = -1;
	PlayerVar[playerid][IsBizz] = 0;
	PlayerVar[playerid][IsHouses] = 0;
	return true;
}

YCMD:tod(playerid, params[], help) {
	if(!IsAdmin(playerid, 4))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	new time;
	if(sscanf(params, "i", time))
		return SCM(playerid,COLOR_GREY, "Syntax: {FFFFFF}/tod [time]");

	SetWorldTime(time);
	gString[0] = EOS;
	format(gString, 52, "/tod: %s has set time %d.", GetName(playerid), time);
	SendAdminMessage(COLOR_PINK, gString, 1);
	return true;
}

cmd:weather(playerid, params[]) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new weatherid;
	if(sscanf(params, "i", weatherid))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/weather [watherid]");

	format(gString, sizeof gString, "/weather: %s has set weather %d", GetName(playerid), weatherid);
	SendAdminMessage(-1, gString, 1);
	SetWeather(weatherid);
	return true;
}

YCMD:setlw(playerid, params[], help) {
	if(!IsAdmin(playerid, 6))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	if(sscanf(params, "ui", params[0], params[1]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/setlw [playerid/name] [lw]");

	if(!IsPlayerConnected(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not connected");

	if(!IsPlayerLogged(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not logged.");

	if(PlayerInfo[params[0]][pRank] < 7)
		return SCM(playerid, COLOR_GREY, "Acel player nu este leader.");

	if(params[0] < 0 || params[0] > 3) 
		return SCM(playerid, COLOR_GREY, "Invalid (1 - 3 leader warn)");

	PlayerInfo[params[0]][pLW] = params[1];
	UpdateVar(params[0], "LeaderWarn", params[1]);

	gString[0] = EOS;
	format(gString, 128, "* Admin %s i-a setat lui %s Leader warn %d.", PlayerInfo[params[0]][pLW]);
	SendAdminMessage(COLOR_YELLOW, gString, 6);
	format(gString, 128, "Admin %s ti-a setat Leader Warn pe %d.", PlayerInfo[params[0]][pLW]);
	SCM(params[0], COLOR_YELLOW, gString);
	return true;
}

YCMD:setaw(playerid, params[], help) {
	if(!IsAdmin(playerid, 6))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	if(sscanf(params, "ui", params[0], params[1]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/setaw [playerid/name] [aw]");

	if(!IsPlayerConnected(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not connected");

	if(!IsPlayerLogged(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not logged.");

	if(!IsAdmin(params[0], 1))
		return SCM(playerid, COLOR_GREY, "Acel player nu este Admin.");

	if(PlayerInfo[playerid][pAdmin]<PlayerInfo[params[0]][pAdmin])
		return SCM(playerid, COLOR_GREY, "Nu poti seta Admin Warn la un admin mai mare ca tine.");

	if(params[0] < 0 || params[0] > 3) 
		return SCM(playerid, COLOR_GREY, "Invalid (1 - 3 Admin warn)");

	PlayerInfo[params[0]][pAW] = params[1];
	UpdateVar(params[0], "AdminWarn", params[1]);

	gString[0] = EOS;
	format(gString, 128, "* Admin %s i-a setat lui %s Admin warn %d.", PlayerInfo[params[0]][pLW]);
	SendAdminMessage(COLOR_YELLOW, gString, 6);
	format(gString, 128, "Admin %s ti-a setat Admin Warn pe %d.", PlayerInfo[params[0]][pLW]);
	SCM(params[0], COLOR_YELLOW, gString);
	return true;
}

YCMD:sethw(playerid, params[], help) {
	if(!IsAdmin(playerid, 5))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	if(sscanf(params, "ui", params[0], params[1]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/sethw [playerid/name] [hw]");

	if(!IsPlayerConnected(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not connected");

	if(!IsPlayerLogged(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not logged.");

	if(!IsHelper(params[0], 1))
		return SCM(playerid, COLOR_GREY, "Acel player nu este Helper.");


	if(params[0] < 0 || params[0] > 3) 
		return SCM(playerid, COLOR_GREY, "Invalid (1 - 3 Helper warn)");

	PlayerInfo[params[0]][pHW] = params[1];
	UpdateVar(params[0], "HelperWarn", params[1]);

	gString[0] = EOS;
	format(gString, 128, "* Admin %s i-a setat lui %s Helper warn %d.", PlayerInfo[params[0]][pLW]);
	SendAdminMessage(COLOR_YELLOW, gString, 6);
	format(gString, 128, "Admin %s ti-a setat Helper Warn pe %d.", PlayerInfo[params[0]][pLW]);
	SCM(params[0], COLOR_YELLOW, gString);
	return true;
}

YCMD:makeadmin(playerid, params[]) {
	if(!IsAdmin(playerid, 7) && !IsDeveloper(playerid))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new id, level;
	if(sscanf(params, "ui", id, level)) 
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/makeadmin [playerid] [level]");
	
	if(!IsPlayerConnected(id)) 
		return SCM(playerid, COLOR_GREY, "That player is not online.");

	if(!IsPlayerLogged(id))
		return SCM(playerid, COLOR_GREY, "Player not logged!");

	if(level > 8)
		return SCM(playerid, COLOR_GREY, "Invalid.");

	if(IsDeveloper(id) && playerid != id)
		return SCM(playerid, COLOR_GREY, "Acel player are cel mai mare grad.");

	if !IsDeveloper(playerid) && level > 6 *then
		return true;

	if(playerid == id && !IsDeveloper(playerid))
		return SCM(playerid, COLOR_LGREEN, "Eroare: Nu poti sa iti setezi adminul singur.");

	if(level == 0) {
		PlayerTextDrawHide(id, ShowTD);
		Iter_Remove(_Player<ADMIN>, id);
		if(PlayerInfo[id][pHelper]) Iter_Add(_Player<HELPER>, id);
		else if(PlayerInfo[id][pRank] == 7) Iter_Add(_Player<LEADER>, id);
		if(UsedFly[id]) {
			StopFly(id);
			UsedFly[id] = false;
			SetPlayerHealth(id, 99);
			SCM(id, 0xFFADADFF, "Fly mode off.");	
		}
		if(PlayerVar[id][MySpec] != -1) {
			Iter_Remove(Spectacting[PlayerVar[id][MySpec]], id);
			PlayerVar[id][MySpec] = -1;
			PlayerVar[id][preparespawn] = true;
			TogglePlayerSpectating(id, false);
			TogglePlayerControllable(id, true);
			PlayerTextDrawHide(id, SpectateTD);
			SCM(id, COLOR_WHITE, "Nu mai esti spectator.");
		}
		update.gQuery("users", "Discord_Token", -1, "id", PlayerInfo[id][pSQLID]);
	} else Iter_Add(_Player<ADMIN>, id);


	if(PlayerInfo[id][pAdmin]==0&&level) registerAccoutnDiscord(id);

	new _hdwid[65];
	gpci(id, _hdwid, sizeof _hdwid);
	UpdateVar(id, "hdwid", YHash(_hdwid));
	
	PlayerInfo[id][pAdmin] = level;
	UpdateVar(id, "Admin", level);
	PlayerInfo[id][pTog][3] = true;
	save_tog(id);
	gString[0] = EOS;
	format(gString, 256, "Admin-ul %s l-a promovat pe %s la admin %d.", GetName(playerid), GetName(id), level);
	SendAdminMessage(COLOR_LIGHTBLUE, gString, 1);
	format(gString, sizeof(gString), "You've been promoted to level %d admin. by %s.", level, GetName(playerid), playerid);
	SCM(id, COLOR_YELLOW, gString);
	return true;
}

alias:makehelper(#sethelper);
YCMD:makehelper(playerid, params[], help) {
	if(!IsAdmin(playerid, 5))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new id, level;
	if(sscanf(params, "ui", id, level)) 
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/makehelper [playerid] [level]");
	
	if(!IsPlayerConnected(playerid) && !IsPlayerLogged(playerid)) 
		return SCM(playerid, COLOR_GREY, "That player is not online.");

	if(level > 3)
		return SCM(playerid, COLOR_GREY, "Invalid.");

	PlayerInfo[id][pHelper] = level;
	UpdateVar(id, "Helper", level);
	PlayerInfo[id][pTog][4] = true;
	save_tog(id);

	if(PlayerInfo[id][pAdmin]) {}
	else Iter_Add(_Player<HELPER>, id);

	if(level == 0) {
		if(Iter_Contains(_Player<HELPER>, id)) Iter_Remove(_Player<HELPER>, id);
		if(PlayerInfo[id][pRank] == 7 && PlayerInfo[id][pMember] != 0) Iter_Add(_Player<LEADER>, id);
		if(Iter_Contains(HelpsDuty, id)) Iter_Remove(HelpsDuty, id);
	}

	new _hdwid[65];
	gpci(id, _hdwid, sizeof _hdwid);
	UpdateVar(id, "hdwid", YHash(_hdwid));

	gString[0] = EOS;
	format(gString, 256, "Admin-ul %s l-a promovat pe %s la helper %d.", GetName(playerid), GetName(id), level);
	SendAdminMessage(COLOR_LIGHTBLUE, gString, 1);
	format(gString, sizeof(gString), "You've been promoted to level %d helper. by %s.", level, GetName(playerid), playerid);
	SCM(id, COLOR_YELLOW, gString);
	return true;
}

YCMD:aduty(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);
	PlayerVar[playerid][ADuty] = !PlayerVar[playerid][ADuty];

	if(PaintType[playerid] != 0 && !IsAdmin(playerid, 6))
		return SCM(playerid, COLOR_GREY, "Nu poti folosi comanda asta in paint.");

	switch(PlayerVar[playerid][ADuty]) {
		case false: {
			SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
			SetPlayerHealth(playerid, 99);
			SetPlayerArmour(playerid, 0);
		}
		case true: {
			SetPlayerSkin(playerid, 217);
			SetPlayerHealth(playerid, 1000000);
			SetPlayerArmour(playerid, 1000000);
		}
	}
	gString[0] = EOS;
	format(gString, sizeof(gString), "(/aduty) {FFFFFF}Admin %s %s", GetName(playerid), PlayerVar[playerid][ADuty] ? ("este admin la datorie.") : ("nu mai este admin la datorie."));
	SendAdminMessage(COLOR_PINK, gString, 1);
	return true;
}

YCMD:speed(playerid, params[], help) {
	if(!IsAdmin(playerid, 6)) 
		return true;

	PlayerVar[playerid][Speeding] = PlayerVar[playerid][Speeding] ? false : true;

	gString[0] = EOS;
	format(gString, sizeof(gString), "SPEED BOOST: %s", PlayerVar[playerid][Speeding] ? ("{39CE0D}Enabled") : ("{FF0000}Disabled"));
	SCM(playerid, COLOR_PINK, gString);
	return true;
}

YCMD:kick(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	if action_time[playerid] > gettime() *then
		return SCMf(playerid, COLOR_WHITE, "Asteapta %s secunde pentru a folosi iar aceasta comanda!", action_time[playerid]-gettime());

	new id, reason[50];
	if(sscanf(params, "us[50]", id, reason))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/kick [playerid/name] [reason]");

	if(playerid == id)
		return SCM(playerid, COLOR_GREY, "Nu poti da singur kick.");

	if(!IsPlayerConnected(id))
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(PlayerInfo[playerid][pAdmin] < PlayerInfo[id][pAdmin] || IsDeveloper(id))
		return SCM(playerid, COLOR_GREY, "Nu poti da kick la un admin mai mare ca tine.");

	action_time[playerid] = gettime()+10;
	KickEx(id);

	gString[0] = EOS;
	format(gString, 144, "AdmBot: %s has been kicked by %s, reason: %s.", GetName(playerid), GetName(id), reason);
	SCMTA(COLOR_LIGHTRED, gString);
	format(gString, sizeof gString, "Ai primit kick de la admin %s.~n~Motiv: %s", GetName(playerid), reason);
	ShowInfo(id, "~r~kick", gString, 2);
	return true;
}

YCMD:skick(playerid, params[], help) {
	if(!IsAdmin(playerid, 3))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	if action_time[playerid] > gettime() *then
		return SCMf(playerid, COLOR_WHITE, "Asteapta %d secunde pentru a folosi iar aceasta comanda!", action_time[playerid]-gettime());

	new id;
	if(sscanf(params, "u", id))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/skick [playerid/name]");

	if(playerid == id)
		return SCM(playerid, COLOR_GREY, "Nu poti da singur skick.");

	if(!IsPlayerConnected(id))
		return SCM(playerid, COLOR_GREY, "Player not connected.");
 
	if(PlayerInfo[playerid][pAdmin] < PlayerInfo[id][pAdmin] || IsDeveloper(id))
		return SCM(playerid, COLOR_GREY, "Nu poti da kick la un admin mai mare ca tine.");

	action_time[playerid] = gettime()+10;
	KickEx(id);

	gString[0] = EOS;
	format(gString, sizeof(gString), "skick: %s kicked %s.", GetName(playerid), GetName(id));
	SendAdminMessage(COLOR_PINK, gString, 1);
	return true;
}

YCMD:giftforall(playerid, params[], help) {
	if(!IsAdmin(playerid, 6))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	if action_time[playerid] > gettime() *then
		return SCMf(playerid, COLOR_WHITE, "Asteapta %d secunde pentru a folosi iar aceasta comanda!", action_time[playerid]-gettime());

	if(sscanf(params, "i", params[0]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/giftforall [points]");

	if params[0] > 500 *then SCM(playerid, COLOR_GREY, "Nu poti oferi mai mult de 500 gifturi.");
	action_time[playerid] = gettime()+10;

	gString[0] = (EOS);
	format(gString, 100, "Ai primit %s gift points de la Administratorul %s.", FormatNumber(params[0]), GetName(playerid));
	foreach(new i : Player) {
		if(!IsPlayerLogged(i)) continue;
		PlayerInfo[i][pGiftPoints] += params[0];
	}
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `users` SET `GiftPoints` = `GiftPoints` + '%i' WHERE `Status` != '-1'", params[0]);
	mysql_pquery(SQL, gQuery);
	return true;
}

YCMD:xpforall(playerid, params[], help) {
	if(!IsAdmin(playerid, 6))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	if action_time[playerid] > gettime() *then
		return SCMf(playerid, COLOR_WHITE, "Asteapta %d secunde pentru a folosi iar aceasta comanda!", action_time[playerid]-gettime());

	if(sscanf(params, "i", params[0]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/xpforall [XP]");

	action_time[playerid] = gettime()+10;

	gString[0] = (EOS);
	format(gString, 100, "Ai primit %s experience de la Administratorul %s.", FormatNumber(params[0]), GetName(playerid));
	foreach(new i : Player) {
		if(!IsPlayerLogged(i)) continue;
		GiveExperience(i, params[0]);
	}
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `users` SET `Experience` = `Experience` + '%i' WHERE `Status` != '-1'", params[0]);
	mysql_pquery(SQL, gQuery);
	return true;
}

new restart_time,restart_reason[30],Timer:restart_id=Timer:-1;
YCMD:restart(playerid, params[], help) {
	if !IsAdmin(playerid, 2) *then
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	if restart_id != Timer:-1 *then
		return SCM(playerid, COLOR_LGREEN, "Eroare: E deja un restart activ!");

	extract params -> new time, string:reason[30]; else
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/restart [seconds] [reason]");

	restart_time=time,restart_reason=reason;
	restart_id = Timer:SetTimer("TON_restart", 1000, true);
	format(gString, sizeof gString, "~y~restart~n~~w~~h~server restarting in %d seconds..~n~motiv: %s", time, reason);
	TextDrawSetString(restartTD, gString);
	foreach(new i: Player) TextDrawShowForPlayer(i, restartTD);
	return true;
}

redist::TON_restart() {
	if !_:--restart_time *then return GameModeExit();
	format(gString, sizeof gString, "~y~restart~n~~w~~h~server restarting in %d seconds..~n~motiv: %s", restart_time, restart_reason);
	TextDrawSetString(restartTD, gString);
	return true;
}

YCMD:cancelrestart(playerid, params[], help) {
	if !IsAdmin(playerid, 2) *then
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	if Timer:restart_id == Timer:-1 *then
		return SCM(playerid, COLOR_LGREEN, "Eroare: Nu este un restart activ!");

	foreach(new i: Player) TextDrawHideForPlayer(i, restartTD);
	KillTimer(_:restart_id);
	return true;
}

YCMD:ban(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	if((gettime() - LastAction[playerid]) < 60) {
		ActionWarning[playerid] ++;
		if(ActionWarning[playerid] >= 5) {
			PlayerInfo[playerid][pAdmin] = 0;
			UpdateVar(playerid, "Admin", 0);
		}
	}
	new id, type, reason[35];
	if(sscanf(params, "uis[35]", id, type, reason))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/ban [playerid/name] [type 0 permanent / 1 days] [reason]");

	if(playerid == id)
		return SCM(playerid, COLOR_GREY, "Nu te poti bana singur.");

	if(!IsPlayerConnected(id))
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(!IsPlayerLogged(id))
		return SCM(playerid, COLOR_GREY, "Player not logged.");

	if(PlayerInfo[playerid][pAdmin] <= PlayerInfo[id][pAdmin] || IsDeveloper(id))
		return SCM(playerid, COLOR_GREY, "Nu poti da ban la un admin mai mare ca tine.");


	if(type == 0) {
		mysql_format(SQL, gQuery, sizeof(gQuery), "INSERT INTO `bans` (`Userid`, `Name`, `Permanent`, `Reason`, `ByBanned`, `date`) VALUES ('%d', '%s', '1', '%s', '%s', '%s')", PlayerInfo[id][pSQLID], PlayerInfo[id][pName], reason, GetName(playerid), Date());
		mysql_tquery(SQL, gQuery, "Cache_Insert_Ban_ID", "iiiiss", type, id, playerid, 0, PlayerInfo[id][pName], reason);
	} else {
		mysql_format(SQL, gQuery, sizeof(gQuery), "INSERT INTO `bans` (`Userid`, `Name`, `Time`, `Reason`, `ByBanned`, `date`) VALUES ('%d', '%s', '%d', '%s', '%s', '%s')", PlayerInfo[id][pSQLID], PlayerInfo[id][pName], (gettime() + (type * 86400)), reason, GetName(playerid), Date());
		mysql_tquery(SQL, gQuery, "Cache_Insert_Ban_ID", "iiiiss", type, id, playerid, 1, PlayerInfo[id][pName], reason);
	}
	return true;
}

YCMD:lastchat(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	if(sscanf(params, "u", params[0]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/lastchat [playerid/name]");

	if(PlayerInfo[playerid][pAdmin]<PlayerInfo[params[0]][pAdmin])
		return SCM(playerid, COLOR_GREY, "Nu poti vizualiza chatul unui admin mai mare decat tine.");

	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof gQuery, "SELECT * FROM `chat_log` WHERE `Userid` = '%i' ORDER BY `chat_log`.`ID` DESC LIMIT 20", PlayerInfo[params[0]][pSQLID]);
	mysql_tquery(SQL, gQuery, "SQL_chat_log", "i", playerid);
	return true;
}

function SQL_chat_log(playerid) {
	if(!cache_num_rows()) return SCM(playerid, COLOR_GREY, "Nu s-a gasit niciun chat log la acest player");
	if(cache_affected_rows()) return SCM(playerid, COLOR_GREY, "A aprut o problema la incarcarea chatului.");

	new i=-1, id, date[30], name[MAX_PLAYER_NAME], text[128], szString[1000]; gString[0] = EOS;
	while(++i<cache_num_rows()) {
		cache_get_value_name_int(i, "Userid", id);
		cache_get_value_name(i, "date", date);
		cache_get_value_name(i, "Name", name);
		cache_get_value_name(i, "text", text);

		format(gString, 150, "[%s] %s: %s\n", date, name, text);
		strcat(szString, gString);
	}
	format(gString, 50, "Chat log %s:", name);
	ShowPlayerDialog(playerid, DIALOG_ONLINE, DIALOG_STYLE_MSGBOX, gString, szString, "Close", "");
	format(gString, 100, "Au fost incarcate %d mesaje.", cache_num_rows());
	SCM(playerid, COLOR_YELLOW, gString);
	return true;
}

YCMD:bano(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	if((gettime() - LastAction[playerid]) < 60) {
		ActionWarning[playerid] ++;
		if(ActionWarning[playerid] >= 5) {
			PlayerInfo[playerid][pAdmin] = 0;
			UpdateVar(playerid, "Admin", 0);
		}
	}

	new id[MAX_PLAYER_NAME], type, reason[35];
	if(sscanf(params, "s[24]is[35]", id, type, reason))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/bano [name] [type 0 permanent / 1 days] [reason]");

	if(IsDeveloperOff(id))
		return SCM(playerid, COLOR_LGREEN, "Nu poti bana acea persoana.");

	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, 150, "SELECT * FROM `bans` WHERE `name` = '%e'", id);
	mysql_tquery(SQL, gQuery, "SQL_cache_banoff", "iiss", playerid, type, id, reason);
	return true;
}

function SQL_cache_banoff(playerid, type, const name[], const reason[]) {
	if(cache_num_rows())
		return SCM(playerid, COLOR_GREY, "Acest player este banat deja.");

	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, 100, "SELECT * FROM `users` WHERE `name` = '%e'", name);
	mysql_tquery(SQL, gQuery, "SQL_cache_banoff2", "iiss", playerid, type, name,  reason);
	return true;
}

function SQL_cache_banoff2(playerid, type, const name[], const reason[]) {
	if(!cache_num_rows())
		return SCM(playerid, COLOR_GREY, "Acel player nu exista.");

	LastAction[playerid] = gettime();

	new admin, userid, id;
	cache_get_value_name_int(0, "Admin", admin);
	cache_get_value_name_int(0, "id", userid);
	cache_get_value_name_int(0, "Status", id);

	if(PlayerInfo[playerid][pAdmin] <= admin && !IsDeveloper(playerid))
		return SCM(playerid, COLOR_GREY, "Nu poti da ban la un admin mai mare ca tine.");	

	if(playerid == id)
		return SCM(playerid, COLOR_GREY, "Nu te poti bana singur");

	if(id != -1)
		KickEx(id);

	gQuery[0] = EOS;
	if(type == 0) {
		mysql_format(SQL, gQuery, sizeof(gQuery), "INSERT INTO `bans` (`Userid`, `Name`, `Permanent`, `Reason`, `ByBanned`, `date`) VALUES ('%i', '%e', '1', '%e', '%e', '%e')", userid, name, reason, GetName(playerid), Date());
		mysql_tquery(SQL, gQuery, "Cache_Insert_Ban_IDEx", "iiiss", type, playerid, 0, name, reason);
	}
	else {
		mysql_format(SQL, gQuery, sizeof(gQuery), "INSERT INTO `bans` (`Userid`, `Name`, `Time`, `Reason`, `ByBanned`, `date`) VALUES ('%i', '%e', '%i', '%e', '%e', '%e')", userid, name, (gettime() + (type * 86400)), reason, GetName(playerid), Date());
		mysql_tquery(SQL, gQuery, "Cache_Insert_Ban_IDEx", "iiiss", type, playerid, 1, name, reason);
	}
	return true;
}

YCMD:banip(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	if((gettime() - LastAction[playerid]) < 60) {
		ActionWarning[playerid] ++;
		if(ActionWarning[playerid] >= 5) {
			PlayerInfo[playerid][pAdmin] = 0;
			UpdateVar(playerid, "Admin", 0);
		}
	}

	extract params -> new string:adress_[32], type, string:reason[35]; else
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/banip [playerid/IP] [type 0 permanent / days] [reason]");

	if(IsNumeric(adress_)) format(adress_, sizeof adress_, "%s", playerIP[strval(adress_)]);

	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, 150, "SELECT * FROM `bans` WHERE `IP` = '%s'", adress_);
	mysql_tquery(SQL, gQuery, "SQL_cache_banip", "iiss", playerid, type, adress_, reason);
	return true;
}
redist::SQL_cache_banip(playerid, type, ip[], const reason[]) {
	if(cache_num_rows())
		return SCM(playerid, COLOR_GREY, "Este deja banat acest IP.");

	mysql_format(SQL, gQuery, sizeof gQuery, "select * from `users` where `IP`='%s' LIMIT 10", ip);
	mysql_tquery(SQL, gQuery, #cache_from_users, #iiss, playerid, type, ip, reason);
	return true;
}

redist::cache_from_users(playerid, type, ip[], const reason[]) {
	gString[0] = EOS;
	new i=-1;
	while(++i<cache_num_rows()) {
		new admin, userid, id;
		cache_get_value_name_int(i, "Admin", admin);
		cache_get_value_name_int(i, "id", userid);
		cache_get_value_name_int(i, "Status", id);

		if(playerid == id)
			return SCM(playerid, COLOR_GREY, "Nu poti bana IP tau.");

		if(PlayerInfo[playerid][pAdmin] < admin && !IsDeveloper(playerid))
			return SCM(playerid, COLOR_GREY, "Nu poti bana acest IP.");	

		if(id != -1) {
			switch(type) {
				case 0: format(gString, sizeof(gString), "This IP (~y~%s~w~~h~) is banned! Banned by %s. reason: %s.~n~This is a permanent ban.~n~Poti posta o cere de unban pe ~b~~h~~h~http://panel."SERVER_NAME".ro~w~~h~ daca consideri ca ai luat ban degeaba.", ip, playerid != -1 ? GetName(playerid) : ("AdmBot"), reason);
				default: format(gString, sizeof(gString), "This IP (~y~%s~w~~h~) is banned! Banned by %s. reason: %s.~n~Ban will expire in %d days left.~n~Poti posta o cere de unban pe ~b~~h~~h~http://panel."SERVER_NAME".ro~w~~h~ daca consideri ca ai luat ban degeaba.", ip, playerid != -1 ? GetName(playerid) : ("AdmBot"), reason, type);
			}
			ShowInfo(id, "~r~banned", gString, 3);
			KickEx(id);
		}
	}

	gQuery[0] = EOS;
	if(type == 0) {
		mysql_format(SQL, gQuery, sizeof(gQuery), "INSERT INTO `bans` (`Permanent`, `IP`, `Reason`, `ByBanned`, `date`) VALUES ('1', '%e', '%e', '%e', '%e')", ip, reason, GetName(playerid), Date());
		mysql_tquery(SQL, gQuery, "Cache_Insert_Ban_IDExx", "iiiis", type, playerid, 0, ip, reason);
	}
	else {
		mysql_format(SQL, gQuery, sizeof(gQuery), "INSERT INTO `bans` (`Time`, `IP`, `Reason`, `ByBanned`, `date`) VALUES ('%i', '%e', '%e', '%e', '%e')", (gettime() + (type * 86400)), ip, reason, GetName(playerid), Date());
		mysql_tquery(SQL, gQuery, "Cache_Insert_Ban_IDExx", "iiiis", type, playerid, 1, ip, reason);
	}
	return true;
}

YCMD:getip(playerid, params[]) {
	if(!IsAdmin(playerid, 4))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	if(sscanf(params, "u", params[0]))
		return SCM(playerid, COLOR_GREY, "Syntax: /getip{FFFFFF} [playerid/name]");

	gString[0] = EOS;
	format(gString, sizeof gString, "IP: {D7FFB3}%s {FFFFFF}({D7FFB3}%d{FFFFFF}) | {D7FFB3}%s{FFFFFF}.", GetName(params[0]), params[0], GetIPP(params[0]));
	SCM(playerid, COLOR_WHITE, gString);
	return true;
}

YCMD:systems(playerid, params[], help) {
	if(!IsAdmin(playerid, 6))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new x[80], szDialog[600];
	strcat(szDialog, "Type\tStatus\n");
	for(new i = 0; i < MAX_SYSTEMS; i++) {
		format(x, sizeof(x), "{FFFFFF}%s\t%s\n", GetSystemName(i), ServerSystem(i) ? ("{00FF00}Enabled") : ("{FF0000}Disabled"));
		strcat(szDialog, x);
	}
	ShowPlayerDialog(playerid, DIALOG_SYSTEMS, DIALOG_STYLE_TABLIST_HEADERS, "Systems:", szDialog, "Select", "Close");
	return true;
}

function Cache_Insert_Ban_IDEx(days, playerid, type, const name[], const reason[]) {
	gQuery[0] = EOS; gString[0] = EOS;
	switch(type) {
		case 0: format(gString, sizeof gString, "AdmBot: %s has been permanent offline banned by %s, reason: %s", name, GetName(playerid), reason);	
		case 1: format(gString, sizeof gString, "AdmBot: %s was offline banned by %s for %d days, reason: %s", name, GetName(playerid), days, reason);
		case 2: format(gString, sizeof gString, "AdmBot: %s was offline banned by AdmBot for %d days, reason: %s", name, days, reason);
		case 3: return true;
	}
	SCMTA(COLOR_LIGHTRED, gString);	
	return true;
}

function Cache_Insert_Ban_IDExx(days, playerid, type, const ip[], const reason[]) {
	LastAction[playerid] = gettime();
	gQuery[0] = EOS; gString[0] = EOS;
	switch(type) {
		case 0: format(gString, sizeof gString, "AdmBot: IP %s has been permanent banned IP by %s, reason: %s", ip, GetName(playerid), reason);	
		default: format(gString, sizeof gString, "AdmBot: IP %s was banned IP by %s for %d days, reason: %s", ip, GetName(playerid), days, reason);
	}
	SendAdminMessage(COLOR_DARKNICERED, gString, 1);
	return true;
}

function Cache_Insert_Ban_ID(days, id, playerid, type, const name[], const reason[]) {
	LastAction[playerid] = gettime();
	gQuery[0] = EOS; gString[0] = EOS;
	KickEx(id);
	switch(type) {
		case 0: {
			format(gString, sizeof gString, "AdmBot: %s has been permanent banned by %s, reason: %s", name, GetName(playerid), reason);	
			SCMTA(COLOR_LIGHTRED, gString);
			format(gString, sizeof(gString), "This Account (~y~%s~w~~h~) is banned! Banned by %s. reason: %s.~n~This is a permanent ban.~n~Poti posta o cere de unban pe ~b~~h~~h~http://panel."SERVER_NAME".ro~w~~h~ daca consideri ca ai luat ban degeaba.", name, playerid != -1 ? GetName(playerid) : ("AdmBot"), reason);
		}
		case 1: {
			format(gString, sizeof gString, "AdmBot: %s was banned by %s for %d days, reason: %s", name, GetName(playerid), days, reason);
			SCMTA(COLOR_LIGHTRED, gString);
			format(gString, sizeof(gString), "This Account (~y~%s~w~~h~) is banned! Banned by %s. reason: %s.~n~Ban will expire in %d days left.~n~Poti posta o cere de unban pe ~b~~h~~h~http://panel."SERVER_NAME".ro~w~~h~ daca consideri ca ai luat ban degeaba.", name, playerid != -1 ? GetName(playerid) : ("AdmBot"), reason, days);
		}
		case 2: return true;
	}
	ShowInfo(id, "~r~banned", gString, 3);
	return true;
}

YCMD:warn(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	if((gettime() - LastAction[playerid]) < 60) {
		ActionWarning[playerid] ++;
		if(ActionWarning[playerid] >= 5) {
			PlayerInfo[playerid][pAdmin] = 0;
			UpdateVar(playerid, "Admin", 0);
		}
	}

	new id, reason[35];
	if(sscanf(params, "us[35]", id, reason))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/warn [playerid/name] [reason]");

	if(playerid == id)
		return SCM(playerid, COLOR_GREY, "Nu poti sa iti dai singur warn.");

	if(!IsPlayerConnected(id) || !IsPlayerLogged(id))
		return SCM(playerid, COLOR_GREY, "Acel player nu este connectat sau logat.");

	if(PlayerInfo[id][pAdmin] > PlayerInfo[playerid][pAdmin] || IsDeveloper(id))
		return SCM(playerid, COLOR_GREY, "Acel player are adminu mare mare ca tine.");

	PlayerInfo[id][pWarn] ++;
	gString[0] = EOS;
	format(gString, sizeof(gString), COLOR_GMx"(/warn) {FFFFFF}Admin %s i-a dat warn lui %s. motiv: %s", GetName(playerid), GetName(id), reason);
	SendAdminMessage(COLOR_PINK, gString, 1);

	if(PlayerInfo[playerid][pWarn] == 3) {
		BanPlayer(playerid, 3, 1, "AdmBot", "3/3 warn");
		PlayerInfo[id][pWarn] = 0;
	}
	LastAction[playerid] = gettime();
	UpdateVar(id, "Warn", PlayerInfo[id][pWarn]);

	KickEx(id);
	format(gString, sizeof gString, "Ai primit warn de la admin %s.~n~Motiv: %s", GetName(playerid), reason);
	ShowInfo(id, "~r~warn", gString, 2);
	return true;
}

YCMD:unwarn(playerid, params[], help) {
	if(!IsAdmin(playerid, 4))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	new id;
	if(sscanf(params, "u", id))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/unwarn [playerid/name]");

	if(!IsPlayerConnected(id))
		return SCM(playerid, COLOR_GREY, "Not player connected.");

	if(PlayerInfo[id][pWarn] < 1)
		return SCM(playerid, COLOR_GREY, "Acel player nu are warninguri.");

	PlayerInfo[id][pWarn] --;
	UpdateVar(id, "Warn", PlayerInfo[id][pWarn]);

	gString[0] = EOS;
	format(gString, sizeof(gString), COLOR_GMx"(/unwarn) {FFFFFF}Admin %s i-a dat unwarn lui %s.", GetName(playerid), GetName(id));
	SendAdminMessage(COLOR_PINK, gString, 1);
	format(gString, sizeof(gString), "Admin %s ti-a dat unwarn.", GetName(playerid));
	SCM(id, COLOR_YELLOW, gString);
	return true;
}

YCMD:unban(playerid, params[], help) {
	if(!IsAdmin(playerid, 4))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	if(sscanf(params, "s[24]", gString))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/unban [name]");

	mysql_format(SQL, gQuery, sizeof gQuery, "SELECT * FROM `bans` WHERE `Name`='%e' LIMIT 1", params);
	mysql_tquery(SQL, gQuery, "SQL_checkban", "is", playerid, gString);
	return true;
}
redist::SQL_checkban(playerid, const name[]) {
	if(!cache_num_rows()) 
		return SCM(playerid, COLOR_GREY, "Acel player nu este banat.");

	mysql_format(SQL, gQuery, sizeof(gQuery), "DELETE FROM `bans` WHERE `Name`='%s' LIMIT 1", name);
	mysql_tquery(SQL, gQuery);

	format(gString, 70, "/unban: Admin %s l-a debanat pe %s.", GetName(playerid), name);
	SendAdminMessage(COLOR_PINK, gString, 4);
	return true;
}

YCMD:unbanip(playerid, params[], help) {
	if(!IsAdmin(playerid, 4))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	if(sscanf(params, "s[24]", gString))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/unban [IP]");

	mysql_format(SQL, gQuery, sizeof gQuery, "SELECT * FROM `bans` WHERE `IP`='%e' LIMIT 1", gString);
	mysql_tquery(SQL, gQuery, "SQL_checkbanIP", "is", playerid, gString);
	return true;
}
redist::SQL_checkbanIP(playerid, const name[]) {
	if(!cache_num_rows()) 
		return SCM(playerid, COLOR_GREY, "Aceasta adresa IP nu este banata!");

	mysql_format(SQL, gQuery, sizeof(gQuery), "DELETE FROM `bans` WHERE `IP`='%s' LIMIT 1", name);
	mysql_tquery(SQL, gQuery);

	format(gString, 70, "/unban: Admin %s a debanat IP %s.", GetName(playerid), name);
	SendAdminMessage(COLOR_PINK, gString, 4);
	return true;
}

alias:set("setstat");
YCMD:set(playerid, params[], help) {
	if(!IsAdmin(playerid, 6)) 
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new name[MAX_PLAYER_NAME], type[20], amount[20];
	if(sscanf(params, "s[24]s[20]s[20]", name, type, amount)){
		SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/set [name] [type] [amount]");
		SCM(playerid, COLOR_GREY, "Type: {FFFFFF}Hours, Money, Bank, Level, Admin, Slot, Hidden, House, Bizz");
		SCM(playerid, COLOR_GREY, "Type: {FFFFFF}Member, Rank, Phone, VIP, Premium, PP, Helper, Neon1 - 6, Gift, rob");
		SCM(playerid, COLOR_GREY, "Type: {FFFFFF}Job, PetLevel, PetExp, skill, punish, redpoints");
		return true;
	}
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "SELECT * FROM `users` WHERE `name`='%s'", name);
	new Cache: result = mysql_query(SQL, gQuery), id = -2, admin;
	if(cache_num_rows()) cache_get_value_name_int(0, "Status", id), cache_get_value_name_int(0, "Admin", admin);
	cache_delete(result);
	if(id == -2) return SCM(playerid, COLOR_GREY, "Contul acesta nu a fost gasit in baza de date.");
	if(!IsNumeric(amount)) return true;
	new am = strval(amount);
	gQuery[0] = EOS;
	if(strcmp("Hours", type, true) == 0) {
		if(id != -1) PlayerInfo[id][pPlaying] = am * 3600;
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `Playing`='%d' WHERE `name`='%s'", am * 3600, name);
		mysql_tquery(SQL, gQuery, "", "");
	}
	else if(strcmp("rob", type, true) == 0) {
		if(id != -1) PlayerInfo[id][pRobExp] = am;
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `RobExp`='%d' WHERE `name`='%s'", am, name);
		mysql_tquery(SQL, gQuery, "", "");
	}
	else if(strcmp("Phone", type, true) == 0) {
		if(id != -1) {
			PhoneFinder[PlayerInfo[id][pPhone]] = -1;
			PlayerInfo[id][pPhone] = am;
			PhoneFinder[am] = id;
		}
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `Phone`='%d' WHERE `name`='%s'", am, name);
		mysql_tquery(SQL, gQuery, "", "");
	}
	else if(!strcmp("punish", type, true)) {
		if(id != -1) PlayerInfo[id][pFP] = am;
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `FP`='%d' WHERE `name`='%s'", am, name);
		mysql_tquery(SQL, gQuery, "", "");
	}
	else if(!strcmp("redpoints", type, true)) {
		if(id != -1) PlayerInfo[id][pServerPoints] = am;
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `ServerPoints`='%d' WHERE `name`='%s'", am, name);
		mysql_tquery(SQL, gQuery, "", "");
	}
	else if(strcmp("skill", type, true) == 0) {
		if(id==-1) return SCM(playerid, COLOR_GREY, "Acel player trb sa fie logat.");
		if(!PlayerInfo[playerid][pJob]) return SCM(playerid, COLOR_GREY, "Acel player nu are un job.");
		PlayerInfo[playerid][pJobSkill][PlayerInfo[playerid][pJob]-1] = am;
		save_jobskill(playerid);
	}
	else if(strcmp("Premium", type, true) == 0) {
		if(id != -1) PlayerInfo[id][pPremiumAccount] = bool:am;
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `Premium`='%d' WHERE `name`='%s'", am, name);
		mysql_tquery(SQL, gQuery, "", "");
	}
	else if(strcmp("gift", type, true) == 0) {
		if(id != -1) PlayerInfo[id][pGiftPoints] = am;
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `GiftPoints`='%d' WHERE `name`='%s'", am, name);
		mysql_tquery(SQL, gQuery, "", "");
	}
	else if(strcmp("Neon1", type, true) == 0) {
		new neon[50], var[6];
		if(id != -1) PlayerInfo[id][pNeon][0] = am;
		cache_get_value_name(0, "Neon", neon);
		sscanf(neon, "iiiiii", var[0], var[1], var[2], var[3], var[4], var[5]);
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `Neon`='%d|%d|%d|%d|%d|%d' WHERE `name`='%s'", am, var[1], var[2], var[3], var[4], var[5], name);
		mysql_tquery(SQL, gQuery, "", "");
	}
	else if(strcmp("Neon2", type, true) == 0) {
		new neon[50], var[6];
		if(id != -1) PlayerInfo[id][pNeon][1] = am;
		cache_get_value_name(0, "Neon", neon);
		sscanf(neon, "iiiiii", var[0], var[1], var[2], var[3], var[4], var[5]);
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `Neon`='%d|%d|%d|%d|%d|%d' WHERE `name`='%s'", am, var[1], var[2], var[3], var[4], var[5], name);
		mysql_tquery(SQL, gQuery, "", "");
	}	
	else if(strcmp("Neon3", type, true) == 0) {
		new neon[50], var[6];
		if(id != -1) PlayerInfo[id][pNeon][2] = am;
		cache_get_value_name(0, "Neon", neon);
		sscanf(neon, "iiiiii", var[0], var[1], var[2], var[3], var[4], var[5]);
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `Neon`='%d|%d|%d|%d|%d|%d' WHERE `name`='%s'", am, var[1], var[2], var[3], var[4], var[5], name);
		mysql_tquery(SQL, gQuery, "", "");
	}
	else if(strcmp("Neon4", type, true) == 0) {
		new neon[50], var[6];
		if(id != -1) PlayerInfo[id][pNeon][3] = am;
		cache_get_value_name(0, "Neon", neon);
		sscanf(neon, "iiiiii", var[0], var[1], var[2], var[3], var[4], var[5]);
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `Neon`='%d|%d|%d|%d|%d|%d' WHERE `name`='%s'", am, var[1], var[2], var[3], var[4], var[5], name);
		mysql_tquery(SQL, gQuery, "", "");
	}
	else if(strcmp("Neon5", type, true) == 0) {
		new neon[50], var[6];
		if(id != -1) PlayerInfo[id][pNeon][4] = am;
		cache_get_value_name(0, "Neon", neon);
		sscanf(neon, "iiiiii", var[0], var[1], var[2], var[3], var[4], var[5]);
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `Neon`='%d|%d|%d|%d|%d|%d' WHERE `name`='%s'", am, var[1], var[2], var[3], var[4], var[5], name);
		mysql_tquery(SQL, gQuery, "", "");
	}
	else if(strcmp("Neon6", type, true) == 0) {
		new neon[50], var[6];
		if(id != -1) PlayerInfo[id][pNeon][5] = am;
		cache_get_value_name(0, "Neon", neon);
		sscanf(neon, "iiiiii", var[0], var[1], var[2], var[3], var[4], var[5]);
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `Neon`='%d|%d|%d|%d|%d|%d' WHERE `name`='%s'", am, var[1], var[2], var[3], var[4], var[5], name);
		mysql_tquery(SQL, gQuery, "", "");
	}
	else if(strcmp("PetExp", type, true) == 0) {
		if(id != -1) PlayerInfo[id][pPetExp] = am;
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `PetExp`='%d' WHERE `name`='%s'", am, name);
		mysql_tquery(SQL, gQuery, "", "");
	}
	else if(strcmp("PetLevel", type, true) == 0) {
		if(id != -1) {
			PlayerInfo[id][pPetLevel] = am;
			if(PlayerInfo[id][pPetStatus]) {
				format(gString, 100, "{50D654}Lvl. {FFFFFF}%d {50D687}%s", PlayerInfo[id][pPetLevel], PlayerInfo[id][pPetName]);
				UpdateDynamic3DTextLabelText(Pet[id], COLOR_WHITE, gString);
			}
		}
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `PetLevel`='%d' WHERE `name`='%s'", am, name);
		mysql_tquery(SQL, gQuery, "", "");
	}
	else if(strcmp("Job", type, true) == 0) {
		if(id != -1) PlayerInfo[id][pJob] = am;
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `Job`='%d' WHERE `name`='%s'", am, name);
		mysql_tquery(SQL, gQuery, "", "");
	}
	else if(strcmp("Helper", type, true) == 0) {
		if(id != -1) PlayerInfo[id][pHelper] = am;
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `Helper`='%d' WHERE `name`='%s'", am, name);
		mysql_tquery(SQL, gQuery, "", "");
	}
	else if(strcmp("VIP", type, true) == 0) {
		if(id != -1) {
			if(PlayerInfo[id][pVip]) Delete3DTextLabel(VIPLabel[id]);
			PlayerInfo[id][pVip] = am;
			if(am) {
   				VIPLabel[id] = Create3DTextLabel("VIP USER", 0x7DE41BFF, 0.0, 0.0, 0.0, 10.0, 0, 0);
    			Attach3DTextLabelToPlayer(VIPLabel[id], id, 0.0, 0.0, 0.4);
			}
		}
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `VIP`='%d' WHERE `name`='%s'", am, name);
		mysql_tquery(SQL, gQuery, "", "");
	}
	else if(strcmp("Money", type, true) == 0) {
		if(id != -1) resetBigInt(money[id]), converBytes(money[id], amount);
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `Money`='%s' WHERE `name`='%s'", amount, name);
		mysql_tquery(SQL, gQuery, "", "");
	}
	else if(strcmp("Bank", type, true) == 0) {
		if(id != -1) resetBigInt(bank[id]), converBytes(bank[id], amount);
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `Bank`='%s' WHERE `name`='%s'", amount, name);
		mysql_tquery(SQL, gQuery, "", "");
	}
	else if(strcmp("Level", type, true) == 0) {
		if(id != -1) PlayerInfo[id][pLevel] = am, PlayerVar[playerid][AcoverLevel] = am, SetPlayerLevelEx(id);
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `Level`='%d' WHERE `name`='%s'", am, name);
		mysql_tquery(SQL, gQuery, "", "");	
	}
	else if(strcmp("PP", type, true) == 0) {
		if(id != -1) PlayerInfo[id][pPremiumPoints] = am;
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `PremiumPoints`='%d' WHERE `name`='%s'", am, name);
		mysql_tquery(SQL, gQuery, "", "");	
	}
	else if(strcmp("Admin", type, true) == 0) {
		if(IsDeveloperOff(name) && !IsDeveloper(playerid))
			return SCM(playerid, COLOR_GREY, "Nu poti seta adminu acelui jucator.");

		if(am > 7)
			return SCM(playerid, -1, "Invalid admin.");

		if(id != -1) {
			PlayerInfo[id][pAdmin] = am;
		}
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `Admin`='%d' WHERE `name`='%s'", am, name);
		mysql_tquery(SQL, gQuery, "", "");	
	}
	else if(strcmp("Slot", type, true) == 0) {
		if(am > MAX_PLAYER_VEHICLE) {
			gString[0] = EOS;
			format(gString, sizeof(gString), "Invalid (Maxim %d slot)", MAX_PLAYER_VEHICLE);
			SCM(playerid, COLOR_GREY, gString);
			return true;
		}
		if(id != -1) PlayerInfo[id][pSlot] = am;
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `Slot`='%d' WHERE `name`='%s'", am, name);
		mysql_tquery(SQL, gQuery, "", "");	
	}
	else if(strcmp("Hidden", type, true) == 0) {
		if(id != -1) PlayerInfo[id][pHidden] = am;
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `Hidden`='%d' WHERE `name`='%s'", am, name);
		mysql_tquery(SQL, gQuery, "", "");	
	}
	else if(strcmp("House", type, true) == 0) {
		if(id != -1) PlayerInfo[id][pHouse] = am == 0 ? -1 : am;
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `House`='%d' WHERE `name`='%s'", am == 0 ? -1 : am, name);
		mysql_tquery(SQL, gQuery, "", "");	
	}
	else if(strcmp("Bizz", type, true) == 0) {
		if(id != -1) PlayerInfo[id][pBussines] = am == 0 ? -1 : am;
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `Bussines`='%d' WHERE `name`='%s'", am == 0 ? -1 : am, name);
		mysql_tquery(SQL, gQuery, "", "");	
	}
	else if(strcmp("Member", type, true) == 0) {
		if(id != -1) PlayerInfo[id][pMember] = am;
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `Member`='%d' WHERE `name`='%s'", am, name);
		mysql_tquery(SQL, gQuery, "", "");	
	}
	else if(strcmp("Rank", type, true) == 0) {
		if(id != -1) PlayerInfo[id][pRank] = am;
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `Rank`='%d' WHERE `name`='%s'", am, name);
		mysql_tquery(SQL, gQuery, "", "");	
	}
	else {
		SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/set [name] [type] [amount]");
		SCM(playerid, COLOR_GREY, "Type: {FFFFFF}Hours, Money, Bank, Level, Admin, Slot, Hidden, House, Bizz");
		SCM(playerid, COLOR_GREY, "Type: {FFFFFF}Member, Rank, Phone, VIP, Premium, PP, Helper, Neon1 - 6, Gift, Rob");
		SCM(playerid, COLOR_GREY, "Type: {FFFFFF}Job, PetLevel, PetExp");
		return true;		
	}
	gString[0] = EOS;
	if(id != -1) format(gString, sizeof gString , "(Set): {FFFFFF}%s (id: %d) was set %s values '%s' by %s.", name, id, type, amount, GetName(playerid));
	else format(gString, sizeof gString, "(Set): {FFFFFF}%s was set %s values '%s' by %s.", name, type, amount, GetName(playerid));
	SendAdminMessage(COLOR_DARKNICERED, gString, 6);
	return true;
}

YCMD:spawn(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new id;
	if(sscanf(params, "u", id))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/spawn [playerid/name]");

	if(!IsPlayerConnected(id))
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(!IsPlayerLogged(id))
		return SCM(playerid, COLOR_GREY, "Player not logged.");

	if(PlayerVar[id][MySpec] != -1)
		return SCM(playerid, COLOR_GREY, "Nu poti spawna acel player.");

	if(PlayerInfo[playerid][pAdmin] < PlayerInfo[id][pAdmin])
		return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta comanda pe acel player.");

	if(!IsPlayerInAnyVehicle(id)) SpawnPlayer(id);
	else {
		SetPlayerPose(id, 0, 0, 5);
		SpawnPlayer(id);
	}
	gString[0] = EOS;
	format(gString, sizeof(gString), "You have been spawned by %s.", GetName(playerid));
	SCM(id, COLOR_PINK, gString);
	format(gString, sizeof(gString), COLOR_GMx"(/spawn) {FFFFFF}Admin %s has /spawn-ed %s.", GetName(playerid), GetName(id));
	SendAdminMessage(COLOR_WHITE, gString, 1);
	return true;
}

YCMD:spawncar(playerid, params[], help) {
	if(!IsAdmin(playerid, 1)) 
		return SCM(playerid, COLOR_LGREEN, "You are not admin.");
	
	new model;
	if(sscanf(params, "i", model)) 
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/spawncar [modelid]");

	if(model < 400 || model > 611)
		return SCM(playerid, COLOR_GREY, "Invalid Model.");

	if(IsPlayerInAnyVehicle(playerid))
		return SCM(playerid, COLOR_LGREEN, "You cannot use this command from a vehicle.");
	
	new Float: X, Float: Y, Float: Z, vehicleid;
	GetPlayerPos(playerid, X, Y, Z);
	vehicleid = CreateVehicleEx(model, X, Y, Z, 0.0, random(255), random(255), -1, 0);
	Fuel[vehicleid] = 100;
	SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
	SetVehicleInterior(vehicleid, GetPlayerInterior(playerid));
	PutPlayerInVehicle(playerid, vehicleid, 0);
	Iter_Add(VehicleSpawned, vehicleid);
	return true;
}

YCMD:gmx(playerid, params[], help) {
	if(!IsAdmin(playerid, 7))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);


	GameModeExit();
	format(gString, 128, "* Admin %s a dat restart la server.", GetName(playerid));
	SCMTA(COLOR_ADMCMD, gString);
	return true;
}
YCMD:admins(playerid, params[], help) {
	SCM(playerid, COLOR_SERVER, "-------Admins Online------------------------------");
	if(Iter_Count(_Player<ADMIN>)) {
		foreach(new i : _Player<ADMIN>) 
			SCMf(playerid, COLOR_WHITE, "(%d) %s - admin level %d", i, PlayerInfo[i][pName], PlayerInfo[i][pAdmin]);
		
		SCM(playerid, COLOR_SERVER, "----------------------------------------------------");
		SCMf(playerid, COLOR_WHITE, "* Sunt %d admini online, Daca ai o problema foloseste /report.", Iter_Count(_Player<ADMIN>));
	}
	else SCM(playerid, COLOR_WHITE, "* Nu este nici un admin online.");
	SCM(playerid, COLOR_SERVER, "----------------------------------------------------");
	return true;
}
YCMD:vehname(playerid, params[], help) {
	if(!IsAdmin(playerid, 1)) 
		return SCM(playerid, COLOR_LGREEN, AdminOnly);
	
	new model[MAX_PLAYER_NAME], x;
	if(sscanf(params, "s[24]", model))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/vehname [model/name]");

	SCM(playerid, COLOR_SERVER, "...................................................................");
	SCM(playerid, COLOR_WHITE, "Vehicle Search:");
	gString[0] = EOS;
	for(new v = 0; v < 212; v++) {
		if(strfind(GetVehicleName(v+400), model, true) != -1 || v == strval(model)-400) {
			format(gString, sizeof(gString), "%s (ID %d)", GetVehicleName(v+400), v+400);
			SCM(playerid, 0x9CE6FFFF, gString);
			x++;
		}
	}
	if(x == 0) SCM(playerid, COLOR_GREY, "No results found.");
	SCM(playerid, COLOR_SERVER, "...................................................................");
	return true;
}

YCMD:payday(playerid, parmas[]) {
	if(!IsAdmin(playerid, 6))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	if(GetCoolDowns(playerid, 22))
		return CoolDowns(playerid, 22);
	
	SetCoolDowns(playerid, 22, 30);
	PayDay();
	return true;
}

YCMD:despawncars(playerid, params[], help) {
	if(!IsAdmin(playerid, 1)) 
		return SCM(playerid, COLOR_GREY, AdminOnly);

	foreach(new i : VehicleSpawned) {
		if(IsVehicleOccupied(i)) continue;
		DestroyVehicleEx(i);
	}
	Iter_Clear(VehicleSpawned);
	gString[0] = EOS;
	format(gString, sizeof(gString), COLOR_GMx"(/despawncars) {FFFFFF}Admin %s despawned all admin cars", GetName(playerid));
	SendAdminMessage(-1, gString, 1);
	return true;
}

YCMD:a(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	if(!PlayerInfo[playerid][pTog][3])
		return SCM(playerid, COLOR_GREY, "Ai admin chat-ul dezactivat.");

	new text[128];
	if(sscanf(params, "s[128]", text)) 
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/a [text]");

	format(gString, sizeof(gString), "(%d) admin %s: %s", PlayerInfo[playerid][pAdmin], GetName(playerid), text);
	foreach(new i : _Player<ADMIN>) {
		if(!PlayerInfo[i][pTog][3]) 
			continue;

		SCMEx(i, COLOR_ADMCHAT, gString);
	}
	return true;
}
YCMD:hc(playerid, params[], help) {
	if(!IsAdmin(playerid, 1) && !IsHelper(playerid, 1))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	if(!PlayerInfo[playerid][pTog][4])
		return SCM(playerid, COLOR_GREY, "Ai helper chat-ul dezactivat.");

	new text[128];
	if(sscanf(params, "s[128]", text)) 
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/hc [text]");

	format(gString, sizeof(gString), "(%d) %s %s: %s", IsHelper(playerid, 1) ? PlayerInfo[playerid][pHelper] : PlayerInfo[playerid][pAdmin], IsHelper(playerid, 1) ? ("helper") : ("admin"), GetName(playerid), text);
	foreach(new i : All(_Player<>)) {
		if((!PlayerInfo[i][pAdmin] && !PlayerInfo[i][pHelper]) || !PlayerInfo[i][pTog][4]) continue;
		SCMEx(i, COLOR_HELPERCHAT, gString);
	}
	return true;
}

cmd:throwguns(playerid, params[]) {
	ResetPlayerWeapons(playerid);
	SCM(playerid, -1, "Ai aruncat armele!");
	return true;
}

YCMD:hduty(playerid, params[], help) {
	if(!IsHelper(playerid, 1)) return SCM(playerid, COLOR_GREY, "You are not helper.");
	if(PlayerVar[playerid][HaveHelp] != -1) {
		SCM(PlayerVar[playerid][HaveHelp], COLOR_YELLOW, "Intrebarea ta a fost pusa pe lista de asteptare..");
		Iter_Add(Newbie, PlayerVar[playerid][HaveHelp]);
		PlayerVar[PlayerVar[playerid][HaveHelp]][MyHelp] = -1;
		PlayerVar[playerid][HaveHelp] = -1;
	}
	if(!Iter_Contains(HelpsDuty, playerid)) Iter_Add(HelpsDuty, playerid); 
	else Iter_Remove(HelpsDuty, playerid);
	return SCM(playerid, COLOR_YELLOW, Iter_Contains(HelpsDuty, playerid) ? ("De acum o sa primesti intrebari") : ("Nu o sa mai primesti intrebari"));
}

YCMD:helpers(playerid, params[], help) {
	gString[0] = EOS;
	SCM(playerid, COLOR_SERVER, "-------Helpers Online------------------------------");
	if(Iter_Count(_Player<HELPER>) > 0) {
		foreach(new i : _Player<HELPER>) {
			format(gString, 100, "%s (%d) - helper level %d", GetName(i), i, PlayerInfo[i][pHelper]);
			SCM(playerid, COLOR_WHITE, gString);
		}
		SCM(playerid, COLOR_SERVER, "--------------------------------------------------------------");
		format(gString, 100, "* Sunt %d helpers online, Daca ai o intrebare foloseste /n.", Iter_Count(_Player<HELPER>));
		SCM(playerid, COLOR_WHITE, gString);
	}
	else SCM(playerid, COLOR_WHITE, "* Nu este nici un helper online.");
	SCM(playerid, COLOR_SERVER, "--------------------------------------------------------------");
	return true;
}

YCMD:myn(playerid, params[], help) {
	if(!IsHelper(playerid, 1)) 
		return SCM(playerid, COLOR_GREY, "You are not helper.");

	if(!Iter_Contains(HelpsDuty, playerid))
		return SCM(playerid, COLOR_GREY, "You are not helper duty.");

	if(PlayerVar[playerid][HaveHelp] == -1)
		return SCM(playerid, COLOR_GREY, "You don't have a question");

	new x = PlayerVar[playerid][HaveHelp];
	gString[0] = EOS;
	format(gString, 150, "* %s (%d) intreaba: %s", GetName(x), x, PlayerVar[x][NewbieText]);
	SCM(playerid, COLOR_LGREEN, gString);
	return true;
}

YCMD:helps(playerid, params[]) {
	if(!IsHelper(playerid, 1)) 
		return SCM(playerid, COLOR_GREY, "You are not helper.");

	if(!Iter_Count(Newbie))
		return SCM(playerid, COLOR_LGREEN, "Nu sunt /n-uri.");

	SCM(playerid, -1, "Intrabarile playerilor:");
	gString[0] = EOS;
	foreach(new i : Newbie) {
		format(gString, 170, "* %s (%d) intreaba: %s", GetName(i), i, PlayerVar[i][NewbieText]);
		SCM(playerid, 0x4FB021FF, gString);
	}
	format(gString, 170, "* Sunt %d intrebari pe server.", Iter_Count(Newbie));
	SCM(playerid, COLOR_LGREEN, gString);
	return true;
}

YCMD:nre(playerid, params[], help) {
	if(!IsHelper(playerid, 1)) 
		return SCM(playerid, COLOR_GREY, "You are not helper.");

	if(!Iter_Contains(HelpsDuty, playerid))
		return SCM(playerid, COLOR_GREY, "You are not helper duty.");

	if(PlayerVar[playerid][HaveHelp] == -1)
		return SCM(playerid, COLOR_GREY, "You don't have a question");

	new text[128];
	if(sscanf(params, "s[128]", text))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/nre [text]");

	new x = PlayerVar[playerid][HaveHelp];
	gString[0] = EOS;
	foreach(new i : Player) {
		if(i != x) {
			format(gString, 175, "* Newbie %s: %s", GetName(x), PlayerVar[x][NewbieText]);
			SCM(i, COLOR_LGREEN, gString);	
		}
		format(gString, 175, "* Helper %s: %s", GetName(playerid), text);
		SCM(i, x == i ? COLOR_YELLOW : COLOR_LGREEN, gString);
	}
	Iter_Remove(Newbie, x);
	PlayerVar[PlayerVar[playerid][HaveHelp]][MyHelp] = -1;
	PlayerVar[playerid][HaveHelp] = -1;
	gQuery[0] = (EOS);
	mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `TotalReports` = `TotalReports` + '1', `TodayReports` = `TodayReports` + '1' WHERE `id`='%d'", PlayerInfo[playerid][pSQLID]);
	mysql_tquery(SQL, gQuery, "", "");
	PlayerInfo[playerid][pTR]++,PlayerInfo[playerid][pSTR]++;
	return true;
}

YCMD:nr(playerid, params[], help) {
	if(!IsHelper(playerid, 1)) 
		return SCM(playerid, COLOR_GREY, "You are not helper.");

	if(!Iter_Contains(HelpsDuty, playerid))
		return SCM(playerid, COLOR_GREY, "You are not helper duty.");

	if(PlayerVar[playerid][HaveHelp] == -1)
		return SCM(playerid, COLOR_GREY, "You don't have a question");

	new text[128];
	if(sscanf(params, "s[128]", text))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/nr [text]");

	new x = PlayerVar[playerid][HaveHelp];
	gString[0] = EOS;
	format(gString, 175, "(NR) Helper %s: %s", GetName(playerid), text);
	SCM(playerid, COLOR_LGREEN, gString);
	SCM(x, COLOR_YELLOW, gString);
	Iter_Remove(Newbie, x);
	PlayerVar[PlayerVar[playerid][HaveHelp]][MyHelp] = -1;
	PlayerVar[playerid][HaveHelp] = -1;
	gQuery[0] = (EOS);
	mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `TotalReports` = `TotalReports` + '1', `TodayReports` = `TodayReports` + '1' WHERE `id`='%d'", PlayerInfo[playerid][pSQLID]);
	mysql_tquery(SQL, gQuery, "", "");
	PlayerInfo[playerid][pTR]++,PlayerInfo[playerid][pSTR]++;
	return true;
}
alias:nd("ndelete");
YCMD:nd(playerid, params[], help) {
	if(!IsHelper(playerid, 1)) 
		return SCM(playerid, COLOR_GREY, "You are not helper.");

	if(!Iter_Contains(HelpsDuty, playerid))
		return SCM(playerid, COLOR_GREY, "You are not helper duty.");

	if(PlayerVar[playerid][HaveHelp] == -1)
		return SCM(playerid, COLOR_GREY, "You don't have a question");

	new text[128];
	if(sscanf(params, "s[128]", text))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/nd [text]");

	new x = PlayerVar[playerid][HaveHelp];
	gString[0] = EOS;
	format(gString, 175, "* Helper %s: %s", GetName(playerid), text);
	SCM(x, COLOR_YELLOW, gString);
	format(gString, 175, "/nd: Helper %s: %s", GetName(playerid), text);
	SendAdminHelperMessage(COLOR_ADMCMD, gString);
	Iter_Remove(Newbie, x);
	PlayerVar[x][MyHelp] = -1;
	PlayerVar[playerid][HaveHelp] = -1;
	gQuery[0] = (EOS);
	mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `TotalReports` = `TotalReports` + '1', `TodayReports` = `TodayReports` + '1' WHERE `id`='%d'", PlayerInfo[playerid][pSQLID]);
	mysql_tquery(SQL, gQuery, "", "");
	PlayerInfo[playerid][pTR]++,PlayerInfo[playerid][pSTR]++;
	return true;
}
alias:nskip("ns");
YCMD:nskip(playerid, params[], help) {
	if(!IsHelper(playerid, 1)) 
		return SCM(playerid, COLOR_GREY, "You are not helper.");

	if(!Iter_Contains(HelpsDuty, playerid))
		return SCM(playerid, COLOR_GREY, "You are not helper duty.");

	if(PlayerVar[playerid][HaveHelp] == -1)
		return SCM(playerid, COLOR_GREY, "You don't have a question");

	if(Iter_Count(_Player<HELPER>) == 1 && Iter_Contains(HelpsDuty, playerid))
		return SCM(playerid, COLOR_GREY, "Only you are a helper duty.");

	gString[0] = EOS;
	format(gString, 150, "/nskip: helper %s skipped over %s question.", GetName(playerid), GetName(PlayerVar[playerid][HaveHelp]));
	SendAdminHelperMessage(COLOR_ADMCMD, gString);
	Iter_Remove(Newbie, PlayerVar[playerid][HaveHelp]);
	Iter_Add(Newbie, PlayerVar[playerid][HaveHelp]);
	PlayerVar[PlayerVar[playerid][HaveHelp]][MyHelp] = -1;
	PlayerVar[playerid][HaveHelp] = -1;
	return true;
}

alias:rnewbie("nreport");
YCMD:rnewbie(playerid, params[], help) {
	if(!IsHelper(playerid, 1)) 
		return SCM(playerid, COLOR_GREY, "You are not helper.");

	if(!Iter_Contains(HelpsDuty, playerid))
		return SCM(playerid, COLOR_GREY, "You are not helper duty.");

	if(PlayerVar[playerid][HaveHelp] == -1)
		return SCM(playerid, COLOR_GREY, "You don't have a question");

	gString[0] = EOS;
	new id = PlayerVar[playerid][HaveHelp];
	format(gString, 150, "/rnewbie: helper %s sent %s's question to the admins", GetName(playerid), GetName(id));
	SendAdminHelperMessage(COLOR_ADMCMD, gString);
	SCM(id, COLOR_YELLOW, "Your question was sent to admins.");
	format(PlayerVar[id][RaportText], 64, PlayerVar[id][NewbieText]);
	PlayerVar[id][RaportType][0] = 4;
	Iter_Add(Reports[0], id);
	Iter_Remove(Newbie, id);
	PlayerVar[PlayerVar[playerid][HaveHelp]][MyHelp] = -1;
	PlayerVar[playerid][HaveHelp] = -1;
	return true;
}

YCMD:reports(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	SCM(playerid, COLOR_WHITE, "|____REPORTS____|");
	gString[0] = EOS;
	foreach(new i : Reports[0]) SCM(playerid, COLOR_LGREEN, PlayerVar[i][RaportText]);
	format(gString, 50, "* Sunt %d reporturi in acest moment.", Iter_Count(Reports[0]));
	SCM(playerid, COLOR_WHITE, gString);
	return true;
}

YCMD:cheaters(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	SCM(playerid, COLOR_WHITE, "|____CHEATERS____|");
	gString[0] = EOS;
	foreach(new i : Reports[1]) {
		format(gString, 70, "%s(%d) reported for cheaters.", GetName(i), i);
		SCM(playerid, COLOR_LGREEN, gString);
	}
	format(gString, 50, "* Sunt %d reporturi de cheateri in acest moment.", Iter_Count(Reports[1]));
	SCM(playerid, COLOR_WHITE, gString);
	return true;
}

alias:cr("closereport");
YCMD:cr(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new id, reason[64];
	if(sscanf(params, "us[50]", id, reason))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/cr [playerid/name] [reason]");

	if(!IsPlayerConnected(id))
		return SCM(playerid,COLOR_GREY, "Player not connected.");

	if(!Iter_Contains(Reports[0], id))
		return SCM(playerid, COLOR_GREY, "Acel player nu a raportat nimic.");

	gString[0] = EOS;
	format(gString, sizeof(gString), COLOR_GMx"(/closereport) {FFFFFF}Admin %s i-a inchis reportul lui %s(%d). reason: %s", GetName(playerid), GetName(id), id, reason);
	SendAdminMessage(-1, gString, 1);
	format(gString, sizeof(gString), "* Admin %s ti-a inchis reportul. Motiv: %s", GetName(playerid), reason);
	SCM(id, COLOR_YELLOW, gString);
	PlayerVar[id][RaportType][0] = 0;
	Iter_Remove(Reports[0], id);

	gQuery[0] = (EOS);
	mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `TotalReports` = `TotalReports` + '1', `TodayReports` = `TodayReports` + '1' WHERE `id`='%d'", PlayerInfo[playerid][pSQLID]);
	mysql_tquery(SQL, gQuery, "", "");
	PlayerInfo[playerid][pTR]++,PlayerInfo[playerid][pSTR]++;
	return true;
}

alias:dr("deletereport");
YCMD:dr(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new id;
	if(sscanf(params, "u", id))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/dr [playerid/name]");

	if(!IsPlayerConnected(id))
		return SCM(playerid,COLOR_GREY, "Player not connected.");

	if(!Iter_Contains(Reports[0], id))
		return SCM(playerid, COLOR_GREY, "Acel player nu a raportat nimic.");

	gString[0] = EOS;
	format(gString, sizeof(gString), COLOR_GMx"(/deletereport) {FFFFFF}Admin %s i-a sters reportul lui %s(%d)", GetName(playerid), GetName(id), id);
	SendAdminMessage(-1, gString, 1);
	format(gString, sizeof(gString), "* Admin %s ti-a sters reportul", GetName(playerid));
	SCM(id, COLOR_YELLOW, gString);
	PlayerVar[id][RaportType][0] = 0;
	Iter_Remove(Reports[0], id);

	gQuery[0] = (EOS);
	mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `TotalReports` = `TotalReports` + '1', `TodayReports` = `TodayReports` + '1' WHERE `id`='%d'", PlayerInfo[playerid][pSQLID]);
	mysql_tquery(SQL, gQuery, "", "");
	PlayerInfo[playerid][pTR]++,PlayerInfo[playerid][pSTR]++;
	return true;
}


alias:auninvite("fpk");
YCMD:auninvite(playerid, params[]) {
	if(!IsAdmin(playerid, 5))
		return true;

	new id, fp;
	if(sscanf(params, "us[50]i", id, params, fp))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/aunvinite [playerid/name] [reason] [FP]");

	if(!IsPlayerConnected(id))
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(!IsPlayerLogged(id))
		return SCM(playerid, COLOR_GREY, "Player not logged.");

	if(!PlayerInfo[id][pMember])
		return SCM(playerid, COLOR_GREY, "Player not member.");

	gString[0] = EOS;
	format(gString, sizeof gString, "was uninvited by %s from %s (rank %d) after %d days, with %d FP. Reason: %s", GetName(playerid), FactionInfo_[PlayerInfo[id][pMember]-1][fName], PlayerInfo[id][pRank], (gettime()-PlayerInfo[id][pFDays])/86400, fp, params);
	new year, mounth, day, hour, minute, second; getdate(year, mounth, day), gettime(hour, minute, second);
	mysql_format(SQL, gQuery, sizeof gQuery, "INSERT INTO `faction_logs` (`text`, `Userid`, `ByUserid`, `time`) VALUES ('%e', '%i', '%i', '%d-%d-%d %d:%d')", gString, PlayerInfo[id][pSQLID], PlayerInfo[playerid][pSQLID], year, mounth, day, hour, minute);
	mysql_tquery(SQL, gQuery);

	UninvitePlayerFaction(id, fp);
	format(gString, sizeof gString, "/auninvite: %s[admin: %d] l-a scos pe %s[user: %d] din factiune. FP: %d. Motiv: %s", GetName(playerid), PlayerInfo[playerid][pSQLID], GetName(id), PlayerInfo[id][pSQLID], fp, params);
	SendAdminMessage(COLOR_ADMCMD, gString, 5);
	format(gString, 100, "Ai fost scos din factiune de catre admin %s. FP: %d. motiv: %s", GetName(playerid), fp, params);
	SCM(id, COLOR_YELLOW, gString);
	ResetPlayerWeapons(id);
	return true;
}

alias:auninviteoff("fpkoff");
YCMD:auninviteoff(playerid, params[]) {
	if(!IsAdmin(playerid, 5))
		return true;

	new id[MAX_PLAYER_NAME], fp;
	if(sscanf(params, "s[24]s[50]i", id, params, fp))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/auninviteoff [username SQL] [reason] [FP]");

	mysql_format(SQL, gQuery, sizeof gQuery, "SELECT * FROM `users` WHERE `name` = '%s' LIMIT 1", id);
	mysql_tquery(SQL, gQuery, "SQL_cache_fpk", #issi, playerid, id, params, fp);
	return true;
}

redist::SQL_cache_fpk(playerid, const username[], const reason[], fp) {
	if(!cache_num_rows()) return SCM(playerid, COLOR_LGREEN, "Eroare: Acest cont nu exista in baza de date!");

	new sqlid, status, member, rank, days;
	cache_get_value_name_int(0, "id", sqlid);
	cache_get_value_name_int(0, "Status", status);
	cache_get_value_name_int(0, "Member", member);
	cache_get_value_name_int(0, "Rank", rank);
	cache_get_value_name_int(0, "Days", days);

	if(status !=-1) return SCM(playerid, COLOR_GREY, "Acest cont este deja conectat pe server, foloseste:"), SCMf(playerid, -1, "/fpk %d %s %d. !", status, reason, fp);

	gString[0] = EOS;
	format(gString, sizeof gString, "was uninvited by %s from %s (rank %d) after %d days, with %d FP. Reason: %s", username, FactionInfo_[member-1][fName], rank, (gettime()-days)/86400, fp, reason);
	new year, mounth, day, hour, minute, second; getdate(year, mounth, day), gettime(hour, minute, second);
	mysql_format(SQL, gQuery, sizeof gQuery, "INSERT INTO `faction_logs` (`text`, `Userid`, `ByUserid`, `time`) VALUES ('%e', '%i', '%i', '%d-%d-%d %d:%d')", gString, sqlid, PlayerInfo[playerid][pSQLID], year, mounth, day, hour, minute);
	mysql_tquery(SQL, gQuery);

	format(gString, sizeof gString, "/auninviteoff: %s[admin: %d] l-a scos pe %s[user: %d] din factiune. FP: %d. Motiv: %s", GetName(playerid), PlayerInfo[playerid][pSQLID], username, sqlid, fp, reason);
	SendAdminMessage(COLOR_ADMCMD, gString, 5);
	format(gQuery, 100, "Ai fost scos din factiune de catre admin %s. FP: %d. motiv: %s", GetName(playerid), fp, reason);
	SendPlayerEmail(username, gQuery);

	FactionInfo_[member - 1][fMembers] --;
	if(rank == 7) format(FactionInfo_[member - 1][fLeader], MAX_PLAYER_NAME, "None");
	_query(256, "UPDATE `users` SET `Spawnchange` = '0', `Member` = '0', `Rank` = '0', `Punish` = '%i' WHERE `id` = '%i'", fp, sqlid);
	return true;
}

YCMD:staff(playerid, params[], help) {
	if(!IsAdmin(playerid, 5))
		return SCM(playerid,COLOR_GREY, AdminOnly);

	ShowPlayerDialog(playerid, DIALOG_STAFF, DIALOG_STYLE_LIST, "Staff:", "Admins\nHelpers", "Select", "Close");
	return true;
}

YCMD:freeze(playerid, params[], help) {
    if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_WHITE, AdminOnly);
	
	new id;
	if(sscanf(params, "u",id)) 
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/freeze [playerid/name]");

	if(!IsPlayerConnected(id)) 
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(PlayerInfo[playerid][pAdmin] < PlayerInfo[id][pAdmin])
		return SCM(playerid, COLOR_GREY, "Nu poti sa ii dai freeze pe acel player.");

	TogglePlayerControllable(id, false);
	gString[0] = EOS;
	format(gString, 50, "You have been frozen by %s.", GetName(playerid));
	SCM(id, -1, gString);
	format(gString, 40, "You have frozen %s.", GetName(id));
	SCM(playerid, -1, gString);		
	return true;
}

YCMD:unfreeze(playerid, params[], help) {
 	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_WHITE, AdminOnly);

	new id;
	if(sscanf(params, "u", id)) 
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/unfreeze [playerid/name]");

	if(!IsPlayerConnected(id)) 
		return SCM(playerid, COLOR_GREY, "Player not connected.");
	
	TogglePlayerControllable(id, true);
	gString[0] = EOS;
	format(gString, 50, "You have been unfrozen by %s.", GetName(playerid));
	SCM(id, -1, gString);
	format(gString, 40, "You have unfrozen %s.", GetName(id));
	SCM(playerid, -1, gString);	
	return true;
}

cmd:re(playerid, params[]) {	
	if !IsAdmin(playerid, 1) && PlayerInfo[playerid][pHelper] < 1 *then
		return SCM(playerid, COLOR_LGREEN, "Nu ai acces la aceasta comanda!");

	extract params -> new player:id, string:message[90]; else 
		return SCM(playerid, COLOR_GREY, "Sintaxa: {FFFFFF}/re <playerid/name> <message>");

	if(playerid == id) return SCM(playerid, -1, "Nu poti sa iti raspunzi singur!");

	if !IsPlayerConnected(id) *then
		return SCM(playerid, COLOR_GREY, "Player not connected!");

	if !IsPlayerLogged(id) *then
		return SCM(playerid, COLOR_GREY, "Player not logged!");

	SCMf(id, COLOR_YELLOW, ">> %s: %s <<", GetName(playerid), message);
	format(gString, 128, "(/re)%s->%s: %s", GetName(playerid), GetName(id), message);
	foreach(new i : All(_Player<>)) if(PlayerInfo[i][pAdmin]||PlayerInfo[i][pHelper]) SCM(i,COLOR_YELLOW,gString);
	return true;
}

YCMD:spec(playerid, params[], help) {
	if(!IsAdmin(playerid, 1) && !IsHelper(playerid, 1))
		return true;

	new id;
	if(sscanf(params, "u", id))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/spec [playerid/name]");

	if(!IsPlayerConnected(id))
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(playerid == id)
		return SCM(playerid, COLOR_GREY, "You can't give yourself spec.");

	if(!IsPlayerLogged(id))
		return SCM(playerid, COLOR_GREY, "Player not logged.");

	if(PlayerVar[id][MySpec] != -1)
		return SCM(playerid, COLOR_GREY, "Acel player este occupat");


	if(PlayerVar[playerid][MySpec] != -1) {
		if(Iter_Contains(Spectacting[PlayerVar[playerid][MySpec]], playerid)) Iter_Remove(Spectacting[PlayerVar[playerid][MySpec]], playerid);
	} else {
		PlayerVar[playerid][UnSpec][0] = GetPlayerInterior(playerid);
		PlayerVar[playerid][UnSpec][1] = GetPlayerVirtualWorld(playerid);
		GetPlayerPos(playerid, PlayerVar[playerid][LastSpec][0], PlayerVar[playerid][LastSpec][1], PlayerVar[playerid][LastSpec][2]);
		GetPlayerFacingAngle(playerid, PlayerVar[playerid][LastSpec][3]);
	}
	Iter_Add(Spectacting[id], playerid);
	PlayerVar[playerid][MySpec] = id;

	new Float: health;
	GetPlayerHealth(id, health);
	gString[0] = EOS;
	if(Iter_Contains(Reports[0], id)) {
		switch(PlayerVar[id][RaportType]) {
			case 1: format(gString, 150, "%s %s is now spectating %s - Reported for DM.", IsAdmin(playerid, 1) ? ("Admin") : ("Helper"), GetName(playerid), GetName(id));
			case 2: format(gString, 150, "%s %s is now spectating %s - reported for being Stuck.", IsAdmin(playerid, 1) ? ("Admin") : ("Helper"), GetName(playerid), GetName(id));
			case 3: format(gString, 150, "%s %s is now spectating %s - reported for Business.", IsAdmin(playerid, 1) ? ("Admin") : ("Helper"), GetName(playerid), GetName(id));
			case 4: format(gString, 150, "%s %s is now spectating %s - for reported.", IsAdmin(playerid, 1) ? ("Admin") : ("Helper"), GetName(playerid), GetName(id));
		}	
		Iter_Remove(Reports[0], id);
		gQuery[0] = (EOS);
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `TotalReports` = `TotalReports` + '1', `TodayReports` = `TodayReports` + '1' WHERE `id`='%d'", PlayerInfo[playerid][pSQLID]);
		mysql_tquery(SQL, gQuery, "", "");
		PlayerInfo[playerid][pTR]++,PlayerInfo[playerid][pSTR]++;
	}
	else if(Iter_Contains(Reports[1], id)) {	
		gQuery[0] = (EOS);
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `TotalReports` = `TotalReports` + '1', `TodayReports` = `TodayReports` + '1' WHERE `id`='%d'", PlayerInfo[playerid][pSQLID]);
		mysql_tquery(SQL, gQuery, "", "");
		format(gString, 150, "%s %s is now spectating %s - reported for cheater.", IsAdmin(playerid, 1) ? ("Admin") : ("Helper"), GetName(playerid), GetName(id)); 
		Iter_Remove(Reports[1], id);
		PlayerInfo[playerid][pTR]++,PlayerInfo[playerid][pSTR]++;
	}
	else format(gString, 150, "%s %s is now spectating %s.", IsAdmin(playerid, 1) ? ("Admin") : ("Helper"), GetName(playerid), GetName(id));
	SendAdminMessage(COLOR_YELLOW, gString, PlayerInfo[playerid][pAdmin]);

	format(gString, sizeof(gString), "[SPEC] (%d) %s | Level: %d | Health: %.2f | AFK Time: %d | Seconds: %d | Duty: %s | Ping: %d", id, GetName(id), PlayerInfo[id][pLevel], health, PlayerVar[id][AFKSeconds], PlayerInfo[id][pConnected], PlayerVar[id][Duty] ? ("Yes") : ("No"), GetPlayerPing(id));
	SCM(playerid, 0xFFADADFF, gString);

	new Player_Weapons[13], Player_Ammos[13], i, guns;
	gString = "Weapons:";	
	for(i = 1; i <= 12; i++) {
		GetPlayerWeaponData(id,i,Player_Weapons[i],Player_Ammos[i]);
		if(Player_Weapons[i] != 0) format(gString,255,"%s %s(%d)", gString, GetWeapon(Player_Weapons[i]),Player_Ammos[i]), guns ++;
	}
	if(guns > 0) SCM(playerid, -1, gString);

	TogglePlayerSpectating(playerid, true);
	SetPlayerInterior(playerid, GetPlayerInterior(id));
	SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(id));

	if(IsPlayerInAnyVehicle(id)) PlayerSpectateVehicle(playerid, GetPlayerVehicleID(id));
	else PlayerSpectatePlayer(playerid, id);
	
	PlayerTextDrawSetString(playerid, SpectateTD, "Loading...");
	PlayerTextDrawShow(playerid, SpectateTD);	
	return true;
}

YCMD:gotoin(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return true;

	SetPlayerPos(playerid, -2637.0000,1403.0000,906.4609);
	SetPlayerInterior(playerid, 3);
	SetPlayerVirtualWorld(playerid, 6969);
	PlayerVar[playerid][IsFaction] = -1;
	PlayerVar[playerid][IsBizz] = 0;
	PlayerVar[playerid][IsHouses] = 0;
	SCM(playerid, COLOR_LGREEN, "You have teleported admin HQ.");
	return true;
}

YCMD:sstats(playerid, params[]) {
	if(!IsAdmin(playerid, 7))
		return true;

	SCM(playerid, COLOR_GM, "----------------------- SERVER -----------------------");
	SCM(playerid, COLOR_WHITE, "System variables [current]:");
	gString[0] = EOS;
	format(gString, 135, "Tick: %d | MYSQL unprocessed Queries: %d | [(dynamic) Objects: %d | Pickups: %d | Labels: %d | areas: %d] | %d players in miliseonds.", GetServerTickRate(), mysql_unprocessed_queries(), CountDynamicObjects(), CountDynamicPickups(), CountDynamic3DTextLabels(), CountDynamicAreas(), Iter_Count(s_Players));
	SCM(playerid, COLOR_WHITE, gString);
	format(gString, 135, "Houses: %d | Businesses: %d | Weather: 10 | /n on: %d", SqlHouses, SqlBussines, Iter_Count(Newbie));
	SCM(playerid, COLOR_WHITE, gString);	
	new time = gettime() - serverstarted;
	format(gString, 135, "On: %d | in login queue: %d | Server Started ({D7FFB3}%d days. %d hours. %d minutes and %d seconds left{FFFFFF}).", Iter_Count(Player), TotalLoginQueue, time/86400, (time/3600) % 24, ((time/60) % 60), time % 60); 
	SCM(playerid, COLOR_WHITE, gString);	
	SCM(playerid, COLOR_GM, "------------------------------------------------------");	
	return true;
}

///ofjnunguerigerugergue admin = 69;
//ergherhijerhirhnrthrt sterge db

YCMD:netstatus(playerid, params[]) {
	if(!IsAdmin(playerid, 7))
		return true;

	new string[400 + 1];
	GetNetworkStats(string, sizeof(string));
	ShowPlayerDialog(playerid, DIALOG_ONLINE, DIALOG_STYLE_MSGBOX, "Net Status", string, "Close", "");
	return true;
}

YCMD:crateforall(playerid, params[], help) {
	if(!IsAdmin(playerid, 6))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	if(sscanf(params, "s[20]", params))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/crateforall [crate]"), SCM(playerid, COLOR_GREY, "Crate: {FFFFFF}basic, redpoints, vehicle"), 1;

	new x = -1;
	for(new i=0,j=sizeof(CrateInfo);i<j;i++) if(!strcmp(CrateInfo[i][C_NAME], params, true)) {
		x = i;
		break;
	}
	if(x==-1) return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/crateforall [crate]"), SCM(playerid, COLOR_GREY, "Crate: {FFFFFF}small, medium, epic"), 1;

	gString[0] = EOS;
	format(gString, 125, "Administratorul %s ti-a dat un %s.", GetName(playerid), CrateInfo[x][C_NAME]);
	foreach(new i : Player) {
		if(!IsPlayerLogged(i))
			continue;

		PlayerInfo[i][pCrate][x]++;
		save_crates(i);
		SCM(i, COLOR_YELLOW, gString);
	}
	return true;
}

YCMD:ip(playerid, params[], help) {
	if(!IsAdmin(playerid, 5))
		return true;

	if(sscanf(params, "u", params[0]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/ip [playerid/name]");

	if(!IsPlayerConnected(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(!IsPlayerLogged(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not logged.");

	new playerip[16];
	GetPlayerIp(params[0], playerip, sizeof playerip);

	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof gQuery, "SELECT * FROM `users` WHERE `ip` = '%s'", playerip);
	mysql_tquery(SQL, gQuery, "SQL_cacheip", "ii", playerid, params[0]);
	return true;
}

function SQL_cacheip(playerid, id) {
	if(!cache_num_rows())
		return SCM(playerid, COLOR_GREY, "result none.");

	gString[0] = EOS;
	format(gString, 100, "----- Last loggin for IP %s's --------------", GetName(id));
	SCM(playerid, COLOR_WHITE, gString);
	new i=-1, name[24], pid, sqlid, laston[30];
	while(++i<cache_num_rows()) {
		cache_get_value_name(i, "name", name);
		cache_get_value_name_int(i, "id", sqlid);
		cache_get_value_name_int(i, "Status", pid);
		cache_get_value_name(i, "LastOn", laston);

		if(pid != -1) format(laston, 10, "id: %d", pid);

		format(gString, 100, "%s (SQLID: %d) - %s%s", name, sqlid, pid == -1 ? ("last loggin ") : (""), laston);
		SCM(playerid, COLOR_LGREEN, gString);
	}
	SCM(playerid, COLOR_WHITE, "-------------------------------------------------------");
	format(gString, 100, "Au fost gasite %d conturi.", cache_num_rows());
	SCM(playerid, COLOR_WHITE, gString);
	SCM(playerid, COLOR_WHITE, "-------------------------------------------------------");
	return true;
}

YCMD:specoff(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	if(PlayerVar[playerid][MySpec] == -1)
		return SCM(playerid, COLOR_GREY, "You're not a spec.");

	Iter_Remove(Spectacting[PlayerVar[playerid][MySpec]], playerid);
	PlayerVar[playerid][MySpec] = -1;
	PlayerVar[playerid][preparespawn] = true;
	TogglePlayerSpectating(playerid, false);
	TogglePlayerControllable(playerid, true);
	PlayerTextDrawHide(playerid, SpectateTD);
	SCM(playerid, COLOR_WHITE, "Nu mai esti spectator.");
	return true;
}

YCMD:pm(playerid, params[], help) {
	if(!IsAdmin(playerid, 1) && !IsHelper(playerid, 1))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	new id;
	if(sscanf(params, "us[90]", id, params))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/pm [playerid/name] [text]");

	if(!IsPlayerConnected(id))
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(!IsPlayerLogged(id))
		return SCM(playerid, COLOR_GREY, "Player not logged.");

	if(player_selected[id] == 12)
		return SCM(playerid, COLOR_GREY, "Acel player este momentant ocupat!");

	ClearString();
	format(gString, 160, "PM from %s: %s",GetName(playerid), params);
	SCM(id, COLOR_YELLOW, gString);

	format(gString, 160, "PM send to %s: %s",GetName(id), params);
	SCM(playerid, 0xC8E0DFFF, gString);
	return true;
}

YCMD:placegotoevent(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	gString[0] = EOS;
	EventInfo[evStatus] = EventInfo[evStatus] ? false : true;
	switch(EventInfo[evStatus]) {
		case false: {
			format(gString, 100, COLOR_GMx"(EVENT) {FFFFFF}%s stopped the event.", GetName(playerid));
			SCMTA(-1, gString);
			DestroyPickup(EventInfo[evPickup]);
			Delete3DTextLabel(EventInfo[evLabel]);
		}
		case true: {
			format(gString, 100, COLOR_GMx"(EVENT) {FFFFFF}Admin %s organizes an event. To get to the event use /gotoevent.", GetName(playerid));
			SCMTA(-1, gString);
			EventInfo[evVirtualWorld] = GetPlayerVirtualWorld(playerid);
			EventInfo[evInterior] = GetPlayerInterior(playerid);
			GetPlayerPos(playerid, EventInfo[evPos][0], EventInfo[evPos][1], EventInfo[evPos][2]);
			EventInfo[evPickup] = CreatePickup(1314, 24, EventInfo[evPos][0], EventInfo[evPos][1], EventInfo[evPos][2]);
			EventInfo[evLabel] = Create3DTextLabel("Place goto event.", 0xFF0000FF, EventInfo[evPos][0], EventInfo[evPos][1], EventInfo[evPos][2], 35.0);
		}
	}
	return true;
}

YCMD:fv(playerid, params[], help) {
	if(!IsAdmin(playerid, 1)) 
		return SCM(playerid, COLOR_LGREEN, "You are not admin.");
	
	if(!IsPlayerInAnyVehicle(playerid)) 
		return true;
	
	new vehid = GetPlayerVehicleID(playerid);
	Fuel[vehid] = 100;
	RepairVehicle(vehid);
	SetVehicleHealth(vehid, 999);
	return true;
}
alias:fv("fixveh");

YCMD:removead(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new id, reason[30];
	if(sscanf(params, "us[30]", id, reason))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/removead [playerid/name] [reason]");

	if(!IsPlayerConnected(id)) return true;

	if(PlayerVar[id][AdTime] == -1)
		return SCM(playerid, COLOR_GREY, "Acel player nu a pus un anunt.");

	if(PlayerInfo[playerid][pAdmin] < PlayerInfo[id][pAdmin])
		return SCM(playerid, COLOR_GREY, "Nu poti sterge adul acelui player.");

	PlayerVar[id][AdTime] = -1;
	TotalAds --;

	gString[0] = EOS;
	format(gString, sizeof(gString), COLOR_GMx"(/removead) Admin %s has deleted the AD for %s. Motiv: %s", GetName(playerid), GetName(id), reason);
	SendAdminMessage(COLOR_PINK, gString, 1);
	format(gString, sizeof(gString), "Admin %s ti-a sters ad-ul. Motiv: %s", GetName(playerid), reason);
	SCM(id, COLOR_WHITE, gString);
	return true;
}

YCMD:rac(playerid, params[], help) {
	if(!IsAdmin(playerid, 3)) 
		return SCM(playerid, COLOR_WHITE, AdminOnly);

    format(gString, 100, COLOR_GMx"(/rac) {FFFFFF}Admin %s a respawnat toate vehiculele nefolosite!", GetName(playerid));
	SendAdminMessage(COLOR_ADMCMD, gString, 3);
	SCMTA(COLOR_GM, ">> {FFFFFF}Toate masinile de pe server vor fi respawnate in 15 secunde!");
	SetTimerEx(#respawn_car, 15000, false, #i, playerid);
	return true;
}

redist::respawn_car(playerid) {
	foreach(new vehid : VarVehicle) {
		if(IsVehicleOccupied(vehid)) continue;
		if(Iter_Contains(VehicleSpawned, vehid)) {
			DestroyVehicleExx(vehid);
			Iter_Remove(VehicleSpawned, vehid);
			Iter_SafeRemove(VarVehicle, vehid, vehid);
			continue;
		}
		SetVehicleToRespawn(vehid);
	}
	return true;
}

YCMD:bigears(playerid, params[], help) {
	if(!IsAdmin(playerid, 3))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	switch(Iter_Contains(Bigears, playerid)) {
		case false: Iter_Add(Bigears, playerid), SCM(playerid, COLOR_WHITE, "Ai activat bigears, o sa vezi tot chatul.");
		case true: Iter_Remove(Bigears, playerid), SCM(playerid, COLOR_WHITE, "Ai dezactivat bigears, nu o sa mai vezi chatul.");
	}
	return true;
}

YCMD:unjail(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	if(sscanf(params, "u", params[0]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/unjail [playerid/name]");

	if(!IsPlayerConnected(params[0]) || !IsPlayerLogged(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(PlayerInfo[params[0]][pJail] == 0)
		return SCM(playerid, COLOR_GREY, "Acel player nu este in jail.");

	PlayerInfo[params[0]][pJail] = 0;
	UpdateVar(params[0], "Jail", 0);
	PlayerTextDrawHide(params[0], WantedPTD);

	SpawnPlayer(params[0]);

	ClearString();
	format(gString, sizeof gString, COLOR_GMx"(/unjail) {FFFFFF}Admin %s took %s out of prison.", GetName(playerid), GetName(params[0]));
	SendAdminMessage(-1, gString, 1);
	return true;
}

YCMD:server(playerid, params[], help) {
	if(!IsAdmin(playerid, 6)) 
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	ShowPlayerDialog(playerid, DIALOG_SERVER, DIALOG_STYLE_LIST, "Server Menu:", "Unban all players\nRestart on payday\nServer on mentenance\nSet server password\nChange server nickname\nReseteaza questurile", "Ok", "Exit");
	return true;
}

YCMD:acoveroff(playerid, params[], help) {
	if(!IsAdmin(playerid, 5))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	if(!PlayerVar[playerid][Acover])
		return SCM(playerid, COLOR_GREY, "Nu esti acover.");

	PlayerVar[playerid][Acover] = false;
	SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
	SetPlayerLevelEx(playerid);
	SetPlayerName(playerid, PlayerInfo[playerid][pName]);
	SetTeamColor(playerid);

	SCM(playerid, COLOR_GREY, "Nu mai esti acover.");
	return true;
}

YCMD:acover(playerid, params[], help) {
	if(!IsAdmin(playerid, 5))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	if(sscanf(params, "s[24]", params))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/acover [name]");

	if(IsDeveloperOff(params))
		return SCM(playerid, COLOR_GREY, "Nu poti pune acest nume.");

	PlayerVar[playerid][Acover] = true;
	SetPlayerName(playerid, params);

	new skin = random(300);

	PlayerVar[playerid][AcoverLevel] = RandomEx(1,3);

	SetPlayerLevelEx(playerid);
	SetPlayerSkin(playerid, skin);
	SetPlayerColor(playerid, COLOR_WHITE);

	ClearString();
	format(gString, 100, "Acover: %s | level: %d | skin: %d", params, PlayerVar[playerid][AcoverLevel], skin);
	SCM(playerid, COLOR_GREY, gString);
	return true;
}

cmd:blockcommand(playerid, const params[]) {
	if !IsAdmin(playerid, 7) *then
		return true;

	extract params -> new string:command[32]; else
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/blockcommand <name>");

	if strfind(command, "/", true) != -1 *then
		return SCM(playerid, COLOR_GREY, "Pune numele comenzi fara '/'!");

	if !strcmp(command, "blockcommand", true) || !strcmp(command, "unblockcommand", true) *then
		return SCM(playerid, COLOR_GREY, "Nu poti bloca aceste comenzi!");

	if !PC_CommandExists(command) *then
		return SCM(playerid, COLOR_GREY, "Aceasta comanda nu exista!");

	mysql_format(SQL, gQuery, sizeof gQuery, "SELECT * FROM `commands` WHERE `name` = '%s' LIMIT 1", command);
	mysql_tquery(SQL, gQuery, "SQL_block_command", #is, playerid, command);
	return true;
}

function SQL_block_command(playerid, command[]) {
	if cache_num_rows() *then
		return SCM(playerid, COLOR_GREY, "Acesta comanda este deja blocta!");

	PC_SetFlags(command, true);
	mysql_format(SQL, gQuery, sizeof gQuery, "INSERT INTO `commands` (`name`) VALUES ('%s')", command);
	mysql_tquery(SQL, gQuery);
	format(gString, 128, COLOR_GMx"(/blockcommand) {FFFFFF}Admin %s a blocat comanda /%s.", GetName(playerid), command);
	SendAdminMessage(COLOR_WHITE, gString, 1);
	return true;
}

cmd:unblockcommand(playerid, const params[]) {
	if !IsAdmin(playerid, 7) *then
		return true;

	extract params -> new string:command[32]; else
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/unblockcommand <name>");

	mysql_format(SQL, gQuery, sizeof gQuery, "SELECT * FROM `commands` WHERE `name` = '%s' LIMIT 1", command);
	mysql_tquery(SQL, gQuery, "SQL_unblock_command", #is, playerid, command);
	return true;
}

function SQL_unblock_command(playerid, command[]) {
	if !cache_num_rows() *then
		return SCM(playerid, COLOR_GREY, "Acesta comanda nu este blocata!");

	PC_SetFlags(command, false);
	mysql_format(SQL, gQuery, sizeof gQuery, "DELETE FROM `commands` WHERE `name` = '%s'", command);
	mysql_tquery(SQL, gQuery);
	format(gString, 128, COLOR_GMx"(/unblockcommand) {FFFFFF}Admin %s a deblocat comanda /%s.", GetName(playerid), command);
	SendAdminMessage(COLOR_WHITE, gString, 1);
	return true;
}

YCMD:ah(playerid, params[], help) {
	if(IsAdmin(playerid, 1)) {
		SCM(playerid, -1, "Admin 1: /removead, /fixveh(fv), /a, /despawncars, /vehname, /spawncar, /re(spawn), /getcar, /fly.");
		SCM(playerid, -1, "Admin 1: /down, /up, /slap, /alock, /flip, /gotom, /goto, /gethere, /gotolv, /gotols, /gotosf, /gotospawn, /cc, /placegotoevent.");
		SCM(playerid, -1, "Admin 1: /o, /setint, /setvw, /aduty, /kick, /ban, /warn, /freeze, /unfreeze, /cc.");
		SCM(playerid, -1, "Admin 1: /spec, /specoff, /closestcar, /gotojob, /dr, /gotoin.");
	}
	if(IsAdmin(playerid, 2)) SCM(playerid, -1, "Admin 2: /givegun, /fspec, /gotocar, /gotohq, /nos, /area, /gotojob.");
	if(IsAdmin(playerid, 3)) SCM(playerid, -1, "Admin 3: /suspend, /rac, /cmc, /bigears, /skick, /va.");
	if(IsAdmin(playerid, 4)) SCM(playerid, -1, "Admin 4: /makeleader, /aclear, /sethp, /unban, /unwarn, /tod.");
	if(IsAdmin(playerid, 5)) SCM(playerid, -1, "Admin 5: /gotoxyz, /makehelper, /staff, /auninvite.");
	if(IsAdmin(playerid, 6)) SCM(playerid, -1, "Admin 6: /gotocp, /givemoney, /givepp, /speed, /systems, /set, /server, /setskin, /giveskin, /agl.");
	if(IsAdmin(playerid, 7)) SCM(playerid, -1, "Admin 7: /makeadmin, /gmx, /createvehicle, /vpark, /vdelete, /vowner, /editvehicle, /vinfo.");
	return true;
}

YCMD:vre(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	if(!IsPlayerInAnyVehicle(playerid) && sscanf(params, "i", params[0]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/vre [vehicleid]");

	params[0] = IsPlayerInAnyVehicle(playerid) ? GetPlayerVehicleID(playerid) : params[0];
	if(!IsValidVehicle(params[0]))
		return SCM(playerid, COLOR_GREY, "Invalid vehicleid.");

	gString[0] = EOS;
	format(gString, 150, COLOR_GMx"(/vre) {FFFFFF}Admin %s a %s vehiculul %s (ID: %d).", GetName(playerid), Iter_Contains(VehicleSpawned, params[0]) ? ("despawnat") : ("respawnat"), GetVehicleName(GetVehicleModel(params[0])), params[0]);
	SendAdminMessage(COLOR_WHITE, gString, 1);

	if(!Iter_Contains(VehicleSpawned, params[0])) SetVehicleToRespawn(params[0]);
	else {
		DestroyVehicleEx(params[0]);
		Iter_Remove(VehicleSpawned, params[0]);
	}
	return true;
}

YCMD:mute(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	new reason[50];
	if(sscanf(params, "uis[50]", params[0], params[1], reason))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/mute [playerid/name] [minute] [reason]");

	if(!IsPlayerConnected(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(params[1] <= 0 || params[1] > 999)
		return SCM(playerid, COLOR_GREY, "Invalid minute");

	PlayerInfo[params[0]][pMute] = params[1] * 60;

	ClearString();
	format(gString, 120, COLOR_GMx"(/mute) {FFFFFF}Admin %s has muted %d minute by %s. Reason: %s", GetName(params[0]), params[1], GetName(playerid), reason);
	SendAdminMessage(-1, gString, 1);
	format(gString, 120, "Administartor %s ti-a dat mute pentru %d minute. Motiv: %s", GetName(playerid), params[1], reason);
	SCM(params[0], COLOR_YELLOW, gString);
	return true;
}

YCMD:aclear(playerid, params[], help) {
	if(!IsAdmin(playerid, 4))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	if(sscanf(params, "u", params[0]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/aclear [playerid/name]");

	if(!IsPlayerConnected(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not connected");

	if(!IsPlayerLogged(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not logged");

	SetPlayerWanted(params[0], 0);

	ClearString();
	format(gString, 75, "(/aclear) {FFFFFF}Admin %s has remove all wanted by %s.", GetName(params[0]), GetName(playerid));
	SendAdminMessage(-1, gString, 1);
	format(gString, 75, "Admin %s ti-a sters wantedul.", GetName(playerid));
	SCM(params[0], COLOR_YELLOW, gString);
	return true;
}



YCMD:fspec(playerid, params[], help) {
	if(!IsAdmin(playerid, 2))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	if(sscanf(params, "i", params[0]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/fspec [factionid]");

	if(params[0] > MAX_FACTIONS)
		return SCM(playerid, COLOR_GREY, "Invalid facitonid.");

	if(PlayerInfo[playerid][pMember] == params[0] && PlayerInfo[playerid][pMember] != 0)
		return SCM(playerid, COLOR_GREY, "Faci parte deja din aceasta factiune.");

	if(PlayerVar[playerid][fSpec] != 0) {
		if(Iter_Contains(Factions<PlayerVar[playerid][fSpec]>, playerid)) Iter_Remove(Factions<PlayerVar[playerid][fSpec]>, playerid);
		if(params[0] == 0) SCM(playerid, COLOR_WHITE, "Nu mai esti spec pe o factiune.");
	}
	PlayerVar[playerid][fSpec] = params[0];
	if(params[0] != 0) Iter_Add(Factions<params[0]>, playerid);
	if(params[0] == 0) return true;
	ClearString();
	format(gString, 100, "/fspec: %s has spec a faction %s (%d).", GetName(playerid), FactionInfo_[params[0] - 1][fName], params[0]);
	SendAdminMessage(COLOR_ADMCMD, gString, 5);
	format(gString, 150, "Acum vei vedea ce se scrie pe chatul factiunii %s (%d). Pentru a scrie foloseste (/fc)", FactionInfo_[params[0] - 1][fName], params[0]);
	SCM(playerid, COLOR_YELLOW, gString);
	return true;
}

YCMD:fc(playerid, params[]) {
	if(!PlayerVar[playerid][fSpec])
		return SCM(playerid, COLOR_LGREEN, "Nu esti spec pe o factiune.");

	if(!PlayerInfo[playerid][pTog][2])
		return SCM(playerid, COLOR_GREY, "Ai faction chat-ul dezactivat (/tog).");

	if(sscanf(params, "s[64]", params))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/fc [text]");

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

	gString[0] = EOS;
	format(gString, sizeof(gString), "* Admin %s: %s", GetName(playerid), params);
	SendTeamMessage(PlayerVar[playerid][fSpec], 0x00D5FFFF, gString);
	return true;
}

YCMD:unmute(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	if(sscanf(params, "u", params[0]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/unmute [playerid/name]");

	if(!IsPlayerConnected(params[0]) || !IsPlayerLogged(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(PlayerInfo[params[0]][pMute] == 0)
		return SCM(playerid, COLOR_GREY, "The player has no moted.");

	PlayerInfo[params[0]][pMute] = 0;
	UpdateVar(params[0], "Mute", 0);

	ClearString();
	format(gString, 100, COLOR_GMx"(/unmute) {FFFFFF}%s has unmuted by %s.", GetName(params[0]), GetName(playerid));
	SendAdminMessage(COLOR_ADMCMD, gString, 1);
	format(gString, 70, "Administartor: %s ti-a dat unmute.", GetName(playerid));
	SCM(params[0], COLOR_YELLOW, gString);
	return true;
}

YCMD:goto(playerid, params[], help) {
	if(!IsAdmin(playerid, 1)) 
		return SCM(playerid, COLOR_GREY, AdminOnly);

	new id, bool: count = false;
	if(sscanf(params, "u", id))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/goto [playerid/name]");

	if(!IsPlayerConnected(id)) return true;

	if(!IsPlayerLogged(id))
		return SCM(playerid, COLOR_GREY, "Acel player nu este logat.");

	if(playerid == id)
		return true;

	if(PlayerVar[id][MySpec] != -1)
		return SCM(playerid, COLOR_GREY, "Acel player este occupat");

	new Float: Pos[3];
	GetPlayerPos(id, Pos[0], Pos[1], Pos[2]);
	gString[0] = EOS;
	format(gString, sizeof(gString), "You teleported to %s.", GetName(id));
	SCM(playerid, COLOR_WHITE, gString);
	format(gString, sizeof(gString), "%s has been teleported to you.", GetName(playerid));
	SCM(id, COLOR_WHITE, gString);

	SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(id));
	SetPlayerInterior(playerid, GetPlayerInterior(id));
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) return SetVehiclePos(GetPlayerVehicleID(playerid), Pos[0], Pos[1], Pos[2]+5), SetVehicleVirtualWorld(GetPlayerVehicleID(playerid), GetPlayerVirtualWorld(id)), LinkVehicleToInterior(GetPlayerVehicleID(playerid), GetPlayerInterior(id));
	else if(GetPlayerState(id) == 2 || GetPlayerState(id) == 3) {
		new model = GetVehicleModel(GetPlayerVehicleID(id));
		if(MaxSeats[model - 400] > 0) {
			for(new xx; xx < MaxSeats[model - 400]; xx++) {
				if(!IsSeatTaken(GetPlayerVehicleID(id), xx)) {
					PutPlayerInVehicle(playerid, GetPlayerVehicleID(id), xx);
					count = true;
					break;
				}
			}
		}
	}
	if(!count) SetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
	PlayerVar[playerid][IsHouses] = PlayerVar[id][IsHouses];
	PlayerVar[playerid][IsBizz] = PlayerVar[id][IsBizz];
	PlayerVar[playerid][IsFaction] = PlayerVar[id][IsFaction];
	return true;
}

YCMD:check(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new id;
	if(sscanf(params, "u", id))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/check [playerd/name]");

	if(!IsPlayerConnected(id)) return true;

	if(PlayerInfo[playerid][pAdmin] < PlayerInfo[id][pAdmin])
		return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta comanda pe acel player.");
		
	ShowStats(playerid, id);
	return true;
}

YCMD:gethere(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new id;
	if(sscanf(params, "u", id))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/gethere [playerid/name]");

	if(!IsPlayerConnected(id)) return true;

	if(!IsPlayerLogged(id))
		return SCM(playerid, COLOR_GREY, "Acel player nu este logat.");

	if(PlayerVar[id][MySpec] != -1)
		return SCM(playerid, COLOR_GREY, "Acel player este occupat.");

	if(playerid == id)
		return true;

	new Float: Pos[3];
	GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
	gString[0] = EOS;
	format(gString, sizeof(gString), "Teleported %s to you.", GetName(id));
	SCM(playerid, COLOR_WHITE, gString);
	format(gString, sizeof(gString), "%s teleported to you.", GetName(playerid));
	SCM(id, COLOR_WHITE, gString);
	if(IsPlayerInAnyVehicle(id)) {
		new veh = GetPlayerVehicleID(id);
		foreach(new i : PlayerInVehicle[veh]) {
			SetPlayerVirtualWorld(i, GetPlayerVirtualWorld(playerid));
			SetPlayerInterior(i, GetPlayerInterior(playerid));
			PlayerVar[i][IsHouses] = PlayerVar[playerid][IsHouses];
			PlayerVar[i][IsBizz] = PlayerVar[playerid][IsBizz];
			PlayerVar[i][IsFaction] = PlayerVar[playerid][IsFaction];
		}
		SetVehiclePos(veh, Pos[0], Pos[1]+3, Pos[2]);
		LinkVehicleToInterior(veh, GetPlayerInterior(playerid));
		SetVehicleVirtualWorld(veh, GetPlayerVirtualWorld(playerid));
		return true;
	}
	new bool: count = false;
	if(IsPlayerInAnyVehicle(playerid)) {
		new model = GetVehicleModel(GetPlayerVehicleID(playerid));
		if(MaxSeats[model - 400] > 0) {
			for(new xx; xx < MaxSeats[model - 400]; xx++) {
				if(!IsSeatTaken(GetPlayerVehicleID(playerid), xx)) {
					PutPlayerInVehicle(id, GetPlayerVehicleID(playerid), xx);
					count = true;
					break;
				}
			}
		}			
	}
	if(!count) SetPlayerPos(id, Pos[0], Pos[1]+2, Pos[2]);
	SetPlayerVirtualWorld(id, GetPlayerVirtualWorld(playerid));
	SetPlayerInterior(id, GetPlayerInterior(playerid));
	PlayerVar[id][IsHouses] = PlayerVar[playerid][IsHouses];
	PlayerVar[id][IsBizz] = PlayerVar[playerid][IsBizz];
	PlayerVar[id][IsFaction] = PlayerVar[playerid][IsFaction];
	return true;
}

YCMD:area(playerid, params[], help) {
	if(!IsAdmin(playerid, 2))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new type[20], range;
	if(sscanf(params, "s[20]i", type, range)) {
		SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/area [type] [range]");
		SCM(playerid, COLOR_GREY, "Type: {FFFFFF}heal, armour, disarm, respawn, freeze");
		if(IsAdmin(playerid, 5)) SCM(playerid, COLOR_GREY, "Type: {FFFFFF}despawncar (personal car), repair");
		return true;
	}
	new Float: Pos[3], players, types;
	gString[0] = EOS;
	GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
	if(strcmp("heal", type, true) == 0) {
		foreach(new i : Player) {
			if(PlayerToPoint(i, range, Pos[0], Pos[1], Pos[2])) {
				SetPlayerHealth(i, 100);
				format(gString, sizeof(gString), "* Admin %s ti-a setat viata.", GetName(playerid));
				SCM(i, COLOR_YELLOW, gString);
				players ++;
			}
		}
	}
	else if(strcmp("freeze", type, true) == 0) {
		format(gString, sizeof(gString), "* Admin %s ti-a dat freeze", GetName(playerid));
		foreach(new i : Player) {
			if(PlayerToPoint(i, range, Pos[0], Pos[1], Pos[2])) {
				TogglePlayerControllable(i, false);
				SCM(i, COLOR_YELLOW, gString);
				players ++;
			}
		}
	}
	else if(strcmp("armour", type, true) == 0) {
		format(gString, sizeof(gString), "* Admin %s ti-a setat armura.", GetName(playerid));
		foreach(new i : Player) {
			if(PlayerToPoint(i, range, Pos[0], Pos[1], Pos[2])) {
				SetPlayerArmour(i, 100);
				SCM(i, COLOR_YELLOW, gString);
				players ++;
			}
		}
	}
	else if(strcmp("disarm", type, true) == 0) {
		format(gString, sizeof(gString), "* Admin %s ti-a luat toate armele.", GetName(playerid));
		foreach(new i : Player) {
			if(PlayerToPoint(i, range, Pos[0], Pos[1], Pos[2])) {
				ResetPlayerWeapons(i);
				SCM(i, COLOR_YELLOW, gString);
				players ++;
			}
		}
	}
	else if(strcmp("respawn", type, true) == 0) {
		format(gString, sizeof(gString), "* Admin %s te-a respawnat.", GetName(playerid));
		foreach(new i : Player) {
			if(PlayerToPoint(i, range, Pos[0], Pos[1], Pos[2])) {
				if(IsPlayerInAnyVehicle(i)) SetPlayerPose(i, 0, 0, 5);
				SpawnPlayer(i);
				SCM(i, COLOR_YELLOW, gString);
				players ++;
			}
		}
	}
	else if(strcmp("despawncar", type, true) == 0) {
		types = 1;
		foreach(new idd : All(MyVehicles<>)) {
			if(CarInfo[idd][cSpawned] != INVALID_VEHICLE) {
				new Float:PosX,Float:PosY,Float:PosZ;
				GetVehiclePos(CarInfo[idd][cSpawned], PosX, PosY,PosZ);
				if(IsPlayerInRangeOfPoint(playerid, range, PosX,PosY,PosZ) && !IsVehicleOccupied(CarInfo[idd][cSpawned])) DestroyPlayerCar(idd), players ++;
			}
		}
	}
	else if(strcmp("repair", type, true) == 0) {
		types = 1;
		foreach(new vehid : VarVehicle) {
			new Float:PosX,Float:PosY,Float:PosZ;
			GetVehiclePos(vehid, PosX, PosY,PosZ);
			if(IsPlayerInRangeOfPoint(playerid, range, PosX,PosY,PosZ)) {
				SetVehicleHealth(vehid, 999);
				RepairVehicle(vehid);
				Fuel[vehid] = 100;
				players ++;
			}
		}
	}
	else {
		SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/area [type] [range]");
		SCM(playerid, COLOR_GREY, "Type: {FFFFFF}heal, armour, disarm, respawn");
		if(IsAdmin(playerid, 5)) SCM(playerid, COLOR_GREY, "Type: {FFFFFF}despawncar (personal car), repair");
		return true;
	}
	format(gString, sizeof(gString), COLOR_GMx"(/area) Admin %s gave %s %d %s over a radius of %dm.", GetName(playerid), type, players, types ? ("vehicles") : ("players"), range);
	SendAdminMessage(COLOR_PINK, gString, 1);
	return true;
}

YCMD:dm(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	new reason[64];
	if(sscanf(params, "uis[64]", params[0], params[1], reason))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/dm [playerid/name] [minute] [reason]");

	if(!IsPlayerConnected(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not connected");

	if(!IsPlayerLogged(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not logged");

	if(params[1] <= 0 || params[1] > 90)
		return SCM(playerid, COLOR_GREY, "Invalid (1 - 90 minute)");

	if(PlayerInfo[params[0]][pJail]!=0)
		return SCM(playerid, COLOR_GREY, "Acel player este deja in jail.");

	if(PlayerInfo[playerid][pAdmin]<PlayerInfo[params[0]][pAdmin])
		return true;

	SetPlayerWanted(params[0], 0);
	PlayerInfo[params[0]][pJailType] = 10;
	SpawnPlayer(params[0]);

	UpdateVar(params[0], "JailType", PlayerInfo[params[0]][pJailType]);
	PlayerInfo[params[0]][pJail] = params[1]*60;
	UpdateVar(playerid, "Jail", PlayerInfo[params[0]][pJail]);
	PlayerTextDrawShow(params[0], WantedPTD);

	gString[0] = EOS;
	format(gString, sizeof gString, "DM: Admin %s l-a bagat pe %s la jail pentru %d minute. Motiv: %s.", GetName(playerid), GetName(params[0]), params[1], reason);
	SendAdminMessage(COLOR_ADMCMD, gString, 1);
	format(gString, sizeof gString, "* Admin %s te-a bagat la jail pentru %d minute. Motiv: %s", GetName(playerid), params[1], reason);
	SCM(params[0], COLOR_LIGHTRED, gString);
	SCMf(params[0], COLOR_YELLOW, "* Admin %s ti-a suspednat licenta de arme pentru 2 ore.", GetName(playerid));
	PlayerInfo[params[0]][pWeaponSuspend] = gettime() + (2 * 3600);
	UpdateVar(params[0], "WeaponSuspend", PlayerInfo[params[0]][pWeaponSuspend]);
	PlayerInfo[params[0]][pWeaponLicense] = gettime();
	UpdateVar(params[0], "WeaponLicense", gettime());
	SCM(playerid, COLOR_YELLOW, "* I-ai suspendat licenta de arme pentru 2 ore.");
	return true;
}

YCMD:dmp(playerid, params[], help) {
	if(!IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_GREY, AdminOnly);

	new reason[64];
	if(sscanf(params, "uis[64]", params[0], params[1], reason))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/dm [playerid/name] [minute] [reason]");

	if(!IsPlayerConnected(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not connected");

	if(!IsPlayerLogged(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not logged");

	if(params[1] <= 0 || params[1] > 90)
		return SCM(playerid, COLOR_GREY, "Invalid (1 - 90 minute)");

	if(PlayerInfo[params[0]][pJail]!=0)
		return SCM(playerid, COLOR_GREY, "Acel player este deja in jail.");

	if(PlayerInfo[playerid][pAdmin]<PlayerInfo[params[0]][pAdmin])
		return true;

	SetPlayerWanted(params[0], 0);
	PlayerInfo[params[0]][pJailType] = 10;
	SpawnPlayer(params[0]);

	UpdateVar(params[0], "JailType", PlayerInfo[params[0]][pJailType]);
	PlayerInfo[params[0]][pJail] = params[1]*60;
	UpdateVar(playerid, "Jail", PlayerInfo[params[0]][pJail]);
	PlayerTextDrawShow(params[0], WantedPTD);

	gString[0] = EOS;
	format(gString, sizeof gString, "DM: Admin %s l-a bagat pe %s la jail pentru %d minute. Motiv: %s.", GetName(playerid), GetName(params[0]), params[1], reason);
	SendAdminMessage(COLOR_ADMCMD, gString, 1);
	format(gString, sizeof gString, "* Admin %s te-a bagat la jail pentru %d minute. Motiv: %s", GetName(playerid), params[1], reason);
	SCM(params[0], COLOR_LIGHTRED, gString);
	return true;
}

YCMD:va(playerid, params[], help) {
	if(!IsAdmin(playerid, 3))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new range;
	if(sscanf(params, "i", range))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/va [range]");

	RespawnVehicles(playerid, range);
	return true;
}

YCMD:neargun(playerid, params[], help) {
	if(!IsAdmin(playerid, 3))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new weaponid, range, ammo;
	if(sscanf(params, "iii", weaponid, ammo, range))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/neargun [weaponid] [ammo] [range]");

	new Float: Pos[3], players, weapon[30];
	GetWeaponName(weaponid, weapon, 30);
	gString[0] = EOS;
	GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
	foreach(new i : Player) {
		if(PlayerToPoint(i, range, Pos[0], Pos[1], Pos[2])) {
			GivePlayerWeapon(i, weaponid, ammo);
			format(gString, sizeof(gString), "* Ai primit un %s cu %d gloante de la Admin %s.", weapon, ammo, GetName(playerid));
			SCM(i, COLOR_YELLOW, gString);
			players ++;
		}
	}
	format(gString, sizeof(gString), COLOR_GMx"(/neargun) {FFFFFF}Admin %s gave weapon %s with %d ammo over a radius of %dm.", GetName(playerid), weapon, players, range);
	SendAdminMessage(COLOR_PINK, gString, 1);
	return true;
}