
function SQL_LoadSafezone() {
	printf("[MySQL] safezone: %d", cache_num_rows());

	if(cache_num_rows() == 0)
		return true;

	new i=-1; SQL_safe = cache_num_rows();
	while(++i<SQL_safe) {
		cache_get_value_name_int(i, "ID", SafeInfo[i][szID]);
		cache_get_value_name_int(i, "Raza", SafeInfo[i][szRaza]);
		cache_get_value_name_float(i, "X", SafeInfo[i][szPos][0]);
		cache_get_value_name_float(i, "Y", SafeInfo[i][szPos][1]);
		cache_get_value_name_float(i, "Z", SafeInfo[i][szPos][2]);

		SafeInfo[i][szArea] = CreateDynamicSphere(SafeInfo[i][szPos][0], SafeInfo[i][szPos][1], SafeInfo[i][szPos][2], SafeInfo[i][szRaza]);
		AreaType[SafeInfo[i][szArea]] = AREA_SAFEZONE;
	}
	return true;
}

YCMD:addsafezone(playerid, params[], help) {
	if(!IsAdmin(playerid, 7))
		return true;

	if(SQL_safe >= MAX_SAFEZONE) 
		return SCM(playerid, COLOR_GREY, "Maxim safezone.");

	new raza;
	if(sscanf(params, "i", raza))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/addsafezone [raza]");

	if(raza > 1000 || raza <= 0)
		return SCM(playerid, COLOR_GREY, "Invalid raza.");

	GetPlayerPos(playerid, SafeInfo[SQL_safe][szPos][0], SafeInfo[SQL_safe][szPos][1], SafeInfo[SQL_safe][szPos][2]);
	SafeInfo[SQL_safe][szRaza] = raza;
	SafeInfo[SQL_safe][szArea] = CreateDynamicSphere(SafeInfo[SQL_safe][szPos][0], SafeInfo[SQL_safe][szPos][1], SafeInfo[SQL_safe][szPos][2], SafeInfo[SQL_safe][szRaza]);
	AreaType[SafeInfo[SQL_safe][szArea]] = AREA_SAFEZONE;

	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "INSERT INTO `safezone` (`X`, `Y`, `Z`, `Raza`) VALUES ('%f', '%f', '%f', '%d')", SafeInfo[SQL_safe][szPos][0], SafeInfo[SQL_safe][szPos][1], SafeInfo[SQL_safe][szPos][2], raza);
	mysql_tquery(SQL, gQuery);
	SQL_safe++;

	gString[0] = EOS;
	format(gString, 70, "/addsafezone: %s has added a safezone. Raza: %d", GetName(playerid), raza);
	SendAdminMessage(COLOR_ADMCMD, gString, 6);
	return true;
}