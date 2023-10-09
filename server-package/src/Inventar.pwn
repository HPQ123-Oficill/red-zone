
//////////////////////////////
////// Variabile /////////////
//////////////////////////////
#define MAX_INVENTAR_ITEMS  		(36)
#define MAX_SHOP_ITEMS				(30)
#define MAX_SHOP_TYPE 				(3)

enum ITEM_TYPE {
    ITEM_NAME[30],
    ITEM_OBJECT,
    ITEM_PRICE,
    Float:ITEM_POS[4]
};

static const ItemInfo[][ITEM_TYPE] = {
    {"Shaorma", 2769, 100, {90.000000, 0.000000, 0.000000, 1.399999}},
    {"Pizza", 1582, 150, {90.000000, 0.000000, 0.000000, 1.399999}},
    {"Burger", 2880, 125, {0.000000, 0.000000, 0.000000, 1.399999}},
    {"Chicken Burger", 2768, 200, {0.000000, 0.000000, 0.000000, 1.399999}},
    {"Little Burger", 2703, 200, {280.000000, 0.000000, 0.000000, 1.399999}},
    {"Sprunk Soda", 13562, 50, {-20.000000, -5.000000, 0.300000, 0.899999}},
    {"Apple Juice", 19564, 50, {0.000000, 0.000000, 0.000000, 0.899999}},
    {"Orane Juice", 19563, 50, {0.000000, 0.000000, 0.000000, 0.899999}},
    {"Beer", 1484, 200, {0.000000, 0.000000, 0.899999, 0.899999}},
    {"Light Beer", 1486, 300, {0.000000, 0.000000, 0.899999, 0.899999}},
    {"Wine", 1486, 300, {0.000000, 0.000000, 0.899999, 0.899999}},
    {"Vodka", 19823, 300, {-20.000000, -5.000000, 0.300000, 0.899999}},
    {"Whiskey", 19824, 500, {0.000000, 0.000000, 0.000000, 0.899999}},
    {"Phone", 18872, 1000, {44.000000, 90.000000, 95.000000, 0.800000}},
    {"Credit", 19792, 500, {50.000000, 0.000000, 0.000000, 0.800000}},
    {"PhoneBook", 19807, 300, {230.000000, 0.000000, 0.000000, 1.000000}},
    {"Walkie Talkie", 19611, 1500, {0.000000, 0.000000, 0.000000, 1.000000}},
    {"Gas Can", 1650, 5000, {0.000000, 0.000000, 0.000000, 1.000000}},
    {"Repair Kit", 3096, 200000, {0.000000, 0.000000, 0.000000, 1.000000}}
};
static const ShopMax[MAX_SHOP_TYPE][2] = {
	{0, 4}, {5, 12}, {13, 18}
};

enum SLOT_INFO {
	SLOT_NAME[30],
	SLOT_OBJECT,
	SLOT_VALUE,
	Float:SLOT_POS[4]
}
new SlotInfo[][SLOT_INFO] = {
	{"None", 18685, 0, {0.0, 0.0, 0.0, 0.0}},
    {"Shaorma", 2769, 25, {90.000000, 0.000000, 0.000000, 1.399999}},
    {"Pizza", 1582, 45, {90.000000, 0.000000, 0.000000, 1.399999}},
    {"Burger", 2880, 30, {0.000000, 0.000000, 0.000000, 1.399999}},
    {"Chicken Burger", 2768, 35, {0.000000, 0.000000, 0.000000, 1.399999}},
    {"Little Burger", 2703, 25, {280.000000, 0.000000, 0.000000, 1.399999}},
    {"Sprunk Soda", 13562, 27, {-20.000000, -5.000000, 0.300000, 0.899999}},
    {"Apple Juice", 19564, 28, {0.000000, 0.000000, 0.000000, 0.899999}},
    {"Orane Juice", 19563, 29, {0.000000, 0.000000, 0.000000, 0.899999}},
    {"Beer", 1484, 40, {0.000000, 0.000000, 0.899999, 0.899999}},
    {"Light Beer", 1486, 25, {0.000000, 0.000000, 0.899999, 0.899999}},
    {"Wine", 1486, 50, {0.000000, 0.000000, 0.899999, 0.899999}},
    {"Vodka", 19823, 50, {-20.000000, -5.000000, 0.300000, 0.899999}},
    {"Whiskey", 19824, 50, {0.000000, 0.000000, 0.000000, 0.899999}},
    {"Phone", 18872, 0, {44.000000, 90.000000, 95.000000, 0.800000}},
    {"Credit", 19792, 0, {50.000000, 0.000000, 0.000000, 0.800000}},
    {"PhoneBook", 19807, 1, {230.000000, 0.000000, 0.000000, 1.000000}},
    {"Walkie Talkie", 19611, 0, {0.000000, 0.000000, 0.000000, 1.000000}},
    {"Gas Can", 1650, 20, {0.000000, 0.000000, 0.000000, 1.000000}},
    {"Repair Kit", 3096, 0, {0.000000, 0.000000, 0.000000, 1.000000}},
    {"Maska bunny", 3003, 0, {0.0, 0.0, 0.0, 1.0}}
};
new 
	Text: InventarTD[9], PlayerText: InventarPTD[MAX_PLAYERS][MAX_INVENTAR_ITEMS+11], PlayerText: invInfoPTD[MAX_PLAYERS][7] = {{PlayerText:INVALID_TEXT_DRAW, ...}, ...}, invInfo[MAX_PLAYERS][2] = {{-1,...},...}, bool: invPage[MAX_PLAYERS] = {false, ...}, PlayerShop[MAX_PLAYERS] = {-1,...},
	PlayerText: ShopPTD[MAX_PLAYERS][MAX_SHOP_ITEMS+1], PlayerText: ShopPricePTD[MAX_PLAYERS][MAX_SHOP_ITEMS] = {{PlayerText:INVALID_TEXT_DRAW, ...}, ...}, Text: ShopTD[7], PlayerText: InventarValPTD[MAX_PLAYERS][MAX_INVENTAR_ITEMS] = {{PlayerText:INVALID_TEXT_DRAW, ...}, ...}, InventarDeelay[MAX_PLAYERS]
;

stock LoadInventarTD() {
	InventarTD[0] = TextDrawCreate(431.499969, 121.350006, "box");
	TextDrawLetterSize(InventarTD[0], 0.000000, 27.558797);
	TextDrawTextSize(InventarTD[0], 0.000000, 200.000000);
	TextDrawAlignment(InventarTD[0], 2);
	TextDrawColor(InventarTD[0], -1);
	TextDrawUseBox(InventarTD[0], 1);
	TextDrawBoxColor(InventarTD[0], 0x111111FF);
	TextDrawSetShadow(InventarTD[0], 0);
	TextDrawSetOutline(InventarTD[0], 0);
	TextDrawBackgroundColor(InventarTD[0], 255);
	TextDrawFont(InventarTD[0], 1);
	TextDrawSetProportional(InventarTD[0], 1);
	TextDrawSetShadow(InventarTD[0], 0);

	InventarTD[1] = TextDrawCreate(431.299957, 144.300018, "box");
	TextDrawLetterSize(InventarTD[1], 0.000000, -0.191191);
	TextDrawTextSize(InventarTD[1], 0.000000, 200.000000);
	TextDrawAlignment(InventarTD[1], 2);
	TextDrawColor(InventarTD[1], -1);
	TextDrawUseBox(InventarTD[1], 1);
	TextDrawBoxColor(InventarTD[1], 0x489327FF);
	TextDrawSetShadow(InventarTD[1], 0);
	TextDrawSetOutline(InventarTD[1], 0);
	TextDrawBackgroundColor(InventarTD[1], 255);
	TextDrawFont(InventarTD[1], 1);
	TextDrawSetProportional(InventarTD[1], 1);
	TextDrawSetShadow(InventarTD[1], 0);

	InventarTD[2] = TextDrawCreate(431.799957, 126.087493, "inventory");
	TextDrawLetterSize(InventarTD[2], 0.251498, 1.228124);
	TextDrawAlignment(InventarTD[2], 2);
	TextDrawColor(InventarTD[2], -1);
	TextDrawSetShadow(InventarTD[2], 0);
	TextDrawSetOutline(InventarTD[2], 0);
	TextDrawBackgroundColor(InventarTD[2], 255);
	TextDrawFont(InventarTD[2], 2);
	TextDrawSetProportional(InventarTD[2], 1);
	TextDrawSetShadow(InventarTD[2], 0);

	InventarTD[3] = TextDrawCreate(507.699981, 353.587493, "close");
	TextDrawLetterSize(InventarTD[3], 0.239499, 1.586874);
	TextDrawTextSize(InventarTD[3], 50.000000, 42.000000);
	TextDrawAlignment(InventarTD[3], 2);
	TextDrawColor(InventarTD[3], -1);
	TextDrawUseBox(InventarTD[3], 1);
	TextDrawBoxColor(InventarTD[3], 0x489327FF);
	TextDrawSetShadow(InventarTD[3], 0);
	TextDrawSetOutline(InventarTD[3], 0);
	TextDrawBackgroundColor(InventarTD[3], 255);
	TextDrawFont(InventarTD[3], 2);
	TextDrawSetProportional(InventarTD[3], 1);
	TextDrawSetShadow(InventarTD[3], 0);
	TextDrawSetSelectable(InventarTD[3], true);

	InventarTD[4] = TextDrawCreate(441.400024, 342.250000, "ld_beat:chit");
	TextDrawLetterSize(InventarTD[4], 0.000000, 0.000000);
	TextDrawTextSize(InventarTD[4], 10.000000, 9.000000);
	TextDrawAlignment(InventarTD[4], 1);
	TextDrawColor(InventarTD[4], 858993485);
	TextDrawSetShadow(InventarTD[4], 0);
	TextDrawSetOutline(InventarTD[4], 0);
	TextDrawBackgroundColor(InventarTD[4], 255);
	TextDrawFont(InventarTD[4], 4);
	TextDrawSetProportional(InventarTD[4], 0);
	TextDrawSetShadow(InventarTD[4], 0);

	InventarTD[5] = TextDrawCreate(270.899902, 121.337539, "box");
	TextDrawLetterSize(InventarTD[5], 0.000000, 15.708806);
	TextDrawTextSize(InventarTD[5], 0.000000, 108.000000);
	TextDrawAlignment(InventarTD[5], 2);
	TextDrawColor(InventarTD[5], -1);
	TextDrawUseBox(InventarTD[5], 1);
	TextDrawBoxColor(InventarTD[5], 0x111111FF);
	TextDrawSetShadow(InventarTD[5], 0);
	TextDrawSetOutline(InventarTD[5], 0);
	TextDrawBackgroundColor(InventarTD[5], 255);
	TextDrawFont(InventarTD[5], 1);
	TextDrawSetProportional(InventarTD[5], 1);
	TextDrawSetShadow(InventarTD[5], 0);

	InventarTD[6] = TextDrawCreate(270.799957, 144.737518, "box");
	TextDrawLetterSize(InventarTD[6], 0.000000, -0.229190);
	TextDrawTextSize(InventarTD[6], 0.000000, 107.979995);
	TextDrawAlignment(InventarTD[6], 2);
	TextDrawColor(InventarTD[6], -1);
	TextDrawUseBox(InventarTD[6], 1);
	TextDrawBoxColor(InventarTD[6], 0x489327FF);
	TextDrawSetShadow(InventarTD[6], 0);
	TextDrawSetOutline(InventarTD[6], 0);
	TextDrawBackgroundColor(InventarTD[6], 255);
	TextDrawFont(InventarTD[6], 1);
	TextDrawSetProportional(InventarTD[6], 1);
	TextDrawSetShadow(InventarTD[6], 0);

	InventarTD[7] = TextDrawCreate(261.300354, 241.625000, "");
	TextDrawLetterSize(InventarTD[7], 0.000000, 0.000000);
	TextDrawTextSize(InventarTD[7], 19.000000, 30.000000);
	TextDrawAlignment(InventarTD[7], 1);
	TextDrawColor(InventarTD[7], -1);
	TextDrawSetShadow(InventarTD[7], 0);
	TextDrawSetOutline(InventarTD[7], 0);
	TextDrawBackgroundColor(InventarTD[7], 0);
	TextDrawFont(InventarTD[7], 5);
	TextDrawSetProportional(InventarTD[7], 0);
	TextDrawSetShadow(InventarTD[7], 0);
	TextDrawSetPreviewModel(InventarTD[7], 19094);
	TextDrawSetPreviewRot(InventarTD[7], -10.000000, -90.000000, 0.000000, 1.000000);

	InventarTD[8] = TextDrawCreate(264.700347, 245.125000, "");
	TextDrawLetterSize(InventarTD[8], 0.000000, 0.000000);
	TextDrawTextSize(InventarTD[8], 30.000000, 18.000000);
	TextDrawAlignment(InventarTD[8], 1);
	TextDrawColor(InventarTD[8], -1);
	TextDrawSetShadow(InventarTD[8], 0);
	TextDrawSetOutline(InventarTD[8], 0);
	TextDrawBackgroundColor(InventarTD[8], 0);
	TextDrawFont(InventarTD[8], 5);
	TextDrawSetProportional(InventarTD[8], 0);
	TextDrawSetShadow(InventarTD[8], 0);
	TextDrawSetPreviewModel(InventarTD[8], 1669);
	TextDrawSetPreviewRot(InventarTD[8], -10.000000, 3.000000, 45.000000, 1.000000);

	ShopTD[0] = TextDrawCreate(240.800018, 121.362472, "box");
	TextDrawLetterSize(ShopTD[0], 0.000000, 24.467794);
	TextDrawTextSize(ShopTD[0], 0.000000, 167.450302);
	TextDrawAlignment(ShopTD[0], 2);
	TextDrawColor(ShopTD[0], -1);
	TextDrawUseBox(ShopTD[0], 1);
	TextDrawBoxColor(ShopTD[0], 0x111111FF);
	TextDrawSetShadow(ShopTD[0], 0);
	TextDrawSetOutline(ShopTD[0], 0);
	TextDrawBackgroundColor(ShopTD[0], 255);
	TextDrawFont(ShopTD[0], 1);
	TextDrawSetProportional(ShopTD[0], 1);
	TextDrawSetShadow(ShopTD[0], 0);

	ShopTD[1] = TextDrawCreate(240.899871, 144.162536, "box");
	TextDrawLetterSize(ShopTD[1], 0.000000, -0.141191);
	TextDrawTextSize(ShopTD[1], 0.000000, 167.461395);
	TextDrawAlignment(ShopTD[1], 2);
	TextDrawColor(ShopTD[1], -1);
	TextDrawUseBox(ShopTD[1], 1);
	TextDrawBoxColor(ShopTD[1], 0x489327FF);
	TextDrawSetShadow(ShopTD[1], 0);
	TextDrawSetOutline(ShopTD[1], 0);
	TextDrawBackgroundColor(ShopTD[1], 255);
	TextDrawFont(ShopTD[1], 1);
	TextDrawSetProportional(ShopTD[1], 1);
	TextDrawSetShadow(ShopTD[1], 0);

	ShopTD[2] = TextDrawCreate(241.300018, 125.487503, "SHOP");
	TextDrawLetterSize(ShopTD[2], 0.251498, 1.228124);
	TextDrawAlignment(ShopTD[2], 2);
	TextDrawColor(ShopTD[2], -1);
	TextDrawSetShadow(ShopTD[2], 0);
	TextDrawSetOutline(ShopTD[2], 0);
	TextDrawBackgroundColor(ShopTD[2], 255);
	TextDrawFont(ShopTD[2], 2);
	TextDrawSetProportional(ShopTD[2], 1);
	TextDrawSetShadow(ShopTD[2], 0);

	ShopTD[3] = TextDrawCreate(240.899963, 344.874877, "box");
	TextDrawLetterSize(ShopTD[3], 0.000000, 2.715826);
	TextDrawTextSize(ShopTD[3], 0.000000, 167.359252);
	TextDrawAlignment(ShopTD[3], 2);
	TextDrawColor(ShopTD[3], -1);
	TextDrawUseBox(ShopTD[3], 1);
	TextDrawBoxColor(ShopTD[3], 858993663);
	TextDrawSetShadow(ShopTD[3], 0);
	TextDrawSetOutline(ShopTD[3], 0);
	TextDrawBackgroundColor(ShopTD[3], 255);
	TextDrawFont(ShopTD[3], 1);
	TextDrawSetProportional(ShopTD[3], 1);
	TextDrawSetShadow(ShopTD[3], 0);

	ShopTD[4] = TextDrawCreate(241.399810, 350.212463, "box");
	TextDrawLetterSize(ShopTD[4], 0.000000, 1.671828);
	TextDrawTextSize(ShopTD[4], 0.000000, 48.099983);
	TextDrawAlignment(ShopTD[4], 2);
	TextDrawColor(ShopTD[4], -1);
	TextDrawUseBox(ShopTD[4], 1);
	TextDrawBoxColor(ShopTD[4], 84215295);
	TextDrawSetShadow(ShopTD[4], 0);
	TextDrawSetOutline(ShopTD[4], 0);
	TextDrawBackgroundColor(ShopTD[4], 255);
	TextDrawFont(ShopTD[4], 1);
	TextDrawSetProportional(ShopTD[4], 1);
	TextDrawSetShadow(ShopTD[4], 0);

	ShopTD[5] = TextDrawCreate(223.500122, 351.387603, "<");
	TextDrawLetterSize(ShopTD[5], 0.209499, 1.376875);
	TextDrawTextSize(ShopTD[5], 15.000000, 9.000000);
	TextDrawAlignment(ShopTD[5], 2);
	TextDrawColor(ShopTD[5], -2139062017);
	TextDrawUseBox(ShopTD[5], 1);
	TextDrawBoxColor(ShopTD[5], 858993663);
	TextDrawSetShadow(ShopTD[5], 0);
	TextDrawSetOutline(ShopTD[5], 0);
	TextDrawBackgroundColor(ShopTD[5], 255);
	TextDrawFont(ShopTD[5], 2);
	TextDrawSetProportional(ShopTD[5], 1);
	TextDrawSetShadow(ShopTD[5], 0);
	TextDrawSetSelectable(ShopTD[5], true);

	ShopTD[6] = TextDrawCreate(259.200134, 351.525085, ">");
	TextDrawLetterSize(ShopTD[6], 0.209499, 1.376875);
	TextDrawTextSize(ShopTD[6], 15.000000, 9.000000);
	TextDrawAlignment(ShopTD[6], 2);
	TextDrawColor(ShopTD[6], -2139062017);
	TextDrawUseBox(ShopTD[6], 1);
	TextDrawBoxColor(ShopTD[6], 858993663);
	TextDrawSetShadow(ShopTD[6], 0);
	TextDrawSetOutline(ShopTD[6], 0);
	TextDrawBackgroundColor(ShopTD[6], 255);
	TextDrawFont(ShopTD[6], 2);
	TextDrawSetProportional(ShopTD[6], 1);
	TextDrawSetShadow(ShopTD[6], 0);
	TextDrawSetSelectable(ShopTD[6], true);
	return true;
}

