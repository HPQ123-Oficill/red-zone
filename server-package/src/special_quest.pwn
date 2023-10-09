#include <YSI_Coding\y_hooks>
#define MAX_QUESTS_OBJ			(25)
#define SPECIAL_QUEST
new 
	bool:quest_started[MAX_PLAYERS], quest_vehicle[MAX_PLAYERS], 
	Iterator:special_quest[MAX_PLAYERS]<MAX_QUESTS_OBJ>, 
	questObj[MAX_PLAYERS][MAX_QUESTS_OBJ], questMap[MAX_PLAYERS][MAX_QUESTS_OBJ]
;
hook OnGameModeInit() {
	CreateDynamicActor(167, 1295.3782,174.4746,20.9106,82.0055);
	Create3DTextLabel("{FF0000}Easter eggs\n{FFFFFF}Pentru a incepe quest-ul foloseste '{FF0000}/startquest{FFFFFF}'\nfoloseste '{FF0000}/questinfo{FFFFFF}' pentru mai multe informatii", -1, 1295.3782,174.4746,20.9106, 10.0);
	return Iter_Init(special_quest);
}

new Float:quest_pos[25][3] = {
{1523.7400,-1208.4940,19.5164},
{1833.4113,-1127.8607,24.6721},
{2328.9128,-1241.8279,22.5000},
{2743.7336,-1424.1395,16.2562},
{2540.2163,-2044.9685,4.8558},
{2233.4783,-2282.8188,14.3751},
{1121.1752,-2066.4656,74.4297},
{820.3528,-1091.9127,25.7959},
{732.4162,-1276.2491,25.3516},
{1004.8907,-1004.3002,41.4819},
{1874.8909,-1955.6312,20.0703},
{1406.8987,-1393.3341,8.5943},
{868.1821,-17.7797,63.1953},
{1627.7509,33.4521,29.0939},
{2118.7417,-355.4527,58.2494},
{2145.9878,91.9078,27.1641},
{1046.0294,-298.8576,77.359},
{1271.6907,295.0196,20.6563},
{486.0972,-287.7855,17.0121},
{649.6282,-1128.4417,38.9705},
{1478.2339,-1885.0541,22.2109},
{1689.2168,-1974.2540,8.8256},
{2416.5820,-2570.8308,17.9107},
{2504.5247,-2640.3364,13.8623},
{2315.4614,33.8419,27.4740}};

cmd:startquest(playerid, params[]) {
	if !Iter_Count(special_quest[playerid]) *then
		return SCM(playerid, COLOR_LGREEN, "Eroare: Ai terminat deja quest-ul pe ziua de azi!");

	if PlayerInfo[playerid][pLevel] < 3 *then
		return SCM(playerid, COLOR_LGREEN, "Eroare: Ai nevoie de minim level 3 pentru a incepe quest-ul special!");

	if PlayerInfo[playerid][pDriveLicense] < gettime() *then
		return SCM(playerid, COLOR_LGREEN, "Eroare: Ai nevoie de licenta de condus pentru a incepe acest quest!");

	if quest_started[playerid] *then
		return SCM(playerid, COLOR_LGREEN, "Eroare: Ai inceput quest-ul special!");

	if !IsPlayerInRangeOfPoint(playerid, 5.0, 1295.3782,174.4746,20.9106) *then
		return 
			SetPlayerCheckpoint(playerid, 1295.3782,174.4746,20.9106, 2.0), CP[playerid] = CP_NORMAL,
			SCM(playerid, COLOR_LGREEN, "Eroare: Nu esti in locul de unde poti quest-ul special. Ti-am pus un checkpoint unde poti incepe quest-ul!");

	new i = -1;
	while(++i<MAX_QUESTS_OBJ) {
		if PlayerInfo[playerid][pQuestStatus][i] *then 
			continue;

		questMap[playerid][i] = CreateDynamicMapIcon(quest_pos[i][0], quest_pos[i][1], quest_pos[i][2], 44, -1, -1, -1, playerid, 5000.0, MAPICON_GLOBAL);
		questObj[playerid][i] = CreateDynamicObject(19343, quest_pos[i][0], quest_pos[i][1], quest_pos[i][2], 0.0, 0.0, 0.0, -1, -1, playerid);
	}
	callcmd::questinfo(playerid);
	quest_vehicle[playerid] = CreateVehicleEx(600, 1281.3032,175.8848,19.8551,67.4117, -1, -1, -1);
	Fuel[quest_vehicle[playerid]] = 100;
	GiveVehicleKey(playerid, quest_vehicle[playerid]);
	PutPlayerInVehicle(playerid, quest_vehicle[playerid], 0);
	quest_started[playerid] = true;
	return true;
}

