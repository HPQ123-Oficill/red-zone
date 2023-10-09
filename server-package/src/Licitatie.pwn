function Licitation() {
	if(Licitatie_type != -1) {
		Licitatie_Time --;
		ClearString();
		if(Licitatie_Time == 0) {
			SCMTA(0x544087FF, "[LICITATIE TERMINATA]");
			if(Licitatie_player != -1) {
				format(gString, 100, "> %s a licitat ce mai mare suma ($%s.000.000) si a castigat %s %d", GetName(Licitatie_player), FormatNumber(Licitatie_money), GetLicitateType(Licitatie_type), Licitatie_ID);
				SCMTA(0x544087FF, gString);
				switch(Licitatie_type) {
					case 0: GiveHouse(Licitatie_player, Licitatie_ide);
					case 1: GiveBussines(Licitatie_player, Licitatie_ide);
				}
				Iter_Remove(Licitatie[Licitatie_type], Licitatie_ide);
			} else {
				format(gString, 100, "> Nimeni nu a licitat pentru %s ID-ul %d.", GetLicitateType(Licitatie_type), Licitatie_ID);
				SCMTA(0x544087FF, gString);
			}
			SCMTA(0x544087FF, "___");
			Licitatie_type = -1;
			Licitatie_player = -1;
			Licitatie_money = 0;
			return true;
		}
		format(gString, 100, "> %s a licitat ce mai mare suma ($%s.000.000) pentru %s %d.", Licitatie_player != -1 ? GetName(Licitatie_player) : ("Unkonwn"), FormatNumber(Licitatie_money), GetLicitateType(Licitatie_type), Licitatie_ID);
		SCMTA(0x544087FF, gString);
		format(gString, 150, "> Daca nimeni nu liciteaza mai mult. playerul ce a licitat cel mai mult va castiga propietatea peste %d minute", Licitatie_Time);
		SCMTA(0x544087FF, gString);
		return true;
	}
	if(!Licitatie_lession) {
		House_free();
		Bizz_free();
		Licitatie_lession = true;
	}
	new x;
	//if(Iter_Count(Licitatie[0]) != 0) x = Iter_Random(Licitatie[0]), Licitatie_Level = HouseInfo[x][hLevel], Licitatie_ID = HouseInfo[x][hID], Licitatie_type = 0;
	//else if(Iter_Count(Licitatie[1]) != 0) x = Iter_Random(Licitatie[1]), Licitatie_Level = BizzInfo[x][bLevel], Licitatie_ID = BizzInfo[x][bID], Licitatie_type = 1;
	//else if(Iter_Count(Licitatie[2]) != 0) x = Iter_Random(Licitatie[2]), Licitatie_Level = 10, Licitatie_ID = JobInfo[x][jID], Licitatie_type = 2;
	//else return true;
	Licitatie_ide = x;
	Licitatie_Time = 5;
	gString[0] = EOS;
	format(gString, 75, "[BID] Acum se poate licita pentru %s cu ID-ul %d", GetLicitateType(Licitatie_type), Licitatie_ID, Licitatie_ide);
	SCMTA(0x544087FF, gString);
	SCMTA(0x8460E1FF, "[BID] Poti folosi /tog > bid pentru a afisa/ascunde sumele licitate de alti playeri.");
	SCMTA(0x8460E1FF, "[BID] Poti folosi /bid pentru a licita. O data ce licitezi, iti for fi retrasi banii dint cont. Daca un alt player liciteaza mai");
	SCMTA(0x8460E1FF, ". . . mult, iti vei primi banii inapoi.");
	return true;
}

function House_free() {
	for(new i = 1; i <= SqlHouses; i++) {
		if(strcmp("The State", HouseInfo[i][hOwner], true) != 0)
			continue;
		
		Iter_Add(Licitatie[0], i);
	}
	return true;
}

function Bizz_free() {
	for(new i = 1; i <= SqlBussines; i++) {
		if(strcmp("The State", BizzInfo[i][bOwner], true) != 0)
			continue;
		
		Iter_Add(Licitatie[1], i);
	}
	return true;
}

