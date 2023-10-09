// redefinition function
std::HPQ_GivePlayerWeapon(playerid, weaponid, ammo) return p_AntiCheat[playerid][AC_Weapons][GetWeaponSlot(weaponid)] = weaponid,GivePlayerWeapon(playerid, weaponid, ammo);
std::HPQ_PutPlayerInVehicle(playerid, vehicleid, seatid) return PutPlayerInVehicle(playerid, vehicleid, seatid), p_AntiCheat[playerid][AC_InVehicle]=true,1;
std::HPQ_SetPlayerHealth(playerid, Float:health) return SetPlayerHealth(playerid, health), p_AntiCheat[playerid][AC_Health]=health,1;
std::HPQ_SetPlayerArmour(playerid, Float:armour) return SetPlayerArmour(playerid, armour), p_AntiCheat[playerid][AC_Armour]=armour,1;
std::HPQ_SetPlayerPos(playerid, Float:x, Float:y, Float:z) {
    SetPlayerPos(playerid,x,y,z);
    p_AntiCheat[playerid][AC_POS][0]=x;
    p_AntiCheat[playerid][AC_POS][1]=y;
    p_AntiCheat[playerid][AC_POS][2]=z;
    exception[playerid]=true;
    return 1;
}
std::HPQ_SetVehicleHealth(vehicleid, Float:health) return SetVehicleHealth(vehicleid, (vehHealth[vehicleid]=health));
std::HPQ_ResetPlayerWeapons(playerid) return p_AntiCheat[playerid][AC_Weapons] = r_AC_VAR[AC_Weapons],ResetPlayerWeapons(playerid); 
std::HPQ_GetPlayerHealth(playerid, &Float:health) return health=p_AntiCheat[playerid][AC_Health],1;
std::HPQ_GetPlayerArmour(playerid, &Float:armour) return armour=p_AntiCheat[playerid][AC_Armour],1;
std::HPQ_CreateVehicle(vehicletype, Float:x, Float:y, Float:z, Float:rotation, color1, color2, respawn_delay, addsiren=0, v=0) {
    v=CreateVehicle(vehicletype, x, y, z, rotation, color1, color2, respawn_delay, addsiren);
    SetVehicleHealth(v, (vehHealth[v]=999.0));
    return v;
}

#if defined _ALS_GetPlayerArmour
    #undef GetPlayerArmour
#else
    #define _ALS_GetPlayerArmour
#endif
#define GetPlayerArmour HPQ_GetPlayerArmour

#if defined _ALS_GetPlayerHealth
    #undef GetPlayerHealth
#else
    #define _ALS_GetPlayerHealth
#endif
#define GetPlayerHealth HPQ_GetPlayerHealth

#if defined _ALS_ResetPlayerWeapons
    #undef ResetPlayerWeapons
#else
    #define _ALS_ResetPlayerWeapons
#endif
#define ResetPlayerWeapons HPQ_ResetPlayerWeapons

#if defined _ALS_GivePlayerWeapon
    #undef GivePlayerWeapon
#else
    #define _ALS_GivePlayerWeapon
#endif
#define GivePlayerWeapon HPQ_GivePlayerWeapon

#if defined _ALS_CreateVehicle
    #undef CreateVehicle
#else
    #define _ALS_CreateVehicle
#endif
#define CreateVehicle HPQ_CreateVehicle

#if defined _ALS_SetVehicleHealth
    #undef SetVehicleHealth
#else
    #define _ALS_SetVehicleHealth
#endif
#define SetVehicleHealth HPQ_SetVehicleHealth

#if defined _ALS_PutPlayerInVehicle
    #undef PutPlayerInVehicle
#else
    #define _ALS_PutPlayerInVehicle
#endif
#define PutPlayerInVehicle HPQ_PutPlayerInVehicle

#if defined _ALS_SetPlayerHealth
    #undef SetPlayerHealth
#else
    #define _ALS_SetPlayerHealth
#endif
#define SetPlayerHealth HPQ_SetPlayerHealth

#if defined _ALS_SetPlayerArmour
    #undef SetPlayerArmour
#else
    #define _ALS_SetPlayerArmour
#endif
#define SetPlayerArmour HPQ_SetPlayerArmour

#if defined _ALS_SetPlayerPos
    #undef SetPlayerPos
#else
    #define _ALS_SetPlayerPos
#endif
#define SetPlayerPos HPQ_SetPlayerPos

// other

std::Float:GetPlayerSpeed(playerid, Float:x=0.0, Float:y=0.0, Float:z=0.0) { 
    GetPlayerVelocity(playerid, x,y,z); 
    return VectorSize(x*x, y*y, z*z)*200; 
}  

std::GetWeaponSlot(weaponid) {
    switch weaponid do {
        case 0,1: return 0;
        case 2..9: return 1;
        case 10..15: return 10;
        case 16..18, 39: return 8;
        case 22..24: return 2;
        case 25..27: return 3;
        case 28, 29, 32: return 4;
        case 30, 31: return 5;
        case 33, 34: return 6;
        case 35..38: return 7;
        case 40: return 12;
        case 41..43: return 9;
        case 44..46: return 11;
        default: return 0;
    }
    return 0;
}

#define _inArea(%0,%1,%2,%3,%4,%5) (%4>%0&&%4<%2&&%5>%1&&%5<%3)