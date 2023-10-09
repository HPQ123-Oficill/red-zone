new 
	TotalBetPlace[3], PrizePlace[3], PlaceBet[MAX_PLAYERS][3], PlaceAlerdy[MAX_PLAYERS], RulettStatus = 0, Text: RoulettaTD[38], Iterator:IsRuletta<MAX_PLAYERS>, RulettaTime[3], RoulettProcent, ColorsLast[10];
enum R_INFO {
	R_NAME[10],
	R_COLOR,
	R_VALUE,
	R_COL[8]
}
static const RouletteType[37][9] = {
	{1,0,1,0,1,0,1,0,2},{0,1,0,1,0,1,0,2,1},{1,0,1,0,1,0,2,1,0},{0,1,0,1,0,2,1,0,1},{1,0,1,0,2,1,0,1,0},{0,1,0,2,1,0,1,0,1},
	{1,0,2,1,0,1,0,1,0},{1,2,1,0,1,0,1,0,1},{2,1,0,1,0,1,0,1,0},{1,0,1,0,1,0,1,0,1},{0,1,0,1,0,1,0,1,0},{1,0,1,0,1,0,1,0,1},
	{0,1,0,1,0,1,0,1,0},{1,0,1,0,1,0,1,0,1},{0,1,0,1,0,1,0,1,0},{1,0,1,0,1,0,1,0,1},{0,1,0,1,0,1,0,1,0},{1,0,1,0,1,0,1,0,1},
	{0,1,0,1,0,1,0,1,0},{1,0,1,0,1,0,1,0,1},{0,1,0,1,0,1,0,1,0},{1,0,1,0,1,0,1,0,1},{0,1,0,1,0,1,0,1,0},{1,0,1,0,1,0,1,0,1},
	{0,1,0,1,0,1,0,1,0},{1,0,1,0,1,0,1,0,1},{0,1,0,1,0,1,0,1,0},{1,0,1,0,1,0,1,0,1},{0,1,0,1,0,1,0,1,0},{1,0,1,0,1,0,1,0,1},
	{0,1,0,1,0,1,0,1,0},{1,0,1,0,1,0,1,0,1},{0,1,0,1,0,1,0,1,0},{1,0,1,0,1,0,1,0,1},{0,1,0,1,0,1,0,1,0},{1,0,1,0,1,0,1,0,1},
	{0,1,0,1,0,1,0,1,0}},
	RouletteInfo[4][R_INFO] = {{"BLACK", 218959359, 2, "353535"}, {"RED", -1206577665, 2, "DE1717"}, {"GREEN", 347681535, 14, "05A733"}, {"NULL", 320017407, 0, "111111"}}
;

HideRoulette(playerid) {
	if(RulettStatus&&PlaceAlerdy[playerid]) return SelectTextDraw(playerid, COLOR_WHITE);
	if(!Iter_Contains(IsRuletta, playerid)) return true;
	Iter_Remove(IsRuletta, playerid);
	player_selected[playerid] = 0;
	CancelSelectTextDraw(playerid);
	SetCameraBehindPlayer(playerid);
	for(new i=0;i<28;i++) TextDrawHideForPlayer(playerid, RoulettaTD[i]);
	PlayerTextDrawHide(playerid, RoulettaPTD);
	return true;
}
UpdateRoulettaMoney(playerid) {
	gString[0] = EOS;
	format(gString, 20, "~g~$%s", valueBigInt(money[playerid]));
	PlayerTextDrawSetString(playerid, RoulettaPTD, gString);
	PlayerTextDrawShow(playerid, RoulettaPTD);
}