stock hidePlayerInventar(playerid) {
	if(invInfo[playerid][0] != -1) hideInvInfo(playerid);
	for(new i=0;i<9;i++) TextDrawHideForPlayer(playerid, InventarTD[i]);
	for(new i=0;i<MAX_INVENTAR_ITEMS;i++) {
		PlayerTextDrawDestroy(playerid, InventarPTD[playerid][i]);
		if(InventarValPTD[playerid][i] == PlayerText:INVALID_TEXT_DRAW) continue;
		PlayerTextDrawDestroy(playerid, InventarValPTD[playerid][i]);
		InventarValPTD[playerid][i] = PlayerText:INVALID_TEXT_DRAW;
	}
	for(new i=0;i<11;i++) PlayerTextDrawDestroy(playerid, InventarPTD[playerid][i+MAX_INVENTAR_ITEMS]);
	player_selected[playerid] = 0;
	CancelSelectTextDraw(playerid);
	PlayerTextDrawShow(playerid, PlayerLogo);
	if(PlayerInfo[playerid][pHud][2]) {
		PlayerTextDrawShow(playerid, HungerPTDx);
		PlayerTextDrawShow(playerid, DrinkPTDx);
		TextDrawShowForPlayer(playerid, DrinkTDx);
		TextDrawShowForPlayer(playerid, HungerTDx);
	}
	else {
		PlayerTextDrawShow(playerid, HungerPTD);
		PlayerTextDrawShow(playerid, DrinkPTD);
		TextDrawShowForPlayer(playerid, DrinkTD);
		TextDrawShowForPlayer(playerid, HungerTD);
	}
	for(new d=0;d<3;d++) TextDrawShowForPlayer(playerid, DataT[d]);
	return true;
}

