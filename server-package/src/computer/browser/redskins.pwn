
#include <YSI_Coding\y_hooks>

new PlayerText:tagSkin[MAX_PLAYERS], PlayerText:RowSkinTD[MAX_PLAYERS][11][3], PlayerText:skinBar[MAX_PLAYERS][2];

static const web_skins[3][11] = {
	{124,90,81,91,121,144,146,140,167,169, 271},
	{25,23,28,18,20,21,29,30,41,45,269},
	{1,2,10,9,11,16,22,26,34,33,299}
};

static const web_price[3][11] = {
	{-150,150000000,-200,100000000,-100,-400,100000000,100000000,500000000,300000000,-450},
	{100000000,60000000,100000000,50000000,-100,-80,60000000,-50,80000000,100000000,250000000},
	{30000000,10000000,2000000,5000000,-30,10000000,15000000,15000000,20000000,5000000,-150}
};


std::redirectRedSkins(client, x=-1) {
	tagSkin[client] = CreatePlayerTextDraw(client, 27.176204, 237.519500, "Epic Skins");
	PlayerTextDrawLetterSize(client, tagSkin[client], 0.522283, 2.257066);
	PlayerTextDrawAlignment(client, tagSkin[client], 1);
	PlayerTextDrawColor(client, tagSkin[client], 255);
	PlayerTextDrawSetShadow(client, tagSkin[client], 0);
	PlayerTextDrawSetOutline(client, tagSkin[client], 0);
	PlayerTextDrawBackgroundColor(client, tagSkin[client], 255);
	PlayerTextDrawFont(client, tagSkin[client], 1);
	PlayerTextDrawSetProportional(client, tagSkin[client], 1);
	PlayerTextDrawSetShadow(client, tagSkin[client], 0);
	PlayerTextDrawShow(client, tagSkin[client]);
	listitemmm[client] = 0;

	while(++x<sizeof RD_SkinsTD) TextDrawShowForPlayer(client, RD_SkinsTD[x]); x=-1;

	while(++x<8) {
		RowSkinTD[client][x][0] = CreatePlayerTextDraw(client, 27.995237 + (x * 64.2), 259.325927, "LD_SPAC:white");
		PlayerTextDrawLetterSize(client, RowSkinTD[client][x][0], 0.000000, 0.000000);
		PlayerTextDrawTextSize(client, RowSkinTD[client][x][0], 63.000000, 56.000000);
		PlayerTextDrawAlignment(client, RowSkinTD[client][x][0], 1);
		PlayerTextDrawColor(client, RowSkinTD[client][x][0], -2139062110);
		PlayerTextDrawSetShadow(client, RowSkinTD[client][x][0], 0);
		PlayerTextDrawSetOutline(client, RowSkinTD[client][x][0], 0);
		PlayerTextDrawBackgroundColor(client, RowSkinTD[client][x][0], 255);
		PlayerTextDrawFont(client, RowSkinTD[client][x][0], 4);
		PlayerTextDrawSetProportional(client, RowSkinTD[client][x][0], 0);
		PlayerTextDrawSetShadow(client, RowSkinTD[client][x][0], 0);
		PlayerTextDrawSetSelectable(client, RowSkinTD[client][x][0], true);
		PlayerTextDrawShow(client, RowSkinTD[client][x][0]);
		PlayerTextID[client][PlayerText:RowSkinTD[client][x][0]] = BROWSER_CLICK_CSKIN_1+x;

		RowSkinTD[client][x][1] = CreatePlayerTextDraw(client, 2.709546 + (x * 65.41), 254.499816, "");
		PlayerTextDrawLetterSize(client, RowSkinTD[client][x][1], 0.000000, 0.000000);
		PlayerTextDrawTextSize(client, RowSkinTD[client][x][1], 112.000000, 103.000000);
		PlayerTextDrawAlignment(client, RowSkinTD[client][x][1], 1);
		PlayerTextDrawColor(client, RowSkinTD[client][x][1], -1);
		PlayerTextDrawSetShadow(client, RowSkinTD[client][x][1], 0);
		PlayerTextDrawSetOutline(client, RowSkinTD[client][x][1], 0);
		PlayerTextDrawBackgroundColor(client, RowSkinTD[client][x][1], 0);
		PlayerTextDrawFont(client, RowSkinTD[client][x][1], 5);
		PlayerTextDrawSetProportional(client, RowSkinTD[client][x][1], 0);
		PlayerTextDrawSetShadow(client, RowSkinTD[client][x][1], 0);
		PlayerTextDrawSetPreviewModel(client, RowSkinTD[client][x][1], web_skins[0][x]);
		PlayerTextDrawSetPreviewRot(client, RowSkinTD[client][x][1], 0.000000, 0.000000, 15.000000, 1.000000);
		PlayerTextDrawShow(client, RowSkinTD[client][x][1]);
	} --x;

	skinBar[client][0] = CreatePlayerTextDraw(client, -13.623804, 315.326171, "LD_SPAC:white");
	PlayerTextDrawLetterSize(client, skinBar[client][0], 0.000000, 0.000000);
	PlayerTextDrawTextSize(client, skinBar[client][0], 703.000000, 78.000000);
	PlayerTextDrawAlignment(client, skinBar[client][0], 1);
	PlayerTextDrawColor(client, skinBar[client][0], -1);
	PlayerTextDrawSetShadow(client, skinBar[client][0], 0);
	PlayerTextDrawSetOutline(client, skinBar[client][0], 0);
	PlayerTextDrawBackgroundColor(client, skinBar[client][0], 255);
	PlayerTextDrawFont(client, skinBar[client][0], 4);
	PlayerTextDrawSetProportional(client, skinBar[client][0], 0);
	PlayerTextDrawSetShadow(client, skinBar[client][0], 0);
	PlayerTextDrawShow(client, skinBar[client][0]);

	while(++x<11) {
		RowSkinTD[client][x][0] = CreatePlayerTextDraw(client, 27.995237 + ((x%8) * 64.2), 324.773071, "LD_SPAC:white");
		PlayerTextDrawLetterSize(client, RowSkinTD[client][x][0], 0.000000, 0.000000);
		PlayerTextDrawTextSize(client, RowSkinTD[client][x][0], 63.000000, 56.000000);
		PlayerTextDrawAlignment(client, RowSkinTD[client][x][0], 1);
		PlayerTextDrawColor(client, RowSkinTD[client][x][0], -2139062110);
		PlayerTextDrawSetShadow(client, RowSkinTD[client][x][0], 0);
		PlayerTextDrawSetOutline(client, RowSkinTD[client][x][0], 0);
		PlayerTextDrawBackgroundColor(client, RowSkinTD[client][x][0], 255);
		PlayerTextDrawFont(client, RowSkinTD[client][x][0], 4);
		PlayerTextDrawSetProportional(client, RowSkinTD[client][x][0], 0);
		PlayerTextDrawSetShadow(client, RowSkinTD[client][x][0], 0);
		PlayerTextDrawSetSelectable(client, RowSkinTD[client][x][0], true);
		PlayerTextDrawShow(client, RowSkinTD[client][x][0]);
		PlayerTextID[client][PlayerText:RowSkinTD[client][x][0]] = BROWSER_CLICK_CSKIN_1+x;

		RowSkinTD[client][x][1] = CreatePlayerTextDraw(client, 2.709546 + ((x%8) * 65.41), 319.739624, "");
		PlayerTextDrawLetterSize(client, RowSkinTD[client][x][1], 0.000000, 0.000000);
		PlayerTextDrawTextSize(client, RowSkinTD[client][x][1], 112.000000, 103.000000);
		PlayerTextDrawAlignment(client, RowSkinTD[client][x][1], 1);
		PlayerTextDrawColor(client, RowSkinTD[client][x][1], -1);
		PlayerTextDrawSetShadow(client, RowSkinTD[client][x][1], 0);
		PlayerTextDrawSetOutline(client, RowSkinTD[client][x][1], 0);
		PlayerTextDrawBackgroundColor(client, RowSkinTD[client][x][1], 0);
		PlayerTextDrawFont(client, RowSkinTD[client][x][1], 5);
		PlayerTextDrawSetProportional(client, RowSkinTD[client][x][1], 0);
		PlayerTextDrawSetShadow(client, RowSkinTD[client][x][1], 0);
		PlayerTextDrawSetPreviewModel(client, RowSkinTD[client][x][1], web_skins[0][x]);
		PlayerTextDrawSetPreviewRot(client, RowSkinTD[client][x][1], 0.000000, 0.000000, 15.000000, 1.000000);
		PlayerTextDrawShow(client, RowSkinTD[client][x][1]);
	} x=-1;

	skinBar[client][1] = CreatePlayerTextDraw(client, -42.195243, 380.865997, "LD_SPAC:white");
	PlayerTextDrawLetterSize(client, skinBar[client][1], 0.000000, 0.000000);
	PlayerTextDrawTextSize(client, skinBar[client][1], 704.000000, 45.000000);
	PlayerTextDrawAlignment(client, skinBar[client][1], 1);
	PlayerTextDrawColor(client, skinBar[client][1], -1);
	PlayerTextDrawSetShadow(client, skinBar[client][1], 0);
	PlayerTextDrawSetOutline(client, skinBar[client][1], 0);
	PlayerTextDrawBackgroundColor(client, skinBar[client][1], 255);
	PlayerTextDrawFont(client, skinBar[client][1], 4);
	PlayerTextDrawSetProportional(client, skinBar[client][1], 0);
	PlayerTextDrawSetShadow(client, skinBar[client][1], 0);
	PlayerTextDrawShow(client, skinBar[client][1]);

	while(++x<11) {
		if(web_price[0][x] > -1) format(gString, sizeof gString, "$%s", FormatNumber(web_price[0][x])); else format(gString, sizeof gString, "%d premium points", -web_price[0][x]);
		RowSkinTD[client][x][2] = CreatePlayerTextDraw(client, 59.504714 + ((x%8) * 64.40), 314.746459 + ((x/8) * 65.27), gString);
		PlayerTextDrawLetterSize(client, RowSkinTD[client][x][2], 0.137522, 1.041066);
		PlayerTextDrawAlignment(client, RowSkinTD[client][x][2], 2);
		PlayerTextDrawColor(client, RowSkinTD[client][x][2], 255);
		PlayerTextDrawSetShadow(client, RowSkinTD[client][x][2], 0);
		PlayerTextDrawSetOutline(client, RowSkinTD[client][x][2], 0);
		PlayerTextDrawBackgroundColor(client, RowSkinTD[client][x][2], 255);
		PlayerTextDrawFont(client, RowSkinTD[client][x][2], 2);
		PlayerTextDrawSetProportional(client, RowSkinTD[client][x][2], 1);
		PlayerTextDrawSetShadow(client, RowSkinTD[client][x][2], 0);
		PlayerTextDrawShow(client, RowSkinTD[client][x][2]);
	}
	return true;
}

