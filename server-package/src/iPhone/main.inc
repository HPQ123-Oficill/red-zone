#include "./src/iPhone/variable"
#include "./src/iPhone/textdraws"	

std::int_phone(client, _x=-1) {
	if(PlayerInfo[client][pPhone] == 0) return SCM(client, COLOR_GREY, "Nu ai un telefon.");
	if(PlayerInfo[client][pPhoneStatus]) return SCM(client, COLOR_GREY, "Ai telefonul inchis.");
	if(player_selected[client] == 22) return SelectTextDraw(client, COLOR_WHITE);
	status_phone[client] = 0;
	player_selected[client] = 22;
	p_locked=false;
	load_player_phone(client);
	new hours, minute, second, year, month, day;
	gettime(hours, minute, second);
	getdate(year, month, day);
	format(gString, 50, "%d:%02d", hours, minute);
	TextDrawSetString(iPhoneTD[26], gString);
	format(gString, sizeof gString, "%s, %s %d", name_day[GetWeekDay()], name_month[month-1], day);
	TextDrawSetString(iPhoneTD[27], gString);
	while(++_x<29) TextDrawShowForPlayer(client, iPhoneTD[_x]);
	TextDrawShowForPlayer(client, iPhoneMain);
	SelectTextDraw(client, COLOR_WHITE);
	SetTimerEx(#unlock_phone, 2000, false, #i, client);
	return true;
}

redist::unlock_phone(client) {
	if(player_selected[client] != 22) return true;
	TextDrawShowForPlayer(client, iPhoneTD[29]);
	TextDrawHideForPlayer(client, iPhoneTD[25]);
	p_locked=true;
	return true;
}

std::click_phone_txd(client, Text:clickedid) {
	new _x=-1,T=TextID[Text:clickedid];
	switch(T) {
		case PHONE_MAIN: {
			if(!p_locked) return true;
			switch(status_phone[client]) {
				case 0: {
					TextDrawColor(iPhoneTD[28], 0x000000FF);
					while(++_x<17) TextDrawShowForPlayer(client, MainPhone[_x]); _x=23;
					while(++_x<30) TextDrawHideForPlayer(client, iPhoneTD[_x]);
					status_phone[client] = 1;
				}
				case 2: {
					while(++_x<17) TextDrawShowForPlayer(client, MainPhone[_x]); _x=-1;
					while(++_x<35) TextDrawHideForPlayer(client, iPhone_Call[_x]); _x=13;
					while(++_x<18) TextDrawShowForPlayer(client, iPhoneTD[_x]);
					PlayerTextDrawHide(client, iPhone_Call_P[client]);
					status_phone[client] = 1;
				}
			}
		}
		case PHONE_CALL: {
			while(++_x<17) TextDrawHideForPlayer(client, MainPhone[_x]); _x=-1;
			while(++_x<35) TextDrawShowForPlayer(client, iPhone_Call[_x]); _x=13;
			while(++_x<18) TextDrawHideForPlayer(client, iPhoneTD[_x]);

			PlayerTextDrawShow(client, iPhone_Call_P[client]);
			TextDrawColor(iPhoneTD[28], 0x000000FF);
			TextDrawShowForPlayer(client, iPhoneTD[28]);
			status_phone[client] = 2;
			var_p[client]=-1;
		}
		default: {
			switch(status_phone[client]) {
				case 2: {
					switch(T) {
						case 11: call_p[client][0]=0,var_p[client]=-1, PlayerTextDrawSetString(client, iPhone_Call_P[client], "");
						case 12: {
							new call_str[10];
							if(strfind(call_p[client], "#31#",true)!=-1) strmid(call_str, call_p[client], 4, 10);
							else strcat(call_str, call_p[client]);
							var_p[client] = PhoneFinder[strval(call_str)];
							PlayerTextDrawSetString(client, Send_Call_PTD[client][0], call_p[client]);
							PlayerTextDrawSetString(client, Send_Call_PTD[client][1], "apelare mobil...");
							PlayerTextDrawShow(client, Send_Call_PTD[client][0]);
							PlayerTextDrawShow(client, Send_Call_PTD[client][1]);
							PlayerTextDrawHide(client, iPhone_Call_P[client]);
							while(++_x<35) TextDrawHideForPlayer(client, iPhone_Call[_x]); _x=-1;
							while(++_x<17) TextDrawShowForPlayer(client, Send_Call_TD[_x]);
							PlayAudioStreamForPlayer(client, "https://uploadir.com/u/f1t6sg43");
							SetTimerEx(#check_phone, 2000, false, #i, client);
							status_phone[client] = 3;
						}
						default: {
							if(var_p[client] > 7) return true;
							call_p[client][++var_p[client]] = '0'+T;
							call_p[client][var_p[client]+1] = 0;
							PlayerTextDrawSetString(client, iPhone_Call_P[client], call_p[client]);
						}
					}
				}
				case 68: {
					new p = var_p[client];
					if(clickedid == Send_Call_TD[15]) {
						PlayAudioStreamForPlayer(client, "https://uploadir.com/u/9ehs6n6e");
						PlayerTextDrawSetString(client, Send_Call_PTD[client][1], "Apel Inchieat");
						SetTimerEx(#hide_phone, 1000, false, #ib, client, true);
						countPhone[client]=-1;

						if(PlayerVar[client][IsPhone] == -1) 
							return SCM(client, COLOR_WHITE, "Nu esti intr-un apel.");

						PlayerVar[PlayerVar[client][IsPhone]][IsPhone] = -1;

						PlayerVar[client][IsCell] = false;
						PlayerVar[PlayerVar[client][IsPhone]][IsCell] = false;
						RemovePlayerAttachedObject(PlayerVar[client][IsPhone], 4);
						SetPlayerSpecialAction(PlayerVar[client][IsPhone], SPECIAL_ACTION_STOPUSECELLPHONE);
						RemovePlayerAttachedObject(client, 4);
						SetPlayerSpecialAction(client, SPECIAL_ACTION_STOPUSECELLPHONE);
						PlayerVar[client][IsPhone] = -1;

						PlayAudioStreamForPlayer(p, "https://uploadir.com/u/9ehs6n6e");
						PlayerTextDrawSetString(p, Send_Call_PTD[p][1], "Apel Inchieat");
						stop_call_phone(p);
						countPhone[p]=-1;
						return true;
					}
				}
				case 69: {
					new p = var_p[client];
					if(clickedid == Send_Call_TD[15]) {
						PlayAudioStreamForPlayer(p, "https://uploadir.com/u/9ehs6n6e");
						PlayerTextDrawSetString(p, Send_Call_PTD[p][1], "Apel Inchieat");
						SetTimerEx(#hide_phone, 1000, false, #ib, p, true);
						countPhone[p]=-1;

						if(PlayerVar[p][IsPhone] == -1) 
							return SCM(p, COLOR_WHITE, "Nu esti intr-un apel.");

						PlayerVar[PlayerVar[p][IsPhone]][IsPhone] = -1;

						PlayerVar[p][IsCell] = false;
						PlayerVar[PlayerVar[p][IsPhone]][IsCell] = false;
						RemovePlayerAttachedObject(PlayerVar[p][IsPhone], 4);
						SetPlayerSpecialAction(PlayerVar[p][IsPhone], SPECIAL_ACTION_STOPUSECELLPHONE);
						RemovePlayerAttachedObject(p, 4);
						SetPlayerSpecialAction(p, SPECIAL_ACTION_STOPUSECELLPHONE);
						PlayerVar[p][IsPhone] = -1;

						PlayAudioStreamForPlayer(client, "https://uploadir.com/u/9ehs6n6e");
						PlayerTextDrawSetString(client, Send_Call_PTD[client][1], "Apel Inchieat");
						stop_call_phone(client);
						countPhone[client]=-1;
						return true;
					}
				}
				case 70: {
					new p = var_p[client];
					if(clickedid == ResponseTD[0]) { // respinge
						PlayAudioStreamForPlayer(client, "https://uploadir.com/u/9ehs6n6e");
						PlayerTextDrawSetString(client, Send_Call_PTD[client][1], "Apel Inchieat");
						SetTimerEx(#hide_phone, 1000, false, #ib, client, true);

						if(PlayerVar[client][IsPhone] == -1) 
							return SCM(client, COLOR_WHITE, "Nu esti intr-un apel.");

						PlayerVar[client][IsPhone] = -1;

						PlayerVar[client][IsCell] = false;
						PlayerVar[PlayerVar[client][IsPhone]][IsCell] = false;
						RemovePlayerAttachedObject(PlayerVar[client][IsPhone], 4);
						SetPlayerSpecialAction(PlayerVar[client][IsPhone], SPECIAL_ACTION_STOPUSECELLPHONE);
						RemovePlayerAttachedObject(client, 4);
						SetPlayerSpecialAction(client, SPECIAL_ACTION_STOPUSECELLPHONE);

						PlayAudioStreamForPlayer(p, "https://uploadir.com/u/9ehs6n6e");
						PlayerTextDrawSetString(p, Send_Call_PTD[p][1], "Apel Inchieat");
						stop_call_phone(p);
						return true;
					}
					if(clickedid == ResponseTD[2]) { // accepta
						while(++_x<6) TextDrawHideForPlayer(client, ResponseTD[_x]); _x=4;
						while(++_x<17) TextDrawShowForPlayer(client, Send_Call_TD[_x]);
						StopAudioStreamForPlayer(client);
						SetTimerEx(#count_phone_time, 1000, false, #i, client);
						countPhone[client] = 0;
						status_phone[client] = 68;

						StopAudioStreamForPlayer(p);
						SetTimerEx(#count_phone_time, 1000, false, #i, p);
						countPhone[p] = 0;

						PlayerVar[client][IsPhone] = p;
						PlayerVar[p][IsPhone] = client;
						SetPlayerSpecialAction(client,SPECIAL_ACTION_USECELLPHONE);
						return true;
					}
				}
			}
		}
	}
	return true;
}

redist::time_out_call(client) {
	if(status_phone[client] != 3) return true;
	new p = var_p[client];
	StopAudioStreamForPlayer(client);
	PlayAudioStreamForPlayer(client, "https://uploadir.com/u/jvmfh21w");
	SetTimerEx(#stop_call_phone, 8500, false, #i, client);
	SetTimerEx(#count_phone_time, 1000, false, #i, client);
	countPhone[client] = 0;

	PlayAudioStreamForPlayer(p, "https://uploadir.com/u/9ehs6n6e");
	PlayerTextDrawSetString(p, Send_Call_PTD[p][1], "Apel Inchieat");
	SetTimerEx(#hide_phone, 1000, false, #ib, p, true);
	return true;
}

/*
if(params[0] == 112) {
	if(PlayerVar[playerid][RaportTime] < gettime() || PlayerVar[playerid][PlayerWanted]==INVALID_PLAYER_ID)
		return true;

	if PlayerInfo[playerid][pPlaying] < 5 * 3600 *then return SCM(playerid, COLOR_LGREEN, "Eroare: Trebuie sa joci 5 ore jucate pentru a raporta crima!");
	SetPlayerWanted(params[1], PlayerInfo[params[1]][pWanted] + 1 > 6 ? 6 : PlayerInfo[params[1]][pWanted] + 1);
	SCM(playerid, COLOR_SERVER, "Crima o sa fie investigata.");
	GiveCrime(params[1], playerid, "first degree murder");
	PlayerVar[playerid][PlayerWanted] = INVALID_PLAYER_ID;
	return true;
}*/

redist::check_phone(client) {
	new p = var_p[client];

	if IsBlocked(p, client) *then
		SCM(client, COLOR_LGREEN, "Acel player te-a blocat! Nu il poti contacta."), p=-1;

	if IsBlocked(client, p) *then
		SCM(client, COLOR_LGREEN, "L-ai blocat pe acel player! Nu il poti contacta."), p=-1;

	if(PlayerVar[p][IsPhone] != -1) 
		SCM(client, COLOR_GREY, "Acel player nu este disponibil momentan."), p=-1;

	if(PlayerInfo[p][pPhoneStatus]) 
		SCM(client, COLOR_GREY, "Acel player are telefon-ul inchis."), p=-1;

	if(p == -1) {
		not_possible:
		StopAudioStreamForPlayer(client);
		PlayAudioStreamForPlayer(client, "https://uploadir.com/u/jvmfh21w");
		SetTimerEx(#stop_call_phone, 8500, false, #i, client);
		SetTimerEx(#count_phone_time, 1000, false, #i, client);
		countPhone[client] = 0;
	} else {
		if(player_selected[p] != 0 || p == client) goto not_possible;

		format(gString, 60, "* suna %s lui %s.", PlayerInfo[p][pPhone]%1000 > 1000 ? ("Telefon-ul"):("iPhone-ul"), GetName(p));
		ProxDetector(20.0, p, gString, COLOR_PURPLE);
		if(PlayerInfo[client][pPhone]%1000 > 1000) SetPlayerAttachedObject(client,4,330,6, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);
		else SetPlayerAttachedObject(client, 4, 18865, 6, 0.086043, 0.027719, 0.003817, 95.232246, 178.651031, 1.691840, 1.002077, 1.000000, 1.000000);
		SetPlayerSpecialAction(client,SPECIAL_ACTION_USECELLPHONE);
		if(PlayerInfo[p][pPhone]%1000 > 1000) SetPlayerAttachedObject(p, 4, 18865, 6, 0.086043, 0.027719, 0.003817, 95.232246, 178.651031, 1.691840, 1.002077, 1.000000, 1.000000);
		else SetPlayerAttachedObject(p,4,330,6, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);
		PlayerPlaySound(client, 3600, 0.0, 0.0, 0.0);
		PlayerPlaySound(p, 20600, 0.0, 0.0, 0.0);

		new _x=-1;
		load_player_phone(p);
		PlayerTextDrawSetString(client, Send_Call_PTD[client][0], GetName(p));
		if(strfind(call_p[client], "#31#",true)==-1) PlayerTextDrawSetString(p, Send_Call_PTD[p][0], GetName(client)), PlayerVar[p][LastCall] = client;
		else PlayerTextDrawSetString(p, Send_Call_PTD[p][0], "Numar Privat");
		PlayerTextDrawSetString(p, Send_Call_PTD[p][1], "mobil");
		PlayerTextDrawShow(p, Send_Call_PTD[p][0]);
		PlayerTextDrawShow(p, Send_Call_PTD[p][1]);
		while(++_x<14) TextDrawShowForPlayer(p, iPhoneTD[_x]); _x=-1;
		while(++_x<5) TextDrawShowForPlayer(p, Send_Call_TD[_x]); _x=-1;
		while(++_x<6) TextDrawShowForPlayer(p, ResponseTD[_x]); _x=18;
		while(++_x<23) TextDrawShowForPlayer(p, iPhoneTD[_x]); _x=-1;
		PlayAudioStreamForPlayer(p, "https://uploadir.com/u/kxkknb25");
		SetTimerEx(#time_out_call, 30000, false, #i, client);
		player_selected[p] = 22;
		status_phone[p] = 70;
		var_p[p] = client;

		status_phone[client] = 69;
	}
	return true;
}

redist::count_phone_time(client) {
	if(countPhone[client]==-1) return true;
	format(gString, sizeof gString, "%02d:%02d", countPhone[client] / 60, countPhone[client] % 60);
	PlayerTextDrawSetString(client, Send_Call_PTD[client][1], gString);
	++countPhone[client];
	SetTimerEx(#count_phone_time, 1000, false, #i, client);
	return true;
}

redist::stop_call_phone(client) {
	countPhone[client] = -1;
	PlayerTextDrawSetString(client, Send_Call_PTD[client][1], "Apel Inchieat");
	SetTimerEx(#hide_call_phone, 2000, false, #i, client);
	return true;
}

redist::hide_call_phone(client) {
	new _x=-1;
	PlayerTextDrawHide(client, Send_Call_PTD[client][0]);
	PlayerTextDrawHide(client, Send_Call_PTD[client][1]);
	PlayerTextDrawShow(client, iPhone_Call_P[client]);
	while(++_x<35) TextDrawShowForPlayer(client, iPhone_Call[_x]); _x=-1;
	while(++_x<17) TextDrawHideForPlayer(client, Send_Call_TD[_x]);
	status_phone[client] = 2;
	return true;
}

redist::hide_phone(client,bool:ob) {
	new _x=-1;
	switch(status_phone[client]) {
		case 1: {
			while(++_x<17) TextDrawHideForPlayer(client, MainPhone[_x]);
		}
		case 2: {
			while(++_x<35) TextDrawHideForPlayer(client, iPhone_Call[_x]);
		}
		case 3: return true;
		case 68..70: {
			if(!ob) return true;
			while(++_x<17) TextDrawHideForPlayer(client, Send_Call_TD[_x]); _x=-1;
			while(++_x<6) TextDrawHideForPlayer(client, ResponseTD[_x]);
		}
	}
	_x=-1;
	while(++_x<30) TextDrawHideForPlayer(client, iPhoneTD[_x]); _x=-1;
	TextDrawHideForPlayer(client, iPhoneMain);
	PlayerTextDrawDestroy(client, iPhone_Call_P[client]);
	PlayerTextDrawDestroy(client, Send_Call_PTD[client][0]);
	PlayerTextDrawDestroy(client, Send_Call_PTD[client][1]);
	player_selected[client] = 0;
	status_phone[client] = 0;
	CancelSelectTextDraw(client);
	return true;
}