stock LoadInventarPTD(playerid) {
	if(player_selected[playerid]!=0) return true;
	PlayerTextDrawHide(playerid, PlayerLogo);
	PlayerTextDrawHide(playerid, HungerPTD);
	PlayerTextDrawHide(playerid, DrinkPTD);
	TextDrawHideForPlayer(playerid, DrinkTD);
	TextDrawHideForPlayer(playerid, HungerTD);

	PlayerTextDrawHide(playerid, HungerPTDx);
	PlayerTextDrawHide(playerid, DrinkPTDx);
	TextDrawHideForPlayer(playerid, DrinkTDx);
	TextDrawHideForPlayer(playerid, HungerTDx);
	for(new d=0;d<3;d++) TextDrawHideForPlayer(playerid, DataT[d]);
	new z, rx,x,y; gString[0] = EOS;
	for(z=0;z<MAX_INVENTAR_ITEMS;z++) {
		rx = PlayerInfo[playerid][pItemType][z]; y=z%6,x=z/6;
		InventarPTD[playerid][z] = CreatePlayerTextDraw(playerid, 332.700286 + (y * 33.000000), 147.599975 + (x * 31.9375), "");
		PlayerTextDrawLetterSize(playerid, InventarPTD[playerid][z], 0.000000, 0.000000);
		PlayerTextDrawTextSize(playerid, InventarPTD[playerid][z], 32.000000, 31.000000);
		PlayerTextDrawAlignment(playerid, InventarPTD[playerid][z], 1);
		PlayerTextDrawColor(playerid, InventarPTD[playerid][z], -1);
		PlayerTextDrawSetShadow(playerid, InventarPTD[playerid][z], 0);
		PlayerTextDrawSetOutline(playerid, InventarPTD[playerid][z], 0);
		PlayerTextDrawBackgroundColor(playerid, InventarPTD[playerid][z], 858993663);
		PlayerTextDrawFont(playerid, InventarPTD[playerid][z], 5);
		PlayerTextDrawSetProportional(playerid, InventarPTD[playerid][z], 0);
		PlayerTextDrawSetShadow(playerid, InventarPTD[playerid][z], 0);
		if(rx<200) {
			PlayerTextDrawSetPreviewModel(playerid, InventarPTD[playerid][z], SlotInfo[rx][SLOT_OBJECT]);
			PlayerTextDrawSetPreviewRot(playerid, InventarPTD[playerid][z], SlotInfo[rx][SLOT_POS][0], SlotInfo[rx][SLOT_POS][1], SlotInfo[rx][SLOT_POS][2], SlotInfo[rx][SLOT_POS][3]);
		} else {
			PlayerTextDrawSetPreviewModel(playerid, InventarPTD[playerid][z], PlayerInfo[playerid][pItems][z]);
			PlayerTextDrawSetPreviewRot(playerid, InventarPTD[playerid][z], 0.0, 0.0, 0.0, 0.9);			
			PlayerTextDrawBackgroundColor(playerid, InventarPTD[playerid][z], GetSkinColor(PlayerInfo[playerid][pItems][z]));
		}
		PlayerTextDrawSetPreviewVehCol(playerid, InventarPTD[playerid][z], 1, 1);
		PlayerTextDrawSetSelectable(playerid, InventarPTD[playerid][z], true);	
		PlayerTextDrawShow(playerid, InventarPTD[playerid][z]);		
		PlayerTextID[playerid][PlayerText:InventarPTD[playerid][z]] = z;
	}
	for(z=0;z<MAX_INVENTAR_ITEMS;z++) {
		if(PlayerInfo[playerid][pItems][z] < 2) continue;
		y=z%6,x=z/6;
		format(gString, 15, "%s%d", PlayerInfo[playerid][pItemType][z]<200?(""):("ID: "), PlayerInfo[playerid][pItems][z]);

		InventarValPTD[playerid][z] = CreatePlayerTextDraw(playerid, 363.599700 + (y * 33.000000), 169.300018 + (x * 31.9375), gString);
		PlayerTextDrawLetterSize(playerid, InventarValPTD[playerid][z], 0.155500, 1.013749);
		PlayerTextDrawAlignment(playerid, InventarValPTD[playerid][z], 3);
		PlayerTextDrawColor(playerid, InventarValPTD[playerid][z], -1);
		PlayerTextDrawSetShadow(playerid, InventarValPTD[playerid][z], 0);
		PlayerTextDrawSetOutline(playerid, InventarValPTD[playerid][z], 0);
		PlayerTextDrawBackgroundColor(playerid, InventarValPTD[playerid][z], 255);
		PlayerTextDrawFont(playerid, InventarValPTD[playerid][z], 2);
		PlayerTextDrawSetProportional(playerid, InventarValPTD[playerid][z], 1);
		PlayerTextDrawSetShadow(playerid, InventarValPTD[playerid][z], 0);
		PlayerTextDrawShow(playerid, InventarValPTD[playerid][z]);
	}
	InventarPTD[playerid][36] = CreatePlayerTextDraw(playerid, 424.000000, 342.250000, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, InventarPTD[playerid][36], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, InventarPTD[playerid][36], 10.000000, 9.000000);
	PlayerTextDrawAlignment(playerid, InventarPTD[playerid][36], 1);
	PlayerTextDrawColor(playerid, InventarPTD[playerid][36], 0x489327FF);
	PlayerTextDrawSetShadow(playerid, InventarPTD[playerid][36], 0);
	PlayerTextDrawSetOutline(playerid, InventarPTD[playerid][36], 0);
	PlayerTextDrawBackgroundColor(playerid, InventarPTD[playerid][36], 255);
	PlayerTextDrawFont(playerid, InventarPTD[playerid][36], 4);
	PlayerTextDrawSetProportional(playerid, InventarPTD[playerid][36], 0);
	PlayerTextDrawSetShadow(playerid, InventarPTD[playerid][36], 0);
	PlayerTextDrawShow(playerid, InventarPTD[playerid][36]);			
	PlayerTextID[playerid][PlayerText:InventarPTD[playerid][36]] = 102;

	InventarPTD[playerid][37] = CreatePlayerTextDraw(playerid, 433.000000, 342.250000, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, InventarPTD[playerid][37], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, InventarPTD[playerid][37], 10.000000, 9.000000);
	PlayerTextDrawAlignment(playerid, InventarPTD[playerid][37], 1);
	PlayerTextDrawColor(playerid, InventarPTD[playerid][37], 858993663);
	PlayerTextDrawSetShadow(playerid, InventarPTD[playerid][37], 0);
	PlayerTextDrawSetOutline(playerid, InventarPTD[playerid][37], 0);
	PlayerTextDrawBackgroundColor(playerid, InventarPTD[playerid][37], 255);
	PlayerTextDrawFont(playerid, InventarPTD[playerid][37], 4);
	PlayerTextDrawSetProportional(playerid, InventarPTD[playerid][37], 0);
	PlayerTextDrawSetShadow(playerid, InventarPTD[playerid][37], 0);
	PlayerTextDrawSetSelectable(playerid, InventarPTD[playerid][37], true);
	PlayerTextDrawShow(playerid, InventarPTD[playerid][37]);			
	PlayerTextID[playerid][PlayerText:InventarPTD[playerid][37]] = 103;

	InventarPTD[playerid][38] = CreatePlayerTextDraw(playerid, 213.700378, 154.562500, "");
	PlayerTextDrawLetterSize(playerid, InventarPTD[playerid][38], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, InventarPTD[playerid][38], 120.000000, 95.000000);
	PlayerTextDrawAlignment(playerid, InventarPTD[playerid][38], 1);
	PlayerTextDrawColor(playerid, InventarPTD[playerid][38], -1);
	PlayerTextDrawSetShadow(playerid, InventarPTD[playerid][38], 0);
	PlayerTextDrawSetOutline(playerid, InventarPTD[playerid][38], 0);
	PlayerTextDrawBackgroundColor(playerid, InventarPTD[playerid][38], 0);
	PlayerTextDrawFont(playerid, InventarPTD[playerid][38], 5);
	PlayerTextDrawSetProportional(playerid, InventarPTD[playerid][38], 0);
	PlayerTextDrawSetShadow(playerid, InventarPTD[playerid][38], 0);
	PlayerTextDrawSetPreviewModel(playerid, InventarPTD[playerid][38], PlayerInfo[playerid][pModel]);
	PlayerTextDrawSetPreviewRot(playerid, InventarPTD[playerid][38], 0.000000, 0.000000, 0.000000, 1.000000);
	PlayerTextDrawShow(playerid, InventarPTD[playerid][38]);

	InventarPTD[playerid][39] = CreatePlayerTextDraw(playerid, 297.900634, 155.474975, "");
	PlayerTextDrawLetterSize(playerid, InventarPTD[playerid][39], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, InventarPTD[playerid][39], 23.000000, 23.000000);
	PlayerTextDrawAlignment(playerid, InventarPTD[playerid][39], 1);
	PlayerTextDrawColor(playerid, InventarPTD[playerid][39], -1);
	PlayerTextDrawSetShadow(playerid, InventarPTD[playerid][39], 0);
	PlayerTextDrawSetOutline(playerid, InventarPTD[playerid][39], 0);
	PlayerTextDrawBackgroundColor(playerid, InventarPTD[playerid][39], 858993663);
	PlayerTextDrawFont(playerid, InventarPTD[playerid][39], 5);
	PlayerTextDrawSetProportional(playerid, InventarPTD[playerid][39], 0);
	PlayerTextDrawSetShadow(playerid, InventarPTD[playerid][39], 0);
	PlayerTextDrawSetSelectable(playerid, InventarPTD[playerid][39], true);
	PlayerTextDrawSetPreviewModel(playerid, InventarPTD[playerid][39], PlayerInfo[playerid][pAttached][0]!=20?18685:3003);
	PlayerTextDrawSetPreviewRot(playerid, InventarPTD[playerid][39], 0.000000, 0.000000, 0.800000, 0.699998);
	PlayerTextDrawSetPreviewVehCol(playerid, InventarPTD[playerid][39], 1, 1);
	PlayerTextDrawShow(playerid, InventarPTD[playerid][39]);
	PlayerTextID[playerid][PlayerText:InventarPTD[playerid][39]] = 106;

	InventarPTD[playerid][40] = CreatePlayerTextDraw(playerid, 297.800445, 178.862487, "");
	PlayerTextDrawLetterSize(playerid, InventarPTD[playerid][40], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, InventarPTD[playerid][40], 23.000000, 23.000000);
	PlayerTextDrawAlignment(playerid, InventarPTD[playerid][40], 1);
	PlayerTextDrawColor(playerid, InventarPTD[playerid][40], -1);
	PlayerTextDrawSetShadow(playerid, InventarPTD[playerid][40], 0);
	PlayerTextDrawSetOutline(playerid, InventarPTD[playerid][40], 0);
	PlayerTextDrawBackgroundColor(playerid, InventarPTD[playerid][40], 858993663);
	PlayerTextDrawFont(playerid, InventarPTD[playerid][40], 5);
	PlayerTextDrawSetProportional(playerid, InventarPTD[playerid][40], 0);
	PlayerTextDrawSetShadow(playerid, InventarPTD[playerid][40], 0);
	PlayerTextDrawSetSelectable(playerid, InventarPTD[playerid][40], true);
	PlayerTextDrawSetPreviewModel(playerid, InventarPTD[playerid][40], 18685);
	PlayerTextDrawSetPreviewRot(playerid, InventarPTD[playerid][40], 0.000000, 0.000000, 0.800000, 0.699998);
	PlayerTextDrawSetPreviewVehCol(playerid, InventarPTD[playerid][40], 1, 1);
	PlayerTextDrawShow(playerid, InventarPTD[playerid][40]);
	PlayerTextID[playerid][PlayerText:InventarPTD[playerid][40]] = 104;

	InventarPTD[playerid][41] = CreatePlayerTextDraw(playerid, 297.800476, 202.175262, "");
	PlayerTextDrawLetterSize(playerid, InventarPTD[playerid][41], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, InventarPTD[playerid][41], 23.000000, 23.000000);
	PlayerTextDrawAlignment(playerid, InventarPTD[playerid][41], 1);
	PlayerTextDrawColor(playerid, InventarPTD[playerid][41], -1);
	PlayerTextDrawSetShadow(playerid, InventarPTD[playerid][41], 0);
	PlayerTextDrawSetOutline(playerid, InventarPTD[playerid][41], 0);
	PlayerTextDrawBackgroundColor(playerid, InventarPTD[playerid][41], 858993663);
	PlayerTextDrawFont(playerid, InventarPTD[playerid][41], 5);
	PlayerTextDrawSetProportional(playerid, InventarPTD[playerid][41], 0);
	PlayerTextDrawSetShadow(playerid, InventarPTD[playerid][41], 0);
	PlayerTextDrawSetSelectable(playerid, InventarPTD[playerid][41], true);
	PlayerTextDrawSetPreviewModel(playerid, InventarPTD[playerid][41], 18685);
	PlayerTextDrawSetPreviewRot(playerid, InventarPTD[playerid][41], 0.000000, 0.000000, 0.800000, 0.699998);
	PlayerTextDrawSetPreviewVehCol(playerid, InventarPTD[playerid][41], 1, 1);
	PlayerTextDrawShow(playerid, InventarPTD[playerid][41]);
	PlayerTextID[playerid][PlayerText:InventarPTD[playerid][41]] = 104;

	InventarPTD[playerid][42] = CreatePlayerTextDraw(playerid, 298.000518, 225.637512, "");
	PlayerTextDrawLetterSize(playerid, InventarPTD[playerid][42], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, InventarPTD[playerid][42], 23.000000, 23.000000);
	PlayerTextDrawAlignment(playerid, InventarPTD[playerid][42], 1);
	PlayerTextDrawColor(playerid, InventarPTD[playerid][42], -1);
	PlayerTextDrawSetShadow(playerid, InventarPTD[playerid][42], 0);
	PlayerTextDrawSetOutline(playerid, InventarPTD[playerid][42], 0);
	PlayerTextDrawBackgroundColor(playerid, InventarPTD[playerid][42], 858993663);
	PlayerTextDrawFont(playerid, InventarPTD[playerid][42], 5);
	PlayerTextDrawSetProportional(playerid, InventarPTD[playerid][42], 0);
	PlayerTextDrawSetShadow(playerid, InventarPTD[playerid][42], 0);
	PlayerTextDrawSetSelectable(playerid, InventarPTD[playerid][42], true);
	PlayerTextDrawSetPreviewModel(playerid, InventarPTD[playerid][42], 18685);
	PlayerTextDrawSetPreviewRot(playerid, InventarPTD[playerid][42], 0.000000, 0.000000, 0.800000, 0.699998);
	PlayerTextDrawSetPreviewVehCol(playerid, InventarPTD[playerid][42], 1, 1);
	PlayerTextDrawShow(playerid, InventarPTD[playerid][42]);
	PlayerTextID[playerid][PlayerText:InventarPTD[playerid][42]] = 104;

	InventarPTD[playerid][43] = CreatePlayerTextDraw(playerid, 227.300598, 224.925262, "");
	PlayerTextDrawLetterSize(playerid, InventarPTD[playerid][43], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, InventarPTD[playerid][43], 23.000000, 23.000000);
	PlayerTextDrawAlignment(playerid, InventarPTD[playerid][43], 1);
	PlayerTextDrawColor(playerid, InventarPTD[playerid][43], -1);
	PlayerTextDrawSetShadow(playerid, InventarPTD[playerid][43], 0);
	PlayerTextDrawSetOutline(playerid, InventarPTD[playerid][43], 0);
	PlayerTextDrawBackgroundColor(playerid, InventarPTD[playerid][43], 858993663);
	PlayerTextDrawFont(playerid, InventarPTD[playerid][43], 5);
	PlayerTextDrawSetProportional(playerid, InventarPTD[playerid][43], 0);
	PlayerTextDrawSetShadow(playerid, InventarPTD[playerid][43], 0);
	PlayerTextDrawSetSelectable(playerid, InventarPTD[playerid][43], true);
	PlayerTextDrawSetPreviewModel(playerid, InventarPTD[playerid][43], PlayerInfo[playerid][pModel]!=(PlayerInfo[playerid][pGender]?18:63)?11745:18685);
	PlayerTextDrawSetPreviewRot(playerid, InventarPTD[playerid][43], 0.000000, 0.000000, 0.800000, 0.699998);
	PlayerTextDrawSetPreviewVehCol(playerid, InventarPTD[playerid][43], 1, 1);
	PlayerTextDrawShow(playerid, InventarPTD[playerid][43]);
	PlayerTextID[playerid][PlayerText:InventarPTD[playerid][43]] = 105;

	format(gString, 20, "%s%02.2f%%", PlayerInfo[playerid][pHunger] > 80.0?("~r~"):("~w~"), 100.0-PlayerInfo[playerid][pHunger]);
	InventarPTD[playerid][44] = CreatePlayerTextDraw(playerid, 264.400329, 251.687500, PlayerInfo[playerid][pHunger] >= 100.0?("~r~00.00%"):gString);
	PlayerTextDrawLetterSize(playerid, InventarPTD[playerid][44], 0.166997, 0.895623);
	PlayerTextDrawAlignment(playerid, InventarPTD[playerid][44], 3);
	PlayerTextDrawColor(playerid, InventarPTD[playerid][44], -1);
	PlayerTextDrawSetShadow(playerid, InventarPTD[playerid][44], 0);
	PlayerTextDrawSetOutline(playerid, InventarPTD[playerid][44], 0);
	PlayerTextDrawBackgroundColor(playerid, InventarPTD[playerid][44], 255);
	PlayerTextDrawFont(playerid, InventarPTD[playerid][44], 2);
	PlayerTextDrawSetProportional(playerid, InventarPTD[playerid][44], 1);
	PlayerTextDrawSetShadow(playerid, InventarPTD[playerid][44], 0);
	PlayerTextDrawShow(playerid, InventarPTD[playerid][44]);

	format(gString, 20, "%s%02.2f%%", PlayerInfo[playerid][pDrink] > 80.0?("~r~"):("~w~"), 100.0-PlayerInfo[playerid][pDrink]);
	InventarPTD[playerid][45] = CreatePlayerTextDraw(playerid, 284.700317, 251.250000, PlayerInfo[playerid][pDrink] >= 100.0?("~r~00.00%"):gString);
	PlayerTextDrawLetterSize(playerid, InventarPTD[playerid][45], 0.166997, 0.895623);
	PlayerTextDrawAlignment(playerid, InventarPTD[playerid][45], 1);
	PlayerTextDrawColor(playerid, InventarPTD[playerid][45], -1);
	PlayerTextDrawSetShadow(playerid, InventarPTD[playerid][45], 0);
	PlayerTextDrawSetOutline(playerid, InventarPTD[playerid][45], 0);
	PlayerTextDrawBackgroundColor(playerid, InventarPTD[playerid][45], 255);
	PlayerTextDrawFont(playerid, InventarPTD[playerid][45], 2);
	PlayerTextDrawSetProportional(playerid, InventarPTD[playerid][45], 1);
	PlayerTextDrawSetShadow(playerid, InventarPTD[playerid][45], 0);
	PlayerTextDrawShow(playerid, InventarPTD[playerid][45]);

	InventarPTD[playerid][46] = CreatePlayerTextDraw(playerid, 274.000000, 127.000000, GetName(playerid));
	PlayerTextDrawLetterSize(playerid, InventarPTD[playerid][46], 0.238000, 1.236875);
	PlayerTextDrawAlignment(playerid, InventarPTD[playerid][46], 2);
	PlayerTextDrawColor(playerid, InventarPTD[playerid][46], -1);
	PlayerTextDrawSetShadow(playerid, InventarPTD[playerid][46], 0);
	PlayerTextDrawSetOutline(playerid, InventarPTD[playerid][46], 0);
	PlayerTextDrawBackgroundColor(playerid, InventarPTD[playerid][46], 255);
	PlayerTextDrawFont(playerid, InventarPTD[playerid][46], 2);
	PlayerTextDrawSetProportional(playerid, InventarPTD[playerid][46], 1);
	PlayerTextDrawSetShadow(playerid, InventarPTD[playerid][46], 0);
	PlayerTextDrawShow(playerid, InventarPTD[playerid][46]);

	invPage[playerid] = false; invInfo[playerid][0] = -1; invInfo[playerid][1] = -1;

	for(new i=0;i<9;i++) TextDrawShowForPlayer(playerid, InventarTD[i]);
	SelectTextDraw(playerid, 0x489327FF);
	player_selected[playerid] = 14;
	return true;
}