std::hideRedSkins(client, x=-1) {
	while(++x<sizeof RD_SkinsTD) TextDrawHideForPlayer(client, RD_SkinsTD[x]); x=-1;
	while(++x<11) 
		PlayerTextDrawDestroy(client, RowSkinTD[client][x][0]),
		PlayerTextDrawDestroy(client, RowSkinTD[client][x][1]),
		PlayerTextDrawDestroy(client, RowSkinTD[client][x][2]); 

	x=-1;

	PlayerTextDrawDestroy(client, skinBar[client][0]);
	PlayerTextDrawDestroy(client, skinBar[client][1]);
	PlayerTextDrawDestroy(client, tagSkin[client]);
	return true;
}

std::showClientSkins(client, type = 0, x=-1) {
	listitemmm[client] = type;
	new type_[][] = {"Epic", "Rare", "Common"};
	format(gString, sizeof gString, "%s Skins", type_[type]);
	PlayerTextDrawSetString(client, tagSkin[client], gString);
	while(++x<11) {
		if(web_price[type][x] > -1) format(gString, sizeof gString, "$%s", FormatNumber(web_price[type][x])); else format(gString, sizeof gString, "%d premium points", -web_price[type][x]);
		PlayerTextDrawSetString(client, RowSkinTD[client][x][2], gString);
		PlayerTextDrawSetPreviewModel(client, RowSkinTD[client][x][1], web_skins[type][x]),
		PlayerTextDrawShow(client, RowSkinTD[client][x][1]);
	}
	return true;
}

