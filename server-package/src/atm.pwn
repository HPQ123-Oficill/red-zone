function SQL_Cache_ATM() {
	SQL_ATM=cache_num_rows();
	printf("[MySQL] Loading %d atm...", SQL_ATM);
	if(!SQL_ATM) return true;
	new i=-1,x;
	while(++i<SQL_ATM) {
		cache_get_value_name_int(i, "ID", AtmInfo[i][at_ID]);
		cache_get_value_name_float(i, "X", AtmInfo[i][at_X]);
		cache_get_value_name_float(i, "Y", AtmInfo[i][at_Y]);
		cache_get_value_name_float(i, "Z", AtmInfo[i][at_Z]);
		cache_get_value_name_float(i, "RX", AtmInfo[i][at_RX]);
		cache_get_value_name_float(i, "RY", AtmInfo[i][at_RY]);
		cache_get_value_name_float(i, "RZ", AtmInfo[i][at_RZ]);

		format(gString, 100, "ATM %d\nWithdraw your cash here!\nPress F to use this ATM.", AtmInfo[i][at_ID]);
		AtmInfo[i][at_Lab] = CreateDynamic3DTextLabel(gString, -1, AtmInfo[i][at_X], AtmInfo[i][at_Y], AtmInfo[i][at_Z], 7.0);
		AtmInfo[i][at_Obj] = CreateDynamicObject(19324, AtmInfo[i][at_X], AtmInfo[i][at_Y], AtmInfo[i][at_Z], AtmInfo[i][at_RX], AtmInfo[i][at_RY], AtmInfo[i][at_RZ]);
		x = CreateDynamicSphere(AtmInfo[i][at_X], AtmInfo[i][at_Y], AtmInfo[i][at_Z], 3.0);
		AreaType[x] = AREA_ATM;
	}
	return true;
}

YCMD:createatm(playerid, params[], help) {
	if(!IsAdmin(playerid, 7)) return SCM(playerid, COLOR_LGREEN, AdminOnly);
	new Float:x,Float:y,Float:z,i=SQL_ATM; GetPlayerPos(playerid, x, y, z);
	AtmInfo[i][at_Obj] = CreateDynamicObject(19324, x, y+2.0, z, 0.0, 0.0, 0.0);
	EditDynamicObject(playerid, AtmInfo[i][at_Obj]);
	SCM(playerid, -1, "Edit ATM position!");
	EditObjectIDe[playerid] = i;
	EditObjectID[playerid] = EDIT_ATM;
	return true;
}