SendRulettaMessage(color, const amount[]) foreach(new i : IsRuletta) SCM(i, color, amount);
SendRulettaAudio(const html[]) foreach(new i : IsRuletta) PlayAudioStreamForPlayer(i, html);
PutRouletteBet(playerid, money, type) {
	if RulettStatus > 1 *then return true;
	if(money <= 0 || money > 100000000) return SCM(playerid, COLOR_GREY, "Invalid Amount.");
	if(GetPlayerCash(playerid) < money) return SCM(playerid, COLOR_GREY, "You don't have this amount of money");
	GivePlayerCash(playerid, -money); PlaceBet[playerid][type] = money; TotalBetPlace[type] ++; PrizePlace[type] += money; gString[0] = EOS;
	UpdateRoulettaMoney(playerid);
	gString[0] = EOS;
	format(gString, 50, "total: $%s~n~bets: %d", FormatNumber(PrizePlace[type]), TotalBetPlace[type]);
	TextDrawSetString(RoulettaTD[24 + type], gString);
	format(gString, 100, "Ai pariat suma de $%s pe {%s}%s (%dX)", FormatNumber(PlaceBet[playerid][type]), RouletteInfo[type][R_COL], RouletteInfo[type][R_NAME], RouletteInfo[type][R_VALUE]);
	SCM(playerid, COLOR_YELLOW, gString);
	format(gString, 100, "%s a pariat suma de $%s pe {%s}%s (%dX)", GetName(playerid), FormatNumber(money), RouletteInfo[type][R_COL], RouletteInfo[type][R_NAME], RouletteInfo[type][R_VALUE]);
	foreach(new i : IsRuletta) if(i != playerid) SCM(i, COLOR_SERVER, gString);
	PlaceAlerdy[playerid] = type + 1;
	if(RulettStatus) return true;
	RulettStatus = 1;
	RulettaTime[0] = 30;
	RoulettProcent = RulettaTime[2] = 30 + random(312425)%30 + random(434235)%40 + random(696969)%10;
	return true;
}
OnPlayerClickRoulette(playerid, Text:clickedid) {
	if(PlaceAlerdy[playerid] || RulettStatus > 1) return true;
	if(clickedid == RoulettaTD[21]) return ShowPlayerDialog(playerid, DIALOG_RED, DIALOG_STYLE_INPUT, "{FFFFFF}Place a bet", "{FFFFFF}Place on {DE1717}RED (2X)\n{FFFFFF}Enter how much you want to bet", "Bet", "Back");
	if(clickedid == RoulettaTD[22]) return ShowPlayerDialog(playerid, DIALOG_GREEN, DIALOG_STYLE_INPUT, "{FFFFFF}Place a bet", "{FFFFFF}Place on {05A733}GREEN (14X)\n{FFFFFF}Enter how much you want to bet", "Bet", "Back");
	if(clickedid == RoulettaTD[23]) return ShowPlayerDialog(playerid, DIALOG_BLACK, DIALOG_STYLE_INPUT, "{FFFFFF}Place a bet", "{FFFFFF}Place on {353535}BLACK (2X)\n{FFFFFF}Enter how much you want to bet", "Bet", "Back");
	return true;
}
OnRoulettaUpdate() {
	switch(RulettStatus) {
		case 0: return true;
		case 1: {
			if(!RulettaTime[0]) {
				RulettStatus = 2;
				SendRulettaAudio("http://play.bugged.ro/spinning.mp3");
				TextDrawSetString(RoulettaTD[10], "roling...");
				return true;
			}
			gString[0] = EOS;
			format(gString, 15, "rolling in: %d", RulettaTime[0]);
			TextDrawSetString(RoulettaTD[10], gString);
			RulettaTime[0] --;
		}
		default: {
			gString[0] = EOS;
			RulettaTime[1] = RulettaTime[1] > 35 ? 0 : RulettaTime[1] + 1;
			for(new i=1;i<10;i++) TextDrawBoxColor(RoulettaTD[i], RouletteInfo[RouletteType[RulettaTime[1]][i - 1]][R_COLOR]);
			RulettStatus = percentage(RulettaTime[2],RoulettProcent)<10?4:percentage(RulettaTime[2],RoulettProcent)>20?2:3;
			RulettaTime[2] --;
			foreach(new i : IsRuletta) for(new x=1;x<10;x++) TextDrawShowForPlayer(i, RoulettaTD[x]);
			if(RulettaTime[2] <= 0) return RulettStatus = 0, SetTimer("GiveRouletteParize", 1000, false), 1;
		}
	}
	return true;
}