stock GetLicitateType(licitatie_id) {
	new lic[10];
	switch(licitatie_id) {
		case 0: lic = "HOUSE";
		case 1: lic = "BIZ";
	}
	return lic;
}
/*
YCMD:bid(playerid, params[], help) {
	if(Licitatie_type == -1)
		return SCM(playerid, COLOR_LGREEN, "Nu este nici o licitatie activa acum.");

	ClearString();
	if(PlayerInfo[playerid][pLevel] < Licitatie_Level) {
		format(gString, 50, "Ai nevoie de level %d pentru a licita.", Licitatie_Level);
		SCM(playerid, COLOR_LGREEN, gString);
		return true;
	}

	switch(Licitatie_type) {
		case 0: if(PlayerInfo[playerid][pHouse] != -1) return SCM(playerid, COLOR_GREY, "Ai deja o casa.");
		case 1: if(PlayerInfo[playerid][pBussines] != -1) return SCM(playerid, COLOR_GREY, "Ai deja un bizz.");
	}

	if(playerid == Licitatie_player)
		return SCM(playerid, COLOR_LGREEN, "Asteapta pana liciteaza alt player.");

	if(sscanf(params, "i", params[0]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/bid [money]"), SCM(playerid, COLOR_GREY, "Example: {FFFFFF}1 = $1.000.000.");

	if(params[0] < CalculateMinBid()) {
		format(gString, 50, "Trebuie sa licitezi minim %d milioane.", CalculateMinBid());
		SCM(playerid, COLOR_LGREEN, gString);
		return true;
	}
	if(params[0] > CalculateMaxBid()) {
		format(gString, 50, "Poti licita maxim %d milioane.", CalculateMaxBid());
		SCM(playerid, COLOR_LGREEN, gString);
		return true;
	}

	listitemm[playerid] = params[0];

	format(gString, 100, "You are sure you want to bid $%s.000.000 for %s %d?", FormatNumber(params[0]), GetLicitateType(Licitatie_type), Licitatie_ID);
	ShowPlayerDialog(playerid, DIALOG_LICITATIE, DIALOG_STYLE_MSGBOX, "You are sure?", gString, "Select", "Close");
	return true;
}*/

YCMD:licitatie(playerid, params[], help) {
	if(!IsAdmin(playerid, 5))
	 	return SCM(playerid, COLOR_LGREEN, AdminOnly);

	if(sscanf(params, "ii", params[0], params[1])) {
		SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/licitatie [licitatie] [id]");
		SCM(playerid, COLOR_GREY, "Licitatie: {FFFFFF}(0) House | (1) Bizz | (2) Job");
		return true;
	}
	if(params[1] < 0)
		return true;

	switch(params[0]) {
		case 0: if(!HouseInfo[params[1]][hID]) return SCM(playerid, COLOR_GREY, "Invalid House");
		case 1: if(!BizzInfo[params[1]][bID]) return SCM(playerid, COLOR_GREY, "Invalid Bizz");
		case 2: if(!JobInfo[params[1]][jID]) return SCM(playerid, COLOR_GREY, "Invalid Job");
	}
	Licitatie_type = params[0];
	Licitatie_player = -1;
	Licitatie_money = 0;
	Licitatie_ide = params[0] != 2 ? params[1] : params[1] - 1;
	Iter_Add(Licitatie[params[0]], Licitatie_ide);
	//Licitatie_Level = !params[0] ? HouseInfo[Licitatie_ide][hLevel] : params[0] == 1 ? BizzInfo[Licitatie_ide][bLevel] : 10;
	Licitatie_ID = !params[0] ? HouseInfo[Licitatie_ide][hID] : params[0] == 1 ? BizzInfo[Licitatie_ide][bID] : JobInfo[Licitatie_ide][jID];
	Licitatie_Time = 5;
	format(gString, 75, "[BID] Acum se poate licita pentru %s cu ID-ul %d", GetLicitateType(Licitatie_type), Licitatie_ID, Licitatie_ide);
	SCMTA(0x544087FF, gString);
	SCMTA(0x8460E1FF, "[BID] Poti folosi /tog > bid pentru a afisa/ascunde sumele licitate de alti playeri.");
	SCMTA(0x8460E1FF, "[BID] Poti folosi /bid pentru a licita. O data ce licitezi, iti for fi retrasi banii dint cont. Daca un alt player liciteaza mai");
	SCMTA(0x8460E1FF, ". . . mult, iti vei primi banii inapoi.");
	return true;
}

function CalculateMinBid() return Licitatie_money + ((Licitatie_money > 50 ? 2 : Licitatie_money > 200 ? 5 : Licitatie_money > 500 ? 10 : 1) * 2);
function CalculateMaxBid() return Licitatie_money + ((Licitatie_money > 50 ? 2 : Licitatie_money > 200 ? 5 : Licitatie_money > 500 ? 10 : 1) * 13);