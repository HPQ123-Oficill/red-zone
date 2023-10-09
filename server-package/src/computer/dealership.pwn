std::showDealership(playerid, _id, i=5, d=-1) {
	while(++i<27) TextDrawHideForPlayer(playerid, int_dealer_TD[i]);
	TextDrawShowForPlayer(playerid, int_dealer_TD[21]);
	d=DsStart[_id]-1,i=-1;
	while(++d<DsEnd[_id]&&++i<6) {
		TextDrawShowForPlayer(playerid, PCTD_dealerTD[i]);
		TextDrawShowForPlayer(playerid, PCTD_dealerTD[i+6]);
		TextDrawShowForPlayer(playerid, PCTD_dealerTD[i+12]);
		TextDrawShowForPlayer(playerid, PCTD_dealerTD[i+18]);

		PCTD_dealerPTD[playerid][i] = CreatePlayerTextDraw(playerid, 39.799987+((i%3)*209.2), 30.462547+((i/3)*178.6), "");
		PlayerTextDrawLetterSize(playerid, PCTD_dealerPTD[playerid][i], 0.000000, 0.000000);
		PlayerTextDrawTextSize(playerid, PCTD_dealerPTD[playerid][i], 144.000000, 173.000000);
		PlayerTextDrawAlignment(playerid, PCTD_dealerPTD[playerid][i], 1);
		PlayerTextDrawColor(playerid, PCTD_dealerPTD[playerid][i], -1);
		PlayerTextDrawSetShadow(playerid, PCTD_dealerPTD[playerid][i], 0);
		PlayerTextDrawSetOutline(playerid, PCTD_dealerPTD[playerid][i], 0);
		PlayerTextDrawBackgroundColor(playerid, PCTD_dealerPTD[playerid][i], 0);
		PlayerTextDrawFont(playerid, PCTD_dealerPTD[playerid][i], 5);
		PlayerTextDrawSetProportional(playerid, PCTD_dealerPTD[playerid][i], 0);
		PlayerTextDrawSetShadow(playerid, PCTD_dealerPTD[playerid][i], 0);
		PlayerTextDrawSetPreviewModel(playerid, PCTD_dealerPTD[playerid][i], DealerInfo[d][dModel]);
		PlayerTextDrawSetPreviewRot(playerid, PCTD_dealerPTD[playerid][i], 0.000000, 0.000000, -65.000000, 1.000000);
		PlayerTextDrawSetPreviewVehCol(playerid, PCTD_dealerPTD[playerid][i], 0, 0);
		PlayerTextDrawShow(playerid, PCTD_dealerPTD[playerid][i]);

		PCTD_dealerPTD[playerid][i+6] = CreatePlayerTextDraw(playerid, 31.800043+((i%3)*207.7), 64.875000+((i/3)*168.7), _det_info(d));
		PlayerTextDrawLetterSize(playerid, PCTD_dealerPTD[playerid][i+6], 0.223499, 1.127498);
		PlayerTextDrawAlignment(playerid, PCTD_dealerPTD[playerid][i+6], 1);
		PlayerTextDrawColor(playerid, PCTD_dealerPTD[playerid][i+6], 255);
		PlayerTextDrawSetShadow(playerid, PCTD_dealerPTD[playerid][i+6], 0);
		PlayerTextDrawSetOutline(playerid, PCTD_dealerPTD[playerid][i+6], 0);
		PlayerTextDrawBackgroundColor(playerid, PCTD_dealerPTD[playerid][i+6], 255);
		PlayerTextDrawFont(playerid, PCTD_dealerPTD[playerid][i+6], 2);
		PlayerTextDrawSetProportional(playerid, PCTD_dealerPTD[playerid][i+6], 1);
		PlayerTextDrawSetShadow(playerid, PCTD_dealerPTD[playerid][i+6], 0);
		PlayerTextDrawShow(playerid, PCTD_dealerPTD[playerid][i+6]);
	}
	_PC[playerid][_ID]=d;
	SelectTextDraw(playerid, 0x4B7C6AFF);
	_PC[playerid][_page] = 1;
	_PC[playerid][_restPC] = 0;
	_PC[playerid][_action] = false;
	_PC[playerid][_type] = PC_ACTION_DS;
	_PC[playerid][_temp_type] = _id;
	format(gString, 20, "%d/%d", _PC[playerid][_page], DsPage[_id]);

	PCTD_dealerPTD[playerid][12] = CreatePlayerTextDraw(playerid, 319.800018, 382.925079, gString);
	PlayerTextDrawLetterSize(playerid, PCTD_dealerPTD[playerid][12], 0.321000, 2.089998);
	PlayerTextDrawAlignment(playerid, PCTD_dealerPTD[playerid][12], 2);
	PlayerTextDrawColor(playerid, PCTD_dealerPTD[playerid][12], 255);
	PlayerTextDrawSetShadow(playerid, PCTD_dealerPTD[playerid][12], 0);
	PlayerTextDrawSetOutline(playerid, PCTD_dealerPTD[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, PCTD_dealerPTD[playerid][12], 255);
	PlayerTextDrawFont(playerid, PCTD_dealerPTD[playerid][12], 2);
	PlayerTextDrawSetProportional(playerid, PCTD_dealerPTD[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, PCTD_dealerPTD[playerid][12], 0);
	PlayerTextDrawShow(playerid, PCTD_dealerPTD[playerid][12]); i=-1;

	while(++i<6) TextDrawShowForPlayer(playerid, PCTD_dealerTD[i+25]);
	return true;
}

std::next_ds_page(playerid, _id=-1, i=-1, d=-1) {
	_id=_PC[playerid][_temp_type];
	if _PC[playerid][_ID] >= DsEnd[_id] *then 
		return true;

	hide_ds_explore(playerid);

	d=_PC[playerid][_ID]-1;
	while(++d<DsEnd[_id]&&++i<6)
		PlayerTextDrawSetPreviewModel(playerid, PCTD_dealerPTD[playerid][i], DealerInfo[d][dModel]),
		PlayerTextDrawSetString(playerid, PCTD_dealerPTD[playerid][i+6], _det_info(d)),
		PlayerTextDrawShow(playerid, PCTD_dealerPTD[playerid][i]);

	_PC[playerid][_restPC]=0;
	while(++i<6) 
		TextDrawHideForPlayer(playerid, PCTD_dealerTD[i]),
		TextDrawHideForPlayer(playerid, PCTD_dealerTD[i+6]),
		TextDrawHideForPlayer(playerid, PCTD_dealerTD[i+12]),
		TextDrawHideForPlayer(playerid, PCTD_dealerTD[i+18]),
		PlayerTextDrawHide(playerid, PCTD_dealerPTD[playerid][i]),
		PlayerTextDrawHide(playerid, PCTD_dealerPTD[playerid][i+6]),
		_PC[playerid][_restPC]++;

	_PC[playerid][_action]++,_PC[playerid][_page]++,_PC[playerid][_ID]=d;
	format(gString, 20, "%d/%d", _PC[playerid][_page], DsPage[_id]);
	PlayerTextDrawSetString(playerid, PCTD_dealerPTD[playerid][12], gString);
	return true;
}
std::prev_ds_page(playerid, _id=-1,d=-1,i=6) {
	_id=_PC[playerid][_temp_type];
	if _PC[playerid][_ID]-6 <= DsStart[_id] *then 
		return true;

	hide_ds_explore(playerid);

	_PC[playerid][_ID]-=6-_PC[playerid][_restPC];
	d=_PC[playerid][_ID],_PC[playerid][_restPC]=0;
	while(--d,--i!=-1) 
		PlayerTextDrawSetPreviewModel(playerid, PCTD_dealerPTD[playerid][i], DealerInfo[d][dModel]),
		PlayerTextDrawSetString(playerid, PCTD_dealerPTD[playerid][i+6], _det_info(d)),
		PlayerTextDrawShow(playerid, PCTD_dealerPTD[playerid][i+6]),
		PlayerTextDrawShow(playerid, PCTD_dealerPTD[playerid][i]),
		TextDrawShowForPlayer(playerid, PCTD_dealerTD[i]),
		TextDrawShowForPlayer(playerid, PCTD_dealerTD[i+6]),
		TextDrawShowForPlayer(playerid, PCTD_dealerTD[i+12]),
		TextDrawShowForPlayer(playerid, PCTD_dealerTD[i+18]);

	_PC[playerid][_action]++,_PC[playerid][_page]--;
	format(gString, 20, "%d/%d", _PC[playerid][_page], DsPage[_id]);
	PlayerTextDrawSetString(playerid, PCTD_dealerPTD[playerid][12], gString);
	return true;
}

std::hide_ds_explore(playerid, _x=-1) {
	if explore_TD[playerid][0] != PlayerText:INVALID_TEXT_DRAW *then {
		if !IsAdmin(playerid, 7) *then {
			while(++_x<8) PlayerTextDrawDestroy(playerid, explore_TD[playerid][_x]), explore_TD[playerid][_x] = PlayerText:INVALID_TEXT_DRAW; _x=-1;
		} else {
			while(++_x<10) PlayerTextDrawDestroy(playerid, explore_TD[playerid][_x]), explore_TD[playerid][_x] = PlayerText:INVALID_TEXT_DRAW; _x=-1;
		}
		PlayerTextDrawShow(playerid, PCTD_dealerPTD[playerid][9+(listitemmm[playerid]%3)]);
	}
	return true;
}

std::click_ds_explore(playerid, slot, _x=-1) {
	hide_ds_explore(playerid);
	if !IsAdmin(playerid, 7) *then {
		explore_TD[playerid][0] = CreatePlayerTextDraw(playerid, 41.800003 + ((slot%3)*211.29), 197.162536 + ((slot/3) * 43.79), "LD_SPAC:white");
		PlayerTextDrawLetterSize(playerid, explore_TD[playerid][0], 0.000000, 0.000000);
		PlayerTextDrawTextSize(playerid, explore_TD[playerid][0], 131.000000, 89.000000);
		PlayerTextDrawAlignment(playerid, explore_TD[playerid][0], 1);
		PlayerTextDrawColor(playerid, explore_TD[playerid][0], 690695237);
		PlayerTextDrawSetShadow(playerid, explore_TD[playerid][0], 0);
		PlayerTextDrawSetOutline(playerid, explore_TD[playerid][0], 0);
		PlayerTextDrawBackgroundColor(playerid, explore_TD[playerid][0], 255);
		PlayerTextDrawFont(playerid, explore_TD[playerid][0], 4);
		PlayerTextDrawSetProportional(playerid, explore_TD[playerid][0], 0);
		PlayerTextDrawSetShadow(playerid, explore_TD[playerid][0], 0);
		PlayerTextDrawShow(playerid, explore_TD[playerid][0]);

		explore_TD[playerid][1] = CreatePlayerTextDraw(playerid, 43.000007 + ((slot%3)*211.3), 198.300079 + ((slot/3) * 43.88), "LD_SPAC:white");
		PlayerTextDrawLetterSize(playerid, explore_TD[playerid][1], 0.000000, 0.000000);
		PlayerTextDrawTextSize(playerid, explore_TD[playerid][1], 129.000000, 86.000000);
		PlayerTextDrawAlignment(playerid, explore_TD[playerid][1], 1);
		PlayerTextDrawColor(playerid, explore_TD[playerid][1], 690695423);
		PlayerTextDrawSetShadow(playerid, explore_TD[playerid][1], 0);
		PlayerTextDrawSetOutline(playerid, explore_TD[playerid][1], 0);
		PlayerTextDrawBackgroundColor(playerid, explore_TD[playerid][1], 255);
		PlayerTextDrawFont(playerid, explore_TD[playerid][1], 4);
		PlayerTextDrawSetProportional(playerid, explore_TD[playerid][1], 0);
		PlayerTextDrawSetShadow(playerid, explore_TD[playerid][1], 0);
		PlayerTextDrawShow(playerid, explore_TD[playerid][1]);

		static const exp_name[][] = {"buy","sell","close"};
		while(++_x<3) {
			explore_TD[playerid][_x+2] = CreatePlayerTextDraw(playerid, 45.499992 + ((slot%3)*211.29), 201.537536 + ((slot/3) * 44.05) + (_x*27.37), "LD_SPAC:white");
			PlayerTextDrawLetterSize(playerid, explore_TD[playerid][_x+2], 0.000000, 0.000000);
			PlayerTextDrawTextSize(playerid, explore_TD[playerid][_x+2], 124.000000, 25.000000);
			PlayerTextDrawAlignment(playerid, explore_TD[playerid][_x+2], 1);
			PlayerTextDrawColor(playerid, explore_TD[playerid][_x+2], 0x6C9485FF);
			PlayerTextDrawSetShadow(playerid, explore_TD[playerid][_x+2], 0);
			PlayerTextDrawSetOutline(playerid, explore_TD[playerid][_x+2], 0);
			PlayerTextDrawBackgroundColor(playerid, explore_TD[playerid][_x+2], 255);
			PlayerTextDrawFont(playerid, explore_TD[playerid][_x+2], 4);
			PlayerTextDrawSetProportional(playerid, explore_TD[playerid][_x+2], 0);
			PlayerTextDrawSetShadow(playerid, explore_TD[playerid][_x+2], 0);
			PlayerTextDrawSetSelectable(playerid, explore_TD[playerid][_x+2], true);
			PlayerTextDrawShow(playerid, explore_TD[playerid][_x+2]);

			explore_TD[playerid][_x+5] = CreatePlayerTextDraw(playerid, 111.600006 + ((slot%3)*210.29), 204.949951 + ((slot/3) * 44.12) + (_x*28.60), exp_name[_x]);
			PlayerTextDrawLetterSize(playerid, explore_TD[playerid][_x+5], 0.414000, 1.757500);
			PlayerTextDrawAlignment(playerid, explore_TD[playerid][_x+5], 2);
			PlayerTextDrawColor(playerid, explore_TD[playerid][_x+5], -1);
			PlayerTextDrawSetShadow(playerid, explore_TD[playerid][_x+5], 0);
			PlayerTextDrawSetOutline(playerid, explore_TD[playerid][_x+5], 0);
			PlayerTextDrawBackgroundColor(playerid, explore_TD[playerid][_x+5], 255);
			PlayerTextDrawFont(playerid, explore_TD[playerid][_x+5], 2);
			PlayerTextDrawSetProportional(playerid, explore_TD[playerid][_x+5], 1);
			PlayerTextDrawSetShadow(playerid, explore_TD[playerid][_x+5], 0);
			PlayerTextDrawShow(playerid, explore_TD[playerid][_x+5]);
		}
		PlayerTextID[playerid][PlayerText:explore_TD[playerid][2]] = PC_CLICK_DS_BUY;
		PlayerTextID[playerid][PlayerText:explore_TD[playerid][3]] = PC_CLICK_DS_SELL;
		PlayerTextID[playerid][PlayerText:explore_TD[playerid][4]] = PC_CLICK_DS_BACK;
	} else {
		explore_TD[playerid][0] = CreatePlayerTextDraw(playerid, 41.800003 + ((slot%3)*211.29), 197.162536 + ((slot/3) * 19.00), "LD_SPAC:white");
		PlayerTextDrawLetterSize(playerid, explore_TD[playerid][0], 0.000000, 0.000000);
		PlayerTextDrawTextSize(playerid, explore_TD[playerid][0], 131.000000, 115.000000);
		PlayerTextDrawAlignment(playerid, explore_TD[playerid][0], 1);
		PlayerTextDrawColor(playerid, explore_TD[playerid][0], 690695237);
		PlayerTextDrawSetShadow(playerid, explore_TD[playerid][0], 0);
		PlayerTextDrawSetOutline(playerid, explore_TD[playerid][0], 0);
		PlayerTextDrawBackgroundColor(playerid, explore_TD[playerid][0], 255);
		PlayerTextDrawFont(playerid, explore_TD[playerid][0], 4);
		PlayerTextDrawSetProportional(playerid, explore_TD[playerid][0], 0);
		PlayerTextDrawSetShadow(playerid, explore_TD[playerid][0], 0);
		PlayerTextDrawShow(playerid, explore_TD[playerid][0]);

		explore_TD[playerid][1] = CreatePlayerTextDraw(playerid, 43.000007 + ((slot%3)*211.3), 198.300079 + ((slot/3) * 19.00), "LD_SPAC:white");
		PlayerTextDrawLetterSize(playerid, explore_TD[playerid][1], 0.000000, 0.000000);
		PlayerTextDrawTextSize(playerid, explore_TD[playerid][1], 129.000000, 113.000000);
		PlayerTextDrawAlignment(playerid, explore_TD[playerid][1], 1);
		PlayerTextDrawColor(playerid, explore_TD[playerid][1], 690695423);
		PlayerTextDrawSetShadow(playerid, explore_TD[playerid][1], 0);
		PlayerTextDrawSetOutline(playerid, explore_TD[playerid][1], 0);
		PlayerTextDrawBackgroundColor(playerid, explore_TD[playerid][1], 255);
		PlayerTextDrawFont(playerid, explore_TD[playerid][1], 4);
		PlayerTextDrawSetProportional(playerid, explore_TD[playerid][1], 0);
		PlayerTextDrawSetShadow(playerid, explore_TD[playerid][1], 0);
		PlayerTextDrawShow(playerid, explore_TD[playerid][1]);

		static const exp_name[][] = {"buy","sell","edit","close"};
		while(++_x<4) {
			explore_TD[playerid][_x+2] = CreatePlayerTextDraw(playerid, 45.499992 + ((slot%3)*211.29), 201.537536 + ((slot/3) * 19.00) + (_x*27.37), "LD_SPAC:white");
			PlayerTextDrawLetterSize(playerid, explore_TD[playerid][_x+2], 0.000000, 0.000000);
			PlayerTextDrawTextSize(playerid, explore_TD[playerid][_x+2], 124.000000, 25.000000);
			PlayerTextDrawAlignment(playerid, explore_TD[playerid][_x+2], 1);
			PlayerTextDrawColor(playerid, explore_TD[playerid][_x+2], 0x6C9485FF);
			PlayerTextDrawSetShadow(playerid, explore_TD[playerid][_x+2], 0);
			PlayerTextDrawSetOutline(playerid, explore_TD[playerid][_x+2], 0);
			PlayerTextDrawBackgroundColor(playerid, explore_TD[playerid][_x+2], 255);
			PlayerTextDrawFont(playerid, explore_TD[playerid][_x+2], 4);
			PlayerTextDrawSetProportional(playerid, explore_TD[playerid][_x+2], 0);
			PlayerTextDrawSetShadow(playerid, explore_TD[playerid][_x+2], 0);
			PlayerTextDrawSetSelectable(playerid, explore_TD[playerid][_x+2], true);
			PlayerTextDrawShow(playerid, explore_TD[playerid][_x+2]);

			explore_TD[playerid][_x+6] = CreatePlayerTextDraw(playerid, 111.600006 + ((slot%3)*210.29), 204.949951 + ((slot/3) * 19.00) + (_x*28.60), exp_name[_x]);
			PlayerTextDrawLetterSize(playerid, explore_TD[playerid][_x+6], 0.414000, 1.757500);
			PlayerTextDrawAlignment(playerid, explore_TD[playerid][_x+6], 2);
			PlayerTextDrawColor(playerid, explore_TD[playerid][_x+6], -1);
			PlayerTextDrawSetShadow(playerid, explore_TD[playerid][_x+6], 0);
			PlayerTextDrawSetOutline(playerid, explore_TD[playerid][_x+6], 0);
			PlayerTextDrawBackgroundColor(playerid, explore_TD[playerid][_x+6], 255);
			PlayerTextDrawFont(playerid, explore_TD[playerid][_x+6], 2);
			PlayerTextDrawSetProportional(playerid, explore_TD[playerid][_x+6], 1);
			PlayerTextDrawSetShadow(playerid, explore_TD[playerid][_x+6], 0);
			PlayerTextDrawShow(playerid, explore_TD[playerid][_x+6]);
		}
		PlayerTextID[playerid][PlayerText:explore_TD[playerid][2]] = PC_CLICK_DS_BUY;
		PlayerTextID[playerid][PlayerText:explore_TD[playerid][3]] = PC_CLICK_DS_SELL;
		PlayerTextID[playerid][PlayerText:explore_TD[playerid][4]] = PC_CLICK_DS_EDIT;
		PlayerTextID[playerid][PlayerText:explore_TD[playerid][5]] = PC_CLICK_DS_BACK;
	}
	PlayerTextDrawHide(playerid, PCTD_dealerPTD[playerid][9+(slot%3)]);
	PlayerVar[playerid][DealerID]=slot+(_PC[playerid][_ID]-6)+_PC[playerid][_restPC];
	listitemmm[playerid] = slot;
	return true;
}
std::clickActionDealership(playerid, id) {
	new v=PlayerVar[playerid][DealerID];
	switch id do {
		case PC_CLICK_DS_BUY: {
			if(!HaveTicket[playerid]) ShowPlayerDialog(playerid, DIALOG_BUYVEHICLE, DIALOG_STYLE_LIST, "Choose spawn", "Dealership\nHouse alley", "Select", "Close");
			else ShowPlayerDialog(playerid, DIALOG_BUYVEHICLE, DIALOG_STYLE_LIST, "Choose spawn", "Dealership", "Select", "Close");
		}
		case PC_CLICK_DS_SELL: {
			foreach(new i:MyVehicles<playerid>) {
				if DealerInfo[v][dModel]!=CarInfo[i][cModel] *then continue;
				
				listitemm[playerid] = i;
				gString[0] = EOS;
				format(gString, 128, "Are you sure you want to sell the %s for $%s?", GetVehicleName(CarInfo[i][cModel]), FormatNumber(CarInfo[i][cPrice]/2));
				ShowPlayerDialog(playerid, DIALOG_SELLCAR, DIALOG_STYLE_MSGBOX, "Sell car", gString, "Yes", "No");
				return true;
			}
			ShowPlayerDialog(playerid, DIALOG_INVALID, DIALOG_STYLE_MSGBOX, "Sell Car", "Nu ai acest tip de vehicul!", "Close", "");
		}
		case PC_CLICK_DS_EDIT: ShowPlayerDialog(playerid, DIALOG_EDITDS, DIALOG_STYLE_LIST, "Edit dealership", "Price\nPremium Points\nStock", "Select", "Close");
		case PC_CLICK_DS_BACK: hide_ds_explore(playerid);
	}
	return true;
}

std::_det_info(i) {
	if(!DealerInfo[i][dPremiumPoints]) format(gString, 75, "%s~n~~g~$ ~l~%s~n~stock: %d", GetVehicleName(DealerInfo[i][dModel]), FormatNumber(DealerInfo[i][dPrice]), DealerInfo[i][dStock]);
	else format(gString, 75, "%s~n~~p~PP~l~%d~n~stock: %d", GetVehicleName(DealerInfo[i][dModel]), DealerInfo[i][dPremiumPoints], DealerInfo[i][dStock]);
	return gString;
}

redist::SQL_InsertVehicleDS(playerid, x, types) {
	if(!PlayerVar[playerid][IsHouses]&&types!=0) return true;
	DealerInfo[x][dStock] --;
	gQuery[false] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `dsvehicle` SET `Stock`='%d' WHERE `ID`='%d'", DealerInfo[x][dStock], DealerInfo[x][dID]);
	mysql_tquery(SQL, gQuery);

	new idd = CheckPlayerVehicles();
	CarInfo[idd][cID] = cache_insert_id();
	GivePlayerKey(playerid, idd);
	if(DealerInfo[x][dPrice] < 500000) checkBP(playerid, 8, 150);
	if(DealerInfo[x][dPrice] > 1000000) checkBP(playerid, 23, 200);
	CarInfo[idd][cUserid] = PlayerInfo[playerid][pSQLID];
	CarInfo[idd][cModel] = DealerInfo[x][dModel];
	CarInfo[idd][cPrice] = DealerInfo[x][dPrice];
	CarInfo[idd][cColor][false] = true;
	CarInfo[idd][cColor][true] = true;
	strmid(CarInfo[idd][cOwner], PlayerInfo[playerid][pName], false, strlen(PlayerInfo[playerid][pName]), 255);
	strmid(CarInfo[idd][cLicense], "NewCar", false, 6, 255);
	switch(types) {
		case 0: {
			if(DealerInfo[x][dPrice] != 0) {
				new y = random(sizeof(DealerPos));
				for(new i = false; i < 4; i++) {
					CarInfo[idd][cPos][i] = CarInfo[idd][cLastPos][i] = DealerPos[y][i];
					CarInfo[idd][cComponents][i] = false;
				}
			} else {
				CarInfo[idd][cPos][0] = 388.9276; CarInfo[idd][cPos][1] = -1522.6925; CarInfo[idd][cPos][2] = 32.1492; CarInfo[idd][cPos][3] = 41.1164;
				CarInfo[idd][cLastPos][0] = 388.9276; CarInfo[idd][cLastPos][1] = -1522.6925; CarInfo[idd][cLastPos][2] = 32.1492; CarInfo[idd][cLastPos][3] = 41.1164;
				for(new i = false; i < 4; i++) CarInfo[idd][cComponents][i] = false;
			}
		}
		case 1: {
			new houseid = PlayerVar[playerid][IsHouses];
			CarInfo[idd][cLastPos][0] = CarInfo[idd][cPos][0] = HouseInfo[houseid][hAleaX];
			CarInfo[idd][cLastPos][1] = CarInfo[idd][cPos][1] = HouseInfo[houseid][hAleaY];
			CarInfo[idd][cLastPos][2] = CarInfo[idd][cPos][2] = HouseInfo[houseid][hAleaZ];
			CarInfo[idd][cLastPos][3] = CarInfo[idd][cPos][3] = HouseInfo[houseid][hAleaZAngle];
			for(new i = false; i < 4; i++) CarInfo[idd][cComponents][i] = false;
		}
	}
	CarInfo[idd][cDays] = false;	CarInfo[idd][cHealth] = 999.0; 		CarInfo[idd][cOdometer] = 0.0; 			CarInfo[idd][cInsurance] = 1000;	
	CarInfo[idd][cPoints] = 5;		CarInfo[idd][cStatus] = true;		CarInfo[idd][cVirtual] = false; 		CarInfo[idd][cRainbow] = false;
	for(new i = false; i < 14; i++) CarInfo[idd][cMod][i] = false;		CarInfo[idd][cFuel] = 100;				CarInfo[idd][cNeon] = 0;
	CarInfo[idd][cText] = EOS;		CarInfo[idd][cVipStatus] = false;	CarInfo[idd][cPaintjob] = 3;
	CarInfo[idd][cLeft] = 0;		CarInfo[idd][cOnline] = playerid;
	CreatePlayerCar(idd);
	UpdateCar(idd);
	UpdateCar2(idd);
	if(CP[playerid] == DISABLE_CHECKPOINT) {
		new Float: vX, Float: vY, Float: vZ;
		GetVehiclePos(CarInfo[idd][cSpawned], vX, vY, vZ);
		SetPlayerCheckpointEx(playerid, CP_NORMAL, vX, vY, vZ, 5.0);
	}
	gString[false] = EOS;
	if(!DealerInfo[x][dPremiumPoints]) {
		new LastMoney[40];
		format(LastMoney, 40, formatBytes(money[playerid]));
		GivePlayerCash(playerid, -DealerInfo[x][dPrice]);
		format(gString, 150, "Name: %s~n~Price: %s$%s~n~~w~max.speed: %d~n~stock: %d", GetVehicleName(DealerInfo[x][dModel]), GetPlayerCash(playerid)<DealerInfo[x][dPrice]?("~r~"):("~g~"), FormatNumber(DealerInfo[x][dPrice]), GetVehicleMaxSpeed(DealerInfo[x][dModel]), DealerInfo[x][dStock]);
		PlayerTextDrawSetString(playerid, PCPTD[playerid][35], gString); 
		format(gString, sizeof(gString), "Congratulations! You have purchased a %s for $%s.", GetVehicleName(DealerInfo[x][dModel]), FormatNumber(DealerInfo[x][dPrice]));
		SCM(playerid, COLOR_MONEY, gString);
		format(gString, sizeof(gString), "%s bought a %s[%d], (last money: $%s / new money: $%s)", GetName(playerid), GetVehicleName(DealerInfo[x][dModel]), cache_insert_id(), LastMoney, formatBytes(money[playerid]));
	}
	else {
		new pp = PlayerInfo[playerid][pPremiumPoints];
		PlayerInfo[playerid][pPremiumPoints] -= DealerInfo[x][dPremiumPoints];
		UpdateVar(playerid, "PremiumPoints", PlayerInfo[playerid][pPremiumPoints]);
		format(gString, 150, "Name: %s~n~Price: %s%d PP~n~~w~max.speed: %d~n~stock: %d", GetVehicleName(DealerInfo[x][dModel]), PlayerInfo[playerid][pPremiumPoints]<DealerInfo[x][dPremiumPoints]?("~r~"):("~p~"), DealerInfo[x][dPremiumPoints], GetVehicleMaxSpeed(DealerInfo[x][dModel]), DealerInfo[x][dStock]);
		PlayerTextDrawSetString(playerid, PCPTD[playerid][35], gString);
		format(gString, sizeof(gString), "Congratulations! You have purchased a %s for %d Premium Points.", GetVehicleName(DealerInfo[x][dModel]), DealerInfo[x][dPremiumPoints]);
		SCM(playerid, COLOR_MONEY, gString);
		format(gString, sizeof(gString), "%s bought a %s[%d], (last money: %d PP / new money: %d PP)", GetName(playerid), GetVehicleName(DealerInfo[x][dModel]), cache_insert_id(), pp, PlayerInfo[playerid][pPremiumPoints]);
	}
	SendAdminMessage(COLOR_YELLOW, gString, 1); 
	return true;
}

redist::SQL_LoadDealerShip() {
	SqlDealership = cache_num_rows();
	printf("[MySQL] DealerShip: %d", SqlDealership);
	for(new x=0;x<4;x++) DsStart[x] = -1;
	if(SqlDealership == 0) return true;
	new i=-1;
	while(++i<SqlDealership) {
		cache_get_value_name_int(i, "ID", DealerInfo[i][dID]);
		cache_get_value_name_int(i, "Model", DealerInfo[i][dModel]);
		cache_get_value_name_int(i, "Price", DealerInfo[i][dPrice]);
		cache_get_value_name_int(i, "PremiumPoints", DealerInfo[i][dPremiumPoints]);
		cache_get_value_name_int(i, "Stock", DealerInfo[i][dStock]);

		if(DealerInfo[i][dPremiumPoints] > 0) continue;
		else if(DealerInfo[i][dPrice] > 0 && DealerInfo[i][dPrice] <= 7000000) DsEnd[0]=i+1;
		else if(DealerInfo[i][dPrice] > 7000000 && DealerInfo[i][dPrice] <= 26000000) DsEnd[1]=i+1;
		else DsEnd[2]=i+1;
	}
	DsStart[0] = 0;
	DsStart[1] = DsEnd[0];
	DsStart[2] = DsEnd[1];
	DsStart[3] = DsEnd[2];
	for(i=0;i<3;i++) DsPage[i] = ((DsEnd[i]-DsStart[i])/6) + ((DsEnd[i]-DsStart[i])%6?1:0);
	mysql_format(SQL, gQuery, sizeof(gQuery), "SELECT * FROM `dsvehicle` WHERE `PremiumPoints` > '0' AND `Price` = '0' ORDER BY `dsvehicle`.`PremiumPoints` ASC LIMIT %d", MAX_DS_VEHICLE);
 	mysql_tquery(SQL, gQuery, "SQL_LoadDealerShipv2", "");
	return true;
} 

redist::SQL_LoadDealerShipv2() {
	printf("[MySQL] DealerShip: %d Premium vehicles", cache_num_rows());
	if(!cache_num_rows()) return true;
	for(new i = DsStart[3],x=0; i < DsStart[3]+cache_num_rows(); i++) {
		cache_get_value_name_int(x, "ID", DealerInfo[i][dID]);
		cache_get_value_name_int(x, "Model", DealerInfo[i][dModel]);
		cache_get_value_name_int(x, "Stock", DealerInfo[i][dStock]);
		cache_get_value_name_int(x, "PremiumPoints", DealerInfo[i][dPremiumPoints]);

		DsEnd[3]++;x++;
	}
	DsEnd[3] = SqlDealership = DsStart[3]+cache_num_rows();
	DsPage[3] = ((DsEnd[3]-DsStart[3])/6) + ((DsEnd[3]-DsStart[3])%6?1:0);
	return true;
}
// ==================================== comands ======================== //
YCMD:dsadd(playerid, params[], help) {
	if(!IsAdmin(playerid, 7)) 
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new model, type[25], price, dsstock;
	if(sscanf(params, "is[25]ii", model, type, price, dsstock)) {
		SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/dsadd [model] [type] [price] [stock]");	
		SCM(playerid, COLOR_WHITE, "Type: PremiumPoints / money");
		return true;
	}
	if(model < 400 || model > 611)
		return SCM(playerid, COLOR_GREY, "Model invalid.");

	if(1 < price > 2000000000)
		return SCM(playerid, COLOR_GREY, "Suma Invalida.");

	if(CheckDS(playerid, 1, model, 0) != -1) return SCM(playerid, COLOR_GREY, "There is already this model in ds.");

	new types;
	if(strcmp(type, "money", true) == 0) {
		types = 0;
		gString[0] = EOS;
		format(gString, sizeof(gString), "/dsadd: Admin %s[admin: %d] added car %d (%s) to the DS. | Price: $%s | Stock: %d", GetName(playerid), PlayerInfo[playerid][pSQLID], model, GetVehicleName(model), FormatNumber(price), dsstock);
		SendAdminMessage(COLOR_ADMCMD, gString, 3);
	}
	else if(strcmp(type, "PremiumPoints", true) == 0) {
		types = 1;
		gString[0] = EOS;
		format(gString, sizeof(gString), "/dsadd: Admin %s[admin: %d] added car %d (%s) to the DS. | Price: %s PP | Stock: %d", GetName(playerid), PlayerInfo[playerid][pSQLID], model, GetVehicleName(model), FormatNumber(price), dsstock);
		SendAdminMessage(COLOR_ADMCMD, gString, 3);
	}
	else {
		SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/dsadd [model] [type] [price] [stock]");	
		SCM(playerid, COLOR_WHITE, "Type: PremiumPoints / money");
		return true;		
	}
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "INSERT INTO dsvehicle (Model, %s, Stock) VALUES (%d, %d, %d)", types != 1 ? ("Price") : ("PremiumPoints"), model, price, dsstock);
	mysql_tquery(SQL, gQuery, "InsertDsVehicle", "iiiii", model, types, type, price, dsstock);
	mysql_format(SQL, gQuery, sizeof(gQuery), "SELECT * FROM `dsvehicle` WHERE `Price` > '0' AND `PremiumPoints` = '0' ORDER BY `dsvehicle`.`Price` ASC LIMIT %d", MAX_DS_VEHICLE);
 	mysql_tquery(SQL, gQuery, "SQL_LoadDealerShip", "");
 	SendAdminMessage(COLOR_ADMCMD, "[DS] Re-loading vehicle models..", 3);
	return true;
}

YCMD:editprice(playerid, params[], help) {
	if(!IsAdmin(playerid, 7))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new price;
	if(sscanf(params, "s[32]i", params, price))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/editprice: [model/name] [price]");

	new model = -1;
	for(new v = 400; v < 612; v++) if(strfind(GetVehicleName(v), params, true) != -1 || v == strval(params)) {
		model = v;
		break;
	}
	printf("%d", model);
	if(model == -1) return SCM(playerid, COLOR_GREY, "Invalid model");

	new x=-1, i=-1;
	while(++i<SqlDealership) {
		if(DealerInfo[i][dModel] != model) continue;
		x=i;
		break;
	}

	if(1 < price > 2000000000)
		return SCM(playerid, COLOR_GREY, "Invalid Price.");

	CheckDS(playerid, 2, model, price, x);
	return true;
}

YCMD:dsprice(playerid, params[], help) {
	if(!IsAdmin(playerid, 1) && !IsHelper(playerid, 1)) 
		return true;
	
	if(sscanf(params, "s[30]", params)) 
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/dsprice [name/model]");

	new bool: x = false, car = -1;
	for(new v = 400; v < 612; v++) if(strfind(GetVehicleName(v), params, true) != -1 || v == strval(params)) {
		car = v;
		break;
	}
	if(car == -1) return SCM(playerid, COLOR_GREY, "Invalid model");
	gString[0] = EOS;
	for(new i = 0; i < SqlDealership; i++) {
		if(DealerInfo[i][dModel] == car) {
			x = true;
			format(gString, 150, "Dealership Price - %s: {B9FF80}$%s speed %d km/h, %d on stock.", GetVehicleName(DealerInfo[i][dModel]), FormatNumber(DealerInfo[i][dPrice]), GetVehicleMaxSpeed(DealerInfo[i][dModel]), DealerInfo[i][dStock]);
			SCM(playerid, -1, gString);
		}	
	}
	if(x == false) return SCM(playerid, COLOR_GREY, "* Nu au fost gasite rezultate!");	
	return true;
}

YCMD:dsstock(playerid, params[], help) {
	if(!IsAdmin(playerid, 7))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new model, dsstock;
	if(sscanf(params, "ii", model, dsstock))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/dsstock: [model] [stock]");

	CheckDS(playerid, 3, model, dsstock);
	return true;
}

YCMD:dsremove(playerid, params[], help) {
	if(!IsAdmin(playerid, 7))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new model;
	if(sscanf(params, "i", model))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/dsremove [model]");

	CheckDS(playerid, 0, model, 0);
	return true;
}

function SQL_Reload() {
	mysql_format(SQL, gQuery, sizeof(gQuery), "SELECT * FROM `dsvehicle` WHERE `Price` > '0' AND `PremiumPoints` = '0' ORDER BY `dsvehicle`.`Price` ASC LIMIT %d", MAX_DS_VEHICLE);
 	mysql_tquery(SQL, gQuery, "SQL_LoadDealerShip", "");
 	return true;
}

std::CheckDS(playerid, cases, model, price, x=-1, i=-1) {
	if(x==-1) {
		while(++i<SqlDealership) {
			if(DealerInfo[i][dModel] != model) continue;
			x=i;
			break;
		}
	}

	switch(cases) {
		case 0: {
			if(x == -1) return SCM(playerid, COLOR_GREY, "Invalid Model ID.");
			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof(gQuery), "DELETE FROM `dsvehicle` WHERE `ID`='%d'", DealerInfo[x][dID]);
			mysql_tquery(SQL, gQuery, "SQL_Reload", "");
			format(gString, sizeof(gString), "/dsremove: Admin %s[admin: %d] remove car %d (%s) to the DS.", GetName(playerid), PlayerInfo[playerid][pSQLID], model, GetVehicleName(model));
			SendAdminMessage(COLOR_RED, gString, 3);
		}
		case 1: if x!=-1 *then return true;
		case 2: {
			if(x == -1) return SCM(playerid, COLOR_GREY, "Invalid Model ID.");

			gQuery[0] = EOS;
			if(DealerInfo[x][dPrice] > 0) {
				mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `dsvehicle` SET `Price`='%d' WHERE `ID`='%d'", price, DealerInfo[x][dID]);
				if(_PC[playerid][_type] != PC_ACTION_DS) format(gString, sizeof(gString), "/editprice: Admin %s[admin: %d] price car %d (%s) to the DS. price: $%s", GetName(playerid), PlayerInfo[playerid][pSQLID], model, GetVehicleName(model), FormatNumber(price)), SendAdminMessage(COLOR_ADMCMD, gString, 3);		
			} 
			else {
				mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `dsvehicle` SET `PremiumPoints`='%d' WHERE `ID`='%d'", price, DealerInfo[x][dID]);
				if(_PC[playerid][_type] != PC_ACTION_DS) format(gString, sizeof(gString), "/editprice: Admin %s[admin: %d] price car %d (%s) to the DS. price: %s PP", GetName(playerid), PlayerInfo[playerid][pSQLID], model, GetVehicleName(model), FormatNumber(price)), SendAdminMessage(COLOR_ADMCMD, gString, 3);	
			}
			if(_PC[playerid][_type] == PC_ACTION_DS) PlayerTextDrawSetString(playerid, PCTD_dealerPTD[playerid][listitemmm[playerid]+6], _det_info(x));
			mysql_tquery(SQL, gQuery, "", "");
			mysql_format(SQL, gQuery, sizeof(gQuery), "SELECT * FROM `dsvehicle` WHERE `Price` > '0' AND `PremiumPoints` = '0' ORDER BY `dsvehicle`.`Price` ASC LIMIT %d", MAX_DS_VEHICLE);
 			mysql_tquery(SQL, gQuery, "SQL_LoadDealerShip", "");
		}
		case 3: {
			if(x == -1) return SCM(playerid, COLOR_GREY, "Invalid Model ID.");			

			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `dsvehicle` SET `Stock`='%d' WHERE `ID`='%d'", price, DealerInfo[x][dID]);
			mysql_tquery(SQL, gQuery, "", "");
			DealerInfo[x][dStock] = price;
			if(_PC[playerid][_type] == PC_ACTION_DS) PlayerTextDrawSetString(playerid, PCTD_dealerPTD[playerid][listitemmm[playerid]+6], _det_info(x));
			else {
				format(gString, sizeof(gString), "/dsstock: Admin %s[admin: %d] stock car %d (%s) to the DS. Stock: %s", GetName(playerid), PlayerInfo[playerid][pSQLID], model, GetVehicleName(model), FormatNumber(price));
				SendAdminMessage(COLOR_ADMCMD, gString, 3);	
			}
		}
	}
	return -1;
}