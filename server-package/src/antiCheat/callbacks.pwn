new Float:ac_xx,Float:ac_yy,Float:ac_zz;

public OnVehicleDamageStatusUpdate(vehicleid, playerid) {
	new Float:health;
	GetVehicleHealth(vehicleid, health);
	if(health < vehHealth[vehicleid]) vehHealth[vehicleid] = health;
	return true;
}

hook OnPlayerSpawn(playerid) {
	SetPlayerHealth(playerid, 100.0);
	SetPlayerArmour(playerid, 0.0);
	p_AntiCheat[playerid] = r_AC_VAR;
	return p_AntiCheat[playerid][AC_Health] = 100.0, p_AntiCheat[playerid][AC_Armour] = 0.0,1;
}

hook OnVehicleSpawn(vehicleid) return vehHealth[vehicleid] = 999.0,1;

hook OnPlayerStateChange(playerid, newstate, oldstate) {
	switch(oldstate) {
		case PLAYER_STATE_DRIVER,PLAYER_STATE_PASSENGER: p_AntiCheat[playerid][AC_last_airplane]=true, p_AntiCheat[playerid][AC_InVehicle]=false;
	}
	switch(newstate) {
		case PLAYER_STATE_DRIVER, PLAYER_STATE_PASSENGER: if(!p_AntiCheat[playerid][AC_InVehicle]) return OnPlayerCheatDetect(playerid, TROLL_HACK, "troll hack");
	}
	return true;
}

hook OnPlayerExitVehicle(playerid, vehicleid) return p_AntiCheat[playerid][AC_InVehicle]=false,1;
hook OnPlayerEnterCheckpoint(playerid) return !IsPlayerInRangeOfPoint(playerid, 50.0, PlayerVar[playerid][LastPos][0], PlayerVar[playerid][LastPos][1], PlayerVar[playerid][LastPos][2]) && !p_AntiCheat[playerid][AC_Exception]?OnPlayerCheatDetect(playerid, CHECKPOINT_TELEPORT, "Checkpoint teleport"):_:true;

hook OnPlayerConnect(playerid) return p_AntiCheat[playerid] = r_AC_VAR;


hook OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart) {
	if(amount > 50) return SetPlayerHealth(playerid, 100.0)&&OnPlayerCheatDetect(playerid, KILL_HACK, "kill hack");
	return true;
}

hook OnGameModeInit() {
	AreaType[CreateDynamicRectangle(-2982.0,-2228.10,-1860.0,-887.10)] = AREA_EXCEPTED;
	AreaType[CreateDynamicSphere(617.5314,-1.9891,1000.7058, 10.0)] = AREA_EXCEPTED;
	AreaType[CreateDynamicSphere(2645.6765,-2038.8060,13.5500, 10.0)] = AREA_EXCEPTED;
	AreaType[CreateDynamicSphere(1041.3168,-1026.5499,32.1016, 10.0)] = AREA_EXCEPTED;
	AreaType[CreateDynamicSphere(2387.2402,1043.2157,10.8203, 10.0)] = AREA_EXCEPTED;
	AreaType[CreateDynamicSphere(-2715.9441,217.0546,4.3488, 10.0)] = AREA_EXCEPTED;
	return true;
}

hook OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ) {
	switch(weaponid) {
		case 24: {
			if(GetTickCount() - p_AntiCheat[playerid][AC_DEBUG] < 700) {
				OnePlayAnim(playerid, "PED", "getup", 4.1, 0, 0, 0, 0, 0);
      		 	SCM(playerid, COLOR_RED, " * Este interzis sa faci C-Bug, risti sa fii banat! *");
			}
	        p_AntiCheat[playerid][AC_DEBUG] = GetTickCount();
		}
		case 38: return true;
	}
	if(shot[playerid] > 5) return bool:true;
    if((gettime() - shotTime[playerid]) < 1) shot[playerid] ++;
    else shot[playerid] = 0;
    if(!IsAdmin(playerid, 7) && shot[playerid] > 10) return AdmBot(playerid, "Cheats (Rapid-Fire)");
    shotTime[playerid] = gettime();
	return true;
}
/*
redist::AC_update_sec(playerid) {
	SetTimerEx(#AC_update_sec, 100, false, #i, playerid);
	if(IsPlayerInAnyVehicle(playerid)) {
		GetVehicleVelocity(GetPlayerVehicleID(playerid), ac_xx,ac_yy,ac_zz);
		if(VectorSize(ac_xx,ac_yy,ac_zz-ac_zz) > max_velctor_car[GetVehicleModel(GetPlayerVehicleID(playerid))-400]) SCM(playerid, -1, "Posibil cheats");
			//return OnPlayerCheatDetect(playerid, TROLL_HACK2, "troll hack #2");
	}
	else {
		GetPlayerVelocity(playerid, ac_xx,ac_yy,ac_zz);
		if(VectorSize(ac_xx,ac_yy,ac_zz-ac_zz) > 0.6) SCM(playerid, -1, "Posibil cheats");
	}
	return true;
}*/