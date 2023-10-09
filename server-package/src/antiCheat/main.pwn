#include <YSI_Coding\y_hooks>

#include "./src/antiCheat/variables.pwn"
#include "./src/antiCheat/redist.pwn"
#include "./src/antiCheat/callbacks.pwn"

static const r_var_stats[4] = {0,0,0,0};
std::HackSystem(playerid, i=-1) {
	GetPlayerVelocity(playerid, ac_xx,ac_yy,ac_zz);
	new Float:x,Float:y,Float:z, Float: health, Float: armour, weapons, vehicle = GetPlayerVehicleID(playerid); GetPlayerHealth(playerid, health), GetPlayerArmour(playerid, armour);
	GetPlayerPos(playerid, x, y, z);

	if(health > p_AntiCheat[playerid][AC_Health]) return OnPlayerCheatDetect(playerid, HEALTH_HACK, "health hack");
	if(armour > p_AntiCheat[playerid][AC_Armour]) return OnPlayerCheatDetect(playerid, ARMOUR_HACK, "armour hack");

	if IsPlayerInAnyVehicle(playerid)&&GetVehicleHealth(vehicle, health) *then {
		if health==1000.0 *then {
			while(++i<8) {
				if !_inArea(_PNS[i][0], _PNS[i][1], _PNS[i][2], _PNS[i][3], x, y) *then continue; 
				else return SetVehicleHealth(vehicle,(vehHealth[vehicle]=999.0)),vehStatus[vehicle]=r_var_stats,CallRemoteFunction("OnPlayerSprayPNS", "ii", playerid, vehicle),1;
			}
			OnVehicleDamageStatusUpdate(vehicle, playerid), SetVehicleHealth(vehicle, vehHealth[vehicle]), UpdateVehicleDamageStatus(vehicle, vehStatus[vehicle][0], vehStatus[vehicle][1], vehStatus[vehicle][2], vehStatus[vehicle][3]);
		}
		else GetVehicleDamageStatus(vehicle, vehStatus[vehicle][0], vehStatus[vehicle][1], vehStatus[vehicle][2], vehStatus[vehicle][3]);
	}
	if(IsAdmin(playerid, 1)) return true;
	if(VectorSize(x-p_AntiCheat[playerid][AC_POS][0], y-p_AntiCheat[playerid][AC_POS][1], z-z) < 10.0 && exception[playerid]) exception[playerid] = false;
	/*
	if(ServerSystem(1)) {
		switch(GetPlayerState(playerid)) {
			case PLAYER_STATE_ONFOOT: if(VectorSize(x-p_AntiCheat[playerid][AC_POS][0], y-p_AntiCheat[playerid][AC_POS][1], z-z) > 15.0 && GetPlayerSurfingVehicleID(playerid) == INVALID_VEHICLE_ID && !exception[playerid]) OnPlayerCheatDetect(playerid, TELEPORT_HACK, "teleport/airbreak hack (on foot)");
			case PLAYER_STATE_DRIVER: if(VectorSize(x-p_AntiCheat[playerid][AC_POS][0], y-p_AntiCheat[playerid][AC_POS][1], z-z) > max_velctor_car[GetVehicleModel(vehicle)-400]*55.0) OnPlayerCheatDetect(playerid, TELEPORT_HACK, "teleport/airbreak hack (driver)");
		}
	}*/
	p_AntiCheat[playerid][AC_POS][0]=x, p_AntiCheat[playerid][AC_POS][1]=y, p_AntiCheat[playerid][AC_POS][2]=z;
	if(GetPlayerSurfingVehicleID(playerid)!=INVALID_VEHICLE_ID) p_AntiCheat[playerid][AC_last_airplane] = true;
	else if(ac_zz==0.0&&GetPlayerState(playerid)==PLAYER_STATE_ONFOOT) p_AntiCheat[playerid][AC_last_airplane]=false;

	if(GetPlayerWeapon(playerid) == 21) return OnPlayerCheatDetect(playerid, JETPACK_HACK, "jetpack hack");

	p_AntiCheat[playerid][AC_Crasher]=p_AntiCheat[playerid][AC_Sended]=false;

	while(++i<11) {
		GetPlayerWeaponData(playerid, i, weapons, _:health);
		if p_AntiCheat[playerid][AC_Weapons][i] != weapons *then return OnPlayerCheatDetect(playerid, WEAPON_CHEATS, "weapon cheats", weapons);
	}
	return true;
}