Dialog:clientSelectSkin(playerid, response, listitem, string:inputtext[]) {
	if(!response) return true;
	if(GetPlayerMaxSkin(playerid)) return sendComputerMessage(playerid, "Ai numarul maxim de skinrui!");
	new x=listitemm[playerid],type=listitemmm[playerid];
	static const _types[][] = {"~p~Epic", "~y~~h~Rare", "Common"};
	if(web_price[type][x] > -1) {
		if(GetPlayerCash(playerid) < web_price[type][x]) return sendComputerMessage(playerid, "Nu ai suficienti banii!");
		format(gString, sizeof gString, "~y~Achizitionat~n~~w~Ti-ai cumparat skin-ul %d de tip (%s~w~)~n~Pentru suma de ~g~~h~$%s", web_skins[type][x], _types[type], FormatNumber(web_price[type][x]));
		GivePlayerCash(playerid, -web_price[type][x]);
	} else {
		if(PlayerInfo[playerid][pPremiumPoints] < -web_price[type][x]) return sendComputerMessage(playerid, "Nu ai suficiente puncte premium!");
		format(gString, sizeof gString, "~y~Achizitionat~n~~w~Ti-ai cumparat skin-ul %d de tip (%s~w~)~n~Pentru suma de ~y~%d puncte premium", web_skins[type][x], _types[type], -web_price[type][x]);
		PlayerInfo[playerid][pPremiumPoints] -= -web_price[type][x];
		UpdateVar(playerid, "PremiumPoints", PlayerInfo[playerid][pPremiumPoints]);
	}
	GivePlayerSkin(playerid, web_skins[type][x]);
	sendComputerMessage(playerid, gString);
	return true;
}