cmd:questinfo(playerid) {
	SCMf(playerid, COLOR_RED, "Easter eggs: {FFFFFF}progress %d/%d", MAX_QUESTS_OBJ-Iter_Count(special_quest[playerid]), MAX_QUESTS_OBJ);
	SCMf(playerid, COLOR_WHITE, "Salut %s, Iepurasul are nevoie de ajutor pentru a salva pastele! Mergand din casa in casa, si-a rupt cosul cu oua.", GetName(playerid));
	SCM(playerid, COLOR_WHITE, "Vrea ca tu sa ii cauti oule si sa i-le aduci inapoi intr-un interval de 24 de ore.");
	SCM(playerid, COLOR_WHITE, "Daca aceasta misiune va fi indeplinita, pastele va fi salvat, daca nu, pastele va fi terminat pe vecie!");
	SCM(playerid, COLOR_WHITE, "Succes si nu uita ca pastele sta in mainile tale!");
	SCM(playerid, COLOR_LGREEN, "La final vei primii: $4.000.000 - $8.000.000 si 10 - 20 PP si posibilitatea de a primi o masca speciala.");
	return true;
}

std::load_quests(playerid, _x=-1) {
	while(++_x<25) if !PlayerInfo[playerid][pQuestStatus][_x] *then Iter_Add(special_quest[playerid], _x);
	if(Iter_Count(special_quest[playerid])) SCMf(playerid, COLOR_RED, "Easter eggs: {FFFFFF}Este disponibil! foloeste /startquest pentru a incepe quest-ul special (%d/%d)", MAX_QUESTS_OBJ-Iter_Count(special_quest[playerid]), MAX_QUESTS_OBJ);
	else SCM(playerid, COLOR_RED, "Easter eggs: {FFFFFF}Ai terminat quest-ul special pe ziua de azi!");
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {
	if(!(newkeys & KEY_FIRE))
		return true;

	if !quest_started[playerid] *then
		return true;

	if IsPlayerInAnyVehicle(playerid) *then
		return true;

	new x;
	foreach(x:special_quest[playerid]) {
		if !IsPlayerInRangeOfPoint(playerid, 3.5, quest_pos[x][0], quest_pos[x][1], quest_pos[x][2]) *then continue;
		break;
	}
	if x==25 *then return true;

	DestroyDynamicObject(questObj[playerid][x]);
	DestroyDynamicMapIcon(questMap[playerid][x]);
	Iter_Remove(special_quest[playerid], x);
	PlayerInfo[playerid][pQuestStatus][x] = true;
	SCMf(playerid, COLOR_RED, "Easter eggs: {FFFFFF}progress %d/%d", MAX_QUESTS_OBJ-Iter_Count(special_quest[playerid]), MAX_QUESTS_OBJ);
	ApplyAnimation(playerid, "GANGS","shake_carSH",4.0,0,0,0,0,0);
	save_quests(playerid);

	if(!Iter_Count(special_quest[playerid])) {
		format(gString, 128, "(( %s: a terminat quest-ul '{FF0000}Easter eggs{FFFFFF}' si a primit un premiu special! ))", GetName(playerid));
		SCMTA(COLOR_WHITE, gString);
		new money = RandomEx(4000000, 8000000),pp = RandomEx(10, 20);
		GivePlayerCash(playerid, money);
		PlayerInfo[playerid][pPremiumPoints] +=pp;

		UpdateVar(playerid, "PremiumPoints", PlayerInfo[playerid][pPremiumPoints]);
		quest_started[playerid] = false;
		DestroyVehicleEx(quest_vehicle[playerid]);
		SCMf(playerid, COLOR_LGREEN, "Ai primit: $%s si $%d PP", FormatNumber(money), pp);
		if random(100) < 20 *then SCM(playerid, -1, "Ai primit masca {3EFF00}[{00FF1F}S{00FF61}P{00FFA2}E{00FFD1}C{00F0FF}I{00B6FF}A{0070FF}L{002EFF}A{5100FF}]"), AddItemToInventar(playerid, 19, _ItemType(playerid, 20));
	}
	return true;
}

cmd:gotoquestobj(playerid, params[]) {
	if !IsAdmin(playerid, 5) *then
		return SCM(playerid, COLOR_LGREEN, "Eroare: Nu ai acces la aceasta comanda!");

	extract params -> new x; else
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/gotoquestobj [questid]");

	if x < 1 || x >= MAX_QUESTS_OBJ *then
		return SCM(playerid, COLOR_LGREEN, "Eroare: invalid quest ID.");

	if(!Iter_Contains(special_quest[playerid], --x))
		return SCM(playerid, COLOR_LGREEN, "Eroare: Ai luat deja acel obiect!");

	SetPlayerPos(playerid, quest_pos[x][0]+2, quest_pos[x][1]+2, quest_pos[x][2]);
	SCMf(playerid, COLOR_WHITE, "Te-ai teleportat la object quest ID: %d", x+1);
	return true;
}

std::save_quests(playerid) {
	mysql_format(SQL, gQuery, 256, "UPDATE `users` SET `quests` = '%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i' WHERE `id` = '%i'",
		PlayerInfo[playerid][pQuestStatus][0], PlayerInfo[playerid][pQuestStatus][1], PlayerInfo[playerid][pQuestStatus][2], PlayerInfo[playerid][pQuestStatus][3],
		PlayerInfo[playerid][pQuestStatus][4], PlayerInfo[playerid][pQuestStatus][5], PlayerInfo[playerid][pQuestStatus][6], PlayerInfo[playerid][pQuestStatus][7],
		PlayerInfo[playerid][pQuestStatus][8], PlayerInfo[playerid][pQuestStatus][9], PlayerInfo[playerid][pQuestStatus][10], PlayerInfo[playerid][pQuestStatus][11],
		PlayerInfo[playerid][pQuestStatus][12], PlayerInfo[playerid][pQuestStatus][13], PlayerInfo[playerid][pQuestStatus][14], PlayerInfo[playerid][pQuestStatus][15],
		PlayerInfo[playerid][pQuestStatus][16], PlayerInfo[playerid][pQuestStatus][17], PlayerInfo[playerid][pQuestStatus][18], PlayerInfo[playerid][pQuestStatus][19],
		PlayerInfo[playerid][pQuestStatus][20], PlayerInfo[playerid][pQuestStatus][21], PlayerInfo[playerid][pQuestStatus][22], PlayerInfo[playerid][pQuestStatus][23],
	PlayerInfo[playerid][pQuestStatus][24], PlayerInfo[playerid][pSQLID]);
	mysql_tquery(SQL, gQuery);
	return true;
}

cmd:stopquest(playerid) {
	if !quest_started[playerid] *then
		return SCM(playerid, COLOR_LGREEN, "Nu ai inceput quest-ul special!");

	stopQuest(playerid);
	return true;
}

std::stopQuest(playerid) {
	if !quest_started[playerid] *then return true;
	SCMf(playerid, COLOR_YELLOW, "Quest oprit! progress (%d/%d)", MAX_QUESTS_OBJ-Iter_Count(special_quest[playerid]), MAX_QUESTS_OBJ);
	foreach(new i : special_quest[playerid]) DestroyDynamicObject(questObj[playerid][i]), DestroyDynamicMapIcon(questMap[playerid][i]);
	DestroyVehicle(quest_vehicle[playerid]);
	quest_started[playerid]=false;
	return true;
}

hook OnPlayerSpawn(playerid) return stopQuest(playerid);
hook OnPlayerDisconnect(playerid, reason) return stopQuest(playerid);