hideInvInfo(playerid) {
	for(new i=0;i<7;i++) PlayerTextDrawDestroy(playerid, invInfoPTD[playerid][i]), invInfoPTD[playerid][i] = PlayerText:INVALID_TEXT_DRAW;
	PlayerTextDrawSetSelectable(playerid, InventarPTD[playerid][invInfo[playerid][0]], true);
	PlayerTextDrawShow(playerid, InventarPTD[playerid][invInfo[playerid][0]]);
	if(InventarValPTD[playerid][invInfo[playerid][0]] != PlayerText:INVALID_TEXT_DRAW) PlayerTextDrawShow(playerid, InventarValPTD[playerid][invInfo[playerid][0]]);
	invInfo[playerid][0] = -1;
	invInfo[playerid][1] = -1;
	return true;
}

std::GivePlayerSkin(playerid, skin) {
	new x=-1;
	while(++x<MAX_ITEMS) if !PlayerInfo[playerid][pItems][x] *then break;
	PlayerInfo[playerid][pItems][x] += skin;
	PlayerInfo[playerid][pItemType][x] = 200;
	return true;
}

stock GetInventarItems(playerid) {
	new x=0;
	for(new i=0;i<MAX_ITEMS;i++) if(PlayerInfo[playerid][pItems][i]) x++;
	return x;
}

stock RemovePlayerSkin(playerid, skin) {
	new x;
	while(x<MAX_INVENTAR_ITEMS) {
		if(PlayerInfo[playerid][pType]==200&&PlayerInfo[playerid][pItems]==skin) {
			PlayerInfo[playerid][pItems][x] = 0;
			PlayerInfo[playerid][pItemType][x] = -1;
			break;
		}
		x++;
	}
	return true;
}

FreshInventar(playerid, bool:enable) {
	if(invInfo[playerid][0] != -1) {
		for(new i=0;i<7;i++) PlayerTextDrawDestroy(playerid, invInfoPTD[playerid][i]), invInfoPTD[playerid][i] = PlayerText:INVALID_TEXT_DRAW;
		PlayerTextDrawSetSelectable(playerid, InventarPTD[playerid][invInfo[playerid][0]], true);
		PlayerTextDrawShow(playerid, InventarPTD[playerid][invInfo[playerid][0]]);
	}
	for(new z=0,r,rx;z<MAX_INVENTAR_ITEMS;z++) {
		r = z+(enable?36:0), rx=PlayerInfo[playerid][pItemType][r];
		if(rx<200) {
			PlayerTextDrawSetPreviewModel(playerid, InventarPTD[playerid][z], SlotInfo[rx][SLOT_OBJECT]);
			PlayerTextDrawSetPreviewRot(playerid, InventarPTD[playerid][z], SlotInfo[rx][SLOT_POS][0], SlotInfo[rx][SLOT_POS][1], SlotInfo[rx][SLOT_POS][2], SlotInfo[rx][SLOT_POS][3]);
			PlayerTextDrawBackgroundColor(playerid, InventarPTD[playerid][z], 858993663);
		} else {
			PlayerTextDrawSetPreviewModel(playerid, InventarPTD[playerid][z], PlayerInfo[playerid][pItems][r]);
			PlayerTextDrawSetPreviewRot(playerid, InventarPTD[playerid][z], 0.0, 0.0, 0.0, 0.9);		
		 	PlayerTextDrawBackgroundColor(playerid, InventarPTD[playerid][z], GetSkinColor(PlayerInfo[playerid][pItems][r]));	
		}
		PlayerTextDrawShow(playerid, InventarPTD[playerid][z]);
		if(InventarValPTD[playerid][z] != PlayerText:INVALID_TEXT_DRAW) PlayerTextDrawDestroy(playerid, InventarValPTD[playerid][z]), InventarValPTD[playerid][z] = PlayerText:INVALID_TEXT_DRAW;
		if(PlayerInfo[playerid][pItems][r]<2) continue;
		format(gString, 20, "%s%d", rx<200?(""):("ID: "), PlayerInfo[playerid][pItems][r]);
		InventarValPTD[playerid][z] = CreatePlayerTextDraw(playerid, 363.599700 + ((z%6) * 33.000000), 169.300018 + ((z/6) * 31.9375), gString);
		PlayerTextDrawLetterSize(playerid, InventarValPTD[playerid][z], 0.155500, 1.013749);
		PlayerTextDrawAlignment(playerid, InventarValPTD[playerid][z], 3);
		PlayerTextDrawColor(playerid, InventarValPTD[playerid][z], -1);
		PlayerTextDrawSetShadow(playerid, InventarValPTD[playerid][z], 0);
		PlayerTextDrawSetOutline(playerid, InventarValPTD[playerid][z], 0);
		PlayerTextDrawBackgroundColor(playerid, InventarValPTD[playerid][z], 255);
		PlayerTextDrawFont(playerid, InventarValPTD[playerid][z], 2);
		PlayerTextDrawSetProportional(playerid, InventarValPTD[playerid][z], 1);
		PlayerTextDrawSetShadow(playerid, InventarValPTD[playerid][z], 0);
		PlayerTextDrawShow(playerid, InventarValPTD[playerid][z]);	
	}
	PlayerTextDrawColor(playerid, InventarPTD[playerid][36], enable?858993663:0x489327FF);
	PlayerTextDrawColor(playerid, InventarPTD[playerid][37], enable?0x489327FF:858993663);
	PlayerTextDrawSetSelectable(playerid, InventarPTD[playerid][36], enable?true:false);
	PlayerTextDrawSetSelectable(playerid, InventarPTD[playerid][37], enable?false:true);
	PlayerTextDrawShow(playerid, InventarPTD[playerid][36]);
	PlayerTextDrawShow(playerid, InventarPTD[playerid][37]);
	invPage[playerid] = enable;
	return true;
}

stock RemoveItem(playerid, slot) {
	new x=slot>35?slot%36:slot;
	PlayerInfo[playerid][pItems][slot]--;
	if(!PlayerInfo[playerid][pItems][slot]) {
		PlayerInfo[playerid][pItemSlotType][PlayerInfo[playerid][pItemType][slot]] = -1;
		PlayerInfo[playerid][pItemType][slot] = 0;
	}
	if(player_selected[playerid] != 14 || (x>35?true:false)!=invPage[playerid]) return true;
	switch(PlayerInfo[playerid][pItems][slot]) {
		case 0: {
			PlayerInfo[playerid][pItemSlotType][PlayerInfo[playerid][pItemType][slot]] = -1;
			PlayerInfo[playerid][pItemType][slot] = 0;
			PlayerTextDrawSetPreviewModel(playerid, InventarPTD[playerid][x], SlotInfo[0][SLOT_OBJECT]);
		}
		case 1: PlayerTextDrawDestroy(playerid, InventarValPTD[playerid][x]), InventarValPTD[playerid][x] = PlayerText:INVALID_TEXT_DRAW;
		default: {
			gString[0] = EOS;
			format(gString, 20, "%d", PlayerInfo[playerid][pItems][slot]);
			PlayerTextDrawSetString(playerid, InventarValPTD[playerid][x], gString);
		}
	}
	return true;
}

function RepairKit(playerid, vehicleid, slot) {
	if(vehicleid != GetPlayerVehicleID(playerid))
		return SCM(playerid, COLOR_GREY, "Repararea a fost anulata.");

	SetVehicleHealth(vehicleid, 999.0);
	RepairVehicle(vehicleid);
	GameTextForPlayer(playerid, " ", 100, 1);
	RemoveItem(playerid, slot);
	format(gString, 128, "(Inventory) {FFFFFF}Ai folosit un Repair Kit pentru a repara vehiculul (%d).", vehicleid);
	SCM(playerid, COLOR_LIGHTRED, gString);
	return true;
}

