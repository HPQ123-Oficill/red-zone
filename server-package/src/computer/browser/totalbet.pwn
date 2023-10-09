std::redirectTotalBet(client, x=-1) {
	while(++x<30) TextDrawShowForPlayer(client, TotalBet[x]);
	TextDrawShowForPlayer(client, TotalBet[34]);
	return true;
}
enum {
	HOURS_NONE,
	HOURS_WAIT,
	HOURS_START,
	HOURS_PROGRESS
}

new timerBet, betStatus = HOURS_NONE, _timerBets, Float:lastHoursePos[5] = {0.0,...}, hourseAnimStatus[5] = {5, ...}, hourseWin = -1;


std::setHoursStatus() {
	if(betStatus!=HOURS_NONE) return true;

	betStatus = HOURS_WAIT;
	timerBet = 30;
	SetTimer(#hours_start_timer, 1000, false);
	return true;
}

redist::hours_start_timer() {
	new h=-1;
	if(--timerBet)  {
		SetTimer(#hours_start_timer, 1000, false);
		format(gString,sizeof gString,"Waiting for bets..~n~~p~~h~start in %d seconds..", timerBet);
		TextDrawSetString(TotalBet[11],gString);
	}
	else {
		betStatus = HOURS_START; 
		timerBet=4;
		hourseWin=-1;
		while(++h<5) {
			TextDrawDestroy(hourseTD[h]);
			TextDrawDestroy(manHoursTD[h]);

			hourseAnimStatus[h] = 5;
			lastHoursePos[h] = 0.0;

			hourseTD[h] = TextDrawCreate(-1.119804, 209.249771 + (h * 32.083435), "ld_otb:hrs5");
			TextDrawLetterSize(hourseTD[h], 0.000000, 0.000000);
			TextDrawTextSize(hourseTD[h], 44.000000, 65.000000);
			TextDrawAlignment(hourseTD[h], 1);
			TextDrawColor(hourseTD[h], -1);
			TextDrawSetShadow(hourseTD[h], 0);
			TextDrawSetOutline(hourseTD[h], 0);
			TextDrawBackgroundColor(hourseTD[h], 255);
			TextDrawFont(hourseTD[h], 4);
			TextDrawSetProportional(hourseTD[h], 0);
			TextDrawSetShadow(hourseTD[h], 0);

			format(gString,sizeof gString,"ld_otb2:ric%d",h+1);
			manHoursTD[h] = TextDrawCreate(15.746643, 203.416793 + (h * 29.749985), gString);
			TextDrawLetterSize(manHoursTD[h], 0.000000, 0.000000);
			TextDrawTextSize(manHoursTD[h], 25.000000, 29.000000);
			TextDrawAlignment(manHoursTD[h], 1);
			TextDrawColor(manHoursTD[h], -1);
			TextDrawSetShadow(manHoursTD[h], 0);
			TextDrawSetOutline(manHoursTD[h], 0);
			TextDrawBackgroundColor(manHoursTD[h], 255);
			TextDrawFont(manHoursTD[h], 4);
			TextDrawSetProportional(manHoursTD[h], 0);
			TextDrawSetShadow(manHoursTD[h], 0);
		}
		TextDrawSetString(TotalBet[34], "~r~~h~3");
		foreach(new p : computer_players<PC_TYPE_HOURSBET>) {
			h=8;
			while(++h<30) TextDrawHideForPlayer(p,TotalBet[h]); --h;
			while(++h<34) TextDrawShowForPlayer(p,TotalBet[h]); h=-1;
			while(++h<5)
				TextDrawShowForPlayer(p, hourseTD[h]),
				TextDrawShowForPlayer(p, manHoursTD[h]);
		}
		_timerBets = SetTimer(#hourse_start_in, 1000, true);
	}
	return true;
}

redist::hourse_start_in() {
	switch(--timerBet) {
		case 3: TextDrawSetString(TotalBet[34], "~y~~h~2");
		case 2: TextDrawSetString(TotalBet[34], "~g~~h~1");
		case 1: {
			TextDrawSetString(TotalBet[34], "~g~~h~~h~go!");
			KillTimer(_timerBets);
			_timerBets = SetTimer(#hours_while, 100, true);
			SetTimer(#hourse_start_in, 1000, false);
			betStatus = HOURS_PROGRESS;
		}
		case 0: TextDrawSetString(TotalBet[34], "");
	}
	return true;
}

redist::hours_while() {
	new h=-1, total_horuse_end;
	while(++h<5) {
		if(lastHoursePos[h]-1.119804 >= 645) { ++total_horuse_end; continue; }

		TextDrawDestroy(hourseTD[h]);
		TextDrawDestroy(manHoursTD[h]);

		switch(random(200)) {
			case 0..70: lastHoursePos[h] += 1.0;
			case 71..120: lastHoursePos[h] += 0.5;
			case 121..150: lastHoursePos[h] += 3.0;
			default: lastHoursePos[h] += 2.0;
		}

		++hourseAnimStatus[h];
		if(hourseAnimStatus[h] > 7) hourseAnimStatus[h] = 1;

		format(gString,sizeof gString,"ld_otb:hrs%d",hourseAnimStatus[h]);
		hourseTD[h] = TextDrawCreate(-1.119804 + lastHoursePos[h], 209.249771 + (h * 32.083435),gString);
		TextDrawLetterSize(hourseTD[h], 0.000000, 0.000000);
		TextDrawTextSize(hourseTD[h], 44.000000, 65.000000);
		TextDrawAlignment(hourseTD[h], 1);
		TextDrawColor(hourseTD[h], -1);
		TextDrawSetShadow(hourseTD[h], 0);
		TextDrawSetOutline(hourseTD[h], 0);
		TextDrawBackgroundColor(hourseTD[h], 255);
		TextDrawFont(hourseTD[h], 4);
		TextDrawSetProportional(hourseTD[h], 0);
		TextDrawSetShadow(hourseTD[h], 0);

		format(gString,sizeof gString,"ld_otb2:ric%d", h+1);
		manHoursTD[h] = TextDrawCreate(15.746643 + lastHoursePos[h], 203.416793 + (h * 29.749985), gString);
		TextDrawLetterSize(manHoursTD[h], 0.000000, 0.000000);
		TextDrawTextSize(manHoursTD[h], 25.000000, 29.000000);
		TextDrawAlignment(manHoursTD[h], 1);
		TextDrawColor(manHoursTD[h], -1);
		TextDrawSetShadow(manHoursTD[h], 0);
		TextDrawSetOutline(manHoursTD[h], 0);
		TextDrawBackgroundColor(manHoursTD[h], 255);
		TextDrawFont(manHoursTD[h], 4);
		TextDrawSetProportional(manHoursTD[h], 0);
		TextDrawSetShadow(manHoursTD[h], 0);

		foreach(new p : computer_players<PC_TYPE_HOURSBET>) {
			TextDrawShowForPlayer(p, hourseTD[h]);
			TextDrawShowForPlayer(p, manHoursTD[h]);
		}
		if(lastHoursePos[h]-1.119804 >= 590 && hourseWin == -1) {
			new const win_colors[][] = {"~b~~h~win blue","~r~win red","~y~win yellow","~p~win purple","~g~win green"};
			TextDrawSetString(TotalBet[34], win_colors[h]);
			hourseWin = h;
		}
	}

	if(total_horuse_end>=5) {
		KillTimer(_timerBets);
		TextDrawSetString(TotalBet[34], "");
		TextDrawSetString(TotalBet[11], "Waiting for bets..");
		h=-1;
		while(++h<5) {
			TextDrawDestroy(hourseTD[h]);
			TextDrawDestroy(manHoursTD[h]);
		}
		new const colors[][] = {"~b~~h~blue","~r~red","~y~yellow","~p~purple","~g~green"};
		foreach(new p : computer_players<PC_TYPE_HOURSBET>) {
			h=8;
			while(++h<30) TextDrawShowForPlayer(p, TotalBet[h]); --h;
			while(++h<34) TextDrawHideForPlayer(p, TotalBet[h]);
			if(hoursBet[p][hourseWin]) {
				GivePlayerCash(p, hoursBet[p][hourseWin]*2);
				sendComputerMessagef(p, 10, "Ai castigat suma de ~g~~h~$%s~n~~w~pe culoarea %s.", FormatNumber(hoursBet[p][hourseWin] * 2), colors[hourseWin]);
			} else sendComputerMessagef(p, 10, "Ai pierdut suma de ~r~~h~$%s.", FormatNumber(hoursBet[p][0]+hoursBet[p][1]+hoursBet[p][2]+hoursBet[p][3]+hoursBet[p][4]));
			h=-1;
			while(++h<5) hoursBet[p][h] = 0;
			alreadyBetPlace[p] = false;
		}
		betStatus = HOURS_NONE;
		totalBetPlace=0;
	}
	total_horuse_end=0;
	return true;
}

std::hideTotalBet(playerid,i=-1) {
	if(betStatus==HOURS_PROGRESS&&alreadyBetPlace[playerid]) return SelectTextDraw(playerid, 0xFF0000FF),0;
	else {
		while(++i<5)
			TextDrawHideForPlayer(playerid, hourseTD[i]),
			TextDrawHideForPlayer(playerid, manHoursTD[i]);
	}
	i=-1;
	while(++i<35) TextDrawHideForPlayer(playerid, TotalBet[i]);
	Iter_Remove(computer_players<PC_TYPE_HOURSBET>, playerid);
	hoursBet[playerid][0]=hoursBet[playerid][1]=hoursBet[playerid][2]=hoursBet[playerid][3]=hoursBet[playerid][4]=0;
	alreadyBetPlace[playerid] = false;
	return true;
}