

enum E_VENDING_MACHINE
{
	E_MODEL,
	E_INTERIOR,
	Float: E_X,
	Float: E_Y,
	Float: E_Z,
	Float: E_RX,
	Float: E_RY,
	Float: E_RZ,
	Float: E_FX,
	Float: E_FY
};

static const
	g_VendingMachines[ ] [ E_VENDING_MACHINE ] =
	{
		{ 955, 0, -862.82, 1536.60, 21.98, 0.00, 0.00, 180.00, -862.84, 1537.60 },			{ 1775, 16, -35.72, -140.22, 1003.63, 0.00, 0.00, 180.00, -35.74, -139.22 },
		{ 956, 0, 2271.72, -76.46, 25.96, 0.00, 0.00, 0.00, 2271.72, -77.46 }, 				{ 955, 0, 1277.83, 372.51, 18.95, 0.00, 0.00, 64.00, 1278.73, 372.07 },
		{ 956, 0, 662.42, -552.16, 15.71, 0.00, 0.00, 180.00, 662.41, -551.16 }, 			{ 955, 0, 201.01, -107.61, 0.89, 0.00, 0.00, 270.00, 200.01, -107.63 },
		{ 955, 0, -253.74, 2597.95, 62.24, 0.00, 0.00, 90.00, -252.74, 2597.95 }, 			{ 956, 0, -253.74, 2599.75, 62.24, 0.00, 0.00, 90.00, -252.74, 2599.75 },
		{ 956, 0, -76.03, 1227.99, 19.12, 0.00, 0.00, 90.00, -75.03, 1227.99 }, 			{ 955, 0, -14.70, 1175.35, 18.95, 0.00, 0.00, 180.00, -14.72, 1176.35 },
		{ 1977, 7, 316.87, -140.35, 998.58, 0.00, 0.00, 270.00, 315.87, -140.36 }, 			{ 1775, 17, 373.82, -178.14, 1000.73, 0.00, 0.00, 0.00, 373.82, -179.14 },
		{ 1776, 17, 379.03, -178.88, 1000.73, 0.00, 0.00, 270.00, 378.03, -178.90 }, 		{ 1775, 17, 495.96, -24.32, 1000.73, 0.00, 0.00, 180.00, 495.95, -23.32 },
		{ 1776, 17, 500.56, -1.36, 1000.73, 0.00, 0.00, 0.00, 500.56, -2.36 }, 				{ 1775, 17, 501.82, -1.42, 1000.73, 0.00, 0.00, 0.00, 501.82, -2.42 },
		{ 956, 0, -1455.11, 2591.66, 55.23, 0.00, 0.00, 180.00, -1455.13, 2592.66 }, 		{ 955, 0, 2352.17, -1357.15, 23.77, 0.00, 0.00, 90.00, 2353.17, -1357.15 },
		{ 955, 0, 2325.97, -1645.13, 14.21, 0.00, 0.00, 0.00, 2325.97, -1646.13 }, 			{ 956, 0, 2139.51, -1161.48, 23.35, 0.00, 0.00, 87.00, 2140.51, -1161.53 },
		{ 956, 0, 2153.23, -1016.14, 62.23, 0.00, 0.00, 127.00, 2154.03, -1015.54 }, 		{ 955, 0, 1928.73, -1772.44, 12.94, 0.00, 0.00, 90.00, 1929.73, -1772.44 },
		{ 1776, 1, 2222.36, 1602.64, 1000.06, 0.00, 0.00, 90.00, 2223.36, 1602.64 }, 		{ 1775, 1, 2222.20, 1606.77, 1000.05, 0.00, 0.00, 90.00, 2223.20, 1606.77 },
		{ 1775, 1, 2155.90, 1606.77, 1000.05, 0.00, 0.00, 90.00, 2156.90, 1606.77 }, 		{ 1775, 1, 2209.90, 1607.19, 1000.05, 0.00, 0.00, 270.00, 2208.90, 1607.17 },
		{ 1776, 1, 2155.84, 1607.87, 1000.06, 0.00, 0.00, 90.00, 2156.84, 1607.87 }, 		{ 1776, 1, 2202.45, 1617.00, 1000.06, 0.00, 0.00, 180.00, 2202.43, 1618.00 },
		{ 1776, 1, 2209.24, 1621.21, 1000.06, 0.00, 0.00, 0.00, 2209.24, 1620.21 }, 		{ 1776, 3, 330.67, 178.50, 1020.07, 0.00, 0.00, 0.00, 330.67, 177.50 },
		{ 1776, 3, 331.92, 178.50, 1020.07, 0.00, 0.00, 0.00, 331.92, 177.50 }, 			{ 1776, 3, 350.90, 206.08, 1008.47, 0.00, 0.00, 90.00, 351.90, 206.08 },
		{ 1776, 3, 361.56, 158.61, 1008.47, 0.00, 0.00, 180.00, 361.54, 159.61 }, 			{ 1776, 3, 371.59, 178.45, 1020.07, 0.00, 0.00, 0.00, 371.59, 177.45 },
		{ 1776, 3, 374.89, 188.97, 1008.47, 0.00, 0.00, 0.00, 374.89, 187.97 }, 			{ 1775, 2, 2576.70, -1284.43, 1061.09, 0.00, 0.00, 270.00, 2575.70, -1284.44 },
		{ 1775, 15, 2225.20, -1153.42, 1025.90, 0.00, 0.00, 270.00, 2224.20, -1153.43 },	{ 955, 0, 1154.72, -1460.89, 15.15, 0.00, 0.00, 270.00, 1153.72, -1460.90 },
		{ 956, 0, 2480.85, -1959.27, 12.96, 0.00, 0.00, 180.00, 2480.84, -1958.27 },		{ 955, 0, 2060.11, -1897.64, 12.92, 0.00, 0.00, 0.00, 2060.11, -1898.64 },
		{ 955, 0, 1729.78, -1943.04, 12.94, 0.00, 0.00, 0.00, 1729.78, -1944.04 },			{ 956, 0, 1634.10, -2237.53, 12.89, 0.00, 0.00, 0.00, 1634.10, -2238.53 },
		{ 955, 0, 1789.21, -1369.26, 15.16, 0.00, 0.00, 270.00, 1788.21, -1369.28 },		{ 956, 0, -2229.18, 286.41, 34.70, 0.00, 0.00, 180.00, -2229.20, 287.41 },
		{ 955, 256, -1980.78, 142.66, 27.07, 0.00, 0.00, 270.00, -1981.78, 142.64 },		{ 955, 256, -2118.96, -423.64, 34.72, 0.00, 0.00, 255.00, -2119.93, -423.40 },
		{ 955, 256, -2118.61, -422.41, 34.72, 0.00, 0.00, 255.00, -2119.58, -422.17 },		{ 955, 256, -2097.27, -398.33, 34.72, 0.00, 0.00, 180.00, -2097.29, -397.33 },
		{ 955, 256, -2092.08, -490.05, 34.72, 0.00, 0.00, 0.00, -2092.08, -491.05 },		{ 955, 256, -2063.27, -490.05, 34.72, 0.00, 0.00, 0.00, -2063.27, -491.05 },
		{ 955, 256, -2005.64, -490.05, 34.72, 0.00, 0.00, 0.00, -2005.64, -491.05 },		{ 955, 256, -2034.46, -490.05, 34.72, 0.00, 0.00, 0.00, -2034.46, -491.05 },
		{ 955, 256, -2068.56, -398.33, 34.72, 0.00, 0.00, 180.00, -2068.58, -397.33 },		{ 955, 256, -2039.85, -398.33, 34.72, 0.00, 0.00, 180.00, -2039.86, -397.33 },
		{ 955, 256, -2011.14, -398.33, 34.72, 0.00, 0.00, 180.00, -2011.15, -397.33 },		{ 955, 2048, -1350.11, 492.28, 10.58, 0.00, 0.00, 90.00, -1349.11, 492.28 },
		{ 956, 2048, -1350.11, 493.85, 10.58, 0.00, 0.00, 90.00, -1349.11, 493.85 },		{ 955, 0, 2319.99, 2532.85, 10.21, 0.00, 0.00, 0.00, 2319.99, 2531.85 },
		{ 956, 0, 2845.72, 1295.04, 10.78, 0.00, 0.00, 0.00, 2845.72, 1294.04 },			{ 955, 0, 2503.14, 1243.69, 10.21, 0.00, 0.00, 180.00, 2503.12, 1244.69 },
		{ 956, 0, 2647.69, 1129.66, 10.21, 0.00, 0.00, 0.00, 2647.69, 1128.66 },			{ 1209, 0, -2420.21, 984.57, 44.29, 0.00, 0.00, 90.00, -2419.21, 984.57 },
		{ 1302, 0, -2420.17, 985.94, 44.29, 0.00, 0.00, 90.00, -2419.17, 985.94 },			{ 955, 0, 2085.77, 2071.35, 10.45, 0.00, 0.00, 90.00, 2086.77, 2071.35 },
		{ 956, 0, 1398.84, 2222.60, 10.42, 0.00, 0.00, 180.00, 1398.82, 2223.60 },			{ 956, 0, 1659.46, 1722.85, 10.21, 0.00, 0.00, 0.00, 1659.46, 1721.85 },
		{ 955, 0, 1520.14, 1055.26, 10.00, 0.00, 0.00, 270.00, 1519.14, 1055.24 },			{ 1775, 6, -19.03, -57.83, 1003.63, 0.00, 0.00, 180.00, -19.05, -56.83 },
		{ 1775, 18, -16.11, -91.64, 1003.63, 0.00, 0.00, 180.00, -16.13, -90.64 },			{ 1775, 16, -15.10, -140.22, 1003.63, 0.00, 0.00, 180.00, -15.11, -139.22 },
		{ 1775, 17, -32.44, -186.69, 1003.63, 0.00, 0.00, 180.00, -32.46, -185.69 },		{ 1775, 16, -35.72, -140.22, 1003.63, 0.00, 0.00, 180.00, -35.74, -139.22 },
		{ 1776, 6, -36.14, -57.87, 1003.63, 0.00, 0.00, 180.00, -36.16, -56.87 },			{ 1776, 18, -17.54, -91.71, 1003.63, 0.00, 0.00, 180.00, -17.56, -90.71 },
		{ 1776, 16, -16.53, -140.29, 1003.63, 0.00, 0.00, 180.00, -16.54, -139.29 },		{ 1776, 17, -33.87, -186.76, 1003.63, 0.00, 0.00, 180.00, -33.89, -185.76 },
		{ 1775, 6, -19.03, -57.83, 1003.63, 0.00, 0.00, 180.00, -19.05, -56.83 },			{ 1776, 6, -36.14, -57.87, 1003.63, 0.00, 0.00, 180.00, -36.16, -56.87 },
		{ 1775, 18, -16.11, -91.64, 1003.63, 0.00, 0.00, 180.00, -16.13, -90.64 },			{ 1776, 18, -17.54, -91.71, 1003.63, 0.00, 0.00, 180.00, -17.56, -90.71 },
		{ 1776, 16, -16.53, -140.29, 1003.63, 0.00, 0.00, 180.00, -16.54, -139.29 },		{ 1775, 16, -15.10, -140.22, 1003.63, 0.00, 0.00, 180.00, -15.11, -139.22 },
		{ 1776, 17, -33.87, -186.76, 1003.63, 0.00, 0.00, 180.00, -33.89, -185.76 },		{ 1775, 17, -32.44, -186.69, 1003.63, 0.00, 0.00, 180.00, -32.46, -185.69 },
		{ 955, 0, 2415.46875, 14.79237, 25.83620, 0.0, 0.0, 990.0, 2414.6187, 14.8469}
	}
;

main() {}

alias:spawn("respawn");
alias:gps("locations");
alias:refill("fill");
alias:work("startwork");
alias:h("hangup");
alias:r("radio");
alias:government("gov");
alias:su("suspect");

public OnQueryError(errorid, const error[], const callback[], const query[], MySQL:handle) {
	print( "====================================================================" );
	printf( "Error ID: %d, Eroare: %s", errorid, error );
	printf( "Callback: %s", callback );
	printf( "gQuery: %s", query );
	print( "====================================================================" );
	return true;
}

stock getRandom(length, const char_[]={"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"}, max=sizeof char_, pos=-1, x[64]) {
	for ;++pos<length;(x[pos]=char_[random(max)]) do { }
	return x;
}


#define SendBotMessage(%0,%1,%2,%3) format(gString,sizeof gString,%2,#[BOT] ##%3)&&SendClientMessage(%0,%1,gString)


public OnGameModeInit() {
	switch(h_status) {
		case HOST_LOCAL: SQL = mysql_connect(MySQL_IPLocal, MySQL_UserLocal, MySQL_PassLocal, MySQL_DataLocal), printf("Server: Localhost");
		case HOST_GLOBAL: SQL = mysql_connect(MySQL_IPHost, MySQL_UserHost, MySQL_PassHost, MySQL_DataHost), printf("Server: Host");
	}
	if(mysql_errno(SQL) != 0) {
		print("Baza de date nu s-a connectat.");
		SendRconCommand("hostname Mysql not connected.");
		SendRconCommand("password "SERVER_PASS);
		SetGameModeText("Error 404");
		return bool:true;
	}
	SendRconCommand("hostname "SERVER_NAME".ro - The server is loading...");
	SendRconCommand("password "SERVER_PASS);

	new areaid;

	printf("%s", encrypt("gamemode hpq123"));
	printf("%s", out_encrypt(encrypt("gamemode hpq123")));

    areaid = CreateDynamicSphereEx(1376.7445,189.0976,19.5742, 5.0), AreaType[areaid] = AREA_PNS, AreaID[areaid] = 0;
	areaid = CreateDynamicSphereEx(2312.6462,74.7662,26.2310, 5.0), AreaType[areaid] = AREA_PNS, AreaID[areaid] = 1;
	areaid = CreateDynamicSphere(1962.8041,1017.9992,992.4688, 3.0), AreaType[areaid] = AREA_ROULETTE;
    areaid = CreateDynamicRectangle(-806, -3000, 3000.015625, 461.03515625), AreaType[areaid] = AREA_ZONE, AreaID[areaid] = 1;
    areaid = CreateDynamicRectangle(-805.015625, 460, 3000.00390625, 3000), AreaType[areaid] = AREA_ZONE, AreaID[areaid] = 2;
    areaid = CreateDynamicRectangle(-3000, -3000, -806, 3000), AreaType[areaid] = AREA_ZONE, AreaID[areaid] = 3;

	for(new i=0;i<sizeof(g_VendingMachines);i++) {
		CreateDynamicObject(g_VendingMachines[i][E_MODEL], g_VendingMachines[i][E_X], g_VendingMachines[i][E_Y], g_VendingMachines[i][E_Z], g_VendingMachines[i][E_RX], g_VendingMachines[i][E_RY], g_VendingMachines[i][E_RZ], -1, -1, -1, 300.00);
		areaid = CreateDynamicSphere(g_VendingMachines[i][E_X], g_VendingMachines[i][E_Y], g_VendingMachines[i][E_Z], 5.0);
		AreaType[areaid] = AREA_VENDINGMACHINE;
		AreaID[areaid] = i;
	}
	Iter_Init(MyVehicles); Iter_Init(Rainbows); Iter_Init(BizzType); Iter_Init(Reports);
	Iter_Init(LoginQueue); Iter_Init(Spectacting); Iter_Init(Clans); Iter_Init(NearVehicle);
	Iter_Init(Licitatie); Iter_Init(ClanVehicles); Iter_Init(PlayerInVehicle); Iter_Init(Calls);
	Iter_Init(Freqs); Iter_Init(PlayerPaint); Iter_Init(Quests); Iter_Init(PlayerKeys); Iter_Init(VehicleKeys);
	Iter_Init(Friends[playerid]); Iter_Init(player_in_blocks);

	mysql_tquery(SQL, "UPDATE `cars` SET `idd` = '0'");
	mysql_tquery(SQL, "UPDATE `users` SET `Status` = '-1'");

	serverstarted = gettime();
	new quest = CreateDynamicActor(140, -2893.4814,-879.8143,5.3373,347.8632);
	ApplyDynamicActorAnimation(quest, "COP_AMBIENT", "Coplook_loop", 4.0, 0, 1, 1, 1, -1);

	new mos = CreateDynamicActor(160, -1638.9008,-2236.4907,31.4766,86.5390);
	ApplyDynamicActorAnimation(mos, "COP_AMBIENT", "Coplook_loop", 4.0, 0, 1, 1, 1, -1);
	Create3DTextLabel("Mos Vasile\nIa zi ba ioane!", -1, -1638.9008,-2236.4907,31.4766 + (1.15), 10.0);



	LoadColision();
	mysql_log();
	EnableStuntBonusForAll(0);
	UsePlayerPedAnims();
	AllowInteriorWeapons(1);
	ShowPlayerMarkers(2);
	ManualVehicleEngineAndLights();
	DisableInteriorEnterExits();
	LoadMaps();
	LoadTextDraws();
	LoadRouletta();

	new tmphour, tmpminute, tmpsecond, year, month, day;
	gettime(tmphour, tmpminute, tmpsecond);
	getdate(year, month, day);
	FixHour();
	LoadPickUp();
	LoadLabls();
	LoadDatabase();
 	gString[0] = EOS;
 	format(gString, sizeof(gString), SERVER_NAME", %02d %s %d (%02d:%02d)", day, MonthNameEx[month-1], year, tmphour, tmpminute);
	SetGameModeText(gString);
	return bool:true;
}

LoadDatabase() {
	mysql_tquery(SQL, "SELECT * FROM `server`", "SQL_CacheServer", "");
	mysql_tquery(SQL, "SELECT * FROM `users`", "SQL_CheckPlayers", "");
 	mysql_format(SQL, gQuery, sizeof(gQuery), "SELECT * FROM `dsvehicle` WHERE `Price` > '0' AND `PremiumPoints` = '0' ORDER BY `dsvehicle`.`Price` ASC LIMIT %d", MAX_DS_VEHICLE);
 	mysql_tquery(SQL, gQuery, "SQL_LoadDealerShip", "");
  	mysql_format(SQL, gQuery, sizeof(gQuery), "SELECT * FROM `houses` LIMIT %d", MAX_HOUSES);
 	mysql_tquery(SQL, gQuery, "SQL_LoadHouses", "");
 	mysql_format(SQL, gQuery, sizeof(gQuery), "SELECT * FROM `bussines` LIMIT %d", MAX_BUSSINES);
 	mysql_tquery(SQL, gQuery, "SQL_LoadBussines", "");
 	mysql_format(SQL, gQuery, sizeof(gQuery), "SELECT * FROM `jobs` LIMIT %d", MAX_JOBS);
 	mysql_tquery(SQL, gQuery, "SQL_LoadJobs", "");
 	mysql_format(SQL, gQuery, sizeof(gQuery), "SELECT * FROM `factions` LIMIT %d", MAX_FACTIONS);
 	mysql_tquery(SQL, gQuery, "SQL_LoadFactions", "");
 	mysql_format(SQL, gQuery, sizeof(gQuery), "SELECT * FROM `safezone` LIMIT %d", MAX_SAFEZONE);
 	mysql_tquery(SQL, gQuery, "SQL_LoadSafezone", "");
 	mysql_format(SQL, gQuery, sizeof(gQuery), "SELECT * FROM `clans` LIMIT %d", MAX_CLANS);
 	mysql_tquery(SQL, gQuery, "SQL_LoadClans", "");
 	mysql_format(SQL, gQuery, sizeof(gQuery), "SELECT * FROM `svf` LIMIT %d", MAX_FACTIONS);
 	mysql_tquery(SQL, gQuery, "SQL_Load_ServerVehicleFaction", "");
 	mysql_format(SQL, gQuery, sizeof(gQuery), "SELECT * FROM `seif` LIMIT %d", MAX_FACTIONS);
 	mysql_tquery(SQL, gQuery, "SQL_LoadSeif", "");
 	mysql_tquery(SQL, "SELECT * FROM `clanvehicles`", "SQL_LoadClansVehicle");
 	mysql_tquery(SQL, "SELECT * FROM `turfs`", "SQL_LoadTurfs");
 	mysql_tquery(SQL, "SELECT * FROM `servervehicle`", "SQL_LoadSvVehicle", "");
 	mysql_tquery(SQL, "SELECT * FROM `users`", "ShowUsers");
 	mysql_tquery(SQL, "SELECT * FROM `atm`", "SQL_Cache_ATM");
 	mysql_tquery(SQL, "SELECT * FROM `commands`", "SQL_blockcommands");
 	//DB_LoadMarket();
}
function SQL_blockcommands() {
	printf("loading %d commands blocked!", cache_num_rows());
	if !cache_num_rows() *then
		return true;

	new i=-1, string:command[32];
	while(++i<cache_num_rows()) {
		cache_get_value_name(i, "name", command);
		PC_SetFlags(command, true);
	}
	return true;
}

function ShowUsers() return printf("[MySQL] loading %d users..", cache_num_rows());

function SQL_CacheServer() {
	new password[100];
	cache_get_value_name(0, "Name", ServerInfo_[sName]);
	cache_get_value_name(0, "Password", ServerInfo_[sPassword]);
	cache_get_value_name_int(0, "JobGoal", ServerInfo_[sJobGoal]);
	cache_get_value_name_int(0, "MaxJobGoal", ServerInfo_[sMaxJobGoal]);
	cache_get_value_name_int(0, "MaxPJobGoal", ServerInfo_[sMaxPJobGoal]);
	cache_get_value_name_int(0, "chapter", bpChapter);
	cache_get_value_name_int(0, "bpTime", bpTime);

	new systems[40];
	cache_get_value_name(0, "Systems", systems);
	sscanf(systems, "p<|>iiiiiiiiiiiiii", ServerInfo_[sSystem][0], ServerInfo_[sSystem][1], ServerInfo_[sSystem][2], ServerInfo_[sSystem][3], ServerInfo_[sSystem][4], ServerInfo_[sSystem][5], ServerInfo_[sSystem][6], ServerInfo_[sSystem][7], ServerInfo_[sSystem][8], ServerInfo_[sSystem][9], ServerInfo_[sSystem][10], ServerInfo_[sSystem][11], ServerInfo_[sSystem][12], ServerInfo_[sSystem][13]);
	format(password, 100, "password %s", ServerInfo_[sPassword]);
	SendRconCommand(password);
	gString[0] = EOS;
	format(gString, sizeof(gString), "hostname %s", ServerInfo_[sName]);
	SendRconCommand(gString);
	House_free();
	Bizz_free();
	if(ServerInfo_[sJobGoal] >= ServerInfo_[sMaxJobGoal]) {
		ServerInfo_[sJobGoal] = ServerInfo_[sMaxJobGoal];
		TextDrawSetString(GoalTD[6], "~g~completed..");
		updateJobGoal(0);
	}
	print(" -- Server loading succesfully --");
	return bool:true;
}

function SQL_CheckPlayers() return Registers = cache_num_rows();
stock GetTotalUsers() return Registers;

public OnGameModeExit() {	
	gQuery[0] = EOS;
	for(new i = 1; i <= SqlBussines; i++) {
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `bussines` SET `Balance`='%d' WHERE `ID`='%d'", BizzInfo[i][bBalance], BizzInfo[i][bID]);
		mysql_tquery(SQL, gQuery, "", "");
	}
	mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `server` SET `JobGoal` = '%i', `Systems`='%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d' WHERE `ID`='1' LIMIT 1", ServerInfo_[sJobGoal], ServerInfo_[sSystem][0], ServerInfo_[sSystem][1], ServerInfo_[sSystem][2], ServerInfo_[sSystem][3], ServerInfo_[sSystem][4], ServerInfo_[sSystem][5], ServerInfo_[sSystem][6], ServerInfo_[sSystem][7], ServerInfo_[sSystem][8], ServerInfo_[sSystem][9], ServerInfo_[sSystem][10], ServerInfo_[sSystem][11], ServerInfo_[sSystem][12], ServerInfo_[sSystem][13]);
	mysql_tquery(SQL, gQuery, "", "");
	mysql_tquery(SQL, "UPDATE `users` SET `Status` = '-1'");
	mysql_close(SQL);
	return bool:true;
}
public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ) {
	#if defined gm_debug
		SCMf(playerid, COLOR_YELLOW, "debug OnPlayerWeaponShot %d %d %d", weaponid, hittype, hitid);
	#endif
	
	new wWap[30];
	switch(hittype) {
		case BULLET_HIT_TYPE_VEHICLE: {
			if(JobCar[hitid]) {
				SetPlayerArmedWeapon(playerid, 0);
				SCM(playerid, COLOR_RED, "Nu poti face DM pe vehiculele de la job."); 
				return true;
			}
			foreach(new i : Spectacting[playerid]) {
				GetWeaponName(weaponid, wWap, 30);
				SCMf(i, COLOR_PINK, "DMG: %s did damage to vehicle %d using weapon %s.", GetName(playerid), hitid, wWap);
			}
		}
		case BULLET_HIT_TYPE_PLAYER: {
			foreach(new i : Spectacting[playerid]) {
				GetWeaponName(weaponid, wWap, 30);
				SCMf(i, COLOR_PINK, "DMG: %s did damage to player %d using weapon %s.", GetName(playerid), hitid, wWap);
			}
		}
	} 
	return bool:true;
}

std::WeaponFrist(const weaponid) {
	switch(weaponid) {
		case 0..8, 10..15, 40, 44, 45: return bool:true;
	}
	return bool:false;
}
public OnPlayerRequestClass(playerid, classid) {
	#if defined gm_debug 
		SCMf(playerid, COLOR_YELLOW, "class id %d", classid);
	#endif
	return !IsPlayerLogged(playerid)?(1):SpawnPlayer(playerid);
}
public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger) {
	#if defined gm_debug
		SCMf(playerid, COLOR_YELLOW, "callback OnPlayerEnterVehicle %d %d", vehicleid, ispassenger);
	#endif
	ResetPlayerVendingMachineData(playerid);
	if(RobBackpack[playerid])
		return SCM(playerid, COLOR_GREY, "Pune bani in vehicul apasand tasta Y pentru a intra."), ClearAnimations(playerid);
	
	if(!ispassenger) {
		switch(GetVehicleModel(vehicleid)) {
			case 417, 425, 447, 460, 464, 465, 469, 476, 487, 488, 497, 501, 511, 512, 513, 519, 520, 548, 553, 563, 577, 592, 593: {
				if(PlayerInfo[playerid][pFlyLicense] < gettime() && PlayerVar[playerid][IsLession] == -1) {
					SCM(playerid, COLOR_GREY, "Nu ai licenta de fly.");
					RemovePlayerFromVehicle(playerid);
					return true;
				}
			}
			case 430, 446, 452, 453, 454, 472, 473, 484, 493, 595: {
				if(PlayerInfo[playerid][pBoatLicense] < gettime() && PlayerVar[playerid][IsLession] == -1) {
					SCM(playerid, COLOR_GREY, "Nu ai licenta de barca.");
					RemovePlayerFromVehicle(playerid);
					return true;
				}
			}
			case 481, 509, 510, 462: {}
			default: {
				if(PlayerInfo[playerid][pDriveLicense] < gettime() && !PlayerVar[playerid][IsExam]) {
					SCM(playerid, COLOR_GREY, "Nu ai licenta de condus.");
					RemovePlayerFromVehicle(playerid);
					return true;
				}
			}
		}
		if(JobCar[vehicleid] && JobCar[vehicleid] != PlayerInfo[playerid][pJob]) {
			format(gString, 100, "Nu ai jobul %s.", JobInfo[PlayerInfo[playerid][pJob] - 1][jName]);
			SCM(playerid, COLOR_GREY, gString);
			ClearAnimations(playerid);
			return bool:true;
		}
		if(PlayerInfo[playerid][pMember] != ServerVehicle[vehicleid][vFaction] && ServerVehicle[vehicleid][vFaction]) {
			ClearAnimations(playerid);
			gString[0] = EOS;
			format(gString, 100, "Do not take part in the %s faction.", FactionInfo_[ServerVehicle[vehicleid][vFaction]-1][fName]);
			SCM(playerid, COLOR_GREY, gString);
			return bool:true;
		}
	}
	return bool:true;
}
public OnRconLoginAttempt(ip[], password[], success) return BlockIpAddress(ip, 60 * 1000);

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ) {
	if(!IsAdmin(playerid, 1)) return bool:true;
	if(PlayerVar[playerid][JobWork]) return true;
    return GetPlayerState(playerid) != PLAYER_STATE_DRIVER ? SetPlayerPos(playerid, fX, fY, fZ+5) : SetVehiclePos(GetPlayerVehicleID(playerid), fX, fY, fZ+5);
}
public OnPlayerConnect(playerid) {
	if(RestartCount != 0)
		return SCM(playerid, COLOR_LGREEN, "Nu te poti conecta in timpul restartului.."), KickEx(playerid), 1;

	SetPlayerWorldBounds(playerid, 3579.6602, -4298.7334, 3971.8860, -3909.0200);
	SetPlayerScore(playerid, 0);
	ResetVariable(playerid);
	SetPlayerDrunkLevel(playerid, 2000);
	SetPlayerColor(playerid, COLOR_GREY);
	GetPlayerName(playerid, PlayerInfo[playerid][pName], MAX_PLAYER_NAME);
	if checkReclame(playerid, PlayerInfo[playerid][pName]) *then 
		return SCM(playerid, COLOR_LGREEN, "Nu te poti connecta cu acest nume!"), KickEx(playerid);


	foreach(new i : _Player<ADMIN>) if(PlayerInfo[i][pTog][8]) SendDeathMessageToPlayer(i, INVALID_PLAYER_ID, playerid, 200);

	GetPlayerIp(playerid, playerIP[playerid], 16);
	SetGVarInt(playerIP[playerid], GetGVarInt(playerIP[playerid]) + 1);
	if GetGVarInt(playerIP[playerid]) >= 3 *then BlockIpAddress(playerIP[playerid], 10 * 60000);
	TogglePlayerControllable(playerid, false);
	TogglePlayerSpectating(playerid, true);
	EnablePlayerCameraTarget(playerid, true);
	if(Iter_Count(LoginQueue[1]) >= MAX_LOGIN_WAITING) {
		SCM(playerid, COLOR_SERVER, "SERVER SUPRA SOLICITAT:");
		SCM(playerid, COLOR_SERVER, "Te rog revino peste 30 de secunde.");
		KickEx(playerid);
		return bool:true;
	}
	PlayerVar[playerid][IsLogged] = false;
	SetPlayerWorldBounds(playerid, 3579.6602, -4298.7334, 3971.8860, -3909.0200);
	
    Iter_Add(LoginQueue[1], playerid);
	format(gString, 100, "%d players in queue (eta: 06 sec)~n~your position: 1", Iter_Count(LoginQueue[1]));
	ShowInfo(playerid, "~y~login queue", gString, 2);
	if(Iter_Count(LoginQueue[0]) < MAX_LOGIN) {
		PlayerVar[playerid][ServerTimer][0] = 1;
		PlayerVar[playerid][ServerTimer][1] = 6;
		Iter_Add(LoginQueue[0], playerid);
	}
	return bool:true;
}
public OnPlayerEnterRaceCheckpoint(playerid) {
	#if defined gm_debug
		SCM(playerid, COLOR_YELLOW, "debug OnPlayerEnterRaceCheckpoint");
	#endif
	if(PlayerVar[playerid][IsExam]) return SetExamCheckpoint(playerid);
	switch(CP[playerid]) {
		case CP_TRASHCP: DisablePlayerRaceCheckpoint(playerid), CP[playerid] = 0;
		case CP_FINISHTRASH: {
			checkBP(playerid, 7, 300, PlayerVar[playerid][Trash]);
			GiveJobMoney(playerid, RandomEx(PlayerVar[playerid][Trash] * 320, (PlayerVar[playerid][Trash] * 320) + 1000), 1, 50, 100), CancelJob(playerid, true), DisablePlayerRaceCheckpoint(playerid), CP[playerid] = 0;
		}
		case CP_TRUCKSTART: {
			if(!IsPlayerInVehicle(playerid, PlayerVar[playerid][JobVehicle]))
				return bool:true;

			ShowPlayerTrucker(playerid);
		}
		case DIALOG_FINISHTRUCK: {
			if(!IsPlayerInVehicle(playerid, PlayerVar[playerid][JobVehicle]))
				return bool:true;

			if(!IsTrailerAttachedToVehicle(PlayerVar[playerid][JobVehicle]))
				return SCM(playerid, COLOR_GREY, "Nu ai marfa la tine.");

			checkBP(playerid, 33, 300);

			DestroyVehicleEx(PlayerVar[playerid][Trailer]);
			PlayerVar[playerid][Trailer] = 0;
			GiveJobMoney(playerid, PlayerVar[playerid][MoneyReacvheid], 1, 20, 30);
			new x = PlayerVar[playerid][LeftJob];
			SetPlayerRaceCheckpointEx(playerid, CP_TRUCKSTART, 1, TruckerNext[x][0], TruckerNext[x][1], TruckerNext[x][2], 0.0, 0.0, 0.0, 5.0);
		}
	}
	return bool:true;
}
public OnPlayerEnterCheckpoint(playerid) {
	switch(CP[playerid]) {
		case CP_DMV: SCM(playerid, COLOR_GREY, "Pentru a incepe examenul auto foloseste comanda /exam."), DisablePlayerCheckpoint(playerid), CP[playerid] = DISABLE_CHECKPOINT;
		case CP_STORE: {
			SCM(playerid, COLOR_WHITE, "Apasa tasta F pentru a intra in business.");
			DisablePlayerCheckpoint(playerid);
			CP[playerid] = DISABLE_CHECKPOINT;
		}
		case CP_CLOTHES: {
			SCM(playerid, COLOR_WHITE, "Apasa tasta F pentru a intra in business.");
			DisablePlayerCheckpoint(playerid);
			CP[playerid] = DISABLE_CHECKPOINT;
		}
		case CP_WOOD: {
			DisablePlayerCheckpoint(playerid);
			CP[playerid] = DISABLE_CHECKPOINT;
			GameTextForPlayer(playerid, "~w~cutting...", 7000, 3);
			SetPlayerArmedWeapon(playerid, WEAPON_CHAINSAW);
			OnePlayAnim(playerid,"CHAINSAW","CSAW_G",4.1,1,0,1,1,0);
			SetTimerEx("Cutting", 7000, false, "i", playerid);
		}
		case CP_PIZZA1: {
			SetPlayerCheckpointEx(playerid, CP_PIZZA2, 377.1685,-177.9711,1000.6328, 3.0);
			SCM(playerid, COLOR_WHITE, "Get into pizza business");
		}
		case CP_PIZZA2: {
			new Float:x,Float:y,Float:z;
			GetVehiclePos(PlayerVar[playerid][JobVehicle], x, y, z);
			SetPlayerCheckpointEx(playerid, CP_PIZZA3, x, y, z, 4.0);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
			SetPlayerAttachedObject(playerid, 2, 1582, 6, 0.0960, 0.0399, -0.1580, -112.5999, 169.4999, -168.8000, 0.7189, 0.8870, 1.0000);
			SetPlayerAttachedObject(playerid, 3, 1582, 6, 0.0939, 0.0260, -0.1430, -114.4999, -12.0000, -10.7000, 0.6920, 0.8810, 1.0000);
		}
		case CP_PIZZA3: {
			if(jobDeelay[playerid]-gettime()>0) return SCMf(playerid, COLOR_WHITE, "* Asteapta %d secunde pentru a livra pizza!", jobDeelay[playerid]-gettime());
			jobDeelay[playerid]=gettime()+30;
			RemovePlayerAttachedObject(playerid, 2);
			RemovePlayerAttachedObject(playerid, 3);
			SetPlayerSpecialAction(playerid, 0);
			DisablePlayerCheckpoint(playerid);
			JobTime[playerid] = gettime();
			CP[playerid] = 0;
			for(new h=0;h<4;h++) {
				new house = random(SqlHouses-1)+1;
				PizzaHouse[playerid][h] = house;
				SetPlayerMapIcon(playerid, h+60, HouseInfo[house][hEnterPos][0], HouseInfo[house][hEnterPos][1], HouseInfo[house][hEnterPos][2], 29, -1, MAPICON_GLOBAL);
			}
			PizzaObject[playerid][0] = CreateDynamicObject(2814, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
			AttachDynamicObjectToVehicle(PizzaObject[playerid][0], PlayerVar[playerid][JobVehicle], -0.004999, -0.924999, 0.474999, 0.000000, -5.024999, 1.005000); //Object Model: 2814 | pizza
			PizzaObject[playerid][1] = CreateDynamicObject(2814, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
			AttachDynamicObjectToVehicle(PizzaObject[playerid][1], PlayerVar[playerid][JobVehicle], -0.004999, -0.929999, 0.559999, 0.000000, -4.019999, 0.000000); //Object Model: 2814 | pizza
			PizzaObject[playerid][2] = CreateDynamicObject(2814, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
			AttachDynamicObjectToVehicle(PizzaObject[playerid][2], PlayerVar[playerid][JobVehicle], -0.014999, -0.939999, 0.654999, 0.000000, 0.000000, 0.000000); //Object Model: 2814 | pizza
			PizzaObject[playerid][3] = CreateDynamicObject(2814, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
			AttachDynamicObjectToVehicle(PizzaObject[playerid][3], PlayerVar[playerid][JobVehicle], 0.000000, -0.929999, 0.729999, 0.000000, 0.000000, 0.000000); //Object Model: 2814 | pizza
		}
		case CP_FIND_PLAYER: {
			if(PlayerVar[playerid][HaveCalls] != -1) return true;
			new id = PlayerVar[playerid][HaveCalls], i = CallType[id];
			PlayerVar[playerid][Find] = -1;
			PlayerTextDrawHide(playerid, FindPTD[0]);
			PlayerTextDrawHide(playerid, FindPTD[1]);
			CP[playerid] = DISABLE_CHECKPOINT;
			DisablePlayerCheckpoint(playerid);

			PlayerVar[playerid][HaveCalls] = -1;
			CallServiceAccept[id][i] = -1;
			CallService[id][i] = false;
			CallType[id] = -1;
		}
		case CP_DRUGS: {
			GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~g~wait until you collect ~r~weed", 3000, 3);
			OnePlayAnim(playerid, "BOMBER", "BOM_Plant", 5.0, 0, 0, 0, 0, 0);
			if(drugCP[playerid] >= 5) {
				SCM(playerid, COLOR_WHITE, "{9F9FF1}(Job) {FFFFFF}Du-te in hambar si prepara drogurile.");
				CP[playerid] = DISABLE_CHECKPOINT;
				DisablePlayerCheckpoint(playerid);
				return bool:true;
			}
			new x = random(9);
			SetPlayerCheckpointEx(playerid, CP_DRUGS, WeedPos[x][0], WeedPos[x][1], WeedPos[x][2], 2.0);
			drugCP[playerid] ++;
		}
		case CP_MATS: {
			new j = PlayerInfo[playerid][pJob]-1;
			PlayerVar[playerid][Mats][0] = RandomEx(3000, 4000);
			PlayerVar[playerid][Mats][1] = RandomEx(2000, 3000) + (PlayerInfo[playerid][pJobSkill][j] * 333);
			ClearString();
			format(gString, 100, "Option\tAmount\nDoresc materiale pentru mine\t%d\nDoresc sa vand materialele\t$%s", PlayerVar[playerid][Mats][0], FormatNumber(PlayerVar[playerid][Mats][1]));
			ShowPlayerDialog(playerid, DIALOG_FMATS, DIALOG_STYLE_TABLIST_HEADERS, "Arms Dealer", gString, "Select", "Close");
			DisablePlayerCheckpoint(playerid);
			CP[playerid] = CP_NORMAL;
		}
		case CP_NORMAL: {
			DisablePlayerCheckpoint(playerid);
			CP[playerid] = 0;
			SCM(playerid, COLOR_WHITE, "You have reached your destination!");
		}
		case CP_JOB: {
			if(PizzaCP[playerid]==-1) return true;
			if(gettime()<JobTime[playerid]+20) return SCMf(playerid, COLOR_WHITE, "Asteapta %d secunde.", (JobTime[playerid]+20)-gettime());
			if(IsPlayerInAnyVehicle(playerid)) return true;
			if(!PlayerPizza[playerid]) return SCM(playerid, COLOR_WHITE, "Nu ai cutia cu pizza la tine!");
			SetPlayerSpecialAction(playerid, 0);
			RemovePlayerAttachedObject(playerid, 2);
			RemovePlayerAttachedObject(playerid, 3);
			RemovePlayerMapIcon(playerid, PizzaCP[playerid]+60);
			CP[playerid] = 0;
			DisablePlayerCheckpoint(playerid); CP[playerid] = 0;
			new x = PizzaCP[playerid], job = PlayerInfo[playerid][pJob]-1;
			PizzaCP[playerid] = -1;
			PizzaHouse[playerid][x] = 0;
			PlayerPizza[playerid] = false;
			PlayerVar[playerid][MoneyReacvheid] = RandomEx(900,1300) + (PlayerInfo[playerid][pJobSkill][job] * 533);
			GiveJobMoney(playerid, PlayerVar[playerid][MoneyReacvheid], 1, 10, 20);
			SCMf(playerid, COLOR_WHITE, "There are %d pizzas left to deliver.", GetPlayerPizza(playerid));
			CheckPlayerMission(playerid, 10, 1);
			CheckPlayerMission(playerid, 11, 1);
			JobTime[playerid] = gettime();
			if(!GetPlayerPizza(playerid)) SCM(playerid, COLOR_YELLOW, "To continue go to the checkpoint on the minimap to receive pizza for delivery"), SetPlayerCheckpointEx(playerid, CP_PIZZA1, 2105.4749,-1806.3682,13.5547, 3.0);
		}
		case CP_ROB: {
			if(!RobBackpack[playerid])
				return SCM(playerid, COLOR_LGREEN, "Nu ai sacu cu bani la tine.");

			RobBackpack[playerid] = false;
			RobStatus[playerid] = false;
			RobTimer[playerid] = false;
			RemovePlayerAttachedObject(playerid, 0);
			RobVehicle[playerid] = INVALID_VEHICLE_ID;
			new money = RandomEx(30000, 45000);
			GivePlayerCash(playerid, money);
			gString[0] = EOS;
			format(gString, 100, "you successfully completed the rob~n~you received $%s!", FormatNumber(money));
			ShowPlayerInfoEx(playerid, 10, gString);
			DisablePlayerCheckpoint(playerid);
			SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
			OnePlayAnim(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0);
			CP[playerid] = DISABLE_CHECKPOINT;
		}
	}
	return bool:true;
}

save_tog(playerid) {
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `Tog`='%d %d %d %d %d %d %d %d %d' WHERE `id`='%d'", PlayerInfo[playerid][pTog][0], PlayerInfo[playerid][pTog][1], PlayerInfo[playerid][pTog][2], PlayerInfo[playerid][pTog][3], PlayerInfo[playerid][pTog][4], PlayerInfo[playerid][pTog][5], PlayerInfo[playerid][pTog][6], PlayerInfo[playerid][pTog][7], PlayerInfo[playerid][pTog][8], PlayerInfo[playerid][pSQLID]);
	mysql_tquery(SQL, gQuery, "", "");
}

save_hud(playerid) {
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `Hud`='%d|%d|%d|%d' WHERE `id`='%d'", PlayerInfo[playerid][pHud][0], PlayerInfo[playerid][pHud][1], PlayerInfo[playerid][pHud][2], PlayerInfo[playerid][pHud][3], PlayerInfo[playerid][pSQLID]);
	mysql_tquery(SQL, gQuery, "", "");
}

function SQL_LoadAdmins(playerid) {
	new name[MAX_PLAYER_NAME], admin, laston[50], totalreport, todayreport, id, szDialog[5000];
	gString[0] = EOS;
	strcat(szDialog, "Name\tStatus\tRaport\n");
	new i=-1,j=cache_num_rows();
	while(++i!=j) {
 		cache_get_value_name_int(i, "Admin", admin);
		cache_get_value_name_int(i, "TotalReports", totalreport);
		cache_get_value_name_int(i, "TodayReports", todayreport);
		cache_get_value_name_int(i, "Status", id);
		cache_get_value_name(i, "name", name);
		cache_get_value_name(i, "LastOn", laston);
		if(id != -1) format(laston, 50, "Online (%d)", id);
		
		format(gString, 150, "(%d) %s\t%s\t%d on this week / %d total\n", admin, name, laston, todayreport, totalreport);
		strcat(szDialog, gString);			
	}
	format(gString, 25, "{FFEE00}Admins (%d/%d)", Iter_Count(_Player<ADMIN>), cache_num_rows());
	ShowPlayerDialog(playerid, DIALOG_ONLINE, DIALOG_STYLE_TABLIST_HEADERS, gString, szDialog, "Close", "");
	return bool:true;
}

function SQL_LoadHelpers(playerid) {
	new name[MAX_PLAYER_NAME], helper, laston[50], totalreport, todayreport, id, szDialog[5000];
	gString[0] = EOS;
	strcat(szDialog, "Name\tStatus\tRaport\n");
	new i=-1,j=cache_num_rows();
	while(++i!=j) {
		cache_get_value_name_int(i, "Admin", helper);
		cache_get_value_name_int(i, "TotalReports", totalreport);
		cache_get_value_name_int(i, "TodayReports", todayreport);
		cache_get_value_name_int(i, "Status", id);
		cache_get_value_name(i, "name", name);
		cache_get_value_name(i, "LastOn", laston);

		if(id != -1) format(laston, 50, "Online (%d)", id);
		
		format(gString, 150, "(%d) %s\t%s\t%d on this week / %d total\n", helper, name, laston, todayreport, totalreport);
		strcat(szDialog, gString);			
	}
	format(gString, 25, "{FFEE00}Helpers (%d/%d)", Iter_Count(_Player<HELPER>), cache_num_rows());
	ShowPlayerDialog(playerid, DIALOG_ONLINE, DIALOG_STYLE_TABLIST_HEADERS, gString, szDialog, "Close", "");
	return bool:true;
}
public OnVehicleRespray(playerid, vehicleid, color1, color2) {
	#if defined gm_debug
		SCMf(playerid, COLOR_YELLOW, "debug OnVehicleRespray %d %d %d", vehicleid, color1, color2);
	#endif
	ChangeVehicleColor(vehicleid, VehicleInfo[vehicleid][vColor][0], VehicleInfo[vehicleid][vColor][1]);
	SetVehicleHealth(vehicleid, 999);
	return bool:true;
}

function SQL_CacheClan(playerid, i) {
	new id = cache_insert_id();

	ClanInfo[i][clID] = id;
	PlayerInfo[playerid][pClan] = id;
	PlayerInfo[playerid][pClanRank] = 7;
	PlayerInfo[playerid][pClanTag] = 2;
	GetClan[id] = i;
	Iter_Add(Clans[i], playerid);
	UpdateVar(playerid, "Clan", cache_insert_id());
	UpdateVar(playerid, "ClanRank", 7);
	UpdateVar(playerid, "ClanTag", 2);

	SQL_clans++;
	return bool:true;
}
function SQL_ReadEmails(playerid, id) {
	new text[128], date[30];
	cache_get_value_name(0, "Text", text);
	cache_get_value_name(0, "Date", date);

	format(gString, sizeof(gString), "\n%s\n\nDate: %s", text, date);
	ShowPlayerDialog(playerid, DIALOG_EMAILREAD, DIALOG_STYLE_MSGBOX, "Email Read:", gString, "Back", "Close");

	mysql_format(SQL, gQuery, 100, "UPDATE `emails` SET `Activ`='0' WHERE `ID`='%d'", id);
	mysql_tquery(SQL, gQuery);
	return bool:true;
}

function SQL_cacheclans(playerid) {
	new string[1000], name[MAX_PLAYER_NAME], rank, money, warns, days, id;
	strcat(string, "#. Name\tRank\tClan Warns\tClan Days\n");
	new i=-1,j=cache_num_rows();
	while(++i!=j) {
		cache_get_value_name(i, "name", name);
		cache_get_value_name_int(i, "ClanRank", rank);
		cache_get_value_name_int(i, "ClanMoney", money);
		cache_get_value_name_int(i, "ClanWarns", warns);
		cache_get_value_name_int(i, "ClanDays", days);
		cache_get_value_name_int(i, "Status", id);
		format(PlayerSelected[playerid][i], MAX_PLAYER_NAME, name);

		days = gettime() - days;

		format(string, sizeof(string), "%s%d. %s{FFFFFF}%s\t%d - $%s\t%d/3\t%d\n", string, i+1, id != -1 ? ("{00FF00}+ ") : ("{FF0000}- "), name, rank, FormatNumber(money), warns, days/86400);
	}
	ShowPlayerDialog(playerid, DIALOG_CLANMEMBERS, DIALOG_STYLE_TABLIST_HEADERS, "Clan members", string, "Ok", "back");
	return bool:true;
}

function SQL_CheckMembers(playerid) {
	cache_get_value_name_int(0, "Rank", EditPlayer[playerid][0]);
	cache_get_value_name_int(0, "Status", EditPlayer[playerid][1]);
	cache_get_value_name_int(0, "id", EditPlayer[playerid][2]);
	cache_get_value_name_int(0, "FWarn", EditPlayer[playerid][3]);
	cache_get_value_name_int(0, "Member", EditPlayer[playerid][4]);
	cache_get_value_name_int(0, "Days", EditPlayer[playerid][5]);

	EditPlayer[playerid][5] = (gettime()-EditPlayer[playerid][5])/86400;

	if(EditPlayer[playerid][2] == PlayerInfo[playerid][pSQLID])
		return SCM(playerid, COLOR_GREY, "Nu poti configura pe tine.");

	if(EditPlayer[playerid][0] == 7) 
		return SCM(playerid, COLOR_LGREEN, "Nu se poate modifica ceva unui lider!");

	if(EditPlayer[playerid][0] == PlayerInfo[playerid][pRank]) 
		return SCM(playerid, COLOR_LGREEN, "Nu poti configura acel player.");

	ClearString();
	format(gString, 50, "Member: %s", pNames[playerid]);
	ShowPlayerDialog(playerid, DIALOG_MEMBERSEDIT, DIALOG_STYLE_LIST, gString, "Rank\nFaction warn\nUn faction warn\nUninvite fara FP\nUninvite cu FP", "Select", "Close");
	return bool:true;
}
function SQL_CheckPlayerClan(playerid) {
	cache_get_value_name_int(0, "ClanRank", EditPlayer[playerid][0]);
	cache_get_value_name_int(0, "Status", EditPlayer[playerid][1]);
	cache_get_value_name_int(0, "id", EditPlayer[playerid][2]);
	cache_get_value_name_int(0, "ClanWarns", EditPlayer[playerid][3]);
	cache_get_value_name_int(0, "Clan", EditPlayer[playerid][4]);

	if(EditPlayer[playerid][2] == PlayerInfo[playerid][pSQLID])
		return SCM(playerid, COLOR_GREY, "Nu poti configura pe tine.");

	if(EditPlayer[playerid][0] == 7) 
		return SCM(playerid, COLOR_LGREEN, "Nu se poate modifica ceva unui lider!");

	if(EditPlayer[playerid][0] == PlayerInfo[playerid][pClanRank]) 
		return SCM(playerid, COLOR_LGREEN, "Nu poti configura acel player.");

	ClearString();
	format(gString, 50, "Member: %s", pNames[playerid]);
	ShowPlayerDialog(playerid, DIALOG_CLANEDIT, DIALOG_STYLE_LIST, gString, "Rank\nClan warn\nUn Clan warn\nUninvite", "Select", "Close");
	return bool:true;
}
function SQL_cacheselectclan(playerid) {
	if(cache_num_rows()) return SCM(playerid, COLOR_LIGHTRED, "Exista deja un clan cu numele sau tagu introdus.");
	
	PlayerInfo[playerid][pPremiumPoints] -= 500;
	UpdateVar(playerid, "PremiumPoints", PlayerInfo[playerid][pPremiumPoints]);

	new i = SQL_clans;

	format(ClanInfo[i][clName], 25, PlayerVar[playerid][ClanName]);
	format(ClanInfo[i][clTag], 10, pNames[playerid]);

	ClanInfo[i][clSafebox] = 0;
	ClanInfo[i][clMembers] = 25;
	ClanInfo[i][clPremiumPoints] = 0;
	ClanInfo[i][clTime] = 30;
	ClanInfo[i][clColor] = "FFFFFF";

	format(ClanInfo[i][clRankName1], 25, "Rank 1");
	format(ClanInfo[i][clRankName2], 25, "Rank 2");
	format(ClanInfo[i][clRankName3], 25, "Rank 3");
	format(ClanInfo[i][clRankName4], 25, "Rank 4");
	format(ClanInfo[i][clRankName5], 25, "Rank 5");
	format(ClanInfo[i][clRankName6], 25, "Rank 6");
	format(ClanInfo[i][clRankName7], 25, "Rank 7");

	format(ClanInfo[i][clRankColor1], 7, "FFFFFF");
	format(ClanInfo[i][clRankColor2], 7, "FFFFFF");
	format(ClanInfo[i][clRankColor3], 7, "FFFFFF");
	format(ClanInfo[i][clRankColor4], 7, "FFFFFF");
	format(ClanInfo[i][clRankColor5], 7, "FFFFFF");
	format(ClanInfo[i][clRankColor6], 7, "FFFFFF");
	format(ClanInfo[i][clRankColor7], 7, "FFFFFF");

	UpdateVar(playerid, "ClanDays", gettime());
	ClanInfo[i][clChatColor] = "FFFFFF";

	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, 100, "INSERT INTO `clans` (`Name`, `Tag`) VALUES ('%s', '%s')", PlayerVar[playerid][ClanName], pNames[playerid]);
	mysql_tquery(SQL, gQuery, "SQL_CacheClan", "ii", playerid, i);

	format(gString, 100, "\nCongratulations! You bought a clan (Name: %s | Tag: %s)\n", PlayerVar[playerid][ClanName], pNames[playerid]);
	ShowPlayerDialog(playerid, DIALOG_ONLINE, DIALOG_STYLE_MSGBOX, "Buy clan. Step 3:", gString, "Thanks", "");
	return bool:true;
}
function SQL_CheckPhone(playerid, phone) {
	if(cache_num_rows()) return SCM(playerid, COLOR_GREY, "Acest numar de telefon este luat de alt jucator.");

	if(PlayerInfo[playerid][pPhone] != 0) PhoneFinder[PlayerInfo[playerid][pPhone]] = -1;

	PlayerInfo[playerid][pPhone] = phone;
	UpdateVar(playerid, "Phone", PlayerInfo[playerid][pPhone]);

	PhoneFinder[phone] = playerid;

	PlayerInfo[playerid][pPremiumPoints] -= 100;
	UpdateVar(playerid, "PremiumPoints", PlayerInfo[playerid][pPremiumPoints]);

	format(gString, 130, "[SHOP] {FFFFFF}Felicitari! Ti-ai achizitionat un iPhone cu numarul %d pentru suma de 100 premium points.", PlayerInfo[playerid][pPhone]);
	SCM(playerid, COLOR_GM, gString);
	return bool:true;
}

public OnPlayerEditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz) {
	if(response == EDIT_RESPONSE_CANCEL) {
		switch(EditObjectID[playerid]) {
			case EDIT_VIPTEXT: {
				if(CarInfo[EditObjectIDe[playerid]][cSpawned]==INVALID_VEHICLE) return DestroyDynamicObject(CarInfo[EditObjectIDe[playerid]][cObjectText]);
				DestroyDynamicObject(CarInfo[EditObjectIDe[playerid]][cObjectText]);
				SCM(playerid, COLOR_WHITE, "Ai anulat editarea.");
				AttachVipText(EditObjectIDe[playerid]);
				EditObjectID[playerid] = INVALID_EDIT;
				return true;
			}
			case EDIT_ATM: {
				DestroyDynamicObject(AtmInfo[EditObjectIDe[playerid]][at_Obj]);
				SCM(playerid, COLOR_WHITE, "Ai anulat crearea atm-ului.");
				EditObjectID[playerid] = INVALID_EDIT;
				return true;
			}
			case EDIT_COMPUTER: {
				SCM(playerid, -1, "Ai anulat cumpararea laptop-ului.");
				EditObjectID[playerid] = INVALID_EDIT;
				DestroyDynamicObject(objectid);
			}
			case EDIT_COMPUTER_AL: {
				SCM(playerid, -1, "Ai anulat modificarea!");
				EditObjectID[playerid] = INVALID_EDIT;
			}
		}
	}
	if(response == EDIT_RESPONSE_FINAL) {
		switch(EditObjectID[playerid]) {
			case EDIT_VIPTEXT: {
				if(CarInfo[EditObjectIDe[playerid]][cSpawned]==INVALID_VEHICLE) return DestroyDynamicObject(CarInfo[EditObjectIDe[playerid]][cObjectText]);
				new 
					idd = EditObjectIDe[playerid],
					Float: d_Off_X, Float: d_Off_Y, Float: d_Off_Z,
				 	Float: f_Off_X, Float: f_Off_Y, 
					Float: vPosX, Float: vPosY, Float: vPosZ, Float: vPosA;

				GetVehiclePos(CarInfo[idd][cSpawned], vPosX, vPosY, vPosZ);
				GetVehicleZAngle(CarInfo[idd][cSpawned], vPosA); 

				d_Off_X = x - vPosX; 
				d_Off_Y = y - vPosY;
				d_Off_Z = z - vPosZ;

				f_Off_X = d_Off_X * floatcos(vPosA, degrees) + d_Off_Y * floatsin(vPosA, degrees); 
				f_Off_Y = -d_Off_X * floatsin(vPosA, degrees) + d_Off_Y * floatcos(vPosA, degrees); 

				CarInfo[idd][cVipPos][0] = f_Off_X;
				CarInfo[idd][cVipPos][1] = f_Off_Y;
				CarInfo[idd][cVipPos][2] = d_Off_Z;
				CarInfo[idd][cVipPos][3] = rx;
				CarInfo[idd][cVipPos][4] = ry;
				CarInfo[idd][cVipPos][5] = (rz - vPosA);

				DestroyDynamicObject(CarInfo[idd][cObjectText]);

				gString[0] = EOS;
				format(gString, sizeof(gString), "{%s}%s", CarInfo[idd][cVipColor], CarInfo[idd][cText]); 
				CarInfo[idd][cObjectText] = CreateDynamicObject(19327,0,0,-1000,0,0,0,100);

				SetDynamicObjectMaterialText(CarInfo[idd][cObjectText], 0, gString, OBJECT_MATERIAL_SIZE_256x128, "Arial", 30, 1, 0xFFFFFFFF, 0, 1);
				AttachDynamicObjectToVehicle(CarInfo[idd][cObjectText], CarInfo[idd][cSpawned], f_Off_X, f_Off_Y, d_Off_Z, rx, ry, (rz - vPosA));
				Streamer_Update(playerid);
				gQuery[0] = EOS;
				mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `cars` SET `VipPos`='%f|%f|%f|%f|%f|%f' WHERE `ID`='%d'", f_Off_X, f_Off_Y, d_Off_Z, rx, ry, (rz - vPosA), CarInfo[idd][cID]);
				mysql_tquery(SQL, gQuery, "", "");
				EditObjectIDe[playerid] = -1;
				EditObjectID[playerid] = INVALID_EDIT;
				SCM(playerid, COLOR_WHITE, "Edit vip pos: coordonatele au fost modificate.");
			}
			case EDIT_ATM: {
				gString[0] = EOS;
				new i = EditObjectIDe[playerid];
				SCM(playerid, -1, "ATM place successfully.");
				format(gString, 100, "ATM %d\nWithdraw your cash here!\nPress F to use this ATM.", i+1);
				DestroyDynamicObject(AtmInfo[i][at_Obj]);
				CreateDynamicObject(19324, x, y, z, rx, ry, rz);
				AtmInfo[i][at_Lab] = Create3DTextLabel(gString, -1, x, y, z, 25.0);
				AtmInfo[i][at_ID] = i+1;
				AtmInfo[i][at_X] = x, AtmInfo[i][at_Y] = y, AtmInfo[i][at_Z] = z;
				AtmInfo[i][at_RX] = rx, AtmInfo[i][at_RY] = ry, AtmInfo[i][at_RZ] = rz;
				gQuery[0] = EOS;
				mysql_format(SQL, gQuery, sizeof gQuery, "INSERT INTO `atm` (`X`, `Y`, `Z`, `RX`, `RY`, `RZ`) VALUES ('%f', '%f', '%f', '%f', '%f', '%f')",
					x, y, z, rx, ry, rz);
				mysql_tquery(SQL, gQuery);
				i = CreateDynamicSphere(x, y, z, 3.0);
				EditObjectIDe[playerid] = -1;
				EditObjectID[playerid] = INVALID_EDIT;
				AreaType[i] = AREA_ATM;
				SQL_ATM++;
			}
			case EDIT_COMPUTER: {
				DestroyDynamicObject(objectid);

				if(PlayerInfo[playerid][pPremiumPoints] < 150)
					return SCM(playerid, COLOR_LGREEN, "Eroare: Nu ai suficiente puncte premium!");

				new i = EditObjectIDe[playerid];
				HouseInfo[i][hComputer] = true;
				PlayerInfo[playerid][pPremiumPoints] -=150;
				UpdateVar(playerid, "PremiumPoints", PlayerInfo[playerid][pPremiumPoints]);
				new areaid = CreateDynamicSphere(x,y,z, 1.5,HouseInfo[i][hVirtualWorld]); AreaType[areaid] = AREA_PC, AreaID[areaid] = i;
				HouseInfo[i][hObjPC] = CreateDynamicObject(19893, HouseInfo[i][hPCx] = x, HouseInfo[i][hPCy] = y, HouseInfo[i][hPCz] = z, 0.0, 0.0, HouseInfo[i][hPCr] = rz, HouseInfo[i][hVirtualWorld], -1, -1, 300.00);
				SetDynamicObjectMaterial(HouseInfo[i][hObjPC], 1, 8419, "vgsbldng1", "black32", 0xFFFFFFFF);
				SCM(playerid, COLOR_LGREEN, "Ai achizitionat cu succes un laptop! pentru suma de 150 puncte premium.");
				mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `houses` SET `xPC` = '%f', `yPC` = '%f', `zPC` = '%f', `rPC` = '%f', `PC` = '1' WHERE `ID` = '%i'", x, y, z, rz, HouseInfo[i][hID]);
				mysql_tquery(SQL, gQuery);
			}
			case EDIT_COMPUTER_AL: {
				DestroyDynamicObject(objectid);

				new i = EditObjectIDe[playerid];
				new areaid = CreateDynamicSphere(x,y,z, 1.5,HouseInfo[i][hVirtualWorld]); AreaType[areaid] = AREA_PC, AreaID[areaid] = i;
				HouseInfo[i][hObjPC] = CreateDynamicObject(19893, HouseInfo[i][hPCx] = x, HouseInfo[i][hPCy] = y, HouseInfo[i][hPCz] = z, 0.0, 0.0, HouseInfo[i][hPCr] = rz, HouseInfo[i][hVirtualWorld], -1, -1, 300.00);
				SetDynamicObjectMaterial(HouseInfo[i][hObjPC], 1, 8419, "vgsbldng1", "black32", 0xFFFFFFFF);
				SCM(playerid, COLOR_LGREEN, "Ai editat laptop-ul cu success!");
				mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `houses` SET `xPC` = '%f', `yPC` = '%f', `zPC` = '%f', `rPC` = '%f' WHERE `ID` = '%i'", x, y, z, rz, HouseInfo[i][hID]);
				mysql_tquery(SQL, gQuery);
			}
		}
	}
	return true;
}
function SQL_Insert_ID(i) return MarketInfo[i][m_ID] = cache_insert_id();

static const CallsName[3][15] = {
	{"Taximetristul"}, {"Paramedicul"}, {"Instructorul"}
};

static const CallsType[3][15] = {
	{"taxi"}, {"paramedic"}, {"instructor"}
};


public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
	if(PlayerVar[playerid][Death]) return true;

	ClearString();
	switch(dialogid) {
		case DIALOG_MP3: {
			if(!response) return true;		
			if(!listitem) return RemovePlayerAttachedObject(playerid, 4);
			PlayAudioStreamForPlayer(playerid, RadioLink[listitem]);	
			PlayerVar[playerid][Radio] = listitem;
			SetPlayerAttachedObject(playerid, 4, 19421, 2, 0.050000, -0.014999, 0.000000, 95.000000, 183.000000, 89.000000, 1, 1, 1, 0xffffffff);
		}
		case DIALOG_BUYBP: {
			if(!response) return true;

			if(PlayerInfo[playerid][pPremiumPoints] < 500)
				return SCM(playerid, COLOR_GREY, "Nu ai suficiente puncte premium!");

			PlayerInfo[playerid][pGoldPass] = true;
			UpdateVar(playerid, "GoldPass", 1);
			SCM(playerid, COLOR_YELLOW, "Felicitari! Ti-ai achizitionat {E8CE16}Gold Pass{FFFF00} pentru suma de 500 puncte premium.");
			updateBP(playerid);
		}
		case DIALOG_BP: {
			if !response *then return true;

			if(bpChapter < listitem+1) return SCM(playerid, COLOR_GREY, "Chapter not unlocked!");

			new i=-1; gString = "Missions\tProgress\n";
			switch(listitem) {
				case 0: {
					while(++i<10) {
						new progress[35] = {"{00FF00}COMPLETED"};
						if(playerBPTask[playerid][i] < GetBPValue(i)) 
							format(progress, sizeof progress, "(%d/%d)", playerBPTask[playerid][i], GetBPValue(i));

						switch i
						do {
							case 0: format(gQuery, sizeof gQuery, "1. Prinde 5 pesti la jobul 'Fisherman'.\t%s\n", progress);
							case 1: format(gQuery, sizeof gQuery, "2. Castiga 10 maini la barbut.\t%s\n", progress);
							case 2: format(gQuery, sizeof gQuery, "3. Deschide 3 crate-uri de tip 'Basic Crate'.\t%s\n", progress);
							case 3: format(gQuery, sizeof gQuery, "4. Omoara 30 jucatori in arena de Paintball.\t%s\n", progress);
							case 4: format(gQuery, sizeof gQuery, "5. Deschide GifBox-ul de 3 ori.\t%s\n", progress);
							case 5: format(gQuery, sizeof gQuery, "6. Completeaza cele 3 quest-uri zilnice.\t%s\n", progress);
							case 6: format(gQuery, sizeof gQuery, "7. Jefuieste un business de 3 ori.\t%s\n", progress);
							case 7: format(gQuery, sizeof gQuery, "8. Colecteaza 40 de kg de gunoi.\t%s\n", progress);
							case 8: format(gQuery, sizeof gQuery, "9. Cumpara-ti un vehicul  din Dealership pana in $500.000.\t%s\n", progress);
							case 9: format(gQuery, sizeof gQuery, "10. Acumuleaaza 15 ore jucate (54.000 de secunde).\t%s\n", progress);
						}
						strcat(gString, gQuery);
					}
				}
				case 1: {
					while(++i<6) {
						new progress[35] = {"{00FF00}COMPLETED"};
						if(playerBPTask[playerid][i+10] < GetBPValue(i+10)) 
							format(progress, sizeof progress, "(%d/%d)", playerBPTask[playerid][i+10], GetBPValue(i+10));

						switch i
						do {
							case 0: format(gQuery, sizeof gQuery, "1. Joaca pe server 25 de PayDay-uri.\t%s\n", progress);
							case 1: format(gQuery, sizeof gQuery, "2. Realizeaza 50 de ture la jobul Farmer.\t%s\n", progress);
							case 2: format(gQuery, sizeof gQuery, "3. Acumuleaza peste 1.801 de secunde intr-o ora.\t%s\n", progress);
							case 3: format(gQuery, sizeof gQuery, "4. Repara un vehicul de 10 ori intr un PNS (delay 5 minute intre repair-uri)\t%s\n", progress);
							case 4: format(gQuery, sizeof gQuery, "5. Acumuleaza suma de 1.000 Red-zone Points\t%s\n", progress);
							case 5: format(gQuery, sizeof gQuery, "6. Viziteaza orasele 'BaySide/Las Payasadas/Dilimore'\t%s\n", progress);
						}
						strcat(gString, gQuery);
					}
				}
				case 2: {
					while(++i<5) {
						new progress[35] = {"{00FF00}COMPLETED"};
						if(playerBPTask[playerid][i+20] < GetBPValue(i+20)) 
							format(progress, sizeof progress, "(%d/%d)", playerBPTask[playerid][i+20], GetBPValue(i+20));

						switch i
						do {
							case 0: {
								if(PlayerInfo[playerid][pMember] != 9) format(gQuery, sizeof gQuery, "1. Plaseaza 10 contracte folosind comanda [/contract].\t%s\n", progress);
								else format(gQuery, sizeof gQuery, "1. Membrii factiunii Hitma vor avea de rezolvat 10 contracte.\t%s\n", progress);
							}
							case 1: format(gQuery, sizeof gQuery, "2. Foloseste comanda [/pay] de minim 5 ori.\t%s\n", progress);
							case 2: {
								if(!IsCop(playerid)) format(gQuery, sizeof gQuery, "3. Omoara 10  politisti.\t%s\n", progress);
								else format(gQuery, sizeof gQuery, "3. Aresteaza 10 suspecti.\t%s\n", progress);
							}
							case 3: format(gQuery, sizeof gQuery, "4. Achizioneaza-ti un vehicul de peste $1.000.000.\t%s\n", progress);
							case 4: format(gQuery, sizeof gQuery, "5. Achizitioneaza-ti un 'Red-zone Crate'.\t%s\n", progress);
						}
						strcat(gString, gQuery);
					}
				}
				case 3: {
					while(++i<5) {
						new progress[35] = {"{00FF00}COMPLETED"};
						if(playerBPTask[playerid][i+30] < GetBPValue(i+30)) 
							format(progress, sizeof progress, "(%d/%d)", playerBPTask[playerid][i+30], GetBPValue(i+30));

						switch i
						do {
							case 0: format(gQuery, sizeof gQuery, "1. Avanseaza la skill 6 la unul dintre joburi.\t%s\n", progress);
							case 1: format(gQuery, sizeof gQuery, "2. Realizeaza 5 afaceri prin [/trade].\t%s\n", progress);
							case 2: format(gQuery, sizeof gQuery, "3. Contribuie cu minim $50.000 la 4 Job Goal-uri.\t%s\n", progress);
							case 3: format(gQuery, sizeof gQuery, "4. Realizeaza 25 de curse la jobul 'Trucker'.\t%s\n", progress);
							case 4: format(gQuery, sizeof gQuery, "5. Parcurge 50 de km cu un vehicul de tip 'Monster'.\t%s\n", progress);
						}
						strcat(gString, gQuery);
					}
				}
			}
			format(gQuery, sizeof gQuery, "Your tier %d (%s XP)", PlayerInfo[playerid][pTier], FormatNumber(PlayerInfo[playerid][pBpExp]));
			ShowPlayerDialog(playerid, DIALOG_ONLINE, DIALOG_STYLE_TABLIST_HEADERS, gQuery, gString, "Ok", "");
		}
		case DIALOG_FNAME: {
			if(!strlen(inputtext) || strlen(inputtext) < 3 || strlen(inputtext) > MAX_PLAYER_NAME-4)
				return ShowPlayerDialog(playerid, DIALOG_FNAME, DIALOG_STYLE_INPUT, "Forcename:", "Nume invalid!\nNumele trebuie sa fie format din 3 si 24 caractere!", "Done", "");

			mysql_format(SQL, gQuery, sizeof gQuery, "SELECT * FROM `users` WHERE `name` = '%e' LIMIT 1", inputtext);
			mysql_tquery(SQL, gQuery, #check_username, #isb, playerid, inputtext, false);
		}
		case DIALOG_VOUCHER: {
			if(!response)
				return true;

			if(!PlayerInfo[playerid][pVoucher][listitem])
				return SCM(playerid, COLOR_LGREEN, "Eroare: Nu ai acest tip de voucher!");
		
			PlayerInfo[playerid][pVoucher][listitem] --;
			static const pp[] = {50,100,500};
			PlayerInfo[playerid][pPremiumPoints] += pp[listitem];
			UpdateVar(playerid, "PremiumPoints", PlayerInfo[playerid][pPremiumPoints]);
			save_vouchers(playerid);

			static const voucher_name[][]={"Rare", "Natrox", "Special"};
			SCMf(playerid, COLOR_YELLOW, "* Ai deschis un %s voucher si ai primit %d puncte premium!", voucher_name[listitem], pp[listitem]);
		}
		case DIALOG_FDEPOSIT: {
			if(!response) return true;
			switch(listitem) {
				case 0: ShowPlayerDialog(playerid, DIALOG_FDEPOSIT1, DIALOG_STYLE_INPUT, "Deposit", "Scrie suma de bani pe care vrei sa o depozitezi putin mai jos!", "Select", "Inapoi");
				case 1: ShowPlayerDialog(playerid, DIALOG_FDEPOSIT1, DIALOG_STYLE_INPUT, "Deposit", "Scrie suma de materiale pe care vrei sa o depozitezi putin mai jos!", "Select", "Inapoi");
				case 2: ShowPlayerDialog(playerid, DIALOG_FDEPOSIT1, DIALOG_STYLE_INPUT, "Deposit", "Scrie suma de droguri pe care vrei sa o depozitezi putin mai jos!", "Select", "Inapoi");
			}
			listitemm[playerid] = listitem;
		}
		case DIALOG_FDEPOSIT1: {
			if(!response)
				return ShowPlayerDialog(playerid, DIALOG_FDEPOSIT, DIALOG_STYLE_LIST, "Faction deposit", "Money\nMaterials\nDrugs", "Ok", "Exit");
			
			if(PlayerVar[playerid][IsFaction] == -1) return true;
			new f = PlayerVar[playerid][IsFaction];
			switch(listitemm[playerid]) {
				case 0: {
					if(GetPlayerCash(playerid) < strval(inputtext) || strval(inputtext) <= 0) return SCM(playerid, COLOR_WHITE, "* Suma invalida!");
					FactionInfo_[f][fBalance] += strval(inputtext);
					GivePlayerCash(playerid, -strval(inputtext));
					format(gString, sizeof gString, "* %s a depozitat $%s in seiful factiunii.", GetName(playerid), FormatNumber(strval(inputtext)));
					SendFactionMessage(PlayerInfo[playerid][pMember], COLOR_LIGHTBLUE, gString);	
				}
				case 1: {
					if(PlayerInfo[playerid][pMats] < strval(inputtext) || strval(inputtext) <= 0) return SCM(playerid, COLOR_WHITE, "* Suma invalida!");
					FactionInfo_[f][fMats] += strval(inputtext);
					PlayerInfo[playerid][pMats] -= strval(inputtext);
					format(gString, sizeof(gString), "* %s a depozitat %s materiale in seiful factiunii.", GetName(playerid), FormatNumber(strval(inputtext)));
					SendFactionMessage(PlayerInfo[playerid][pMember], COLOR_LIGHTBLUE, gString);	
					UpdateVar(playerid, "Mats", PlayerInfo[playerid][pMats]);
					_query(256, "UPDATE `factions` SET `Mats` = '%i' WHERE `ID` = '%i'", FactionInfo_[f][fMats], FactionInfo_[f][fID]);
					if(IsGangMember(playerid)) AddFactionRaport(playerid, 0, strval(inputtext));
				}
				case 2: {
					if(PlayerInfo[playerid][pDrugs] < strval(inputtext) || strval(inputtext) <= 0) return SCM(playerid, COLOR_WHITE, "* Suma invalida!");
					FactionInfo_[f][fDrugs] += strval(inputtext);
					PlayerInfo[playerid][pDrugs] -= strval(inputtext);
					UpdateVar(playerid, "Drugs", PlayerInfo[playerid][pDrugs]);
					_query(256, "UPDATE `factions` SET `Mats` = '%i' WHERE `ID` = '%i'", FactionInfo_[f][fDrugs], FactionInfo_[f][fID]);
					format(gString, sizeof(gString), "* %s a depozitat %s droguri in seiful factiunii.", GetName(playerid), FormatNumber(strval(inputtext)));
					SendFactionMessage(PlayerInfo[playerid][pMember], COLOR_LIGHTBLUE, gString);		
					if(IsGangMember(playerid)) AddFactionRaport(playerid, 1, strval(inputtext));
				}			
			}
		}
		case DIALOG_BUYTICKET: {
			if(!response)
				return true;

			if(GetPlayerCash(playerid)<2500)
				return SCM(playerid, COLOR_LGREEN, "Eroare: Nu ai aceasta suma de bani!");

			if(HaveTicket[playerid])
				return SCM(playerid, COLOR_LGREEN, "Eroare: Ai cumparat deja un computer ticket!");

			HaveTicket[playerid]=true;
			SCM(playerid, COLOR_YELLOW, "Ai cumparat un computer ticket pentru suma de $2.500.");
			SCM(playerid, COLOR_YELLOW, "Acest ticket este disponibil pana la iesirea din business!");
			GivePlayerCash(playerid, -2500);
		}
		case DIALOG_PLACEBETS: {
			if !response *then return true;

			if(!IsNumeric(inputtext))
				return sendComputerMessage(playerid, "Suma introdusa nu este valida!");

			new amount = strval(inputtext);
			if(amount < 50000 || amount > 100000000)
				return sendComputerMessage(playerid, "Poti paria intre $50.000 si~n~$100.000.000");

			if(GetPlayerCash(playerid) < amount)
				return sendComputerMessage(playerid, "Nu ai aceasta suma de bani!");

			hoursBet[playerid][hoursSelect[playerid]] = amount;
			new const colors[][] = {"~b~~h~blue","~r~red","~y~yellow","~p~purple","~g~green"};
			sendComputerMessagef(playerid, 5, "Ai pariat suma de ~g~~h~$%s ~n~~w~pe culoarea g%s", FormatNumber(amount), colors[hoursSelect[playerid]]);
		}
		case DIALOG_TRUCKER: {
			if(!response)
				return CancelJob(playerid, true);

			if PlayerVar[playerid][LeftJob]==listitem *then
				return SCM(playerid, COLOR_GREY, "Ai mai ales aceasta ruta!");

			new job = PlayerInfo[playerid][pJob]-1;
			if(listitem >= 6 && PlayerInfo[playerid][pJobSkill][job] < 2)
				return SCM(playerid, COLOR_LGREEN, "Ai nevoie de skill 2+ pentru a transporta aceasta marfa.");

			PlayerVar[playerid][LeftJob] = listitem;
			SetPlayerRaceCheckpointEx(playerid, DIALOG_FINISHTRUCK, 1, trucker_pos[listitem][0], trucker_pos[listitem][1], trucker_pos[listitem][2], 0.0, 0.0, 0.0, 5.0);
			SCM(playerid, COLOR_PINK, "Mergi la checkpointul de pe minimap pentru a livra marfa.");

			JobTime[playerid] = gettime();
			new Float:x,Float:y,Float:z;
			GetPlayerPos(playerid, x, y, z);
			switch listitem do {
				case 0,5: PlayerVar[playerid][Trailer] = CreateVehicleEx(450, x+6, y+6, z+6, 0.0, -1, -1, -1, 0);
				case 1..4: PlayerVar[playerid][Trailer] = CreateVehicleEx(435, x+6, y+6, z+6, 0.0, -1, -1, -1, 0);
				case 9,11: PlayerVar[playerid][Trailer] = CreateVehicleEx(584, x+6, y+6, z+6, 0.0, -1, -1, -1, 0), SetVehicleHealth(PlayerVar[playerid][Trailer], 500);
				default: PlayerVar[playerid][Trailer] = CreateVehicleEx(591, x+6, y+6, z+6, 0.0, -1, -1, -1, 0);
			}
			PlayerVar[playerid][MoneyReacvheid]=p_money[playerid][listitem];
			jobDeelay[playerid] = floatround(GetPlayerDistanceFromPoint(playerid, trucker_pos[listitem][0], trucker_pos[listitem][1], trucker_pos[listitem][2])/15.0);
		}
		case DIALOG_REGISTER: {
			if !response *then
				return true;

			if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "Register (password)", "Input your password in indbox", "Done", "Close");

			if(strlen(inputtext) > 16 || !checker(inputtext)) { 
				SCM(playerid, COLOR_RED, "Parola ta este nesigura (7 - 16 charactere) si sa aibe o litera mare.");
				ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "Register (password)", "Input your password in indbox", "Done", "Close");
				return true;
			}
			ConfirmPw[playerid] = false;
			mysql_escape_string(inputtext, PlayerInfo[playerid][pPassword]);
			PlayerTextDrawSetString(playerid, register_PTD[playerid][1], HashString(strlen(inputtext)));
		}
		case DIALOG_GENDER: {
			PlayerInfo[playerid][pGender] = bool:response;
			PlayerTextDrawSetString(playerid, register_PTD[playerid][4], response?("male"):("female"));
		}
		case DIALOG_SETPIN: {
			if !response *then
				return true;

			if(!IsNumeric(inputtext))
				return true;

			if strlen(inputtext) != 4 *then return ShowPlayerDialog(playerid, DIALOG_SETPIN, DIALOG_STYLE_INPUT, "Register (pin)", "Input your pin (need 4 numbers)", "Done", "Close");
			format(gString, 30, "pin: %s", inputtext);
			PlayerTextDrawSetString(playerid, register_PTD[playerid][5], gString);
			PlayerInfo[playerid][pPin] = strval(inputtext);
		}
		case DIALOG_CONFIRMPW: {
			if !response *then
				return true;

			if(ConfirmPw[playerid]) 
				return true;

			if(!strlen(inputtext)) 
				return ShowPlayerDialog(playerid, DIALOG_CONFIRMPW, DIALOG_STYLE_PASSWORD, "Register (confirm password)", "Confirm the password from the registration", "Done", "Close");

			if(strcmp(PlayerInfo[playerid][pPassword], inputtext, true) != 0)
				return SCM(playerid, COLOR_RED, "Parola introdusa nu este aceasi cu parola introdusa recenta!"), ShowPlayerDialog(playerid, DIALOG_CONFIRMPW, DIALOG_STYLE_PASSWORD, "Register (confirm password)", "Confirm the password from the registration", "Done", "Close");

			PlayerTextDrawSetString(playerid, register_PTD[playerid][2], HashString(strlen(PlayerInfo[playerid][pPassword])));
			ConfirmPw[playerid] = true;
		}
		case DIALOG_LOGIN_PC: {
			if !response *then
				return true;

			new textt[65];
			if(!strlen(inputtext)) return bool:true;
			SHA256_PassHash(inputtext, HASH_KEY, textt, 65);
			if(strcmp(textt, PlayerInfo[playerid][pPassword], true) != 0)
				return ShowPlayerDialog(playerid, DIALOG_LOGIN_PC_, DIALOG_STYLE_MSGBOX, "Login Computer", "{FF0000}The password entered is incorrect!", "Retry", "Cancel");

			PlayerTextDrawSetString(playerid, p_PCTD_LOG[playerid][1], HashString(strlen(inputtext)));
			ShowPlayerDialog(playerid, DIALOG_INVALID, DIALOG_STYLE_MSGBOX, "Login Computer", "{00FF00}You logged successfully in your computer", "Ok", "");
			_PC[playerid][_login] = true;
			if !IsPlayerConnectedOnPC(playerid) *then {
				new _x=-1;
				while(++_x<8) TextDrawHideForPlayer(playerid, PCTD_LOG[_x]); _x=-1;
				while(++_x<23) TextDrawShowForPlayer(playerid, PCTD_MAIN[_x]); _x=-1;
				PlayerTextDrawDestroy(playerid, p_PCTD_LOG[playerid][0]);
				PlayerTextDrawDestroy(playerid, p_PCTD_LOG[playerid][1]);

				new hour, minute, seconds, month, day, year;
				gettime(hour, minute, seconds),getdate(year, month, day);
				format(gString, 30, "%02d:%02d %s~n~%d/%d/%d", hour % 12, minute, (hour>12)?("PM"):("AM"), month, day, year);
				TextDrawSetString(PCTD_MAIN[10], gString);

				SelectTextDraw(playerid, 0xFFFFFF30);
				_PC[playerid][_type]=PC_ACTION_MAIN;
			}
		}
		case DIALOG_LOGIN_PC_: {
			if !response *then
				return true;

			ShowPlayerDialog(playerid, DIALOG_LOGIN_PC, DIALOG_STYLE_PASSWORD, "Login Computer", "Input your account password for login you computer!", "Done", "Cancel");
		}
		case DIALOG_ATM: {
			if(!response) return true;
			switch(listitem) {
				case 0: {
					format(gString, 100, "You bank account is currently standing at $%s.", formatBytes(bank[playerid]));
					ShowPlayerDialog(playerid, DIALOG_ONLINE, DIALOG_STYLE_MSGBOX, "SERVER: Automated Teller Mechine", gString, "OK", "");
				}
				case 1: ShowPlayerDialog(playerid, DIALOG_ATMWITHDRAW, DIALOG_STYLE_INPUT, "SERVER: ATM", "Please specify the amount of money that you'd like to withdraw.\n\nYou can withdraw up to $10,000 from this ATM.\n\nNote: This ATM charges $2 from any withdrawals you make.", "OK", "Cancel");
			}
		}
		case DIALOG_ATMWITHDRAW: {
			if(!response) return true;
			if(!IsNumeric(inputtext)) return SCM(playerid, COLOR_GREY, "Invalid characters.");
			new money = strval(inputtext);
			if(money <= 0 || money > 10000) return SCM(playerid, COLOR_GREY, "Invalid amount ($1 - $10,000)");
			if(GetPlayerBank(playerid) < (money+2)) return SCM(playerid, COLOR_GREY, "You do not have enough money to withdraw this amount.");
			GivePlayerBank(playerid, -(money+2));
			GivePlayerCash(playerid, money);
			ShowPlayerDialog(playerid, DIALOG_ONLINE, DIALOG_STYLE_MSGBOX, "SERVER: Automated Teller Machine", "Your money has been withdrawn.\n\nThank you of using ATM today!", "OK", "");
		}/*
		case DIALOG_MARKET: {
			if(!response)
				return true;

			switch(listitem) {
				case 0: ShowPlayerDialog(playerid, DIALOG_MARKET_TITLE, DIALOG_STYLE_INPUT, " - Market Title - ", "Introdu titlu de la produs:\n(10 - 80 Characters)", "Continue", "Back");
				case 1: ShowPlayerDialog(playerid, DIALOG_MARKET_OBIECT, DIALOG_STYLE_LIST, " - Market Object - ", "Vehicles\nSkins\nHouse\nBusiness", "Continue", "Back");
				case 2: ShowPlayerDialog(playerid, DIALOG_MARKET_PRICE, DIALOG_STYLE_INPUT, " - Market Price - ", "Introdu suma de bani cat sa coste obiectu:", "Continue", "Back");
				case 3: ShowPlayerDialog(playerid, DIALOG_MARKET_DESCRIPTION, DIALOG_STYLE_INPUT, " - Market Description - ", "Introdu o descriere a produsului:\n(15 - 180 Characters)", "Continue", "Back");
				case 4: {
					new i=listitemmm[playerid];
					if(strlen(MarketInfo[i][m_Title]) < 10 || !MarketInfo[i][m_Type] || strlen(MarketInfo[i][m_Description]) < 15) 
						return SCM(playerid, COLOR_GREY, "Nu ai completat toate tabelele."), AddItemMarket(playerid), 1;
				
					gQuery[0] = EOS;
					mysql_format(SQL, gQuery, sizeof gQuery, "INSERT INTO `market` (`Model`, `Userid`, `Price`, `Type`, `Owner`, `Title`, `Description`) VALUES ('%i', '%i', '%i', '%i', '%e', '%e', '%e')",
						MarketInfo[i][m_Model], PlayerInfo[playerid][pSQLID], MarketInfo[i][m_Price], MarketInfo[i][m_Type], PlayerInfo[playerid][pName], MarketInfo[i][m_Title], MarketInfo[i][m_Description]);
					mysql_tquery(SQL, gQuery, "SQL_Insert_ID", "d", i);
					MarketInfo[i][m_Userid] = PlayerInfo[playerid][pSQLID];
					strmid(MarketInfo[i][m_Owner], PlayerInfo[playerid][pName], 0, MAX_PLAYER_NAME);
					Iter_Add(marketObject, i);
				}
			}
		}
		case DIALOG_MARKET_TITLE: {
			if(!response) return AddItemMarket(playerid);
			if(strlen(inputtext) < 10 || strlen(inputtext) > 80) return ShowPlayerDialog(playerid, DIALOG_MARKET_TITLE, DIALOG_STYLE_INPUT, " - Market Title - ", "Introdu titlu de la produs:\n{FF0000}(10 - 80 Characters)", "Continue", "Back");
			strmid(MarketInfo[listitemmm[playerid]][m_Title], inputtext, 0, 80);
			format(gString, 100, "(Market) Title: %s", inputtext);
			SCM(playerid, COLOR_YELLOW, gString);
			AddItemMarket(playerid);
		}
		case DIALOG_MARKET_PRICE: {
			if(!response)
				return AddItemMarket(playerid);

			new money = strval(inputtext);
			format(gString, 50, "(Market) Price: $%s", FormatNumber(money));
			SCM(playerid, COLOR_YELLOW, gString);
			MarketInfo[listitemmm[playerid]][m_Price] = money;
			AddItemMarket(playerid);
		}
		case DIALOG_MARKET_DESCRIPTION: {
			if(!response)
				return AddItemMarket(playerid);

			if(strlen(inputtext) < 15 || strlen(inputtext) > 180) return ShowPlayerDialog(playerid, DIALOG_MARKET_DESCRIPTION, DIALOG_STYLE_INPUT, " - Market Description - ", "Introdu o descriere a produsului:\n{FF0000}(15 - 180 Characters)", "Continue", "Back");
			strmid(MarketInfo[listitemmm[playerid]][m_Description], inputtext, 0, 180);
			format(gString, sizeof gString, "(Market) Description: %s.", inputtext);
			AddItemMarket(playerid);
		}
		case DIALOG_MARKET_OBIECT: {
			if(!response) return AddItemMarket(playerid);
			switch(listitem) {
				case 0: {
					new szString[MAX_PLAYER_VEHICLE * 60], x=0;
					foreach(new v : MyVehicles[playerid]) {
						format(gString, 60, "%s - %s\n", GetVehicleName(CarInfo[v][cModel]), GetVehicleUpgrades(v));
						strcat(szString, gString);
						PlayerInfo[playerid][pCarKey][x] = v, x++;
					}
					ShowPlayerDialog(playerid, DIALOG_MARKET_OBIECT1, DIALOG_STYLE_LIST, " - Market Vehicles - ", szString, "Select", "Back");
				}
				case 1: {
					new x=0, szString[15 * 30];
					for(new i=0;i<15;i++) {
						if(PlayerInfo[playerid][pSkin][i] == -1) continue;
						format(gString, 50, "skin %d (%s)\n", PlayerInfo[playerid][pSkin][i], GetSkinType(PlayerInfo[playerid][pSkin][i]));
						strcat(szString, gString);
						PlayerSelected[playerid][0][x] = PlayerInfo[playerid][pSkin][i], x++;
					}
					ShowPlayerDialog(playerid, DIALOG_MARKET_OBIECT1, DIALOG_STYLE_LIST, " - Market Skins - ", szString, "Select", "Back");
				}
				case 2: {
					if(PlayerInfo[playerid][pHouse] == -1) return AddItemMarket(playerid), SCM(playerid, COLOR_GREY, "Nu detii o casa."), 1;
					MarketInfo[listitemmm[playerid]][m_Model] = 1273;
					MarketInfo[listitemmm[playerid]][m_Type] = 3;
					format(gString, 50, "(Market) Object: House %d", PlayerInfo[playerid][pHouse]);
					SCM(playerid, COLOR_YELLOW, gString);
					AddItemMarket(playerid);
				}
				case 3: {
					if(PlayerInfo[playerid][pBussines] == -1) return SCM(playerid, COLOR_GREY, "Nu detii un bizz."), AddItemMarket(playerid), 1;
					MarketInfo[listitemmm[playerid]][m_Model] = 1239;
					MarketInfo[listitemmm[playerid]][m_Type] = 4;
					format(gString, 50, "(Market) Object: Business %d", PlayerInfo[playerid][pBussines]);
					SCM(playerid, COLOR_YELLOW, gString);
					AddItemMarket(playerid);
				}
			}
			listitemm[playerid] = listitem;
		}
		case DIALOG_MARKET_OBIECT1: {
			if(!response) return AddItemMarket(playerid);
			new x = listitemmm[playerid];
			switch(listitemm[playerid]) {
				case 0: {
					new v = PlayerInfo[playerid][pCarKey][listitem];
					MarketInfo[x][m_Type] = 1;
					MarketInfo[x][m_Model] = CarInfo[v][cModel];
					MarketInfo[x][m_Obj_ID] = CarInfo[v][cID];
					format(gString, 50, "(Market) Obiect: vehicles (%s)", GetVehicleName(CarInfo[v][cModel]));
					SCM(playerid, COLOR_YELLOW, gString);	
					AddItemMarket(playerid);			
				}
				case 1: {
					if(!GetSkinRare(PlayerSelected[playerid][0][listitem])) {
						new f=0, szString[15 * 30];
						for(new i=0;i<15;i++) {
							if(PlayerInfo[playerid][pSkin][i] == -1) continue;
							format(gString, 50, "skin %d (%s)\n", PlayerInfo[playerid][pSkin][i], GetSkinType(PlayerInfo[playerid][pSkin][i]));
							strcat(szString, gString);
							PlayerSelected[playerid][0][f] = PlayerInfo[playerid][pSkin][i], f++;
						}
						ShowPlayerDialog(playerid, DIALOG_MARKET_OBIECT1, DIALOG_STYLE_LIST, " - Market Skins - ", szString, "Select", "Back");
						SCM(playerid, COLOR_YELLOW, "Nu poti adauga acest skin.");
						return true;
					}
					MarketInfo[x][m_Model] = PlayerSelected[playerid][0][listitem];
					MarketInfo[x][m_Type] = 2;
					format(gString, 50, "(Market) Obiect: Skin %d (%s)", PlayerSelected[playerid][0][listitem], GetSkinType(PlayerSelected[playerid][0][listitem]));
					SCM(playerid, COLOR_YELLOW, gString);
					AddItemMarket(playerid);
				}
			}
		}*/
		case DIALOG_FRIENDS: {
			if(!response) return true;
			if(!listitem) return ShowPlayerDialog(playerid, DIALOG_ADDFRIENDS, DIALOG_STYLE_INPUT, "Add Friend", "Type ID of the player you want add as a friends:", "Add Friends", "Back");
			listitemm[playerid] = listitem-1;
			ShowPlayerDialog(playerid, DIALOG_FRIEND, DIALOG_STYLE_LIST, "Friends", FriendID[playerid][1][listitemm[playerid]]  != -1 ? "Remove\nNumber\nSMS" : "Remove", "Select", "Close");
		}
		case DIALOG_FRIEND: {
			if(!response) return true;
			new id = FriendID[playerid][1][listitemm[playerid]];
			switch(listitem) {
				case 0: {
					gQuery[0] = EOS;
					mysql_format(SQL, gQuery, 128, "DELETE FROM `friends` WHERE `ID` = '%i' LIMIT 1", FriendID[playerid][0][listitemm[playerid]]);
					mysql_tquery(SQL, gQuery);
					SCM(playerid, COLOR_YELLOW, "Friend Removed.");
				}
				case 1: {
					if(PlayerInfo[id][pPhone] != 0) format(gString, 100, "%s's phone number: %d", GetName(id), PlayerInfo[id][pPhone]);
					else format(gString, 100, "%s's phone number: none", GetName(id));
					SCM(playerid, COLOR_WHITE, gString);
				}
				case 2: ShowPlayerDialog(playerid, DIALOG_SMSFRIEND, DIALOG_STYLE_INPUT, "SMS to friend:", "Introdu mesajul pe care vrei sa il trimiti:", "Trimite", "Close");
			}
		}
		case DIALOG_SMSFRIEND: {
			if(!response) return true;

			if(GetCoolDowns(playerid, 7)) return CoolDowns(playerid, 7);
			if(CheckMute(playerid)) return ShowMute(playerid);
			if(!PlayerInfo[playerid][pPhone]) return SCM(playerid, COLOR_GREY, "Nu ai un telefon.");
			if(PlayerInfo[playerid][pPhoneStatus]) return SCM(playerid, COLOR_GREY, "Telefonul tau este inchis.");
			if(PlayerInfo[playerid][pCredit] < 2) return SCM(playerid, COLOR_GREY, "You don't have enough credit.");
			new giveplayerid = FriendID[playerid][1][listitemm[playerid]];
			if(!PlayerInfo[giveplayerid][pPhone]) return SCM(playerid, COLOR_GREY, "Acel player nu are un telefon");
			if(PlayerInfo[giveplayerid][pPhoneStatus]) return SCM(playerid, COLOR_GREY, "Telefonul lui este inchis.");
			if checkReclame(playerid, inputtext) *then return true;

			format(gString, 160, "SMS from %s ({FFFFFF}%d{FFFF00}): %s",GetName(playerid), PlayerInfo[playerid][pPhone], inputtext);
			SCM(giveplayerid, COLOR_YELLOW, gString);

			format(gString, 160, "SMS send to %s ({FFFFFF}%d{C8E0DF}): %s",GetName(giveplayerid), PlayerInfo[giveplayerid][pPhone], inputtext);
			SCM(playerid, 0xC8E0DFFF, gString);
			SetCoolDowns(playerid, 7, 10);
			if(PlayerInfo[playerid][pAdmin] < 6) {
				format(gString, 160, "(SMS LOG) %s(%d) catre %s(%d): %s", GetName(playerid), playerid, GetName(giveplayerid), giveplayerid, inputtext);
				EarsMessage(0xFFC400FF, gString);
			}

			PlayerInfo[playerid][pCredit] -= 2;

			PlayerPlaySound(giveplayerid, 1138, 0.0, 0.0, 0.0);
			PlayerVar[giveplayerid][Reply] = playerid;
		}
		case DIALOG_ADDFRIENDS: {
			if(!response) return true;
			if(!IsNumeric(inputtext)) return true;
			new id = strval(inputtext);

			if(!IsPlayerConnected(id))
				return SCM(playerid, COLOR_GREY, "Player not connected.");

			if(playerid == id)
				return SCM(playerid, COLOR_GREY, "Nu te poti adauga in lista ta de preteni.");

			if(!IsPlayerLogged(id))
				return SCM(playerid, COLOR_GREY, "Player not logged.");

			if(!PlayerOfRangeToPlayer(playerid, 8.5, id))
				return SCM(playerid, COLOR_LGREEN, "Acel player nu este langa tine.");

			for(new i=0;i<MyFriends[playerid];i++) if(FriendID[playerid][2][i] == PlayerInfo[id][pSQLID]) 
				return SCM(playerid, COLOR_GREY, "Il ai deja pe acel jucator in lista ta de preteni.");

			gQuery[0] = (EOS);
			mysql_format(SQL, gQuery, sizeof gQuery, "INSERT INTO `friends` (`AddBy`, `ByStatus`, `ByName`, `Name`, `Userid`, `Status`) VALUES ('%i', '%i', '%e', '%e', '%i', '%i')",
				PlayerInfo[playerid][pSQLID], playerid, PlayerInfo[playerid][pName], PlayerInfo[id][pName], PlayerInfo[id][pSQLID], id);
			mysql_tquery(SQL, gQuery);
			SCM(playerid, COLOR_YELLOW, "New friend added.");
		}
		case DIALOG_RED: return !response ? SelectTextDraw(playerid, COLOR_WHITE) : PutRouletteBet(playerid, strval(inputtext), 1);
		case DIALOG_GREEN: return !response ? SelectTextDraw(playerid, COLOR_WHITE) : PutRouletteBet(playerid, strval(inputtext), 2);
		case DIALOG_BLACK: return !response ? SelectTextDraw(playerid, COLOR_WHITE) : PutRouletteBet(playerid, strval(inputtext), 0);
		case DIALOG_QUITGROUP: {
			if(!response)
				return bool:true;

			format(gString, 100, "* %s a iesit din factiune (/quitgroup).", GetName(playerid));
			SendFactionMessage(PlayerInfo[playerid][pMember], COLOR_LIGHTBLUE, gString);
			format(gString, 75, "Ai iesit din factiunea %s.", FactionInfo_[PlayerInfo[playerid][pMember] - 1][fName]);
			SCM(playerid, COLOR_YELLOW, gString);

			format(gString, sizeof gString, "left %s (rank %d) after %d days using /quitgroup, with 30 faction punish.", FactionInfo_[PlayerInfo[playerid][pMember]-1][fName], PlayerInfo[playerid][pRank], (gettime()-PlayerInfo[playerid][pFDays])/86400);
			new year, mounth, day, hour, minute, second; getdate(year, mounth, day), gettime(hour, minute, second);
			mysql_format(SQL, gQuery, sizeof gQuery, "INSERT INTO `faction_logs` (`text`, `Userid`, `time`) VALUES ('%e', '%i', '%i', '%d-%d-%d %d:%d')", gString, PlayerInfo[playerid][pSQLID], year, mounth, day, hour, minute);
			mysql_tquery(SQL, gQuery);
			
			UninvitePlayerFaction(playerid, 30);
		}
		case DIALOG_QUITCLAN: {
			if(!response)
				return bool:true;

			new x = GetClan[PlayerInfo[playerid][pClan]];

			Iter_Remove(Clans[x], playerid);
			format(gString, 100, "{%s}[LEAVE] %s a iesit din clan.", ClanInfo[x][clColor], GetName(playerid));
			SendClanMessage(playerid, COLOR_WHITE, gString);
			format(gString, 50, "Ai iesit din clanul %s.", ClanInfo[x][clName]);
			SCM(playerid, COLOR_YELLOW, gString);

			PlayerInfo[playerid][pClan] = 0;
			UpdateVar(playerid, "Clan", 0);
			if(PlayerInfo[playerid][pClanTag] < 2) SetPlayerName(playerid, PlayerInfo[playerid][pName]);
		}
		case DIALOG_EDITFACTION: {
			if(!response)
				return bool:true;

			new id = listitemm[playerid];
			switch(listitem) {
				case 0: { 
					switch(listitemm[playerid]) {
						case 1, 2, 7, 12: format(gString, 180, "Type\tRaport Rank 1 - 7\nRunners\t%d/%d/%d/%d/%d/%d/%d\nTickets\t%d/%d/%d/%d/%d/%d/%d\nLicense Confiscated\t%d/%d/%d/%d/%d/%d/%d", 
							FactionRaport[id][1][0], FactionRaport[id][2][0], FactionRaport[id][3][0], FactionRaport[id][4][0], FactionRaport[id][5][0], FactionRaport[id][6][0], FactionRaport[id][7][0],
							FactionRaport[id][1][1], FactionRaport[id][2][1], FactionRaport[id][3][1], FactionRaport[id][4][1], FactionRaport[id][5][1], FactionRaport[id][6][1], FactionRaport[id][7][1],
							FactionRaport[id][1][2], FactionRaport[id][2][2], FactionRaport[id][3][2], FactionRaport[id][4][2], FactionRaport[id][5][2], FactionRaport[id][6][2], FactionRaport[id][7][2]);
						case 5: format(gString, 130, "Type\tRaport Rank 1 - 7\nPlayers shipped\t%d/%d/%d/%d/%d/%d/%d\n",
							FactionRaport[id][1][0], FactionRaport[id][2][0], FactionRaport[id][3][0], FactionRaport[id][4][0], FactionRaport[id][5][0], FactionRaport[id][6][0], FactionRaport[id][7][0]);
						case 6: format(gString, 130, "Type\tRaport Rank 1 - 7\nPlayers Healed\t%d/%d/%d/%d/%d/%d/%d\n",
							FactionRaport[id][1][0], FactionRaport[id][2][0], FactionRaport[id][3][0], FactionRaport[id][4][0], FactionRaport[id][5][0], FactionRaport[id][6][0], FactionRaport[id][7][0]);
						case 8: format(gString, 130, "Type\tRaport Rank 1 - 7\nLicense ofered\t%d/%d/%d/%d/%d/%d/%d\n",
							FactionRaport[id][1][0], FactionRaport[id][2][0], FactionRaport[id][3][0], FactionRaport[id][4][0], FactionRaport[id][5][0], FactionRaport[id][6][0], FactionRaport[id][7][0]);
						case 10: format(gString, 130, "Type\tRaport Rank 1 - 7\nContracts\t%d/%d/%d/%d/%d/%d/%d\n",
							FactionRaport[id][1][0], FactionRaport[id][2][0], FactionRaport[id][3][0], FactionRaport[id][4][0], FactionRaport[id][5][0], FactionRaport[id][6][0], FactionRaport[id][7][0]);
						case 11: format(gString, 180, "Type\tRaport Rank 1 - 7\nNews\t%d/%d/%d/%d/%d/%d/%d\nLivestreams\t%d/%d/%d/%d/%d/%d/%d", 
							FactionRaport[id][1][0], FactionRaport[id][2][0], FactionRaport[id][3][0], FactionRaport[id][4][0], FactionRaport[id][5][0], FactionRaport[id][6][0], FactionRaport[id][7][0],
							FactionRaport[id][1][1], FactionRaport[id][2][1], FactionRaport[id][3][1], FactionRaport[id][4][1], FactionRaport[id][5][1], FactionRaport[id][6][1], FactionRaport[id][7][1]);
					}
					ShowPlayerDialog(playerid, DIALOG_EDITRAPORT, DIALOG_STYLE_TABLIST_HEADERS, "Edit Raport:", gString, "Select", "Close");
				}
				case 1: {
					format(gString, sizeof gString, "%s\n%s\n%s\n%s\n%s\n%s\n%s", fRankNames[id][0], fRankNames[id][1], fRankNames[id][2], fRankNames[id][3], fRankNames[id][4], fRankNames[id][5], fRankNames[id][6]);
					ShowPlayerDialog(playerid, DIALOG_EDITRANK, DIALOG_STYLE_LIST, "Edit Rank", gString, "Select", "Close");
				}
				case 2: ShowPlayerDialog(playerid, DIALOG_MOVEFACTION, DIALOG_STYLE_LIST, "Move Faction", "Interior Faction\nExterior Faction", "Select", "Close");
				case 3: ShowPlayerDialog(playerid, DIALOG_FACTIONAME, DIALOG_STYLE_INPUT, "Edit Faction Name", "Introdu noul nume:", "Done", "Close");
				case 4: ShowPlayerDialog(playerid, DIALOG_MOVESVF, DIALOG_STYLE_LIST, "Edit server vehicle faction:", "SVF Pos\nVehicle SVF Pos", "Select", "Close");
			}
		}
		case DIALOG_MOVESVF: {
			if(!response) return true;
			if(!VehFInfo[listitemm[playerid]][vfID]) return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta comanda pe aceasta factiune!");
			switch(listitem) {
				case 0: {
					new i = listitemm[playerid];
					GetPlayerPos(playerid, VehFInfo[i][vfX], VehFInfo[i][vfY], VehFInfo[i][vfZ]);
					gQuery[0] = EOS;
					mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `svf` SET `X` = '%f', `Y` = '%f', `Z` = '%f' WHERE `ID` = '%i'", VehFInfo[i][vfX], VehFInfo[i][vfY], VehFInfo[i][vfZ], VehFInfo[i][vfID]);
					mysql_tquery(SQL, gQuery);
					if VehFInfo[i][vfPickup]!=-1 *then DestroyPickup(VehFInfo[i][vfPickup]);
					if VehFInfo[i][vfLabel]!=Text3D:-1 *then Delete3DTextLabel(VehFInfo[i][vfLabel]);

					VehFInfo[i][vfPickup] = CreatePickup(19133, 23, VehFInfo[i][vfX], VehFInfo[i][vfY], VehFInfo[i][vfZ]); 
					format(gString, 150, "{%s}%s's {FFFFFF}SVF\n(use </svf>)", FactionInfo_[i - 1][fColor], FactionInfo_[i - 1][fName]);
					VehFInfo[i][vfLabel] = Create3DTextLabel(gString, -1, VehFInfo[i][vfX], VehFInfo[i][vfY], VehFInfo[i][vfZ], 10.0);

					format(gString, 128, "* %s a editat pozitile svf-ului %s.", GetName(playerid), FactionInfo_[listitemm[playerid]-1][fName]);
					SendAdminMessage(COLOR_ADMCMD, gString, 1);
				}
				case 1: {
					if(!IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Trebuie sa fii intr-un vehicul!");
					new i = listitemm[playerid];
					GetVehiclePos(GetPlayerVehicleID(playerid), VehFInfo[i][vPos][0], VehFInfo[i][vPos][1], VehFInfo[i][vPos][2]);
					GetVehicleZAngle(GetPlayerVehicleID(playerid), VehFInfo[i][vPos][3]);
					gQuery[0] = EOS;
					mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `svf` SET `vX` = '%f', `vY` = '%f', `vZ` = '%f', `vR` = '%f' WHERE `ID` = '%i'", VehFInfo[i][vPos][0], VehFInfo[i][vPos][1], VehFInfo[i][vPos][2], VehFInfo[i][vPos][3], VehFInfo[i][vfID]);
					mysql_tquery(SQL, gQuery);

					format(gString, 128, "* %s a editat pozitile vehicului care se spawneaza, svf-ul %s.", GetName(playerid), FactionInfo_[listitemm[playerid]-1][fName]);
					SendAdminMessage(COLOR_ADMCMD, gString, 1);
				}
			}
		}
		case DIALOG_FACTIONAME: {
			if(!response) return true;
			new id = listitemm[playerid]-1;
			format(gString, 128, "* %s a editat numele factiunii %s in %s.", GetName(playerid), FactionInfo_[id][fName], inputtext);
			SendAdminMessage(COLOR_ADMCMD, gString, 5);

			strmid(FactionInfo_[id][fName], inputtext, 0, 35);
			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `factions` SET `Name` = '%e' WHERE `ID` = '%i'", FactionInfo_[id][fName], listitemm[playerid]);
			mysql_tquery(SQL, gQuery);
			format(gString, sizeof(gString), "{%s}%s's{FFFFFF} HQ\n{FFFFFF}(%s)", FactionInfo_[id][fColor], FactionInfo_[id][fName], FactionInfo_[id][fStatus] ? ("Locked") : ("Unlocked"));
			UpdateDynamic3DTextLabelText(FactionInfo_[id][fLabel], -1, gString);
			format(gString, 150, "{%s}%s's {FFFFFF}SVF\n(use </svf>)", FactionInfo_[id][fColor], FactionInfo_[id][fName]);
			UpdateDynamic3DTextLabelText(VehFInfo[id+1][vfLabel], -1, gString);
		}
		case DIALOG_MOVEFACTION: {
			if(!response)
				return bool:true;

			new id = listitemm[playerid] - 1;
			switch(listitem) {
				case 0: {	
					if(!GetPlayerInterior(playerid))
						return SCM(playerid, COLOR_GREY, "Nu esti intr-un interior.");

					GetPlayerPos(playerid, FactionInfo_[id][fExitPos][0], FactionInfo_[id][fExitPos][1], FactionInfo_[id][fExitPos][2]);

					gQuery[0] = EOS;
					mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `factions` SET `ExitPosX` = '%f', `ExitPosY` = '%f', `ExitPosZ` = '%f' WHERE `ID` = '%i'", 
						FactionInfo_[id][fExitPos][0], FactionInfo_[id][fExitPos][1], FactionInfo_[id][fExitPos][2], FactionInfo_[id][fID]);
					mysql_tquery(SQL, gQuery);
				}
				case 1: {	
					if(GetPlayerInterior(playerid) > 0)
						return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta comanda in interior.");

					GetPlayerPos(playerid, FactionInfo_[id][fEnterPos][0], FactionInfo_[id][fEnterPos][1], FactionInfo_[id][fEnterPos][2]);

					gQuery[0] = EOS;
					mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `factions` SET `EnterPosX` = '%f', `EnterPosY` = '%f', `EnterPosZ` = '%f' WHERE `ID` = '%i'", 
						FactionInfo_[id][fEnterPos][0], FactionInfo_[id][fEnterPos][1], FactionInfo_[id][fEnterPos][2], FactionInfo_[id][fID]);
					mysql_tquery(SQL, gQuery);

					if FactionInfo_[id][fPickup]!=-1 *then DestroyPickup(FactionInfo_[id][fPickup]);
					if FactionInfo_[id][fLabel]!=Text3D:-1 *then Delete3DTextLabel(FactionInfo_[id][fLabel]);
					updateFactionLabel(id);
				}
			}
			format(gString, sizeof gString, "(/editfaction) {FFFFFF}Admin %s has changed the positions. Faction %s (ID: %d)", GetName(playerid), FactionInfo_[id][fName], FactionInfo_[id][fID]);
			SendAdminMessage(COLOR_LIGHTRED, gString, 6);
		}
		case DIALOG_EDITRANK: {
			if(!response)
				return bool:true;

			listitemmm[playerid] = listitem;
			ShowPlayerDialog(playerid, DIALOG_EDITRANK1, DIALOG_STYLE_INPUT, "Edit Rank", "Introdu numele rankului:", "Continue", "Close");
		}
		case DIALOG_EDITRANK1: {
			if(!response)
				return bool:true;

			if(strlen(inputtext) < 3 || strlen(inputtext) > 20)
				return SCM(playerid, COLOR_RED, "invalid rank name."), ShowPlayerDialog(playerid, DIALOG_EDITRANK, DIALOG_STYLE_LIST, "Edit Rank", gString, "Select", "Close");
			
			new id = listitemm[playerid] - 1, i = listitemmm[playerid];
			format(fRankNames[id][i], 24, inputtext);

			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `factions` SET `Rank%i` = '%e' WHERE `ID` = '%i'", i + 1, inputtext, FactionInfo_[id][fID]);
			mysql_tquery(SQL, gQuery);

			format(gString, sizeof gString, "(/editfaction) {FFFFFF}Admin %s a schimbat rank %d in %s pentru factiune %s.", GetName(playerid), i + 1, inputtext, FactionInfo_[id][fName]);
			SendAdminMessage(COLOR_LIGHTRED, gString, 6);
		}
		case DIALOG_TOWCAR: {
			if(!response)
				return bool:true;

			new idd = PlayerInfo[playerid][pCarKey][listitem];
			if(CarInfo[idd][cSpawned] == INVALID_VEHICLE)
				return bool:true;

			if(IsVehicleOccupied(CarInfo[idd][cSpawned]))
				return SCM(playerid, COLOR_LGREEN, "Acel vehicul este ocupat.");

			GetVehicleHealth(CarInfo[idd][cSpawned], CarInfo[idd][cHealth]);
			if(CarInfo[idd][cHealth] < 250)
				return SCM(playerid, COLOR_GREY, "Nu poti respawna masina momentan.");

			if(GetPlayerCash(playerid)<100)
				return SCM(playerid, COLOR_LGREEN, "Eroare: Nu ai $100!");

			GetVehicleDamageStatus(CarInfo[idd][cSpawned], CarInfo[idd][cComponents][0], CarInfo[idd][cComponents][1], CarInfo[idd][cComponents][2], CarInfo[idd][cComponents][3]);
			GivePlayerCash(playerid, -100);
			SetVehicleToRespawn(CarInfo[idd][cSpawned]), SetPlayerCarTime(idd), SCM(playerid, COLOR_GREY, "Your car has been respawned.");
			SetVehicleHealth(CarInfo[idd][cSpawned], CarInfo[idd][cHealth] > 250 ? CarInfo[idd][cHealth] : 999.0);
			UpdateVehicleDamageStatus(CarInfo[idd][cSpawned], CarInfo[idd][cComponents][0], CarInfo[idd][cComponents][1], CarInfo[idd][cComponents][2], CarInfo[idd][cComponents][3]);
			format(gString, 100, "You respawned the car %s.", GetVehicleName(CarInfo[idd][cModel]));
			SCM(playerid, COLOR_LIGHTBLUE, gString);
		}
		case DIALOG_FINDCAR: {
			if(!response)
				return bool:true;

			new idd = PlayerInfo[playerid][pCarKey][listitem];
			if(CarInfo[idd][cSpawned] == INVALID_VEHICLE)
				return bool:true;

			new Float:x, Float:y, Float:z;
			GetVehiclePos(CarInfo[idd][cSpawned], x, y, z);
			SetPlayerCheckpointEx(playerid, CP_NORMAL, x, y, z, 5.0);
			format(gString, 100, "You have been set up a checkpoint on the %s car.", GetVehicleName(CarInfo[idd][cModel]));
			SCM(playerid, COLOR_LIGHTBLUE, gString);
		}
		case DIALOG_BUYCRATE: {
			if(!response)
				return bool:true;

			new x=-1;
			for(new i=0;i<3;i++) if(PlayerToPoint(playerid, 2.0, CrateInfo[i][C_POS][0], CrateInfo[i][C_POS][1], CrateInfo[i][C_POS][2])) x=i;
			if(x==-1) return SCM(playerid, COLOR_GREY, "Nu te aflii langa un crate.");

			switch(x) {
				case 0: {
					if(PlayerInfo[playerid][pServerPoints] < 300)
						return ShowPlayerDialog(playerid, DIALOG_ONLINE, DIALOG_STYLE_MSGBOX, "Invalid", "Nu destule Red-zone points.", "Close", "");
					
					PlayerInfo[playerid][pServerPoints] -= 300;
					checkBP(playerid, 25, 100);
					UpdateVar(playerid, "ServerPoints", PlayerInfo[playerid][pServerPoints]);
					format(gString, 200, "(Crate Stand) {FFFFFF}Ti-ai cumparat un {%s}%s crate{FFFFFF} pentru {E065EE}300 Red-zone Points{FFFFFF}. Total: %d", CrateInfo[x][C_COLOR], CrateInfo[x][C_NAME], TotalPlayerCrates(playerid));
					SCM(playerid, COLOR_SERVER, gString);
				}
				case 1: {
					switch(listitem) {
						case 0: {
							if(PlayerInfo[playerid][pServerPoints] < 2500)
								return ShowPlayerDialog(playerid, DIALOG_ONLINE, DIALOG_STYLE_MSGBOX, "Invalid", "Nu destule Red-zone points.", "Close", "");
							
							PlayerInfo[playerid][pServerPoints] -= 2500;
							UpdateVar(playerid, "ServerPoints", PlayerInfo[playerid][pServerPoints]);
							format(gString, 200, "(Crate Stand) {FFFFFF}Ti-ai cumparat un {%s}%s crate{FFFFFF} pentru {E065EE}2500 Red-zone Points{FFFFFF}. Total: %d", CrateInfo[x][C_COLOR], CrateInfo[x][C_NAME], TotalPlayerCrates(playerid));
							SCM(playerid, COLOR_SERVER, gString);
						}
						case 1: {
							if(PlayerInfo[playerid][pPremiumPoints] < 100)
								return ShowPlayerDialog(playerid, DIALOG_ONLINE, DIALOG_STYLE_MSGBOX, "Invalid", "Nu destule puncte premium.", "Close", "");
							
							PlayerInfo[playerid][pPremiumPoints] -= 100;
							UpdateVar(playerid, "PremiumPoints", PlayerInfo[playerid][pPremiumPoints]);
							format(gString, 200, "(Crate Stand) {FFFFFF}Ti-ai cumparat un {%s}%s crate{FFFFFF} pentru {FFFF00}100 PP{FFFFFF}. Total: %d", CrateInfo[x][C_COLOR], CrateInfo[x][C_NAME], TotalPlayerCrates(playerid));
							SCM(playerid, COLOR_SERVER, gString);
						}
					}
				}
				case 2: {
					if(PlayerInfo[playerid][pPremiumPoints] < 350)
						return ShowPlayerDialog(playerid, DIALOG_ONLINE, DIALOG_STYLE_MSGBOX, "Invalid", "Nu destule puncte premium.", "Close", "");
					
					PlayerInfo[playerid][pPremiumPoints] -= 350;
					UpdateVar(playerid, "PremiumPoints", PlayerInfo[playerid][pPremiumPoints]);
					format(gString, 200, "(Crate Stand) {FFFFFF}Ti-ai cumparat un {%s}%s crate{FFFFFF} pentru {FFFF00}350 PP{FFFFFF}. Total: %d", CrateInfo[x][C_COLOR], CrateInfo[x][C_NAME], TotalPlayerCrates(playerid));
					SCM(playerid, COLOR_SERVER, gString);
				}
			}

			PlayerInfo[playerid][pCrate][x] ++;
			save_crates(playerid);
		}
		case DIALOG_PET: {
			if(!response)
				return bool:true;

			switch(listitem) {
				case 0: {
					if(PlayerInfo[playerid][pPetExp] < PET_EXPERIENCE * PlayerInfo[playerid][pPetLevel])
						return SCM(playerid, COLOR_LGREEN, "Nu ai destule pet points.");

					PlayerInfo[playerid][pPetExp] -= PET_EXPERIENCE * PlayerInfo[playerid][pPetLevel];
					PlayerInfo[playerid][pPetLevel] ++;
					
					UpdateVar(playerid, "PetLevel", PlayerInfo[playerid][pPetLevel]);
					UpdateVar(playerid, "PetExp", PlayerInfo[playerid][pPetExp]);

					format(gString, 100, "(Pet) {FFFFFF}Congratulations! You pet is now level up %d%s", PlayerInfo[playerid][pPetLevel], PlayerInfo[playerid][pPetLevel] % 4 ? (".") : (", New pet skin unlocked."));
					SCM(playerid, COLOR_RED, gString);
				}
				case 1: {
					new str[50];
					for(new i = 0; i < 6; i++) {
						format(str, 50, "{%s}%s\t%d\n", PlayerInfo[playerid][pPetLevel] < i * 4 ? ("FF0000") : ("00FF00"), PetName[i]);
						strcat(gString, str);
					}
					ShowPlayerDialog(playerid, DIALOG_PETOBJ, DIALOG_STYLE_LIST, "Pet object:", gString, "Select", "Close");
				}
				case 2: {
					PlayerInfo[playerid][pPetStatus] = PlayerInfo[playerid][pPetStatus] ? false : true;
					UpdateVar(playerid, "PetStatus", PlayerInfo[playerid][pPetStatus]);
					if(PlayerInfo[playerid][pPetStatus]) SetPlayerPet(playerid);
					else RemovePlayerPet(playerid);
					format(gString, 100, "(Pet) {FFFFFF}Pet status is now %s.", PlayerInfo[playerid][pPetStatus] ? ("{FFFF00}Enabled") : ("Disabled"));
					SCM(playerid, COLOR_RED, gString);
				}
				case 3: ShowPlayerDialog(playerid, DIALOG_PETNAME, DIALOG_STYLE_INPUT, "Pet Name:", "Introdu numele pentru PET.", "Continue", "Close");
			}
		}
		case DIALOG_PETNAME: {
			if(!response)
				return bool:true;

			if(strlen(inputtext) < 3 || strlen(inputtext) > 30)
				return SCM(playerid, COLOR_LGREEN, "Numele pentru pet trebuie sa fie intre (3 - 30 charactere).");

			format(PlayerInfo[playerid][pPetName], 30, inputtext);
			UpdateVarStr(playerid, "PetName", PlayerInfo[playerid][pPetName]);
			format(gString, 100, "(Pet) {FFFFFF}Noul nume de la pet este %s.", inputtext);
			SCM(playerid, COLOR_RED, gString);

			if(PlayerInfo[playerid][pPetStatus]) {
				format(gString, 100, "{50D654}Lvl. {FFFFFF}%d {50D687}%s", PlayerInfo[playerid][pPetLevel], PlayerInfo[playerid][pPetName]);
				Update3DTextLabelText(Pet[playerid], COLOR_WHITE, gString);
			}
		}
		case DIALOG_PETOBJ: {
			if(!response)
				return bool:true;

			if(PlayerInfo[playerid][pPet] == listitem+1)
				return SCM(playerid, COLOR_LGREEN, "Already pet set.");

			if(PlayerInfo[playerid][pPetLevel] < listitem * 4)
				return SCM(playerid, COLOR_GREY, "Nu ai pet level necesar pentru pune acest pet.");

			format(gString, 100, "(Pet) {FFFFFF}the new set pet is %s.", PetName[listitem]);
			SCM(playerid, COLOR_RED, gString);
			PlayerInfo[playerid][pPet] = listitem+1;
			UpdateVar(playerid, "Pet", listitem);
			if(!PlayerInfo[playerid][pPetStatus])
				return bool:true;

			RemovePlayerPet(playerid);
			SetPlayerPet(playerid);
		}
		case DIALOG_TRADE: {
			if(!response)
				return bool:true;

			switch(listitem) {
				case 0: {
					if(TradeObject[playerid][0] != -1)
						return SCM(playerid, COLOR_LGREEN, "Ai pus deja o suma de bani in trade.");

					ShowPlayerDialog(playerid, DIALOG_TRADEMONEY, DIALOG_STYLE_INPUT, "Trade Money", "Introdu suma pe care vrei sa o pui in trade\nEste cuprinsa ($1 - $1.000.000.000)", "Select", "Close");
				}
				case 1: {
					if(TradeObject[playerid][1] != -1)
						return SCM(playerid, COLOR_LGREEN, "Ai pus un vehicul in trade.");
					
					if(!Iter_Count(MyVehicles<playerid>))
						return SCM(playerid, COLOR_LGREEN, "Nu ai nici un vehicul personal.");

					new szString[75 * MAX_PLAYER_VEHICLE], x = 0;
					foreach(new idd : MyVehicles<playerid>) {
						format(gString, 100, "%s - %s\n", GetVehicleName(CarInfo[idd][cModel]), GetVehicleUpgrades(idd)); 
						strcat(szString, gString);
						PlayerInfo[playerid][pCarKey][x] = idd;
						x++;		
					}
					ShowPlayerDialog(playerid, DIALOG_TRADEVEHICLE, DIALOG_STYLE_LIST, "Trade Car", szString, "Select", "Close");
				}
				case 2: {
					if(TradeObject[playerid][2] != -1)
						return SCM(playerid, COLOR_LGREEN, "Ai deja un skin pus.");

					if(GetSkinRare(GetPlayerSkin(playerid)) != 1)
						return ShowPlayerDialog(playerid, DIALOG_ONLINE, DIALOG_STYLE_MSGBOX, "Trade Skin:", "Nu poti pune acest skin", "Ok", "");
				
					format(gString, sizeof(gString), "Esti sigur ca vrei sa pui acest skin %d (%s)?", GetPlayerSkin(playerid), GetSkinType(GetPlayerSkin(playerid)));
					ShowPlayerDialog(playerid, DIALOG_TRADESKIN, DIALOG_STYLE_MSGBOX, "Trade Skin:", gString, "Select", "Cancel");
				}
				case 3: {
					if(TradeObject[playerid][3] != -1)
						return SCM(playerid, COLOR_LGREEN, "Ai pus deja casa in trade.");

					if(PlayerInfo[playerid][pHouse] == -1)
						return SCM(playerid, COLOR_GREY, "Nu ai o casa.");
				
					format(gString, sizeof(gString), "Esti sigur ca vrei sa adaugi casa #%d in trade?", PlayerInfo[playerid][pHouse]);
					ShowPlayerDialog(playerid, DIALOG_TRADEHOUSE, DIALOG_STYLE_MSGBOX, "Trade House:", gString, "Select", "Cancel");
				}
				case 4: {
					if(TradeObject[playerid][4] != -1)
						return SCM(playerid, COLOR_LGREEN, "Ai pus deja bizul in trade.");

					if(PlayerInfo[playerid][pHouse] == -1)
						return SCM(playerid, COLOR_GREY, "Nu ai un biz.");
				
					format(gString, sizeof(gString), "Esti sigur ca vrei sa adaugi business-ul #%d in trade?", PlayerInfo[playerid][pBussines]);
					ShowPlayerDialog(playerid, DIALOG_TRADEBIZ, DIALOG_STYLE_MSGBOX, "Trade Business:", gString, "Select", "Cancel");
				}
				case 5: {
					if(TradeObject[playerid][5] != -1)
						return SCM(playerid, COLOR_LGREEN, "Ai deja pus acest tip de voucher in trade!");

					if(!PlayerInfo[playerid][pVoucher][0])
						return SCM(playerid, COLOR_GREY, "Nu ai acest tip de voucher.");
				
					listitemm[playerid] = strval(inputtext);
					if(listitemm[playerid] < 0) return true;
					if(listitemm[playerid] < PlayerInfo[playerid][pVoucher][0])
						return SCM(playerid, COLOR_LGREEN, "Eroare: Nu ai aceasta suma de vouchere!");

					format(gString, sizeof(gString), "Esti sigur ca vrei sa adaugi %d Rare Vocuher in trade?", strval(inputtext));
					ShowPlayerDialog(playerid, DIALOG_TRADEVOUCHERR, DIALOG_STYLE_MSGBOX, "Trade Voucher:", gString, "Select", "Cancel");
				}
				case 6: {
					if(TradeObject[playerid][6] != -1)
						return SCM(playerid, COLOR_LGREEN, "Ai deja pus acest tip de voucher in trade!");

					if(!PlayerInfo[playerid][pVoucher][1])
						return SCM(playerid, COLOR_GREY, "Nu ai acest tip de voucher.");

					listitemm[playerid] = strval(inputtext);
					if(listitemm[playerid] < 0) return true;
					if(listitemm[playerid] < PlayerInfo[playerid][pVoucher][1])
						return SCM(playerid, COLOR_LGREEN, "Eroare: Nu ai aceasta suma de vouchere!");
				
					format(gString, sizeof(gString), "Esti sigur ca vrei sa adaugi %d Natrox Vocuher in trade?", strval(inputtext));
					ShowPlayerDialog(playerid, DIALOG_TRADEVOUCHERR1, DIALOG_STYLE_MSGBOX, "Trade Voucher:", gString, "Select", "Cancel");
				}
				case 7: {
					if(TradeObject[playerid][7] != -1)
						return SCM(playerid, COLOR_LGREEN, "Ai deja pus acest tip de voucher in trade!");

					if(!PlayerInfo[playerid][pVoucher][2])
						return SCM(playerid, COLOR_GREY, "Nu ai acest tip de voucher.");

					listitemm[playerid] = strval(inputtext);
					if(listitemm[playerid] < 0) return true;
					if(listitemm[playerid] < PlayerInfo[playerid][pVoucher][2])
						return SCM(playerid, COLOR_LGREEN, "Eroare: Nu ai aceasta suma de vouchere!");
				
					format(gString, sizeof(gString), "Esti sigur ca vrei sa adaugi %d Special Vocuher in trade?", strval(inputtext));
					ShowPlayerDialog(playerid, DIALOG_TRADEVOUCHERR2, DIALOG_STYLE_MSGBOX, "Trade Voucher:", gString, "Select", "Cancel");
				}
			}
		}
		case DIALOG_TRADEVOUCHERR: {
			if(!response)
				return ShowPlayerDialog(playerid, DIALOG_TRADE, DIALOG_STYLE_LIST, "Trade", "Money\nVehicle\nCurrent Skin\nHouse\nBusiness\nRare Voucher (50 PP)\nNatrox Voucher (100 PP)\nSpecial Voucher (500 PP)", "Ok", "Cancel");

			AddTradeItem(playerid, 5, listitemm[playerid]);
		}
		case DIALOG_TRADEVOUCHERR1: {
			if(!response)
				return ShowPlayerDialog(playerid, DIALOG_TRADE, DIALOG_STYLE_LIST, "Trade", "Money\nVehicle\nCurrent Skin\nHouse\nBusiness\nRare Voucher (50 PP)\nNatrox Voucher (100 PP)\nSpecial Voucher (500 PP)", "Ok", "Cancel");

			AddTradeItem(playerid, 6, listitemm[playerid]);
		}
		case DIALOG_TRADEVOUCHERR2: {
			if(!response)
				return ShowPlayerDialog(playerid, DIALOG_TRADE, DIALOG_STYLE_LIST, "Trade", "Money\nVehicle\nCurrent Skin\nHouse\nBusiness\nRare Voucher (50 PP)\nNatrox Voucher (100 PP)\nSpecial Voucher (500 PP)", "Ok", "Cancel");

			AddTradeItem(playerid, 7, listitemm[playerid]);
		}
		case DIALOG_TRADEHOUSE: {
			if(!response)
				return ShowPlayerDialog(playerid, DIALOG_TRADE, DIALOG_STYLE_LIST, "Trade", "Money\nVehicle\nCurrent Skin\nHouse\nBusiness\nRare Voucher (50 PP)\nNatrox Voucher (100 PP)\nSpecial Voucher (500 PP)", "Ok", "Cancel");

			new x = PlayerInfo[playerid][pHouse];
			if(HouseInfo[x][hValue] != 0) {
				SCM(playerid, COLOR_YELLOW, "Casa a fost scoasa de la vanzare.");
				HouseInfo[x][hValue] = 0;
				UpdateHouseLabel(x);
			}

			AddTradeItem(playerid, 3, x);
		}
		case DIALOG_TRADEBIZ: {
			if(!response)
				return ShowPlayerDialog(playerid, DIALOG_TRADE, DIALOG_STYLE_LIST, "Trade", "Money\nVehicle\nCurrent Skin\nHouse\nBusiness\nRare Voucher (50 PP)\nNatrox Voucher (100 PP)\nSpecial Voucher (500 PP)", "Ok", "Cancel");

			new x = PlayerInfo[playerid][pBussines];
			if(BizzInfo[x][bValue] != 0) {
				SCM(playerid, COLOR_YELLOW, "Business-ul tau a fost scos de la vanzare.");
				BizzInfo[x][bValue] = 0;
				UpdateBizzLabel(x);
			}

			AddTradeItem(playerid, 4, x);
		}
		case DIALOG_TRADESKIN: {
			if(!response)
				return ShowPlayerDialog(playerid, DIALOG_TRADE, DIALOG_STYLE_LIST, "Trade", "Money\nVehicle\nCurrent Skin\nHouse\nBusiness\nRare Voucher (50 PP)\nNatrox Voucher (100 PP)\nSpecial Voucher (500 PP)", "Ok", "Cancel");

			AddTradeItem(playerid, 2, GetPlayerSkin(playerid));			
		}
		case DIALOG_TRADEVEHICLE: {
			if(!response)
				return ShowPlayerDialog(playerid, DIALOG_TRADE, DIALOG_STYLE_LIST, "Trade", "Money\nVehicle\nCurrent Skin\nHouse\nBusiness\nRare Voucher (50 PP)\nNatrox Voucher (100 PP)\nSpecial Voucher (500 PP)", "Ok", "Cancel");

			new idd = PlayerInfo[playerid][pCarKey][listitem];
			if(CarInfo[idd][cSpawned] == INVALID_VEHICLE)
				return SCM(playerid, COLOR_LGREEN, "Acest vehicul nu este spawnat!");

			AddTradeItem(playerid, 1, idd);
		}
		case DIALOG_TRADEMONEY: {
			if(!response)
				return ShowPlayerDialog(playerid, DIALOG_TRADE, DIALOG_STYLE_LIST, "Trade", "Money\nVehicle\nCurrent Skin\nHouse\nBusiness\nRare Voucher (50 PP)\nNatrox Voucher (100 PP)\nSpecial Voucher (500 PP)", "Ok", "Cancel");

			if(GetPlayerCash(playerid) < strval(inputtext))
				return SCM(playerid, COLOR_LGREEN, "Nu ai aceasta suma de bani.");

			if(strval(inputtext) < 1 || strval(inputtext) > 1000000000)
				return SCM(playerid, COLOR_LGREEN, "Poti pune intre ($1 - $1.000.000.000).");

			AddTradeItem(playerid, 0, strval(inputtext));
		}
		case DIALOG_VOTE: {
			if(!response) 
				return true;

			MapVotes[PaintType[playerid] - 1][listitem] ++;
			Voted[playerid] = true;
			format(gString, 75, "[VOTE] %s voted for map %s.", GetName(playerid), MapName(listitem, true));
			SendPaintMessage(PaintType[playerid], COLOR_SERVER, gString);
		}	
		case DIALOG_PAINT: {
			if(!response)
				return bool:true;

			if(Iter_Count(PlayerPaint[listitem]) >= 20)
				return SCM(playerid, COLOR_LGREEN, "Aceasta camera este plina.");

			PaintType[playerid] = listitem + 1, PKills[playerid] = 0, PDeath[playerid] = 0;
			Iter_Add(PlayerPaint[listitem], playerid);
			format(gString, 100, "%s has joined the paintball arena.", GetName(playerid));
			SendPaintMessage(listitem + 1, COLOR_LIGHTGOLD, gString);
			GivePlayerCash(playerid, -200);
			PlayerTextDrawHide(playerid, PaintTD);
			ResetPlayerWeapons(playerid);
			PaintSpawn(playerid);
			BizzInfo[listitemm[playerid]][bFee] += 200;

			if(Iter_Count(PlayerPaint[listitem]) >= 2 && PB_Status[listitem] < 1) {
				PB_Time[listitem] = 15;
				PB_Status[listitem] = 1;
				PB_Best[listitem] = -1;
				SendPaintMessage(listitem + 1, COLOR_YELLOW, "The round will start in a minute. To vote on a map, use the command /votemap.");
			}
		}
		case DIALOG_HELP: {
			if(!response)
				return bool:true;

			switch(listitem) {
				case 0: ShowPlayerDialog(playerid, DIALOG_HELP1, DIALOG_STYLE_MSGBOX, "Help", "Account Commands\n\n/stats - verifica statsticile tale.\n/changepass - iti schimbi parola.\n/id - verifici ID-ul unui jucaotr.\n/licenses - verifici licensesle detiunute.\n/ph - iti pui / scoti casca.\n/time verifici cat timp ai jucat de la ultimul PayDay primit.", "Back", "Close");
				case 1: ShowPlayerDialog(playerid, DIALOG_HELP1, DIALOG_STYLE_MSGBOX, "Help", "General Commands\n\n/report - poti raporta o problema\n/n - Poti pune o intrebare.\n/pay poti da bani unu jucator aflat langa tine.\n/drink - Cumperi bautura dintr-un bar.\n\
					/showlicenses - arati licentele unui jucator\n/accept - Accepti o invitatie/lucru.\n/cancel refuzi o invitatie/lucru.\n/service - Apelezi la un serviciu.\n/eject - dai un player afara din vehicul.\n/fill - faci plinul.\n/tog - activezi dezactivezi anumite actuni.", "Back", "Close");
				case 2: ShowPlayerDialog(playerid, DIALOG_HELP1, DIALOG_STYLE_MSGBOX, "Help", "Chat Commands\n\n/w - soptesti unui player aflat langa tine.\n/s - strigi.\n/ad - pui un anunt\n/f - chatul factiuni.\n/c - chatul clanului.", "Back", "Close");
				case 3: ShowPlayerDialog(playerid, DIALOG_HELP1, DIALOG_STYLE_MSGBOX, "Help", "Bank Commands\n\n/balance - vezi blanta contului tau\n/withdraw - scoti o suma de bani din contul tau bancar.\n/deposit - pui o suma de bani in contul tau bancar.", "Back", "Close");
				case 4: ShowPlayerDialog(playerid, DIALOG_HELP1, DIALOG_STYLE_MSGBOX, "Help", "Vehicle Commands\n\n/v - administrezi vehicule personale.\n/swapcolors - schimbi culorile intre ele.\n/carplate - pui numar de inmatriculare.\n/park - parchezi vehiculul.\n/carcolor - setezi culorile vehicululi.\n/lock (sau tasta N) - inchizi/deschizi vehiculul.\n/towcar - poti respawnezi un vehicul personal intr-un mod mai usor.\n/findcar - poti localiza un vehicul personal intr-un mod mai usor.", "Back", "Close");
				case 5: ShowPlayerDialog(playerid, DIALOG_HELP1, DIALOG_STYLE_MSGBOX, "Help", "House Commands\n\n/housemenu - meniul casei.\n/heal - viata din casa (daca este upgaradata casa).\n/sellhousetostate - vinzi casa la stat.", "Back", "Close");
				case 6: ShowPlayerDialog(playerid, DIALOG_HELP1, DIALOG_STYLE_MSGBOX, "Help", "Business Commands\n\n/bizmenu - meniu biz.\n/sellbiztostate - vinzi afacerea la stat.", "Back", "Close");
				case 7: {
					switch(PlayerInfo[playerid][pMember]) {
						case 1, 2, 11: {
							ShowPlayerDialog(playerid, DIALOG_HELP1, DIALOG_STYLE_MSGBOX, "Help", "Faction Commands\n\n/duty\n/tazer - tragi in cinveva si primeste freeze pentru 8 secunde.\n/so - avertizezi un player sa traga pe dreapta/sa opreasca.\n/free - eliberezi o persoana de la inchisoare.\n/svf - spawnezi o masina a factiuni.\n/wanted - vezi toti suspecti connectati cu wanted.\n/m - folosesti megaphone.\n/su - dai wanted unui player.\n/cuff - incatusesti un player.\n/mdc - vezi detalile suspectului.\n/arrest - aresetezi un player.\n/duty - on/off duty\n/confiscate - confisiti licente/droguri.\n/fdeposit - pentru a depozita bani,materiale,droguri", "Back", "Close");
						}
						case 3, 4, 8, 12: {
							ShowPlayerDialog(playerid, DIALOG_HELP1, DIALOG_STYLE_MSGBOX, "Help", "Faction Commands\n\n/duty\n/setguns - setezi armele pe care vrei sa le primesti.\n/order - primesti armele setate din (/setguns).\n/attack - pornesti un war (rank 6+).\n/fdeposit - pentru a depozita bani,materiale,droguri", "Back", "Close");
						}
						case 5: ShowPlayerDialog(playerid, DIALOG_HELP1, DIALOG_STYLE_MSGBOX, "Help", "Faction Commands\n\n/duty\n/calls - vezi comenzile factiuni tale.\n/fare - setezi un tarif.\n/fdeposit - pentru a depozita bani,materiale,droguri", "Back", "Close");
						case 6: ShowPlayerDialog(playerid, DIALOG_HELP1, DIALOG_STYLE_MSGBOX, "Help", "Faction Commands\n\n/duty\n/calls - vezi comenzile factiuni tale.\n/heal - dai heal unui player.\n/fdeposit - pentru a depozita bani,materiale,droguri", "Back", "Close");
						case 7: ShowPlayerDialog(playerid, DIALOG_HELP1, DIALOG_STYLE_MSGBOX, "Help", "Faction Commands\n\n/duty\n/calls - vezi comenzile factiuni tale.\n/startlession - incepi o sesiune.\n/stoplession - opresti sesiunea.\n/givelicense - dai licenta unui jucator.\n/fdeposit - pentru a depozita bani,materiale,droguri", "Back", "Close");
						case 9: ShowPlayerDialog(playerid, DIALOG_HELP1, DIALOG_STYLE_MSGBOX, "Help", "Faction Commands\n\n/duty\n/order - cumperi arme din HQ.\n/contracts - vezi contractele.\n/gethit - primesti un contract.\n/undercover - te pui subacoperire.\n/fdeposit - pentru a depozita bani,materiale,droguri", "Back", "Close");
						case 10: ShowPlayerDialog(playerid, DIALOG_HELP1, DIALOG_STYLE_MSGBOX, "Help", "Faction Commands\n\n/duty\n/news - pui un anunt.\n/live - incepi un live.\n/stoplive - opresti un live.\n/fdeposit - pentru a depozita bani,materiale,droguri", "Back", "Close");
					}
				}
				case 8: ShowPlayerDialog(playerid, DIALOG_HELP1, DIALOG_STYLE_MSGBOX, "Help", "Phone Commands\n\n/call - apelezi un jucator,\n/sms - dai mesaj unu jucator.\n/p - raspunzi la apel.\n/h - inchizi apelul.\n/number - vezi numarul unui jucator.", "Back", "Close");
				case 9: ShowPlayerDialog(playerid, DIALOG_HELP1, DIALOG_STYLE_MSGBOX, "Help", "Jobs Commands\n\n/work - pornesti munca.\n/stopwork - opresti munca.\n/find - catuti un jucator.\n/sellmats - vinzi materiale.\n/selldrugs - vinzi droguri.\n/sellgun - vinzi arme.\n/getweed - colectezi drogurile\n/takedrugs - primesti drogurile colectate.\n/pickup - colectezi gunoiul.\n\n/unloadtrash - descarci gunoiul.\n", "Back", "Close");
				case 10: ShowPlayerDialog(playerid, DIALOG_HELP1, DIALOG_STYLE_MSGBOX, "Help", "Clan Commands\n\n/clan, /c, /cinvite, /cpark, /ccolor, /cvr, /cdeposit", "Back", "Close");
			}
		}
		case DIALOG_HELP1: {
			if(!response)
				return bool:true;

			ShowPlayerDialog(playerid, DIALOG_HELP, DIALOG_STYLE_LIST, "Help", "Account\nGeneral\nChat\nBank\nVehicles\nHouses\nBusiness\nFaction\nPhone\nJobs\nClan", "Select", "Close");
		}
		case DIALOG_SETGUN: {
			if(!response)
				return bool:true;

			if(GunSetModel[4][listitem] > PlayerInfo[playerid][pRank])
				return SCM(playerid, COLOR_WHITE, "Nu ai rankul necesar pentru a poseda aceasta arma.");

			gunset[playerid][listitem] = !gunset[playerid][listitem];

			strcat(gString, "Gun\tMinim rank\tStatus\n");
			new string[50];
			for(new i = 0; i < 5; i++) {
				GetWeaponName(GunSetModel[0][i], string, 24);
				format(string, 50, "%s\t%d+\t%s\n", string, GunSetModel[4][i], gunset[playerid][i] ? ("{00ff00}selected") : ("{ff0000}not selected"));
				strcat(gString, string);
			}
			ShowPlayerDialog(playerid, DIALOG_SETGUN, DIALOG_STYLE_TABLIST_HEADERS, "Set Gun:", gString, "Select", "Close");
			_query(256,"UPDATE `users` SET `guns` = '%i %i %i %i %i' WHERE `id` = '%i'", gunset[playerid][0], gunset[playerid][1], gunset[playerid][2], gunset[playerid][3], gunset[playerid][4], PlayerInfo[playerid][pSQLID]);
		}
		case DIALOG_LICITATIE: {
			if(!response)
				return bool:true;

			if(listitemm[playerid] <= CalculateMinBid()) {
				format(gString, 50, "Trebuie sa licitezi minim %d milioane.", CalculateMinBid());
				SCM(playerid, COLOR_LGREEN, gString);
				return bool:true;
			}

			Licitatie_money = listitemm[playerid];
			Licitatie_player = playerid;

			format(gString, 100, "> %s a licitat suma de $%s.000.000 pentru %s %d", GetName(playerid), FormatNumber(listitemm[playerid]), GetLicitateType(Licitatie_type), Licitatie_ID);
			SCMTA(0x544087FF, gString);
		}
		case DIALOG_EDITRAPORT: {
			if(!response)
				return bool:true;

			new id = listitemm[playerid], i = listitem;
			SetPVarInt(playerid, "Index_R", i);
			format(gString, 125, "Ranks\tRaport\nRank 1\t%d\nRank 2\t%d\nRank 3\t%d\nRank 4\t%d\nRank 5\t%d\nRank 6\t%d\nRank 7\t%d", FactionRaport[id][1][i], FactionRaport[id][2][i], FactionRaport[id][3][i], FactionRaport[id][4][i], FactionRaport[id][5][i], FactionRaport[id][6][i], FactionRaport[id][7][i]);
			ShowPlayerDialog(playerid, DIALOG_RAPORTRANK, DIALOG_STYLE_TABLIST_HEADERS, "Edit Raport: Select Rank", gString, "Select", "Close");
		}
		case DIALOG_RAPORTRANK: {
			if(!response)
				return bool:true;

			SetPVarInt(playerid, "R_list", listitem+1);
			ShowPlayerDialog(playerid, DIALOG_RAPORTVALUE, DIALOG_STYLE_INPUT, "Edit Raport: Value", "Insert raport rank value:", "Done", "Close");
		}
		case DIALOG_RAPORTVALUE: {
			if(!response)
				return bool:true;

			if(!IsNumeric(inputtext))
				return ShowPlayerDialog(playerid, DIALOG_RAPORTVALUE, DIALOG_STYLE_INPUT, "Edit Raport: Value", "Insert raport rank value:", "Done", "Close");

			new id = listitemm[playerid], r = GetPVarInt(playerid, "R_list"), i = GetPVarInt(playerid, "Index_R");
			FactionRaport[id][r][i] = strval(inputtext);
			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `factions` SET `RaportRank%d` = '%d|%d|%d' WHERE `ID` = '%d'", r + 1, FactionRaport[id][r][0], FactionRaport[id][r][1], FactionRaport[id][r][2], FactionInfo_[id][fID]);
			mysql_tquery(SQL, gQuery);
			format(gString, 150, "(/editfaction) {FFFFFF}%s a editat raport la factiunea %s, %s in %d rank %d.", GetName(playerid), FactionInfo_[id - 1][fName], RaportName(id, i), strval(inputtext), r);
			SendAdminMessage(COLOR_LIGHTRED, gString, 6);
		}
		case DIALOG_TICKET: {
			if(!response) 
				return bool:true;

			new id = listitemm[playerid];
			if(!PlayerOfRangeToPlayer(playerid, 8, id))
				return SCM(playerid, -1, "Acel player nu este langa tine.");

			SetCoolDowns(playerid, 25, 60);
			format(gString, 150, "* I-ai dat lui %s o amenda in valoare de $%s, motiv: %s", GetName(id), FormatNumber(ticketValue(listitem)), ticketName(listitem));
			SCM(playerid, COLOR_MONEY, gString);
			format(gString, 150, "* Ofiter %s ti-a dat o amenda in valoare de $%s, motiv: %s, scrie /accept ticket %d pentru a accepta.", GetName(playerid), FormatNumber(ticketValue(listitem)), ticketName(listitem), playerid);
			SCM(id, COLOR_MONEY, gString);
			PlayerVar[id][TicketOffer] = playerid;
			PlayerVar[id][TicketMoney] = ticketValue(listitem);		
		}
		case DIALOG_WANTED: {
			if(!response)
				return bool:true;

			new id = PlayerCalls[playerid][listitem], Float: Pos[3];
			GetPlayerPos(id, Pos[0], Pos[1], Pos[2]);
			ShowMDC(playerid, id);
			format(gString, 125, "* Punctul a fost setat pe %s (%d) care se afla in zona %s.", GetName(id), id, GetPlayer3DZone2(Pos[0], Pos[1], Pos[2]));
			SCM(playerid, COLOR_YELLOW, gString);

			PlayerVar[playerid][Find] = id;

			PlayerTextDrawSetPreviewModel(playerid, FindPTD[0], GetPlayerSkin(id));
			PlayerTextDrawShow(playerid, FindPTD[0]);
			PlayerTextDrawShow(playerid, FindPTD[1]);

			UpdatePlayerFind(playerid);
		}
		case DIALOG_CALLS: {
			if(!response)
				return bool:true;

			new id = PlayerCalls[playerid][listitem], i = CallType[id];
			if(i == -1) return SCM(playerid, COLOR_GREY, "Acest player nu a apelat la servicele tale.");

			if(CallService[id][i] && CallServiceAccept[id][i] == -1) {
				if(PlayerVar[playerid][HaveCalls] != -1) return SCM(playerid, COLOR_GREY, "Ai acceptat deja o comanda, pentru a renunta la cea curenta, foloseste (/cancel service).");
				if(CallServiceAccept[id][i] != -1) return SCM(playerid, COLOR_GREY, "Comanda acelui player a fost acceptat de catre alt membru al factiunii.");
				PlayerVar[playerid][HaveCalls] = id;
				CallServiceAccept[id][i] = playerid;
				CallService[id][i] = false;

				new Float: Pos[3];
				PlayerVar[playerid][Find] = id;
				GetPlayerPos(id, Pos[0], Pos[1], Pos[2]);

				PlayerTextDrawSetPreviewModel(playerid, FindPTD[0], GetPlayerSkin(id));
				PlayerTextDrawShow(playerid, FindPTD[0]);
				PlayerTextDrawShow(playerid, FindPTD[1]);

				UpdatePlayerFind(playerid);
				format(gString, 150, "**(( %s Dispatch: %s %s (%d) i-a acceptat comanda lui %s (%d). ))**", FactionInfo_[i+4][fName], CallsName[i], GetName(playerid), playerid, GetName(id), id);
				SendFactionMessage(i+5, 0x2C6CBFFf, gString);
				format(gString, 100, "* %s %s ti-a preluat comanda.", CallsName[i], GetName(playerid));
				SCM(id, COLOR_YELLOW, gString);	
				Iter_Remove(Calls[i+4], id);
			}
			else return SCM(playerid, COLOR_LGREEN, "Acel player nu a apelat la serviciile factiunii tale sau comanda lui a fost accepta de altcineva!");
		}
		case DIALOG_SERVICE: {
			if(!response)
				return bool:true;

			if(CallService[playerid][listitem])
				return SCM(playerid, COLOR_GREY, "Ai trimis deja o cerere.");

			if(PlayerInfo[playerid][pMember] == listitem+5)
				return SCM(playerid, COLOR_GREY, "Nu poti apela la seriviciile tale.");

			if(Iter_Count(Factions<listitem+5>) < 1) return SCM(playerid, COLOR_LGREEN, "Nu sunt playeri in aceasta factiune.");

			new Float:x,Float:y,Float:z;
			SCMf(playerid, COLOR_WHITE, "Ai apelat la serviciile pentru %s. Asteapta in acest loc..", FactionInfo_[listitem+4][fName]);
			format(gString, 150, "** (( %s Dispatch: %s (%d) are nevoie de un %s. Acesta se afla in zona %s. )) **", FactionInfo_[listitem+4][fName], GetName(playerid), playerid, CallsType[listitem], GetPlayer3DZone2(x, y, z));
			SendFactionMessage(listitem+5, 0x2C6CBFFF, gString);
			CallService[playerid][listitem] = true;
			Iter_Add(Calls[listitem+4], playerid);
			CallType[playerid] = listitem;
			CallServiceAccept[playerid][listitem] = -1;
		}
		case DIALOG_GMX: {
			if(!response)
				return bool:true;


			format(gString, 75, "SERVER: {FFFFFF}%s a programat un restart.", GetName(playerid));
			SendClientMessageToAll(COLOR_SERVER, gString);
			RestartCount = 30;
			SetTimer("GMX", 1000, true);
		}
		case DIALOG_FMATS: {
			if(!response)
				return bool:true;

			switch(listitem) {
				case 0: {
					format(gString, 50, "Ai primit %d materiale.", PlayerVar[playerid][Mats][0]);
					SCM(playerid, COLOR_YELLOW, gString);
					PlayerInfo[playerid][pMats] += PlayerVar[playerid][Mats][0];
					UpdateVar(playerid, "Mats", PlayerInfo[playerid][pMats]);
					CheckPlayerMission(playerid, 12, PlayerVar[playerid][Mats][0]);
					CheckPlayerMission(playerid, 13, PlayerVar[playerid][Mats][0]);
				}
				case 1: {
					format(gString, 50, "Ai vandut materialele si ai primit $%s.", FormatNumber(PlayerVar[playerid][Mats][1]));
					SCM(playerid, COLOR_YELLOW, gString);
				 	GivePlayerCash(playerid, PlayerVar[playerid][Mats][1]);				
				}
			}
			addSkillJob(playerid, PlayerInfo[playerid][pJob]-1);
		}
		case DIALOG_MATS: {
			if(!response)
				return bool:true;

			switch(listitem) {
				case 0: SetPlayerCheckpointEx(playerid, CP_MATS, -248.7563,2598.7144,62.8582, 3.0);
				case 1: SetPlayerCheckpointEx(playerid, CP_MATS, 2558.4790,-1211.8296,54.5313, 3.0);
				case 2: SetPlayerCheckpointEx(playerid, CP_MATS, 251.1599,31.3631,2.1833, 3.0);
				case 3: SetPlayerCheckpointEx(playerid, CP_MATS, -265.4337,994.4671,19.4678, 3.0);
			}
			SetCoolDowns(playerid, 13, 120);
			SCM(playerid, COLOR_WHITE, "{9F9FF1}(Job) {FFFFFF}Ti-am pus checkpoint pe minimapa pentru a primi materialele.");
		}
		case DIALOG_RENT: {
			if(!response)
				return bool:true;

			new Float: pos[4];
			GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
			GetPlayerFacingAngle(playerid, pos[3]);
			PlayerVar[playerid][RentVehicle] = CreateVehicleEx(RentModel[0][listitem], pos[0], pos[1], pos[2], pos[3], -1, -1, -1, 0);
			VehicleAcces[PlayerVar[playerid][RentVehicle]] = playerid;
			SetVehicleDoor(PlayerVar[playerid][RentVehicle], true);
			PutPlayerInVehicle(playerid, PlayerVar[playerid][RentVehicle], 0);
			Fuel[PlayerVar[playerid][RentVehicle]] = 100;
			SetVehicleNumberPlate(PlayerVar[playerid][RentVehicle], "Rent Vehicle");
			Iter_Add(Renters, playerid);
			GiveVehicleKey(playerid, PlayerVar[playerid][RentVehicle]);
			format(gString, 100, "Ai inchiriat un %s. La fiecare 10 secunde o sa platesti $200.", GetVehicleName(RentModel[0][listitem]));
			SCM(playerid, COLOR_YELLOW, gString);
			SCM(playerid, COLOR_YELLOW, "Pentru a despawna masina foloseste (/unrentveh).");
		}
		case DIALOG_MEMBERSEDIT: {
			if(!response)
				return bool:true;

			listitemm[playerid] = listitem;
			switch(listitem) {
				case 0: ShowPlayerDialog(playerid, DIALOG_MEMBERS1, DIALOG_STYLE_INPUT, "Rank members setting:", "Scrie mai jos rank pe care vrei sa ii setezi.", "Continue", "Close");
				case 1: ShowPlayerDialog(playerid, DIALOG_MEMBERS1, DIALOG_STYLE_INPUT, "Faction Warn:", "Oferai jucatorului faction warn\nScrie mai jos motivul:", "Continue", "Close");
				case 2: {
					if(EditPlayer[playerid][3] < 1)
						return SCM(playerid, COLOR_LGREEN, "Acel player nu are Faction Warn.");

					ShowPlayerDialog(playerid, DIALOG_MEMBERS1, DIALOG_STYLE_INPUT, "Faction Warn:", "Oferai jucatorului un faction warn\nScrie mai jos motivul:", "Continue", "Close");
				}
				case 3: ShowPlayerDialog(playerid, DIALOG_MEMBERS1, DIALOG_STYLE_INPUT, "Faction Uninvite: fara function punish", "Scoate-l pe jucator din factiune\nScrie mai jos motivul actiuni:", "Continue", "Close");
				case 4: ShowPlayerDialog(playerid, DIALOG_MEMBERS1, DIALOG_STYLE_INPUT, "Faction Uninvite: cu faction punish", "Scoate-l pe jucator din factiune\nScrie mai jos motivul actiuni:", "Continue", "Close");
			}
		}
		case DIALOG_MEMBERS1: {
			if(!response)
				return bool:true;

			switch(listitemm[playerid]) {
				case 0: {
					new rank = strval(inputtext);
					if(rank < 1 || rank >= PlayerInfo[playerid][pRank])
						return SCM(playerid, COLOR_GREY, "Invalid Rank.");

					if(EditPlayer[playerid][1] != -1) PlayerInfo[EditPlayer[playerid][1]][pRank] = rank;
					mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `users` SET `Rank` = '%i' WHERE `id` = '%i'", rank, EditPlayer[playerid][2]);
					mysql_tquery(SQL, gQuery);

					format(gString, 125, "(%s, rank %d) ti-a modificat rankul in %d. (Faction)", GetName(playerid), PlayerInfo[playerid][pRank], pNames[playerid], rank);
					SendPlayerEmail(pNames[playerid], gString, EditPlayer[playerid][1]);

					format(gString, 125, "* %s i-a modificat rankul lui %s in rank %d.", GetName(playerid), pNames[playerid], rank);
					SendFactionMessage(PlayerInfo[playerid][pMember], COLOR_LIGHTBLUE, gString);
				}
				case 1: {
					if(strlen(inputtext) < 10)
						return ShowPlayerDialog(playerid, DIALOG_MEMBERS1, DIALOG_STYLE_INPUT, "Faction Warn:", "Oferai jucatorului faction warn\nScrie mai jos motivul:\n{FF0000}Motivul este prea mic!", "Continue", "Close");
					
					new id = EditPlayer[playerid][1];

					format(gString, 100, "* %s i-a oferit lui %s faction warn. Motiv: %s", GetName(playerid), pNames[playerid], inputtext);
					SendFactionMessage(PlayerInfo[playerid][pMember], COLOR_LIGHTBLUE, gString);

					format(gString, 150, "Ai primit faction warn de la %s. Motiv: %s", GetName(playerid), inputtext);
					SendPlayerEmail(pNames[playerid], gString, id);
					gQuery[0] = EOS;
					if(EditPlayer[playerid][3] + 1 >= 3) {
						format(gString, 100, "* %s a fost scos din factiune. Motiv: 3/3 Faction Warn", pNames[playerid]);
						SendFactionMessage(PlayerInfo[playerid][pMember], COLOR_LIGHTBLUE, gString);

						format(gString, 150, "Ai fost scos din factiunea %s. Motiv: 3/3 Faction Warn", FactionInfo_[EditPlayer[playerid][4] - 1][fName]);
						SendPlayerEmail(pNames[playerid], gString, id);	
						if(id != -1) {
							SCM(id, COLOR_LIGHTRED, "Ai fost scos din factiune motiv: 3/3 Faction Warn.");				

							UninvitePlayerFaction(id, EditPlayer[playerid][5]<14?30:0);	
							PlayerInfo[id][pFWarn] = 0;				
						} else {
							mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `users` SET `Spawnchange` = '0', `Rank` = '0', `Member` = '0' WHERE `id` = '%i'", EditPlayer[playerid][2]);
							mysql_tquery(SQL, gQuery);
						}
						EditPlayer[playerid][3] = 0;
					} else {
						EditPlayer[playerid][3] ++;
						if(id != -1) PlayerInfo[id][pFWarn] ++;
					}
					mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `users` SET `FWarn` = '%i' WHERE `id` = '%i'", EditPlayer[playerid][3], EditPlayer[playerid][2]);
					mysql_tquery(SQL, gQuery);					
				}
				case 2: {
					if(strlen(inputtext) < 10)
						return ShowPlayerDialog(playerid, DIALOG_MEMBERS1, DIALOG_STYLE_INPUT, "Faction Warn:", "Oferai jucatorului un faction warn\nScrie mai jos motivul:\n{FF0000}Motivul este prea mic!", "Continue", "Close");
				
					format(gString, 100, "* %s i-a scos un Faction Warn lui %s. Motiv: %s", GetName(playerid), pNames[playerid], inputtext);
					SendFactionMessage(PlayerInfo[playerid][pMember], COLOR_LIGHTBLUE, gString);
				
					format(gString, 150, "Ai primit un faction warn de la %s. Motiv: %s", GetName(playerid), inputtext);
					SendPlayerEmail(pNames[playerid], gString, EditPlayer[playerid][1]);

					EditPlayer[playerid][3] --;
					if(EditPlayer[playerid][1] != -1) PlayerInfo[EditPlayer[playerid][1]][pFWarn] --;

					gQuery[0] = EOS;
					mysql_format(SQL, gQuery, 100, "UPDATE `users` SET `FWarn` = '%i' WHERE `id` = '%i'", EditPlayer[playerid][3], EditPlayer[playerid][2]);
					mysql_tquery(SQL, gQuery);
				}
				case 3: {
					if(strlen(inputtext) < 10)
						return ShowPlayerDialog(playerid, DIALOG_MEMBERS1, DIALOG_STYLE_INPUT, "Faction Uninvite:", "Scoate-l pe jucator din factiune\nScrie mai jos motivul actiuni:\n{FF0000}Motivul este prea mic!", "Continue", "Close");
					
					new id = EditPlayer[playerid][1];

					format(gString, 100, "* %s l-a scos pe %s din factiune fara FP. Motiv: %s", GetName(playerid), pNames[playerid], inputtext);
					SendFactionMessage(PlayerInfo[playerid][pMember], COLOR_LIGHTBLUE, gString);

					format(gString, 150, "%s te-a scos din factiunea %s fara FP. Motiv: %s", GetName(playerid), FactionInfo_[PlayerInfo[playerid][pMember] -1][fName], inputtext);
					SendPlayerEmail(pNames[playerid], gString, id);
					if(id != -1) UninvitePlayerFaction(id, 0);			
					else {
						gQuery[0] = EOS;
						mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `users` SET `Spawnchange` = '0', `Rank` = '0', `Member` = '0' WHERE `id` = '%i'", EditPlayer[playerid][2]);
						mysql_tquery(SQL, gQuery);
					}				
				}
				case 4: {
					if(strlen(inputtext) < 10)
						return ShowPlayerDialog(playerid, DIALOG_MEMBERS1, DIALOG_STYLE_INPUT, "Faction Uninvite:", "Scoate-l pe jucator din factiune\nScrie mai jos motivul actiuni:\n{FF0000}Motivul este prea mic!", "Continue", "Close");
					
					new id = EditPlayer[playerid][1];

					format(gString, 100, "* %s l-a scos pe %s din factiune cu 30 FP. Motiv: %s", GetName(playerid), pNames[playerid], inputtext);
					SendFactionMessage(PlayerInfo[playerid][pMember], COLOR_LIGHTBLUE, gString);

					format(gString, 150, "%s te-a scos din factiunea %s cu 30 FP. Motiv: %s", GetName(playerid), FactionInfo_[PlayerInfo[playerid][pMember] -1][fName], inputtext);
					SendPlayerEmail(pNames[playerid], gString, id);
					if(id != -1) UninvitePlayerFaction(id, 30);			
					else {
						gQuery[0] = EOS;
						mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `users` SET `Spawnchange` = '0', `FP` = '30', `Rank` = '0', `Member` = '0' WHERE `id` = '%i'", EditPlayer[playerid][2]);
						mysql_tquery(SQL, gQuery);
					}				
				}
			}
		}
		case DIALOG_MEMBERS: {
			if(!response)
				return bool:true;

			if(PlayerInfo[playerid][pRank] < 6) 
				return SCM(playerid, COLOR_LGREEN, "Ai nevoie de rank 6+ pentru a configura.");

			new f = PlayerInfo[playerid][pMember] - 1;
			if(listitem==0) {
				FactionInfo_[f][fStatus] = !FactionInfo_[f][fStatus];
				format(gString, sizeof gString, "* %s %s", GetName(playerid), FactionInfo_[f][fStatus]?("a deschis aplicatiile!"):("a inchis aplicatiile!"));
				SendFactionMessage(f+1,COLOR_LIGHTBLUE,gString);

				_query(256, "UPDATE `factions` SET `Status` = '%i' WHERE `ID` = '%i'", FactionInfo_[f][fStatus], FactionInfo_[f][fID]);
				return true;
			}
			format(pNames[playerid], MAX_PLAYER_NAME, PlayerSelected[playerid][listitem-1]);

			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof gQuery, "SELECT * FROM `users` WHERE `name`='%s'", PlayerSelected[playerid][listitem-1]);
			mysql_tquery(SQL, gQuery, "SQL_CheckMembers", "i", playerid);
		}
		case DIALOG_SUSPECT: {
			if(!response)
				return bool:true;

			new id = GetPVarInt(playerid, "Userid"), level;
			if(!IsPlayerConnected(id))
				return SCM(playerid, COLOR_GREY, "Player not connected.");

			level = wantedList[listitem][0];
			PlayerInfo[id][pWanted] = level + PlayerInfo[id][pWanted] > 6 ? 6 : level+PlayerInfo[id][pWanted];
			SetPlayerWanted(id, PlayerInfo[id][pWanted]);
			GiveCrime(id, playerid, wantedName(listitem));
            PlayCopSound();
            Iter_Add(Calls[9], id);
		}
		case DIALOG_CLANMEMBERS: {
			if(!response)
				return ShowPlayerDialog(playerid, DIALOG_CLAN, DIALOG_STYLE_LIST, "Clan Menu", "Members\nClan Tag\nVehicles\nSafebox\nSettings", "Select", "Close");
		
			format(pNames[playerid], MAX_PLAYER_NAME, PlayerSelected[playerid][listitem]);
			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof gQuery, "SELECT * FROM `users` WHERE `name` = '%s'", pNames[playerid]);
			mysql_tquery(SQL, gQuery, "SQL_CheckPlayerClan", "i", playerid);
		}
		case DIALOG_CLANEDIT: {
			if(!response)
				return bool:true;

			listitemm[playerid] = listitem;
			switch(listitem) {
				case 0: ShowPlayerDialog(playerid, DIALOG_EDITCLAN, DIALOG_STYLE_INPUT, "Clan Rank", "Introdu rank-ul care vrei sa ii setezi:", "Continue", "Close");
				case 1: ShowPlayerDialog(playerid, DIALOG_EDITCLAN, DIALOG_STYLE_INPUT, "Clan Warn:", "Oferai jucatorului clan warn\nScrie mai jos motivul:", "Continue", "Close");
				case 2: ShowPlayerDialog(playerid, DIALOG_EDITCLAN, DIALOG_STYLE_INPUT, "Clan Warn:", "Oferai jucatorului un clan warn\nScrie mai jos motivul:", "Continue", "Close");
				case 3: ShowPlayerDialog(playerid, DIALOG_EDITCLAN, DIALOG_STYLE_INPUT, "Clan Uninvite:", "Scoate-l pe jucator din clan\nScrie mai jos motivul actiuni:", "Continue", "Close");
			}
		}
		case DIALOG_EDITCLAN: {
			if(!response)
				return bool:true;

			new x = GetClan[PlayerInfo[playerid][pClan]];
			switch(listitemm[playerid]) {
				case 0: {
					new rank = strval(inputtext);
					if(rank < 1 || rank >= PlayerInfo[playerid][pClanRank])
						return SCM(playerid, COLOR_GREY, "Invalid Rank.");

					if(EditPlayer[playerid][1] != -1) PlayerInfo[EditPlayer[playerid][1]][pClanRank] = rank;
					mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `users` SET `ClanRank` = '%i' WHERE `id` = '%i'", rank, EditPlayer[playerid][2]);
					mysql_tquery(SQL, gQuery);

					format(gString, 125, "(%s, rank %d) ti-a modificat rankul in %d. (Clans)", GetName(playerid), PlayerInfo[playerid][pRank], rank);
					SendPlayerEmail(pNames[playerid], gString, EditPlayer[playerid][1]);

					format(gString, 130, "{%s}[CLAN] %s i-a modificat rankul lui %s in rank %d.", ClanInfo[x][clColor], GetName(playerid), pNames[playerid], rank);
					SendClanMessage(playerid, COLOR_WHITE, gString);
				}
				case 1: {
					if(strlen(inputtext) < 10)
						return ShowPlayerDialog(playerid, DIALOG_EDITCLAN, DIALOG_STYLE_INPUT, "Clan Warn:", "Oferai jucatorului clan warn\nScrie mai jos motivul:\n{FF0000}Motivul este prea mic!", "Continue", "Close");
					
					new id = EditPlayer[playerid][1];

					format(gString, 100, "{%s}[CLAN] %s i-a oferit lui %s clan warn. Motiv: %s", ClanInfo[x][clColor], GetName(playerid), pNames[playerid], inputtext);
					SendClanMessage(playerid, COLOR_WHITE, gString);

					format(gString, 150, "Ai primit clan warn de la %s. Motiv: %s", GetName(playerid), inputtext);
					SendPlayerEmail(pNames[playerid], gString, id);
					gQuery[0] = EOS;
					if(EditPlayer[playerid][3] + 1 >= 3) {
						format(gString, 100, "{%s}[CLAN] %s a fost scos din clan. Motiv: 3/3 Clan Warn", ClanInfo[x][clColor], pNames[playerid]);
						SendClanMessage(playerid, COLOR_WHITE, gString);

						format(gString, 150, "Ai fost scos din clan-ul %s. Motiv: 3/3 Clan Warn", ClanInfo[x][clName]);
						SendPlayerEmail(pNames[playerid], gString, id);	
						if(id != -1) {
							SCM(id, COLOR_LIGHTRED, "Ai fost scos din clan motiv: 3/3 Clan Warn.");				

							Iter_Remove(Clans[x], playerid);

							PlayerInfo[id][pClan] = 0;
							PlayerInfo[id][pClanWarn] = 0;
							UpdateVar(id, "Clan", 0);
							if(PlayerInfo[id][pClanTag] < 2) SetPlayerName(playerid, PlayerInfo[id][pName]);				
						} else {
							mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `users` SET `Clan` = '0' WHERE `id` = '%i'", EditPlayer[playerid][2]);
							mysql_tquery(SQL, gQuery);
						}
						EditPlayer[playerid][3] = 0;
					} else {
						EditPlayer[playerid][3] ++;
						if(id != -1) PlayerInfo[id][pClanWarn] ++;
					}
					mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `users` SET `ClanWarns` = '%i' WHERE `id` = '%i'", EditPlayer[playerid][3], EditPlayer[playerid][2]);
					mysql_tquery(SQL, gQuery);					
				}
				case 2: {
					if(strlen(inputtext) < 10)
						return ShowPlayerDialog(playerid, DIALOG_EDITCLAN, DIALOG_STYLE_INPUT, "Clan Warn:", "Oferai jucatorului un clan warn\nScrie mai jos motivul:\n{FF0000}Motivul este prea mic!", "Continue", "Close");
				
					format(gString, 100, "{%s}[CLAN] %s i-a oferit un Clan Warn lui %s. Motiv: %s", ClanInfo[x][clColor], GetName(playerid), pNames[playerid], inputtext);
					SendClanMessage(playerid, COLOR_WHITE, gString);
				
					format(gString, 150, "Ai primit un clan warn de la %s. Motiv: %s", GetName(playerid), inputtext);
					SendPlayerEmail(pNames[playerid], gString, EditPlayer[playerid][1]);

					EditPlayer[playerid][3] --;

					if(EditPlayer[playerid][1] != -1) PlayerInfo[EditPlayer[playerid][1]][pClanWarn] --;

					gQuery[0] = EOS;
					mysql_format(SQL, gQuery, 100, "UPDATE `users` SET `ClanWarns` = '%i' WHERE `id` = '%i'", EditPlayer[playerid][3], EditPlayer[playerid][2]);
					mysql_tquery(SQL, gQuery);
				}
				case 3: {
					if(strlen(inputtext) < 10)
						return ShowPlayerDialog(playerid, DIALOG_EDITCLAN, DIALOG_STYLE_INPUT, "Clan Uninvite:", "Scoate-l pe jucator din clan\nScrie mai jos motivul actiuni:\n{FF0000}Motivul este prea mic!", "Continue", "Close");
					
					new id = EditPlayer[playerid][1];

					format(gString, 150, "%s te-a scos din clan-ul %s. Motiv: %s", GetName(playerid), ClanInfo[x][clName], inputtext);
					SendPlayerEmail(pNames[playerid], gString, id);
					if(id != -1) {
						format(gString, 100, "%s te-a scos din clan-ul %s. Motiv: %s", GetName(playerid), ClanInfo[x][clName], inputtext);
						SCM(id, COLOR_YELLOW, gString);

						Iter_Remove(Clans[x], playerid);

						PlayerInfo[id][pClan] = 0;
						UpdateVar(id, "Clan", 0);
						if(PlayerInfo[id][pClanTag] < 2) SetPlayerName(playerid, PlayerInfo[id][pName]);
					}	
					else {
						gQuery[0] = EOS;
						mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `users` SET `Clan` = '0', `ClanWarns` = '0' WHERE `id` = '%i'", EditPlayer[playerid][2]);
						mysql_tquery(SQL, gQuery);
					}	
					format(gString, 100, "{%s}[CLAN] %s l-a scos pe %s din factiune. Motiv: %s", ClanInfo[x][clColor], GetName(playerid), pNames[playerid], inputtext);
					SendClanMessage(playerid, COLOR_WHITE, gString);	
				}
			}
		}
		case DIALOG_CLAN: {
			if(!response)
				return bool:true;

			new x = GetClan[PlayerInfo[playerid][pClan]];
			switch(listitem) {
				case 0: {
					gQuery[0] = EOS;
					mysql_format(SQL, gQuery, 256, "SELECT * FROM `users` WHERE `Clan` = '%d' ORDER BY `users`.`ClanRank` DESC LIMIT %d", ClanInfo[x][clID], ClanInfo[x][clMembers]);
					mysql_tquery(SQL, gQuery, "SQL_cacheclans", "i", playerid);
				}
				case 1: {
					format(gString, 150, "{fdff90}%s{FFFFFF}%s\n%s{fdff90}%s\nRemove clan TAG", ClanInfo[x][clTag], PlayerInfo[playerid][pName], PlayerInfo[playerid][pName], ClanInfo[x][clTag]);
					ShowPlayerDialog(playerid, DIALOG_CLANTAG, DIALOG_STYLE_LIST, "Clan TAG", gString, "Select", "Back");
				}
				case 2: {
					new szString[500], r = 0;
					strcat(szString, "[{00ff00}+{FFFFFF}] Buy clan vehicle\n");
					foreach(new i : ClanVehicles[GetClan[PlayerInfo[playerid][pClan]]]) {
						format(gString, 100, "%d. %s%s\n", r + 1, ClanVeh[i][cvSpawned] != INVALID_VEHICLE ? IsVehicleOccupied(ClanVeh[i][cvSpawned]) ? ("[{FFFF00}occupied{FFFFFF}] ") : ("[{00FF00}spawned{FFFFFF}] ") : ("[{FF0000}despawned{FFFFFF}] "), GetVehicleName(ClanVeh[i][cvModel]));
						strcat(szString, gString);
						r++;
						PlayerInfo[playerid][pCarKey][r] = i;
					}
					ShowPlayerDialog(playerid, DIALOG_CLANVEH, DIALOG_STYLE_LIST, "Clan Vehicle:", szString, "Select", "Close");
				}
				case 3: {
					format(gString, 150, "Safebox: %s.\nSafebox primesti la job 25%%", FormatNumber(ClanInfo[x][clSafebox]));
					ShowPlayerDialog(playerid, DIALOG_ONLINE, DIALOG_STYLE_MSGBOX, "Safebox", gString, "Close", "");
				}
				case 4: {
					if(PlayerInfo[playerid][pClanRank] < 6)
						return SCM(playerid, COLOR_LGREEN, "Pentru aceasta functie ai nevoie de rank 6+");

					ShowPlayerDialog(playerid, DIALOG_CLAN_SETTING, DIALOG_STYLE_LIST, "Clan setting:", "Chat color\nClan color {FFFF00}(100 PP)\nRank color\nRank name\nClan Motd", "Select", "Close");
				}
			}
		}
		case DIALOG_CLAN_SETTING: {
			if(!response)
				return ShowPlayerDialog(playerid, DIALOG_CLAN, DIALOG_STYLE_LIST, "Clan Menu", "Members\nClan Tag\nVehicles\nSafebox\nSettings", "Select", "Close");

			new x = GetClan[PlayerInfo[playerid][pClan]];
			switch(listitem) {
				case 0: ShowPlayerDialog(playerid, DIALOG_CLAN_COLORCHAT, DIALOG_STYLE_INPUT, "Clan chat color", "Introdu codu hex\nFoloseste (https://htmlcolorcodes.com/)", "Continue", "Close");
				case 1: ShowPlayerDialog(playerid, DIALOG_CLANCOLOR, DIALOG_STYLE_INPUT, "Clan clan color", "Introdu codu hex\nFoloseste (https://htmlcolorcodes.com/)", "Continue", "Close");
				case 2: {
					format(gString, sizeof gString, "{%s}%s\n{%s}%s\n{%s}%s\n{%s}%s\n{%s}%s\n{%s}%s\n{%s}%s", ClanInfo[x][clRankColor1], ClanInfo[x][clRankName1], ClanInfo[x][clRankColor2], ClanInfo[x][clRankName2], 
						ClanInfo[x][clRankColor3], ClanInfo[x][clRankName3], ClanInfo[x][clRankColor4], ClanInfo[x][clRankName4], ClanInfo[x][clRankColor5], ClanInfo[x][clRankName5], ClanInfo[x][clRankColor6], ClanInfo[x][clRankName6],
						ClanInfo[x][clRankColor7], ClanInfo[x][clRankName7]);
					ShowPlayerDialog(playerid, DIALOG_CLAN_SETTINGRC, DIALOG_STYLE_LIST, "Rank color:", gString, "Select", "Back");
				}
				case 3: {
					format(gString, sizeof gString, "{%s}%s\n{%s}%s\n{%s}%s\n{%s}%s\n{%s}%s\n{%s}%s\n{%s}%s", ClanInfo[x][clRankColor1], ClanInfo[x][clRankName1], ClanInfo[x][clRankColor2], ClanInfo[x][clRankName2], 
						ClanInfo[x][clRankColor3], ClanInfo[x][clRankName3], ClanInfo[x][clRankColor4], ClanInfo[x][clRankName4], ClanInfo[x][clRankColor5], ClanInfo[x][clRankName5], ClanInfo[x][clRankColor6], ClanInfo[x][clRankName6],
						ClanInfo[x][clRankColor7], ClanInfo[x][clRankName7]);
					ShowPlayerDialog(playerid, DIALOG_CLAN_SETTINGNAME, DIALOG_STYLE_LIST, "Rank name:", gString, "Select", "Back");
				}
				case 4: ShowPlayerDialog(playerid, DIALOG_CLAN_MOTD, DIALOG_STYLE_INPUT, "Clan Motd", "Introdu motd pentru clan:", "Select", "Close");
			}
		}
		case DIALOG_CLAN_MOTD: {
			if(!response)
				return bool:true;

			if(strlen(inputtext) > 84)
				return SCM(playerid, COLOR_LGREEN, "Invalid long motd (maxim 84 characters).");

			new x = GetClan[PlayerInfo[playerid][pClan]];

			format(ClanInfo[x][clMotd], 84, inputtext);
			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `clans` SET `ClanMotd` = '%e' WHERE `ID` = '%i'", inputtext, ClanInfo[x][clID]);
			mysql_tquery(SQL, gQuery);
			format(gString, 150, "(Clan) {FFFFFF}Motd: %s", inputtext);
			SCM(playerid, COLOR_RED, gString);
		}
		case DIALOG_CLAN_SETTINGRC: {
			if(!response)
				return ShowPlayerDialog(playerid, DIALOG_CLAN_SETTING, DIALOG_STYLE_LIST, "Clan setting:", "Chat color\nClan color {FFFF00}(100 PP)\nRank color\nRank name\nClan Motd", "Select", "Close");
			listitemm[playerid] = listitem;
			ShowPlayerDialog(playerid, DIALOG_CLAN_RCOLOR, DIALOG_STYLE_INPUT, "Rank color", "Introdu codu hex\nFoloseste (https://htmlcolorcodes.com/)", "Select", "Close");
		}
		case DIALOG_CLAN_SETTINGNAME: {
			if(!response)
				return ShowPlayerDialog(playerid, DIALOG_CLAN_SETTING, DIALOG_STYLE_LIST, "Clan setting:", "Chat color\nClan color {FFFF00}(100 PP)\nRank color\nRank name\nClan Motd", "Select", "Close");
			
			listitemm[playerid] = listitem;
			ShowPlayerDialog(playerid, DIALOG_CLAN_RNAME, DIALOG_STYLE_INPUT, "Rank name", "Introdu numele la rank", "Select", "Close");
		}
		case DIALOG_CLANCOLOR: {
			if(!response)
				return ShowPlayerDialog(playerid, DIALOG_CLAN_SETTING, DIALOG_STYLE_LIST, "Clan setting:", "Chat color\nClan color {FFFF00}(100 PP)\nRank color\nRank name\nClan Motd", "Select", "Close");
		
			if(strlen(inputtext) < 6)
				return SCM(playerid, COLOR_LGREEN, "Invalid hex color");

			if(PlayerInfo[playerid][pPremiumPoints] < 100)
				return SCM(playerid, COLOR_LGREEN, "Eroare: Ai nevoie de 100 premium points!");

			PlayerInfo[playerid][pPremiumPoints] -= 100;
			UpdateVar(playerid, "PremiumPoints", PlayerInfo[playerid][pPremiumPoints]);

			format(ClanInfo[GetClan[PlayerInfo[playerid][pClan]]][clColor], 7, inputtext);
			mysql_format(SQL, gQuery, 150, "UPDATE `clans` SET `Color` = '%e' WHERE `ID` = '%i'", inputtext, ClanInfo[GetClan[PlayerInfo[playerid][pClan]]][clID]);
			mysql_tquery(SQL, gQuery);

			foreach(new i : ClanVehicles[GetClan[PlayerInfo[playerid][pClan]]]) {
				if(!ClanVeh[i][cvSpawned]) continue;

				AttachClanText(i);
			}

			format(gString, 100, "(Clan) {FFFFFF}Clan color: {%s}COLOR", inputtext);
			SCM(playerid, COLOR_RED, gString);
		}
		case DIALOG_CLAN_COLORCHAT: {
			if(!response)
				return ShowPlayerDialog(playerid, DIALOG_CLAN_SETTING, DIALOG_STYLE_LIST, "Clan setting:", "Chat color\nClan color {FFFF00}(100 PP)\nRank color\nRank name\nClan Motd", "Select", "Close");
		
			if(strlen(inputtext) < 6)
				return SCM(playerid, COLOR_LGREEN, "Invalid hex color");

			format(ClanInfo[GetClan[PlayerInfo[playerid][pClan]]][clChatColor], 7, inputtext);
			mysql_format(SQL, gQuery, 150, "UPDATE `clans` SET `ChatColor` = '%e' WHERE `ID` = '%i'", inputtext, ClanInfo[GetClan[PlayerInfo[playerid][pClan]]][clID]);
			mysql_tquery(SQL, gQuery);

			format(gString, 100, "(Clan) {FFFFFF}Clan chat color: {%s}COLOR", inputtext);
			SCM(playerid, COLOR_RED, gString);
		}
		case DIALOG_CLAN_RNAME: {
			if(!response)
				return ShowPlayerDialog(playerid, DIALOG_CLAN_SETTING, DIALOG_STYLE_LIST, "Clan setting:", "Chat color\nClan color {FFFF00}(100 PP)\nRank color\nRank name\nClan Motd", "Select", "Close");
		
			if(strlen(inputtext) < 5 || strlen(inputtext) > 25)
				return SCM(playerid, COLOR_LGREEN, "Invalid rank name.");

			new x = GetClan[PlayerInfo[playerid][pClan]];
			switch(listitemm[playerid]) {
				case 0: format(ClanInfo[x][clRankName1], 25, inputtext);
				case 1: format(ClanInfo[x][clRankName2], 25, inputtext);
				case 2: format(ClanInfo[x][clRankName3], 25, inputtext);
				case 3: format(ClanInfo[x][clRankName4], 25, inputtext);
				case 4: format(ClanInfo[x][clRankName5], 25, inputtext);
				case 5: format(ClanInfo[x][clRankName6], 25, inputtext);
				case 6: format(ClanInfo[x][clRankName7], 25, inputtext);
			}
			mysql_format(SQL, gQuery, 150, "UPDATE `clans` SET `RankName%i` = '%e' WHERE `ID` = '%i'", listitemm[playerid] + 1, inputtext, ClanInfo[x][clID]);
			mysql_tquery(SQL, gQuery);

			format(gString, 100, "(Clan) {FFFFFF}New rank %d name to %s", listitemm[playerid] + 1, inputtext);
			SCM(playerid, COLOR_RED, gString);
		}
		case DIALOG_CLAN_RCOLOR: {
			if(!response)
				return ShowPlayerDialog(playerid, DIALOG_CLAN_SETTING, DIALOG_STYLE_LIST, "Clan setting:", "Chat color\nClan color {FFFF00}(100 PP)\nRank color\nRank name\nClan Motd", "Select", "Close");
		
			if(strlen(inputtext) < 6)
				return SCM(playerid, COLOR_LGREEN, "Invalid hex color");

			if(listitemm[playerid]>6) return true;

			new x = GetClan[PlayerInfo[playerid][pClan]];
			switch(listitemm[playerid]) {
				case 0: format(ClanInfo[x][clRankColor1], 10, inputtext);
				case 1: format(ClanInfo[x][clRankColor2], 10, inputtext);
				case 2: format(ClanInfo[x][clRankColor3], 10, inputtext);
				case 3: format(ClanInfo[x][clRankColor4], 10, inputtext);
				case 4: format(ClanInfo[x][clRankColor5], 10, inputtext);
				case 5: format(ClanInfo[x][clRankColor6], 10, inputtext);
				case 6: format(ClanInfo[x][clRankColor7], 10, inputtext);
			}
			mysql_format(SQL, gQuery, 150, "UPDATE `clans` SET `RankColor%i` = '%e' WHERE `ID` = '%i'", listitemm[playerid] + 1, inputtext, ClanInfo[x][clID]);
			mysql_tquery(SQL, gQuery);

			format(gString, 100, "(Clan) {FFFFFF}New rank %d. {%s}COLOR", listitemm[playerid] + 1, inputtext);
			SCM(playerid, COLOR_RED, gString);
		}
		case DIALOG_CLAMMV: {
			if(!response)
				return bool:true;

			new idd = PlayerInfo[playerid][pCarKey][listitemm[playerid]];
			switch(listitem) {
				case 0: {
					if(IsVehicleOccupied(ClanVeh[idd][cvSpawned]))
						return SCM(playerid, COLOR_GREY, "Masina este ocupata.");

					format(gString, 100, "{%s}[CLAN] %s a %s masina %s.", ClanInfo[GetClan[ClanVeh[idd][cvClanID]]][clColor], GetName(playerid), ClanVeh[idd][cvSpawned] != INVALID_VEHICLE ? ("respawnat") : ("spawnat"), GetVehicleName(ClanVeh[idd][cvModel]));
					SCM(playerid, COLOR_WHITE, gString);
					if(ClanVeh[idd][cvSpawned] == INVALID_VEHICLE) CreateClanVehicle(idd);
					else SetVehicleToRespawn(ClanVeh[idd][cvSpawned]);
				}
				case 1: {
					if(ClanVeh[idd][cvSpawned] == INVALID_VEHICLE)
						return SCM(playerid, COLOR_LGREEN, "Masina nu este spawnata.");

					if(HaveCheckpoint(playerid))
						return ShowCancelCP(playerid);

					new Float: Pos[3];
					GetVehiclePos(ClanVeh[idd][cvSpawned], Pos[0], Pos[1], Pos[2]);
					SetPlayerCheckpointEx(playerid, CP_NORMAL, Pos[0], Pos[1], Pos[2], 5.0);
					SCM(playerid, COLOR_GREY, "Ti-a fost setat un checkpoint pe mapa.");				
				}
			}
		}
		case DIALOG_CLANVEH: {
			if(!response)
				return bool:true;

			if(!listitem) return ShowPlayerDialog(playerid, DIALOG_BUYCLANVEH, DIALOG_STYLE_TABLIST_HEADERS, "Buy Clan vehicle:", "Model\tPrice\nInfernus\t$2.000.000\nSultan\t$1.000.000\nStretch\t$1.500.000\nBullet\t$1.900.000", "Select", "Close");
			listitemm[playerid] = listitem;
			ShowPlayerDialog(playerid, DIALOG_CLAMMV, DIALOG_STYLE_LIST, "Clan Vehicle Menage:", "Tow park\nLocate Vehicle", "Select", "Close");
		}
		case DIALOG_BUYCLANVEH: {
			if(!response)
				return bool:true;

			new x = GetClan[PlayerInfo[playerid][pClan]];
			switch(listitem) {
				case 0: {
					if(ClanInfo[x][clSafebox] < 2000000)
						return SCM(playerid, COLOR_GREY, "Fonduri insuficiente.");

					mysql_tquery(SQL, "INSERT INTO `clanvehicles` (Model) VALUES (411)", "SQL_InsertClanVehicle", "iii", playerid, 411, PlayerInfo[playerid][pClan]);
					ClanInfo[x][clSafebox] -= 2000000;
				}
				case 1: {
					if(ClanInfo[x][clSafebox] < 1000000)
						return SCM(playerid, COLOR_GREY, "Fonduri insuficiente.");

					mysql_tquery(SQL, "INSERT INTO `clanvehicles` (Model) VALUES (560)", "SQL_InsertClanVehicle", "iii", playerid, 560, PlayerInfo[playerid][pClan]);
					ClanInfo[x][clSafebox] -= 1000000;
				}
				case 2: {
					if(ClanInfo[x][clSafebox] < 1500000)
						return SCM(playerid, COLOR_GREY, "Fonduri insuficiente.");

					mysql_tquery(SQL, "INSERT INTO `clanvehicles` (Model) VALUES (409)", "SQL_InsertClanVehicle", "iii", playerid, 409, PlayerInfo[playerid][pClan]);
					ClanInfo[x][clSafebox] -= 1500000;
				}
				case 3: {
					if(ClanInfo[x][clSafebox] < 1900000)
						return SCM(playerid, COLOR_GREY, "Fonduri insuficiente.");

					mysql_tquery(SQL, "INSERT INTO `clanvehicles` (Model) VALUES (541)", "SQL_InsertClanVehicle", "iii", playerid, 541, PlayerInfo[playerid][pClan]);
					ClanInfo[x][clSafebox] -= 1900000;
				}
			}
			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `clans` SET `Safebox` = '%i' WHERE `ID` = '%i'", ClanInfo[x][clSafebox], ClanInfo[x][clID]);
			mysql_tquery(SQL, gQuery);
		}
		case DIALOG_CLANTAG: {
			if(!response)
				return ShowPlayerDialog(playerid, DIALOG_CLAN, DIALOG_STYLE_LIST, "Clan Menu", "Members\nClan Tag\nVehicles\nSafebox\nSettings", "Select", "Close");

			if(PlayerInfo[playerid][pClanTag] == listitem)
				return bool:true;

			PlayerInfo[playerid][pClanTag] = listitem;
			SetPlayerClanTag(playerid);
			UpdateVar(playerid, "ClanTag", listitem);
		}
		case DIALOG_EMAIL: {
			if !response *then
				return true;

			if(!IsMail(inputtext)) {
				SCM(playerid, COLOR_GREY, "Invalid email. introdu un email valid.");
				ShowPlayerDialog(playerid, DIALOG_EMAIL, DIALOG_STYLE_INPUT, "Register (email)", "Input your email adress:", "Done", "Close");
				return true;
			}
			format(PlayerInfo[playerid][pEmail], 32, inputtext);
			format(gString, 20, "%s", PlayerInfo[playerid][pEmail]);
			PlayerTextDrawSetString(playerid, register_PTD[playerid][3], gString);
		}
		case DIALOG_EMAILREAD: {
			if(!response)
				return bool:true;

			ShowPlayerEmails(playerid);
		}
		case DIALOG_EMAILS: {
			if(!response)
				return bool:true;

			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof(gQuery), "SELECT * FROM `emails` WHERE `ID`='%d'", PlayerVar[playerid][EmailsID][listitem]);
			mysql_tquery(SQL, gQuery, "SQL_ReadEmails", "ii", playerid, PlayerVar[playerid][EmailsID][listitem]);
		}
		case DIALOG_CRATE: {
			if(!response)
				return true;

			if(PlayerInfo[playerid][pCrate][listitem] <= 0)
				return SCM(playerid, COLOR_LGREEN, "Nu ai un crate de acest tip."), ShowPlayerDialog(playerid, DIALOG_CRATE, DIALOG_STYLE_LIST, "SERVER: Crate", "{ABA952}Small Crate\n{877F98}Medium Crate\n{6020E7}Epic Crate", "Select", "Close");

			ShowPlayerCrate(playerid, listitem);
		}
		case DIALOG_SERVER: {
			if(!response)
				return bool:true;

			switch(listitem) {
				case 0: {
					mysql_tquery(SQL, "DELETE FROM `bans`");
					format(gString, 100, "SERVER: %s has unbaned all players.", GetName(playerid));
					SendAdminMessage(COLOR_SERVER, gString, 7);
				}
				case 2: {
					foreach(new i : Player) {
						if(!IsAdmin(playerid, 1)) {
							SCM(playerid, COLOR_SERVER, "Ai primit kick. Server-ul a intrat in mentenanta.");
							KickEx(playerid);
						}
					}
					SendAdminMessage(COLOR_SERVER, "Server-ul a intrat in mentenanta. Nu ai primit kick pentru ca esti admin.", 1);
					SendRconCommand("hostname "SERVER_NAME".ro - Mentenance.");
					SendRconCommand("password "SERVER_PASS);
				}
				case 3: ShowPlayerDialog(playerid, DIALOG_CHANGESVPASS, DIALOG_STYLE_INPUT, "Change Password:", "change the password from the server: ", "Select", "Close");
				case 4: ShowPlayerDialog(playerid, DIALOG_CHANGSVNAME, DIALOG_STYLE_INPUT, "Change Nickname:", "change the nickname form the server:", "Change", "Close");
				case 5: {
					mysql_tquery(SQL, "UPDATE `users` SET `DailyQuest` = '0'");
					foreach(new i : Player) if(IsPlayerLogged(i)) GivePlayerMission(i), SCM(i, COLOR_YELLOW, "* Misiunea zilei a fost resetata. Foloseste /quests pentru a vedea noile misiuni!");
				}
			}
		}
		case DIALOG_CHANGSVNAME: {
			if(!response)
				return bool:true;

			format(gString, sizeof gString, "hostname %s", inputtext);
			SendRconCommand(gString);
			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `server` SET `Name` = '%e' WHERE `ID` = '1'", inputtext);
			mysql_tquery(SQL, gQuery);
			format(gString, 125, "SERVER: {FFFFFF}new server nickname: %s", inputtext);
			SendAdminMessage(COLOR_SERVER, gString, 1);
		}
		case DIALOG_CHANGESVPASS: {
			if(!response)
				return bool:true;

			format(gString, 30, "password %s", inputtext);
			SendRconCommand(gString);
			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `server` SET `Password` = '%e' WHERE `ID` = '1'", inputtext);
			mysql_tquery(SQL, gQuery);
			format(gString, 125, "SERVER: {FFFFFF}new server password: %s.", strlen(inputtext) != 0 ? inputtext : ("removed"));
			SendAdminMessage(COLOR_SERVER, gString, 1);
		}
		case DIALOG_STAFF: {
			if(!response)
				return bool:true;

			gQuery[0] = EOS;
			switch(listitem) {
				case 0: mysql_tquery(SQL, "SELECT * FROM `users` WHERE `Admin` > '0' ORDER BY `users`.`Admin` ASC LIMIT 50", "SQL_LoadAdmins", "i", playerid);
				case 1: mysql_tquery(SQL, "SELECT * FROM `users` WHERE `Helper` > '0' ORDER BY `users`.`Helper` ASC LIMIT 50", "SQL_LoadHelpers", "i", playerid);
			}
		}
		case DIALOG_REPORT: {
			if(!response)
				return bool:true;

			switch(listitem) {
				case 0: {
					new string[1000];
					strcat(string, "Contul blocat");
					strcat(string, "\nDaca ai contul blocat automat va trebui sa astepti 72 de ore pana cand va fi deblocat.");
					strcat(string, "\nDaca ai contul blocat de catre un admin. Deschide un tichet pe panel."SERVER_NAME".ro");
					strcat(string, "\nDe acolo vei putea deschide un tichet pentru a discuta cu adminii despre ce a cauzat blocarea contului tau.");
					strcat(string, "\nAdmini nu iti va debloca contul din joc. Nu are rost sa intrebi pe /report cum poti sa iti deblochezi contul. Nu vei primi raspuns.");
					strcat(string, "\nCont spart");
					strcat(string, "\nDaca ai cont spart. Tot ce poti face e sa deschizi un tichet si sa astepti un raspuns. De obicei se primesc raspunsuri in mai putin de 24 ore.");
					strcat(string, "\nDaca ti-a fost contul spart e DOAR vina ta. Nu sunt admini vinovati si nimeni nu are vreo obligatie de a te ajuta cu nimic.");
					strcat(string, "\nTotusi, incercam sa ajutam playerii ce pot fi ajutati. Deci, deschide un tichet si asteapta un raspuns.");
					strcat(string, "\nPentru a deschide un tichet, intra pe panel."SERVER_NAME".ro > tichete > deschide tichet.");
					strcat(string, "\nNU da /report pentru a zice adminilor sa raspunda mai repede la tichete. Vei primi suspend pe report si atat.");
					ShowPlayerDialog(playerid, DIALOG_ONLINE, DIALOG_STYLE_MSGBOX, "Contul blocat", string, "Close", "");
				}
				case 1: ShowPlayerDialog(playerid, DIALOG_RAPORTDM, DIALOG_STYLE_INPUT, "Raport DM:", "Scrie mai jos ID-ul playerului care te-a atacat:", "Continue", "Close");
				case 2: ShowPlayerDialog(playerid, DIALOG_ONLINE, DIALOG_STYLE_MSGBOX, "Raport Cheater:", "Foloseste /cheat [id] [reason] pentru a raporta un player pentru cheat-uri.", "Close", "");
				case 3: {
					new string[1000];
					strcat(string, "Singura metoda de plata este PayPal. Nu va fi adaugat alta metoda de plata in viitorul apropiat.");
					strcat(string, "\nNu se pot face plati prin SMS, coduri de reincarcare, conturi steam, webmoney, paysafecard sau orice alta metoda de plata, doar PayPal.");
					strcat(string, "\nSingurele lucruri pe care le poti cumpara cu puncte premium pot fi gasite pe panel."SERVER_NAME".ro > server > premium");
					strcat(string, "\nPentru a citi despre cum poti face plati cu PayPal, intra pe wwww."SERVER_NAME".ro/paypal");
					strcat(string, "\nContul premium costa 150 puncte premium (5 euro PayPal). mai multe detalii poti gasi pe panel."SERVER_NAME".ro > server > premium");
					strcat(string, "\nDaca ai o problema cu platile, te rugam sa deschizi un tichet pe user panel (panel."SERVER_NAME".ro > server > tichete)");
					ShowPlayerDialog(playerid, DIALOG_ONLINE, DIALOG_STYLE_MSGBOX, "Donatii/Plati", string, "Close", "");
				}
				case 4: {
					SCM(playerid, COLOR_YELLOW, "A message was sent to admins. Motive: stuck.");
					format(gString, 65, "R: %s (ID: %d, LEVEL: %d) raported for stuck.", GetName(playerid), playerid, PlayerInfo[playerid][pLevel]);
					SendAdminMessage(COLOR_RED, gString, 1);
					format(PlayerVar[playerid][RaportText], 64, gString);
					PlayerVar[playerid][RaportType][0] = 2;
					Iter_Add(Reports[0], playerid);
					SetCoolDowns(playerid, 3, 119);
				}
				case 5: {
					SCM(playerid, COLOR_YELLOW, "A message was sent to admins. Motive: Business.");
					format(gString, 65, "R: %s (ID: %d, LEVEL: %d) it needs an admin for a business.", GetName(playerid), playerid, PlayerInfo[playerid][pLevel]);
					SendAdminMessage(COLOR_RED, gString, 1);
					format(PlayerVar[playerid][RaportText], 64, gString);
					PlayerVar[playerid][RaportType][0] = 3;		
					Iter_Add(Reports[0], playerid);		
					SetCoolDowns(playerid, 3, 119);
				}
				case 6: ShowPlayerDialog(playerid, DIALOG_RAPORTOTHER, DIALOG_STYLE_INPUT, "Raport:", "Scrie mai jos problema care o ai.", "Continue", "Close");
			}
		}
		case DIALOG_RAPORTDM: {
			if(!response)
				return bool:true;

			if(!IsNumeric(inputtext) || !IsPlayerConnected(strval(inputtext)) || !IsPlayerLogged(strval(inputtext)))
				return SCM(playerid, COLOR_GREY, "Invalid ID.");

			if(playerid == strval(inputtext))
				return SCM(playerid, COLOR_GREY, "You can't report it yourself.");

			if(IsAdmin(strval(inputtext), 1)) return true;

			format(gString, 65, "L-ai raportat pe %s(%d) pentru DM.", GetName(strval(inputtext)), strval(inputtext));
			SCM(playerid, COLOR_YELLOW, gString);
			format(gString, sizeof(gString), "DM %s(%d) raported by %s(%d).", GetName(strval(inputtext)), strval(inputtext), GetName(playerid), playerid);
			SendAdminMessage(COLOR_RED, gString, 1);	
			format(PlayerVar[playerid][RaportText], 64, gString);
			PlayerVar[playerid][RaportType][0] = 1;
			Iter_Add(Reports[0], playerid);
			SetCoolDowns(playerid, 3, 300);
		}
		case DIALOG_RAPORTOTHER: {
			if(!response)
				return bool:true;

			if(strlen(inputtext) < 3 || strlen(inputtext) > 64)
				return SCM(playerid, COLOR_GREY, "Char invalid.");

			SCM(playerid, COLOR_YELLOW, "The report has been sent to admins, waiting until you receive an answer.");
			format(gString, sizeof(gString), "R. %s[%d] (lvl: %d): %s", GetName(playerid), playerid, PlayerInfo[playerid][pLevel], inputtext);
			SendAdminMessage(COLOR_RED, gString, 1);
			format(PlayerVar[playerid][RaportText], 64, gString);
			PlayerVar[playerid][RaportType][0] = 4;
			Iter_Add(Reports[0], playerid);
			SetCoolDowns(playerid, 3, 300);
		}
		case DIALOG_PCOLOR: {
			if(!response)
				return bool:true;

			PlayerInfo[playerid][pColor] = listitem;
			UpdateVar(playerid, "Color", PlayerInfo[playerid][pColor]);
			if(listitem == 0) 
				return SCM(playerid, COLOR_PINK, "(Premium Colors) Ai dezactivat culoarea premium.");

			format(gString, sizeof(gString), "(Premium Colors) Noua culoare aleasa este {%s}aceasta{FFADAD}.", SColors[listitem]);
			SCM(playerid, COLOR_PINK, gString);
		}
		case DIALOG_TOG: {
			if(!response)
				return bool:true;

			if(!PlayerInfo[playerid][pAdmin] && listitem == 8) return true;

			PlayerInfo[playerid][pTog][listitem] = PlayerInfo[playerid][pTog][listitem] ? false : true;

			format(gString, sizeof(gString), "(TOG) %s was updated. New status is %s{FFADAD}.", TogName[listitem], PlayerInfo[playerid][pTog][listitem] ? ("{FFFF00}Enabled") : ("{FFFFFF}Disable"));
			SCM(playerid, 0xFFADADFF, gString);
			save_tog(playerid);

			switch(listitem) {
				case 6: {
					new idd = GetPlayerCar(playerid);
					if(idd == -1)
						return bool:true;

					if(PlayerInfo[playerid][pTog][6] && PlayerInfo[playerid][pVehRainbow] != 0 && !PlayerRainbow[playerid] && CarInfo[idd][cRainbow]) {
					    VehicleRainbow[playerid] = CarInfo[idd][cSpawned];
					   	PlayerRainbow[playerid] = PlayerInfo[playerid][pVehRainbow];
					   	rID[playerid] = 62;
					   	Iter_Add(Rainbows[PlayerInfo[playerid][pVehRainbow]], playerid);						
					} else {
						if(PlayerRainbow[playerid] != 0) {
					   		if(Iter_Contains(Rainbows[PlayerRainbow[playerid]], playerid)) Iter_Remove(Rainbows[PlayerRainbow[playerid]], playerid);
					   	}
						ChangeVehicleColor(CarInfo[idd][cSpawned], CarInfo[idd][cColor][0], CarInfo[idd][cColor][1]);
						PlayerRainbow[playerid] = false;
						VehicleRainbow[playerid] = false;
					}
				}
				case 8: {
					if(!PlayerInfo[playerid][pTog][8]) {
						for(new m = 0; m < 5; m++) SendDeathMessageToPlayer(playerid, 1001, 1001, 200);
					}
				}
			}
		}
		case DIALOG_SHOW: {
			if(!response)
				return bool:true;

			PlayerInfo[playerid][pHud][listitem] = !PlayerInfo[playerid][pHud][listitem];

			switch(listitem) {
				case 0: {
					if(PlayerInfo[playerid][pHud][listitem]) PlayerTextDrawShow(playerid, FPS);
					else PlayerTextDrawHide(playerid, FPS);
				}
				case 1: {
					new i=-1;
					if(!PlayerInfo[playerid][pHud][listitem]) {
						while(++i<11) TextDrawHideForPlayer(playerid, GoalTD[i]); i=-1;
						while(++i<4) PlayerTextDrawHide(playerid, GoalPTD[i]);
					}
					else {
						while(++i<11) TextDrawShowForPlayer(playerid, GoalTD[i]); i=-1;
						while(++i<4) PlayerTextDrawShow(playerid, GoalPTD[i]);
						updateJobGoal(playerid);
					}
				}
			}

			format(gString, sizeof(gString), "(HUD) %s was updated. New status is %s{FFADAD}.", HudName[listitem], PlayerInfo[playerid][pHud][listitem] ? ("{FFFF00}Enabled") : ("{FFFFFF}Disable"));
			SCM(playerid, 0xFFADADFF, gString);
			save_hud(playerid);
		}
		case DIALOG_CARRADIO: {
			if(!response)
				return bool:true;

			new i = GetPlayerVehicleID(playerid);
			if(listitem == 0) 
				return StopAudioStreamForPlayersInCar(i), CarRadio[i] = 0, PlayerVar[playerid][Radio] = 0;		

			foreach(new x : Player) {
				if(GetPlayerVehicleID(x) != GetPlayerVehicleID(playerid)) 
					continue;
				
				PlayerVar[x][Radio] = listitem;
			}									
			PlayAudioStreamForPlayersInCar(i, RadioLink[listitem]);
			format(gString, sizeof(gString), "* %s asculta acum %s.", GetName(playerid), RadioNames[listitem]);
			ProxDetector(20.0, playerid, gString, COLOR_PURPLE);	
			CarRadio[i] = listitem;
		}
		case DIALOG_SVF: {
			if(!response)
				return bool:true;

			new y = listitemm[playerid];

			if(VehFInfo[y][vfRank][listitem] > PlayerInfo[playerid][pRank])
				return SCM(playerid, COLOR_GREY, "Nu ai rank-ul necesar.");


			if(VehFInfo[y][vfStock][listitem] < 1)
				return SCM(playerid, COLOR_GREY, "Nu mai sunt in stock.");

			PlayerVar[playerid][FactionVehicle] = CreateVehicleEx(VehFInfo[y][vfModel][listitem], VehFInfo[y][vPos][0], VehFInfo[y][vPos][1], VehFInfo[y][vPos][2], VehFInfo[y][vPos][3], VehFInfo[y][vfColor1][listitem], VehFInfo[y][vfColor2][listitem], -1, 1);
			Fuel[PlayerVar[playerid][FactionVehicle]] = 100;

			ServerVehicle[PlayerVar[playerid][FactionVehicle]][vFaction] = PlayerInfo[playerid][pMember];

			VehFInfo[y][vfStock][listitem] --;
			PlayerVar[playerid][TimerCheckSpawns] = 7;

			PlayerVar[playerid][FactionObject][0] = -1;
			PlayerVar[playerid][FactionObject][1] = -1;

			svfFaction[playerid] = y;

			switch(VehFInfo[y][vfModel][listitem]) {
				case 411: {
					PlayerVar[playerid][FactionObject][0] = CreateDynamicObject(19327, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0);
					SetDynamicObjectMaterialText(PlayerVar[playerid][FactionObject][0], 0, "POLICE", 50, "Arial", 25, 1, -16777216, 0, 1);
					PlayerVar[playerid][FactionObject][1] = CreateDynamicObject(19419,0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0);
					AttachDynamicObjectToVehicle(PlayerVar[playerid][FactionObject][0], PlayerVar[playerid][FactionVehicle], 0.0, -1.9, 0.3, 270.0, 0.0, 0.0);
					AttachDynamicObjectToVehicle(PlayerVar[playerid][FactionObject][1], PlayerVar[playerid][FactionVehicle], 0.0646, 0.1661, 0.6957, 0.0000, 0.0000, 0.0000);
				} 
				case 522: {
					PlayerVar[playerid][FactionObject][0] = CreateDynamicObject(18646, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0);
					AttachDynamicObjectToVehicle(PlayerVar[playerid][FactionObject][0], PlayerVar[playerid][FactionVehicle], 0.000000, 0.654999, 0.459999, 0.000000, 0.000000, 0.000000);
				}
				case 541: {
					PlayerVar[playerid][FactionObject][0] = CreateDynamicObject(18646, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0);
					AttachDynamicObjectToVehicle(PlayerVar[playerid][FactionObject][0], PlayerVar[playerid][FactionVehicle], 0.375000,0.524999,0.375000,0.000000,0.000000,0.000000);
				}
				case 426: {
					PlayerVar[playerid][FactionObject][0] = CreateDynamicObject(19308, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0);
					AttachDynamicObjectToVehicle(PlayerVar[playerid][FactionObject][0], PlayerVar[playerid][FactionVehicle], 0.014999, -0.524999, 0.924999, 0.000000, 0.000000, 0.000000);
				}
				case 560: {
					if(PlayerInfo[playerid][pMember] == 5) {
						PlayerVar[playerid][FactionObject][0] = CreateDynamicObject(19308, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0);
						AttachDynamicObjectToVehicle(PlayerVar[playerid][FactionObject][0], PlayerVar[playerid][FactionVehicle], 0.014999, -0.204999, 0.914999, 0.000000, 0.000000, 0.000000);	
					}
				}
			}
			PutPlayerInVehicle(playerid, PlayerVar[playerid][FactionVehicle], 0);
			ServerVehicle[PlayerVar[playerid][FactionVehicle]][vFaction] = PlayerInfo[playerid][pMember];

			format(gString, sizeof(gString), "%s has spawned a %s (rank: %d. remaining stock: %d)", GetName(playerid), GetVehicleName(VehFInfo[y][vfModel][listitem]), VehFInfo[y][vfRank][listitem], VehFInfo[y][vfStock][listitem]);
			SendFactionMessage(PlayerInfo[playerid][pMember], COLOR_LGREEN, gString);
			SCM(playerid, COLOR_WHITE, "Poti despawna vehiculul prin (/dvf). Nu uita ca acesta se despawneaza singur daca mori sau daca bubuie.");
			SCM(playerid, COLOR_WHITE, "Pentru a localiza vehiculul poti folosi (/lvf).");
		}
		case DIALOG_SYSTEMS: {
			if(!response)
				return bool:true;

			ServerInfo_[sSystem][listitem] = ServerInfo_[sSystem][listitem] ? false : true; 

			format(gString, sizeof(gString), "Systems: %s a %s systemu de %s.", GetName(playerid), ServerSystem(listitem) ? ("activat") : ("dezactivat"), GetSystemName(listitem));
			SendAdminMessage(COLOR_RED, gString, 1);

			if(listitem == 6) {
				if(!ServerSystem(6)) for(new i = 1; i <= 3; i++) Iter_Clear(Rainbows[i]);
			}
		}
		case DIALOG_SHOP: {
			if(!response)
				return bool:true;

			listitemm[playerid] = listitem;

			switch(listitem) {
				case 0: ShowPlayerDialog(playerid, DIALOG_SHOP1, DIALOG_STYLE_MSGBOX, "Shop: -- Premium Account", "\n- 2 vehicle slot\n- Access la /pcolor\n- Access la /pc\nInteres 0.2 la banca\nEsti sigur ca vrei sa achizitionezi premium account costa 150 Premium Points.", "Select", "Close");
				case 1: ShowPlayerDialog(playerid, DIALOG_SHOP1, DIALOG_STYLE_MSGBOX, "Shop: -- IPhone --", "\nYou are sure want to buy a iPhone for 100 premium points?\n\nPoti avea numar format din 4 cifre.", "Continue", "Close");
				case 2: ShowPlayerDialog(playerid, DIALOG_SHOP1, DIALOG_STYLE_MSGBOX, "Shop: -- VIP Account --", "\nAi acces la chat-ul vip [/vc]\nO sa ai deasuprea capului 'VIP User'\nO sa poti vinde doi pesti la jobul fisherman.\nAccess la comanda /nos\nAccess la vip wheels din (/v)\nVei putea /pay pana la $20.000\nAccess la /repair odata la 30 min\nEsti sigur ca vrei sa iti achizitionezi vip account costa 350 Premium Points.", "Select", "Close");
				case 3: ShowPlayerDialog(playerid, DIALOG_SHOP1, DIALOG_STYLE_MSGBOX, "Shop: -- Clan --", "\nYou are sure want to buy a clan for 500 premium points?", "Continue", "Close");
				case 4: ShowPlayerDialog(playerid, DIALOG_SHOP1, DIALOG_STYLE_MSGBOX, "Shop: -- Hidden Colors --", "\nEsti sigur ca vrei sa achizitionezi un hidden colors cost 80 Premium Points.", "Select", "Close");
				case 5: ShowPlayerDialog(playerid, DIALOG_SHOP1, DIALOG_STYLE_MSGBOX, "Shop: -- Vehicle Slot --", "\nEsti sigur ca vrei sa achizitionezi un vehicle slot cost 50 Premium Points.", "Select", "Close");
				case 6: ShowPlayerDialog(playerid, DIALOG_SHOP1, DIALOG_STYLE_MSGBOX, "Shop: -- Clear 1 Warn --", "\nYou are sure want to buy a Clear 1 Warn for 60 premium points?", "Continue", "Close");
				case 7: ShowPlayerDialog(playerid, DIALOG_SHOP1, DIALOG_STYLE_MSGBOX, "Shop: -- Change Nickname --", "\nEsti sigur ca vrei sa iti schimbi numele cost 150 Premium Points.", "Select", "Close");
				case 8: ShowPlayerDialog(playerid, DIALOG_SHOP1, DIALOG_STYLE_MSGBOX, "Shop: -- Clear 30 FP --", "\nYou are sure want to buy a Clear 30 FP for 75 premium points?", "Continue", "Close");
				case 9: ShowPlayerDialog(playerid, DIALOG_SHOP1, DIALOG_STYLE_MSGBOX, "Shop: -- Rare Voucher --", "\nYou are sure want to buy a Rare Voucher for 55 premium points?", "Continue", "Close");
				case 10: ShowPlayerDialog(playerid, DIALOG_SHOP1, DIALOG_STYLE_MSGBOX, "Shop: -- Natrox Voucher --", "\nYou are sure want to buy a Rare Voucher for 110 premium points?", "Continue", "Close");
				case 11: ShowPlayerDialog(playerid, DIALOG_SHOP1, DIALOG_STYLE_MSGBOX, "Shop: -- Special Voucher --", "\nYou are sure want to buy a Special Voucher for 515 premium points?", "Continue", "Close");
				case 12: ShowPlayerDialog(playerid, DIALOG_SHOP1, DIALOG_STYLE_MSGBOX, "Shop: -- MP3 --", "\nYou are sure want to buy a MP3 for 50 premium points?", "Continue", "Close");
				case 13: ShowPlayerDialog(playerid, DIALOG_SHOP1, DIALOG_STYLE_MSGBOX, "Shop: -- Pet --", "\nYou are sure want to buy a Pet for 150 premium points?", "Continue", "Close");
			}
		}
		case DIALOG_SHOP1: {
			if(!response)
				return bool:true;

			switch(listitemm[playerid]) {
				case 0: {
					if(PlayerInfo[playerid][pPremiumAccount])
						return SCM(playerid, COLOR_GREY, "Ai deja premium account.");

					if(PlayerInfo[playerid][pPremiumPoints] < 150)
						return SCM(playerid, COLOR_GREY, "Nu ai aceasta suma de puncte premium.");

					PlayerInfo[playerid][pPremiumPoints] -= 150;
					PlayerInfo[playerid][pPremiumAccount] = true;
					PlayerInfo[playerid][pSlot] += 2;
					if(PlayerInfo[playerid][pSlot] > MAX_PLAYER_VEHICLE) PlayerInfo[playerid][pSlot] = MAX_PLAYER_VEHICLE;
					UpdateVar(playerid, "Slot", PlayerInfo[playerid][pSlot]);
					UpdateVar(playerid, "Premium", PlayerInfo[playerid][pPremiumAccount]);
					Iter_Add(PlayerPremium, playerid);
					PlayerInfo[playerid][pTog][0] = true;
					save_tog(playerid);
					SCM(playerid, COLOR_GM, "[SHOP] {FFFFFF}Felicitari! Ti-ai achizitionat un premium account pentru suma de 150 premium points.");
				}
				case 1: {
					if(PlayerInfo[playerid][pPremiumPoints]<100) return SCM(playerid, COLOR_GREY, "Nu ai aceasta suma de puncte premium.");
					format(gString, 10, "%d", PlayerInfo[playerid][pPhone]);
					if(strlen(gString) == 4)
						return SCM(playerid, COLOR_GREY, "Ai deja iPhone");

					ShowPlayerDialog(playerid, DIALOG_BUYIPHONE, DIALOG_STYLE_INPUT, "Buy iPhone:", "Introdu numarul format din 4 cifre:", "Done", "Close");
				}
				case 2: {
					if(PlayerInfo[playerid][pVip])
						return SCM(playerid, COLOR_GREY, "Ai deja cont VIP.");

					if(PlayerInfo[playerid][pPremiumPoints] < 350) 
						return SCM(playerid, COLOR_GREY, "Nu ai aceasta suma de puncte premium.");

					PlayerInfo[playerid][pVip] = true;
					PlayerInfo[playerid][pPremiumPoints] -= 350;
					UpdateVar(playerid, "VIP", PlayerInfo[playerid][pVip]);
					PlayerInfo[playerid][pTog][1] = true;
					Iter_Add(PlayerVIP, playerid);
					save_tog(playerid);
	   				VIPLabel[playerid] = Create3DTextLabel("VIP USER", 0x7DE41BFF, 0.0, 0.0, 0.0, 10.0, 0, 0);
	    			Attach3DTextLabelToPlayer(VIPLabel[playerid], playerid, 0.0, 0.0, 0.4);

					SCM(playerid, COLOR_GM, "[SHOP] {FFFFFF}Felicitari! Ti-ai achizitionat un VIP Account pentru suma de 350 premium points.");
				}
				case 3: {
					if(GetClan[PlayerInfo[playerid][pClan]] != -1) 
						return SCM(playerid, COLOR_GREY, "You're have already a clan.");

					if(PlayerInfo[playerid][pPremiumPoints] < 500)
						return SCM(playerid, COLOR_GREY, "You not have a 500 Premium points.");
					
					ShowPlayerDialog(playerid, DIALOG_BUYCLAN, DIALOG_STYLE_INPUT, "Buy Clan. Step 1:", "Inset a name for clan (5 - 25 Characters)", "Continue", "Close");
					return bool:true;
				}
				case 4: {
					if(PlayerInfo[playerid][pPremiumPoints] < 80)
						return SCM(playerid, COLOR_GREY, "Nu ai aceasta suma de puncte premium.");

					PlayerInfo[playerid][pPremiumPoints] -= 80;
					PlayerInfo[playerid][pHidden] ++;
					UpdateVar(playerid, "Hidden", PlayerInfo[playerid][pHidden]);
					SCM(playerid, COLOR_GM, "[SHOP] {FFFFFF}Felicitari! Ti-ai achizitionat un hidden colors pentru suma de 80 premium points.");
				}
				case 5: {
					if(PlayerInfo[playerid][pPremiumPoints] < 50)
						return SCM(playerid, COLOR_GREY, "Nu ai aceasta suma de puncte premium.");

					if(GetPlayerSlot(playerid) >= MAX_PLAYER_VEHICLE)
						return SCM(playerid, COLOR_GREY, "Ai numarul maxim de sloturi.");

					PlayerInfo[playerid][pPremiumPoints] -= 50;
					PlayerInfo[playerid][pSlot] ++;
					UpdateVar(playerid, "Slot", PlayerInfo[playerid][pSlot]);
					SCM(playerid, COLOR_GM, "[SHOP] {FFFFFF}Felicitari! Ti-ai achizitionat un vehicul slot pentru suma de 50 premium points.");
				}
				case 6: {
					if(PlayerInfo[playerid][pPremiumPoints] < 60)
						return SCM(playerid, COLOR_GREY, "Nu ai aceasta suma de puncte premium.");

					if(!PlayerInfo[playerid][pWarn])
						return SCM(playerid, COLOR_GREY, "Nu ai avertizari.");

					PlayerInfo[playerid][pPremiumPoints] -= 60;

					--PlayerInfo[playerid][pWarn];
					UpdateVar(playerid, "Warn", PlayerInfo[playerid][pWarn]);
					SCM(playerid, COLOR_GM, "[SHOP] {FFFFFF}Felicitari! Ti-ai achizitionat Clear 1 Warn pentru suma de 60 premium points.");
				}
				case 7: {
					if(PlayerInfo[playerid][pPremiumPoints] < 150)
						return SCM(playerid, COLOR_GREY, "Nu ai aceasta suma de puncte premium.");

					ShowPlayerDialog(playerid, DIALOG_CHANGENAME, DIALOG_STYLE_INPUT, "Change Name:", "Introdu noul nume pe care vrei sa setezi", "Continue", "Close");
				}
				case 8: {
					if(PlayerInfo[playerid][pPremiumPoints] < 75)
						return SCM(playerid, COLOR_GREY, "Nu ai aceasta suma de puncte premium.");

					if(!PlayerInfo[playerid][pFP])
						return SCM(playerid, COLOR_GREY, "Nu ai faction punish.");

					PlayerInfo[playerid][pPremiumPoints] -= 75;

					PlayerInfo[playerid][pFP] = 0;
					UpdateVar(playerid, "Punish", 0);
					SCM(playerid, COLOR_GM, "[SHOP] {FFFFFF}Felicitari! Ti-ai achizitionat Clear 30 FP pentru suma de 75 premium points.");
				}
				case 9: {
					if(PlayerInfo[playerid][pPremiumPoints] < 55)
						return SCM(playerid, COLOR_GREY, "Nu ai aceasta suma de puncte premium.");

					PlayerInfo[playerid][pPremiumPoints] -= 55;

					PlayerInfo[playerid][pVoucher][0]++;
					save_vouchers(playerid);
					SCM(playerid, COLOR_GM, "[SHOP] {FFFFFF}Felicitari! Ti-ai achizitionat Rare Vocuher pentru suma de 55 premium points.");
				}
				case 10: {
					if(PlayerInfo[playerid][pPremiumPoints] < 110)
						return SCM(playerid, COLOR_GREY, "Nu ai aceasta suma de puncte premium.");

					PlayerInfo[playerid][pPremiumPoints] -= 110;

					PlayerInfo[playerid][pVoucher][1]++;
					save_vouchers(playerid);
					SCM(playerid, COLOR_GM, "[SHOP] {FFFFFF}Felicitari! Ti-ai achizitionat Natrox Vocuher pentru suma de 110 premium points.");
				}
				case 11: {
					if(PlayerInfo[playerid][pPremiumPoints] < 515)
						return SCM(playerid, COLOR_GREY, "Nu ai aceasta suma de puncte premium.");

					PlayerInfo[playerid][pPremiumPoints] -= 515;

					PlayerInfo[playerid][pVoucher][2]++;
					save_vouchers(playerid);
					SCM(playerid, COLOR_GM, "[SHOP] {FFFFFF}Felicitari! Ti-ai achizitionat Special Vocuher pentru suma de 515 premium points.");
				}
				case 12: {
					if(PlayerInfo[playerid][pMP3])
						return SCM(playerid, COLOR_LGREEN, "Eroare: Ai deja MP3!");

					if(PlayerInfo[playerid][pPremiumPoints] < 50)
						return SCM(playerid, COLOR_GREY, "Nu ai aceasta suma de puncte premium.");

					PlayerInfo[playerid][pPremiumPoints] -= 50;

					PlayerInfo[playerid][pMP3] = true;
					UpdateVar(playerid, "MP3", true);
					SCM(playerid, COLOR_GM, "[SHOP] {FFFFFF}Felicitari! Ti-ai achizitionat MP3 pentru suma de 50 premium points.");
				}
				case 13: {
					if(PlayerInfo[playerid][pPet])
						return SCM(playerid, COLOR_LGREEN, "Eroare: Ai deja un Pet!");

					if(PlayerInfo[playerid][pPremiumPoints] < 150)
						return SCM(playerid, COLOR_GREY, "Nu ai aceasta suma de puncte premium.");

					PlayerInfo[playerid][pPremiumPoints] -= 150;

					PlayerInfo[playerid][pPet] = 1;
					UpdateVar(playerid, "Pet", 1);
					SCM(playerid, COLOR_GM, "[SHOP] {FFFFFF}Felicitari! Ti-ai achizitionat MP3 pentru suma de 50 premium points.");
				}
			}
			UpdateVar(playerid, "PremiumPoints", PlayerInfo[playerid][pPremiumPoints]);
		}
		case DIALOG_CHANGENAME: {
			if !response *then
				return true;

			if(strlen(inputtext) < 3 || strlen(inputtext) >= 20 || !strlen(inputtext))
				return SCM(playerid, COLOR_SERVER, "Invalid nickname.");

			mysql_format(SQL, gQuery, sizeof gQuery, "SELECT * FROM `users` WHERE `name` = '%e' LIMIT 1", inputtext);
			mysql_tquery(SQL, gQuery, #check_username, #isb, playerid, inputtext, true);
		}
		case DIALOG_BUYIPHONE: {
			if(!response)
				return bool:true;

			if(strval(inputtext) < 1000 || strval(inputtext) > 9999)
				return ShowPlayerDialog(playerid, DIALOG_BUYIPHONE, DIALOG_STYLE_INPUT, "Buy iPhone:", "Introdu numarul format din 4 cifre:", "Done", "Close"), SCM(playerid, COLOR_GREY, "Numarul tau trebuie sa fie format din 4 cifre!"), 1;


			mysql_format(SQL, gQuery, 100, "SELECT * FROM `users` WHERE `Phone` = '%i' LIMIT 1", strval(inputtext));
			mysql_tquery(SQL, gQuery, "SQL_CheckPhone", "ii", playerid, strval(inputtext));
		}
		case DIALOG_BUYCLAN: {
			if(!response)
				return bool:true;

			if(strlen(inputtext) < 5 || strlen(inputtext) > 25)
				return SCM(playerid, COLOR_GREY, "Invalid characters (5 - 25).");

			format(PlayerVar[playerid][ClanName], 25, inputtext);
			ShowPlayerDialog(playerid, DIALOG_BUYCLAN1, DIALOG_STYLE_INPUT, "Buy clan. Step 2:", "Inset a tag name for clan (3 - 10 characters)", "Continue", "Back");
		}
		case DIALOG_BUYCLAN1: {
			if(!response)
				return ShowPlayerDialog(playerid, DIALOG_BUYCLAN, DIALOG_STYLE_INPUT, "Buy Clan. Step 1:", "Inset a name for clan (5 - 25 Characters)", "Continue", "Close");
			
			if(strlen(inputtext) < 3 || strlen(inputtext) > 10)
				return SCM(playerid, COLOR_GREY, "Invalid characters (3 - 10).");

			if(inputtext[0] != '[' || inputtext[strlen(inputtext) - 1] != ']')
				return SCM(playerid, COLOR_GREY, "Invalid tag name, use for start '[' and end ']'."),ShowPlayerDialog(playerid, DIALOG_BUYCLAN, DIALOG_STYLE_INPUT, "Buy Clan. Step 1:", "Inset a name for clan (5 - 25 Characters)", "Continue", "Close");

			if(PlayerInfo[playerid][pPremiumPoints] < 250)
				return bool:true;

			format(pNames[playerid], 10, inputtext);
			mysql_format(SQL, gQuery, sizeof gQuery, "SELECT * FROM `clans` WHERE `Name` = '%e' OR `Tag` = '%e'", PlayerVar[playerid][ClanName], inputtext);
			mysql_tquery(SQL, gQuery, "SQL_cacheselectclan", "i", playerid);
		}
		case DIALOG_ONLINE: return bool:true;
		case DIALOG_GOTOJOB: {
			if(!response)
				return bool:true;

			SetPlayerPos(playerid, JobInfo[listitem][jPos][0], JobInfo[listitem][jPos][1], JobInfo[listitem][jPos][2]);
			format(gString, sizeof(gString), "Te-ai teleportat la jobul %s [ID: %d].", JobInfo[listitem][jName], listitem+1);
			SCM(playerid, COLOR_WHITE, gString);

			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerInterior(playerid, 0);
			PlayerVar[playerid][IsHouses] = 0;
			PlayerVar[playerid][IsBizz] = 0;
			PlayerVar[playerid][IsFaction] = -1;
		}
		case DIALOG_BMENU: {
			if(!response)
				return bool:true;

			new i = PlayerVar[playerid][BussinesID];

			switch(listitem) {
				case 0: {
					format(gString, sizeof(gString), "ID: %d\nType: %s\nBalance: $%s\nOld Value: $%s\nSell Bussines: %s%s",
						BizzInfo[i][bID], GetBizzType(BizzInfo[i][bType]), FormatNumber(BizzInfo[i][bBalance]), FormatNumber(BizzInfo[i][bOldValue]), BizzInfo[i][bValue] ? FormatNumber(BizzInfo[i][bValue]) : ("No sell"), BizzInfo[i][bValue] ? ("$") : (""));
					ShowPlayerDialog(playerid, DIALOG_BINFO, DIALOG_STYLE_MSGBOX, "Bizz Info", gString, "Back", "");
				}
				case 1: ShowPlayerDialog(playerid, DIALOG_BDESCRIPTION, DIALOG_STYLE_INPUT, "Bizz Description", "Enter the text you want to put:", "Select", "Back");
				case 2: ShowPlayerDialog(playerid, DIALOG_BFEE, DIALOG_STYLE_INPUT, "Bizz Fee:", "Introdu suma pe care vrei sa o pui:", "Select", "Back");
				case 3: {
					format(gString, sizeof(gString), "Enter the amount you want to withdraw. Amount: $%s", FormatNumber(BizzInfo[i][bBalance]));
					ShowPlayerDialog(playerid, DIALOG_BWITHDRAW, DIALOG_STYLE_INPUT, "Bizz Withdraw:", gString, "Select", "Back");
				}
				case 4: ShowPlayerDialog(playerid, DIALOG_BDEPOSIT, DIALOG_STYLE_INPUT, "Bizz Deposit:", "Introdu suma pe care vrei sa o depozitezi:", "Select", "Back");
				case 5: {
					switch(BizzInfo[i][bStatus]) {
						case false: BizzInfo[i][bStatus] = true, SCM(playerid, COLOR_PINK, "Bizz doors: {FF0000}Locked");
						case true: BizzInfo[i][bStatus] = false, SCM(playerid, COLOR_PINK, "Bizz doors: {1DE533}Unlocked");
					}
					gQuery[0] = EOS;
					mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `bussines` SET `Status`='%d' WHERE `ID`='%d'", BizzInfo[i][bStatus], BizzInfo[i][bID]);
					mysql_tquery(SQL, gQuery, "", "");
				}
				case 6: ShowPlayerDialog(playerid, DIALOG_BSELL, DIALOG_STYLE_INPUT, "Sell Bussines:", "Introdu suma pe care vrei sa o pui:", "Select", "Back");
			}
		}
		case DIALOG_JOBS: {
			if(!response)
				return bool:true;

			if(HaveCheckpoint(playerid))
				return ShowCancelCP(playerid);

			new x = listitem;

			SetPlayerCheckpointEx(playerid, CP_NORMAL, JobInfo[x][jPos][0], JobInfo[x][jPos][1], JobInfo[x][jPos][2], 2.0);
			format(gString, sizeof(gString), "Mergi la punctul rosu de pe minimap pentru a ajunge la job-ul %s [ID: %d]. Distanta: %.0fm.", JobInfo[x][jName], JobInfo[x][jID], GetPlayerDistanceFromPoint(playerid, JobInfo[x][jPos][0], JobInfo[x][jPos][1], JobInfo[x][jPos][2]));
			SCM(playerid, COLOR_YELLOW, gString);
		}
		case DIALOG_BSELL: {
			if(!response)
				return ShowPlayerDialog(playerid, DIALOG_BMENU, DIALOG_STYLE_LIST, "Bizz Menu", "Bizz Info\nBizz Description\nSet Fee\nWithdraw\nDeposit\nBizz Status\nSell Bizz", "Select", "Close");
			
			new i = PlayerVar[playerid][BussinesID];

			if(strval(inputtext) < 0 || strval(inputtext) > 500000000)
				return SCM(playerid, COLOR_GREY, "Invalid amount.");

			BizzInfo[i][bValue] = strval(inputtext);

			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `bussines` SET `Value`='%d' WHERE `ID`='%d'", BizzInfo[i][bValue], BizzInfo[i][bID]);
			mysql_tquery(SQL, gQuery, "", "");

			if(strval(inputtext) > 0) format(gString, sizeof(gString), "Bizz Sell: $%s.", FormatNumber(BizzInfo[i][bValue]));
			else gString = "Bizz Sell: None.";
			SCM(playerid, COLOR_PINK, gString);
			UpdateBizzLabel(i);
		}
		case DIALOG_BDEPOSIT: {
			if(!response)
				return ShowPlayerDialog(playerid, DIALOG_BMENU, DIALOG_STYLE_LIST, "Bizz Menu", "Bizz Info\nBizz Description\nSet Fee\nWithdraw\nDeposit\nBizz Status\nSell Bizz", "Select", "Close");

			if(strval(inputtext) < 1)
				return bool:true;

			new i = PlayerVar[playerid][BussinesID];
			if(GetPlayerCash(playerid) < strval(inputtext))
				return SCM(playerid, COLOR_GREY, "Nu ai aceasta suma.");

			GivePlayerCash(playerid, -strval(inputtext));
			BizzInfo[i][bBalance] += strval(inputtext);

			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `bussines` SET `Balance`='%d' WHERE `ID`='%d'", BizzInfo[i][bBalance], BizzInfo[i][bID]);
			mysql_tquery(SQL, gQuery, "", "");

			format(gString, sizeof(gString), "Deposit $%s. Balance: $%s.", FormatNumber(strval(inputtext)), FormatNumber(BizzInfo[i][bBalance]));
			SCM(playerid, COLOR_PINK, gString);
		}
		case DIALOG_BWITHDRAW: {
			if(!response)
				return ShowPlayerDialog(playerid, DIALOG_BMENU, DIALOG_STYLE_LIST, "Bizz Menu", "Bizz Info\nBizz Description\nSet Fee\nWithdraw\nDeposit\nBizz Status\nSell Bizz", "Select", "Close");

			if(strval(inputtext) < 1)
				return bool:true;
			new i = PlayerVar[playerid][BussinesID];
			
			if(BizzInfo[i][bBalance] < strval(inputtext))
				return SCM(playerid, COLOR_GREY, "Fonduri insuficiente.");

			BizzInfo[i][bBalance] -= strval(inputtext);
			GivePlayerCash(playerid, strval(inputtext));

			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `bussines` SET `Balance`='%d' WHERE `ID`='%d'", BizzInfo[i][bBalance], BizzInfo[i][bID]);
			mysql_tquery(SQL, gQuery, "", "");

			format(gString, sizeof(gString), "Withdraw $%s. Balance: $%s.", FormatNumber(strval(inputtext)), FormatNumber(BizzInfo[i][bBalance]));
			SCM(playerid, COLOR_PINK, gString);
		}
		case DIALOG_BFEE: {
			if(!response)
				return ShowPlayerDialog(playerid, DIALOG_BMENU, DIALOG_STYLE_LIST, "Bizz Menu", "Bizz Info\nBizz Description\nSet Fee\nWithdraw\nDeposit\nBizz Status\nSell Bizz", "Select", "Close");

			if(strval(inputtext) > 250) 
				return SCM(playerid, COLOR_GREY, "Invalid Fee.");

			new i = PlayerVar[playerid][BussinesID];
			BizzInfo[i][bFee] = strval(inputtext);

			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `bussines` SET `Fee`='%i' WHERE `ID`='%d'", strval(inputtext), BizzInfo[i][bID]);
			mysql_tquery(SQL, gQuery, "", "");

			format(gString, sizeof(gString), "Bizz fee: $%s.", FormatNumber(strval(inputtext)));
			SCM(playerid, COLOR_PINK, gString);
			UpdateBizzLabel(i);
		}
		case DIALOG_BDESCRIPTION: {
			if(!response) 
				return ShowPlayerDialog(playerid, DIALOG_BMENU, DIALOG_STYLE_LIST, "Bizz Menu", "Bizz Info\nBizz Description\nSet Fee\nWithdraw\nDeposit\nBizz Status\nSell Bizz", "Select", "Close");
			
			if(strlen(inputtext) > 32)
				return SCM(playerid, COLOR_GREY, "Invalid description.");

			new i = PlayerVar[playerid][BussinesID];
			format(BizzInfo[i][bDescription], 32, inputtext);

			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `bussines` SET `Description`='%s' WHERE `ID`='%d'", BizzInfo[i][bDescription], BizzInfo[i][bID]);
			mysql_tquery(SQL, gQuery, "", "");
			format(gString, sizeof(gString), "Bussines description: %s.", inputtext);
			SCM(playerid, COLOR_PINK, gString);
			UpdateBizzLabel(i);
		}
		case DIALOG_BINFO: ShowPlayerDialog(playerid, DIALOG_BMENU, DIALOG_STYLE_LIST, "Bizz Menu", "Bizz Info\nBizz Description\nSet Fee\nWithdraw\nDeposit\nBizz Status\nSell Bizz", "Select", "Close");
		case DIALOG_VIP: {
			new idd = listitemm[playerid];
			if(!response) {
				format(gString, sizeof(gString), "%s\n%s", CarInfo[idd][cRainbow] ? ("{FF0000}You already upgraded to the rainbow") : ("{FFFFFF}Upgrade to Rainbow Vehicle - {FFFF00}200 premium points"), strlen(CarInfo[idd][cText]) > 3 ? ("{FFFFFF}Edit VIP text") : ("{FFFFFF}Upgrade to VIP Vehicle - {FFFF00}200 premium points"));
				ShowPlayerDialog(playerid, DIALOG_VUPGRADES, DIALOG_STYLE_LIST, "Vehicle Upgrades", gString, "Select", "Back");
				return bool:true;
			}

			if(PlayerInfo[playerid][pPremiumPoints] < 200)
				return SCM(playerid, COLOR_LGREEN, "You need 200 premium points to upgrade your VIP.");

			PlayerInfo[playerid][pPremiumPoints] -= 200;
			UpdateVar(playerid, "PremiumPoints", PlayerInfo[playerid][pPremiumPoints]);

			SCM(playerid, COLOR_YELLOW, "Congratulations! You upgraded your VIP vehicle for 200 premium points.");
			SCM(playerid, COLOR_WHITE, "To edit text: /v > upgrade vehicles > edit vip.");

			format(CarInfo[idd][cText], 30, GetName(playerid));
			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `cars` SET `Text`='%s' WHERE `ID`='%d'", CarInfo[idd][cText], CarInfo[idd][cID]);
			mysql_tquery(SQL, gQuery, "", "");	
			for(new i = 0; i < 6; i++) CarInfo[idd][cVipPos][i] = 0;
			format(CarInfo[idd][cVipColor], 10, "FFFFFF");
			AttachVipText(idd);
		}
		case DIALOG_EDITVIP: {
			if(!response)
				return bool:true;

			switch(listitem) {
				case 0: ShowPlayerDialog(playerid, DIALOG_VIPCOLOR, DIALOG_STYLE_INPUT, "Edit vip color:", "Enter a color code. ex (htmlcolorcodes.com):", "Select", "Back");
				case 1: {
					if(EditObjectID[playerid] == EDIT_VIPTEXT)
						return SCM(playerid, COLOR_GREY, "Nu poti folosit aceasta functie ce timp editezi masina.");

					if(!IsPlayerInAnyVehicle(playerid)) 
						return bool:true;

					if(GetPlayerCar(playerid) != listitemm[playerid]) 
						return SCM(playerid, COLOR_GREY, "Nu te afli in acea masina.");

					if(CarInfo[listitemm[playerid]][cVipStatus])
						return SCM(playerid, COLOR_GREY, "Pentru a edita activeaza vip textu.");

					if(Engine[GetPlayerVehicleID(playerid)])
						return SCM(playerid, COLOR_GREY, "Opreste motorul!");

					EditObjectVehicle(playerid, listitemm[playerid]);
				}
				case 2: ShowPlayerDialog(playerid, DIALOG_VIPNAME, DIALOG_STYLE_INPUT, "Edit VIP name:", "Introdu numele pe care vrei sa il pui:", "Select", "Back");
				case 3: {
					if(EditObjectID[playerid] == EDIT_VIPTEXT)
						return SCM(playerid, COLOR_WHITE, "Nu poti folosi aceasta functie in timp ce editezi.");

					new idd = listitemm[playerid];
					switch(CarInfo[idd][cVipStatus]) {
						case false: if(CarInfo[idd][cObjectText] != INVALID_OBJECT_ID) CarInfo[idd][cVipStatus] = true, SCM(playerid, COLOR_PINK, "Vip text status: {FFFFFF}Disabled"), DestroyDynamicObject(CarInfo[idd][cObjectText]), CarInfo[idd][cObjectText] = INVALID_OBJECT_ID;
						case true: CarInfo[idd][cVipStatus] = false, SCM(playerid, COLOR_PINK, "Vip text status: {FFFF00}Enabled"), AttachVipText(idd), Streamer_Update(playerid);
					}
					gQuery[0] = EOS;
					mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `cars` SET `VipStatus`='%d' WHERE `ID`='%d'", CarInfo[idd][cVipStatus], CarInfo[idd][cID]);
					mysql_tquery(SQL, gQuery, "", "");
				}
			}
		}
		case DIALOG_VIPCOLOR: {
			new idd = listitemm[playerid];
			if(!response) {
				format(gString, sizeof(gString), "Type\tAmount\nVip text color\t%s\nEdit vip pos\nEdit vip name\t{%s}%s\nVip status\t%s", CarInfo[idd][cVipColor], CarInfo[idd][cVipColor], CarInfo[idd][cText], CarInfo[idd][cVipStatus] ? ("{FFFFFF}Disabled") : ("{FF0000}Enabled"));
				ShowPlayerDialog(playerid, DIALOG_EDITVIP, DIALOG_STYLE_TABLIST_HEADERS, "Edit VIP text:", gString, "Select", "Close");
				return bool:true;
			}

			if(EditObjectID[playerid] == EDIT_VIPTEXT)
				return SCM(playerid, COLOR_WHITE, "Nu poti folosi aceasta functie in timp ce editezi.");

			if(strlen(inputtext) < 6 || strlen(inputtext) > 6) 
				return SCM(playerid, COLOR_GREY, "Invalid color code.");

			format(CarInfo[idd][cVipColor], 10, inputtext);

			format(gString, sizeof(gString), "The new color vip is: {%s}%s", inputtext, CarInfo[idd][cText]);
			SCM(playerid, COLOR_PINK, gString);
			AttachVipText(idd);

			mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `cars` SET `VipColor`='%s' WHERE `ID`='%d'", CarInfo[idd][cVipColor], CarInfo[idd][cID]);
			mysql_tquery(SQL, gQuery, "", "");
		}
		case DIALOG_VIPNAME: {
			new idd = listitemm[playerid];
			if(!response) {
				format(gString, sizeof(gString), "Type\tAmount\nVip text color\t%s\nEdit vip pos\nEdit vip name\t{%s}%s\nVip status\t%s", CarInfo[idd][cVipColor], CarInfo[idd][cVipColor], CarInfo[idd][cText], CarInfo[idd][cVipStatus] ? ("{000000}Disabled") : ("{FFFFFF}Enabled"));
				ShowPlayerDialog(playerid, DIALOG_EDITVIP, DIALOG_STYLE_TABLIST_HEADERS, "Edit VIP text:", gString, "Select", "Close");
				return bool:true;
			}

			if(EditObjectID[playerid] == EDIT_VIPTEXT)
				return SCM(playerid, COLOR_WHITE, "Nu poti folosi aceasta functie in timp ce editezi.");

			if(strlen(inputtext) < 3 || strlen(inputtext) > 30) 
				return SCM(playerid, COLOR_GREY, "Invalid VIP name.");

			mysql_escape_string(inputtext, CarInfo[idd][cText]);
			AttachVipText(idd);

			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `cars` SET `Text`='%s' WHERE `ID`='%d'", CarInfo[idd][cText], CarInfo[idd][cID]);
			mysql_tquery(SQL, gQuery, "", "");

			format(gString, sizeof(gString), "The new vip name is: {%s}%s", CarInfo[idd][cVipColor], inputtext);
			SCM(playerid, COLOR_PINK, gString);
		}
		case DIALOG_RAINBOW: {
			new idd = listitemm[playerid];
			if(!response) {
				format(gString, sizeof(gString), "%s\n%s", CarInfo[idd][cRainbow] ? ("{FF0000}You already upgraded to the rainbow") : ("Upgrade to Rainbow Vehicle - {FFFF00}200 premium points"), strlen(CarInfo[idd][cText]) > 3 ? ("{FFFFFF}Edit VIP text") : ("Upgrade to VIP Vehicle - {FFFF00}200 premium points"));
				ShowPlayerDialog(playerid, DIALOG_VUPGRADES, DIALOG_STYLE_LIST, "Vehicle Upgrades", gString, "Select", "Back");
				return bool:true;
			}

			if(CarInfo[idd][cRainbow])
				return SCM(playerid, COLOR_LGREEN, "It's already a rainbow.");

			if(PlayerInfo[playerid][pPremiumPoints] < 200)
				return SCM(playerid, COLOR_LGREEN, "You need 200 premium points to upgrade your rainbow.");

			PlayerInfo[playerid][pPremiumPoints] -= 200;
			UpdateVar(playerid, "PremiumPoints", PlayerInfo[playerid][pPremiumPoints]);

			CarInfo[idd][cRainbow] = true;

			SCM(playerid, COLOR_YELLOW, "Congratulations! You upgraded your rainbow vehicle for 200 premium points.");
			SCM(playerid, COLOR_WHITE, "To activate rainbow you have the command: /rainbowspeed <1/2/3>.");

			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `cars` SET `Rainbow`='%d' WHERE `ID`='%d'", CarInfo[idd][cRainbow], CarInfo[idd][cID]);
			mysql_tquery(SQL, gQuery, "", "");
		}
		case DIALOG_BUYDILDO: {
			if(!response)
				return bool:true;

			new x = PlayerVar[playerid][IsBizz];


			switch(listitem) {
				case 0: {
					if(GetPlayerCash(playerid) < 500) 
						return SCM(playerid, COLOR_GREY, "You don't have this money.");
					
					GivePlayerWeapon(playerid, 10, 1);
					GivePlayerCash(playerid, -500);
					SCM(playerid,COLOR_WHITE,"Bought Double-ended Dildo.");
					BizzInfo[x][bBalance] += 500;
				}
				case 1: {
					if(GetPlayerCash(playerid) < 500) 
						return SCM(playerid, COLOR_GREY, "You don't have this money.");
					
					GivePlayerWeapon(playerid, 11, 1);
					GivePlayerCash(playerid, -500);
					SCM(playerid,COLOR_WHITE,"Bought Dildo.");
					BizzInfo[x][bBalance] += 500;
				}
				case 2: {
					if(GetPlayerCash(playerid) < 500) 
						return SCM(playerid, COLOR_GREY, "You don't have this money.");
					
					GivePlayerWeapon(playerid, 12, 1);
					GivePlayerCash(playerid, -500);
					SCM(playerid,COLOR_WHITE,"Bought Vibrator.");
					BizzInfo[x][bBalance] += 500;
				}
				case 3: {
					if(GetPlayerCash(playerid) < 500) 
						return SCM(playerid, COLOR_GREY, "You don't have this money.");
					
					GivePlayerWeapon(playerid, 13, 1);
					GivePlayerCash(playerid, -500);
					SCM(playerid,COLOR_WHITE,"Bought Silver Vibrator.");
					BizzInfo[x][bBalance] += 500;
				}
				case 4: {
					if(GetPlayerCash(playerid) < 1000) 
						return SCM(playerid, COLOR_GREY, "Nu ai banii necesari pentru a cumpara acest lucru!");
					
					GivePlayerWeapon(playerid, 14, 1);
					GivePlayerCash(playerid, -1000);
					SCM(playerid,COLOR_WHITE,"Bought flowers.");
					BizzInfo[x][bBalance] += 1000;
				}		
			}
		}
		case DIALOG_24: {
			if(!response)
				return bool:true;

			new x = PlayerVar[playerid][IsBizz];

			switch(listitem) {
				case 0: {
					if(GetPlayerCash(playerid) < 1000)
						return SCM(playerid, COLOR_GREY, "You don't have this amount of money.");

					if(PlayerInfo[playerid][pPhone]!=0) {
						new phone[10];
						format(phone, 10, "%d", PlayerInfo[playerid][pPhone]);
						if(strlen(phone) == 4) return SCM(playerid, COLOR_GREY, "Ai deja un iPhone.");
						PhoneFinder[PlayerInfo[playerid][pPhone]] = -1;
					}
					new phone;
					while(PhoneFinder[(phone=RandomEx(10000,MAX_NUMBERS))]==-1) break;
					PlayerInfo[playerid][pPhone] = phone;
					PhoneFinder[PlayerInfo[playerid][pPhone]] = playerid;
					UpdateVar(playerid, "Phone", PlayerInfo[playerid][pPhone]);
					BizzInfo[x][bBalance] += 1000;
					GivePlayerCash(playerid, -1000);

					format(gString, sizeof(gString), "You bought a phone. number: %d.", PlayerInfo[playerid][pPhone]);
					SCM(playerid, COLOR_WHITE, gString);
				}
				case 1: {
					if(GetPlayerCash(playerid) < 500)
						return SCM(playerid, COLOR_GREY, "You don't have this amount of money.");

					PlayerInfo[playerid][pCredit] += 300;
					BizzInfo[x][bBalance] += 500;
					GivePlayerCash(playerid, -500);
					SCM(playerid, COLOR_WHITE, "You bought $500 credits.");
				}
				case 2: {
					if(PlayerInfo[playerid][pPhoneBook]) 
						return SCM(playerid, COLOR_GREY, "You already have a phonebook.");

					if(GetPlayerCash(playerid) < 300)
						return SCM(playerid, COLOR_GREY, "You don't have this amount of money.");

					GivePlayerCash(playerid, -300);
					PlayerInfo[playerid][pPhoneBook] = true;
					BizzInfo[x][bBalance] += 300;
					UpdateVar(playerid, "PhoneBook", PlayerInfo[playerid][pPhoneBook]);

					SCM(playerid, COLOR_WHITE, "You bought a phone book.");
				}
				case 3: {
					if(PlayerInfo[playerid][pWTalkie])
						return SCM(playerid, COLOR_GREY, "Ai deja o freqventa.");

					if(GetPlayerCash(playerid) < 1500) 
						return SCM(playerid, COLOR_GREY, "You don't have this amount of money.");
					
					GivePlayerCash(playerid, -1500);
					BizzInfo[x][bBalance] += 1500;    
					PlayerInfo[playerid][pWTalkie] = true;
					PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					SCM(playerid, COLOR_WHITE, "You bought a radio frecvent. Use /setfreq for a frecvent set.");
					UpdateVar(playerid, "WTalkie", 1);
				}
			}
			if(PlayerInfo[playerid][pTut] == 2) {
				if(PlayerInfo[playerid][pPhone] && PlayerInfo[playerid][pCredit] && PlayerInfo[playerid][pPhoneBook]) {
					for(new i = 0; i < 20; i++) SCM(playerid, COLOR_WHITE, "");
					PlayerInfo[playerid][pTut] ++;
					UpdateVar(playerid, "Tutorial", PlayerInfo[playerid][pTut]);
					SetPlayerPos(playerid, 2318.4187,-91.0881,26.4844),SetPlayerFacingAngle(playerid, 184.1851);
					SetPlayerInterior(playerid, 0);
					SetPlayerVirtualWorld(playerid, playerid + 10);
					InterpolateCameraPos(playerid, 2319.926757, -93.700790, 39.676971, 2319.884277, -87.760520, 103.749610, 5000);
					InterpolateCameraLookAt(playerid, 2319.926269, -94.136566, 34.695999, 2319.888671, -88.223510, 98.771095, 5100);
					TimeTut[playerid] = 5;
					TimeType[playerid] = 0;
					TogglePlayerControllable(playerid, false);
					SCM(playerid, COLOR_GREY, "Aceasta este o afacere de tip 'Clothing Store'.");
					SCM(playerid, COLOR_GREY, "In interiorul acestuia poti achizitiona diferite diverse iteme precum skin-uri, ochelari si palarii.");
					SCM(playerid, COLOR_GREY, "Pe serverul nostru exista un sistem de skin-uri personale, fiecare jucator putand obtine skinuri prin diverse actiuni pe server.");
					SCM(playerid, COLOR_GREY, "Exista 3 categorii de skin-uri: {4B4B4B}Common {B53DA6}Epic {0FFFAF}Legendary");
				}
			}
		}
		case DIALOG_CHANGEHIDD: {
			if(!response)
				return bool:true;

			new carid = GetPlayerCar(playerid);
			if(carid == -1) return bool:true;

			new color = listitemm[playerid], slot = PlayerVar[playerid][Stock];
			CarInfo[carid][cColor][slot-1] = color;
			ChangeVehicleColor(CarInfo[carid][cSpawned], CarInfo[carid][cColor][0], CarInfo[carid][cColor][1]);
			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `cars` SET `color1`='%d', `color2`='%d' WHERE `ID`='%d'", CarInfo[carid][cColor][0], CarInfo[carid][cColor][1], CarInfo[carid][cID]);
			mysql_tquery(SQL, gQuery, "", "");
			SCM(playerid, COLOR_MONEY, "(-) you paid $2,500 to change the color.");
			GivePlayerCash(playerid, -2500);
			GameTextForPlayer(playerid, "~r~-$2,500", 5000, 1);
		}
		case DIALOG_PLACEHIDD: {
			if(!response)
				return bool:true;

			if(PlayerInfo[playerid][pHidden] < 1) return bool:true;
			new carid = GetPlayerCar(playerid);
			if(carid == -1) return bool:true;

			new color = listitemm[playerid], slot = PlayerVar[playerid][Stock];
			PlayerInfo[playerid][pHidden] --;
			UpdateVar(playerid, "Hidden", PlayerInfo[playerid][pHidden]);
			CarInfo[carid][cColor][slot-1] = color;
			ChangeVehicleColor(CarInfo[carid][cSpawned], CarInfo[carid][cColor][0], CarInfo[carid][cColor][1]);
			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `cars` SET `color1`='%d', `color2`='%d' WHERE `ID`='%d'", CarInfo[carid][cColor][0], CarInfo[carid][cColor][1], CarInfo[carid][cID]);
			mysql_tquery(SQL, gQuery, "", "");
			SCM(playerid, COLOR_WHITE, "Ti-ai pus culoare hidden pe acest vehicul.");
		}
		case DIALOG_TRANSFER: {
			if(!response)
				return bool:true;
			new id = listitemm[playerid];

			if(!IsPlayerConnected(id)) return bool:true;

			if(GetPlayerBank(playerid) < PlayerVar[playerid][Transfer]) return bool:true;

			GivePlayerBank(id, PlayerVar[playerid][Transfer]);
			GivePlayerBank(playerid, -PlayerVar[playerid][Transfer]);

			SetCoolDowns(playerid, 16, 15);

			format(gString, sizeof(gString), "You transferred to %s, $%s. Tax: %s.", GetName(id), FormatNumber(PlayerVar[playerid][Transfer]-(PlayerVar[playerid][Transfer]/10)), FormatNumber(PlayerVar[playerid][Transfer]/10));
			SCM(playerid, COLOR_MONEY, gString);
			format(gString, sizeof(gString), "%s has transferred $%s to your account.", GetName(playerid), FormatNumber(PlayerVar[playerid][Transfer]));
			SCM(id, COLOR_MONEY, gString);

			format(gString, sizeof(gString), "($) %s[user: %d] transferred to %s[user: %d] $%s.", GetName(playerid), PlayerInfo[playerid][pSQLID], GetName(id), PlayerInfo[id][pSQLID], FormatNumber(PlayerVar[playerid][Transfer]));
			SendAdminMessage(COLOR_YELLOW, gString, 1);
			SavePlayerBank(playerid);
			SavePlayerBank(id);
		}
		case DIALOG_CHANGEPASS: {
			if(!response) 
				return bool:true;

			new textt[65];

			if(!strlen(inputtext)) return bool:true;
			SHA256_PassHash(inputtext, HASH_KEY, textt, 65);
			if(strcmp(textt, PlayerInfo[playerid][pPassword], true) != 0)
				return SCM(playerid, COLOR_GREY, "Invalid password.");

			ShowPlayerDialog(playerid, DIALOG_NEWPASS, DIALOG_STYLE_INPUT, "New Password:", "Introdu noua parola de la cont:", "Select", "Close");
		}
		case DIALOG_NEWPASS: {
			if(!response)
				return bool:true;

			if(strlen(inputtext) < 4 || strlen(inputtext) > 32) {
				ShowPlayerDialog(playerid, DIALOG_NEWPASS, DIALOG_STYLE_INPUT, "Change Password:", "Introdu noua parola de la cont:", "Select", "Close");
				SCM(playerid, COLOR_GREY, "Minim 4, Maxim 32 characters");
				return bool:true;
			}
			SetCoolDowns(playerid, 6, 120);
			SHA256_PassHash(inputtext, HASH_KEY, PlayerInfo[playerid][pPassword], 65);
			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `password`='%e' WHERE `id`='%i'", PlayerInfo[playerid][pPassword], PlayerInfo[playerid][pSQLID]);
			mysql_tquery(SQL, gQuery, "", "");

			format(gString, sizeof(gString), "Noua parola de la cont este: %s.", inputtext);
			SCM(playerid, COLOR_YELLOW, gString);
		}
		case DIALOG_LOCATIONS: {
			if(!response) 
				return bool:true;

			switch(listitem) {
				case 0: {
					new szString[300]; gString[0] = EOS;
					for(new i = 1; i <= 15; i++) {
						format(szString, sizeof szString, "[# %d]. %s - (%d)\n", i, GetBizzType(i), Iter_Count(BizzType[i-1]));
						strcat(gString, szString);
					}
					ShowPlayerDialog(playerid, DIALOG_BLOCATIONS, DIALOG_STYLE_LIST, "Locations Bussines", gString, "Select", "Close");
				}
				case 1: {
					SetPlayerCheckpointEx(playerid, CP_NORMAL, 2303.5789,-68.6851,26.4844, 2.0);
					format(gString, sizeof(gString), "Mergi la punctul rosu de pe minimap pentru a ajunge la DMV. Distanta: %.0fm.", GetPlayerDistanceFromPoint(playerid, 2303.5789,-68.6851,26.4844));
					SCM(playerid, COLOR_YELLOW, gString);	
				}
				case 2: {
					SetPlayerCheckpointEx(playerid, CP_NORMAL, 2425.0833,120.6176,27.6287, 2.0);
					format(gString, sizeof(gString), "Mergi la punctul rosu de pe minimap pentru a ajunge la giftbox & crates. Distanta: %.0fm.", GetPlayerDistanceFromPoint(playerid, 2425.0833,120.6176,27.6287));
					SCM(playerid, COLOR_YELLOW, gString);						
				}
			}
		}
		case DIALOG_BLOCATIONS: {
			if(!response) 
				return bool:true;

			listitemm[playerid] = listitem; 
			new string[60];
			foreach(new id : BizzType[listitem]) {
				format(string, sizeof(string), "%s (%d) - %.0fm\n", GetBizzType(BizzInfo[id][bType]), BizzInfo[id][bID], GetPlayerDistanceFromPoint(playerid, BizzInfo[id][bEnterPos][0], BizzInfo[id][bEnterPos][1], BizzInfo[id][bEnterPos][2]));
				strcat(gString, string);
			}
			ShowPlayerDialog(playerid, DIALOG_BLOCATIONS1, DIALOG_STYLE_LIST, "Locations Bussines", gString, "Select", "Back");
		}
		case DIALOG_BLOCATIONS1: {
			if(!response) {
				new szString[300];
				for(new i = 1; i <= 14; i++) {
					format(gString, 50, "[# %d]. %s - (%d)\n", i, GetBizzType(i), Iter_Count(BizzType[i-1]));
					strcat(szString, gString);
				}
				ShowPlayerDialog(playerid, DIALOG_BLOCATIONS, DIALOG_STYLE_LIST, "Locations Bussines", szString, "Select", "Close");
				return bool:true;		
			}
			new x;
			foreach(new id : BizzType[listitemm[playerid]]) {
				if(x == listitem) {
					SetPlayerCheckpointEx(playerid, CP_NORMAL, BizzInfo[id][bEnterPos][0], BizzInfo[id][bEnterPos][1], BizzInfo[id][bEnterPos][2], 2.0);
					format(gString, sizeof(gString), "Mergi la punctul rosu de pe minimap pentru a ajunge la bussinesul %s [ID: %d]. Distanta: %.0fm.", GetBizzType(BizzInfo[id][bType]), BizzInfo[id][bID], GetPlayerDistanceFromPoint(playerid, BizzInfo[id][bEnterPos][0], BizzInfo[id][bEnterPos][1], BizzInfo[id][bEnterPos][2]));
					SCM(playerid, COLOR_YELLOW, gString);	
				}	
				x ++;
			}
		}
		case DIALOG_BUYVEHICLE: {
			if(!response) return true;

			new i = PlayerVar[playerid][DealerID];
			if(DealerInfo[i][dPrice] > 0 && GetPlayerCash(playerid) < DealerInfo[i][dPrice]) 
				return SCM(playerid, COLOR_GREY, "You don't have enough money to pourchase this vehicle.");
			else if(PlayerInfo[playerid][pPremiumPoints] < DealerInfo[i][dPremiumPoints] && DealerInfo[i][dPremiumPoints])
				return SCM(playerid, COLOR_GREY, "You don't have enough premium points to pourchase this vehicle.");

			if(DealerInfo[i][dStock] <= 0)
				return SCM(playerid, COLOR_GREY, "Nu mai sunt vehicule in stock.");

			if(GetPlayerTotalVehicle(playerid) == GetPlayerSlot(playerid)) 
				return SCM(playerid, COLOR_GREY, "You can't buy any more cars. Sell one of your cars if you want to buy a new one. Normal players can own 2 cars. Premium players can own 4 cars.");
			
			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof(gQuery), "INSERT INTO cars (Model) VALUES (%d)", DealerInfo[i][dModel]);
			mysql_tquery(SQL, gQuery, "SQL_InsertVehicleDS", "iii", playerid, i, listitem);	
		}
		case DIALOG_MOVEHOUSE: {
			if(!response) 
				return bool:true;

			new Float: Pos[3], x = listitemm[playerid];
			GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);

			switch(listitem) {
				case 0: {
					if(GetPlayerInterior(playerid) == 0) return SCM(playerid, COLOR_LGREEN, "You're inside.");

					for(new i = 0; i < 3; i++) HouseInfo[x][hExitPos][i] = Pos[i];
					HouseInfo[x][hInterior] = GetPlayerInterior(playerid);

					gQuery[0] = EOS;
					mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `houses` SET `ExitPosX`='%f', `ExitPosY`='%f', `ExitPosZ`='%f', `Interior`='%d' WHERE `ID`='%d'", HouseInfo[x][hExitPos][0], HouseInfo[x][hExitPos][1], HouseInfo[x][hExitPos][2], HouseInfo[x][hInterior], HouseInfo[x][hID]);
					mysql_tquery(SQL, gQuery, "", "");
				}
				case 1: {
					if(GetPlayerInterior(playerid) != 0) return SCM(playerid, COLOR_LGREEN, "You're not inside.");

					for(new i = 0; i < 3; i++) HouseInfo[x][hEnterPos][i] = Pos[i];

					gQuery[0] = EOS;
					mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `houses` SET `EnterPosX`='%f', `EnterPosY`='%f', `EnterPosZ`='%f' WHERE `ID`='%d'", HouseInfo[x][hEnterPos][0], HouseInfo[x][hEnterPos][1], HouseInfo[x][hEnterPos][2], HouseInfo[x][hID]);
					mysql_tquery(SQL, gQuery, "", "");

					UpdateHouseLabel(x);
				}
				case 2: {
					if(!IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu esti intr-un vehicul!");
					if(HouseInfo[x][hAlea]) {
						ShowPlayerDialog(playerid, DIALOG_CONFIRMALEA, DIALOG_STYLE_MSGBOX, "Alea Pos", "Esti sigur ca vrei sa spawneze masina aici?\nTi-am pus un checkpoint unde este pozitile currente.", "Yes", "No");
						SetPlayerCheckpointEx(playerid, CP_NORMAL, HouseInfo[x][hAleaX], HouseInfo[x][hAleaY], HouseInfo[x][hAleaZ], 3.0);
						return true;
					}

					GetVehiclePos(GetPlayerVehicleID(playerid), HouseInfo[x][hAleaX], HouseInfo[x][hAleaY], HouseInfo[x][hAleaZ]);
					GetVehicleZAngle(GetPlayerVehicleID(playerid), HouseInfo[x][hAleaZAngle]);
					HouseInfo[x][hAlea] = true;

					gQuery[0] = EOS;
					mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `houses` SET `AleaPos` = '%f, %f, %f, %f', `Alea` = '1' WHERE `ID` = '%i'", HouseInfo[x][hAleaX], HouseInfo[x][hAleaY], HouseInfo[x][hAleaZ], HouseInfo[x][hAleaZAngle], HouseInfo[x][hID]);
					mysql_tquery(SQL, gQuery);
				}
			}
			SCM(playerid, COLOR_YELLOW, "House move successfully");
		}
		case DIALOG_CONFIRMALEA: {
			DisablePlayerCheckpoint(playerid);
			CP[playerid] = DISABLE_CHECKPOINT;
			if(!response) return true;

			new x = listitemm[playerid];
			GetVehiclePos(GetPlayerVehicleID(playerid), HouseInfo[x][hAleaX], HouseInfo[x][hAleaY], HouseInfo[x][hAleaZ]);
			GetVehicleZAngle(GetPlayerVehicleID(playerid), HouseInfo[x][hAleaZAngle]);

			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `houses` SET `AleaPos` = '%f, %f, %f, %f', `AleaZAngle` = '%f' WHERE `ID` = '%i'", HouseInfo[x][hAleaX], HouseInfo[x][hAleaY], HouseInfo[x][hAleaZ], HouseInfo[x][hAleaZAngle], HouseInfo[x][hID]);
			mysql_tquery(SQL, gQuery);
		}
		case DIALOG_MOVEBIZ: {
			if(!response) 
				return bool:true;

			new Float: Pos[3], x = listitemm[playerid];
			GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);

			switch(listitem) {
				case false: {
					if(GetPlayerInterior(playerid) == 0) return SCM(playerid, COLOR_LGREEN, "You're inside.");

					for(new i = 0; i < 3; i++) BizzInfo[x][bExitPos][i] = Pos[i];
					BizzInfo[x][bInterior] = GetPlayerInterior(playerid);

					gQuery[0] = EOS;
					mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `bussines` SET `ExitPosX`='%f', `ExitPosY`='%f', `ExitPosZ`='%f', `Interior`='%d' WHERE `ID`='%d'", BizzInfo[x][bExitPos][0], BizzInfo[x][bExitPos][1], BizzInfo[x][bExitPos][2], BizzInfo[x][bInterior], BizzInfo[x][bID]);
					mysql_tquery(SQL, gQuery, "", "");
				}
				case true: {
					if(GetPlayerInterior(playerid) != 0) return SCM(playerid, COLOR_LGREEN, "You're not inside.");

					for(new i = 0; i < 3; i++) BizzInfo[x][bEnterPos][i] = Pos[i];

					gQuery[0] = EOS;
					mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `bussines` SET `EnterPosX`='%f', `EnterPosY`='%f', `EnterPosZ`='%f' WHERE `ID`='%d'", BizzInfo[x][bEnterPos][0], BizzInfo[x][bEnterPos][1], BizzInfo[x][bEnterPos][2], BizzInfo[x][bID]);
					mysql_tquery(SQL, gQuery, "", "");

					UpdateBizzLabel(x);
				}
			}
			SCM(playerid, COLOR_YELLOW, "Bussines move successfully");
		}
		case DIALOG_SPAWNCHANGE: {
			if(!response)
				return bool:true;

			switch(listitem) {
				case 0: SCM(playerid, COLOR_PINK, "You will spawn at the default spawn.");
				case 1: {
					if(PlayerInfo[playerid][pHouse] == -1 && PlayerInfo[playerid][pRentroom] == -1) return bool:true;
					SCM(playerid, COLOR_PINK, "You will spawn at home.");
				}
			}
			PlayerInfo[playerid][pSpawnChange] = listitem;
			UpdateVar(playerid, "Spawnchange", PlayerInfo[playerid][pSpawnChange]);
		}
		case DIALOG_HMENU: {
			if(!response)
				return bool:true;

			new house = PlayerInfo[playerid][pHouse], i = PlayerVar[playerid][HouseID];

			switch(listitem) {
				case 0: {
					gQuery[0] = EOS;
					mysql_format(SQL, gQuery, sizeof(gQuery), "SELECT * FROM `users` WHERE `Rentroom`='%d'", house);
					mysql_tquery(SQL, gQuery, "SQL_HouseInfo", "ii", playerid, i);
				}
				case 1: ShowPlayerDialog(playerid, DIALOG_HDESCRIPTION, DIALOG_STYLE_INPUT, "House Description", "Enter the text:", "Select", "Back");
				case 2: ShowPlayerDialog(playerid, DIALOG_SETRENT, DIALOG_STYLE_INPUT, "Set Rent:", "Enter the amount of money you want to set to rent:", "Select", "Back");
				case 3: {
					format(gString, sizeof(gString), "Enter the amount you want to withdraw, available: $%s.", FormatNumber(HouseInfo[i][hBalance]));
					ShowPlayerDialog(playerid, DIALOG_HWITHDRAW, DIALOG_STYLE_INPUT, "House Withdraw", gString, "Select", "Back");
				}
				case 4: {
					format(gString, sizeof(gString), "Enter the amount you want to deposit, available: $%s.", FormatNumber(HouseInfo[i][hBalance]));
					ShowPlayerDialog(playerid, DIALOG_HDEPOSIT, DIALOG_STYLE_INPUT, "House Deposit", gString, "Select", "Back");		
				}
				case 5: {
					switch(HouseInfo[i][hStatus]) {
						case false: HouseInfo[i][hStatus] = true;
						case true: HouseInfo[i][hStatus] = false;
					}
					format(gString, sizeof(gString), "House doors: %s", HouseInfo[i][hStatus] != false ? ("{FF0000}Locked") : ("{1DE533}Unlocked"));
					SCM(playerid, COLOR_PINK, gString);

					gQuery[0] = EOS;
					mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `houses` SET `Status`='%d' WHERE `ID`='%d'", HouseInfo[i][hStatus], PlayerInfo[playerid][pHouse]);
					mysql_tquery(SQL, gQuery, "", "");
				}
				case 6: ShowPlayerDialog(playerid, DIALOG_SELLHOUSE, DIALOG_STYLE_INPUT, "Sell House", "Enter the amount with which you want to sell the house:", "Select", "Back");
				case 7: {
					new szDialog2[256];
					for(i = 0; i < sizeof(RadioNames); i++) {
						format(gString, 40, "%s\n", RadioNames[i]);
						strcat(szDialog2, gString);
					}
					ShowPlayerDialog(playerid, DIALOG_HRADIO, DIALOG_STYLE_LIST, "House Radio:", szDialog2, "Select", "Back");			
				}
				case 8: ShowPlayerDialog(playerid, DIALOG_HUPGRADE, DIALOG_STYLE_LIST, "House Upgrade:", !HouseInfo[i][hComputer]?"Buy cumputer\t{FFFF00}150 premium points\nHouse Heal\t{FFFF00}150 premium points":"Edit computer\nHouse Heal\t{FFFF00}150 premium points", "Select", "Cancel");
			}
		}
		case DIALOG_HUPGRADE: {
			if(!response)
				return true;

			new i = EditObjectIDe[playerid] = PlayerVar[playerid][IsHouses];
			if(HouseInfo[i][hID] != PlayerInfo[playerid][pHouse]) return SCM(playerid, COLOR_LGREEN, "Eroare: Nu esti in casa ta!");
			switch listitem
			do {
				case 0: {
					if(!HouseInfo[i][hComputer]) {
						if(PlayerInfo[playerid][pPremiumPoints] < 150)
							return SCM(playerid, COLOR_LGREEN, "Eroare: Nu ai 150 puncte premium!");

						EditObjectID[playerid] = EDIT_COMPUTER;
						new Float:x,Float:y,Float:z;
						GetPlayerPos(playerid, x, y, z);
						new tmpobjid = CreateDynamicObject(19893, x+2.0,y+2.0,z,   0.00000, 0.00000, 0.0, -1, -1, -1, 300.00);
					    SetDynamicObjectMaterial(tmpobjid, 1, 8419, "vgsbldng1", "black32", 0xFFFFFFFF);
						EditDynamicObject(playerid, tmpobjid);
					} else {
						EditObjectID[playerid] = EDIT_COMPUTER_AL;
						EditDynamicObject(playerid, HouseInfo[i][hObjPC]);
					}
				}
				case 1: {
					if(HouseInfo[i][hHeal])
						return SCM(playerid, COLOR_LGREEN, "Eraore: Casa ta are deja heal upgrade!");

					if(PlayerInfo[playerid][pPremiumPoints] < 150)
						return SCM(playerid, COLOR_LGREEN, "Eroare: Nu ai aceata suma de puncte premium!");

					HouseInfo[i][hHeal] = true;
					PlayerInfo[playerid][pPremiumPoints] -= 150;
					UpdateVar(playerid, "PremiumPoints", PlayerInfo[playerid][pPremiumPoints]);
					_query(128, "UPDATE `house` SET `Heal` = '1' WHERE `ID` = '%i'", HouseInfo[i][hID]);
				}
			}
		}
		case DIALOG_SELLBIZTOSTATE: {
			if(!response)
				return bool:true;

			new i = PlayerVar[playerid][BussinesID];
				
			GivePlayerCash(playerid, BizzInfo[i][bOldValue]/2);

			BizzInfo[i][bOwned] = false;
			format(BizzInfo[i][bOwner], 24, "The State");
			BizzInfo[i][bValue] = BizzInfo[i][bOldValue];
			PlayerInfo[playerid][pBussines] = -1;

			UpdateBizzLabel(i);

			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `bussines` SET `Owned`='0', `Owner`='The State', `Value`='%d' WHERE `ID`='%d'", BizzInfo[i][bValue], BizzInfo[i][bID]);
			mysql_tquery(SQL, gQuery, "", "");
			UpdateVar(playerid, "Bussines", -1);
			format(gString, sizeof gString, "(+) you sold the bussines statewide and received $%s.", FormatNumber(BizzInfo[i][bOldValue]/2));
			SCM(playerid, COLOR_MONEY, gString);
			PlayerVar[playerid][BussinesID] = 0;
		}
		case DIALOG_HSTATESELL: {
			if(!response)
				return bool:true;

			new i = PlayerVar[playerid][HouseID];
				
			GivePlayerCash(playerid, HouseInfo[i][hOldValue]/2);

			HouseInfo[i][hOwned] = false;
			format(HouseInfo[i][hOwner], 24, "The State");
			HouseInfo[i][hValue] = HouseInfo[i][hOldValue];
			PlayerInfo[playerid][pHouse] = -1;
			PlayerInfo[playerid][pSpawnChange] = 0;

			UpdateHouseLabel(i);

			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `houses` SET `Owned`='0', `Owner`='The State', `Value`='%d' WHERE `ID`='%d'", HouseInfo[i][hValue], HouseInfo[i][hID]);
			mysql_tquery(SQL, gQuery, "", "");
			UpdateVar(playerid, "House", -1);
			UpdateVar(playerid, "SpawnChange", 0);
			format(gString, sizeof(gString), "(+) you sold the house statewide and received $%s.", FormatNumber(HouseInfo[i][hOldValue]/2));
			SCM(playerid, COLOR_MONEY, gString);
			PlayerVar[playerid][HouseID] = 0;
		}
		case DIALOG_HRADIO: {
			if(!response)
				return ShowPlayerDialog(playerid, DIALOG_HMENU, DIALOG_STYLE_LIST, "House Menu", "House Info\nHouse Description\nSet Rent\nWithdraw\nDeposit\nDoors Status\nSell House\nHouse Radio", "Select", "Cancel");

			new i = PlayerVar[playerid][HouseID];
			foreach(new x : Player) {
				if(!PlayerVar[x][IsHouses]) continue;
				
				if(!listitem) StopAudioStreamForPlayer(x);
				else PlayAudioStreamForPlayer(x, RadioLink[listitem]);	
			}									
			HouseInfo[i][hRadio] = listitem;
			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `houses` SET `Radio`='%d' WHERE `ID`='%d'", listitem, HouseInfo[i][hID]);
			mysql_tquery(SQL, gQuery, "", "");
			if(PlayerVar[playerid][IsHouses] != 0) {
				format(gString, sizeof(gString), "* %s a schimbat muzica din casa, %s.", GetName(playerid), listitem ? RadioNames[listitem] : ("music off"));
				ProxDetector(20.0, playerid, gString, COLOR_PURPLE);	
			}
		}
		case DIALOG_HINFO: {
			if(!response) 
				return bool:true;
			
			ShowPlayerDialog(playerid, DIALOG_HMENU, DIALOG_STYLE_LIST, "House Menu", "House Info\nHouse Description\nSet Rent\nWithdraw\nDeposit\nDoors Status\nSell House\nHouse Radio", "Select", "Cancel");
		}
		case DIALOG_HDESCRIPTION: {
			if(!response) return ShowPlayerDialog(playerid, DIALOG_HMENU, DIALOG_STYLE_LIST, "House Menu", "House Info\nHouse Description\nSet Rent\nWithdraw\nDeposit\nDoors Status\nSell House\nHouse Radio", "Select", "Cancel");
		
			if(strlen(inputtext) > 32) return ShowPlayerDialog(playerid, DIALOG_HDESCRIPTION, DIALOG_STYLE_INPUT, "House Description", "Enter the text:\nMaxim 32 carcaters", "Select", "Back");
			new i = PlayerVar[playerid][HouseID];
			mysql_escape_string(inputtext, HouseInfo[i][hDescription]);

			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `houses` SET `Description`='%e' WHERE `ID`='%d'", HouseInfo[i][hDescription], PlayerInfo[playerid][pHouse]);
			mysql_tquery(SQL, gQuery, "", "");

			UpdateHouseLabel(i);
		}
		case DIALOG_SETRENT: {
			if(!response)
				return ShowPlayerDialog(playerid, DIALOG_HMENU, DIALOG_STYLE_LIST, "House Menu", "House Info\nHouse Description\nSet Rent\nWithdraw\nDeposit\nDoors Status\nSell House\nHouse Radio", "Select", "Cancel");

			if(1 < strval(inputtext) > 250)
				return SCM(playerid, COLOR_GREY, "Amount Inalid.");

			new i = PlayerVar[playerid][HouseID];
			HouseInfo[i][hRented] = strval(inputtext);

			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `houses` SET `Rented`='%d' WHERE `ID`='%d'", HouseInfo[i][hRented], PlayerInfo[playerid][pHouse]);
			mysql_tquery(SQL, gQuery, "", "");
			if(strval(inputtext) > 0) format(gString, sizeof(gString), "Rent set: $%s.", FormatNumber(strval(inputtext)));
			else gString = "Rent disabled";
			SCM(playerid, COLOR_YELLOW, gString);
			UpdateHouseLabel(i);
		}
		case DIALOG_HWITHDRAW: {
			if(!response) 
				return ShowPlayerDialog(playerid, DIALOG_HMENU, DIALOG_STYLE_LIST, "House Menu", "House Info\nHouse Description\nSet Rent\nWithdraw\nDeposit\nDoors Status\nSell House\nHouse Radio", "Select", "Cancel");

			if(strval(inputtext) < 1) return bool:true;
			new i = PlayerVar[playerid][HouseID];
			if(HouseInfo[i][hBalance] < strval(inputtext))
				return SCM(playerid, COLOR_GREY, "Insufficient funds.");

			HouseInfo[i][hBalance] -= strval(inputtext);
			GivePlayerCash(playerid, strval(inputtext));

			format(gString, sizeof(gString), "You deducted from the house the amount of $%s, balance: $%s.", FormatNumber(strval(inputtext)), FormatNumber(HouseInfo[i][hBalance]));
			SCM(playerid, COLOR_YELLOW, gString);

			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `houses` SET `Balance`='%d' WHERE `ID`='%d'", HouseInfo[i][hBalance], PlayerInfo[playerid][pHouse]);
			mysql_tquery(SQL, gQuery, "", "");
		}
		case DIALOG_HDEPOSIT: {
			if(!response) 
				return ShowPlayerDialog(playerid, DIALOG_HMENU, DIALOG_STYLE_LIST, "House Menu", "House Info\nHouse Description\nSet Rent\nWithdraw\nDeposit\nDoors Status\nSell House\nHouse Radio", "Select", "Cancel");

			if(strval(inputtext) < 1) return true;
			if(GetPlayerCash(playerid) < strval(inputtext))
				return SCM(playerid, COLOR_GREY, "You no have money for deposit.");

			new i = PlayerVar[playerid][HouseID];
			if(HouseInfo[i][hBalance]+strval(inputtext) > 1000000000)
				return SCM(playerid, COLOR_GREY, "You can deposit up to $1,000,000,000.");

			HouseInfo[i][hBalance] += strval(inputtext);
			GivePlayerCash(playerid, -strval(inputtext));

			format(gString, sizeof(gString), "You have deposited $%s. balance: $%s.", FormatNumber(strval(inputtext)), FormatNumber(HouseInfo[i][hBalance]));
			SCM(playerid, COLOR_YELLOW, gString);

			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `houses` SET `Balance`='%d' WHERE `ID`='%d'", HouseInfo[i][hBalance], PlayerInfo[playerid][pHouse]);
			mysql_tquery(SQL, gQuery, "", "");
		}
		case DIALOG_SELLHOUSE: {
			if(!response) 
				return ShowPlayerDialog(playerid, DIALOG_HMENU, DIALOG_STYLE_LIST, "House Menu", "House Info\nHouse Description\nSet Rent\nWithdraw\nDeposit\nDoors Status\nSell House\nHouse Radio", "Select", "Cancel");
		
			if(0 < strval(inputtext) > 500000000) 
				return SCM(playerid, COLOR_GREY, "You can sell the house between $1 - $500,000,000.");

			new i = PlayerVar[playerid][HouseID];
			HouseInfo[i][hValue] = strval(inputtext);

			if(strval(inputtext) > 0) format(gString, sizeof(gString), "House Sell: $%s", FormatNumber(strval(inputtext)));
			else gString = "House Sell: none";
			SCM(playerid, COLOR_PINK, gString);

			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `houses` SET `Value`='%d' WHERE `ID`='%d'", HouseInfo[i][hValue], PlayerInfo[playerid][pHouse]);
			mysql_tquery(SQL, gQuery, "", "");

			UpdateHouseLabel(i);
		}
		case DIALOG_SELLCAR: {
			if !response *then
				return true;

			new idd = listitemm[playerid];
			RemovePlayerKey(playerid, idd);
			format(gString, sizeof(gString), "You sold the %s for $%s.", GetVehicleName(CarInfo[idd][cModel]), FormatNumber(CarInfo[idd][cPrice]/2));
			SCM(playerid, COLOR_GREEN3, gString);
			format(gString, sizeof(gString), "* %s sold his %s [car: %d] to DealerShip for $%s.", GetName(playerid), GetVehicleName(CarInfo[idd][cModel]), CarInfo[idd][cID], FormatNumber(CarInfo[idd][cPrice]/2));
			SendAdminMessage(COLOR_YELLOW, gString, 1);
			GivePlayerCash(playerid, CarInfo[idd][cPrice]/2);
			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof(gQuery), "DELETE FROM `cars` WHERE `ID`='%d' LIMIT 1", CarInfo[idd][cID]);
			mysql_tquery(SQL, gQuery, "", "");
			DestroyPlayerCar(idd);
		}
		case DIALOG_CANCELCHECKPOINT: {
			if(!response)
				return true;
			
			DisablePlayerCheckpoint(playerid);
			if(CPEx[playerid] != -1) CancelExam(playerid);
			switch(CP[playerid]) {
				case CP_FIND_PLAYER: {
					PlayerVar[playerid][Find] = -1;
					PlayerTextDrawHide(playerid, FindPTD[0]);
					PlayerTextDrawHide(playerid, FindPTD[1]);
				}
				case CP_ROB: {
					SCM(playerid, COLOR_RED, "Fail rob!");
					RobVehicle[playerid] = INVALID_VEHICLE_ID;
					if(RobBackpack[playerid]) RemovePlayerAttachedObject(playerid, 0);
					RobBackpack[playerid] = false;
					RobStatus[playerid] = 0;
					RobTimer[playerid] = 0;
				}
			}
			if(PlayerVar[playerid][JobWork]) CancelJob(playerid, false);
			CP[playerid] = DISABLE_CHECKPOINT;
			SCM(playerid, COLOR_PINK, "Checkpoint anulat!");
		}	
		case DIALOG_VV: {
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
				case 4: ShowPlayerDialog(playerid, DIALOG_DEBUGCAR, DIALOG_STYLE_MSGBOX, "Debug vehicle", "Your vehicle will be crashing into an Las Ventruas parking", "Yes", "Back");
				case 5: {
					if(CarInfo[idd][cPoints] >= 10) 
						return SCM(playerid, COLOR_LGREEN, "You already have 10 insurance points.");

					format(gString, sizeof(gString), "buy insurance for $%s, you have %d/10 insurance points.", FormatNumber(CarInfo[idd][cInsurance]), CarInfo[idd][cPoints]);
					ShowPlayerDialog(playerid, DIALOG_BUYPOINTS, DIALOG_STYLE_INPUT, "Buy Insurance Points", gString, "Buy", "Back");
				}
				case 6: {
					format(gString, sizeof gString, "%s\n%s\nNeon Upgrades", CarInfo[idd][cRainbow] ? ("{FF0000}You already upgraded to the rainbow") : ("Upgrade to Rainbow Vehicle - {FFFF00}200 premium points"), strlen(CarInfo[idd][cText]) > 2 ? ("{FFFFFF}Edit VIP text") : ("Upgrade to VIP Vehicle - {FFFF00}200 premium points"));
					ShowPlayerDialog(playerid, DIALOG_VUPGRADES, DIALOG_STYLE_LIST, "Vehicle Upgrades", gString, "Select", "Back");
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

					ShowPlayerDialog(playerid, DIALOG_WHEELS, DIALOG_STYLE_LIST, "legendary Wheels", "Shadow\nCutter\nSwitch\nDollar", "Ok", "Exit");
				}
			}
		}
		case DIALOG_WHEELS: {
			if(!response)
				return true;

			new idd = listitemm[playerid];
			if(idd == -1) 
				return true;

			PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
			switch(listitem) {
				case 0: SaveTunning(idd, GetVehicleComponentType(1073), 1073), AddVehicleComponent(CarInfo[idd][cSpawned], 1073);
				case 1: SaveTunning(idd, GetVehicleComponentType(1079), 1079), AddVehicleComponent(CarInfo[idd][cSpawned], 1079);
				case 2: SaveTunning(idd, GetVehicleComponentType(1080), 1080), AddVehicleComponent(CarInfo[idd][cSpawned], 1080);
				case 3: SaveTunning(idd, GetVehicleComponentType(1083), 1083), AddVehicleComponent(CarInfo[idd][cSpawned], 1083);
			} 
			SCM(playerid, COLOR_YELLOW, "Modificari actualizate!");	
		}
		case DIALOG_EDITDS: {
			if !response *then
				return true;

			switch listitem do {
				case 0: ShowPlayerDialog(playerid, DIALOG_EDITDS1, DIALOG_STYLE_INPUT, "Edit vehicle", "Insert new price vehicle", "Done", "Close");
				case 1: ShowPlayerDialog(playerid, DIALOG_EDITDS1, DIALOG_STYLE_INPUT, "Edit vehicle", "Insert new premium points vehicle", "Done", "Close");
				case 2: ShowPlayerDialog(playerid, DIALOG_EDITDS1, DIALOG_STYLE_INPUT, "Edit vehicle", "Insert new stock vehicle", "Done", "Close");
			}
			listitemm[playerid] = listitem;
		}
		case DIALOG_EDITDS1: {
			if !response *then
				return true;

			new price=strval(inputtext),v=PlayerVar[playerid][DealerID];
			switch listitemm[playerid] do {
				case 0: {
					if(1 < price > 2000000000)
						return SCM(playerid, COLOR_GREY, "Invalid Price.");

					CheckDS(playerid, 2, DealerInfo[v][dModel], price, v);
				}
				case 2: CheckDS(playerid, 3, DealerInfo[v][dModel], price, v);
			}
		}
		case DIALOG_BUYPOINTS: {
			new idd = listitemm[playerid];

			if(!response) 
				return ShowPlayerDialog(playerid, DIALOG_VV, DIALOG_STYLE_LIST, "Vehicle Menu", "Vehicle Info\nSpawn vehicle\nTow vehicle (last known location)\nLocate vehicle\nDebug vehicle (unstuck)\nReissue insurance\nVehicle upgrades\nDespawn Vehicle\nVIP Wheels", "Select", "Back");
		
			if(!IsNumeric(inputtext)) return bool:true;
			if(GetPlayerCash(playerid) < CarInfo[idd][cInsurance] * strval(inputtext)) 
				return SCM(playerid, COLOR_LGREEN, "You don't have this amount of money.");

			if(CarInfo[idd][cPoints]+strval(inputtext) > 10) 
				return SCM(playerid, COLOR_GREY, "You have too many insurance points maximum 10.");

			GivePlayerCash(playerid, -CarInfo[idd][cInsurance] * strval(inputtext));
			CarInfo[idd][cPoints] += strval(inputtext);

			format(gString, sizeof(gString), "(-) You paid $%s for %d insurance points.", FormatNumber(CarInfo[idd][cInsurance] * strval(inputtext)), strval(inputtext));
			SCM(playerid, COLOR_GREEN3, gString);
		}
		case DIALOG_PAYINSURANCE: {
			if(!response)
				return bool:true;

			new carid = FindSpawnID(GetPlayerVehicleID(playerid), false);
			if(carid != -1) {
				if(GetPlayerCash(playerid) < CarInfo[carid][cInsurance])
					return SCM(playerid, COLOR_LGREEN, "You don't have this amount of money.");

				CarInfo[carid][cPoints] ++;
				GivePlayerCash(playerid, -CarInfo[carid][cInsurance]);

				format(gString, sizeof(gString), "(-) You paid $%s for 1 insurance points.", FormatNumber(CarInfo[carid][cInsurance]));
				SCM(playerid, COLOR_GREEN3, gString);			
			}
		}
		case DIALOG_DEBUGCAR: {
			new idd = listitemm[playerid];

			if(!response) 
				return ShowPlayerDialog(playerid, DIALOG_VV, DIALOG_STYLE_LIST, "Vehicle Menu", "Vehicle Info\nSpawn vehicle\nTow vehicle (last known location)\nLocate vehicle\nDebug vehicle (unstuck)\nReissue insurance\nVehicle upgrades\nDespawn Vehicle\nVIP Wheels", "Select", "Back");

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
		}
		case DIALOG_CARPLATE: {
			new idd = listitemm[playerid];
			if(!response) 
				return ShowPlayerDialog(playerid, DIALOG_VV, DIALOG_STYLE_LIST, "Vehicle Menu", "Vehicle Info\nSpawn vehicle\nTow vehicle (last known location)\nLocate vehicle\nDebug vehicle (unstuck)\nReissue insurance\nVehicle upgrades\nDespawn Vehicle\nVIP Wheels", "Select", "Back");
			
			if(strlen(inputtext) < 4 || strlen(inputtext) > 10) 
				return SCM(playerid, COLOR_GREY, "Invalid payment, minimum 4 characters maximum 10.");

			GivePlayerCash(playerid, -250);
			mysql_escape_string(inputtext, CarInfo[idd][cLicense]);
			format(gString, 50, "New text plate: %s.", CarInfo[idd][cLicense]);
			SCM(playerid, COLOR_YELLOW, gString);
			SCM(playerid, COLOR_GREY, "When you give the towpark the plate will change");
			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `cars` SET `License`='%e' WHERE `ID`='%i'", CarInfo[idd][cLicense], CarInfo[idd][cID]);
			mysql_tquery(SQL, gQuery, "", "");
		}
		case DIALOG_VUPGRADES: {
			if(!response) 
				return ShowPlayerDialog(playerid, DIALOG_VV, DIALOG_STYLE_LIST, "Vehicle Menu", "Vehicle Info\nSpawn vehicle\nTow vehicle (last known location)\nLocate vehicle\nDebug vehicle (unstuck)\nReissue insurance\nVehicle upgrades\nDespawn Vehicle\nVIP Wheels", "Select", "Back");
			
			new idd = listitemm[playerid];

			switch(listitem) {
				case 0: {
					if(CarInfo[idd][cRainbow]) 
						return SCM(playerid, COLOR_GREY, "It's already a rainbow.");

					ShowPlayerDialog(playerid, DIALOG_RAINBOW, DIALOG_STYLE_MSGBOX, "Upgrade to rainbow:", "You are sure you want to upgrade your vehicle to the rainbow costs 200 premium points.", "Yes", "Back");		
				}
				case 1: {
					if(strlen(CarInfo[idd][cText]) < 3) 
						return ShowPlayerDialog(playerid, DIALOG_VIP, DIALOG_STYLE_MSGBOX, "Upgrade to VIP:", "You are sure you want to upgrade your vehicle to the VIP costs 200 premium points.", "Yes", "Back");					
	
					format(gString, sizeof(gString), "Type\tAmount\nVip text color\t%s\nEdit vip pos\nEdit vip name\t{%s}%s\nVip status\t%s", CarInfo[idd][cVipColor], CarInfo[idd][cVipColor], CarInfo[idd][cText], CarInfo[idd][cVipStatus] ? ("{FFFFFF}Disabled") : ("{FFFF00}Enabled"));
					ShowPlayerDialog(playerid, DIALOG_EDITVIP, DIALOG_STYLE_TABLIST_HEADERS, "Edit VIP text:", gString, "Select", "Close");
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
					ShowPlayerDialog(playerid, DIALOG_NEON, DIALOG_STYLE_TABLIST_HEADERS, "Neon Upgrade", szString, "Select", "Close");
				}
			}
		}
		case DIALOG_NEON: {
			if(!response)
				return bool:true;

			new idd =listitemm[playerid];
			if(listitem<6) {
				if(PlayerInfo[playerid][pNeon][listitem] < 1)
					return SCM(playerid, COLOR_LGREEN, "Nu ai un neon de acest tip.");

				listitemmm[playerid] = listitem;

				if(CarInfo[idd][cNeon] != 0) SCM(playerid, COLOR_RED, "[Warning]{FFFFFF} Ai deja un neon pus pe aceasta masina, daca vei pune altu vei pierde pe cel curent.");
				format(gString, 100, "{C3C3C3}Esti sigur ca vrei sa pui acest %s%s Neon{C3C3C3} pe masina %s?", NeonColor[listitem], Neon[listitem], GetVehicleName(CarInfo[listitemm[playerid]][cModel]));
				ShowPlayerDialog(playerid, DIALOG_FNEON, DIALOG_STYLE_MSGBOX, "Confirm Neon:", gString, "Continue", "Close");
			} else {
				CarInfo[idd][cNeonStatus] = CarInfo[idd][cNeonStatus] ? false : true;
				switch(CarInfo[idd][cNeonStatus]) {
					case true: for(new i = 0; i < 2; i++) if(CarInfo[idd][cNObj][i] != INVALID_OBJECT_ID) DestroyDynamicObject(CarInfo[idd][cNObj][i]), CarInfo[idd][cNObj][i] = INVALID_OBJECT_ID;
					case false: AttachNeon(idd), Streamer_Update(playerid);
				}
				gQuery[0] = EOS;
				mysql_format(SQL, gQuery, 100, "UPDATE `cars` SET `NeonStatus` = '%i' WHERE `ID` = '%i'", CarInfo[idd][cNeonStatus], CarInfo[idd][cID]);
				mysql_tquery(SQL, gQuery);
				SCM(playerid, COLOR_GREY, !CarInfo[idd][cNeonStatus] ? "Ai activat neoanele." : "Ai dezactivat neoanele.");
			}
		}
		case DIALOG_FNEON: {
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
			mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `cars` SET `Neon` = '%d' WHERE `ID` = '%d'", CarInfo[idd][cNeon], CarInfo[idd][cID]);
			mysql_tquery(SQL, gQuery);
		}
		case DIALOG_V: {
			if(!response) 
				return true;

			if(listitem<Iter_Count(MyVehicles<playerid>)) {
				listitemm[playerid] = PlayerInfo[playerid][pCarKey][listitem];
				ShowPlayerDialog(playerid, DIALOG_VV, DIALOG_STYLE_LIST, "Vehicle Menu", "Vehicle Info\nSpawn vehicle\nTow vehicle (last known location)\nLocate vehicle\nDebug vehicle (unstuck)\nReissue insurance\nVehicle upgrades\nDespawn Vehicle\nVIP Wheels", "Select", "Back");
			} else {
				foreach(new idd : MyVehicles<playerid>) {
					if(CarInfo[idd][cSpawned]) continue;
					CreatePlayerCar(idd);
				}
				SCM(playerid, COLOR_YELLOW, "Ai spawnat toate masinile pentru suma de $2.000");
				GivePlayerCash(playerid, -2000);
			}
		}
		case DIALOG_FACTIONS: {
			if(!response)
				return bool:true;

			listitemm[playerid] = listitem;

			new title[50];
			format(gString, 160, "ID: %d\nFaction name: %s\nFaction leader: %s\n\nTotal Members: %d\nMaximum members: %d\nOnline Members: %d", FactionInfo_[listitem][fID], FactionInfo_[listitem][fName], FactionInfo_[listitem][fLeader], FactionInfo_[listitem][fMembers], FactionInfo_[listitem][fMaxMembers], Iter_Count(Factions<listitem+1>));
			format(title, 50, "%s", FactionInfo_[listitem][fName]);
			ShowPlayerDialog(playerid, DIALOG_FINFO, DIALOG_STYLE_MSGBOX, title, gString, "Find", "Exit");
		}
		case DIALOG_FINFO: {
			if(!response)
				return bool:true;

			if(HaveCheckpoint(playerid))
				return ShowCancelCP(playerid);

			new id = listitemm[playerid];

			SetPlayerCheckpointEx(playerid, CP_NORMAL, FactionInfo_[id][fEnterPos][0], FactionInfo_[id][fEnterPos][1], FactionInfo_[id][fEnterPos][2], 3.0);
			format(gString, 100, "Ti-a fost setat un checkpoint pe minimap la factiunea %s. %.0fm", FactionInfo_[id][fName], GetPlayerDistanceFromPoint(playerid, FactionInfo_[id][fEnterPos][0], FactionInfo_[id][fEnterPos][1], FactionInfo_[id][fEnterPos][2]));
			SCM(playerid, COLOR_YELLOW, gString);
		}
		case DIALOG_VINFO: return bool:true;
		case DIALOG_LOGIN: {
			if(RestartCount != 0) return SCM(playerid, COLOR_GREY, "Nu te poti loga in timp ce este un restart.");

			if(!response) 
				return KickEx(playerid);

			SHA256_PassHash(inputtext, HASH_KEY, PlayerInfo[playerid][pPassword], 65);
			if(strlen(PlayerInfo[playerid][pPassword])) OnPlayerLoginIn(playerid, PlayerInfo[playerid][pPassword]);	
			else {
				if(!strlen(PlayerInfo[playerid][pPassword]))
					return SCM(playerid, COLOR_GREY, "Nu ai introdus nimic in casuta.");
				
				if(PlayerVar[playerid][Incercari] == 0)
					return KickEx(playerid);

				ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD,"SERVER: Login","Welcome to the "SERVER_NAME" Server.\n\nPlease enter your password below!","Login","Cancel");
				format(gString, sizeof(gString), "Incorrect password. You have %d remaining login attemps left.", PlayerVar[playerid][Incercari]-1);
				SCM(playerid, COLOR_RED, gString);
				PlayerVar[playerid][Incercari] --;
			}
		}
	}
	return bool:true;
}

public OnPlayerEnterDynamicArea(playerid, areaid) {
	switch(AreaType[areaid]) {
		case AREA_SAFEZONE: PlayerVar[playerid][IsSafezone] = true, PlayerTextDrawShow(playerid, SafezoneTD);
		case AREA_COLISION: DisableRemoteVehicleCollisions(playerid, true);
		case AREA_VENDINGMACHINE: posible_Action[playerid] = VENDING_MACHINE; 
		case AREA_ATM: posible_Action[playerid] = ATM;
		case AREA_ZONE: PlayerCity[playerid] = AreaID[areaid];
		case AREA_PC: {
			PlayerTextDrawSetString(playerid, PressTD[0], "   Press    to enter in computer.");
			PlayerTextDrawSetString(playerid, PressTD[2], "F");
			PlayerTextDrawShow(playerid, PressTD[0]),
			PlayerTextDrawShow(playerid, PressTD[1]),
			PlayerTextDrawShow(playerid, PressTD[2]),
			posible_Action[playerid] = COMPUTER;
		}
		case AREA_ROULETTE: posible_Action[playerid] = ROULETTE;
		case AREA_EXCEPTED: posible_Action[playerid] = EXCPETED;
		case AREA_CHANGE_SKIN: {
			PlayerTextDrawSetString(playerid, PressTD[0], "   Press    to change clothes.");
			PlayerTextDrawSetString(playerid, PressTD[2], "F");
			PlayerTextDrawShow(playerid, PressTD[0]),
			PlayerTextDrawShow(playerid, PressTD[1]),
			PlayerTextDrawShow(playerid, PressTD[2]),
			posible_Action[playerid]=CHANGE_SKIN;
		}
		case AREA_STAGE .. AREA_STAGE_MAX: {
			if(GetPlayerCar(playerid) == -1) return true;
			PlayerTextDrawSetString(playerid, PressTD[0], "   Press    to for stage upgrade.");
			PlayerTextDrawSetString(playerid, PressTD[2], "H");
			PlayerTextDrawShow(playerid, PressTD[0]),
			PlayerTextDrawShow(playerid, PressTD[1]),
			PlayerTextDrawShow(playerid, PressTD[2]),
			posible_Action[playerid]=STAGE + (AreaType[areaid] - AREA_STAGE);
		}
		case AREA_PNS: {
			if(!IsPlayerInAnyVehicle(playerid) || GetVehicleSpeed(GetPlayerVehicleID(playerid)) > 10 && PNStage[playerid]) return true;
			if(GetPlayerCash(playerid) < 100) return GameTextForPlayer(playerid, "~b~~h~~h~~h~no more freebies~n~$100 to respray!", 5000, 3);
			TogglePlayerControllable(playerid, false);
			switch(AreaID[areaid]) {
				case 0: {
					MovePlayerObject(playerid, pnsdoor[playerid][0], 1379.65100, 198.16786, 20.45283, 1.0, 0.00000, 0.00000, -114.12004); // inchis
					InterpolateCameraPos(playerid, 1382.140625, 201.840850, 21.269355, 1385.781616, 209.751266, 23.887695, 2000);
					InterpolateCameraLookAt(playerid, 1380.145874, 197.395324, 20.147626, 1383.780273, 205.418670, 22.396562, 2100);
				}
				case 1: {
					MovePlayerObject(playerid, pnsdoor[playerid][1], 2303.675292, 74.816856, 27.374382, 1.0, 0.000000, 0.000000, 0.000000); // deschis
					InterpolateCameraPos(playerid, 2297.126220, 74.663131, 28.836862, 2289.655029, 74.438613, 31.232313, 2000);
					InterpolateCameraLookAt(playerid, 2301.913330, 74.806999, 27.400671, 2294.443359, 74.530113, 29.796121, 2100);
				}
			}
			SetTimerEx("PNS", 4000, false, "d", playerid);
			PNStage[playerid] = true;
			pnsType[playerid] = AreaID[areaid];
		}
	}
	PlayerAreaID[playerid] = areaid;
	return bool:true;
}

public OnPlayerObjectMoved(playerid, objectid) {
	#if defined gm_debug
		SCMf(playerid, COLOR_YELLOW, "debug OnPlayerObjectMoved %d", objectid);
	#endif
	if(pnsType[playerid] == -1) return true;
	if(pnsdoor[playerid][pnsType[playerid]]!=objectid||PNStage[playerid]>2) return true;
	switch(PNStage[playerid]) {
		case 1: PlayerPlaySound(playerid, 1134, 0.0, 0.0, 0.0);
		case 2: TogglePlayerControllable(playerid, true), PNStage[playerid] = 3;
	}
	return true;
}

function PNS(playerid) {
	if(pnsType[playerid]==-1) return true;
	switch(pnsType[playerid]) {
		case 0: MovePlayerObject(playerid, pnsdoor[playerid][0], 80.10217, 199.16962, 22.15766, 1.0, 0.00000, 90.00000, -114.12000); // deschis
		case 1: MovePlayerObject(playerid, pnsdoor[playerid][1], 2303.666259, 74.816856, 29.114356, 1.0, 0.000000, -90.300003, 0.000000); // deschis
	}
	if(!IsPlayerInAnyVehicle(playerid)) {
		PNStage[playerid] = false;
		return true;
	}
	SetVehicleHealth(GetPlayerVehicleID(playerid), 1000.0);
	RepairVehicle(GetPlayerVehicleID(playerid));
	GameTextForPlayer(playerid, "~b~~h~~h~~h~HOPE YOU LIKE THE NEW COLOR", 5000, 3);
	switch(pnsType[playerid]) {
		case 0: {
			InterpolateCameraPos(playerid, 1385.781616, 209.751266, 23.887695, 1383.741210, 204.729217, 20.605241, 2000);
			InterpolateCameraLookAt(playerid, 1383.780273, 205.418670, 22.396562, 1381.733398, 200.169815, 20.180587, 2100);
		}
		case 1: {
			InterpolateCameraPos(playerid, 2289.655517, 74.438621, 31.232191, 2297.596435, 74.760253, 28.753524, 2000);
			InterpolateCameraLookAt(playerid, 2294.415283, 74.685966, 29.721040, 2302.393554, 74.851928, 27.346986, 2100);			
		}
	}
	PNStage[playerid] = 2;
	return true;
}

public OnPlayerLeaveDynamicArea(playerid, areaid) {
	switch(AreaType[areaid]) {
		case AREA_SAFEZONE: PlayerVar[playerid][IsSafezone] = false, PlayerTextDrawHide(playerid, SafezoneTD);
		case AREA_COLISION: DisableRemoteVehicleCollisions(playerid, false);
		case AREA_VENDINGMACHINE, AREA_ATM, AREA_ROULETTE, AREA_EXCEPTED: posible_Action[playerid] = INVALID_ACTION;
		case AREA_CHANGE_SKIN, AREA_PC, AREA_STAGE..AREA_STAGE_MAX: {
			posible_Action[playerid] = INVALID_ACTION;
			PlayerTextDrawHide(playerid, PressTD[0]),
			PlayerTextDrawHide(playerid, PressTD[1]),
			PlayerTextDrawHide(playerid, PressTD[2]);
		}
		case AREA_PNS: {
			if(PNStage[playerid]) {
				switch(pnsType[playerid]) {
					case 0: MovePlayerObject(playerid, pnsdoor[playerid][0], 1380.471069, 197.776870, 22.194015, 1.0, 0.000000, 91.599929, 66.199958); // deschis
					case 1: MovePlayerObject(playerid, pnsdoor[playerid][1], 2303.666259, 74.816856, 29.114356, 1.0, 0.000000, -90.300003, 0.000000); // deschis
				}
				TogglePlayerControllable(playerid, true);
			}
			pnsType[playerid] = -1;
			PNStage[playerid] = false;
			SetCameraBehindPlayer(playerid);
		}
	}
	PlayerAreaID[playerid] = -1;
	return bool:true;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid) {
	#if defined gm_debug
		SCMf(playerid, COLOR_YELLOW, "debug OnVehiclePaintjob %d %d", vehicleid, paintjobid);
	#endif
	new idd = FindSpawnID(vehicleid, false);
	if(idd != -1) {
		CarInfo[idd][cPaintjob] = paintjobid;
		gQuery[0] = EOS;
		mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `cars` SET `Paintjob`='%i' WHERE `id`='%i'", paintjobid, CarInfo[idd][cID]);
		mysql_tquery(SQL, gQuery);
	}
	return bool:true;	
}

public OnVehicleMod(playerid, vehicleid, componentid) {
	#if defined gm_debug
		SCMf(playerid, COLOR_YELLOW, "debug OnVehicleMod %d %d", vehicleid, componentid);
	#endif
	if(GetPlayerInterior(playerid) == 0 && !IsAdmin(playerid, 1)) {
		RemoveVehicleComponent(vehicleid, componentid);
		AdmBot(playerid, "Cheats (Mods-Hack)");
		return bool:true;
    }
    new idd=FindSpawnID(vehicleid, false);
    if(idd != -1 && GetVehicleComponentType(componentid)!=-1) SaveTunning(idd, GetVehicleComponentType(componentid), componentid);
	SetVehicleHealth(vehicleid, 999);
	return bool:true;
} 

stock SaveTunning(idd, slot, componentid) {
	CarInfo[idd][cMod][slot] = componentid;
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `cars` SET `Mod`='%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i' WHERE `ID`='%d'", CarInfo[idd][cMod][0], CarInfo[idd][cMod][1], CarInfo[idd][cMod][2],
		CarInfo[idd][cMod][3], CarInfo[idd][cMod][4], CarInfo[idd][cMod][5], CarInfo[idd][cMod][6], CarInfo[idd][cMod][7], CarInfo[idd][cMod][8], CarInfo[idd][cMod][9],
		CarInfo[idd][cMod][10], CarInfo[idd][cMod][11], CarInfo[idd][cMod][12], CarInfo[idd][cMod][13], CarInfo[idd][cID]);
	mysql_tquery(SQL, gQuery, "", "");
	return bool:true;
}

public OnVehicleDeath(vehicleid, killerid) {
	#if defined gm_debug
		printf("debug OnVehicleDeath %d %d", vehicleid, killerid);
	#endif
	GetVehiclePos(vehicleid, VehiclePos[vehicleid][0], VehiclePos[vehicleid][1], VehiclePos[vehicleid][2]);
	GetVehicleZAngle(vehicleid, VehiclePos[vehicleid][3]);
	new playerid = VehicleAcces[vehicleid], Float: vHealth;
	GetVehicleHealth(vehicleid, vHealth);
	if(FindSpawnID(vehicleid, false) != -1) {
		new idd = FindSpawnID(vehicleid, false);
		CarInfo[idd][cPoints] --;
		CarInfo[idd][cInsurance] += RandomEx(100, 200);
		SetPlayerCarTime(idd);
		CarInfo[idd][cHealth] = 999;
	}
	if(playerid != -1) {
		if(vHealth < 250.0) {
			if(PlayerVar[playerid][RentVehicle] == vehicleid) DestroyRentCar(playerid);
			if(PlayerVar[playerid][JobVehicle] == vehicleid && PlayerVar[playerid][JobWork]) CancelJob(playerid, false);
		}
	}
	Engine[vehicleid] = IsABike(vehicleid)?true:false;
	new engine, lights, alarm, doors, bonnet, boot, objective;
	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	SetVehicleParamsEx(vehicleid, Engine[vehicleid], lights, alarm, doors, bonnet, boot, objective);
	return bool:true;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid) {
	#if defined gm_debug
		SCMf(playerid, -1, "callback OnPlayerClickPlayerTextDraw %d", _:playertextid);
	#endif
	gString[0] = EOS;
	switch(player_selected[playerid]) {	
		case 4: {
			switch(PlayerTextID[playerid][PlayerText:playertextid]) {
				case 0..10: {
					new i = PlayerTextID[playerid][PlayerText:playertextid], xy = ((i < 5 && !PlayerVar[playerid][TradeType]) || (i >= 5 && PlayerVar[playerid][TradeType]) ? playerid : PlayerVar[playerid][IsTrade]);
					if(TradeObject[xy][1] != -1) return ShowCarInfo(playerid, TradeObject[xy][1]);
				}
				case 11: {
					if(PlayerVar[playerid][TradeType])
						return bool:true;

					new id = PlayerVar[playerid][IsTrade];

					switch(PlayerVar[playerid][TradeReady]) {
						case false: {
							if(!PlayerVar[playerid][TradeItems])
								return SCM(playerid, COLOR_LGREEN, "Trebuie sa adaugi minim un obiect personal.");

							if(GetPlayerCash(playerid) < TradeObject[playerid][0])
								return SCM(playerid, COLOR_LGREEN, "Nu ai aceasta suma de bani pusa in trade.");

							if(TradeObject[playerid][1] != -1 && TradeObject[id][1] == -1 && GetPlayerTotalVehicle(id) >= GetPlayerSlot(id))
								return SCM(playerid, COLOR_LGREEN, "Acel player are numarul maxim de masini puteti face doar schimb.");
						
							if(TradeObject[playerid][1] == -1 && TradeObject[id][1] != -1 && GetPlayerTotalVehicle(playerid) >= GetPlayerSlot(playerid))
								return SCM(playerid, COLOR_LGREEN, "Ai numar maxim de masimi puteti face doar schimb.");
							
							if(TradeObject[playerid][0] != -1 && TradeObject[id][0] != -1 && PlayerVar[playerid][TradeItems] == 1 && PlayerVar[id][TradeItems] == 1)
								return SCM(playerid, COLOR_LGREEN, "Nu poti face schimb bani pe bani.");
						
							if(TradeObject[playerid][2] != -1 && totalPlayerSkin(id)>=MAX_ITEMS)
								return SCM(playerid, COLOR_LGREEN, "Acel player are numarul maxim de skinuri.");
					
							if(TradeObject[id][2] != -1 && totalPlayerSkin(playerid)>=MAX_ITEMS)
								return SCM(playerid, COLOR_LGREEN, "Ai numarul maxim de skin slot.");

							PlayerTextDrawSetString(playerid, TradePTD[playerid][4], "~g~pregatit");
							PlayerTextDrawSetString(id, TradePTD[id][4], "~g~pregatit");

							PlayerVar[playerid][TradeReady] = true;

							if(PlayerVar[playerid][TradeReady] == 1 && PlayerVar[id][TradeReady] == 1) {
								PlayerTextDrawSetString(playerid, TradePTD[playerid][6], "00:10");
								PlayerTextDrawSetString(id, TradePTD[id][6], "00:10");
								PlayerTextDrawShow(playerid, TradePTD[playerid][6]);
								PlayerTextDrawShow(id, TradePTD[id][6]);
								TradeTime[playerid] = 10;
							}
						}
						case true: {
							PlayerTextDrawSetString(playerid, TradePTD[playerid][4], "~r~nepregatit");
							PlayerTextDrawSetString(id, TradePTD[id][4], "~r~nepregatit");
							PlayerTextDrawShow(playerid, TradePTD[playerid][4]);
							PlayerTextDrawShow(id, TradePTD[id][4]);
							PlayerVar[playerid][TradeReady] = false;
							if(TradeTime[id] != 0 || TradeTime[playerid] != 0) {
								PlayerTextDrawHide(id, TradePTD[id][6]);
								PlayerTextDrawHide(playerid, TradePTD[playerid][6]);
								TradeTime[playerid] = 0;
								TradeTime[id] = 0;
							}	
						}
					}
				}
				case 12: {
					if(!PlayerVar[playerid][TradeType])
						return bool:true;

					new id = PlayerVar[playerid][IsTrade];

					switch(PlayerVar[playerid][TradeReady]) {
						case false: {
							if(!PlayerVar[playerid][TradeItems])
								return SCM(playerid, COLOR_LGREEN, "Trebuie sa adaugi minim un obiect personal.");

							if(GetPlayerCash(playerid) < TradeObject[playerid][0])
								return SCM(playerid, COLOR_LGREEN, "Nu ai aceasta suma de bani pusa in trade.");

							if(TradeObject[playerid][1] != -1 && TradeObject[id][1] == -1 && GetPlayerTotalVehicle(id) == GetPlayerSlot(id))
								return SCM(playerid, COLOR_LGREEN, "Acel player are numarul maxim de masini puteti face doar schimb.");
						
							if(TradeObject[playerid][1] == -1 && TradeObject[id][1] != -1 && GetPlayerTotalVehicle(playerid) == GetPlayerSlot(playerid))
								return SCM(playerid, COLOR_LGREEN, "Ai numar maxim de masimi puteti face doar schimb.");
							
							if(TradeObject[playerid][0] != -1 && TradeObject[id][0] != -1 && PlayerVar[playerid][TradeItems] == 1 && PlayerVar[id][TradeItems] == 1)
								return SCM(playerid, COLOR_LGREEN, "Nu poti face schimb bani pe bani.");
						
							if(TradeObject[playerid][2] != -1 && totalPlayerSkin(id)>=MAX_ITEMS)
								return SCM(playerid, COLOR_LGREEN, "Acel player are numarul maxim de skinuri.");
					
							if(TradeObject[id][2] != -1 && totalPlayerSkin(playerid)>=MAX_ITEMS)
								return SCM(playerid, COLOR_LGREEN, "Ai numarul maxim de skin slot.");

							PlayerTextDrawSetString(playerid, TradePTD[playerid][5], "~g~pregatit");
							PlayerTextDrawSetString(id, TradePTD[playerid][5], "~g~pregatit");

							PlayerVar[playerid][TradeReady] = true;

							if(PlayerVar[playerid][TradeReady] == 1 && PlayerVar[id][TradeReady] == 1) {
								PlayerTextDrawSetString(playerid, TradePTD[playerid][6], "00:10");
								PlayerTextDrawSetString(id, TradePTD[id][6], "00:10");
								PlayerTextDrawShow(playerid, TradePTD[playerid][6]);
								PlayerTextDrawShow(id, TradePTD[id][6]);
								TradeTime[playerid] = 10;
							}
						}
						case true: {
							PlayerTextDrawSetString(playerid, TradePTD[playerid][5], "~r~nepregatit");
							PlayerTextDrawSetString(id, TradePTD[id][5], "~r~nepregatit");
							PlayerTextDrawShow(playerid, TradePTD[playerid][5]);
							PlayerTextDrawShow(id, TradePTD[id][5]);						
							PlayerVar[playerid][TradeReady] = false;
							if(TradeTime[id] != 0 || TradeTime[playerid] != 0) {
								PlayerTextDrawHide(id, TradePTD[id][6]);
								PlayerTextDrawHide(playerid, TradePTD[playerid][6]);
								TradeTime[playerid] = 0;
								TradeTime[id] = 0;
							}	
						}
					}
				}
				case 13: {
					if(!PlayerVar[playerid][TradeItems]) 
						return SCM(playerid, COLOR_LGREEN, "Nu ai adaugat nimic in aceasta afacere!");
					
					if(PlayerVar[playerid][TradeReady]) 
						return SCM(playerid, COLOR_LGREEN, "Nu poti sterge bunurile adaugate in timp ce timer-ul este activat!");
				
					HideTradeItems(playerid);
					gString[0] = EOS;
					format(gString, 100, "%s si-a sters bunurile adaugate.", GetName(playerid));
					SCM(playerid, COLOR_LIGHTGOLD, gString);
					SCM(PlayerVar[playerid][IsTrade], COLOR_LIGHTGOLD, gString);
					return bool:true;		
				}	
				case 14: if(!PlayerVar[playerid][TradeReady]) return ShowPlayerDialog(playerid, DIALOG_TRADE, DIALOG_STYLE_LIST, "Trade", "Money\nVehicle\nCurrent Skin\nHouse\nBusiness\nRare Voucher (50 PP)\nNatrox Voucher (100 PP)\nSpecial Voucher (500 PP)", "Ok", "Cancel");
			}
		}
		case 5: {
			new i = PlayerTextID[playerid][PlayerText:playertextid];
			if(!PlayerVar[playerid][PinConst][0] && i == 0) return SCM(playerid, COLOR_GREY, "Nu poti incepe cu 0.");

			loop.pin(0..4) if(!PlayerVar[playerid][PinConst][pin]) { PlayerVar[playerid][PinConst][pin] = i+'0'; break; }
			PlayerTextDrawSetString(playerid, PinPTD[playerid][3], PlayerVar[playerid][PinConst]);

			if(PlayerVar[playerid][PinConst][3]) {
				if(strval(PlayerVar[playerid][PinConst]) != PlayerInfo[playerid][pPin]) return SCM(playerid, COLOR_RED, "Parola nu este corecta!"), KickEx(playerid);
				SCM(playerid, COLOR_YELLOW, "You have successfully logged in. You now have access to your account.");
				PlayerVar[playerid][PinLogged] = true;
				loop.f(0..28) PlayerTextDrawDestroy(playerid, PinPTD[playerid][f]);	
				CancelSelectTextDraw(playerid);
				player_selected[playerid] = 0;
				UpdateVarStr(playerid, "IP", playerIP[playerid]);
			}
		}
		case 11: return ClickBattlePass(playerid, playertextid);
		case 12: return clickPlayerPC(playerid, playertextid);
		case 16: return click_register(playerid, PlayerTextID[playerid][PlayerText:playertextid]);
		case 20: {
			new i = PlayerTextID[playerid][PlayerText:playertextid];
			SCMf(playerid, COLOR_SERVER, "VEHICLE >> {FFFFFF}Ai ales vehiculul %s (top speed %d) care expira in %d zile..", GetVehicleName(temp_model[i]), GetVehicleMaxSpeed(temp_model[i]), exp_model[i]);
			mysql_format(SQL, gQuery, 128, "INSERT INTO cars (Model) VALUES (%d)", temp_model[i]);
			mysql_tquery(SQL, gQuery, "SQL_InsertVehicle", "iiiii", exp_model[i], playerid, temp_model[i], false, 3);
			i=-1;
			while(++i<11) PlayerTextDrawDestroy(playerid, select_carTD[playerid][i]);
			UpdateVar(playerid, "Tutorial", ++PlayerInfo[playerid][pTut]);
			player_selected[playerid] = 0;
			CancelSelectTextDraw(playerid);
		}
	}
	return bool:true;
}

std::ClearPin(playerid) {
	if(!strlen(PlayerVar[playerid][PinConst]))
		return bool:true;

	PlayerTextDrawSetString(playerid, PinPTD[playerid][3], "----");
	array_set:<_>PlayerVar[playerid][PinConst] => [0 .. 5];
	return bool:true;
}

public OnPlayerClickTextDraw(playerid, Text:clickedid) {
	#if defined gm_debug
		SCMf(playerid, -1, "callback OnPlayerClickTextDraw %d", _:clickedid);
	#endif
	if(clickedid == Text:INVALID_TEXT_DRAW) {
		switch(player_selected[playerid]) {
			case 4: {
				new id = PlayerVar[playerid][IsTrade];
				format(gString, 50, "* %s a anulat afacerea!", GetName(playerid));
				SCM(playerid, COLOR_LIGHTGOLD, gString);
				SCM(id, COLOR_LIGHTGOLD, gString);
				DestroyTradeItems(playerid);
				DestroyTradeItems(id);
				HideTradeTDs(id);
				HideTradeTDs(playerid);
				player_selected[playerid] = 0;
				player_selected[id] = 0;
				CancelSelectTextDraw(playerid);
				CancelSelectTextDraw(id);
			}
			case 5: SelectTextDraw(playerid, 0xFF0000FF);
			case 6: {
				for(new i = 0; i < 5; i++) TextDrawHideForPlayer(playerid, GunTD[i]);
				PlayerTextDrawHide(playerid, GunPTD);
				new x = PlayerVar[playerid][IsStoreGun];
				MovePlayerObject(playerid, StoreGun[playerid][x], GunPosOld[x][0], GunPosOld[x][1], GunPosOld[x][2], 5.0, GunPosOld[x][3], GunPosOld[x][4], GunPosOld[x][5]);
				PlayerVar[playerid][IsStoreGun] = -1;
				player_selected[playerid] = 0;
				SetCameraBehindPlayer(playerid);
			}
			case 9: SelectTextDraw(playerid, COLOR_GM);
			case 10: HideRoulette(playerid);
			case 11: {
				for(new i=0;i<20;i++) PlayerTextDrawDestroy(playerid, bpPTD[playerid][i]);
				for(new i=0;i<7;i++) TextDrawHideForPlayer(playerid, bpTD[i]);
				player_selected[playerid] = 0;
			}
			case 12: _hide_player_PC(playerid);
			case 13: {
				if(PlayerVar[playerid][CrateTime]) return SelectTextDraw(playerid, 0xE4CD5AFF);
				for(new i=0;i<10;i++) PlayerTextDrawDestroy(playerid, CratePTD[playerid][i]);
				for(new i=0;i<11;i++) TextDrawHideForPlayer(playerid, CrateTD[i]);
				player_selected[playerid] = 0;
			}
			case 20: return SelectTextDraw(playerid, 0xA76938FF);
			case 21: {
				CancelSelectTextDraw(playerid);
				player_selected[playerid] = 0;
				for(new i=0;i<11;++i) TextDrawHideForPlayer(playerid, SkinShopTD[i]);
				PlayerTextDrawHide(playerid, SkinPTD[0]);
				PlayerTextDrawHide(playerid, SkinPTD[1]);
				SetCameraBehindPlayer(playerid);
				SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
				SetPlayerVirtualWorld(playerid, BizzInfo[PlayerVar[playerid][IsBizz]][bVirtualWorld]);
				return true;
			}
			case 22: return hide_phone(playerid,false);
			default:return true;
		}
		return true;
	}
	switch(player_selected[playerid]) {
		case 6: {
			if(clickedid == GunTD[4]) {
				if(GetPlayerCash(playerid) < GunsType[1][PlayerVar[playerid][IsStoreGun]])
					return SCM(playerid, COLOR_GREY, "Nu ai aceasta suma de bani");

				GivePlayerWeapon(playerid, GunsType[0][PlayerVar[playerid][IsStoreGun]], GunsType[2][PlayerVar[playerid][IsStoreGun]]);
				GivePlayerCash(playerid, -GunsType[1][PlayerVar[playerid][IsStoreGun]]);
				ClearString();
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
				format(gString, 125, "{FF0000}(Gun Shop) {FFFFFF}Ti-ai cumparat un %s cu %d gloante pentru suma de $%s.", StoreGunsName[PlayerVar[playerid][IsStoreGun]], GunsType[2][PlayerVar[playerid][IsStoreGun]], FormatNumber(GunsType[1][PlayerVar[playerid][IsStoreGun]]));
				SCM(playerid, COLOR_WHITE, gString);
				return bool:true;
			}
			if(clickedid == GunTD[2]) return ShowGun(playerid, true);
			if(clickedid == GunTD[3]) return ShowGun(playerid, false);
		}
		case 4: {
			if(clickedid == TradeTD[10]) {
				if(!PlayerVar[playerid][TradeItems]) 
					return SCM(playerid, COLOR_LGREEN, "Nu ai adaugat nimic in aceasta afacere!");

				if(PlayerVar[playerid][TradeReady]) 
					return SCM(playerid, COLOR_LGREEN, "Nu poti sterge bunurile adaugate in timp ce timer-ul este activat!");
				
				HideTradeItems(playerid);		
				format(gString, 100, "%s si-a sters bunurile adaugate.", GetName(playerid));
				SCM(playerid, COLOR_LIGHTGOLD, gString);
				SCM(PlayerVar[playerid][IsTrade], COLOR_LIGHTGOLD, gString);	
				return bool:true;	
			}
			if(clickedid == TradeTD[9] && !PlayerVar[playerid][TradeReady]) return ShowPlayerDialog(playerid, DIALOG_TRADE, DIALOG_STYLE_LIST, "Trade", "Money\nVehicle\nCurrent Skin\nHouse\nBusiness\nRare Voucher (50 PP)\nNatrox Voucher (100 PP)\nSpecial Voucher (500 PP)", "Ok", "Cancel");
		}
		case 10: return OnPlayerClickRoulette(playerid, clickedid);
		case 11: {
			if(clickedid == bpTD[6]) {
				format(gString, sizeof gString, "Chapter\tStatus\nChapter 1\t%s\nChapter 2\t%s\nChapter 3\t%s\nChapter 4\t%s", bpChapter>0?("{00FF00}unlocked"):("{FF0000}locked"),bpChapter>1?("{00FF00}unlocked"):("{FF0000}locked"),bpChapter>2?("{00FF00}unlocked"):("{FF0000}locked"),bpChapter>3?("{00FF00}unlocked"):("{FF0000}locked"));
				ShowPlayerDialog(playerid, DIALOG_BP,DIALOG_STYLE_TABLIST_HEADERS, "BattlePass Chapter", gString, "Select", "Cancel");
				return true;
			}
			if(clickedid == bpTD[2]) {
				if(PlayerInfo[playerid][pGoldPass]) return SCM(playerid, COLOR_GREY, "Ai deja gold battle pass!");
				ShowPlayerDialog(playerid, DIALOG_BUYBP, DIALOG_STYLE_MSGBOX, "Buy {E8CE16}Gold Pass", "{FFFFFF}Esti sigur ca vrei sa cumperi {E8CE16}Gold Pass{FFFFFF} pentru suma de 500 premium points?\nVei avea access la premii in plus.", "Buy", "Close");
				return true;
			}
		}
		case 12: return ClickCalculator(playerid, clickedid);
		case 13: {
			if(clickedid == CrateTD[3]) {
				if(PlayerVar[playerid][CrateTime] != 0)
					return true;

				gString[0] = EOS;
				new x = PlayerVar[playerid][CrateSelect];
				if(PlayerInfo[playerid][pCrate][x] <= 0) { 
					format(gString, 50, "Nu mai ai acest crate %s.", CrateInfo[x][C_NAME]);
					SCM(playerid, -1, gString);
					return true;
				}
				if(x == 0) checkBP(playerid, 2, 150); 
				format(gString, 80, "You have a opened a {%s}%s Crate{FFFFFF}! Waiting...", CrateInfo[x][C_COLOR], CrateInfo[x][C_NAME]);
				SCM(playerid, COLOR_WHITE, gString);
				Iter_Add(PlayerCrates, playerid);
				PlayerVar[playerid][CrateTime] = 30;
				PlayerInfo[playerid][pCrate][x] --;
				save_crates(playerid);
				return true;
			}
			if(clickedid == CrateTD[4]) return UpdateCratePrize(playerid, false);
			if(clickedid == CrateTD[5]) return UpdateCratePrize(playerid, true);
		}
		case 16: return click_register(playerid, CLICK_REGISTER_CONFIRM);
		case 21: {
			if(clickedid == SkinShopTD[8]) {
				if(GetPlayerMaxSkin(playerid))
					return SCM(playerid, COLOR_GREY, "Ai numarul maxim de skinuri.");

				if(GetPlayerCash(playerid) < 10000)
					return SCM(playerid, COLOR_GREY, "Nu ai aceasta suma de banii!");

				GivePlayerCash(playerid, -10000);
				SCM(playerid, COLOR_LGREEN, "* Felicitari! Ti-ai cumparat un skin pentru suma de $10.000!");

				CancelSelectTextDraw(playerid);
				player_selected[playerid] = 0;
				for(new i=0;i<11;++i) TextDrawHideForPlayer(playerid, SkinShopTD[i]);
				PlayerTextDrawHide(playerid, SkinPTD[0]);
				PlayerTextDrawHide(playerid, SkinPTD[1]);
				SetCameraBehindPlayer(playerid);
				SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
				SetPlayerVirtualWorld(playerid, BizzInfo[PlayerVar[playerid][IsBizz]][bVirtualWorld]);

				if PlayerInfo[playerid][pTut] == 3 *then {
					PlayerInfo[playerid][pTut]++;
					UpdateVar(playerid, "Tutorial", PlayerInfo[playerid][pTut]);
					SpawnPlayer(playerid);
					ShowPlayerTutorial(playerid);
				}
				CheckPlayerMission(playerid, 6, 1);
				return true;
			}
			if(clickedid == SkinShopTD[0] && (--skinSlot[playerid]) < 0) skinSlot[playerid] = sizeof skins - 1;
			else if(clickedid == SkinShopTD[2] && (++skinSlot[playerid]) > sizeof skins - 1) skinSlot[playerid] = 0;
			PlayerTextDrawColor(playerid, SkinPTD[0], 0xFFFFFF45);
			if(GetPlayerCash(playerid) < 10000)	return true;
			PlayerTextDrawSetString(playerid, SkinPTD[1], "normal - ~g~~h~$10.000");
			PlayerTextDrawShow(playerid, SkinPTD[0]);
			PlayerTextDrawShow(playerid, SkinPTD[1]);
			SetPlayerSkin(playerid, skins[skinSlot[playerid]]);
			return true;
		}
		case 22: return click_phone_txd(playerid, clickedid);
	}
	return true;
}

public OnPlayerText(playerid, text[]) {
	if(!IsPlayerLogged(playerid)) 
		return 0;

	//if(!PlayerInfo[StatTarget][pDiscordSecurity]) return false;

	if(CheckMute(playerid)) return ShowMute(playerid), 0;

	if(PlayerVar[playerid][ADuty]) {
		format(gString, sizeof gString, "(( Admin %s: %s ))", GetName(playerid), text);
		ProxDetector(100.0, playerid, gString, COLOR_YELLOW);
		return 0;
	}

	if(PlayerVar[playerid][IsPhone] != -1) {
		new id = PlayerVar[playerid][IsPhone];
		if(strfind(call_p[playerid], "#31#", true)!=-1) format(gString, 170, "[Phone] ** PRIVAT: %s", text);
		else format(gString, 170, "[Phone] %s: %s", GetNameEx(playerid), text);
		if(PlayerVar[id][IsPhone] == playerid) SCM(id, COLOR_YELLOW, gString);
		ProxDetector(20.0, playerid, gString, COLOR_GREY);
		return false;
	}

	new xx=-1;
	if((xx=strlen(text)) > 3) {
		if(text[xx-1] == ' '&&text[xx-2]== ' ') return false;
		if(lastChar[playerid][0]==text[xx-3]&&lastChar[playerid][1]==text[xx-2]&&lastChar[playerid][2]==text[xx-1]) return false;
		lastChar[playerid][0]=text[xx-3];
		lastChar[playerid][1]=text[xx-2];
		lastChar[playerid][2]=text[xx-1];
	} else if(xx==lenChar[playerid]) return Y_HOOKS_CONTINUE_RETURN_0;

	lenChar[playerid] = xx;

	if checkReclame(playerid, text) *then return false;
    if(PlayerVar[playerid][LTT] >= GetTickCount()) {
    	PlayerVar[playerid][TC]++;
    	if(PlayerVar[playerid][TC] > 5) {
			PlayerInfo[playerid][pMute] += 15;
    		PlayerVar[playerid][TC] = 0;
    		SCM(playerid, COLOR_GREY, "You have been auto-muted for spamming. You will be unmuted in 15 seconds.");
    		return 0;
    	}
    }
    PlayerVar[playerid][LTT] = GetTickCount() + 1000*3;

    if(NewLive[playerid] != -1) {
		format(gString, sizeof(gString), "%s %s: %s", PlayerInfo[playerid][pMember] == 10 ? ("{FFABFC}Reporter{9ACD32}"):("Jucator"), PlayerInfo[playerid][pName], text);
		OOCNews(COLOR_LIGHTGREEN, gString);
		if(PlayerInfo[playerid][pMember] != 11) PunctRaport[playerid] ++;
		return false;
	}

	mysql_format(SQL, gQuery, 256, "INSERT INTO `chat_log` (`date`, `Userid`, `Name`, `text`) VALUES ('%e', '%i', '%e', '%e')", Date(), PlayerInfo[playerid][pSQLID], GetNameEx(playerid), text);
	mysql_tquery(SQL, gQuery);

    if(PaintType[playerid] != 0) {
    	format(gString, sizeof gString, "{5088BF}%s [%d kills]: {FFFFFF}%s", GetNameEx(playerid), PKills[playerid], text);
    	SendPaintMessage(PaintType[playerid], COLOR_WHITE, gString);
    	return false;
    }

	format(gString, sizeof gString, "{%s}%s: {FFFFFF}%s", !PlayerInfo[playerid][pColor] ? (!IsAdmin(playerid, 1) && !IsHelper(playerid, 1)) || PlayerVar[playerid][Acover] ? ("C3C3C3") : ("BA0404") : SColors[PlayerInfo[playerid][pColor]], GetNameEx(playerid), text);
	ProxDetector(20.0, PlayerVar[playerid][MySpec] != -1 ? PlayerVar[playerid][MySpec] : playerid, gString, COLOR_WHITE);
	SetPlayerChatBubble(playerid, text, COLOR_WHITE, 20.0, 10000);
	return false;
}

public OnVehicleStreamIn(vehicleid, forplayerid) {
	if(Iter_Contains(PlayerKeys[forplayerid], vehicleid)) SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);
	return bool:true;
}	

function VendingMachineUsed(playerid) {
	p_VendingUseTimer[playerid] = -1;
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return true;
	new Float: fHealth;
	GetPlayerHealth(playerid, fHealth);
	fHealth=fHealth+35.0>100.0?100.0:fHealth+35.0;
	SetPlayerHealth(playerid, fHealth);
	return true;
}


ResetPlayerVendingMachineData(playerid) {
	if (p_VendingUseTimer[playerid] == -1) return true;
	KillTimer(p_VendingUseTimer[playerid]);
	p_VendingUseTimer[playerid] = -1;
	return true;
}
VDialog:change_skin(playerid, id)<hover> {
	new i = PlayerInfo[playerid][pCarKey][id];
	SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin][i]);
	return true;
}

VDialog:change_skin(playerid, bool:response, index)<focus> {
	if(!response) {
		SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
		SetCameraBehindPlayer(playerid);
		return false;
	}
	if(index!=-1) {
		PlayerInfo[playerid][pModel] = PlayerInfo[playerid][pSkin][PlayerInfo[playerid][pCarKey][index]];
		UpdateVar(playerid, "Model", PlayerInfo[playerid][pModel]);
		SCMf(playerid, COLOR_GM, "SKIN >> {FFFFFF}Ti-ai selectat skin-ul %d (type %s).", PlayerInfo[playerid][pModel], GetSkinType(PlayerInfo[playerid][pModel]));
		SetCameraBehindPlayer(playerid);
		HideDialogStyleV(playerid);
	}
	return true;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {
	new engine, lights, alarm, doors, bonnet, boot, objective;
	if(newkeys & KEY_SECONDARY_ATTACK) {
		if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return bool:true;
		if(EnterFunction(playerid)) return true;
		if(ExitFunction(playerid)) return true;
		switch(posible_Action[playerid]) {
			case CHANGE_SKIN: {
				switch(HouseInfo[PlayerVar[playerid][IsHouses]][hIntID]) {
					case 1: {
						SetPlayerPos(playerid, 229.0065,1287.3854,1082.1406),SetPlayerFacingAngle(playerid, 358.4539);
						SetPlayerCameraPos(playerid, 229.030029, 1289.411865, 1082.706298);
						SetPlayerCameraLookAt(playerid, 229.140380, 1284.449707, 1082.102294);
					}
					case 3: {
						SetPlayerPos(playerid, 331.8755,1477.8931,1084.4364),SetPlayerFacingAngle(playerid, 1.9240);
						SetPlayerCameraPos(playerid, 229.335159, 1291.009765, 1083.339355);
						SetPlayerCameraLookAt(playerid, 331.773315, 1476.307006, 1083.729492);
					}
					case 5: {
						SetPlayerPos(playerid, 300.6824,305.7756,1003.5391),SetPlayerFacingAngle(playerid, 270.0725);
						SetPlayerCameraPos(playerid, 302.963195, 305.928649, 1004.130371);
						SetPlayerCameraLookAt(playerid, 298.023437, 305.895385, 1003.357360);
					}
					case 11: {
						SetPlayerPos(playerid, 248.6745,303.7630,999.1484),SetPlayerFacingAngle(playerid, 90.5308);
						SetPlayerCameraPos(playerid, 247.034469, 303.772399, 999.348266);
						SetPlayerCameraLookAt(playerid, 252.010391, 303.655212, 998.872436);
					}
					case 12: {
						SetPlayerPos(playerid, 225.1732,1196.9508,1080.2668),SetPlayerFacingAngle(playerid, 7.2768);
						SetPlayerCameraPos(playerid, 225.100143, 1199.170288, 1080.626464);
						SetPlayerCameraLookAt(playerid, 225.241561, 1194.221313, 1079.928344);
					}
					case 13: {
						SetPlayerPos(playerid, 479.4936,1411.3363,1080.2711),SetPlayerFacingAngle(playerid, 266.6024);
						SetPlayerCameraPos(playerid, 481.280029, 1411.404785, 1080.546508);
						SetPlayerCameraLookAt(playerid, 476.303466, 1411.237182, 1080.092773);
					}
					case 17: {
						SetPlayerPos(playerid, 84.5499,1331.9777,1083.8685),SetPlayerFacingAngle(playerid, 268.2159);
						SetPlayerCameraPos(playerid, 86.691093, 1331.973388, 1084.052001);
						SetPlayerCameraLookAt(playerid, 81.699554, 1331.992309, 1083.761840);
					}
					case 21: {
						SetPlayerPos(playerid, 375.1007,1410.6298,1081.3359),SetPlayerFacingAngle(playerid, 89.6376);
						SetPlayerCameraPos(playerid, 371.451049, 1410.811035, 1082.127685);
						SetPlayerCameraLookAt(playerid, 376.317077, 1410.860107, 1080.979125);
					}
					case 23: {
						SetPlayerPos(playerid, 451.1642,1403.3712,1084.3080),SetPlayerFacingAngle(playerid, 270.7197);
						SetPlayerCameraPos(playerid, 453.031585, 1403.381591, 1084.634277);
						SetPlayerCameraLookAt(playerid, 448.082611, 1403.373535, 1083.921875);
					}
					case 25: {
						SetPlayerPos(playerid, 19.9877,1407.5946,1084.4297),SetPlayerFacingAngle(playerid, 183.4934);
						SetPlayerCameraPos(playerid, 20.036220, 1405.346679, 1085.062377);
						SetPlayerCameraLookAt(playerid, 20.059158, 1410.276733, 1084.229125);
					}
					case 29: {
						SetPlayerPos(playerid,224.6453,1152.0764,1082.6168),SetPlayerFacingAngle(playerid, 271.5177);
						SetPlayerCameraPos(playerid, 227.018966, 1152.205932, 1082.665283);
						SetPlayerCameraLookAt(playerid, 222.020294, 1152.264892, 1082.566406);
					}
					case 30: {
						SetPlayerPos(playerid, 254.7773,1252.1715,1084.2578),SetPlayerFacingAngle(playerid, 8.4601);
						SetPlayerCameraPos(playerid, 254.902420, 1254.371582, 1084.794067);
						SetPlayerCameraLookAt(playerid, 254.848175, 1249.412841, 1084.155151);
					}
					case 34: {
						SetPlayerPos(playerid, 241.0360,1026.6864,1088.3125),SetPlayerFacingAngle(playerid, 98.3612);
						SetPlayerCameraPos(playerid, 238.576629, 1026.696289, 1088.502563);
						SetPlayerCameraLookAt(playerid, 243.575576, 1026.769653, 1088.431030);
					}
					case 35: {
						SetPlayerPos(playerid, 241.9666,1075.2643,1084.1875),SetPlayerFacingAngle(playerid, 181.4217);
						SetPlayerCameraPos(playerid, 242.072830, 1072.761474, 1084.784301);
						SetPlayerCameraLookAt(playerid, 241.869445, 1077.692626, 1083.983032);
					}
					case 36: {
						SetPlayerPos(playerid, 230.2193,1107.6428,1080.9922),SetPlayerFacingAngle(playerid, 95.5676);
						SetPlayerCameraPos(playerid, 233.009658, 1107.579345, 1080.970214);
						SetPlayerCameraLookAt(playerid, 233.009658, 1107.579345, 1080.970214);
					}
					default: {
						SetPlayerPos(playerid, 257.9006,-43.0044,1002.0234),SetPlayerFacingAngle(playerid, 63.0041);
						SetPlayerCameraPos(playerid, 255.957015, -40.904304, 1002.535034);
						SetPlayerCameraLookAt(playerid, 259.549407, -44.220375, 1001.486938);
					}
				}
				clearChat.playerid(20);

				gString[0] = 0;
				new lt;
				loop.sk(0 .. MAX_PLAYER_SKIN) {
					if(PlayerInfo[playerid][pSkin][sk] == -1) continue;
					PlayerInfo[playerid][pCarKey][lt++] = sk;
					format(gString, sizeof gString, "%sSkin %d\t%s\n", gString, PlayerInfo[playerid][pSkin][sk], GetSkinTypeEx(PlayerInfo[playerid][pSkin][sk]));
				}
				SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin][0]);
				ShowDialogStyleV(playerid, change_skin, "My Skin", "Skins", gString, "Apasa enter pentru a seta skinul!");
				PlayerTextDrawHide(playerid, PressTD[0]);
				PlayerTextDrawHide(playerid, PressTD[1]);
				PlayerTextDrawHide(playerid, PressTD[2]);
				posible_Action[playerid]=INVALID_ACTION;
			}
			case VENDING_MACHINE: {
				if(GetPlayerAnimationIndex(playerid) == 1660) return true;
				new Float:z, i = AreaID[PlayerAreaID[playerid]];
				GetPlayerPos(playerid, z, z, z);
				if(!PlayerToPoint(playerid, 1.5, g_VendingMachines[i][E_FX], g_VendingMachines[i][E_FY], z)) return true;
				if(GetPlayerCash(playerid) <= 0)
					return PlayerPlaySound( playerid, 1055, 0.0, 0.0, 0.0 );

				p_VendingUseTimer[playerid] = SetTimerEx("VendingMachineUsed", 2500, false, "i", playerid);
				gString[0] = EOS;	
				format(gString, 80, "* %s bought a drink from the vending machine.", GetName(playerid));
				ProxDetector(30.0, playerid, gString, COLOR_PURPLE);
				GivePlayerCash(playerid, -100);
				SetPlayerFacingAngle( playerid, g_VendingMachines[i][E_RZ]);
				SetPlayerPos(playerid, g_VendingMachines[i][E_FX], g_VendingMachines[i][E_FY], z);
				ApplyAnimation(playerid, "VENDING", "VEND_USE", 4.1, 0, 0, 1, 0, 0, 1);
				PlayerPlaySound(playerid, 42600, 0.0, 0.0, 0.0);
			}
			case ATM: ShowPlayerDialog(playerid, DIALOG_ATM, DIALOG_STYLE_LIST, "SERVER: Automated Teller Machine", "Check Balance\nWithdraw", "OK", "Cancel");
			case COMPUTER: {
				if(player_selected[playerid]!=0) return true;

				new v = PlayerVar[playerid][IsHouses];
				if(v!=0) {
					if(PlayerInfo[playerid][pHouse] != HouseInfo[v][hID] && PlayerInfo[playerid][pRentroom] != HouseInfo[v][hID])
						return SCM(playerid, COLOR_LGREEN, "Eroare: Ca sa poti folosi acest laptop trebuie sa ai chirie la aceasta casa!");
				} else if(!HaveTicket[playerid]) return SCM(playerid, COLOR_LGREEN, "Eroare: Pentru a folosi acest computer trebuie sa ai cumparat un computer ticket!");

				PlayerTextDrawHide(playerid, PressTD[0]),
				PlayerTextDrawHide(playerid, PressTD[1]),
				PlayerTextDrawHide(playerid, PressTD[2]);

				_init_computer(playerid);
			}
			case ROULETTE: {
				if(player_selected[playerid]) return true;
				for(new i=0;i<28;i++) TextDrawShowForPlayer(playerid, RoulettaTD[i]);
				SetPlayerCameraPos(playerid, 1979.555541, 1018.043823, 1003.113281);
				SetPlayerCameraLookAt(playerid, 1984.464843, 1018.104187, 1002.167053);
				UpdateRoulettaMoney(playerid);
				SelectTextDraw(playerid, COLOR_WHITE);
				Iter_Add(IsRuletta, playerid);
				player_selected[playerid] = 10;
			}
		}
		if(UsedFly[playerid]) {
			StopFly(playerid);
			UsedFly[playerid] = false;
			SetPlayerHealth(playerid, 99);
			SCM(playerid, 0xFFADADFF, "Fly mode off.");				
		}
		return true;
	}
	if(newkeys & KEY_WALK) {
		if(PlayerVar[playerid][MySpec] != -1) {
			Iter_Remove(Spectacting[PlayerVar[playerid][MySpec]], playerid);
			PlayerVar[playerid][MySpec] = -1;
			PlayerVar[playerid][preparespawn] = true;		
			TogglePlayerSpectating(playerid, false);
			TogglePlayerControllable(playerid, true);
			PlayerTextDrawHide(playerid, SpectateTD);
			SCM(playerid, COLOR_WHITE, "Nu mai esti spectator.");
		}
		return bool:true;
	}
	if(newkeys & KEY_ANALOG_DOWN) {
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
			new veh = GetPlayerVehicleID(playerid);
			GetVehicleParamsEx(veh,engine,lights,alarm,doors,bonnet,boot,objective);
			SetVehicleParamsEx(veh,engine,lights,alarm,doors,bonnet, boot != 0 ? false : true, objective);
		}
		return bool:true;
    }
   	if(newkeys & KEY_ANALOG_UP) {
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
			new veh = GetPlayerVehicleID(playerid);
			GetVehicleParamsEx(veh,engine,lights,alarm,doors,bonnet,boot,objective);
			SetVehicleParamsEx(veh,engine,lights,alarm,doors,bonnet != 0 ? false : true, boot,objective);
		}
		return bool:true;
    }
	if(newkeys & KEY_FIRE) {
		if(GetPlayerVehicleID(playerid)) {
			new Float:szX,Float:szY,Float:szZ;
			GetVehicleVelocity(GetPlayerVehicleID(playerid), szX,szY,szZ);
			printf("case %d = %.2f", GetVehicleModel(GetPlayerVehicleID(playerid)), VectorSize(szX,szY,szZ-szZ));
			return true;
		}
        if(!PlayerVar[playerid][Speeding] || GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
        	return bool:true;

		new Float:vx,Float:vy,Float:vz, vehicle = GetPlayerVehicleID(playerid);
		GetVehicleVelocity(vehicle, vx, vy, vz);
		SetVehicleVelocity(vehicle, vx * 1.8, vy * 1.8, vz * 1.8);	
		return bool:true;
    }
	if(newkeys & KEY_NO) {
		for(new i = 0; i < Sqljobs; i++) {
			if(PlayerToPoint(playerid, 2, JobInfo[i][jPos][0], JobInfo[i][jPos][1], JobInfo[i][jPos][2])) {
				if(!PlayerInfo[playerid][pJob]) return bool:true;
				
				switch(CP[playerid]) {
					case CP_FIND_PLAYER: {
						DisablePlayerCheckpoint(playerid);
						CP[playerid] = 0;
						PlayerVar[playerid][Find] = -1;
						PlayerTextDrawHide(playerid, FindPTD[0]);
						PlayerTextDrawHide(playerid, FindPTD[1]);
					}
					default: CancelJob(playerid, true);
				}
				PlayerInfo[playerid][pJob] = 0, SCM(playerid, COLOR_GREY, "You resigned from the job");
			}
		}
		LockVehicle(playerid);
		return bool:true;
	}
	if(newkeys & KEY_LOOK_BEHIND) {
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
			if(EditObjectID[playerid] == EDIT_VIPTEXT)
				return SCM(playerid, COLOR_GREY, "Nu poti porni motorul in timp ce editezi.");

			new vehid = GetPlayerVehicleID(playerid);
			if(!Fuel[vehid]) 
				return SCM(playerid, COLOR_LGREEN, "This vehicle has no fuel.");

			if(IsABike(vehid) || IsAPlane(vehid))
				return bool:true;

			new carid = FindSpawnID(vehid, false);
			if(carid != -1) {
				if(!CarInfo[carid][cPoints]) return SCM(playerid, COLOR_LGREEN, "Pay insurance on the car.");
			}

			if(GetCoolDowns(playerid, 26))
				return true;

			SetCoolDowns(playerid, 26, 3);
			GetVehicleParamsEx(vehid, engine, lights, alarm, doors, bonnet, boot, objective);
			gString[0] = EOS;
			Engine[vehid] = Engine[vehid]?false:true;
			SetVehicleParamsEx(vehid, Engine[vehid], lights, alarm, doors, bonnet, boot, objective);
			format(gString, sizeof(gString), "* %s %s the engine of his %s.", GetName(playerid), Engine[vehid] ? ("starts") : ("stops"), GetVehicleName(GetVehicleModel(vehid)));
			ProxDetector(30.0, playerid, gString, COLOR_PURPLE);
			PlayerTextDrawColor(playerid, SpeedometerPTD[playerid][2], !Engine[vehid] ? -1 : -459199745);
			PlayerTextDrawShow(playerid, SpeedometerPTD[playerid][2]);
			if(!Engine[vehid]) {
				GetVehiclePos(vehid, VehiclePos[vehid][0], VehiclePos[vehid][1], VehiclePos[vehid][2]);
				GetVehicleZAngle(vehid, VehiclePos[vehid][3]);
			}
		}
		return bool:true;
	}
	if(newkeys & KEY_YES) {
		if(PizzaCP[playerid]!=-1&&!IsPlayerInAnyVehicle(playerid)) {
			new Float:x,Float:y,Float:z;
			GetVehiclePos(PlayerVar[playerid][JobVehicle], x, y, z);
			if(PlayerToPoint(playerid, 3, x, y, z)) {
				if(gettime()<PlayerVar[playerid][CoolDown][29]) return SCM(playerid, COLOR_WHITE, "Asteapta 5 secunde.");
				new objer = GetPlayerPizza(playerid);
				if(objer) {
					if(!PlayerPizza[playerid]) {
						DestroyDynamicObject(PizzaObject[playerid][objer-1]), PizzaObject[playerid][objer-1]=-1; 
						SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
						SetPlayerAttachedObject(playerid, 2, 1582, 6, 0.0960, 0.0399, -0.1580, -112.5999, 169.4999, -168.8000, 0.7189, 0.8870, 1.0000);
						SetPlayerAttachedObject(playerid, 3, 1582, 6, 0.0939, 0.0260, -0.1430, -114.4999, -12.0000, -10.7000, 0.6920, 0.8810, 1.0000);		
						PlayerPizza[playerid] = true;
					}
					else {
						PlayerPizza[playerid] = false;
						PizzaCP[playerid] = -1;
						RemovePlayerAttachedObject(playerid, 2);
						RemovePlayerAttachedObject(playerid, 3);
						SetPlayerSpecialAction(playerid, 0);

						PizzaObject[playerid][objer-1] = CreateDynamicObject(2814, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
						switch(objer) {
							case 1: AttachDynamicObjectToVehicle(PizzaObject[playerid][objer-1], PlayerVar[playerid][JobVehicle], -0.004999, -0.924999, 0.474999, 0.000000, -5.024999, 1.005000); //Object Model: 2814 | pizza
							case 2: AttachDynamicObjectToVehicle(PizzaObject[playerid][objer-1], PlayerVar[playerid][JobVehicle], -0.004999, -0.929999, 0.559999, 0.000000, -4.019999, 0.000000); //Object Model: 2814 | pizza
							case 3: AttachDynamicObjectToVehicle(PizzaObject[playerid][objer-1], PlayerVar[playerid][JobVehicle], -0.014999, -0.939999, 0.654999, 0.000000, 0.000000, 0.000000); //Object Model: 2814 | pizza
							case 4: AttachDynamicObjectToVehicle(PizzaObject[playerid][objer-1], PlayerVar[playerid][JobVehicle], 0.000000, -0.929999, 0.729999, 0.000000, 0.000000, 0.000000); //Object Model: 2814 | pizzza 
						}
					}
				}
				Streamer_Update(playerid);
				PlayerVar[playerid][CoolDown][29]=gettime()+5;
				return true;
			}
		}
		if(RobStatus[playerid] >= 4) {
			if(!IsPlayerInAnyVehicle(playerid)) {
				new veh = GetClosestVehicle(playerid), Float: x, Float: y, Float: z;
				GetVehiclePos(veh, x, y, z);
				if !IsPlayerInRangeOfPoint(playerid, 4.0, x, y, z) *then
					return true;

				switch(RobBackpack[playerid]) {
					case true: {
						RobBackpack[playerid] = false;
						RobVehicle[playerid] = veh;
						RemovePlayerAttachedObject(playerid, 0);	
						OnePlayAnim(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0);
					}
					case false: {
						if(veh != RobVehicle[playerid]) return true;
						RobBackpack[playerid] = true;
						RobVehicle[playerid] = -1;
						SetPlayerAttachedObject(playerid, 0, 1550, 1, 0.024558, -0.279748, -0.060589, 6.105677, 137.291320, 147.132202, 1.019888, 1.000000, 1.000000);
						OnePlayAnim(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0);
					}
				}	
				return true;
			}
		}
		if(PlayerVar[playerid][HaveTrash]) {
			new veh = GetClosestVehicle(playerid), Float: x, Float: y, Float: z;
			GetVehiclePos(veh, x, y, z);

			if(!PlayerToPoint(playerid, 5, x, y, z))
				return SCM(playerid, COLOR_GREY, "Nu esti langa masina de gunoi.");
			
			RemovePlayerAttachedObject(playerid, 2);
			CheckPlayerMission(playerid, 9, PlayerVar[playerid][HaveTrash]);
			PlayerVar[playerid][Trash] = PlayerVar[playerid][Trash]+PlayerVar[playerid][HaveTrash] > 25 ? 25 : PlayerVar[playerid][Trash] + PlayerVar[playerid][HaveTrash];
			PlayerVar[playerid][HaveTrash] = 0;
			ClearString();
			format(gString, 50, "~p~garbage man job~n~~w~~h~%d/25 kg of garbage", PlayerVar[playerid][Trash]);
			PlayerTextDrawSetString(playerid, GarbagePTD, gString);
			if(PlayerVar[playerid][Trash] == 25) {
				SetPlayerRaceCheckpointEx(playerid, CP_FINISHTRASH, 1, 2570.4333,2785.0354,10.8203, 0.0, 0.0, 0.0, 5.0);
				SCM(playerid, COLOR_YELLOW, "Du-te la checkpoint-ul de pe mapa pentru a primii banii pentru munca depusa!");
				return bool:true;
			}
			SetPlayerTrasherPoint(playerid);
			new n = PlayerVar[playerid][LeftJob];
			format(gString, 160, "Du-te la punctul ~r~rosu~w~~h~ de pe mapa pentru a lua sacul de gunoi~n~(~y~%s, %.0fm~w~~h~)", GetPlayer3DZone2(TrasherPos[n][0], TrasherPos[n][1], TrasherPos[n][2]), GetPlayerDistanceFromPoint(playerid, TrasherPos[n][0], TrasherPos[n][1], TrasherPos[n][2]));
			ShowChat(playerid, 5, gString);
			return bool:true;
		}
		new x = PlayerVar[playerid][IsPickup];
		if(PickupInfo[x][pkType] == 4 && !PaintType[playerid]) {
			new i = PickupInfo[x][pkID];
			if(PlayerToPoint(playerid, 2, JobInfo[i][jPos][0], JobInfo[i][jPos][1], JobInfo[i][jPos][2])) {
				if(PlayerInfo[playerid][pJob] != 0)
					return SCM(playerid, COLOR_GREY, "Ai deja un job.");

				if(IsPlayerInAnyVehicle(playerid))
					return bool:true;

				PlayerInfo[playerid][pJob] = JobInfo[i][jID];
				UpdateVar(playerid, "Job", PlayerInfo[playerid][pJob]);

				gString[0] = EOS;
				format(gString, sizeof(gString), "Congratulations! you took your job %s, for more details [/help > jobs]", JobInfo[i][jName]);
				SCM(playerid, COLOR_WHITE, gString);

				if(PlayerInfo[playerid][pTut] == 3) {
					PlayerInfo[playerid][pTut]++;
					UpdateVar(playerid, "Tutorial", PlayerInfo[playerid][pTut]);
					ShowPlayerTutorial(playerid);
				}
				return bool:true;
			}
		}
		new b = PlayerVar[playerid][IsBizz];
		if(b != 0 && !player_selected[playerid]) {
			switch(BizzInfo[b][bType]) {
				case 2: {
					if(PlayerToPoint(playerid, 3, 295.6810,-80.7407,1001.5156)) {
						if(PlayerInfo[playerid][pWeaponLicense] < gettime())
							return SCM(playerid, COLOR_GREY, "Nu ai licenta de arme.");

						if(player_selected[playerid] != 0)
							return bool:true;

						SetPlayerCameraPos(playerid, 290.340515, -83.236206, 1003.525146);
						SetPlayerCameraLookAt(playerid, 294.081420, -83.313301, 1000.208557);
						PlayerTextDrawShow(playerid, GunPTD);
						for(new i = 0; i < 5; i++) TextDrawShowForPlayer(playerid, GunTD[i]);
						SelectTextDraw(playerid, 0xFF0000FF);
						PlayerVar[playerid][IsStoreGun] = 0;
						PlayerVar[playerid][LastStoreGun] = 0;
						player_selected[playerid] = 6;
						MovePlayerObject(playerid, StoreGun[playerid][0], GunPosNew[0][0], GunPosNew[0][1], GunPosNew[0][2], 5.0, GunPosNew[0][3], GunPosNew[0][4], GunPosNew[0][5]);
						return true;
					}
				}
				case 6: if(PlayerToPoint(playerid, 3, 204.6770,-159.3505,1000.5234)) {
					if(GetPlayerWantedLevel(playerid)) return true;
					if(player_selected[playerid]) return true;
					InterpolateCameraPos(playerid, 204.520172, -162.638092, 1002.873046, 201.356918, -161.173187, 1001.570556, 2000);
					InterpolateCameraLookAt(playerid, 204.360534, -158.386550, 1000.246459, 197.872940, -157.869186, 1000.175781, 2100);
					skinSlot[playerid]=0;
					SetPlayerSkin(playerid, skins[0]);
					SetPlayerPos(playerid, 199.4116,-158.6782,1000.5234);
					SetPlayerFacingAngle(playerid, 228.7157);
					SetPlayerVirtualWorld(playerid, playerid + 100);
					SetTimerEx(#load_skin_system, 2000, false, #i, playerid);
					return true;
				}
				case 15: if(PlayerToPoint(playerid, 5.0,497.9880,-77.4615,998.7651)) return ShowPlayerDialog(playerid, DIALOG_BUYTICKET, DIALOG_STYLE_MSGBOX, "Buy Computer Ticket", "Esti sigur ca vrei sa cumperi un cumputer ticket?\nAcest costa $2.500 si este disponibil pana la iesirea din business.", "Buy", "Cancel");
			}
		}
		int_phone(playerid);
		//inventory.Show(playerid);
	}
	if(newkeys == KEY_CTRL_BACK && oldkeys == 0) {
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
			new szDialog2[1024];
			gString[0] = EOS;
			strcat(szDialog2, "Nume\tAscultatori\n");
			for(new i = 0; i < sizeof(RadioNames); i++) {
				if(i == 0) format(gString, sizeof(gString), "%s\n", RadioNames[i]);
				else format(gString, sizeof(gString), "%s\t%d\n", RadioNames[i], ListenThisRadio(i));
				strcat(szDialog2, gString);
			}
			ShowPlayerDialog(playerid, DIALOG_CARRADIO, DIALOG_STYLE_TABLIST_HEADERS, "Car Radio:", szDialog2, "Select", "Close");
    	} 
    	return bool:true;
    }
	if(newkeys & KEY_ACTION && oldkeys != 8) {
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
			new veh = GetPlayerVehicleID(playerid);
			Lights[veh] = Lights[veh] ? false : true;
			PlayerTextDrawColor(playerid, SpeedometerPTD[playerid][3], !Lights[veh] ? -1 : -459199745), PlayerTextDrawShow(playerid, SpeedometerPTD[playerid][3]);
			GetVehicleParamsEx(veh,engine,lights,alarm,doors,bonnet,boot,objective);
			SetVehicleParamsEx(veh,engine,Lights[veh],alarm,doors,bonnet,boot,objective);
		}
		return bool:true;
    }
    return bool:true;
}

redist::check_username(playerid, const new_username[], bool:pp) {
	if cache_num_rows() *then
		return pp?SCM(playerid, COLOR_GREY, "Acest nume este deja luat."):ShowPlayerDialog(playerid, DIALOG_FNAME, DIALOG_STYLE_INPUT, "Forcename:", "Acest nume este deja luat\nPune numele in casuta de mai jos!", "Done", "");

	if(pp) {
		PlayerInfo[playerid][pPremiumPoints] -= 150, UpdateVar(playerid, "PremiumPoints", PlayerInfo[playerid][pPremiumPoints]);
		SCMf(playerid, COLOR_MONEY, "(SHOP) {FFFFFF}Ti-ai schimbat numele in %s pentru suma de 150 puncte premium.", new_username);
	} else {
		SCMf(playerid, COLOR_MONEY, "(Forcename) {FFFFFF}Ti-ai schimbat numele in %s", new_username);
		format(gString, sizeof gString, "(Forcename) {FFFFFF}%s si-a schimbat numele in %s.", PlayerInfo[playerid][pName], new_username);
		SendAdminMessage(COLOR_GM, gString, 1);
	}
	_query(128, "UPDATE `users` SET `name` = '%e' WHERE `id` = '%i'", new_username, PlayerInfo[playerid][pSQLID]);
	_query(128, "UPDATE `cars` SET `Owner`='%e' WHERE `Userid` = '%i'", new_username, PlayerInfo[playerid][pSQLID]);
	if(PlayerInfo[playerid][pHouse] != -1) _query(128, "UPDATE `houses` SET `Owner`='%e' WHERE `Userid`='%d'", new_username, PlayerInfo[playerid][pSQLID]);
	if(PlayerInfo[playerid][pBussines] != -1) _query(128, "UPDATE `bussines` SET `Owner`='%e' WHERE `Userid`='%d'", new_username, PlayerInfo[playerid][pSQLID]);
	_query(128, "UPDATE `friends` SET `Name`='%e' WHERE `Name`='%e'", new_username, PlayerInfo[playerid][pName]);
	_query(128,  "UPDATE `friends` SET `ByName`='%e' WHERE `ByName`='%e'", new_username, PlayerInfo[playerid][pName]);

	strmid(PlayerInfo[playerid][pName], new_username, 0, MAX_PLAYER_NAME);
	PlayerTextDrawSetString(playerid, PlayerLogo, PlayerInfo[playerid][pName]);
	SetPlayerName(playerid, new_username);
	return true;
}

redist::load_skin_system(playerid) {
	for(new i=0;i<11;++i) TextDrawShowForPlayer(playerid, SkinShopTD[i]);
	PlayerTextDrawColor(playerid, SkinPTD[0], getSkinColors(skins[skinSlot[playerid]]));
	if(getSkinValue(skins[skinSlot[playerid]]) > 0)	format(gString, sizeof gString, "%s - ~g~~h~$%s", GetSkinType(skins[skinSlot[playerid]]), FormatNumber(getSkinValue(skins[skinSlot[playerid]])));
	else format(gString, sizeof gString, "%s - ~y~~h~%d PP", GetSkinType(skins[skinSlot[playerid]]), -getSkinValue(skins[skinSlot[playerid]]));
	PlayerTextDrawSetString(playerid, SkinPTD[1], gString);
	PlayerTextDrawShow(playerid, SkinPTD[0]);
	PlayerTextDrawShow(playerid, SkinPTD[1]);
	player_selected[playerid] = 21;
	SelectTextDraw(playerid, 0xFF000050);
	SetPlayerCameraPos(playerid, 201.356918, -161.173187, 1001.570556);
	SetPlayerCameraLookAt(playerid, 197.872940, -157.869186, 1000.175781);
	return true;
}

public OnPlayerSprayPNS(playerid, vehicleid) {
	foreach(new id : BizzType[10]) {
		SCMf(playerid, -1, "debug: %d", id);
		if !IsPlayerInRangeOfPoint(playerid, 20.0, BizzInfo[id][bEnterPos][0], BizzInfo[id][bEnterPos][1], BizzInfo[id][bEnterPos][2]) *then continue;
		SCMf(playerid, -1, "debug 2: %d", id);
		GivePlayerCash(playerid, -BizzInfo[id][bFee]);
		BizzInfo[id][bBalance] += BizzInfo[id][bFee];
		ChangeVehicleColor(vehicleid, VehicleInfo[vehicleid][vColor][0], VehicleInfo[vehicleid][vColor][1]);
		CheckPlayerMission(playerid, 14, 1);
		CheckPlayerMission(playerid, 15, 1);
		break;
	}
	if(pnsDeelay[playerid] > gettime()) return true;
	checkBP(playerid, 13, 100);
	pnsDeelay[playerid] = gettime()+300;
	return true;
}

public OnVehicleSpawn(vehicleid) {
	#if defined gm_debug
		printf("vehicle id %d: callback OnVehicleSpawn", vehicleid);
	#endif
	GetVehiclePos(vehicleid, VehiclePos[vehicleid][0], VehiclePos[vehicleid][1], VehiclePos[vehicleid][2]);
	GetVehicleZAngle(vehicleid, VehiclePos[vehicleid][3]);
	if(Iter_Contains(VehicleSpawned, vehicleid)) return DestroyVehicleEx(vehicleid), Iter_Remove(VehicleSpawned, vehicleid), 1;
	new engine, lights, alarm, doors, bonnet, boot, objective;
	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	Engine[vehicleid] = IsABike(vehicleid)?true:false;
	SetVehicleParamsEx(vehicleid, Engine[vehicleid], VEHICLE_PARAMS_OFF, alarm, doors, bonnet, boot, objective);
	ChangeVehicleColor(vehicleid, VehicleInfo[vehicleid][vColor][0], VehicleInfo[vehicleid][vColor][1]);

	new idd = FindSpawnID(vehicleid, false);
	if(idd != -1) SetTunning(idd);
	else Fuel[vehicleid] = 100;
	return bool:true;
}

ChangeVehicleColorEx(vehicleid, color1, color2) {
	ChangeVehicleColor(vehicleid, color1, color2);
	VehicleInfo[vehicleid][vColor][0] = color1;
	VehicleInfo[vehicleid][vColor][1] = color2;
	return true;
}

#if defined _ALS_ChangeVehicleColor
    #undef ChangeVehicleColor
#else
    #define _ALS_ChangeVehicleColor
#endif
#define ChangeVehicleColor ChangeVehicleColorEx

public OnPlayerStreamIn(playerid, forplayerid) {
	if(PlayerVar[playerid][Undercover]) ShowPlayerNameTagForPlayer(forplayerid, playerid, 0);
	if(PaintType[playerid] == PaintType[forplayerid] && PaintType[playerid] != 0 ) {
		SetPlayerMarkerForPlayer(playerid, forplayerid, COLOR_LIGHTRED);
		SetPlayerMarkerForPlayer(forplayerid, playerid, COLOR_LIGHTRED);
	}
	else if(IsCop(playerid) && PlayerVar[playerid][Duty] && PlayerInfo[forplayerid][pWanted] != 0) SetPlayerMarkerForPlayer(playerid, forplayerid, 0xe3336d00);
	else if(InWar[PlayerInfo[playerid][pMember]] != -1) {
		if(InWar[PlayerInfo[playerid][pMember]] == InWar[PlayerInfo[forplayerid][pMember]]) {
			SetPlayerMarkerForPlayer(playerid, forplayerid, GetPlayerColor(forplayerid));
			SetPlayerMarkerForPlayer(forplayerid, playerid, GetPlayerColor(playerid));
		}
		else {
			SetPlayerMarkerForPlayer(playerid, forplayerid, (GetPlayerColor(forplayerid) & 0xFFFFFF00));
			SetPlayerMarkerForPlayer(forplayerid, playerid, (GetPlayerColor(playerid) & 0xFFFFFF00));
		}
	}
	else {
		SetPlayerMarkerForPlayer(playerid, forplayerid, (GetPlayerColor(forplayerid) & 0xFFFFFF00));
		SetPlayerMarkerForPlayer(forplayerid, playerid, (GetPlayerColor(playerid) & 0xFFFFFF00));
	}
	return bool:true;
}
public OnPlayerStreamOut(playerid, forplayerid) {
	if(PlayerVar[playerid][Undercover]) ShowPlayerNameTagForPlayer(forplayerid, playerid, 0);
    SetPlayerMarkerForPlayer(playerid, forplayerid, (GetPlayerColor(forplayerid) & 0xFFFFFF00));
	SetPlayerMarkerForPlayer(forplayerid, playerid, (GetPlayerColor(playerid) & 0xFFFFFF00));
	return bool:true;
}
public OnPlayerPickUpPickup(playerid, pickupid) {
	#if defined gm_debug
		SCMf(playerid, COLOR_YELLOW, "callback OnPlayerPickUpPickup %d", pickupid);
	#endif
    PlayerVar[playerid][IsPickup] = pickupid;
    if(PickupInfo[pickupid][pkType] != 69)
        return bool:true;
    
    switch(PickupInfo[pickupid][pkID]) {
        case 100: {
        	new Float: health;
	        GetPlayerHealth(playerid, health);
	        if(health > 75)
	            return SCM(playerid, COLOR_WHITE, "You health a bout fully");
	            
	        SetPlayerHealth(playerid, health + 25);
	        SCM(playerid, COLOR_WHITE, "You have got health");
	        DestroyDropPickip(pickupid);
    	} 
    	case 1212: GivePlayerCash(playerid, RandomEx(1000, 5000)), DestroyDropPickip(pickupid);
    	default: {
	        GivePlayerWeapon(playerid, PickupInfo[pickupid][pkID], PickupInfo[pickupid][pkValue]);
	        gString[0] = EOS;
	        GetWeaponName(PickupInfo[pickupid][pkID], gString, 30);
	        format(gString, 100, "You have got a %s with %d ammo", gString, PickupInfo[pickupid][pkValue]);
	        SCM(playerid, COLOR_WHITE, gString);
	        DestroyDropPickip(pickupid);
	    }
	}
    return bool:true;
}

DestroyDropPickip(i) {
    PickupInfo[i][pkType] = 0;
    PickupInfo[i][pkID] = 0;
    PickupInfo[i][pkValue] = 0;
   	PickupInfo[i][pkWar] = 0;
    DestroyPickup(i);
}

public OnPlayerDisconnect(playerid, reason) {
	foreach(new i : _Player<ADMIN>) if(PlayerInfo[i][pTog][8]) SendDeathMessageToPlayer(i, INVALID_PLAYER_ID, playerid, 201);
	SetGVarInt(playerIP[playerid], GetGVarInt(playerIP[playerid])-1);
	if GetGVarInt(GetIPP(playerid)) < 1 *then DeleteSVar(playerIP[playerid]);
	if(Iter_Contains(s_Players, playerid)) Iter_Remove(s_Players, playerid);
	if(IsPlayerLogged(playerid)) {
		foreach(new i : Factions<9>) if(PlayerVar[playerid][HaveContract] == playerid) {
			Iter_Add(Calls[8], playerid);
			SCM(i, COLOR_YELLOW, "Contract-ul tau a fost anulat. Tinta s-a desconectat!");
			PlayerVar[i][Find] = -1;
			PlayerTextDrawHide(i, FindPTD[0]);
			PlayerTextDrawHide(i, FindPTD[1]);
			DisablePlayerCheckpoint(i);
			CP[i] = DISABLE_CHECKPOINT;
			PlayerVar[i][Find] = -1;
			break;
		}
		save_bp(playerid);
		Iter_Clear(player_in_blocks[playerid]);
		if(PlayerInfo[playerid][pWanted] != 0) {
			ClearString();
			foreach(new i : StreamedPlayer[playerid]) {
				if(IsCop(i) && CrimInRange(75.0, playerid, i) && PlayerVar[i][Duty]) {
					GameTextForPlayer(i, "running suspect bonus!", 3000, 1);
					GivePlayerCash(i, PlayerInfo[playerid][pWanted] * 500);		
					AddFactionRaport(i, 0, 1);
					format(gString, 100, "Ai primit $%d bonus pentru prinderea suspectului %s.", PlayerInfo[playerid][pWanted] * 500, GetName(playerid));
					SCM(i, COLOR_PURPLE, gString);
					format(gString, 100, "%s arrested suspect %s, issuing a fine of $%d with a sentance of %d seconds.", GetName(i), GetName(playerid), PlayerInfo[playerid][pWanted] * 500, PlayerInfo[playerid][pWanted] * 300);
					SCMTA(COLOR_RED, gString);
					format(gString, 100, "* %s is now in jail thanks to: %s", GetName(playerid), GetName(i));
					ProxDetector(20.0, i, gString, COLOR_PURPLE);
					SetPlayerJail(playerid);
					Iter_Remove(Calls[9], playerid);
					break;
				}
			}
		}

		gString[0] = EOS;
		UpdateMoney(playerid);
		gQuery[0] = EOS;
		new year, month, day, hour, minute, second;
		getdate(year, month, day);
		gettime(hour, minute, second);
		format(gString, 50, "%02d.%02d.%d %02d:%02d", day, month, year, hour, minute);
		mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `users` SET `Admin` = '%i', `PremiumPoints` = '%i', `Status` = '-1', `Credit` = '%i', `Experience` = '%i', `Mute` = '%i', `Jail` = '%i', `Wanted` = '%i', `ServerPoints` = '%i', `JobGoal` = '%i', `Connected` = '%i', `laston` = '%e' WHERE `id` = '%i'",
			PlayerInfo[playerid][pAdmin], PlayerInfo[playerid][pPremiumPoints], PlayerInfo[playerid][pCredit], PlayerInfo[playerid][pExperience], PlayerInfo[playerid][pMute], PlayerInfo[playerid][pJail], 
			PlayerInfo[playerid][pWanted], PlayerInfo[playerid][pServerPoints], PlayerInfo[playerid][pJobGoal], PlayerInfo[playerid][pConnected], gString, PlayerInfo[playerid][pSQLID]);
		mysql_tquery(SQL, gQuery);

		mysql_format(SQL, gQuery, 128, "UPDATE `friends` SET `Status` = '-1' WHERE `Userid` = '%i'", PlayerInfo[playerid][pSQLID]);
		mysql_tquery(SQL, gQuery);
		mysql_format(SQL, gQuery, 128, "UPDATE `friends` SET `ByStatus` = '-1' WHERE `AddBy` = '%i'", PlayerInfo[playerid][pSQLID]);
		mysql_tquery(SQL, gQuery);
		foreach(new idd : MyVehicles<playerid>) {
			if(CarInfo[idd][cSpawned]) DestroyPlayerCar(idd);
			mysql_format(SQL, gQuery, 100, "UPDATE `cars` SET `idd` = '%d' WHERE `ID` = '%d'", CarInfo[idd][cSpawned], CarInfo[idd][cID]);
			mysql_tquery(SQL, gQuery);
			CarInfo[idd][cOnline] = -1;
			VehicleAcces[CarInfo[idd][cSpawned]] = -1;
			Iter_Remove(VehicleKeys[CarInfo[idd][cSpawned]], playerid);
		}
		if(Iter_Contains(computer_players<PC_TYPE_HOURSBET>, playerid)) Iter_Remove(computer_players<PC_TYPE_HOURSBET>, playerid);
		Iter_Clear(MyVehicles<playerid>);
		Iter_Clear(PlayerKeys[playerid]);
		switch(reason) {
			case 0: format(gString, sizeof(gString), "%s has disconnected from the server. (timeout).", GetName(playerid));
			case 1: format(gString, sizeof(gString), "%s has disconnected from the server. (leaving).", GetName(playerid));
			case 2: format(gString, sizeof(gString), "%s has disconnected from the server. (Kicked).", GetName(playerid));
		}
		ProxDetector(20.0, playerid, gString, COLOR_SERVER);
		PhoneFinder[PlayerInfo[playerid][pPhone]] = -1;
		if(Iter_Contains(HelpsDuty, playerid)) Iter_Remove(HelpsDuty, playerid);
		if(PlayerVar[playerid][IsExam]) CancelExam(playerid);
		if(PlayerInfo[playerid][pFreq] != 0) Iter_Remove(Freqs[PlayerInfo[playerid][pFreq] - 1], playerid);
		if(PlayerVar[playerid][FactionVehicle] != INVALID_VEHICLE_ID) FDespawnVehicle(playerid);
		if(LastVehicle[playerid] != 0) Iter_Remove(PlayerInVehicle[LastVehicle[playerid]], playerid);
		if(Iter_Contains(IsRuletta, playerid)) Iter_Remove(IsRuletta, playerid);
		for(new i=0;i<MAX_FACTIONS;i++) if(Iter_Contains(Calls[i], playerid)) Iter_Remove(Calls[i], playerid);
		for(new i = 0; i < 7; i++) DestroyPlayerObject(playerid, StoreGun[playerid][i]);
		if(PlayerVar[playerid][RentVehicle] != 0) DestroyRentCar(playerid);
		if(PlayerInfo[playerid][pMember] != 0) {
			format(gString, 125, "(Faction) {FFFFFF}%s has been disconnected from the server (%s).", PlayerInfo[playerid][pName], reason == 2 ? ("Kicked/Banned") : reason == 1 ? ("leaving") : ("timeout"));
			SendTeamMessage(PlayerInfo[playerid][pMember], COLOR_SERVER, gString);
			if(Iter_Contains(Factions<PlayerInfo[playerid][pMember]>, playerid)) Iter_Remove(Factions<PlayerInfo[playerid][pMember]>, playerid);
		}
		if(CallType[playerid]!=-1) {
			new i = CallType[playerid], id = CallServiceAccept[playerid][i];
			CallServiceAccept[playerid][i] = -1;
			PlayerVar[id][HaveCalls] = -1;
			CallService[playerid][i] = false;
			CallType[playerid] = -1;

			SCM(id, COLOR_YELLOW, "Playerul care aveai commanda s-a desconnectat.");
		}
		if(PlayerVar[playerid][MySpec] != -1) {
			if(Iter_Contains(Spectacting[PlayerVar[playerid][MySpec]], playerid)) Iter_Remove(Spectacting[PlayerVar[playerid][MySpec]], playerid);
		}
		if(PaintType[playerid] != 0 && PaintType[playerid] != 69) {
			format(gString, 100, "%s has left the paintball arena.", GetName(playerid));
			SendPaintMessage(PaintType[playerid], COLOR_LIGHTGOLD, gString);
			if(Iter_Contains(PlayerPaint[PaintType[playerid] - 1], playerid)) Iter_Remove(PlayerPaint[PaintType[playerid] - 1], playerid);
			PaintType[playerid] = 0;
		}
		if(PlayerInfo[playerid][pPetStatus]) RemovePlayerPet(playerid);
		if(Iter_Count(Spectacting[playerid])) {
			foreach(new i : Spectacting[playerid]) {
				PlayerVar[i][MySpec] = -1;
				PlayerVar[i][preparespawn] = true;
				TogglePlayerSpectating(i, false);
				TogglePlayerControllable(i, true);
				PlayerTextDrawHide(i, SpectateTD);
				SCM(i, COLOR_WHITE, "Acel player s-a desconnectat.");
			}
			Iter_Clear(Spectacting[playerid]);
		}
		if(PlayerVar[playerid][IsTrade] != -1) {
			new id = PlayerVar[playerid][IsTrade];
			format(gString, 100, "* %s s-a deconectat. Afacere anulata!", GetName(playerid));
			SCM(playerid, COLOR_LIGHTGOLD, gString);
			SCM(id, COLOR_LIGHTGOLD, gString);
			CancelSelectTextDraw(playerid);
			CancelSelectTextDraw(id);
			HideTradeItems(playerid);
			HideTradeTDs(id);
		}
		for(new r = 1; r < 3; r++) if(Iter_Contains(Rainbows[r], playerid)) Iter_Remove(Rainbows[r], playerid);
		if(Iter_Contains(Bigears, playerid)) Iter_Remove(Bigears, playerid);
		if(PlayerVar[playerid][fSpec] != 0) Iter_Remove(Factions<PlayerVar[playerid][fSpec]>, playerid);
		if(GetClan[PlayerInfo[playerid][pClan]] != -1) {
			if(PlayerInfo[playerid][pClanTag] > 1) SetPlayerName(playerid, PlayerInfo[playerid][pName]);
			Iter_Remove(Clans[GetClan[PlayerInfo[playerid][pClan]]], playerid);
			format(gString, 100, "(Clan) {FFFFFF}%s from your clan left the server.", GetName(playerid));
			SendClanMessage(playerid, COLOR_SERVER, gString);
		}
		DestroyPlayerProgressBar(playerid, PlayerVar[playerid][HudProgress][0]);
		DestroyPlayerProgressBar(playerid, PlayerVar[playerid][HudProgress][1]);
		if(PlayerVar[playerid][JobWork]) {
			if(PlayerInfo[playerid][pJob]==3) {
				for(new h=0;h<4;h++) {
					PizzaHouse[playerid][h] = 0;
					if(PizzaObject[playerid][h]!=-1) DestroyDynamicObject(PizzaObject[playerid][h]), PizzaObject[playerid][h] = -1;
					RemovePlayerMapIcon(playerid, h+60);
				}
			}
			if(PlayerVar[playerid][JobVehicle] != INVALID_VEHICLE_ID) DestroyVehicle(PlayerVar[playerid][JobVehicle]);
		}
		save_jobskillpoints(playerid);
		for(new i=0;i<3;++i) if(Iter_Contains(_Player<i>, playerid)) Iter_Remove(_Player<i>, playerid);
		if(Iter_Contains(PlayerVIP, playerid)) Iter_Remove(PlayerVIP, playerid);
		if(Iter_Contains(PlayerPremium, playerid)) Iter_Remove(PlayerPremium, playerid);
		if(PlayerVar[playerid][IsPhone] != -1) {
			SCM(PlayerVar[playerid][IsPhone], COLOR_YELLOW, "Apel intrerupt...");
			PlayerVar[PlayerVar[playerid][IsPhone]][IsPhone] = -1;
			SetPlayerSpecialAction(PlayerVar[playerid][IsPhone], SPECIAL_ACTION_STOPUSECELLPHONE);

			PlayerVar[PlayerVar[playerid][IsPhone]][IsCell] = false;
			PlayerVar[playerid][IsCell] = false;
			RemovePlayerAttachedObject(PlayerVar[playerid][IsPhone], 4);
			RemovePlayerAttachedObject(playerid, 4);
			PlayerVar[playerid][IsPhone] = -1;
		}
		if(PlayerInfo[playerid][pVip]) Delete3DTextLabel(VIPLabel[playerid]);
		PlayerVar[playerid][IsLogged] = false;
		if(Iter_Contains(Newbie, playerid)) Iter_Remove(Newbie, playerid);
		if(PlayerVar[playerid][MyHelp] != -1) {
			format(gString, 100, "%s s-a desconnectat in timp ce era intrebarea la %s.", GetName(playerid), GetName(PlayerVar[playerid][MyHelp]));
			SendAdminHelperMessage(COLOR_LOGS, gString);
			PlayerVar[PlayerVar[playerid][MyHelp]][HaveHelp] = -1;
			PlayerVar[playerid][MyHelp] = -1;
		}
		if(Iter_Contains(Reports[0], playerid)) Iter_Remove(Reports[0], playerid);
		if(Iter_Contains(Reports[1], playerid)) Iter_Remove(Reports[1], playerid);
	}
	ResetPlayerVendingMachineData( playerid );
	if(Iter_Contains(LoginQueue[1], playerid)) Iter_Remove(LoginQueue[1], playerid);
	if(Iter_Contains(LoginQueue[0], playerid)) Iter_Remove(LoginQueue[0], playerid);
	return bool:true;
}

public OnPlayerSpawn(playerid) {
	#if defined gm_debug
		SCM(playerid, COLOR_YELLOW, "callback OnPlayerSpawn");
	#endif
	if(player_selected[playerid] == 16) {
		SetPlayerPos(playerid, 1043.7085,10.2280,1001.2845);
		SetPlayerFacingAngle(playerid, 94.5649);
		return true;
	}
	if(!IsPlayerLogged(playerid)) {
		SCM(playerid, COLOR_RED, "You are not logged.");
		KickEx(playerid);
		return bool:true;
	}
	if PlayerInfo[playerid][pAttached][0] == 20 *then {
		SetPlayerAttachedObject(playerid, 1, 3003, 2, 0.0519, 0.0220, 0.0000, 0.0000, 0.0000, 0.0000, 3.8810, 3.9610, 3.4450);
		SetPlayerAttachedObject(playerid, 2, 3003, 2, 0.2379, 0.0350, -0.0779, 0.0000, 8.5999, 0.0000, 3.7459, 1.0000, 1.0000);
		SetPlayerAttachedObject(playerid, 3, 3003, 2, 0.2149, 0.0000, 0.1019, 0.0000, -11.8000, 0.0000, 4.0240, 1.0000, 1.0000);
		SetPlayerAttachedObject(playerid, 4, 3106, 2, 0.0919, 0.1229, 0.0539, 0.0000, 0.0000, 0.0000, 0.9120, 1.0000, 0.6990);
		SetPlayerAttachedObject(playerid, 5, 3106, 2, 0.1019, 0.1259, -0.0410, 0.0000, 0.0000, 0.0000, 0.9070, 1.0000, 0.7219);
	}
	ResetPlayerWeapons(playerid);
	if(!PlayerVar[playerid][Acover]) SetPlayerSkin(playerid, InWar[PlayerInfo[playerid][pMember]] != -1 ? FactionInfo_[PlayerInfo[playerid][pMember] - 1][fSkin][PlayerInfo[playerid][pRank] - 1] : PlayerInfo[playerid][pModel]);
	else {
		SCM(playerid, COLOR_YELLOW, "Esti acover.");
		SetPlayerSkin(playerid, random(300));
	}
	if(PlayerVar[playerid][Duty]) {
		if(IsCop(playerid)) {
			GivePlayerWeapon(playerid, 24, 500);
			GivePlayerWeapon(playerid, 31, 500);
			GivePlayerWeapon(playerid, 3, 1);
			GivePlayerWeapon(playerid, 29, 500);
			SetPlayerArmour(playerid, 99);
		}
		SetPlayerSkin(playerid, FactionInfo_[PlayerInfo[playerid][pMember] - 1][fSkin][PlayerInfo[playerid][pRank] - 1]);
	}
	if(PlayerVar[playerid][Undercover]) {
		PlayerVar[playerid][Undercover] = false;
		SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
		SCM(playerid, COLOR_WHITE, "Nu mai undercover.");
	}
	SetPlayerDrunkLevel(playerid, 2000);
	SetPlayerWorldBounds(playerid, 20000.0000, -20000.0000, 20000.0000, -20000.0000);
	PlayerVar[playerid][Death] = false;
	PlayerVar[playerid][IsFaction] = -1;
	PlayerVar[playerid][IsBizz] = 0;
	PlayerVar[playerid][IsHouses] = 0;
	PlayerVar[playerid][FakeWarning] = -1;
	StopAudioStreamForPlayer(playerid);
	if(PlayerVar[playerid][JobWork]) CancelJob(playerid, false);
	TogglePlayerControllable(playerid, true);
	SetPlayerVirtualWorld(playerid, 0);
	if(PlayerInfo[playerid][pPetStatus]) attachplayerpet(playerid);
	if(RobStatus[playerid] != 0) {
		SCM(playerid, COLOR_RED, "Fail rob!");
		RobVehicle[playerid] = INVALID_VEHICLE_ID;
		if(RobBackpack[playerid]) RemovePlayerAttachedObject(playerid, 0);
		RobBackpack[playerid] = false;
		RobStatus[playerid] = 0;
		RobTimer[playerid] = 0;
	}
	SetTeamColor(playerid);
	if(PaintType[playerid] == 69) {
		SetPlayerPos(playerid, 3059.7332,-36.8151,8.6923);
		SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld(playerid, 0);
		SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
		PlayerTextDrawHide(playerid, PaintTD);
		PaintType[playerid] = 0;
		return bool:true;
	}
	if(PaintType[playerid] != 0) return PaintSpawn(playerid);
	SetPlayerSpawn(playerid);
	SetPlayerLevelEx(playerid);
	PlayerVar[playerid][FishTimer] = 0;
	if(PlayerVar[playerid][Fish][0] != 0) PlayerVar[playerid][Fish][0] = 0, PlayerVar[playerid][Fish][1] = 0, SCM(playerid, COLOR_GREY, "Ai perdut pestele.");
	return bool:true;
}

public OnPlayerStateChange(playerid, newstate, oldstate) {
	#if defined gm_debug
		SCMf(playerid, COLOR_YELLOW, "new state %d oldstate %d", newstate, oldstate);
		printf("%s: callback OnPlayerStateChange %d %d", GetName(playerid), newstate, oldstate);
	#endif
	ResetPlayerVendingMachineData( playerid );
	if(!IsPlayerLogged(playerid)) return bool:true;
	new vehicleid = GetPlayerVehicleID(playerid), oldvehicle = LastVehicle[playerid];
	switch(oldstate) {
		case PLAYER_STATE_DRIVER: {
			GetVehiclePos(oldvehicle, VehiclePos[oldvehicle][0], VehiclePos[oldvehicle][1], VehiclePos[oldvehicle][2]);
			GetVehicleZAngle(oldvehicle, VehiclePos[oldvehicle][3]);
			if(ServerVehicle[LastCar[playerid]][vFaction] == 5) {
				PlayerTextDrawHide(playerid, TaxiPTD);
				if(PlayerVar[playerid][Duty]) {
					gString[0] = EOS;
					GivePlayerCash(playerid, PlayerVar[playerid][TaxiTotal]);
					format(gString, 100, "Ai iest din vehicul si ai primit $%s.", FormatNumber(PlayerVar[playerid][TaxiTotal]));
					SCM(playerid, COLOR_WHITE, gString);
					PlayerVar[playerid][TaxiTotal] = 0;
					PlayerVar[playerid][TaxiAmount] = 0;
					PlayerVar[playerid][TaxiDuty] = false;
					foreach(new i : PlayerInVehicle[LastCar[playerid]]) PlayerTextDrawHide(i, TaxiPTD), PlayerVar[i][IsTaxi] = -1;
				}
			}
			Iter_Remove(PlayerInVehicle[oldvehicle], playerid);
			LastVehicle[playerid] = 0;
			if(vehicleid == PlayerVar[playerid][FactionVehicle]) PlayerVar[playerid][TimerCheckSpawns] = 7;
			new carid = FindSpawnID(oldvehicle, false);
			hideSpeedomter(playerid);
			new engine, lights, alarm, doors, bonnet, boot, objective;
			GetVehicleParamsEx(oldvehicle, engine, lights, alarm, doors, bonnet, boot, objective);
			Engine[oldvehicle] = (IsABike(oldvehicle)?true:false);
			SetVehicleParamsEx(oldvehicle, Engine[oldvehicle], lights, alarm, doors, bonnet, boot, objective);
			LastSpeed[playerid] = 0;
			if(carid != -1) {
				SetPlayerCarTime(carid);
				GetVehiclePos(vehicleid, CarInfo[carid][cLastPos][0], CarInfo[carid][cLastPos][1], CarInfo[carid][cLastPos][2]);
				GetVehicleZAngle(vehicleid, CarInfo[carid][cLastPos][3]);
				if(PlayerRainbow[playerid] != 0) {
					if(Iter_Contains(Rainbows[PlayerRainbow[playerid]], playerid)) Iter_Remove(Rainbows[PlayerRainbow[playerid]], playerid);
					ChangeVehicleColor(VehicleRainbow[playerid], CarInfo[carid][cColor][0], CarInfo[carid][cColor][1]);
					PlayerRainbow[playerid] = false;
					VehicleRainbow[playerid] = false;
				}
			}
			if(Helmet[playerid]) {
				gString[0] = EOS;
				Helmet[playerid] = false;
				format(gString, 100, "* %s si-a scos casca de pe cap.", GetName(playerid));
				ProxDetector(30.0, playerid, gString, COLOR_PURPLE);
				RemovePlayerAttachedObject(playerid, 3);
			}
			if(CarRadio[oldvehicle] != 0) StopAudioStreamForPlayer(playerid), PlayerVar[playerid][Radio] = 0;
			if(ServerVehicle[oldvehicle][vFaction] == 10 && NewLive[playerid] != -1) return EndLive(playerid);
			if(PlayerVar[playerid][IsExam]) {
				SCM(playerid, COLOR_GREY, "Ai picat examenul.");
				CancelExam(playerid);
				return bool:true;
			}
			if(PlayerVar[playerid][JobWork] && PlayerInfo[playerid][pJob] != 4) PlayerVar[playerid][JobTimeLeft] = 3;
			else if(PlayerVar[playerid][JobWork]) CancelJob(playerid, true);
		}
		case PLAYER_STATE_PASSENGER: {
			Iter_Remove(PlayerInVehicle[oldvehicle], playerid);
			LastVehicle[playerid] = 0;
			switch(PlayerInfo[playerid][pMode]) {
				case 2: {
					LastSpeed[playerid] = 0;
					new carid = FindSpawnID(oldvehicle, false);
					if(carid != -1) {
						SetPlayerCarTime(carid);
						new Float: x, Float: y, Float: z, Float: rot;
						GetVehiclePos(vehicleid, x, y, z);
						GetVehicleZAngle(vehicleid, rot);
						CarInfo[carid][cLastPos][0] = x;
						CarInfo[carid][cLastPos][1] = y;
						CarInfo[carid][cLastPos][2] = z;
						CarInfo[carid][cLastPos][3] = rot;
					}
				}
				case 1: GameTextForPlayer(playerid, "  ", 1000, 3);
			}
			if(Helmet[playerid]) {
				gString[0] = EOS;
				Helmet[playerid] = false;
				format(gString, 100, "* %s si-a scos casca de pe cap.", GetName(playerid));
				ProxDetector(30.0, playerid, gString, COLOR_PURPLE);
				RemovePlayerAttachedObject(playerid, 3);
			}
			if(CarRadio[oldvehicle] != 0) StopAudioStreamForPlayer(playerid), PlayerVar[playerid][Radio] = 0;
			if(ServerVehicle[oldvehicle][vFaction] == 10 && NewLive[playerid] != -1) return EndLive(playerid);
			if(PlayerVar[playerid][IsTaxi] != -1) {
				PlayerTextDrawHide(playerid, TaxiPTD);
				gString[0] = EOS;
				format(gString, 100, "Ai platit $%s la taxiu.", FormatNumber(PlayerVar[playerid][TaxiTotal]));
				SCM(playerid, COLOR_WHITE, gString);
				if(PlayerVar[PlayerVar[playerid][IsTaxi]][HaveCalls] == playerid) PlayerVar[PlayerVar[playerid][IsTaxi]][HaveCalls] = -1;
				if(PlayerVar[playerid][TaxiTotal] > 0 && lastPlayer[playerid] != PlayerVar[playerid][IsTaxi]) AddFactionRaport(PlayerVar[playerid][IsTaxi], 0, 1);
				lastPlayer[playerid] = PlayerVar[playerid][IsTaxi];
				PlayerVar[playerid][IsTaxi] = -1;
			}
		}
	}
	if(Iter_Count(Spectacting[playerid])) {
		foreach(new i : Spectacting[playerid]) {
			if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER) PlayerSpectateVehicle(i, vehicleid);
			else PlayerSpectatePlayer(i, playerid);
		}
	}
	switch(newstate) {
		case PLAYER_STATE_SPECTATING: PlayerTextDrawSetString(playerid, SpectateTD, "Loading...");
		case PLAYER_STATE_WASTED: if(!PaintType[playerid] && InWar[PlayerInfo[playerid][pMember]] == -1) GameTextForPlayer(playerid, "~r~WASTED", 2000, 0);
		case PLAYER_STATE_PASSENGER: {
			Iter_Add(PlayerInVehicle[vehicleid], playerid);
			LastVehicle[playerid] = vehicleid;
			if(CarRadio[vehicleid] != 0) PlayAudioStreamForPlayer(playerid, RadioLink[CarRadio[vehicleid]]), PlayerVar[playerid][Radio] = CarRadio[vehicleid];
			if(ServerVehicle[vehicleid][vFaction] == 5) {
				foreach(new i : PlayerInVehicle[vehicleid]) {
					if(PlayerVar[i][TaxiDuty] && PlayerInfo[i][pMember] == 5 && GetPlayerState(i) == PLAYER_STATE_DRIVER) {
						if(GetPlayerCash(playerid) < PlayerVar[i][TaxiAmount]) {
							RemovePlayerFromVehicle(playerid);
							SCM(playerid, COLOR_GREY, "Nu ai bani necesari.");
							return bool:true;
						}
						PlayerVar[playerid][IsTaxi] = i;
						PlayerVar[playerid][TaxiTotal] = 0;
						if(CP[i] == CP_FIND_PLAYER && PlayerVar[i][Find] == playerid) DisablePlayerFind(i);
						CallServiceAccept[playerid][0] = -1;
						UpdateTaxi(playerid, i);
						break;
					}
				}
			}
		}
		case PLAYER_STATE_DRIVER: {
			Iter_Add(PlayerInVehicle[vehicleid], playerid);
			LastVehicle[playerid] = vehicleid;
			SetPlayerArmedWeapon(playerid, 0);
			if(vehicleid == PlayerVar[playerid][FactionVehicle]) PlayerVar[playerid][TimerCheckSpawns] = 0;
			if(PlayerVar[playerid][JobWork]) PlayerVar[playerid][JobTimeLeft] = 0;
			if(CarRadio[vehicleid] != 0) PlayAudioStreamForPlayer(playerid, RadioLink[CarRadio[vehicleid]]), PlayerVar[playerid][Radio] = CarRadio[vehicleid];
			gString[0] = EOS;	
			if(IsABike(vehicleid)) {
				new engine, lights, alarm, doors, bonnet, boot, objective;
				GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
				Engine[vehicleid] = true;
				SetVehicleParamsEx(vehicleid, VEHICLE_PARAMS_ON, lights, alarm, doors, bonnet, boot, objective);
			}
			loadSpeedomter(playerid, vehicleid);
			
			switch(GetVehicleModel(vehicleid)) {
				case 417, 425, 447, 460, 464, 465, 469, 476, 487, 488, 497, 501, 511, 512, 513, 519, 520, 548, 553, 563, 577, 592, 593: {
					if(PlayerInfo[playerid][pFlyLicense] < gettime() && PlayerVar[playerid][IsLession] == -1) {
						SCM(playerid, COLOR_GREY, "Nu ai licenta de fly.");
						RemovePlayerFromVehicle(playerid);
						return true;
					}
					SCM(playerid, -1, "Pentru a porni acest vehicul foloseste comanda /engine!");
				}
				case 430, 446, 452, 453, 454, 472, 473, 484, 493, 595: {
					if(PlayerInfo[playerid][pBoatLicense] < gettime() && PlayerVar[playerid][IsLession] == -1) {
						SCM(playerid, COLOR_GREY, "Nu ai licenta de barca.");
						RemovePlayerFromVehicle(playerid);
						return true;
					}
				}
				case 481, 509, 510, 462: {}
				default: {
					if(PlayerInfo[playerid][pDriveLicense] < gettime() && !PlayerVar[playerid][IsExam]) {
						SCM(playerid, COLOR_GREY, "Nu ai licenta de condus.");
						RemovePlayerFromVehicle(playerid);
						return true;
					}
				}
			}

			if(RobBackpack[playerid])
				return SCM(playerid, COLOR_GREY, "Trebuie sa pui sacul cu bani in vehiculul care ai dat rob folosind tasta Y."), ClearAnimations(playerid);
			
			if(JobCar[vehicleid] && JobCar[vehicleid] != PlayerInfo[playerid][pJob]) {
				format(gString, 100, "Nu ai jobul %s.", JobInfo[PlayerInfo[playerid][pJob] - 1][jName]);
				SCM(playerid, COLOR_GREY, gString);
				RemovePlayerFromVehicle(playerid);
				return bool:true;
			}
			if(PlayerInfo[playerid][pMember] != ServerVehicle[vehicleid][vFaction] && ServerVehicle[vehicleid][vFaction] != 0) {
				RemovePlayerFromVehicle(playerid);
				gString[0] = EOS;
				format(gString, 100, "Do not take part in the %s faction.", FactionInfo_[ServerVehicle[vehicleid][vFaction]-1][fName]);
				SCM(playerid, COLOR_GREY, gString);
				return bool:true;
			}
			new idd = FindSpawnID(vehicleid, false);
			if(idd != -1) format(gString, sizeof(gString), "~p~%s", GetVehicleName(GetVehicleModel(vehicleid)));
			else format(gString, sizeof(gString), "~g~%s", GetVehicleName(GetVehicleModel(vehicleid)));
			GameTextForPlayer(playerid, gString, 5000, 1);
			if(idd != -1) {
				format(gString, sizeof(gString), "This %s (ID %d) is owned by %s | Age: %d days | Odomter: %.0f km | Insurance $%s (%d points) | Colors: %d, %d", 
					GetVehicleName(CarInfo[idd][cModel]), CarInfo[idd][cID], CarInfo[idd][cOwner], CarInfo[idd][cDays], CarInfo[idd][cOdometer], FormatNumber(CarInfo[idd][cInsurance]), 
				CarInfo[idd][cPoints], CarInfo[idd][cColor][0], CarInfo[idd][cColor][1]);
				SCMEx(playerid, COLOR_WHITE, gString);
				if(CarInfo[idd][cStage]) {
					Iter_Add(Rainbows[1], playerid);
					format(gString, 30, " {5297D5}[STAGE: %d/4]", CarInfo[idd][cStage]);
					SetTimerEx(#GiveVehicleSpeed, 300, false, #i, playerid);
				}
				if(CarInfo[idd][cRainbow] || CarInfo[idd][cStage] || strlen(CarInfo[idd][cText]) > 3 || CarInfo[idd][cNeon] != 0) {
					format(gString, sizeof gString, "Other:%s%s%s%s%s%s", CarInfo[idd][cRainbow] ? (" {23F83D}[{23F853}R{23F870}A{23F894}I{23F8AE}N{23F8C8}B{23F8DE}O{23DEF8}W{23B4F8}]") : (""), strlen(CarInfo[idd][cText]) > 3 ? (" {F7FF00}[VIP]") : (""), CarInfo[idd][cStage]?(gString):(""), CarInfo[idd][cNeon] != 0 ? NeonColor[CarInfo[idd][cNeon] - 1] : (""), CarInfo[idd][cNeon] != 0 ? (" [NEON]") : (""));
					SCM(playerid, COLOR_WHITE, gString);
				}
				if(CarInfo[idd][cLeft] != 0) {
					format(gString, 75, "{FF0000}>> {FFFFFF}Left vehicle in %d days.", CarInfo[idd][cLeft]-CarInfo[idd][cDays]);
					SCM(playerid, COLOR_WHITE, gString);
				}
				if(CarInfo[idd][cUserid] == PlayerInfo[playerid][pSQLID]) {
					if(CarInfo[idd][cPoints] == 0) {
						format(gString, sizeof(gString), "To use this vehicle you have to pay $%s.", FormatNumber(CarInfo[idd][cInsurance]));
						ShowPlayerDialog(playerid, DIALOG_PAYINSURANCE, DIALOG_STYLE_MSGBOX, "Pay Insurance", gString, "Ok", "No");
					}
					if(PlayerInfo[playerid][pTog][6] && PlayerInfo[playerid][pVehRainbow] != 0 && !PlayerRainbow[playerid] && CarInfo[idd][cRainbow] && ServerSystem(6)) {
					    VehicleRainbow[playerid] = CarInfo[idd][cSpawned];
					    rID[playerid] = 62;
					   	PlayerRainbow[playerid] = PlayerInfo[playerid][pVehRainbow];
					   	Iter_Add(Rainbows[PlayerInfo[playerid][pVehRainbow]], playerid);						
					}
				}
				else if(CarInfo[idd][cID] != 0 && idd != 0) {
					if(CarInfo[idd][cPoints] == 0) return SCM(playerid, COLOR_GREY, "This vehicle does not have the insurance paid.");		
					if(CarInfo[idd][cRainbow] && ServerSystem(6) && !PlayerRainbow[playerid]) {
					    VehicleRainbow[playerid] = CarInfo[idd][cSpawned];
					    rID[playerid] = 62;
					   	PlayerRainbow[playerid] = 1;
					   	Iter_Add(Rainbows[1], playerid);
					}
				}
			}
			idd = FindSpawnID(vehicleid, true);
			if(idd != -1) {
				format(gString, sizeof(gString), "This %s (ID %d) is owned by {%s}%s %s", 
					GetVehicleName(ClanVeh[idd][cvModel]), ClanVeh[idd][cvID], ClanInfo[GetClan[ClanVeh[idd][cvClanID]]][clColor], ClanInfo[GetClan[ClanVeh[idd][cvClanID]]][clName], ClanVeh[idd][cvClanID] != PlayerInfo[playerid][pClan] ? ("{FFFFFF}and you are not part of this clan") : (""));
				SCMEx(playerid, COLOR_WHITE, gString);	
				if(ClanVeh[idd][cvClanID] != PlayerInfo[playerid][pClan]) RemovePlayerFromVehicle(playerid);		
			}
		}
	}
	return bool:true;
}
public OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart) {
	new Float: HP, Float: AP;
	GetPlayerHealth(damagedid,HP);
	GetPlayerArmour(damagedid,AP);
	if(PlayerInfo[playerid][pHud][2]) {
		TextDrawShowForPlayer(playerid, dmgInfoTD[2]);
		TextDrawShowForPlayer(playerid, dmgInfoTD[3]);
		format(gString, sizeof gString, "%s (%d)", GetName(damagedid), damagedid);
		PlayerTextDrawSetString(playerid, dmgInfoPTD[3], gString);
		total_demage[playerid] += amount;
		timeDMG[playerid]=5;
		format(gString, sizeof gString, "-%0.2f HP", total_demage[playerid]);
		PlayerTextDrawSetString(playerid, dmgInfoPTD[2], gString);
		PlayerTextDrawShow(playerid, dmgInfoPTD[2]);
		PlayerTextDrawShow(playerid, dmgInfoPTD[3]);
	}

	if(PlayerInfo[damagedid][pHud][2] && !PlayerVar[playerid][Undercover]) {
		TextDrawShowForPlayer(damagedid, dmgInfoTD[0]);
		TextDrawShowForPlayer(damagedid, dmgInfoTD[1]);
		format(gString, sizeof gString, "%s (%d)", GetName(playerid), playerid);
		PlayerTextDrawSetString(damagedid, dmgInfoPTD[1], gString);
		total_take[damagedid] += amount;
		timeDMG[damagedid]=5;
		format(gString, sizeof gString, "-%0.2f HP", total_take[damagedid]);
		PlayerTextDrawSetString(damagedid, dmgInfoPTD[0], gString);
		PlayerTextDrawShow(damagedid, dmgInfoPTD[0]);
		PlayerTextDrawShow(damagedid, dmgInfoPTD[1]);
	}

	if((PlayerVar[damagedid][IsSafezone] || PlayerVar[playerid][IsSafezone]) && PlayerVar[playerid][HaveContract] == -1 && !PlayerVar[playerid][Duty] && InWar[PlayerInfo[playerid][pMember]] == -1 && !PaintType[playerid]) {
		SCM(playerid, COLOR_WHITE, "{FF0000}(safe-zone) {FFFFFF}Ai primit freeze pentru 5 secunde.");
		SetPlayerFreeze(playerid, 5);
		SetPlayerHealth(damagedid, HP);
		SetPlayerArmour(damagedid, AP);
		return bool:true;
	}
	if(PlayerInfo[playerid][pMember] == PlayerInfo[damagedid][pMember] && InWar[PlayerInfo[playerid][pMember]] != -1 || PlayerVar[damagedid][Sleeping]) {
		SetPlayerHealth(damagedid, HP);
		SetPlayerArmour(damagedid, AP);
		return bool:true;
	}
	if(InWar[PlayerInfo[playerid][pMember]] == InWar[PlayerInfo[damagedid][pMember]] && GetPlayerTurf(playerid) != InWar[PlayerInfo[playerid][pMember]] && InWar[PlayerInfo[playerid][pMember]] != -1) {
		SetPlayerHealth(damagedid, HP);
		SetPlayerArmour(damagedid, AP);
		return bool:true;	
	}
	if(weaponid == 34) {
		SetPlayerHealth(damagedid, 0.0);
		SetPlayerArmour(damagedid, 0.0);
		PlayerVar[damagedid][FakeWarning] = playerid;
		OnPlayerDeath(damagedid, playerid, weaponid);
		return bool:true;
	}

	if(Tazer[playerid] && IsCop(playerid) && weaponid == 24) {
		if(IsCop(damagedid)) 
			return SCM(playerid, COLOR_WHITE, "Acel player este intr-un departament de politie..");
		
		if(PlayerVar[damagedid][Cuff])
			return SCM(playerid, COLOR_WHITE, "Acel player este deja electrocutat.");
		
		if(PlayerVar[damagedid][Sleeping]) 
			return SCM(playerid, COLOR_WHITE, "Acel player doarme.");

		if(GetDistanceBetweenPlayers(playerid, damagedid) < 15) {
			gString[0] = EOS;
			format(gString, 100, "* %s tazed %s for 8 seconds.", GetName(playerid), GetName(damagedid));
			ProxDetector(30.0, playerid, gString, COLOR_PURPLE);
			SetPlayerFreeze(damagedid, 8);
			SetPlayerHealth(damagedid, HP);
			SetPlayerArmour(damagedid, AP);
			return bool:true;
		}
	}

	if(PaintType[playerid] != 0) PlayerPlaySound(playerid,17802,0.0,0.0,0.0);
	if(!PlayerVar[damagedid][Death]) {
		if(AP <= 0) SetPlayerHealth(damagedid, HP-amount);
		else SetPlayerArmour(damagedid, AP-amount);
	}
	return bool:true;
}

public OnPlayerDeath(playerid, killerid, reason) {
	#if defined gm_debug
		printf("%s: callback OnPlayerDeath %d %d", GetName(playerid), killerid, reason);
	#endif
	if(PlayerVar[playerid][Death]) 
		return bool:true;

	//if(killerid != INVALID_PLAYER_ID && PlayerVar[playerid][FakeWarning] != killerid && IsPlayerLogged(playerid) && reason != 49 && PlayerVar[playerid][AFKSeconds] < 15 && ServerSystem(13)) return KickEx(playerid);

	PlayerVar[playerid][FakeWarning] = -1;
	PlayerVar[playerid][Death] = true;

	SetPlayerWorldBounds(playerid, 20000.0000, -20000.0000, 20000.0000, -20000.0000);

	if(IsCop(playerid)) checkBP(killerid, 22, 150);

	foreach(new i : _Player<ADMIN>) if(PlayerInfo[i][pTog][8]) SendDeathMessageToPlayer(i, killerid, playerid, reason);

	if(PlayerInfo[playerid][pWanted] != 0) {
		ClearString();
		foreach(new i : StreamedPlayer[playerid]) {
			if(IsCop(i) && CrimInRange(75.0, playerid, i) && PlayerVar[i][Duty]) {
				GameTextForPlayer(i, "running suspect bonus!", 3000, 1);
				GivePlayerCash(i, PlayerInfo[playerid][pWanted] * 500);		
				AddFactionRaport(i, 0, 1);
				format(gString, 100, "Ai primit $%d bonus pentru prinderea suspectului %s.", PlayerInfo[playerid][pWanted] * 500, GetName(playerid));
				SCM(i, COLOR_PURPLE, gString);
				format(gString, 100, "%s arrested suspect %s, issuing a fine of $%d with a sentance of %d seconds.", GetName(killerid), GetName(playerid), PlayerInfo[playerid][pWanted] * 500, PlayerInfo[playerid][pWanted] * 300);
				SCMTA(COLOR_RED, gString);
				format(gString, 100, "* %s is now in jail thanks to: %s", GetName(playerid), GetName(killerid));
				ProxDetector(20.0, i, gString, COLOR_PURPLE);
				SetPlayerJail(playerid);
				Iter_Remove(Calls[9], playerid);
				break;
			}
		}
	}
	if(player_selected[playerid] == 12) return _hide_player_PC(playerid);
	if(killerid != INVALID_PLAYER_ID) CheckPlayerMission(killerid, 1, 1);
	if(InWar[PlayerInfo[playerid][pMember]] != -1 && InWar[PlayerInfo[killerid][pMember]] != -1) {
		new m = PlayerInfo[playerid][pMember], w = InWar[m];
	    if(killerid != INVALID_PLAYER_ID) {
		    format(gString, 70, "You have killed %s (%d).", GetName(playerid), playerid);
		    SCM(killerid, COLOR_SERVER, gString);
		   	format(gString, 70, "You have been killed by %s (%d).", GetName(killerid), killerid);
		    SCM(playerid, COLOR_SERVER, gString);
		    WarDeath[playerid] ++;
		    WarKills[killerid] ++;

		    if(WarKills[killerid] > (WarInfo[w][wDeath] < 1 ? 0 : WarInfo[w][wKills]/WarInfo[w][wDeath])) {
		    	WarInfo[w][wBest] = killerid;
		    	WarInfo[w][wKills] = WarKills[killerid];
		    }
		    if(WarDeath[playerid] > (WarInfo[w][wKills] < 1 ? 0 : WarInfo[w][wDeath]/WarInfo[w][wKills])) {
		    	WarInfo[w][wWorst] = playerid;
		    	WarInfo[w][wDeath] = WarDeath[playerid];
		    }
		    WarInfo[w][wScore][PlayerInfo[killerid][pMember]] += 1.0;
		    foreach(new i : Factions<m>) SendDeathMessageToPlayer(i, killerid, playerid, reason);
			foreach(new i : Factions<PlayerInfo[killerid][pMember]>) SendDeathMessageToPlayer(i, killerid, playerid, reason);
		}
	    new weapons[2], pk, Float: Pos[3];
	    GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
		for(new i = 0; i < 12; i++) {
			GetPlayerWeaponData(playerid, i, weapons[0], weapons[1]); 
			if(!weapons[0]) continue;
			
			pk = CreatePickup(WeaponObject(weapons[0]), 23, Pos[0] + random(4), Pos[1] + random(4), Pos[2], GetPlayerVirtualWorld(playerid));
			PickupInfo[pk][pkWar] = w + 1;
			PickupInfo[pk][pkType] = 69;
			PickupInfo[pk][pkID] = weapons[0];
			PickupInfo[pk][pkValue] = weapons[1];
		}
		pk = CreatePickup(1241, 23, Pos[0] + random(4), Pos[1] + random(4), Pos[2], GetPlayerVirtualWorld(playerid));
		PickupInfo[pk][pkWar] = w + 1;
		PickupInfo[pk][pkType] = 69;
		PickupInfo[pk][pkID] = 100;
		PickupInfo[pk][pkValue] = 25;

		pk = CreatePickup(1212, 23, Pos[0] + random(4), Pos[1] + random(4), Pos[2], GetPlayerVirtualWorld(playerid));
		PickupInfo[pk][pkWar] = w + 1;
		PickupInfo[pk][pkType] = 69;
		PickupInfo[pk][pkID] = 1212;
		PickupInfo[pk][pkValue] = 3000;
		return bool:true;
    }

	if(killerid != INVALID_PLAYER_ID) {
		if(PaintType[killerid] == PaintType[playerid] && PaintType[playerid] != 0) {
			if(PB_Status[PaintType[killerid] - 1] < 2)
				return bool:true;

			checkBP(killerid, 3, 300); 
			PKills[killerid] ++, PDeath[playerid] ++, LastKillP[killerid] ++; 
			gString[0] = EOS;
			format(gString, 100, "You have killed %s. You now have %d kills.", GetName(playerid), PKills[killerid]);
			SCM(killerid, COLOR_SERVER, gString);
			if(LastKillP[killerid] > 1) {
				format(gString, 75, "~y~%s: ~w~~h~%s kill", GetName(killerid), PaintKillers[LastKillP[killerid] - 2]);
				foreach(new i : PlayerPaint[PaintType[playerid] - 1]) GameTextForPlayer(i, gString, 5000, 3);
			}
			if(PB_Best[PaintType[playerid] - 1] == -1) {
				PB_Best[PaintType[playerid] - 1] = killerid;
				format(gString, 100, "%s is in the lead with %d kills.", GetName(PB_Best[PaintType[playerid] - 1]), PKills[PB_Best[PaintType[playerid] - 1]]);
				SendPaintMessage(PaintType[playerid], COLOR_YELLOW, gString);
			}
			else if(PKills[killerid] > PKills[PB_Best[PaintType[playerid] - 1]]) {
				PB_Best[PaintType[playerid] - 1] = killerid;
				format(gString, 100, "%s is in the lead with %d kills.", GetName(PB_Best[PaintType[playerid] - 1]), PKills[PB_Best[PaintType[playerid] - 1]]);
				SendPaintMessage(PaintType[playerid], COLOR_YELLOW, gString);
			}
			foreach(new i : PlayerPaint[PaintType[playerid] - 1]) SendDeathMessageToPlayer(i, killerid, playerid, reason);
			return bool:true;
		}
		if(PlayerVar[playerid][Cuff]) {
		    PlayerVar[playerid][Cuff] = false;
	    	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	    	RemovePlayerAttachedObject(playerid, 1);
		}
		if(PlayerVar[killerid][HaveContract] == playerid) {
			PlayerPlaySound(killerid, 17802,0.0,0.0,0.0);
			
			new wname[30];
			GetWeaponName(reason, wname, sizeof(wname));
			if(reason == 0) wname = "Pumn";
			
			GivePlayerCash(killerid, PlayerVar[playerid][BodyMoney]);
			PlayerVar[killerid][HaveContract] = -1;
			
			gString[0] = EOS;
			if(DistanceToPlayer(killerid, playerid) < 150 && reason != WEAPON_KNIFE) {
				SendPlayerEmail(PlayerInfo[killerid][pName], "Ai primit faction warn! Motiv: Ai tras la mai putin de 150m.", killerid);
				if(++PlayerInfo[killerid][pFWarn] >= 3) {
					format(gString, 100, "* %s a fost scos din factiune. Motiv: 3/3 Faction Warn", GetName(killerid));
					SendFactionMessage(PlayerInfo[killerid][pMember], COLOR_LIGHTBLUE, gString);

					format(gString, 150, "Ai fost scos din factiunea %s. Motiv: 3/3 Faction Warn", FactionInfo_[PlayerInfo[killerid][pMember] - 1][fName]);
					SendPlayerEmail(PlayerInfo[killerid][pName], gString, killerid);	
					SCM(killerid, COLOR_LIGHTRED, "Ai fost scos din factiune motiv: 3/3 Faction Warn.");				

					UninvitePlayerFaction(killerid, EditPlayer[playerid][5]<14?30:0);	
					PlayerInfo[killerid][pFWarn] = 0;				
				}
				UpdateVar(killerid, "FWarn", PlayerInfo[killerid][pFWarn]);
				format(gString, 100, "(!) %s[rank: %d] a terminat contractul pe %s [distanta: %dm][arma: %s][fail]", GetName(killerid), PlayerInfo[killerid][pRank], GetName(playerid), DistanceToPlayer(killerid, playerid), wname); 	
			}
			else {
				if(DistanceToPlayer(killerid, playerid) >= 200) GivePlayerCash(killerid, PlayerVar[playerid][BodyMoney]);
				format(gString, 150, "* Ai efectuat cu succes contractul pe %s(%d). Ai primit: $%s.", GetName(playerid), playerid, FormatNumber(PlayerVar[playerid][BodyMoney]));
				SCM(killerid, COLOR_MONEY, gString);
				format(gString, 150, "(!) %s[rank: %d] a terminat contractul pe %s [distanta: %dm][arma: %s][succes]", GetName(killerid), PlayerInfo[killerid][pRank], GetName(playerid), DistanceToPlayer(killerid, playerid), wname);
				if(PlayerInfo[killerid][pPhoneStatus] && PlayerVar[killerid][Undercover]) {
					format(gString, 150, "(!) %s[rank: %d] a terminat contractul pe %s [distanta: %dm][arma: %s][succes]", GetName(killerid), PlayerInfo[killerid][pRank], GetName(playerid), DistanceToPlayer(killerid, playerid), wname);					
					AddFactionRaport(killerid, 0, 1);
					checkBP(killerid, 20, 150);
					if(PlayerVar[killerid][Find] == playerid) DisablePlayerFind(killerid);
				}
			}			
			SendFactionMessage(9, COLOR_LIGHTBLUE, gString);		
			PlayerVar[playerid][BodyMoney] = 0;
			return bool:true;
		}
	}

	if(killerid != INVALID_PLAYER_ID) {
	 	if(!PlayerInfo[killerid][pMember] && !PlayerInfo[playerid][pMember]) {
			format(gString, 100, "Ai fost omorat de %s. Ai timp 60 de secunde sa raportezi crima [/call 112].", GetName(killerid));
			SCM(playerid, COLOR_SERVER, gString);
			PlayerVar[playerid][RaportTime] = gettime()+60;
			PlayerVar[playerid][PlayerWanted] = killerid;
		} 
	}
	return bool:true; }

public OnPlayerCommandReceived(playerid, cmd[], params[], flags) {
	if(!IsPlayerLogged(playerid)) return false;
	if flags & _:true *then return SCM(playerid, COLOR_GREY, "Aceasta comanda este dezactivata momentan!"),0;
	if(GetTickCount()-lastcommand[playerid] < 400) return false;
	if(Iter_Count(Spectacting[playerid])) {
		gString[0] = EOS;
		foreach(new i : Spectacting[playerid]) {
			SCMf(i, COLOR_PINK, "%s used command '/%s %s'.", GetName(playerid), cmd, params);
		}
	}
	if(RestartCount != 0 && !IsAdmin(playerid, 1)) return false;
	if(!PlayerVar[playerid][PinLogged] && PlayerInfo[playerid][pPin] != 0) return SCM(playerid, COLOR_GREY, "Nu esti logat cu pinul."), 0;
    return bool:true; }

public OnPlayerCommandPerformed(playerid, cmd[], params[], result, flags) {
    if(result == -1) return SCM(playerid, COLOR_GREY, "You have entered an invalid command. Type /help to see our server commands."), 0;
    lastcommand[playerid] = GetTickCount();
    return bool:true; }