UpdateLastColor(newcolor) {
	for(new i=0;i<9;i++) {
		ColorsLast[i] = ColorsLast[i+1];
		TextDrawBoxColor(RoulettaTD[i+11], RouletteInfo[ColorsLast[i]][R_COLOR]);
	}
	ColorsLast[9] = newcolor;
	TextDrawBoxColor(RoulettaTD[20], RouletteInfo[newcolor][R_COLOR]);
	foreach(new i : IsRuletta) for(new x=0;x<10;x++) TextDrawShowForPlayer(i, RoulettaTD[x+11]);
}

function GiveRouletteParize() {
	new x = RouletteType[RulettaTime[1]][4];
	SendRulettaAudio("http://play.bugged.ro/tone.mp3");
	TextDrawSetString(RoulettaTD[10], "WAITING FOR BETS...");
	format(gString, 50, "The roulette landed on %s", RouletteInfo[x][R_NAME]);
	SendRulettaMessage(COLOR_SERVER, gString);
	UpdateLastColor(x);
	foreach(new i : IsRuletta) {
		if(!PlaceAlerdy[i]) continue;
		if(x == PlaceAlerdy[i]-1) {
			GivePlayerCash(i, PlaceBet[i][x]*RouletteInfo[x][R_VALUE]);			
			UpdateRoulettaMoney(i);
			format(gString, 50, "You won $%s.", FormatNumber(PlaceBet[i][x]*RouletteInfo[x][R_VALUE]));
		} else format(gString, 50, "You lost $%s.", FormatNumber(PlaceBet[i][PlaceAlerdy[i]-1]));
		SCM(i, COLOR_MONEY, gString);		
		PlaceBet[i][x] = 0;
		PlaceAlerdy[i] = 0;
	}
	for(new c = 0; c < 3; c++) TotalBetPlace[c]=0,PrizePlace[c]=0,TextDrawSetString(RoulettaTD[c+24], "Total: $0~n~bets: 0");
	return true;
}

