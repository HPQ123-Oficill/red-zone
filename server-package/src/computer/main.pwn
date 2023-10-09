
#include "./src/computer/data.pwn"
#include "./src/computer/display_show.pwn"

// send info pc

#define MAX_PC_MESSAGES (5)

new 
	total_pc_messages[MAX_PLAYERS] = {0,...},
	PlayerText:closeMessageTD[MAX_PLAYERS][MAX_PC_MESSAGES] = {{PlayerText:INVALID_TEXT_DRAW, ...}, ...},
	PlayerText:boxMessageTD[MAX_PLAYERS][MAX_PC_MESSAGES],
	PlayerText:infoMessageTD[MAX_PLAYERS][MAX_PC_MESSAGES],
	string:alertMessage[MAX_PLAYERS][MAX_PC_MESSAGES][128],
	boxTime[MAX_PLAYERS][MAX_PC_MESSAGES];

std::getMessageFree(playerid, x=-1) {
	while(++x<5) if(closeMessageTD[playerid][x]==PlayerText:INVALID_TEXT_DRAW) break;
	return x;
}

#define sendComputerMessagef(%0,%1,%2,%3) format(gString,sizeof gString,%2,%3)&&sendComputerMessage(%0,gString,%1)

std::sendComputerMessage(playerid, const message[], hideSeconds = 5, i=-1) {
	if((i=getMessageFree(playerid))>3) return true;

	alertMessage[playerid][i][0] = 0;
	strcat(alertMessage[playerid][i], message);
	boxMessageTD[playerid][i] = CreatePlayerTextDraw(playerid, 544.499450, 331.569976 - (i * 95.083343), "box");
	PlayerTextDrawLetterSize(playerid, boxMessageTD[playerid][i], 0.000000, 9.649330);
	PlayerTextDrawTextSize(playerid, boxMessageTD[playerid][i], 0.000000, 163.000000);
	PlayerTextDrawAlignment(playerid, boxMessageTD[playerid][i], 2);
	PlayerTextDrawColor(playerid, boxMessageTD[playerid][i], -1);
	PlayerTextDrawUseBox(playerid, boxMessageTD[playerid][i], 1);
	PlayerTextDrawBoxColor(playerid, boxMessageTD[playerid][i], 202119061);
	PlayerTextDrawBackgroundColor(playerid, boxMessageTD[playerid][i], 255);
	PlayerTextDrawFont(playerid, boxMessageTD[playerid][i], 1);
	PlayerTextDrawSetProportional(playerid, boxMessageTD[playerid][i], 1);
	PlayerTextDrawShow(playerid, boxMessageTD[playerid][i]);

	closeMessageTD[playerid][i] = CreatePlayerTextDraw(playerid, 610.937133, 332.333343 - (i * 94.499969), "X");
	PlayerTextDrawLetterSize(playerid, closeMessageTD[playerid][i], 0.400000, 1.600000);
	PlayerTextDrawAlignment(playerid, closeMessageTD[playerid][i], 1);
	PlayerTextDrawColor(playerid, closeMessageTD[playerid][i], -16776961);
	PlayerTextDrawBackgroundColor(playerid, closeMessageTD[playerid][i], 255);
	PlayerTextDrawFont(playerid, closeMessageTD[playerid][i], 2);
	PlayerTextDrawSetProportional(playerid, closeMessageTD[playerid][i], 1);
	PlayerTextDrawSetSelectable(playerid, closeMessageTD[playerid][i], true);
	PlayerTextDrawShow(playerid, closeMessageTD[playerid][i]);

	infoMessageTD[playerid][i] = CreatePlayerTextDraw(playerid, 544.338500, 346.683563 - (i * 93.916626), message);
	PlayerTextDrawLetterSize(playerid, infoMessageTD[playerid][i], 0.238360, 1.314166);
	PlayerTextDrawAlignment(playerid, infoMessageTD[playerid][i], 2);
	PlayerTextDrawColor(playerid, infoMessageTD[playerid][i], -1);
	PlayerTextDrawBackgroundColor(playerid, infoMessageTD[playerid][i], 255);
	PlayerTextDrawFont(playerid, infoMessageTD[playerid][i], 1);
	PlayerTextDrawSetProportional(playerid, infoMessageTD[playerid][i], 1);
	PlayerTextDrawShow(playerid, infoMessageTD[playerid][i]);

	boxTime[playerid][i] = gettime() + hideSeconds;
	SetTimerEx(#time_out_pcBox, hideSeconds * 1000, false, "ii", playerid, i);
	return true;
}

redist::time_out_pcBox(playerid, id) {
	PlayerTextDrawDestroy(playerid, boxMessageTD[playerid][id]);
	PlayerTextDrawDestroy(playerid, closeMessageTD[playerid][id]);
	PlayerTextDrawDestroy(playerid, infoMessageTD[playerid][id]);
	boxMessageTD[playerid][id] = closeMessageTD[playerid][id] = infoMessageTD[playerid][id] = PlayerText:INVALID_TEXT_DRAW;
	return true;
}


_init_computer(playerid, _x=-1) {
	while(_x<3) TextDrawShowForPlayer(playerid, PCTD_INT[++_x]); _x=-1;
	player_selected[playerid] = 12;
	total_pc_messages[playerid] = 0;
	_PC[playerid]=_init_PC();
	Iter_Add(s_Players, playerid);
	SelectTextDraw(playerid, 0x6C6C6CFF);
	PlayerTextDrawHide(playerid, FPS); 
	while(_x<2) TextDrawHideForPlayer(playerid, DataT[++_x]); _x=-1;
	PlayerTextDrawHide(playerid, PlayerLogo);
	PlayerTextDrawHide(playerid, ShowTD);_x=-1;
	SetPlayerCameraPos(playerid, 492.491851, -81.961311, 1012.631042);
	SetPlayerCameraLookAt(playerid, 487.674072, -82.090232, 1013.962341);
	if(PlayerInfo[playerid][pHud][1]) {
		while(++_x<11) TextDrawHideForPlayer(playerid, GoalTD[_x]); _x=-1;
		while(++_x<4) PlayerTextDrawHide(playerid, GoalPTD[_x]); _x=-1;
	}
	while(++_x<6) TextDrawHideForPlayer(playerid, LogoTD[_x]); _x=-1;
	if(PlayerVar[playerid][IsHouses]!=0) SetDynamicObjectMaterial(HouseInfo[PlayerVar[playerid][IsHouses]][hObjPC], 1, 1258, "dynpostbx", "mailbox2_64", 0xFFFFFFFF);
	while(++_x<30) SCM(playerid, -1, "");
	return true;
}

show_PC_main(playerid, _x=-1) {
	_PC[playerid][_type]=PC_ACTION_LOGIN;
	while(_x<7) TextDrawShowForPlayer(playerid, PCTD_LOG[++_x]); _x=-1;
	while(_x<15) TextDrawHideForPlayer(playerid, PCTD_INT[++_x]); _x=-1;

	p_PCTD_LOG[playerid][0] = CreatePlayerTextDraw(playerid, 314.999969, 235.711791, GetName(playerid));
	PlayerTextDrawLetterSize(playerid, p_PCTD_LOG[playerid][0], 0.442499, 2.706871);
	PlayerTextDrawAlignment(playerid, p_PCTD_LOG[playerid][0], 2);
	PlayerTextDrawColor(playerid, p_PCTD_LOG[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, p_PCTD_LOG[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, p_PCTD_LOG[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, p_PCTD_LOG[playerid][0], 255);
	PlayerTextDrawFont(playerid, p_PCTD_LOG[playerid][0], 2);
	PlayerTextDrawSetProportional(playerid, p_PCTD_LOG[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, p_PCTD_LOG[playerid][0], 0);
	PlayerTextDrawShow(playerid, p_PCTD_LOG[playerid][0]);

	p_PCTD_LOG[playerid][1] = CreatePlayerTextDraw(playerid, 250.699981, 278.987457, "Password");
	PlayerTextDrawLetterSize(playerid, p_PCTD_LOG[playerid][1], 0.254000, 1.162500);
	PlayerTextDrawAlignment(playerid, p_PCTD_LOG[playerid][1], 1);
	PlayerTextDrawColor(playerid, p_PCTD_LOG[playerid][1], -1061109505);
	PlayerTextDrawSetShadow(playerid, p_PCTD_LOG[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, p_PCTD_LOG[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, p_PCTD_LOG[playerid][1], 255);
	PlayerTextDrawFont(playerid, p_PCTD_LOG[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, p_PCTD_LOG[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, p_PCTD_LOG[playerid][1], 0);
	PlayerTextDrawShow(playerid, p_PCTD_LOG[playerid][1]);
	return true;
}

redist::ClickCalculator(playerid, Text:textid) {
	if(GetTickCount()-lastcommand[playerid]<500) return false;
	lastcommand[playerid] = GetTickCount();
	new _x=-1;
	switch TextID[Text:textid] do {
		case PC_CLICK_PASSWORD: {
			if _PC[playerid][_login] *then return true;
			ShowPlayerDialog(playerid, DIALOG_LOGIN_PC, DIALOG_STYLE_PASSWORD, "Login Computer", "Input your account password for login you computer!", "Done", "Cancel");
		}
		case PC_CLICK_LOGIN: {
			if !_PC[playerid][_login] *then
				return ShowPlayerDialog(playerid, DIALOG_INVALID, DIALOG_STYLE_MSGBOX, "Error Login", "{FF0000}You must enter your account password first", "Ok", "");
		
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
		case PC_CLICK_DS: {
			while(++_x<29) TextDrawShowForPlayer(playerid, int_dealer_TD[_x]); _x=10;
			while(++_x<23) TextDrawHideForPlayer(playerid, PCTD_MAIN[_x]); _x=-1;
			SelectTextDraw(playerid, 0x35DCD2FF);
			_PC[playerid][_type]=PC_ACTION_DEALERSHIP;
		}
		case PC_CLICK_BROWSER: {
			_x=10;
			while(++_x<23) TextDrawHideForPlayer(playerid, PCTD_MAIN[_x]);
			_PC[playerid][_type]=PC_ACTION_BROWSER;
			showBrowser(playerid);
		}
		case BROWSER_CLICK_BACK: {
			_x=10;
			while(++_x<23) TextDrawShowForPlayer(playerid, PCTD_MAIN[_x]);
			_PC[playerid][_type]=PC_ACTION_MAIN;
			SelectTextDraw(playerid, 0xFFFFFF30);
			hideBrowser(playerid);
		}
		case PC_CLICK_CLOSE_DS: {
			switch _PC[playerid][_type] do {
				case PC_ACTION_DS: {
					_x=5;
					while(++_x<27) TextDrawShowForPlayer(playerid, int_dealer_TD[_x]); _x=-1;
					while(++_x<13) PlayerTextDrawDestroy(playerid, PCTD_dealerPTD[playerid][_x]); _x=-1;
					while(++_x<31) TextDrawHideForPlayer(playerid, PCTD_dealerTD[_x]); 
					SelectTextDraw(playerid, 0x35DCD2FF);
					_PC[playerid][_type]=PC_ACTION_DEALERSHIP;
					hide_ds_explore(playerid);
				}
				default: {
					_x=10;
					while(++_x<23) TextDrawShowForPlayer(playerid, PCTD_MAIN[_x]); _x=-1;
					while(++_x<29) TextDrawHideForPlayer(playerid, int_dealer_TD[_x]); _x=-1;
					SelectTextDraw(playerid, 0xFFFFFF30);
					_PC[playerid][_type]=PC_ACTION_MAIN;
				}
			}
		}
		case PC_CLICK_DS_CHEAP..PC_CLICK_DS_SPECIAL:
			showDealership(playerid, TextID[Text:textid]-PC_CLICK_DS_CHEAP);

		case PC_CLICK_DS_PREV:
			prev_ds_page(playerid);

		case PC_CLICK_DS_NEXT:
			next_ds_page(playerid);

		case PC_CLICK_DS_EXP_1..PC_CLICK_DS_EXP_6:
			click_ds_explore(playerid, TextID[Text:textid]-PC_CLICK_DS_EXP_1);

		case BROWSER_CLICK_SEARCH:
			toggleSearchWebsite(playerid);

		case BROWSER_CLICK_BET1..BROWSER_CLICK_BET5: {
			hoursSelect[playerid] = TextID[Text:textid]-BROWSER_CLICK_BET1;
			if(hoursBet[playerid][hoursSelect[playerid]])
				return sendComputerMessage(playerid, "Eroare:~n~Ai setat deja o suma pe aceasta culoare!");

			new const colors[][] = {"{129CE1}blue", "{F41818}red", "{FCED00}yellow", "{C52EC5}purple", "{2EE547}green"};
			format(gString, sizeof gString, "{FFFFFF}Are you sure you want to bet on the %s?\n{FFFFFF}Bet: $50.000 - $100.000.000", colors[TextID[Text:textid]-BROWSER_CLICK_BET1]);
			ShowPlayerDialog(playerid, DIALOG_PLACEBETS, DIALOG_STYLE_INPUT, "Place bet:", gString, "Bet", "Cancel");
		}
		case BROWSER_CLICK_PLACEBET: {
			if(alreadyBetPlace[playerid]) return sendComputerMessage(playerid, "Ai pus deja un bet!");
			if(!(hoursBet[playerid][0]+hoursBet[playerid][1]+hoursBet[playerid][2]+hoursBet[playerid][3]+hoursBet[playerid][4])) return sendComputerMessage(playerid, "Nu ai pariat nimic!");
			if(GetPlayerCash(playerid) < hoursBet[playerid][hoursSelect[playerid]]) return sendComputerMessage(playerid, "Nu ai aceasta suma de bani!");
			TextDrawSetString(TotalBet[11],"Waiting for bets..~n~~p~~h~start in 30 seconds..");
			new const colors[][] = {"~b~~h~blue","~r~red","~y~yellow","~p~purple","~g~green"};
			++totalBetPlace;
			new i=-1, amount;
			format(gString, 128,"there are %d bets already placed",totalBetPlace);
			TextDrawSetString(TotalBet[29],gString);
			gString = "Ai pariat pe culoarea/ile:";
			while(++i<5) {
				if(!hoursBet[playerid][i]) continue;
				amount+=hoursBet[playerid][i];
				format(gString,sizeof gString, "%s~n~%s~w~~h~: ~g~~h~%s", gString, colors[i], FormatNumber(hoursBet[playerid][i]));
			}
			GivePlayerCash(playerid, -amount);
			alreadyBetPlace[playerid] = true;
			sendComputerMessage(playerid, gString, 10);
 			setHoursStatus();
		}
		case BROWSER_CLICK_SKIN_1..BROWSER_CLICK_SKIN_3: showClientSkins(playerid, TextID[Text:textid]-BROWSER_CLICK_SKIN_1);
	}

	return true;
}

clickPlayerPC(playerid, PlayerText:playertextid) {
	switch PlayerTextID[playerid][PlayerText:playertextid] do {
		case PC_CLICK_DS_BUY..PC_CLICK_DS_BACK:
			clickActionDealership(playerid, PlayerTextID[playerid][PlayerText:playertextid]);

		case PC_CLICK_GOOGLE: redirectWebsite(playerid, PAGE_TYPE_GOOGLE);
		case PC_CLICK_DRPCIV: redirectWebsite(playerid, PAGE_TYPE_DRPCIV);
		case PC_CLICK_YOUTUBE: redirectWebsite(playerid, PAGE_TYPE_YOUTUBE);
		case PC_CLICK_TOTALBET: {
			Iter_Add(computer_players<PC_TYPE_HOURSBET>, playerid);
			redirectWebsite(playerid, PAGE_TYPE_TOTALBET);
		}
		case PC_CLICK_REDSKINS: redirectWebsite(playerid, PAGE_TYPE_REDSKINS);
		case BROWSER_CLICK_CSKIN_1..BROWSER_CLICK_CSKIN_10: {
			static const _types[][] = {"{A762BD}Epic Skin", "{D6B166}Rare Skin", "{B8B8B8}Common Skin"};
			listitemm[playerid] = PlayerTextID[playerid][PlayerText:playertextid]-BROWSER_CLICK_CSKIN_1;
			Dialog_ShowEx(playerid, clientSelectSkin, DIALOG_STYLE_MSGBOX, "Buy Skin", "{FFFFFF}Esti sigur ca vrei sa achizitionezi un %s {FFFFFF}?", "Da", "Nu", _types[listitemmm[playerid]]);
		}
	}
	return true;
}

std::_hide_player_PC(playerid, _x=-1) {
	switch _PC[playerid][_type] do {
		case PC_ACTION_LOADING: return SelectTextDraw(playerid, 0x6C6C6CFF);
		case PC_ACTION_LOGIN: {
			PlayerTextDrawDestroy(playerid, p_PCTD_LOG[playerid][0]);
			PlayerTextDrawDestroy(playerid, p_PCTD_LOG[playerid][1]);
			while(_x<7) TextDrawHideForPlayer(playerid, PCTD_LOG[++_x]); _x=-1;
		}
		case PC_ACTION_MAIN: {
			while(++_x<23) TextDrawHideForPlayer(playerid, PCTD_MAIN[_x]); _x=-1;
		}
		case PC_ACTION_DEALERSHIP: {
			while(++_x<29) TextDrawHideForPlayer(playerid, int_dealer_TD[_x]); _x=-1;
			while(++_x<11) TextDrawHideForPlayer(playerid, PCTD_MAIN[_x]); _x=-1;
		}
		case PC_ACTION_DS: {
			TextDrawHideForPlayer(playerid, int_dealer_TD[21]);
			while(++_x<11) TextDrawHideForPlayer(playerid, PCTD_MAIN[_x]); _x=-1;
			while(++_x<6) TextDrawHideForPlayer(playerid, int_dealer_TD[_x]); _x=26;
			while(++_x<29) TextDrawHideForPlayer(playerid, int_dealer_TD[_x]); _x=-1;
			while(++_x<13) PlayerTextDrawDestroy(playerid, PCTD_dealerPTD[playerid][_x]); _x=-1;
			while(++_x<31) TextDrawHideForPlayer(playerid, PCTD_dealerTD[_x]); 
			hide_ds_explore(playerid);
		}
		case PC_ACTION_BROWSER: {
			while(++_x<11) TextDrawHideForPlayer(playerid, PCTD_MAIN[_x]); _x=-1;
			hideBrowser(playerid);
		}
	}
	player_selected[playerid] = 0;
	PlayerTextDrawShow(playerid, FPS); 
	while(_x<2) TextDrawShowForPlayer(playerid, DataT[++_x]); _x=-1;
	if(PlayerInfo[playerid][pHud][1]) {
		while(++_x<11) TextDrawShowForPlayer(playerid, GoalTD[_x]); _x=-1;
		while(++_x<4) PlayerTextDrawShow(playerid, GoalPTD[_x]); _x=-1;
		updateJobGoal(playerid);
	}
	SetCameraBehindPlayer(playerid);
	PlayerTextDrawShow(playerid, PlayerLogo);
	PlayerTextDrawShow(playerid, ShowTD);
	while(++_x<6) TextDrawShowForPlayer(playerid, LogoTD[_x]); _x=1;
	new i = PlayerVar[playerid][HouseID];
	SetDynamicObjectMaterial(HouseInfo[i][hObjPC], 1, 8419, "vgsbldng1", "black32", 0xFFFFFFFF);
	_PC[playerid] = reset_var_PC;
	CancelSelectTextDraw(playerid);
	return true;
}


#include "./src/computer/dealership.pwn"
#include "./src/computer/browser/main.pwn"

#include <YSI_Coding\y_hooks>
hook OnPlayerDeath(playerid) {
	if(player_selected[playerid] == 12) _hide_player_PC(playerid);
	return true;
}

/*
static getNumPage() {
	new size = Iter_Count(marketObject);
	return ((size/5)+(size%5)?1:0);
}

static updateMarketScroll(playerid) {
    PlayerTextDrawDestroy(playerid, MarketPTD[playerid][15]);

    new Float:y, Float:height;
    ScrollBar(y, height, 124.375000, 183.000000, Iter_Count(marketObject), 5, _PC[playerid][_page]);
	MarketPTD[playerid][15] = CreatePlayerTextDraw(playerid, 489.000000, y, "LD_SPAC:WHITE");
	PlayerTextDrawLetterSize(playerid, MarketPTD[playerid][15], 0.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, MarketPTD[playerid][15], 1);
	PlayerTextDrawColor(playerid, MarketPTD[playerid][15], 3093759);
	PlayerTextDrawSetShadow(playerid, MarketPTD[playerid][15], 0);
	PlayerTextDrawSetOutline(playerid, MarketPTD[playerid][15], 0);
	PlayerTextDrawBackgroundColor(playerid, MarketPTD[playerid][15], 255);
	PlayerTextDrawFont(playerid, MarketPTD[playerid][15], 4);
	PlayerTextDrawSetProportional(playerid, MarketPTD[playerid][15], 0);
	PlayerTextDrawSetShadow(playerid, MarketPTD[playerid][15], 0);
	PlayerTextDrawTextSize(playerid, MarketPTD[playerid][15], 10.000000, height);

	PlayerTextDrawShow(playerid, MarketPTD[playerid][15]);
}

stock FristMarket(playerid) {
	LoadMarket(playerid); gString[0] = EOS;
	new x=0, e_Obj=0;
	_PC[playerid][_page] = 0;
	updateMarketScroll(playerid);
	while(x<5&&e_Obj<SQL_Market) {
		if(!MarketInfo[e_Obj][m_ID]) {
			e_Obj++;
			continue;
		}
		PlayerTextDrawSetPreviewModel(playerid, MarketPTD[playerid][x], MarketInfo[e_Obj][m_Model]), PlayerTextDrawShow(playerid, MarketPTD[playerid][x]);
		PlayerTextDrawSetString(playerid, MarketPTD[playerid][x+5], MarketInfo[e_Obj][m_Title]), PlayerTextDrawShow(playerid, MarketPTD[playerid][x+5]);
		format(gString, 30, "$%s", FormatNumber(MarketInfo[e_Obj][m_Price]));
		PlayerTextDrawSetString(playerid, MarketPTD[playerid][x+10], gString), PlayerTextDrawShow(playerid, MarketPTD[playerid][x+10]);
		TextDrawShowForPlayer(playerid, PCTD[x+45]);
		e_Obj++;
		x++;
	}
	PrevModel[playerid] = 0;
	LastModel[playerid] = e_Obj;
	return true;
}	

stock Next_Market(playerid) {
	if(LastModel[playerid]>=SQL_Market) return true;
	PrevModel[playerid] = LastModel[playerid]-1;
	new e_Obj=PrevModel[playerid],x=0; _PC[playerid][_page] ++; gString[0] = EOS;
	while(e_Obj<SQL_Market&&x<5) {
		if(!MarketInfo[e_Obj][m_ID]) {
			e_Obj++;
			continue;
		}
		PlayerTextDrawSetPreviewModel(playerid, MarketPTD[playerid][x], MarketInfo[e_Obj][m_Model]), PlayerTextDrawShow(playerid, MarketPTD[playerid][x]);
		PlayerTextDrawSetString(playerid, MarketPTD[playerid][x+5], MarketInfo[e_Obj][m_Title]), PlayerTextDrawShow(playerid, MarketPTD[playerid][x+5]);
		format(gString, 30, "$%s", FormatNumber(MarketInfo[e_Obj][m_Price]));
		PlayerTextDrawSetString(playerid, MarketPTD[playerid][x+10], gString), PlayerTextDrawShow(playerid, MarketPTD[playerid][x+10]);
		TextDrawShowForPlayer(playerid, PCTD[x+45]);
		e_Obj++;
		x++;
	}
	LastModel[playerid] = e_Obj;
	for(e_Obj=x;e_Obj<5;e_Obj++) PlayerTextDrawHide(playerid, MarketPTD[playerid][e_Obj]), PlayerTextDrawHide(playerid, MarketPTD[playerid][e_Obj+5]), PlayerTextDrawHide(playerid, MarketPTD[playerid][e_Obj+10]), TextDrawHideForPlayer(playerid, PCTD[e_Obj+45]);
	updateMarketScroll(playerid);
	return true;
}

stock Prev_Market(playerid) {
	if(PrevModel[playerid]<=0) return true;
	new e_Obj=PrevModel[playerid],x=4; _PC[playerid][_page] --; gString[0] = EOS;
	LastModel[playerid] = PrevModel[playerid]+1;
	while(x!=-1&&e_Obj!=-1) {
		if(!MarketInfo[e_Obj][m_ID]) {
			e_Obj--;
			continue;
		}
		PlayerTextDrawSetPreviewModel(playerid, MarketPTD[playerid][x], MarketInfo[e_Obj][m_Model]), PlayerTextDrawShow(playerid, MarketPTD[playerid][x]);
		PlayerTextDrawSetString(playerid, MarketPTD[playerid][x+5], MarketInfo[e_Obj][m_Title]), PlayerTextDrawShow(playerid, MarketPTD[playerid][x+5]);
		format(gString, 30, "$%s", FormatNumber(MarketInfo[e_Obj][m_Price]));
		PlayerTextDrawSetString(playerid, MarketPTD[playerid][x+10], gString), PlayerTextDrawShow(playerid, MarketPTD[playerid][x+10]);
		TextDrawShowForPlayer(playerid, PCTD[x+45]);
		e_Obj--;
		x--;
	}
	PrevModel[playerid] = e_Obj;
	updateMarketScroll(playerid);
	return true;
}

DB_LoadMarket() {
	gString[0] = (EOS);
	mysql_format(SQL, gQuery, 128, "SELECT * FROM `market` LIMIT %i", MAX_MARKET_OBJECT);
	mysql_tquery(SQL, gQuery, "SQL_Cache_Market");
}

function SQL_Cache_Market() {
	new x, ORM:ormid; SQL_Market = cache_num_rows();
	printf("[MySQL] Loading %d market object...", SQL_Market);
	if(!SQL_Market) return true;
	for(new i=0;i<SQL_Market;i++) {
		ormid = orm_create("market"), x = Iter_Free(marketObject);
		orm_addvar_int(ormid, MarketInfo[x][m_ID], "ID");
		orm_addvar_int(ormid, MarketInfo[x][m_Model], "Model");
		orm_addvar_int(ormid, MarketInfo[x][m_Userid], "Userid");
		orm_addvar_int(ormid, MarketInfo[x][m_Price], "Price");
		orm_addvar_int(ormid, MarketInfo[x][m_Type], "Type");
		orm_addvar_string(ormid, MarketInfo[x][m_Owner], MAX_PLAYER_NAME, "Owner");
		orm_addvar_string(ormid, MarketInfo[x][m_Title], 80, "Title");
		orm_addvar_string(ormid, MarketInfo[x][m_Description], 180, "Description");
 		orm_apply_cache(ormid, i), Iter_Add(marketObject, x);
	}
	return true;
}

stock ObjectType(x) {
	gString[0] = (EOS);
	switch(MarketInfo[x][m_Type]) {
		case 0: gString = "None";
		case 1: format(gString, 50, "Vehicle (%s)", GetVehicleName(MarketInfo[x][m_Model]));
		case 2: format(gString, 50, "Skin %d (%s)", MarketInfo[x][m_Model], GetSkinType(MarketInfo[x][m_Model]));
		case 3: format(gString, 50, "House %d", MarketInfo[x][m_Obj_ID]);
		case 4: format(gString, 50, "Business %d", MarketInfo[x][m_Obj_ID]);
	}
	return gString;
}

AddItemMarket(playerid) {
	new i = listitemmm[playerid], str[20]; gString[0] = (EOS);
	strmid(str, MarketInfo[i][m_Description], 0, 20);
	format(gString, sizeof gString, "Option\tOption\nTitle\t%s\nObiect\t%s\nPrice\t%s\nDescription\t%s%s\nAdauga anuntul", MarketInfo[i][m_Title], ObjectType(i), FormatNumber(MarketInfo[i][m_Price]), str, strlen(MarketInfo[i][m_Description]) >= 20 ? ("..."):(""));
	ShowPlayerDialog(playerid, DIALOG_MARKET, DIALOG_STYLE_TABLIST_HEADERS, " - Add Market Object - ", gString, "Select", "Back");
	return true;
}
LoadPlayerTextDrawPC(playerid) {
	for(new y=0,i=0;y<3;y++) {
		for(new x=0;x<5;x++) {
			PCPTD[playerid][i] = CreatePlayerTextDraw(playerid, 143.500000 + (x * 73.0), 103.812500 + (y * 60.8125), "");
			PlayerTextDrawLetterSize(playerid, PCPTD[playerid][i], 0.000000, 0.000000);
			PlayerTextDrawTextSize(playerid, PCPTD[playerid][i], 71.000000, 59.000000);
			PlayerTextDrawAlignment(playerid, PCPTD[playerid][i], 1);
			PlayerTextDrawColor(playerid, PCPTD[playerid][i], -1);
			PlayerTextDrawSetShadow(playerid, PCPTD[playerid][i], 0);
			PlayerTextDrawSetOutline(playerid, PCPTD[playerid][i], 0);
			PlayerTextDrawBackgroundColor(playerid, PCPTD[playerid][i], -234);
			PlayerTextDrawFont(playerid, PCPTD[playerid][i], 5);
			PlayerTextDrawSetProportional(playerid, PCPTD[playerid][i], 0);
			PlayerTextDrawSetShadow(playerid, PCPTD[playerid][i], 0);
			PlayerTextDrawSetPreviewModel(playerid, PCPTD[playerid][i], 411);
			PlayerTextDrawSetPreviewRot(playerid, PCPTD[playerid][i], -10.000000, 0.000000, -15.000000, 0.800000);
			PlayerTextDrawSetPreviewVehCol(playerid, PCPTD[playerid][i], 1, 1);
			PlayerTextDrawSetSelectable(playerid, PCPTD[playerid][i], true);
			PlayerTextID[playerid][_:PCPTD[playerid][i]] = i;

			PCPTD[playerid][i + 18] = CreatePlayerTextDraw(playerid, 210.500000 + (x * 73.0), 103.375000 + (y * 60.8125), " ");
			PlayerTextDrawLetterSize(playerid, PCPTD[playerid][i + 18], 0.177999, 0.729375);
			PlayerTextDrawAlignment(playerid, PCPTD[playerid][i + 18], 3);
			PlayerTextDrawColor(playerid, PCPTD[playerid][i + 18], -1);
			PlayerTextDrawSetShadow(playerid, PCPTD[playerid][i + 18], 0);
			PlayerTextDrawSetOutline(playerid, PCPTD[playerid][i + 18], 0);
			PlayerTextDrawBackgroundColor(playerid, PCPTD[playerid][i + 18], 255);
			PlayerTextDrawFont(playerid, PCPTD[playerid][i + 18], 2);
			PlayerTextDrawSetProportional(playerid, PCPTD[playerid][i + 18], 1);
			PlayerTextDrawSetShadow(playerid, PCPTD[playerid][i + 18], 0);
			i++;
		}
	}

	PCPTD[playerid][15] = CreatePlayerTextDraw(playerid, 496.500000, 307.250000, ">");
	PlayerTextDrawLetterSize(playerid, PCPTD[playerid][15], 0.446000, 1.333124);
	PlayerTextDrawTextSize(playerid, PCPTD[playerid][15], 18.000000, 17.000000);
	PlayerTextDrawAlignment(playerid, PCPTD[playerid][15], 2);
	PlayerTextDrawColor(playerid, PCPTD[playerid][15], -1);
	PlayerTextDrawUseBox(playerid, PCPTD[playerid][15], 1);
	PlayerTextDrawBoxColor(playerid, PCPTD[playerid][15], 16777086);
	PlayerTextDrawSetShadow(playerid, PCPTD[playerid][15], 0);
	PlayerTextDrawSetOutline(playerid, PCPTD[playerid][15], 1);
	PlayerTextDrawBackgroundColor(playerid, PCPTD[playerid][15], 59);
	PlayerTextDrawFont(playerid, PCPTD[playerid][15], 2);
	PlayerTextDrawSetProportional(playerid, PCPTD[playerid][15], 1);
	PlayerTextDrawSetShadow(playerid, PCPTD[playerid][15], 0);
	PlayerTextDrawSetSelectable(playerid, PCPTD[playerid][15], true);
	PlayerTextID[playerid][_:PCPTD[playerid][15]] = 16;

	PCPTD[playerid][16] = CreatePlayerTextDraw(playerid, 474.000000, 307.250000, "<");
	PlayerTextDrawLetterSize(playerid, PCPTD[playerid][16], 0.446000, 1.333124);
	PlayerTextDrawTextSize(playerid, PCPTD[playerid][16], 18.000000, 17.000000);
	PlayerTextDrawAlignment(playerid, PCPTD[playerid][16], 2);
	PlayerTextDrawColor(playerid, PCPTD[playerid][16], -1);
	PlayerTextDrawUseBox(playerid, PCPTD[playerid][16], 1);
	PlayerTextDrawBoxColor(playerid, PCPTD[playerid][16], 16777018);
	PlayerTextDrawSetShadow(playerid, PCPTD[playerid][16], 0);
	PlayerTextDrawSetOutline(playerid, PCPTD[playerid][16], 1);
	PlayerTextDrawBackgroundColor(playerid, PCPTD[playerid][16], 59);
	PlayerTextDrawFont(playerid, PCPTD[playerid][16], 2);
	PlayerTextDrawSetProportional(playerid, PCPTD[playerid][16], 1);
	PlayerTextDrawSetShadow(playerid, PCPTD[playerid][16], 0);
	PlayerTextDrawSetSelectable(playerid, PCPTD[playerid][16], true);
	PlayerTextID[playerid][_:PCPTD[playerid][16]] = 17;

	PCPTD[playerid][17] = CreatePlayerTextDraw(playerid, 144.000000, 303.750000, "page 1 of 2");
	PlayerTextDrawLetterSize(playerid, PCPTD[playerid][17], 0.243000, 1.127498);
	PlayerTextDrawAlignment(playerid, PCPTD[playerid][17], 1);
	PlayerTextDrawColor(playerid, PCPTD[playerid][17], -1);
	PlayerTextDrawSetShadow(playerid, PCPTD[playerid][17], 0);
	PlayerTextDrawSetOutline(playerid, PCPTD[playerid][17], 0);
	PlayerTextDrawBackgroundColor(playerid, PCPTD[playerid][17], 255);
	PlayerTextDrawFont(playerid, PCPTD[playerid][17], 2);
	PlayerTextDrawSetProportional(playerid, PCPTD[playerid][17], 1);
	PlayerTextDrawSetShadow(playerid, PCPTD[playerid][17], 0);

	PCPTD[playerid][33] = CreatePlayerTextDraw(playerid, 319.500000, 252.562500, "~w~.~b~~h~~h~.....~w~...~b~~h~~h~.....~w~.");
	PlayerTextDrawLetterSize(playerid, PCPTD[playerid][33], 0.522499, 2.435621);
	PlayerTextDrawAlignment(playerid, PCPTD[playerid][33], 2);
	PlayerTextDrawColor(playerid, PCPTD[playerid][33], -1);
	PlayerTextDrawSetShadow(playerid, PCPTD[playerid][33], 0);
	PlayerTextDrawSetOutline(playerid, PCPTD[playerid][33], 0);
	PlayerTextDrawBackgroundColor(playerid, PCPTD[playerid][33], 255);
	PlayerTextDrawFont(playerid, PCPTD[playerid][33], 1);
	PlayerTextDrawSetProportional(playerid, PCPTD[playerid][33], 1);
	PlayerTextDrawSetShadow(playerid, PCPTD[playerid][33], 0);

	PCPTD[playerid][34] = CreatePlayerTextDraw(playerid, 172.500000, 131.750000, "");
	PlayerTextDrawLetterSize(playerid, PCPTD[playerid][34], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, PCPTD[playerid][34], 137.000000, 107.000000);
	PlayerTextDrawAlignment(playerid, PCPTD[playerid][34], 1);
	PlayerTextDrawColor(playerid, PCPTD[playerid][34], -1);
	PlayerTextDrawSetShadow(playerid, PCPTD[playerid][34], 0);
	PlayerTextDrawSetOutline(playerid, PCPTD[playerid][34], 0);
	PlayerTextDrawBackgroundColor(playerid, PCPTD[playerid][34], -234);
	PlayerTextDrawFont(playerid, PCPTD[playerid][34], 5);
	PlayerTextDrawSetProportional(playerid, PCPTD[playerid][34], 0);
	PlayerTextDrawSetShadow(playerid, PCPTD[playerid][34], 0);
	PlayerTextDrawSetPreviewModel(playerid, PCPTD[playerid][34], 411);
	PlayerTextDrawSetPreviewRot(playerid, PCPTD[playerid][34], -10.000000, 0.000000, -15.000000, 0.800000);
	PlayerTextDrawSetPreviewVehCol(playerid, PCPTD[playerid][34], 1, 1);

	PCPTD[playerid][35] = CreatePlayerTextDraw(playerid, 313.500000, 133.500000, "Name: infernus~n~price: ~g~$100.000.000~w~~n~max. speed: 209~n~stock: 10");
	PlayerTextDrawLetterSize(playerid, PCPTD[playerid][35], 0.260500, 0.956874);
	PlayerTextDrawTextSize(playerid, PCPTD[playerid][35], 477.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, PCPTD[playerid][35], 1);
	PlayerTextDrawColor(playerid, PCPTD[playerid][35], -1);
	PlayerTextDrawUseBox(playerid, PCPTD[playerid][35], 1);
	PlayerTextDrawBoxColor(playerid, PCPTD[playerid][35], -241);
	PlayerTextDrawSetShadow(playerid, PCPTD[playerid][35], 0);
	PlayerTextDrawSetOutline(playerid, PCPTD[playerid][35], 1);
	PlayerTextDrawBackgroundColor(playerid, PCPTD[playerid][35], 58);
	PlayerTextDrawFont(playerid, PCPTD[playerid][35], 2);
	PlayerTextDrawSetProportional(playerid, PCPTD[playerid][35], 1);
	PlayerTextDrawSetShadow(playerid, PCPTD[playerid][35], 0);
}

LoadMarket(playerid) {
	for(new i=0;i<5;i++) {
		MarketPTD[playerid][i] = CreatePlayerTextDraw(playerid, 151.500000, 113.875000 + (i * 41.125), "");
		PlayerTextDrawLetterSize(playerid, MarketPTD[playerid][i], 0.000000, 0.000000);
		PlayerTextDrawTextSize(playerid, MarketPTD[playerid][i], 45.000000, 37.000000);
		PlayerTextDrawAlignment(playerid, MarketPTD[playerid][i], 1);
		PlayerTextDrawColor(playerid, MarketPTD[playerid][i], -1);
		PlayerTextDrawSetShadow(playerid, MarketPTD[playerid][i], 0);
		PlayerTextDrawSetOutline(playerid, MarketPTD[playerid][i], 0);
		PlayerTextDrawBackgroundColor(playerid, MarketPTD[playerid][i], 3093759);
		PlayerTextDrawFont(playerid, MarketPTD[playerid][i], 5);
		PlayerTextDrawSetProportional(playerid, MarketPTD[playerid][i], 0);
		PlayerTextDrawSetShadow(playerid, MarketPTD[playerid][i], 0);
		PlayerTextDrawSetPreviewModel(playerid, MarketPTD[playerid][i], 411);
		PlayerTextDrawSetPreviewRot(playerid, MarketPTD[playerid][i], 0.000000, 0.000000, -25.000000, 0.899999);
		PlayerTextDrawSetPreviewVehCol(playerid, MarketPTD[playerid][i], 1, 1);
		
		MarketPTD[playerid][i + 5] = CreatePlayerTextDraw(playerid, 200.000000, 113.437500 + (i * 41.125), " ");
		PlayerTextDrawLetterSize(playerid, MarketPTD[playerid][i + 5], 0.188997, 1.149376);
		PlayerTextDrawAlignment(playerid, MarketPTD[playerid][i + 5], 1);
		PlayerTextDrawColor(playerid, MarketPTD[playerid][i + 5], 255);
		PlayerTextDrawSetShadow(playerid, MarketPTD[playerid][i + 5], 0);
		PlayerTextDrawSetOutline(playerid, MarketPTD[playerid][i + 5], 0);
		PlayerTextDrawBackgroundColor(playerid, MarketPTD[playerid][i + 5], 255);
		PlayerTextDrawFont(playerid, MarketPTD[playerid][i + 5], 2);
		PlayerTextDrawSetProportional(playerid, MarketPTD[playerid][i + 5], 1);
		PlayerTextDrawSetShadow(playerid, MarketPTD[playerid][i + 5], 0);

		MarketPTD[playerid][i + 10] = CreatePlayerTextDraw(playerid, 477.000000, 140.562500 + (i * 41.125), " ");
		PlayerTextDrawLetterSize(playerid, MarketPTD[playerid][i + 10], 0.263998, 1.000625);
		PlayerTextDrawAlignment(playerid, MarketPTD[playerid][i + 10], 3);
		PlayerTextDrawColor(playerid, MarketPTD[playerid][i + 10], 3093759);
		PlayerTextDrawSetShadow(playerid, MarketPTD[playerid][i + 10], 0);
		PlayerTextDrawSetOutline(playerid, MarketPTD[playerid][i + 10], 1);
		PlayerTextDrawBackgroundColor(playerid, MarketPTD[playerid][i + 10], 0);
		PlayerTextDrawFont(playerid, MarketPTD[playerid][i + 10], 3);
		PlayerTextDrawSetProportional(playerid, MarketPTD[playerid][i + 10], 1);
		PlayerTextDrawSetShadow(playerid, MarketPTD[playerid][i + 10], 0);
	}
	MarketPTD[playerid][15] = CreatePlayerTextDraw(playerid, 489.000000, 124.375000, "LD_SPAC:WHITE");
	PlayerTextDrawLetterSize(playerid, MarketPTD[playerid][15], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, MarketPTD[playerid][15], 10.000000, 183.000000);
	PlayerTextDrawAlignment(playerid, MarketPTD[playerid][15], 1);
	PlayerTextDrawColor(playerid, MarketPTD[playerid][15], 3093759);
	PlayerTextDrawSetShadow(playerid, MarketPTD[playerid][15], 0);
	PlayerTextDrawSetOutline(playerid, MarketPTD[playerid][15], 0);
	PlayerTextDrawBackgroundColor(playerid, MarketPTD[playerid][15], 255);
	PlayerTextDrawFont(playerid, MarketPTD[playerid][15], 4);
	PlayerTextDrawSetProportional(playerid, MarketPTD[playerid][15], 0);
	PlayerTextDrawSetShadow(playerid, MarketPTD[playerid][15], 0);
}

DestroyMarket(playerid) for(new i=0;i<16;i++) PlayerTextDrawDestroy(playerid, MarketPTD[playerid][i]);*/