PlayerInventarEx(playerid, PlayerText:playertextid) {
	new z=PlayerTextID[playerid][PlayerText:playertextid], i = z+(invPage[playerid]?36:0), l=invInfo[playerid][0], e = invInfo[playerid][1], y=(z%6),x=(z/6);
	switch(z) {
		case 99: {
			if(e==-1) return true;
			if(InventarDeelay[playerid]>gettime())
				return format(gString, 128, "Asteapta %d secunde pentru a folosi alt item.", InventarDeelay[playerid]-gettime()), SCM(playerid,-1,gString);
			
			new t=PlayerInfo[playerid][pItemType][e]; gString[0] = EOS;
			switch(t) {
				case 1..5: {
					if(PlayerInfo[playerid][pHunger] < 5.0)
						return SCM(playerid, COLOR_GREY, "The food is almost full.");

					new Float:health;
					GetPlayerHealth(playerid, health);
					if(PlayerInfo[playerid][pHunger] < 70.0 && health < 100.0) SetPlayerHealth(playerid, health+25.0>100.0?100.0:health+25.0);
					PlayerInfo[playerid][pHunger] = PlayerInfo[playerid][pHunger]-SlotInfo[t][SLOT_VALUE]<0.0?0.0:PlayerInfo[playerid][pHunger]-SlotInfo[t][SLOT_VALUE];
					format(gString, 15, "%02.2f%%", 100.0-PlayerInfo[playerid][pHunger]);
					PlayerTextDrawSetString(playerid, HungerPTD, gString);
					PlayerTextDrawSetString(playerid, InventarPTD[playerid][44], gString);
					GameTextForPlayer(playerid, "You are eating..", 5000, 1);
					ApplyAnimation(playerid, "FOOD", "EAT_Burger",4.1,0,1,1,0,0);
					InventarDeelay[playerid] = gettime()+5;
					RemoveItem(playerid, e);
				}
				case 6..13: {
					if(PlayerInfo[playerid][pDrink] < 5.0)
						return SCM(playerid, COLOR_GREY, "You have enough water.");

					new Float:health;
					GetPlayerHealth(playerid, health);
					if(PlayerInfo[playerid][pDrink] < 70.0 && health < 100.0) SetPlayerHealth(playerid, health+25.0>100.0?100.0:health+25.0);
					PlayerInfo[playerid][pDrink] = PlayerInfo[playerid][pDrink]-SlotInfo[t][SLOT_VALUE]<0.0?0.0:PlayerInfo[playerid][pDrink]-SlotInfo[t][SLOT_VALUE];
					GameTextForPlayer(playerid, "you drink..", 2000, 1);	
					format(gString, 15, "%02.2f%%", 100.0-PlayerInfo[playerid][pDrink]);
					PlayerTextDrawSetString(playerid, InventarPTD[playerid][45], gString);
					PlayerTextDrawSetString(playerid, DrinkPTD, gString);
					ApplyAnimation( playerid, "VENDING", "VEND_Drink_P", 4.0, 0, 0, 0, 0, 0 );
					RemoveItem(playerid, e);	
					InventarDeelay[playerid] = gettime()+2;			
				}
				case 19: {
					new vehicleid = GetPlayerVehicleID(playerid);
					if(!vehicleid)
						return SCM(playerid, COLOR_GREY, "Nu esti intr-un vehicul.");

					if(Engine[vehicleid]) return SCM(playerid, COLOR_GREY, "Opreste motoru pentru a folosii acest item.");
					new Float:health;
					GetVehicleHealth(vehicleid, health);
					if(health > 800) return SCM(playerid, COLOR_GREY, "Poti folosii acest item la mai putin de 800 HP.");
					GameTextForPlayer(playerid, "repair...", 11000, 1);
					SetTimerEx("RepairKit", 10000, false, "iii", playerid, vehicleid, e);
					InventarDeelay[playerid] = gettime()+10;
				}
				case 20: {
					RemoveItem(playerid, e);
					PlayerTextDrawSetPreviewModel(playerid, InventarPTD[playerid][39], 3003);
					PlayerTextDrawShow(playerid, InventarPTD[playerid][39]);
					PlayerInfo[playerid][pAttached][0]=20;
					SetPlayerAttachedObject(playerid, 1, 3003, 2, 0.0519, 0.0220, 0.0000, 0.0000, 0.0000, 0.0000, 3.8810, 3.9610, 3.4450);
					SetPlayerAttachedObject(playerid, 2, 3003, 2, 0.2379, 0.0350, -0.0779, 0.0000, 8.5999, 0.0000, 3.7459, 1.0000, 1.0000);
					SetPlayerAttachedObject(playerid, 3, 3003, 2, 0.2149, 0.0000, 0.1019, 0.0000, -11.8000, 0.0000, 4.0240, 1.0000, 1.0000);
					SetPlayerAttachedObject(playerid, 4, 3106, 2, 0.0919, 0.1229, 0.0539, 0.0000, 0.0000, 0.0000, 0.9120, 1.0000, 0.6990);
					SetPlayerAttachedObject(playerid, 5, 3106, 2, 0.1019, 0.1259, -0.0410, 0.0000, 0.0000, 0.0000, 0.9070, 1.0000, 0.7219);
					_query(128, "UPDATE `users` SET `Attached` = '%i|%i|%i|%i' WHERE `id` = '%i'", PlayerInfo[playerid][pAttached][0], PlayerInfo[playerid][pAttached][1], PlayerInfo[playerid][pAttached][2], PlayerInfo[playerid][pAttached][3], PlayerInfo[playerid][pSQLID]);
				}
				case 200: {
					if(PlayerVar[playerid][Duty]) return true;

					new mod = PlayerInfo[playerid][pItems][e];
					if(PlayerInfo[playerid][pModel] != (PlayerInfo[playerid][pGender]?18:63)) {
						PlayerInfo[playerid][pItems][e] = PlayerInfo[playerid][pModel];
						PlayerTextDrawBackgroundColor(playerid, InventarPTD[playerid][l], GetSkinColor(PlayerInfo[playerid][pItems][e]));
						PlayerTextDrawSetPreviewModel(playerid, InventarPTD[playerid][l], PlayerInfo[playerid][pModel]);
						PlayerTextDrawShow(playerid, InventarPTD[playerid][l]);		
						format(gString, 25, "ID: %d", PlayerInfo[playerid][pModel]);
						PlayerTextDrawSetString(playerid, InventarValPTD[playerid][l], gString);	
					}
					else {
						PlayerInfo[playerid][pItems][e] = 0;
						PlayerInfo[playerid][pItemType][e] = 0;
						PlayerTextDrawBackgroundColor(playerid, InventarPTD[playerid][l], 858993663);
						PlayerTextDrawSetPreviewModel(playerid, InventarPTD[playerid][l], 18685);
						PlayerTextDrawShow(playerid, InventarPTD[playerid][l]);
						PlayerTextDrawDestroy(playerid, InventarValPTD[playerid][l]), InventarValPTD[playerid][l] = PlayerText:INVALID_TEXT_DRAW;
					}
					PlayerInfo[playerid][pModel] = mod;
					SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
					UpdateVar(playerid, "Model", PlayerInfo[playerid][pModel]);
					if(IsPlayerInAnyVehicle(playerid)) {
						SetPlayerPose(playerid, 0, 0, 5);
						PutPlayerInVehicle(playerid, GetPlayerVehicleID(playerid), GetPlayerVehicleSeat(playerid));
					}
					PlayerTextDrawSetPreviewModel(playerid, InventarPTD[playerid][38], PlayerInfo[playerid][pModel]);
					PlayerTextDrawShow(playerid, InventarPTD[playerid][38]);
					PlayerTextDrawSetPreviewModel(playerid, InventarPTD[playerid][43], 11745);
					PlayerTextDrawShow(playerid, InventarPTD[playerid][43]);
					format(gString, 128, "(Inventory) {FFFFFF}Ti-ai schimbat skinu in %d.", PlayerInfo[playerid][pModel]);
					SCM(playerid,COLOR_LIGHTRED,gString);
				}
			}
			hideInvInfo(playerid);
			return true;
		}
		case 100: return hideInvInfo(playerid);
		case 101: return hideInvInfo(playerid);
		case 102: return FreshInventar(playerid, false);
		case 103: return FreshInventar(playerid, true);
		case 104: return true;
		case 105: {
			if(PlayerVar[playerid][Duty]) return true;
			if(PlayerInfo[playerid][pModel] == (PlayerInfo[playerid][pGender]?18:63)) return true;
			PlayerTextDrawSetPreviewModel(playerid, InventarPTD[playerid][43], 18685);
			PlayerTextDrawShow(playerid, InventarPTD[playerid][43]);
			new n=0,nx;
			while(n!=MAX_ITEMS) {
				if(!PlayerInfo[playerid][pItems][n]) break;
				n++;
			}
			PlayerInfo[playerid][pItems][n] = PlayerInfo[playerid][pModel];
			PlayerInfo[playerid][pItemType][n] = 200;
			nx = (invPage[playerid]?36:0)+n;
			PlayerInfo[playerid][pModel] = PlayerInfo[playerid][pGender]?18:63;
			SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
			if(IsPlayerInAnyVehicle(playerid)) {
				SetPlayerPose(playerid, 0, 0, 1);
				PutPlayerInVehicle(playerid, GetPlayerVehicleID(playerid), GetPlayerVehicleSeat(playerid));
			}
			UpdateVar(playerid, "Model", PlayerInfo[playerid][pModel]);
			PlayerTextDrawSetPreviewModel(playerid, InventarPTD[playerid][38], PlayerInfo[playerid][pModel]);
			PlayerTextDrawShow(playerid, InventarPTD[playerid][38]);
			format(gString, 128, "(Inventory) {FFFFFF}Skinul %d a fost scos.", PlayerInfo[playerid][pItems][n]);
			SCM(playerid, COLOR_LIGHTRED, gString);
			if((n>35?true:false)!=invPage[playerid]) return true;
			PlayerTextDrawSetPreviewRot(playerid, InventarPTD[playerid][nx], 0.0, 0.0, 0.0, 0.9);
			PlayerTextDrawSetPreviewModel(playerid, InventarPTD[playerid][nx], PlayerInfo[playerid][pItems][n]);
			gString[0] = EOS;
			PlayerTextDrawBackgroundColor(playerid, InventarPTD[playerid][nx], GetSkinColor(PlayerInfo[playerid][pItems][n]));
			format(gString, 20, "ID: %d", PlayerInfo[playerid][pItems][n]);
			InventarValPTD[playerid][nx] = CreatePlayerTextDraw(playerid, 363.599700 + ((n%6) * 33.000000), 169.300018 + ((n/6) * 31.9375), gString);
			PlayerTextDrawLetterSize(playerid, InventarValPTD[playerid][nx], 0.155500, 1.013749);
			PlayerTextDrawAlignment(playerid, InventarValPTD[playerid][nx], 3);
			PlayerTextDrawColor(playerid, InventarValPTD[playerid][nx], -1);
			PlayerTextDrawSetShadow(playerid, InventarValPTD[playerid][nx], 0);
			PlayerTextDrawSetOutline(playerid, InventarValPTD[playerid][nx], 0);
			PlayerTextDrawBackgroundColor(playerid, InventarValPTD[playerid][nx], 255);
			PlayerTextDrawFont(playerid, InventarValPTD[playerid][nx], 2);
			PlayerTextDrawSetProportional(playerid, InventarValPTD[playerid][nx], 1);
			PlayerTextDrawSetShadow(playerid, InventarValPTD[playerid][nx], 0);
			PlayerTextDrawShow(playerid, InventarValPTD[playerid][nx]);				
			PlayerTextDrawShow(playerid, InventarPTD[playerid][nx]);
			return true;
		}
		case 106: {
			if PlayerInfo[playerid][pAttached][0]==-1 *then return true;
			RemovePlayerAttachedObject(playerid, 1);
			RemovePlayerAttachedObject(playerid, 2);
			RemovePlayerAttachedObject(playerid, 3);
			RemovePlayerAttachedObject(playerid, 4);
			RemovePlayerAttachedObject(playerid, 5);
			PlayerInfo[playerid][pAttached][0]=-1;
			PlayerTextDrawSetPreviewModel(playerid, InventarPTD[playerid][39], 18685);
			PlayerTextDrawShow(playerid, InventarPTD[playerid][39]);
			AddItemToInventar(playerid, 19, _ItemType(playerid, 20));
			_query(128, "UPDATE `users` SET `Attached` = '%i|%i|%i|%i' WHERE `id` = '%i'", PlayerInfo[playerid][pAttached][0], PlayerInfo[playerid][pAttached][1], PlayerInfo[playerid][pAttached][2], PlayerInfo[playerid][pAttached][3], PlayerInfo[playerid][pSQLID]);
			return true;
		}
	}
	if(e != -1) {
		if(PlayerVar[playerid][Duty]) return true;
		if(invInfoPTD[playerid][0]!=PlayerText:INVALID_TEXT_DRAW) hideInvInfo(playerid);
		else invInfo[playerid][0] = invInfo[playerid][1] = -1;
		new rr = PlayerInfo[playerid][pItems][i], ll = PlayerInfo[playerid][pItemType][i], llx=PlayerInfo[playerid][pItemType][e], tr = PlayerInfo[playerid][pItemType][e];
	 	PlayerInfo[playerid][pItems][i] = PlayerInfo[playerid][pItems][e];
		PlayerInfo[playerid][pItemType][i] = PlayerInfo[playerid][pItemType][e];
		PlayerInfo[playerid][pItemType][e] = ll;
		PlayerInfo[playerid][pItems][e] = rr;
		if(llx<200&&ll!=0&&ll==200) PlayerInfo[playerid][pItemSlotType][llx] = i;
		if(ll<200&&ll!=0&&llx==200) PlayerInfo[playerid][pItemSlotType][ll] = e;
		else {
			PlayerInfo[playerid][pItemSlotType][llx>=200?llx-200:llx] = i;
			PlayerInfo[playerid][pItemSlotType][ll>=200?ll-200:ll] = e;
		}
		if(PlayerInfo[playerid][pItemType][i]<200) {
			PlayerTextDrawSetPreviewModel(playerid, InventarPTD[playerid][z], SlotInfo[tr][SLOT_OBJECT]);
			PlayerTextDrawSetPreviewRot(playerid, InventarPTD[playerid][z], SlotInfo[tr][SLOT_POS][0], SlotInfo[tr][SLOT_POS][1], SlotInfo[tr][SLOT_POS][2], SlotInfo[tr][SLOT_POS][3]);
			PlayerTextDrawBackgroundColor(playerid, InventarPTD[playerid][z], 858993663);
		} else {
			PlayerTextDrawSetPreviewModel(playerid, InventarPTD[playerid][z], PlayerInfo[playerid][pItems][i]);
			PlayerTextDrawSetPreviewRot(playerid, InventarPTD[playerid][z], 0.0, 0.0, 0.0, 0.9);			
			PlayerTextDrawBackgroundColor(playerid, InventarPTD[playerid][z], GetSkinColor(PlayerInfo[playerid][pItems][i]));
		}
		PlayerTextDrawShow(playerid, InventarPTD[playerid][z]);
		if(PlayerInfo[playerid][pItems][i]>1||PlayerInfo[playerid][pItemType][i]==200) {
			format(gString, 20, "%s%d", PlayerInfo[playerid][pItemType][i]<200?(""):("ID: "), PlayerInfo[playerid][pItems][i]);
			if(InventarValPTD[playerid][z]!=PlayerText:INVALID_TEXT_DRAW) PlayerTextDrawSetString(playerid, InventarValPTD[playerid][z], gString);
			else {
				InventarValPTD[playerid][z] = CreatePlayerTextDraw(playerid, 363.599700 + (y * 33.000000), 169.300018 + (x * 31.9375), gString);
				PlayerTextDrawLetterSize(playerid, InventarValPTD[playerid][z], 0.155500, 1.013749);
				PlayerTextDrawAlignment(playerid, InventarValPTD[playerid][z], 3);
				PlayerTextDrawColor(playerid, InventarValPTD[playerid][z], -1);
				PlayerTextDrawSetShadow(playerid, InventarValPTD[playerid][z], 0);
				PlayerTextDrawSetOutline(playerid, InventarValPTD[playerid][z], 0);
				PlayerTextDrawBackgroundColor(playerid, InventarValPTD[playerid][z], 255);
				PlayerTextDrawFont(playerid, InventarValPTD[playerid][z], 2);
				PlayerTextDrawSetProportional(playerid, InventarValPTD[playerid][z], 1);
				PlayerTextDrawSetShadow(playerid, InventarValPTD[playerid][z], 0);
				PlayerTextDrawShow(playerid, InventarValPTD[playerid][z]);			
			}
		}
		if((e>35?true:false)!=invPage[playerid]) return true;
		if(PlayerInfo[playerid][pItemType][e]<200) {
			new nrx = PlayerInfo[playerid][pItemType][e];
			PlayerTextDrawSetPreviewModel(playerid, InventarPTD[playerid][l], SlotInfo[nrx][SLOT_OBJECT]);
			PlayerTextDrawSetPreviewRot(playerid, InventarPTD[playerid][l], SlotInfo[nrx][SLOT_POS][0], SlotInfo[nrx][SLOT_POS][1], SlotInfo[nrx][SLOT_POS][2], SlotInfo[nrx][SLOT_POS][3]);
			PlayerTextDrawBackgroundColor(playerid, InventarPTD[playerid][l], 858993663);
		} else {
			PlayerTextDrawSetPreviewModel(playerid, InventarPTD[playerid][l], PlayerInfo[playerid][pItems][e]);
			PlayerTextDrawSetPreviewRot(playerid, InventarPTD[playerid][l], 0.0, 0.0, 0.0, 0.9);			
			PlayerTextDrawBackgroundColor(playerid, InventarPTD[playerid][l], GetSkinColor(PlayerInfo[playerid][pItems][e]));
		}
		PlayerTextDrawShow(playerid, InventarPTD[playerid][l]);
		if(PlayerInfo[playerid][pItems][e]>1||PlayerInfo[playerid][pItemType][e]==200) {
			format(gString, 20, "%s%d", PlayerInfo[playerid][pItemType][e]<200?(""):("ID: "), PlayerInfo[playerid][pItems][e]);
			if(InventarValPTD[playerid][l]!=PlayerText:INVALID_TEXT_DRAW) PlayerTextDrawSetString(playerid, InventarValPTD[playerid][l], gString);
			else {
				InventarValPTD[playerid][l] = CreatePlayerTextDraw(playerid, 363.599700 + ((l%6) * 33.000000), 169.300018 + ((l/6) * 31.9375), gString);
				PlayerTextDrawLetterSize(playerid, InventarValPTD[playerid][l], 0.155500, 1.013749);
				PlayerTextDrawAlignment(playerid, InventarValPTD[playerid][l], 3);
				PlayerTextDrawColor(playerid, InventarValPTD[playerid][l], -1);
				PlayerTextDrawSetShadow(playerid, InventarValPTD[playerid][l], 0);
				PlayerTextDrawSetOutline(playerid, InventarValPTD[playerid][l], 0);
				PlayerTextDrawBackgroundColor(playerid, InventarValPTD[playerid][l], 255);
				PlayerTextDrawFont(playerid, InventarValPTD[playerid][l], 2);
				PlayerTextDrawSetProportional(playerid, InventarValPTD[playerid][l], 1);
				PlayerTextDrawSetShadow(playerid, InventarValPTD[playerid][l], 0);
				PlayerTextDrawShow(playerid, InventarValPTD[playerid][l]);	
			}
		} else if(InventarValPTD[playerid][l]!=PlayerText:INVALID_TEXT_DRAW) PlayerTextDrawDestroy(playerid, InventarValPTD[playerid][l]), InventarValPTD[playerid][l] = PlayerText:INVALID_TEXT_DRAW;
		return true;
	}
	if(!PlayerInfo[playerid][pItems][i]) return true;
	invInfo[playerid][0] = z; invInfo[playerid][1] = i;

	PlayerTextDrawSetSelectable(playerid, playertextid, false);
	PlayerTextDrawShow(playerid, playertextid);
	if(InventarValPTD[playerid][z] != PlayerText:INVALID_TEXT_DRAW) PlayerTextDrawHide(playerid, InventarValPTD[playerid][z]);

	invInfoPTD[playerid][0] = CreatePlayerTextDraw(playerid, 324.200042 + (y * 33.000000), 162.949737 + (x * 31.9375), "ld_spac:white");
	PlayerTextDrawLetterSize(playerid, invInfoPTD[playerid][0], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, invInfoPTD[playerid][0], 47.919677, 49.359939);
	PlayerTextDrawAlignment(playerid, invInfoPTD[playerid][0], 1);
	PlayerTextDrawColor(playerid, invInfoPTD[playerid][0], 0x11111160);
	PlayerTextDrawSetShadow(playerid, invInfoPTD[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, invInfoPTD[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, invInfoPTD[playerid][0], 255);
	PlayerTextDrawFont(playerid, invInfoPTD[playerid][0], 4);
	PlayerTextDrawSetProportional(playerid, invInfoPTD[playerid][0], 0);
	PlayerTextDrawSetShadow(playerid, invInfoPTD[playerid][0], 0);

	invInfoPTD[playerid][1] = CreatePlayerTextDraw(playerid, 325.999969 + (y * 33.000000), 164.162231 + (x * 31.9375), "ld_spac:white");
	PlayerTextDrawLetterSize(playerid, invInfoPTD[playerid][1], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, invInfoPTD[playerid][1], 45.000000, 15.000000);
	PlayerTextDrawAlignment(playerid, invInfoPTD[playerid][1], 1);
	PlayerTextDrawColor(playerid, invInfoPTD[playerid][1], 858993663);
	PlayerTextDrawSetShadow(playerid, invInfoPTD[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, invInfoPTD[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, invInfoPTD[playerid][1], 255);
	PlayerTextDrawFont(playerid, invInfoPTD[playerid][1], 4);
	PlayerTextDrawSetProportional(playerid, invInfoPTD[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, invInfoPTD[playerid][1], 0);
	PlayerTextDrawSetSelectable(playerid, invInfoPTD[playerid][1], true);
	PlayerTextID[playerid][PlayerText:invInfoPTD[playerid][1]] = 99;

	invInfoPTD[playerid][2] = CreatePlayerTextDraw(playerid, 325.999969 + (y * 33.000000), 179.849700 + (x * 31.9375), "ld_spac:white");
	PlayerTextDrawLetterSize(playerid, invInfoPTD[playerid][2], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, invInfoPTD[playerid][2], 45.000000, 15.000000);
	PlayerTextDrawAlignment(playerid, invInfoPTD[playerid][2], 1);
	PlayerTextDrawColor(playerid, invInfoPTD[playerid][2], 858993663);
	PlayerTextDrawSetShadow(playerid, invInfoPTD[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, invInfoPTD[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, invInfoPTD[playerid][2], 255);
	PlayerTextDrawFont(playerid, invInfoPTD[playerid][2], 4);
	PlayerTextDrawSetProportional(playerid, invInfoPTD[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, invInfoPTD[playerid][2], 0);
	PlayerTextDrawSetSelectable(playerid, invInfoPTD[playerid][2], true);
	PlayerTextID[playerid][PlayerText:invInfoPTD[playerid][2]] = 100;

	invInfoPTD[playerid][3] = CreatePlayerTextDraw(playerid, 325.999969 + (y * 33.000000), 195.599700 + (x * 31.9375), "ld_spac:white");
	PlayerTextDrawLetterSize(playerid, invInfoPTD[playerid][3], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, invInfoPTD[playerid][3], 45.000000, 15.000000);
	PlayerTextDrawAlignment(playerid, invInfoPTD[playerid][3], 1);
	PlayerTextDrawColor(playerid, invInfoPTD[playerid][3], -1539424513);
	PlayerTextDrawSetShadow(playerid, invInfoPTD[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, invInfoPTD[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, invInfoPTD[playerid][3], 255);
	PlayerTextDrawFont(playerid, invInfoPTD[playerid][3], 4);
	PlayerTextDrawSetProportional(playerid, invInfoPTD[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, invInfoPTD[playerid][3], 0);
	PlayerTextDrawSetSelectable(playerid, invInfoPTD[playerid][3], true);
	PlayerTextID[playerid][PlayerText:invInfoPTD[playerid][3]] = 101;

	invInfoPTD[playerid][4] = CreatePlayerTextDraw(playerid, 342.100067 + (y * 33.000000), 166.812500 + (x * 31.9375), PlayerInfo[playerid][pItemType][i]!=200?"USE":"PUT");
	PlayerTextDrawLetterSize(playerid, invInfoPTD[playerid][4], 0.166499, 1.009375);
	PlayerTextDrawAlignment(playerid, invInfoPTD[playerid][4], 1);
	PlayerTextDrawColor(playerid, invInfoPTD[playerid][4], -1061109505);
	PlayerTextDrawSetShadow(playerid, invInfoPTD[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, invInfoPTD[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, invInfoPTD[playerid][4], 255);
	PlayerTextDrawFont(playerid, invInfoPTD[playerid][4], 2);
	PlayerTextDrawSetProportional(playerid, invInfoPTD[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, invInfoPTD[playerid][4], 0);

	invInfoPTD[playerid][5] = CreatePlayerTextDraw(playerid, 340.700042 + (y * 33.000000), 182.099945 + (x * 31.9375), "Info");
	PlayerTextDrawLetterSize(playerid, invInfoPTD[playerid][5], 0.166499, 1.009375);
	PlayerTextDrawAlignment(playerid, invInfoPTD[playerid][5], 1);
	PlayerTextDrawColor(playerid, invInfoPTD[playerid][5], -1061109505);
	PlayerTextDrawSetShadow(playerid, invInfoPTD[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, invInfoPTD[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, invInfoPTD[playerid][5], 255);
	PlayerTextDrawFont(playerid, invInfoPTD[playerid][5], 2);
	PlayerTextDrawSetProportional(playerid, invInfoPTD[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, invInfoPTD[playerid][5], 0);

	invInfoPTD[playerid][6] = CreatePlayerTextDraw(playerid, 338.200042 + (y * 33.000000), 197.849945 + (x * 31.9375), "close");
	PlayerTextDrawLetterSize(playerid, invInfoPTD[playerid][6], 0.166499, 1.009375);
	PlayerTextDrawAlignment(playerid, invInfoPTD[playerid][6], 1);
	PlayerTextDrawColor(playerid, invInfoPTD[playerid][6], -1061109505);
	PlayerTextDrawSetShadow(playerid, invInfoPTD[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, invInfoPTD[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, invInfoPTD[playerid][6], 255);
	PlayerTextDrawFont(playerid, invInfoPTD[playerid][6], 2);
	PlayerTextDrawSetProportional(playerid, invInfoPTD[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, invInfoPTD[playerid][6], 0);

	for(new rx=0;rx<7;rx++) PlayerTextDrawShow(playerid, invInfoPTD[playerid][rx]);
	return true;
}

//////////////////////////////////////////////////
////////// Shoping ///////////////////////////////
//////////////////////////////////////////////////

loadShop(playerid, type) {
	if(player_selected[playerid] != 0) return true;
	PlayerShop[playerid] = type; gString[0] = EOS; player_selected[playerid] = 15;
	SelectTextDraw(playerid, 0x489327FF);
	PlayerTextDrawHide(playerid, PlayerLogo);
	PlayerTextDrawHide(playerid, HungerPTD);
	PlayerTextDrawHide(playerid, DrinkPTD);
	TextDrawHideForPlayer(playerid, DrinkTD);
	TextDrawHideForPlayer(playerid, HungerTD);
	for(new d=0;d<3;d++) TextDrawHideForPlayer(playerid, DataT[d]);
	new z=0,r,x,y;
	for(new i=0;i<5;i++) TextDrawShowForPlayer(playerid, InventarTD[i]);
	for(new i=0;i<7;i++) TextDrawShowForPlayer(playerid, ShopTD[i]);
	if(type!=3) {
		for(y=0;y<6;y++) {
			for(x=0;x<5;x++) {
				r=z+ShopMax[type][0];
				ShopPTD[playerid][z] = CreatePlayerTextDraw(playerid, 158.799926 + (x * 33.000000), 147.787780 + (y * 31.9375), "");
				PlayerTextDrawLetterSize(playerid, ShopPTD[playerid][z], 0.000000, 0.000000);
				PlayerTextDrawTextSize(playerid, ShopPTD[playerid][z], 32.000000, 31.000000);
				PlayerTextDrawAlignment(playerid, ShopPTD[playerid][z], 1);
				PlayerTextDrawColor(playerid, ShopPTD[playerid][z], -1);
				PlayerTextDrawSetShadow(playerid, ShopPTD[playerid][z], 0);
				PlayerTextDrawSetOutline(playerid, ShopPTD[playerid][z], 0);
				if(r>ShopMax[type][1]) {
					PlayerTextDrawBackgroundColor(playerid, ShopPTD[playerid][z], 0x1F1F1FFF);
					PlayerTextDrawSetPreviewRot(playerid, ShopPTD[playerid][z], 0.000000, 0.000000, 0.800000, 0.699998);
					PlayerTextDrawSetPreviewModel(playerid, ShopPTD[playerid][z], 18685);
					PlayerTextDrawSetSelectable(playerid, ShopPTD[playerid][z], false);	
				}
				else {
					PlayerTextDrawBackgroundColor(playerid, ShopPTD[playerid][z], 0x333333FF);
					PlayerTextDrawSetPreviewRot(playerid, ShopPTD[playerid][z], ItemInfo[r][ITEM_POS][0], ItemInfo[r][ITEM_POS][1], ItemInfo[r][ITEM_POS][2], ItemInfo[r][ITEM_POS][3]);
					PlayerTextDrawSetPreviewModel(playerid, ShopPTD[playerid][z], ItemInfo[r][ITEM_OBJECT]);

					format(gString, 20, "~g~$%d", ItemInfo[r][ITEM_PRICE]);
					ShopPricePTD[playerid][z] = CreatePlayerTextDraw(playerid, 190.099914+ (x * 33.000000), 169.949951 + (y * 31.9375), gString);
					PlayerTextDrawLetterSize(playerid, ShopPricePTD[playerid][z], 0.155500, 1.013749);
					PlayerTextDrawAlignment(playerid, ShopPricePTD[playerid][z], 3);
					PlayerTextDrawColor(playerid, ShopPricePTD[playerid][z], -1);
					PlayerTextDrawSetShadow(playerid, ShopPricePTD[playerid][z], 0);
					PlayerTextDrawSetOutline(playerid, ShopPricePTD[playerid][z], 0);
					PlayerTextDrawBackgroundColor(playerid, ShopPricePTD[playerid][z], 255);
					PlayerTextDrawFont(playerid, ShopPricePTD[playerid][z], 2);
					PlayerTextDrawSetProportional(playerid, ShopPricePTD[playerid][z], 1);
					PlayerTextDrawSetShadow(playerid, ShopPricePTD[playerid][z], 0);
					PlayerTextDrawShow(playerid, ShopPricePTD[playerid][z]);
					PlayerTextDrawSetSelectable(playerid, ShopPTD[playerid][z], true);	
				}
				PlayerTextDrawFont(playerid, ShopPTD[playerid][z], 5);
				PlayerTextDrawSetProportional(playerid, ShopPTD[playerid][z], 0);
				PlayerTextDrawSetShadow(playerid, ShopPTD[playerid][z], 0);
				PlayerTextDrawSetPreviewVehCol(playerid, ShopPTD[playerid][z], 1, 1);
				PlayerTextDrawShow(playerid, ShopPTD[playerid][z]);		
				PlayerTextID[playerid][PlayerText:ShopPTD[playerid][z]] = z;
				z++;
			}
		}
	} else {
		r = sizeof(normalskin);
		for(y=0;y<6;y++) {
			for(x=0;x<5;x++) {
				ShopPTD[playerid][z] = CreatePlayerTextDraw(playerid, 158.799926 + (x * 33.000000), 147.787780 + (y * 31.9375), "");
				PlayerTextDrawLetterSize(playerid, ShopPTD[playerid][z], 0.000000, 0.000000);
				PlayerTextDrawTextSize(playerid, ShopPTD[playerid][z], 32.000000, 31.000000);
				PlayerTextDrawAlignment(playerid, ShopPTD[playerid][z], 1);
				PlayerTextDrawColor(playerid, ShopPTD[playerid][z], -1);
				PlayerTextDrawSetShadow(playerid, ShopPTD[playerid][z], 0);
				PlayerTextDrawSetOutline(playerid, ShopPTD[playerid][z], 0);
				if(z>=r) {
					PlayerTextDrawBackgroundColor(playerid, ShopPTD[playerid][z], 0x1F1F1FFF);
					PlayerTextDrawSetPreviewRot(playerid, ShopPTD[playerid][z], 0.000000, 0.000000, 0.800000, 0.900000);
					PlayerTextDrawSetPreviewModel(playerid, ShopPTD[playerid][z], 18685);
					PlayerTextDrawSetSelectable(playerid, ShopPTD[playerid][z], false);	
				}
				else {
					PlayerTextDrawBackgroundColor(playerid, ShopPTD[playerid][z], 0x333333FF);
					PlayerTextDrawSetPreviewRot(playerid, ShopPTD[playerid][z], 0.000000, 0.000000, 0.800000, 0.900000);
					PlayerTextDrawSetPreviewModel(playerid, ShopPTD[playerid][z], normalskin[z]);

					ShopPricePTD[playerid][z] = CreatePlayerTextDraw(playerid, 190.099914+ (x * 33.000000), 169.949951 + (y * 31.9375), "~g~$5.000");
					PlayerTextDrawLetterSize(playerid, ShopPricePTD[playerid][z], 0.155500, 1.013749);
					PlayerTextDrawAlignment(playerid, ShopPricePTD[playerid][z], 3);
					PlayerTextDrawColor(playerid, ShopPricePTD[playerid][z], -1);
					PlayerTextDrawSetShadow(playerid, ShopPricePTD[playerid][z], 0);
					PlayerTextDrawSetOutline(playerid, ShopPricePTD[playerid][z], 0);
					PlayerTextDrawBackgroundColor(playerid, ShopPricePTD[playerid][z], 255);
					PlayerTextDrawFont(playerid, ShopPricePTD[playerid][z], 2);
					PlayerTextDrawSetProportional(playerid, ShopPricePTD[playerid][z], 1);
					PlayerTextDrawSetShadow(playerid, ShopPricePTD[playerid][z], 0);
					PlayerTextDrawShow(playerid, ShopPricePTD[playerid][z]);
					PlayerTextDrawSetSelectable(playerid, ShopPTD[playerid][z], true);	
				}
				PlayerTextDrawFont(playerid, ShopPTD[playerid][z], 5);
				PlayerTextDrawSetProportional(playerid, ShopPTD[playerid][z], 0);
				PlayerTextDrawSetShadow(playerid, ShopPTD[playerid][z], 0);
				PlayerTextDrawSetPreviewVehCol(playerid, ShopPTD[playerid][z], 1, 1);
				PlayerTextDrawShow(playerid, ShopPTD[playerid][z]);		
				PlayerTextID[playerid][PlayerText:ShopPTD[playerid][z]] = z;
				z++;
			}
		}		
	}
	for(z=0;z<MAX_INVENTAR_ITEMS;z++) {
		x=(z%6),y=(z/6);
		r=PlayerInfo[playerid][pItemType][z];
		InventarPTD[playerid][z] = CreatePlayerTextDraw(playerid, 332.700286 + (x * 33.000000), 147.599975 + (y * 31.9375), "");
		PlayerTextDrawLetterSize(playerid, InventarPTD[playerid][z], 0.000000, 0.000000);
		PlayerTextDrawTextSize(playerid, InventarPTD[playerid][z], 32.000000, 31.000000);
		PlayerTextDrawAlignment(playerid, InventarPTD[playerid][z], 1);
		PlayerTextDrawColor(playerid, InventarPTD[playerid][z], -1);
		PlayerTextDrawSetShadow(playerid, InventarPTD[playerid][z], 0);
		PlayerTextDrawSetOutline(playerid, InventarPTD[playerid][z], 0);
		PlayerTextDrawBackgroundColor(playerid, InventarPTD[playerid][z], 0x1F1F1FFF);
		PlayerTextDrawFont(playerid, InventarPTD[playerid][z], 5);
		PlayerTextDrawSetProportional(playerid, InventarPTD[playerid][z], 0);
		PlayerTextDrawSetShadow(playerid, InventarPTD[playerid][z], 0);
		if(r<200) {
			PlayerTextDrawSetPreviewModel(playerid, InventarPTD[playerid][z], SlotInfo[r][SLOT_OBJECT]);
			PlayerTextDrawSetPreviewRot(playerid, InventarPTD[playerid][z], SlotInfo[r][SLOT_POS][0], SlotInfo[r][SLOT_POS][1], SlotInfo[r][SLOT_POS][2], SlotInfo[r][SLOT_POS][3]);
		} else {
			PlayerTextDrawSetPreviewModel(playerid, InventarPTD[playerid][z], PlayerInfo[playerid][pItems][z]);
			PlayerTextDrawSetPreviewRot(playerid, InventarPTD[playerid][z], 0.0, 0.0, 0.0, 0.9);		
			PlayerTextDrawBackgroundColor(playerid, InventarPTD[playerid][z], GetSkinColor(PlayerInfo[playerid][pItems][z]));	
		}
		PlayerTextDrawSetPreviewVehCol(playerid, InventarPTD[playerid][z], 1, 1);
		PlayerTextDrawSetSelectable(playerid, InventarPTD[playerid][z], true);	
		if(PlayerInfo[playerid][pItems][z]>1||r==200) {
			format(gString, 40, "%s%d", r<200?(""):("ID: "), PlayerInfo[playerid][pItems][z]);
			InventarValPTD[playerid][z] = CreatePlayerTextDraw(playerid, 363.599700 + (x * 33.000000), 169.300018 + (y * 31.9375), gString);
			PlayerTextDrawLetterSize(playerid, InventarValPTD[playerid][z], 0.155500, 1.013749);
			PlayerTextDrawAlignment(playerid, InventarValPTD[playerid][z], 3);
			PlayerTextDrawColor(playerid, InventarValPTD[playerid][z], -1);
			PlayerTextDrawSetShadow(playerid, InventarValPTD[playerid][z], 0);
			PlayerTextDrawSetOutline(playerid, InventarValPTD[playerid][z], 0);
			PlayerTextDrawBackgroundColor(playerid, InventarValPTD[playerid][z], 255);
			PlayerTextDrawFont(playerid, InventarValPTD[playerid][z], 2);
			PlayerTextDrawSetProportional(playerid, InventarValPTD[playerid][z], 1);
			PlayerTextDrawSetShadow(playerid, InventarValPTD[playerid][z], 0);
			PlayerTextDrawShow(playerid, InventarValPTD[playerid][z]);	
		}
		PlayerTextDrawShow(playerid, InventarPTD[playerid][z]);			
		PlayerTextID[playerid][PlayerText:InventarPTD[playerid][z]] = z+30;
	}
	ShopPTD[playerid][30] = CreatePlayerTextDraw(playerid, 241.099975, 349.762451, "1");
	PlayerTextDrawLetterSize(playerid, ShopPTD[playerid][30], 0.256498, 1.569375);
	PlayerTextDrawAlignment(playerid, ShopPTD[playerid][30], 2);
	PlayerTextDrawColor(playerid, ShopPTD[playerid][30], -2139062017);
	PlayerTextDrawSetShadow(playerid, ShopPTD[playerid][30], 0);
	PlayerTextDrawSetOutline(playerid, ShopPTD[playerid][30], 0);
	PlayerTextDrawBackgroundColor(playerid, ShopPTD[playerid][30], 255);
	PlayerTextDrawFont(playerid, ShopPTD[playerid][30], 2);
	PlayerTextDrawSetProportional(playerid, ShopPTD[playerid][30], 1);
	PlayerTextDrawSetShadow(playerid, ShopPTD[playerid][30], 0);
	PlayerTextDrawShow(playerid, ShopPTD[playerid][30]);
	
	InventarPTD[playerid][36] = CreatePlayerTextDraw(playerid, 424.000000, 342.250000, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, InventarPTD[playerid][36], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, InventarPTD[playerid][36], 10.000000, 9.000000);
	PlayerTextDrawAlignment(playerid, InventarPTD[playerid][36], 1);
	PlayerTextDrawColor(playerid, InventarPTD[playerid][36], 0x489327FF);
	PlayerTextDrawSetShadow(playerid, InventarPTD[playerid][36], 0);
	PlayerTextDrawSetOutline(playerid, InventarPTD[playerid][36], 0);
	PlayerTextDrawBackgroundColor(playerid, InventarPTD[playerid][36], 255);
	PlayerTextDrawFont(playerid, InventarPTD[playerid][36], 4);
	PlayerTextDrawSetProportional(playerid, InventarPTD[playerid][36], 0);
	PlayerTextDrawSetShadow(playerid, InventarPTD[playerid][36], 0);
	PlayerTextDrawShow(playerid, InventarPTD[playerid][36]);			
	PlayerTextID[playerid][PlayerText:InventarPTD[playerid][36]] = 66;

	InventarPTD[playerid][37] = CreatePlayerTextDraw(playerid, 433.000000, 342.250000, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, InventarPTD[playerid][37], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, InventarPTD[playerid][37], 10.000000, 9.000000);
	PlayerTextDrawAlignment(playerid, InventarPTD[playerid][37], 1);
	PlayerTextDrawColor(playerid, InventarPTD[playerid][37], 858993663);
	PlayerTextDrawSetShadow(playerid, InventarPTD[playerid][37], 0);
	PlayerTextDrawSetOutline(playerid, InventarPTD[playerid][37], 0);
	PlayerTextDrawBackgroundColor(playerid, InventarPTD[playerid][37], 255);
	PlayerTextDrawFont(playerid, InventarPTD[playerid][37], 4);
	PlayerTextDrawSetProportional(playerid, InventarPTD[playerid][37], 0);
	PlayerTextDrawSetShadow(playerid, InventarPTD[playerid][37], 0);
	PlayerTextDrawSetSelectable(playerid, InventarPTD[playerid][37], true);
	PlayerTextDrawShow(playerid, InventarPTD[playerid][37]);			
	PlayerTextID[playerid][PlayerText:InventarPTD[playerid][37]] = 67;
	return true;
}

hideShop(playerid) {
	new i;
	for(i=0;i<5;i++) TextDrawHideForPlayer(playerid, InventarTD[i]);
	for(i=0;i<7;i++) TextDrawHideForPlayer(playerid, ShopTD[i]);
	for(i=0;i<MAX_SHOP_ITEMS;i++) {
		PlayerTextDrawDestroy(playerid, ShopPTD[playerid][i]);
		if(ShopPricePTD[playerid][i] == PlayerText:INVALID_TEXT_DRAW) continue;
		PlayerTextDrawDestroy(playerid, ShopPricePTD[playerid][i]);
		ShopPricePTD[playerid][i] = PlayerText:INVALID_TEXT_DRAW;
	}
	PlayerTextDrawDestroy(playerid, InventarPTD[playerid][37]);
	PlayerTextDrawDestroy(playerid, InventarPTD[playerid][36]);
	PlayerTextDrawDestroy(playerid, ShopPTD[playerid][30]);
	for(i=0;i<MAX_INVENTAR_ITEMS;i++) {
		PlayerTextDrawDestroy(playerid, InventarPTD[playerid][i]);
		if(InventarValPTD[playerid][i] == PlayerText:INVALID_TEXT_DRAW) continue;
		PlayerTextDrawDestroy(playerid, InventarValPTD[playerid][i]);
		InventarValPTD[playerid][i] = PlayerText:INVALID_TEXT_DRAW;
	}
	player_selected[playerid] = 0;
	CancelSelectTextDraw(playerid);
	PlayerTextDrawShow(playerid, PlayerLogo);
	PlayerTextDrawShow(playerid, HungerPTD);
	PlayerTextDrawShow(playerid, DrinkPTD);
	TextDrawShowForPlayer(playerid, DrinkTD);
	TextDrawShowForPlayer(playerid, HungerTD);
	for(new d=0;d<3;d++) TextDrawShowForPlayer(playerid, DataT[d]);
	return true;
}

std::_ItemType(playerid, type, args=-1) {
	if((args=PlayerInfo[playerid][pItemSlotType][type]) !=-1) return args; args=-1;
	while(++args<MAX_ITEMS) if !PlayerInfo[playerid][pItems][args] *then return args;
	return args;
}

std::AddItemToInventar(playerid, type, slot, amount=1) {
	if(type < 200) {
		type++;
		new x=slot>35?slot%35:slot; gString[0] = EOS;
		if(PlayerInfo[playerid][pItems][slot] > 1) {
			format(gString, 15, "%d", PlayerInfo[playerid][pItems][slot]+amount);
			PlayerTextDrawSetString(playerid, InventarValPTD[playerid][slot], gString);
		}
		else if(!PlayerInfo[playerid][pItems][slot]) {
			PlayerTextDrawSetPreviewModel(playerid, InventarPTD[playerid][x], SlotInfo[type][SLOT_OBJECT]);
			PlayerTextDrawSetPreviewRot(playerid, InventarPTD[playerid][x], SlotInfo[type][SLOT_POS][0], SlotInfo[type][SLOT_POS][1], SlotInfo[type][SLOT_POS][2], SlotInfo[type][SLOT_POS][3]);
			
			format(gString, 15, "%d", PlayerInfo[playerid][pItems][slot]+amount);

			InventarValPTD[playerid][slot] = CreatePlayerTextDraw(playerid, 363.599700 + ((slot%6) * 33.000000), 169.300018 + ((slot/6) * 31.9375), gString);
			PlayerTextDrawLetterSize(playerid, InventarValPTD[playerid][slot], 0.155500, 1.013749);
			PlayerTextDrawAlignment(playerid, InventarValPTD[playerid][slot], 3);
			PlayerTextDrawColor(playerid, InventarValPTD[playerid][slot], -1);
			PlayerTextDrawSetShadow(playerid, InventarValPTD[playerid][slot], 0);
			PlayerTextDrawSetOutline(playerid, InventarValPTD[playerid][slot], 0);
			PlayerTextDrawBackgroundColor(playerid, InventarValPTD[playerid][slot], 255);
			PlayerTextDrawFont(playerid, InventarValPTD[playerid][slot], 2);
			PlayerTextDrawSetProportional(playerid, InventarValPTD[playerid][slot], 1);
			PlayerTextDrawSetShadow(playerid, InventarValPTD[playerid][slot], 0);

			PlayerTextDrawShow(playerid, InventarPTD[playerid][slot]);
			PlayerTextDrawShow(playerid, InventarValPTD[playerid][slot]);
		}
		PlayerInfo[playerid][pItemSlotType][type] = slot;
	} else {
		PlayerTextDrawSetPreviewModel(playerid, InventarPTD[playerid][slot], amount);
		PlayerTextDrawSetPreviewRot(playerid, InventarPTD[playerid][slot], 0.0, 0.0, 0.0, 0.9);
		
		format(gString, 15, "ID: %d", amount);

		InventarValPTD[playerid][slot] = CreatePlayerTextDraw(playerid, 363.599700 + ((slot%6) * 33.000000), 169.300018 + ((slot/6) * 31.9375), gString);
		PlayerTextDrawLetterSize(playerid, InventarValPTD[playerid][slot], 0.155500, 1.013749);
		PlayerTextDrawAlignment(playerid, InventarValPTD[playerid][slot], 3);
		PlayerTextDrawColor(playerid, InventarValPTD[playerid][slot], -1);
		PlayerTextDrawSetShadow(playerid, InventarValPTD[playerid][slot], 0);
		PlayerTextDrawSetOutline(playerid, InventarValPTD[playerid][slot], 0);
		PlayerTextDrawBackgroundColor(playerid, InventarValPTD[playerid][slot], 255);
		PlayerTextDrawFont(playerid, InventarValPTD[playerid][slot], 2);
		PlayerTextDrawSetProportional(playerid, InventarValPTD[playerid][slot], 1);
		PlayerTextDrawSetShadow(playerid, InventarValPTD[playerid][slot], 0);

		PlayerTextDrawShow(playerid, InventarPTD[playerid][slot]);
		PlayerTextDrawShow(playerid, InventarValPTD[playerid][slot]);	
	}
	PlayerInfo[playerid][pItems][slot] += amount;
	PlayerInfo[playerid][pItemType][slot] = type;
	return true;
}
DialogInv(playerid, amount) {
	new x = _ItemType(playerid, listitemmm[playerid]+1), type = listitemmm[playerid];
	if(x==-1) 
		return SCM(playerid, COLOR_GREY, "Nu mai ai loc in inventar.");

	amount = PlayerInfo[playerid][pItems][x]+amount>20?(20-PlayerInfo[playerid][pItems][x]):amount;
	if(!amount) 
		return SCM(playerid, COLOR_GREY, "Ai deja maximul de 20 iteme de acest tip.");

	if GetPlayerCash(playerid) < amount*ItemInfo[type][ITEM_PRICE] *then
		return SCM(playerid, COLOR_LGREEN, "Eroare: Nu ai aceasta suma de bani!");

	format(gString, 75, "[SHOP] {FFFFFF}you bought %d %s for $%s.", amount, ItemInfo[type][ITEM_NAME], FormatNumber(amount*ItemInfo[type][ITEM_PRICE]));
	SCM(playerid, COLOR_LIGHTRED, gString);
	GivePlayerCash(playerid, -amount*ItemInfo[type][ITEM_PRICE]);
	BizzInfo[PlayerVar[playerid][IsBizz]][bBalance] += amount*ItemInfo[type][ITEM_PRICE];
	AddItemToInventar(playerid, type, x, amount);
	return true;
}

ClickShop(playerid, PlayerText:playertextid) {
	new x = PlayerTextID[playerid][PlayerText:playertextid],s=x+ShopMax[PlayerShop[playerid]][0];
	switch(x) {
		case 0..29: {
			switch(PlayerShop[playerid]) {
				case 3: {
					gString[0] = EOS;
					listitemmm[playerid] = x;
					format(gString, 100, "Esti sigur ca vrei sa cumperi skinu %d pentru suma de $5.000?", normalskin[x]);
					ShowPlayerDialog(playerid, DIALOG_BUYSKIN, DIALOG_STYLE_MSGBOX, "Buy Skin", gString, "Buy", "Close");
				}
				case 2: {
					format(gString, 88, "{FFFFFF}Are you sure you want to buy a {FF0000}%s?",ItemInfo[s][ITEM_NAME]);
					ShowPlayerDialog(playerid, DIALOG_24, DIALOG_STYLE_MSGBOX, "Buy a item:", gString, "Buy", "Close");
					listitemmm[playerid] = x;
					listitemm[playerid] = s;
				}
				default: {
					format(gString, 88+30, "{FFFFFF}Are you sure you want to buy a {FF0000}%s?\n{FFFFFF}How much do you want to buy?",ItemInfo[s][ITEM_NAME]);
					ShowPlayerDialog(playerid, DIALOG_IVBUY, DIALOG_STYLE_INPUT, "Buy a item:", gString, "Select", "Close");
					listitemmm[playerid] = s;
				}
			}
		}
		case 66: FreshInventar(playerid, false);
		case 67: FreshInventar(playerid, true);
	}
	return true;
}
stock save_inventar(playerid) {
	gString[0] = (EOS);
	mysql_format(SQL, gString, 350, "UPDATE `users` SET `Items` = '%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i' WHERE `id` = '%i'",
		PlayerInfo[playerid][pItems][0], PlayerInfo[playerid][pItems][1], PlayerInfo[playerid][pItems][2], PlayerInfo[playerid][pItems][3], PlayerInfo[playerid][pItems][4], PlayerInfo[playerid][pItems][5], PlayerInfo[playerid][pItems][6], PlayerInfo[playerid][pItems][7], PlayerInfo[playerid][pItems][8], PlayerInfo[playerid][pItems][9],
		PlayerInfo[playerid][pItems][10], PlayerInfo[playerid][pItems][11], PlayerInfo[playerid][pItems][12], PlayerInfo[playerid][pItems][13], PlayerInfo[playerid][pItems][14], PlayerInfo[playerid][pItems][15], PlayerInfo[playerid][pItems][16], PlayerInfo[playerid][pItems][17], PlayerInfo[playerid][pItems][18], PlayerInfo[playerid][pItems][19],
		PlayerInfo[playerid][pItems][20], PlayerInfo[playerid][pItems][21], PlayerInfo[playerid][pItems][22], PlayerInfo[playerid][pItems][23], PlayerInfo[playerid][pItems][24], PlayerInfo[playerid][pItems][25], PlayerInfo[playerid][pItems][26], PlayerInfo[playerid][pItems][27], PlayerInfo[playerid][pItems][28], PlayerInfo[playerid][pItems][29],
		PlayerInfo[playerid][pItems][30], PlayerInfo[playerid][pItems][31], PlayerInfo[playerid][pItems][32], PlayerInfo[playerid][pItems][33], PlayerInfo[playerid][pItems][34], PlayerInfo[playerid][pItems][35], PlayerInfo[playerid][pItems][36], PlayerInfo[playerid][pItems][37], PlayerInfo[playerid][pItems][38], PlayerInfo[playerid][pItems][39],
		PlayerInfo[playerid][pItems][40], PlayerInfo[playerid][pItems][41], PlayerInfo[playerid][pItems][42], PlayerInfo[playerid][pItems][43], PlayerInfo[playerid][pItems][44], PlayerInfo[playerid][pItems][45], PlayerInfo[playerid][pItems][46], PlayerInfo[playerid][pItems][47], PlayerInfo[playerid][pItems][48], PlayerInfo[playerid][pItems][49],
		PlayerInfo[playerid][pItems][50], PlayerInfo[playerid][pItems][51], PlayerInfo[playerid][pItems][52], PlayerInfo[playerid][pItems][53], PlayerInfo[playerid][pItems][54], PlayerInfo[playerid][pItems][55], PlayerInfo[playerid][pItems][56], PlayerInfo[playerid][pItems][57], PlayerInfo[playerid][pItems][58], PlayerInfo[playerid][pItems][59],
		PlayerInfo[playerid][pItems][60], PlayerInfo[playerid][pItems][61], PlayerInfo[playerid][pItems][62], PlayerInfo[playerid][pItems][63], PlayerInfo[playerid][pItems][64], PlayerInfo[playerid][pItems][65], PlayerInfo[playerid][pItems][66], PlayerInfo[playerid][pItems][67], PlayerInfo[playerid][pItems][68], PlayerInfo[playerid][pItems][69],
		PlayerInfo[playerid][pItems][70], PlayerInfo[playerid][pItems][71], 
	PlayerInfo[playerid][pSQLID]);
	mysql_tquery(SQL, gString);
	mysql_format(SQL, gString, 350, "UPDATE `users` SET `ItemsType` = '%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i' WHERE `id` = '%i'",
		PlayerInfo[playerid][pItemType][0], PlayerInfo[playerid][pItemType][1], PlayerInfo[playerid][pItemType][2], PlayerInfo[playerid][pItemType][3], PlayerInfo[playerid][pItemType][4], PlayerInfo[playerid][pItemType][5], PlayerInfo[playerid][pItemType][6], PlayerInfo[playerid][pItemType][7], PlayerInfo[playerid][pItemType][8], PlayerInfo[playerid][pItemType][9],
		PlayerInfo[playerid][pItemType][10], PlayerInfo[playerid][pItemType][11], PlayerInfo[playerid][pItemType][12], PlayerInfo[playerid][pItemType][13], PlayerInfo[playerid][pItemType][14], PlayerInfo[playerid][pItemType][15], PlayerInfo[playerid][pItemType][16], PlayerInfo[playerid][pItemType][17], PlayerInfo[playerid][pItemType][18], PlayerInfo[playerid][pItemType][19],
		PlayerInfo[playerid][pItemType][20], PlayerInfo[playerid][pItemType][21], PlayerInfo[playerid][pItemType][22], PlayerInfo[playerid][pItemType][23], PlayerInfo[playerid][pItemType][24], PlayerInfo[playerid][pItemType][25], PlayerInfo[playerid][pItemType][26], PlayerInfo[playerid][pItemType][27], PlayerInfo[playerid][pItemType][28], PlayerInfo[playerid][pItemType][29],
		PlayerInfo[playerid][pItemType][30], PlayerInfo[playerid][pItemType][31], PlayerInfo[playerid][pItemType][32], PlayerInfo[playerid][pItemType][33], PlayerInfo[playerid][pItemType][34], PlayerInfo[playerid][pItemType][35], PlayerInfo[playerid][pItemType][36], PlayerInfo[playerid][pItemType][37], PlayerInfo[playerid][pItemType][38], PlayerInfo[playerid][pItemType][39],
		PlayerInfo[playerid][pItemType][40], PlayerInfo[playerid][pItemType][41], PlayerInfo[playerid][pItemType][42], PlayerInfo[playerid][pItemType][43], PlayerInfo[playerid][pItemType][44], PlayerInfo[playerid][pItemType][45], PlayerInfo[playerid][pItemType][46], PlayerInfo[playerid][pItemType][47], PlayerInfo[playerid][pItemType][48], PlayerInfo[playerid][pItemType][49],
		PlayerInfo[playerid][pItemType][50], PlayerInfo[playerid][pItemType][51], PlayerInfo[playerid][pItemType][52], PlayerInfo[playerid][pItemType][53], PlayerInfo[playerid][pItemType][54], PlayerInfo[playerid][pItemType][55], PlayerInfo[playerid][pItemType][56], PlayerInfo[playerid][pItemType][57], PlayerInfo[playerid][pItemType][58], PlayerInfo[playerid][pItemType][59],
		PlayerInfo[playerid][pItemType][60], PlayerInfo[playerid][pItemType][61], PlayerInfo[playerid][pItemType][62], PlayerInfo[playerid][pItemType][63], PlayerInfo[playerid][pItemType][64], PlayerInfo[playerid][pItemType][65], PlayerInfo[playerid][pItemType][66], PlayerInfo[playerid][pItemType][67], PlayerInfo[playerid][pItemType][68], PlayerInfo[playerid][pItemType][69],
		PlayerInfo[playerid][pItemType][70], PlayerInfo[playerid][pItemType][71], 
	PlayerInfo[playerid][pSQLID]);
	mysql_tquery(SQL, gString);
	mysql_format(SQL, gString, 350, "UPDATE `users` SET `ItemSlotType` = '%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|' WHERE `id` = '%i'",
	PlayerInfo[playerid][pItemSlotType][1], PlayerInfo[playerid][pItemSlotType][2], PlayerInfo[playerid][pItemSlotType][3], PlayerInfo[playerid][pItemSlotType][4], PlayerInfo[playerid][pItemSlotType][5], PlayerInfo[playerid][pItemSlotType][6], PlayerInfo[playerid][pItemSlotType][7], PlayerInfo[playerid][pItemSlotType][8], PlayerInfo[playerid][pItemSlotType][9], PlayerInfo[playerid][pItemSlotType][10],
	PlayerInfo[playerid][pItemSlotType][11], PlayerInfo[playerid][pItemSlotType][12], PlayerInfo[playerid][pItemSlotType][13], PlayerInfo[playerid][pItemSlotType][14], PlayerInfo[playerid][pItemSlotType][15], PlayerInfo[playerid][pItemSlotType][16], PlayerInfo[playerid][pItemSlotType][17],PlayerInfo[playerid][pItemSlotType][18], PlayerInfo[playerid][pItemSlotType][19], PlayerInfo[playerid][pItemSlotType][20], 
	PlayerInfo[playerid][pItemSlotType][21], PlayerInfo[playerid][pItemSlotType][22], PlayerInfo[playerid][pItemSlotType][23], PlayerInfo[playerid][pItemSlotType][24], PlayerInfo[playerid][pItemSlotType][25], PlayerInfo[playerid][pItemSlotType][26], PlayerInfo[playerid][pItemSlotType][27], PlayerInfo[playerid][pItemSlotType][28], PlayerInfo[playerid][pItemSlotType][29], PlayerInfo[playerid][pItemSlotType][30], 
	PlayerInfo[playerid][pSQLID]);
	mysql_tquery(SQL, gString);
	return true;
}