LoadRouletta() {
	RulettaTime[1] = 10;

	RoulettaTD[0] = TextDrawCreate(320.000000, 158.500000, "box");
	TextDrawLetterSize(RoulettaTD[0], 0.000000, 23.000013);
	TextDrawTextSize(RoulettaTD[0], 0.000000, 689.000000);
	TextDrawAlignment(RoulettaTD[0], 2);
	TextDrawColor(RoulettaTD[0], -1);
	TextDrawUseBox(RoulettaTD[0], 1);
	TextDrawBoxColor(RoulettaTD[0], 320017407);
	TextDrawSetShadow(RoulettaTD[0], 0);
	TextDrawSetOutline(RoulettaTD[0], 0);
	TextDrawBackgroundColor(RoulettaTD[0], 255);
	TextDrawFont(RoulettaTD[0], 1);
	TextDrawSetProportional(RoulettaTD[0], 1);
	TextDrawSetShadow(RoulettaTD[0], 0);

	for(new i=0;i<9;i++) {
		RoulettaTD[i+1] = TextDrawCreate(118.000000 + (i * 50.0), 174.687500, "box");
		TextDrawLetterSize(RoulettaTD[i+1], 0.000000, 3.499994);
		TextDrawTextSize(RoulettaTD[i+1], 0.000000, 46.000000);
		TextDrawAlignment(RoulettaTD[i+1], 2);
		TextDrawColor(RoulettaTD[i+1], -1);
		TextDrawUseBox(RoulettaTD[i+1], 1);
		TextDrawBoxColor(RoulettaTD[i+1], ((i+1)%2)?-1206577665:218959359);
		TextDrawSetShadow(RoulettaTD[i+1], 0);
		TextDrawSetOutline(RoulettaTD[i+1], 0);
		TextDrawBackgroundColor(RoulettaTD[i+1], 255);
		TextDrawFont(RoulettaTD[i+1], 1);
		TextDrawSetProportional(RoulettaTD[i+1], 1);
		TextDrawSetShadow(RoulettaTD[i+1], 0);
	}

	RoulettaTD[10] = TextDrawCreate(318.500000, 224.125000, "WAITING FOR BETS...");
	TextDrawLetterSize(RoulettaTD[10], 0.197500, 1.088124);
	TextDrawAlignment(RoulettaTD[10], 2);
	TextDrawColor(RoulettaTD[10], -1);
	TextDrawSetShadow(RoulettaTD[10], 0);
	TextDrawSetOutline(RoulettaTD[10], 0);
	TextDrawBackgroundColor(RoulettaTD[10], 255);
	TextDrawFont(RoulettaTD[10], 2);
	TextDrawSetProportional(RoulettaTD[10], 1);
	TextDrawSetShadow(RoulettaTD[10], 0);

	for(new i=0;i<10;i++) {
		RoulettaTD[i + 11] = TextDrawCreate(268.000000 + (i*11.5), 237.687500, "box");
		TextDrawLetterSize(RoulettaTD[i + 11], 0.000000, 0.349994);
		TextDrawTextSize(RoulettaTD[i + 11], 0.000000, 5.000000);
		TextDrawAlignment(RoulettaTD[i + 11], 2);
		TextDrawColor(RoulettaTD[i + 11], -1);
		TextDrawUseBox(RoulettaTD[i + 11], 1);
		ColorsLast[i] = 3;
		TextDrawBoxColor(RoulettaTD[i + 11], RouletteInfo[ColorsLast[i]][R_COLOR]);
		TextDrawSetShadow(RoulettaTD[i + 11], 0);
		TextDrawSetOutline(RoulettaTD[i + 11], 0);
		TextDrawBackgroundColor(RoulettaTD[i + 11], 255);
		TextDrawFont(RoulettaTD[i + 11], 1);
		TextDrawSetProportional(RoulettaTD[i + 11], 1);
		TextDrawSetShadow(RoulettaTD[i + 11], 0);
	}
	RoulettaTD[21] = TextDrawCreate(124.500000, 316.000000, "RED (x2)");
	TextDrawLetterSize(RoulettaTD[21], 0.374000, 1.319998);
	TextDrawTextSize(RoulettaTD[21], 15.000000, 165.000000);
	TextDrawAlignment(RoulettaTD[21], 2);
	TextDrawColor(RoulettaTD[21], -1);
	TextDrawUseBox(RoulettaTD[21], 1);
	TextDrawBoxColor(RoulettaTD[21], -1206577665);
	TextDrawSetShadow(RoulettaTD[21], 0);
	TextDrawSetOutline(RoulettaTD[21], 0);
	TextDrawBackgroundColor(RoulettaTD[21], 255);
	TextDrawFont(RoulettaTD[21], 1);
	TextDrawSetProportional(RoulettaTD[21], 1);
	TextDrawSetShadow(RoulettaTD[21], 0);
	TextDrawSetSelectable(RoulettaTD[21], true);

	RoulettaTD[22] = TextDrawCreate(319.000000, 316.000000, "GREEN (x14)");
	TextDrawLetterSize(RoulettaTD[22], 0.374000, 1.319998);
	TextDrawTextSize(RoulettaTD[22], 15.000000, 165.000000);
	TextDrawAlignment(RoulettaTD[22], 2);
	TextDrawColor(RoulettaTD[22], -1);
	TextDrawUseBox(RoulettaTD[22], 1);
	TextDrawBoxColor(RoulettaTD[22], 347681535);
	TextDrawSetShadow(RoulettaTD[22], 0);
	TextDrawSetOutline(RoulettaTD[22], 0);
	TextDrawBackgroundColor(RoulettaTD[22], 255);
	TextDrawFont(RoulettaTD[22], 1);
	TextDrawSetProportional(RoulettaTD[22], 1);
	TextDrawSetShadow(RoulettaTD[22], 0);
	TextDrawSetSelectable(RoulettaTD[22], true);

	RoulettaTD[23] = TextDrawCreate(510.000000, 315.562500, "BLACK (x2)");
	TextDrawLetterSize(RoulettaTD[23], 0.374000, 1.319998);
	TextDrawTextSize(RoulettaTD[23], 15.000000, 165.000000);
	TextDrawAlignment(RoulettaTD[23], 2);
	TextDrawColor(RoulettaTD[23], -1);
	TextDrawUseBox(RoulettaTD[23], 1);
	TextDrawBoxColor(RoulettaTD[23], 218959359);
	TextDrawSetShadow(RoulettaTD[23], 0);
	TextDrawSetOutline(RoulettaTD[23], 0);
	TextDrawBackgroundColor(RoulettaTD[23], 255);
	TextDrawFont(RoulettaTD[23], 1);
	TextDrawSetProportional(RoulettaTD[23], 1);
	TextDrawSetShadow(RoulettaTD[23], 0);
	TextDrawSetSelectable(RoulettaTD[23], true);

	RoulettaTD[25] = TextDrawCreate(126.500000, 331.312500, "total: $0~n~best: 0");
	TextDrawLetterSize(RoulettaTD[25], 0.202997, 0.991873);
	TextDrawAlignment(RoulettaTD[25], 2);
	TextDrawColor(RoulettaTD[25], -1);
	TextDrawSetShadow(RoulettaTD[25], 0);
	TextDrawSetOutline(RoulettaTD[25], 0);
	TextDrawBackgroundColor(RoulettaTD[25], 255);
	TextDrawFont(RoulettaTD[25], 2);
	TextDrawSetProportional(RoulettaTD[25], 1);
	TextDrawSetShadow(RoulettaTD[25], 0);

	RoulettaTD[26] = TextDrawCreate(318.500000, 330.875000, "total: $0~n~best: 0");
	TextDrawLetterSize(RoulettaTD[26], 0.202997, 0.991873);
	TextDrawAlignment(RoulettaTD[26], 2);
	TextDrawColor(RoulettaTD[26], -1);
	TextDrawSetShadow(RoulettaTD[26], 0);
	TextDrawSetOutline(RoulettaTD[26], 0);
	TextDrawBackgroundColor(RoulettaTD[26], 255);
	TextDrawFont(RoulettaTD[26], 2);
	TextDrawSetProportional(RoulettaTD[26], 1);
	TextDrawSetShadow(RoulettaTD[26], 0);

	RoulettaTD[24] = TextDrawCreate(512.500000, 330.437500, "total: $0~n~best: 0");
	TextDrawLetterSize(RoulettaTD[24], 0.202997, 0.991873);
	TextDrawAlignment(RoulettaTD[24], 2);
	TextDrawColor(RoulettaTD[24], -1);
	TextDrawSetShadow(RoulettaTD[24], 0);
	TextDrawSetOutline(RoulettaTD[24], 0);
	TextDrawBackgroundColor(RoulettaTD[24], 255);
	TextDrawFont(RoulettaTD[24], 2);
	TextDrawSetProportional(RoulettaTD[24], 1);
	TextDrawSetShadow(RoulettaTD[24], 0);

	RoulettaTD[27] = TextDrawCreate(317.000000, 174.687500, "box");
	TextDrawLetterSize(RoulettaTD[27], 0.000000, 3.500000);
	TextDrawTextSize(RoulettaTD[27], 0.000000, -2.000000);
	TextDrawAlignment(RoulettaTD[27], 2);
	TextDrawColor(RoulettaTD[27], -1);
	TextDrawUseBox(RoulettaTD[27], 1);
	TextDrawBoxColor(RoulettaTD[27], -1);
	TextDrawSetShadow(RoulettaTD[27], 0);
	TextDrawSetOutline(RoulettaTD[27], 0);
	TextDrawBackgroundColor(RoulettaTD[27], 255);
	TextDrawFont(RoulettaTD[27], 1);
	TextDrawSetProportional(RoulettaTD[27], 1);
	TextDrawSetShadow(RoulettaTD[27], 0);
}