std::OnPlayerCheatDetect(const playerid, const cheatid, const reason[], alloc=-1) {
	#pragma unused reason
	if p_AntiCheat[playerid][AC_Sended] *then return true;
	if(IsAdmin(playerid, 1)) return true;
	switch cheatid do {
		case CRASHER_1: {
			format(gString, 128, "{E4627F}ANTI-CHEAT >> {FFFFFF} %s received a kick for possible crasher #1", GetName(playerid));
			SendAdminMessage(-1, gString, 1);
		}
		case WEAPON_CHEATS: {
			new str[32];
			GetWeaponName(alloc, str, 32);
			format(gString, 128, "{E4627F}ANTI-CHEAT >> {FFFFFF} %s received a kick for possible weapon cheats (%s).", GetName(playerid), str);
		}
		case OTHER_CHEATS: {
			format(gString, 128, "{E4627F}ANTI-CHEAT >> {FFFFFF} %s received a kick for possible other cheats.", GetName(playerid));
			SendAdminMessage(-1, gString, 1);
		}
		case TROLL_HACK: {
			format(gString, 128, "{E4627F}ANTI-CHEAT >> {FFFFFF} %s received a kick for possible troll hack #1.", GetName(playerid));
			SendAdminMessage(-1, gString, 1);
		}
		case HEALTH_HACK: {
			format(gString, 128, "{E4627F}ANTI-CHEAT >> {FFFFFF} %s received a kick for possible health hack.", GetName(playerid));
			SendAdminMessage(-1, gString, 1);
		}
		case ARMOUR_HACK: {
			format(gString, 128, "{E4627F}ANTI-CHEAT >> {FFFFFF} %s received a kick for possible armour hack.", GetName(playerid));
			SendAdminMessage(-1, gString, 1);
		}
		case CHECKPOINT_TELEPORT: {
			format(gString, 128, "{E4627F}ANTI-CHEAT >> {FFFFFF} %s received a kick for possible teleport to checkpoint.", GetName(playerid));
			SendAdminMessage(-1, gString, 1);
		}
		case TELEPORT_HACK: {
			if(PlayerVar[playerid][AFKSeconds] > 15 || posible_Action[playerid] == EXCPETED) return true;
			format(gString, 128, "{E4627F}ANTI-CHEAT >> {FFFFFF} %s posibile teleport hack (%s)", GetName(playerid), !IsPlayerInAnyVehicle(playerid)?("on foot"):("in vehicle"));
			SendAdminMessage(-1, gString, 1);
		}
		case SPEED_HACK: {
			format(gString, 128, "{E4627F}ANTI-CHEAT >> {FFFFFF} %s received a kick for possible speed hack in vehicle.", GetName(playerid));
			SendAdminMessage(-1, gString, 1);
		}
		case SILENT_AIM: {
			format(gString, 128, "{E4627F}ANTI-CHEAT >> {FFFFFF} %s received a kick for possible silent aim.", GetName(playerid));
			SendAdminMessage(-1, gString, 1);
		}
		case SPEED_HACK_FOOT: {
			format(gString, 128, "{E4627F}ANTI-CHEAT >> {FFFFFF} %s received a kick for speed hack onfoot.", GetName(playerid));
			SendAdminMessage(-1, gString, 1);
		}
		case TROLL_HACK2: {
			if(p_AntiCheat[playerid][AC_last_airplane] || PlayerVar[playerid][AFKSeconds] > 15 || IsAPlane(GetPlayerVehicleID(playerid))) return true;
			format(gString, 128, "{E4627F}ANTI-CHEAT >> {FFFFFF} %s received a kick for possible troll hack #2.", GetName(playerid));
			SendAdminMessage(-1, gString, 1);
		}
		case INVISIBLE_HACK: {
			format(gString, 128, "{E4627F}ANTI-CHEAT >> {FFFFFF} %s received a kick for possible invisible hack.", GetName(playerid));
			SendAdminMessage(-1, gString, 1);
		}
		case KILL_HACK: {
			format(gString, 128, "{E4627F}ANTI-CHEAT >> {FFFFFF} %s received a kick for possible kill hack.", GetName(playerid));
			SendAdminMessage(-1, gString, 1);
		}
		case JETPACK_HACK: {
			format(gString, 128, "{E4627F}ANTI-CHEAT >> {FFFFFF} %s received a kick for jetpack hack.", GetName(playerid));
			SendAdminMessage(-1, gString, 1);
		}
	}
	KickEx(playerid);
	p_AntiCheat[playerid][AC_Sended] = true;
	SCMf(playerid, COLOR_SERVER, "Ai primit pe motiv-ul %s (%d)", reason, alloc);
	SCM(playerid, COLOR_SERVER, "Daca ai luat kick aiurea, te rog raporteaza si explica exact ce ai facut inainte cu 2 min pana sa primesti kick");
	SCM(playerid, COLOR_SERVER, "Discord: HPQ123#8114");
	printf("%s has been kicked. reason: %s (%d)", GetName(playerid), reason, alloc);
	return true;
}
/*
antiCheat_init(playerid) {
	SetTimerEx(#AC_update_sec, GetPlayerPing(playerid), false, #i, playerid);
	return true;
}*/
