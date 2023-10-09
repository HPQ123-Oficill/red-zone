
YCMD:killcp(playerid, params[], help) {
	if(!HaveCheckpoint(playerid)) 
		return SCM(playerid, COLOR_GREY, "You no have a checkpoint.");

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
	return true;
}
YCMD:pet(playerid, params[], help) {
	if(GetCoolDowns(playerid, 19))
		return CoolDowns(playerid, 19);

	if(!PlayerInfo[playerid][pPet])
		return SCM(playerid, COLOR_GREY, "Nu ai pet!");

	SetCoolDowns(playerid, 19, 5);
	gString[0] = EOS;
	format(gString, sizeof(gString), "Function\tResult\n{FFFFFF}Buy Level\t%d/%d XP for level %d\nPet Apperance\t%s\nTog Pet\t%s\nPet Name\t%s\nPet benefits\tClick for informations",
		PlayerInfo[playerid][pPetExp], PET_EXPERIENCE * PlayerInfo[playerid][pPetLevel], PlayerInfo[playerid][pPetLevel], PetName[PlayerInfo[playerid][pPet]], PlayerInfo[playerid][pPetStatus] ? ("{00FF00}Enabled") : ("Disabled"), PlayerInfo[playerid][pPetName]);
	ShowPlayerDialog(playerid, DIALOG_PET, DIALOG_STYLE_TABLIST_HEADERS, "Pet Menu", gString, "Select", "Close");
	return true;
}
YCMD:report(playerid, params[], help) {
	if(IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_GREY, "You have admin.");

	if(GetCoolDowns(playerid, 3)) 
		return CoolDowns(playerid, 3);

	ShowPlayerDialog(playerid, DIALOG_REPORT, DIALOG_STYLE_LIST, "Report:", "Contul meu este spart sau blocat\nRaporteaza DM\nRaporteaza un cheater\nIntrebari despre donatii\nSunt blocat/Cad prin mapa\nVreau sa fac o afacere si am nevoie de ajutor\nAlta problema", "Select", "Close");
	return true;
}

YCMD:colors(playerid, params[], help) {
	ShowPlayerDialog(playerid, DIALOG_ONLINE, DIALOG_STYLE_MSGBOX,"Vehicle Colors List", "{FFFFFF}Culori normale:\n\
	{000000}000 {F5F5F5}001 {2A77A1}002 {840410}003 {263739}004 {86446E}005 {D78E10}006 {4C75B7}007 {BDBEC6}008 {5E7072}009 \
	{46597A}010 {656A79}011 {5D7E8D}012 {58595A}013 {D6DAD6}014 {9CA1A3}015 {335F3F}016 {730E1A}017 {7B0A2A}018 {9F9D94}019 \
	\n{3B4E78}020 {732E3E}021 {691E3B}022 {96918C}023 {515459}024 {3F3E45}025 {A5A9A7}026 {635C5A}027 {3D4A68}028 {979592}029 \
	{421F21}030 {5F272B}031 {8494AB}032 {767B7C}033 {646464}034 {5A5752}035 {252527}036 {2D3A35}037 {93A396}038 {6D7A88}039 \
	\n{221918}040 {6F675F}041 {7C1C2A}042 {5F0A15}043 {193826}044 {5D1B20}045 {9D9872}046 {7A7560}047 {989586}048 {ADB0B0}049 \
	{848988}050 {304F45}051 {4D6268}052 {162248}053 {272F4B}054 {7D6256}055 {9EA4AB}056 {9C8D71}057 {6D1822}058 {4E6881}059 \
	\n{9C9C98}060 {917347}061 {661C26}062 {949D9F}063 {A4A7A5}064 {8E8C46}065 {341A1E}066 {6A7A8C}067 {AAAD8E}068 {AB988F}069 \
	{851F2E}070 {6F8297}071 {585853}072 {9AA790}073 {601A23}074 {20202C}075 {A4A096}076 {AA9D84}077 {78222B}078 {0E316D}079 \
	\n{722A3F}080 {7B715E}081 {741D28}082 {1E2E32}083 {4D322F}084 {7C1B44}085 {2E5B20}086 {395A83}087 {6D2837}088 {A7A28F}089 \
	{AFB1B1}090 {364155}091 {6D6C6E}092 {0F6A89}093 {204B6B}094 {2B3E57}095 {9B9F9D}096 {6C8495}097 {4D8495}098 {AE9B7F}099 \
	\n{406C8F}100 {1F253B}101 {AB9276}102 {134573}103 {96816C}104 {64686A}105 {105082}106 {A19983}107 {385694}108 {525661}109 \
	{7F6956}110 {8C929A}111 {596E87}112 {473532}113 {44624F}114 {730A27}115 {223457}116 {640D1B}117 {A3ADC6}118 {695853}119 \
	\n{9B8B80}120 {620B1C}121 {5B5D5E}122 {624428}123 {731827}124 {1B376D}125 {EC6AAE}126 {000000}127 \
	\n\n{FFFFFF}Culori hidden:\n\
	{177517}128 {210606}129 {125478}130 {452A0D}131 {571E1E}132 {010701}133 {25225A}134 {2C89AA}135 {8A4DBD}136 {35963A}137 \
	{B7B7B7}138 {464C8D}139 {84888C}140 {817867}141 {817A26}142 {6A506F}143 {583E6F}144 {8CB972}145 {824F78}146 {6D276A}147 \
	\n{1E1D13}148 {1E1306}149 {1F2518}150 {2C4531}151 {1E4C99}152 {2E5F43}153 {1E9948}154 {1E9999}155 {999976}156 {7C8499}157 \
	{992E1E}158 {2C1E08}159 {142407}160 {993E4D}161 {1E4C99}162 {198181}163 {1A292A}164 {16616F}165 {1B6687}166 {6C3F99}167 \
	\n{481A0E}168 {7A7399}169 {746D99}170 {53387E}171 {222407}172 {3E190C}173 {46210E}174 {991E1E}175 {8D4C8D}176 {805B80}177 \
	{7B3E7E}178 {3C1737}179 {733517}180 {781818}181 {83341A}182 {8E2F1C}183 {7E3E53}184 {7C6D7C}185 {020C02}186 {072407}187 \
	\n{163012}188 {16301B}189 {642B4F}190 {368452}191 {999590}192 {818D96}193 {99991E}194 {7F994C}195 {839292}196 {788222}197 \
	{2B3C99}198 {3A3A0B}199 {8A794E}200 {0E1F49}201 {15371C}202 {15273A}203 {375775}204 {060820}205 {071326}206 {20394B}207 \
	\n{2C5089}208 {15426C}209 {103250}210 {241663}211 {692015}212 {8C8D94}213 {516013}214 {090F02}215 {8C573A}216 {52888E}217 \
	{995C52}218 {99581E}219 {993A63}220 {998F4E}221 {99311E}222 {0D1842}223 {521E1E}224 {42420D}225 {4C991E}226 {082A1D}227 \
	\n{96821D}228 {197F19}229 {3B141F}230 {745217}231 {893F8D}232 {7E1A6C}233 {0B370B}234 {27450D}235 {071F24}236 {784573}237 \
	{8A653A}238 {732617}239 {319490}240 {56941D}241 {59163D}242 {1B8A2F}243 {38160B}244 {041804}245 {355D8E}246 {2E3F5B}247 \
	 \n{561A28}248 {4E0E27}249 {706C67}250 {3B3E42}251 {2E2D33}252 {7B7E7D}253 {4A4442}254 {28344E}255","Exit","");
	return true;
}



YCMD:changepass(playerid, params[], help) {
	if(GetCoolDowns(playerid, 6)) 
		return CoolDowns(playerid, 6);

	ShowPlayerDialog(playerid, DIALOG_CHANGEPASS, DIALOG_STYLE_PASSWORD, "Change Password:", "Introdu parola ta actuala:", "Select", "Close");
	return true;
}

YCMD:turn(playerid, params[], help) {
	if(GetCoolDowns(playerid, 18)) 
		return CoolDowns(playerid, 18);

	if(sscanf(params, "s[24]", params))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/trun [on/off]");

	PlayerInfo[playerid][pPhoneStatus] = (
		compare(params, "on")?false:
		compare(params, "off")?true:
		PlayerInfo[playerid][pPhoneStatus]
	);
	UpdateVar(playerid, "PhoneStatus", PlayerInfo[playerid][pPhoneStatus]);
	SetCoolDowns(playerid, 18, 5);
	gString[0] = EOS;
	SCMf(playerid, COLOR_PINK, "Phone status: %s", !PlayerInfo[playerid][pPhoneStatus] ? ("{39CE0D}Online") : ("{FF0000}Offline"));
	format(gString, 144, "%s si-a %s telefonul.", GetName(playerid), !PlayerInfo[playerid][pPhoneStatus] ? ("pornit") : ("oprit"));
	ProxDetector(30.0, playerid, gString, COLOR_PURPLE);
	return true;
}
YCMD:sms(playerid, params[], help) {
	if(CheckMute(playerid)) return ShowMute(playerid);

	new giveplayerid=-1;
	extract params -> new number, string:text[90]; else
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/sms [number] [text]");

	if(PlayerInfo[playerid][pPhone] == 0) 
		return SCM(playerid, COLOR_GREY, "Nu ai un telefon.");

	if(PlayerInfo[playerid][pPhoneStatus]) 
		return SCM(playerid, COLOR_GREY, "Telefonul tau este inchis.");

	if(PlayerInfo[playerid][pCredit] < 2)
		return SCM(playerid, COLOR_GREY, "You don't have enough credit.");

	if((giveplayerid = PhoneFinder[number])== -1)
		return SCM(playerid, COLOR_GREY, "Number Invalid.");

	if(giveplayerid == playerid)
		return SCM(playerid, COLOR_GREY, "Nu iti poti da mesaj singur.");

	if IsBlocked(giveplayerid, playerid) *then
		return SCM(playerid, COLOR_LGREEN, "Acel player te-a blocat! Nu il poti contacta.");
	
	if IsBlocked(playerid, giveplayerid) *then
		return SCM(playerid, COLOR_LGREEN, "L-ai blocat pe acel player! Nu il poti contacta.");

	if(PlayerInfo[giveplayerid][pPhoneStatus]) 
		return SCM(playerid, COLOR_GREY, "Telefonul lui este inchis.");

	if(player_selected[giveplayerid] == 12)
		return SCM(playerid, COLOR_GREY, "Acel player este momentant ocupat!");

	if checkReclame(playerid, text) *then return true;

	SCMf(giveplayerid, COLOR_YELLOW, "SMS from %s ({FFFFFF}%d{FFFF00}): %s",GetName(playerid), PlayerInfo[playerid][pPhone], text);
	SCMf(playerid, 0xC8E0DFFF, "SMS send to %s ({FFFFFF}%d{C8E0DF}): %s",GetName(giveplayerid), PlayerInfo[giveplayerid][pPhone], text);
	
	if(PlayerInfo[playerid][pAdmin] < 6) {
		format(gString, 160, "(SMS LOG) %s(%d) catre %s(%d): %s", GetName(playerid), playerid, GetName(giveplayerid), giveplayerid, text);
		EarsMessage(0xFFC400FF, gString);
	}

	PlayerInfo[playerid][pCredit] -= 2;

	PlayerPlaySound(giveplayerid, 1138, 0.0, 0.0, 0.0);
	PlayerVar[giveplayerid][Reply] = playerid;
	return true;
}

YCMD:reply(playerid, params[], help) {
	if(PlayerVar[playerid][Reply] == -1)
		return true;

	if(CheckMute(playerid)) return ShowMute(playerid);

	extract params -> new string:text[90]; else
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/reply [text]");

	if(PlayerInfo[playerid][pPhone] == 0) 
		return SCM(playerid, COLOR_GREY, "Nu ai un telefon.");

	if(PlayerInfo[playerid][pPhoneStatus]) 
		return SCM(playerid, COLOR_GREY, "Telefonul tau este inchis.");

	if(PlayerInfo[playerid][pCredit] < 2)
		return SCM(playerid, COLOR_GREY, "You don't have enough credit.");


	new giveplayerid = PlayerVar[playerid][Reply];

	if(player_selected[giveplayerid] == 12)
		return SCM(playerid, COLOR_GREY, "Acel player este momentant ocupat!");

	if(!IsPlayerConnected(giveplayerid) || !IsPlayerLogged(giveplayerid))
		return true;

	if IsBlocked(giveplayerid, playerid) *then
		return SCM(playerid, COLOR_LGREEN, "Acel player te-a blocat! Nu il poti contacta.");
	
	if IsBlocked(playerid, giveplayerid) *then
		return SCM(playerid, COLOR_LGREEN, "L-ai blocat pe acel player! Nu il poti contacta.");

	if(PlayerInfo[giveplayerid][pPhoneStatus]) 
		return SCM(playerid, COLOR_GREY, "Telefonul lui este inchis.");

	if checkReclame(playerid, text) *then return true;

	ClearString();
	format(gString, 160, "SMS de la %s ({FFFFFF}%d{FFFF00}): %s",GetName(playerid), PlayerInfo[playerid][pPhone], text);
	SCM(giveplayerid, COLOR_YELLOW, gString);

	format(gString, 160, "SMS send to %s ({FFFFFF}%d{C8E0DF}): %s",GetName(giveplayerid), PlayerInfo[giveplayerid][pPhone], text);
	SCM(playerid, 0xC8E0DFFF, gString);

	if(PlayerInfo[playerid][pAdmin] < 6) {
		format(gString, 160, "(SMS LOG) %s(%d) catre %s(%d): %s", GetName(playerid), playerid, GetName(giveplayerid), giveplayerid, text);
		EarsMessage(0xFFC400FF, gString);
	}

	PlayerInfo[playerid][pCredit] -= 2;
	PlayerVar[giveplayerid][Reply] = playerid;
	PlayerPlaySound(giveplayerid, 1138, 0.0, 0.0, 0.0);
	return true;
}

YCMD:time(playerid, params[], help) {
	new hour, minute, second;
	gettime(hour, minute, second);
	gString[0] = EOS;
	format(gString, 75, "The current time is %d:%d:%d", hour, minute, second);
	SCM(playerid, COLOR_WHITE, gString);
	format(gString, 75, "Connected for %d minutes and %d seconds.", PlayerInfo[playerid][pConnected]/60, PlayerInfo[playerid][pConnected] % 60);
 	SCM(playerid, COLOR_WHITE, gString);
	format(gString, 75, "* %s raises her hand and looks down at her watch.", GetName(playerid));
	ProxDetector(30.0, playerid, gString, COLOR_PURPLE);
	OnePlayAnim(playerid,"COP_AMBIENT","Coplook_watch",4.1,0,0,0,0,0);
	return true;
}

YCMD:number(playerid, params[], help) {
	if(!PlayerInfo[playerid][pPhoneBook])
		return SCM(playerid, COLOR_GREY, "You not have a phone.");

	if(sscanf(params, "u", params[0]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/number [playerid/name]");

	if(!IsPlayerConnected(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(!IsPlayerLogged(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not logged.");

	if(PlayerInfo[params[0]][pPhone] == 0)
		return SCM(playerid, COLOR_GREY, "Player no have a phone.");

	ClearString();
	if(PlayerInfo[params[0]][pPhone] != 0) format(gString, 100, "%s's phone number: %d", GetName(params[0]), PlayerInfo[params[0]][pPhone]);
	else format(gString, 100, "%s's phone number: none", GetName(params[0]));
	SCM(playerid, COLOR_WHITE, gString);
	return true;
}

YCMD:cancel(playerid, params[]) { 
	new type[24];
	if(sscanf(params, "s[24]", type)) {
		SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/cancel [type]");
		SCM(playerid, COLOR_GREY, "Type: {FFFFFF}service, command");
		return true;
	}

	new id;
	if(strcmp("service", type, true) == 0) {
		if(CallType[playerid]==-1) return SCM(playerid, COLOR_GREY, "Nu ai apelat la niciun serviciu.");

		new i = CallType[playerid];

		if(!CallService[playerid][i] || CallServiceAccept[playerid][i] == -1)
			return SCM(playerid, COLOR_GREY, "Nu ai apelat la acele servicii.");

		id = CallServiceAccept[playerid][i];

		CallServiceAccept[playerid][i] = -1;
		PlayerVar[id][HaveCalls] = -1;
		CallService[playerid][i] = false;
		CallType[playerid] = -1;
		gString[0] = EOS;
		format(gString, 100, "%s a anulat comanda servicilor voastre.", GetName(playerid));
		SCM(id, COLOR_WHITE, gString);
		SCM(playerid, COLOR_WHITE, "Ai anulat serviciile pentru servicii.");
		if(PlayerVar[id][Find] == playerid) DisablePlayerFind(id);
		return true;
	}
	else if(strcmp("command", type, true) == 0) {
		if(PlayerVar[playerid][HaveCalls] == -1)
			return SCM(playerid, COLOR_GREY, "Nu ai o comanda activa.");

		id = PlayerVar[playerid][HaveCalls];
		new i = CallType[id];

		PlayerVar[playerid][HaveCalls] = -1;
		CallServiceAccept[id][i] = -1;
		CallService[id][i] = false;
		CallType[id] = -1;
		gString[0] = EOS;
		format(gString, 100, "%s ti-a anulat commanda.", GetName(playerid));
		SCM(id, COLOR_WHITE, gString);
		SCM(playerid, COLOR_WHITE, "Ai anulat comanda.");
		DisablePlayerFind(playerid);
		return true;
	} else {		
		SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/cancel [type]");
		SCM(playerid, COLOR_GREY, "Type: {FFFFFF}service, command");
	}
	return true;
}

YCMD:heal(playerid, params[], help) {
	if(healDeelay[playerid] > gettime())
		return SCMf(playerid, COLOR_LGREEN, "Eroare: Asteapta %d secunde pana sa poti folosi iar aceasta comanda!", healDeelay[playerid]-gettime());

	if(PlayerVar[playerid][IsHouses]) {
		if(!HouseInfo[PlayerVar[playerid][IsHouses]][hHeal]) 
			return SCM(playerid, COLOR_LGREEN, "Eroare: Aceasta casa nu are heal upgrade!");

		SetPlayerHealth(playerid, 100.0);
		SCM(playerid, COLOR_WHITE, "You were healed.");
		healDeelay[playerid] = gettime() + 60;
		return true;
	}
	if(PlayerInfo[playerid][pMember] != 0 && PlayerVar[playerid][IsFaction] != -1) {
		SetPlayerHealth(playerid, 100.0);
		SCM(playerid, COLOR_WHITE, "You were healed.");
		healDeelay[playerid] = gettime() + 60;
		return true;
	}

	if(!PlayerInfo[playerid][pMember])
		return SCM(playerid, COLOR_GREY, "Nu esti intr-o factiune.");

	if(PlayerInfo[playerid][pMember] != 6)
		return SCM(playerid, COLOR_GREY, "Nu esti membru in paramedic.");

	if(!IsPlayerInAnyVehicle(playerid))
		return SCM(playerid, COLOR_GREY, "Nu esti intr-o masina.");

	if(ServerVehicle[GetPlayerVehicleID(playerid)][vFaction] != 6)
		return true;

	if(sscanf(params, "ui", params[0], params[1]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/heal [playerid/name] [price]");

	if(playerid == params[0])
		return true;

	if(!IsPlayerConnected(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(!IsPlayerLogged(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not logged.");

	if(!IsPlayerInVehicle(params[0], GetPlayerVehicleID(playerid)))
		return SCM(playerid, COLOR_GREY, "Acel player nu se afla in vehicul tau.");

	if(params[1] < 1 || params[1] > 250)
		return SCM(playerid, COLOR_GREY, "Invalid price ($1 - $250)");

	if(GetPlayerCash(params[0]) < params[1])
		return SCM(playerid, COLOR_GREY, "Acel player nu are aceasta suma.");

	new Float: heal;
	GetPlayerHealth(params[0], heal);
	if(heal > 90.0)
		return SCM(playerid, COLOR_GREY, "Acel player are viata plina.");


	healDeelay[playerid] = gettime() + 60;

	GivePlayerCash(params[0], -params[1]);
	GivePlayerCash(playerid, params[1]);
	PlayerPlaySound(playerid, 1150, 0.0, 0.0, 0.0);

	SetPlayerHealth(params[0], 100.0);

	if(lastPlayer[playerid] != params[0]) AddFactionRaport(playerid, 0, 1);

	gString[0] = EOS;

	format(gString, 150, "**(( Paramedic Dispatch: Paramedic %s (%d) i-a oferit heal lui %s (%d) pentru suma de %s$. ))**",GetName(playerid), playerid, GetName(params[0]), params[0], FormatNumber(params[1]));
	SendFactionMessage(6, COLOR_LIGHTBLUE, gString);

	format(gString, 60, "Ai primit viata pentru %s$.", FormatNumber(params[1]));
	SCM(params[0], COLOR_MONEY, gString);
	format(gString, 100, "I-ai dat viata lui %s in schimbul sumei de $%s.", GetName(params[0]), FormatNumber(params[1]));
	SCM(playerid, COLOR_MONEY, gString);
	lastPlayer[playerid] = params[0];
	return true;
}

YCMD:stats(playerid, params[], help) return ShowStats(playerid, playerid);

YCMD:engine(playerid, params[], help) {
	if(!IsPlayerInAnyVehicle(playerid))
		return SCM(playerid, COLOR_WHITE, "You are not in a vehicle.");

	if(GetCoolDowns(playerid, 26))
		return true;

	SetCoolDowns(playerid, 26, 3);

	if(EditObjectID[playerid] != INVALID_EDIT)
		return SCM(playerid, COLOR_GREY, "Nu poti porni motorul in timp ce editezi.");

	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return true;

	if(IsABike(GetPlayerVehicleID(playerid)))
		return true;

	new vehid = GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective;
	if(Fuel[vehid] == 0) 
		return SCM(playerid, COLOR_LGREEN, "This vehicle has no fuel.");

	new carid = FindSpawnID(vehid, false);
	if(carid != -1) {
		if(CarInfo[carid][cPoints] == 0) return SCM(playerid, COLOR_LGREEN, "Pay insurance on the car.");
	}

	GetVehicleParamsEx(vehid, engine, lights, alarm, doors, bonnet, boot, objective);
	gString[0] = EOS;
	Engine[vehid] = Engine[vehid] ? false : true;
	PlayerTextDrawColor(playerid, SpeedometerPTD[playerid][2], !Engine[vehid] ? -1 : -459199745);
	PlayerTextDrawShow(playerid, SpeedometerPTD[playerid][2]);
	if(!Engine[vehid]) {
		GetVehiclePos(vehid, VehiclePos[vehid][0], VehiclePos[vehid][1], VehiclePos[vehid][2]);
		GetVehicleZAngle(vehid, VehiclePos[vehid][3]);
	}
	SetVehicleParamsExx(vehid, Engine[vehid], lights, alarm, doors, bonnet, boot, objective);
	format(gString, sizeof(gString), "* %s %s the engine of his %s.", GetName(playerid), Engine[vehid] ? ("starts") : ("stops"), GetVehicleName(GetVehicleModel(vehid)));
	ProxDetector(30.0, playerid, gString, COLOR_PURPLE);
	return true;
}

YCMD:gotoevent(playerid, parmas[], help) {
	if(!EventInfo[evStatus])
		return SCM(playerid, COLOR_GREY, "There is no active event.");

	SetPlayerPos(playerid, EventInfo[evPos][0], EventInfo[evPos][1], EventInfo[evPos][2]);
	SetPlayerVirtualWorld(playerid, EventInfo[evVirtualWorld]);
	SetPlayerInterior(playerid, EventInfo[evInterior]);
	PlayerVar[playerid][IsHouses] = 0;
	PlayerVar[playerid][IsBizz] = 0;
	PlayerVar[playerid][IsFaction] = -1;
	SCM(playerid, COLOR_WHITE, "You teleported to the event.");
	return true;
}

YCMD:spawnchange(playerid, params[], help) {
	gString[0] = EOS;
	format(gString, sizeof(gString), "Spawn\tStatus\n{FFFFFF}Default Spawn\t{00FF00}Enabled\n{FFFFFF}House Spawn\t%s", IsHouse(playerid) != 0 ? ("{00FF00}Enabled{FFFFFF}") : ("Disabled"));
	ShowPlayerDialog(playerid, DIALOG_SPAWNCHANGE, DIALOG_STYLE_TABLIST_HEADERS, "SpawnChange", gString, "Select", "Close");
	return true;
}

YCMD:lock(playerid, params[], help) return LockVehicle(playerid);

YCMD:getgift(playerid, params[]) {
	if(PlayerInfo[playerid][pGiftPoints] < 200) {
		format(gString, sizeof gString, "Ai nevoie de 200 de Gift Points pentru a deschide un giftbox. Tu ai %d/600.", PlayerInfo[playerid][pGiftPoints]);
		SCM(playerid, COLOR_YELLOW, gString);
		return true;
	}

	if(!PlayerToPoint(playerid, 5.0, 2425.0833,120.6176,27.6287)) {
		if(HaveCheckpoint(playerid))
			return ShowCancelCP(playerid);

		SetPlayerCheckpointEx(playerid, CP_NORMAL, 2425.0833,120.6176,27.6287, 5.0);
		SCM(playerid, COLOR_YELLOW, "Ti-a fost setat un punct pe minimap pentru a ajunge la giftbox.");
		return true;
	}

	if(GiftStep[playerid] != -1 && GiftStep[playerid] <= 15)
		return true;

	checkBP(playerid, 4, 150); 

	GiftStep[playerid] = 0;
	TogglePlayerControllable(playerid, false);
	PlayerTextDrawSetString(playerid, GiftPTD[1], "Loading..");
	PlayerTextDrawSetPreviewModel(playerid, GiftPTD[0], 19054);
	PlayerTextDrawShow(playerid, GiftPTD[0]); PlayerTextDrawShow(playerid, GiftPTD[1]);
	TextDrawShowForPlayer(playerid, GiftTD[0]); TextDrawShowForPlayer(playerid, GiftTD[1]);
	return true;
}

// 	==================================== 	Animations 	================================== //

YCMD:animlist(playerid, params[], help) {
    SCM(playerid,COLOR_LGREEN,"Anim list:");
    SCM(playerid,COLOR_WHITE,"Lifejump, Robman, Exhaust, Carlock, Rcarjack1, Lcarjack1, Rcarjack2, Lcarjack2, Hoodfrisked;");
    SCM(playerid,COLOR_WHITE,"Lightcig, Tapcig, Bat, Lean, Clearanim, Dancing, Box, Lowthrow, Highthrow;");
    SCM(playerid,COLOR_WHITE,"Leftslap, Handsup, Fall, Fallback, Sup, Rap, Push, Akick, Lowbodypush;");
    SCM(playerid,COLOR_WHITE,"Spray, Headbutt, Pee, Koface, Kostomach, Kiss, Rollfall, Lay2, Hitch;");
    SCM(playerid,COLOR_WHITE,"Beach, Medic, Scratch, Sit, Drunk, Bomb, Getarrested, Laugh, Lookout;");
    SCM(playerid,COLOR_WHITE,"Aim, Crossarms, Lay, Hide, Vomit, Eating, Wave, Shouting, Chant;");
    SCM(playerid,COLOR_WHITE,"Frisked, Exhausted, Injured, Slapass, Deal, Dealstance, Crack, Wank, Gro;");
    SCM(playerid,COLOR_WHITE,"Sit, Chat, Fucku, Taichi, Knife, Basket, JumpWater.");
    return true;
}
YCMD:carhand(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
    if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
    OnePlayAnim(playerid,"CAR","Tap_hand",4.1,0,1,1 ,1,1);
	return true;
}
YCMD:lifejump(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
    if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	LoopingAnim(playerid,"PED","EV_dive",4.0,0,1,1,1,0);
	return true;
}
YCMD:robman(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
 	LoopingAnim(playerid, "SHOP", "ROB_Loop_Threat", 4.0, 1, 0, 0, 0, 0);
	return true;
}
YCMD:exhaust(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
	LoopingAnim(playerid,"PED","IDLE_tired",3.0,1,0,0,0,0);
	return true;
}

cmd:buy(playerid, params[]) {
    if(IsPlayerInRangeOfPoint(playerid,100.0,6.1884,-28.4153,1003.5494) || IsPlayerInRangeOfPoint(playerid,100.0,-30.6147,-89.6600,1003.5469) || IsPlayerInRangeOfPoint(playerid,100.0,-26.0890,-185.8300,1003.5469) || IsPlayerInRangeOfPoint(playerid,100.0,-27.3123,-29.2776,1003.5573) || IsPlayerInRangeOfPoint(playerid,100.0,-25.1326,-139.0670,1003.5469)) {
		if(GetPlayerInterior(playerid) == 0) return SCM(playerid, COLOR_GREY, "Nu esti intr-un magazin 24/7.");
		ShowPlayerDialog(playerid, DIALOG_24,DIALOG_STYLE_TABLIST_HEADERS,"24/7 Store","Model\tAmount\nPhone\t$1,000\nPhoneBook\t$500\nCredite\t$300\n","Ok","Close");
    }
    else SCM(playerid, COLOR_GREY, "Nu esti intr-un magazin 24/7");
    return true;
}

cmd:testt(playerid, params[]) {
	new _1[24], _2[24];
	if(sscanf(params, "s[24]s[24]", _1, _2))
		return true;

	ApplyAnimation(playerid, _1, _2,4.0,0,0,0,0,0);	
	return true;
}

OnePlayAnim(playerid, const animlib[], const animname[], Float:Speedes, looping, lockx, locky, lockz, lp) 
	return ApplyAnimation(playerid, animlib, animname, Speedes, looping, lockx, locky, lockz, lp), inAnim[playerid] = gettime()+5;
YCMD:rcarjack1(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
	OnePlayAnim(playerid,"PED","CAR_pulloutL_LHS",4.0,0,0,0,0,0);
	return true;
}
YCMD:lcarjack1(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
 	OnePlayAnim(playerid,"PED","CAR_pulloutL_RHS",4.0,0,0,0,0,0);
	return true;
}
YCMD:rcarjack2(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
 	OnePlayAnim(playerid,"PED","CAR_pullout_LHS",4.0,0,0,0,0,0);
	return true;
}
YCMD:lcarjack2(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
 	OnePlayAnim(playerid,"PED","CAR_pullout_RHS",4.0,0,0,0,0,0);
	return true;
}
YCMD:hoodfrisked(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
 	LoopingAnim(playerid,"POLICE","crm_drgbst_01",4.0,0,1,1,1,0);
	return true;
}
YCMD:lightcig(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
 	OnePlayAnim(playerid,"SMOKING","M_smk_in",3.0,0,0,0,0,0);
	return true;
}
YCMD:tapcig(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
 	OnePlayAnim(playerid,"SMOKING","M_smk_tap",3.0,0,0,0,0,0);
	return true;
}
YCMD:bat(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
 	LoopingAnim(playerid,"BASEBALL","Bat_IDLE",4.0,1,1,1,1,0);
	return true;
}
YCMD:lean(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
	new test;
    if(sscanf(params, "d",test)) return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/lean <1-2>");
    switch (test)
    {
	    case 1: LoopingAnim(playerid,"GANGS","leanIDLE",4.0,0,1,1,1,0);
	    case 2: LoopingAnim(playerid,"MISC","Plyrlean_loop",4.0,0,1,1,1,0);
	    default: SCM(playerid,COLOR_GREY, "Syntax: {FFFFFF}/lean <1-2>");
	}
	return true;
}
YCMD:clearanim(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
	OnePlayAnim(playerid, "CARRY", "crry_prtial", 1.0, 0, 0, 0, 0, 0);
	return true;
}
YCMD:dancing(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
	new test;
    if(sscanf(params, "d",test)) return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/dancing <1-7>");
	switch (test)
   	{
	    case 1: LoopingAnim(playerid,"STRIP", "strip_A", 4.1, 1, 1, 1, 1, 1 );
        case 2: LoopingAnim(playerid,"STRIP", "strip_B", 4.1, 1, 1, 1, 1, 1 );
     	case 3: LoopingAnim(playerid,"STRIP", "strip_C", 4.1, 1, 1, 1, 1, 1 );
    	case 4: LoopingAnim(playerid,"STRIP", "strip_D", 4.1, 1, 1, 1, 1, 1 );
    	case 5: LoopingAnim(playerid,"STRIP", "strip_E", 4.1, 1, 1, 1, 1, 1 );
    	case 6: LoopingAnim(playerid,"STRIP", "strip_F", 4.1, 1, 1, 1, 1, 1 );
     	case 7: LoopingAnim(playerid,"STRIP", "strip_G", 4.1, 1, 1, 1, 1, 1 );
     	default: SCM(playerid,COLOR_GREY, "Syntax: {FFFFFF}/dancing <1-7>");
	}
	return true;
}
YCMD:box(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
 	LoopingAnim(playerid,"GYMNASIUM","GYMshadowbox",4.0,1,1,1,1,0);
	return true;
}
YCMD:lowthrow(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
	OnePlayAnim(playerid,"GRENADE","WEAPON_throwu",3.0,0,0,0,0,0);
	return true;
}
YCMD:highthrow(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
 	OnePlayAnim(playerid,"GRENADE","WEAPON_throw",4.0,0,0,0,0,0);
	return true;
}
YCMD:leftslap(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
	OnePlayAnim(playerid,"PED","BIKE_elbowL",4.0,0,0,0,0,0);
	return true;
}
YCMD:handsup(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_HANDSUP);
	return true;
}
YCMD:fall(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
	LoopingAnim(playerid,"PED","KO_skid_front",4.1,0,1,1,1,0);
	return true;
}
YCMD:fallback(playerid, params[], help) {
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
    LoopingAnim(playerid, "PED","FLOOR_hit_f", 4.0, 1, 0, 0, 0, 0);
    return true;
}
YCMD:laugh(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
 	OnePlayAnim(playerid, "RAPPING", "Laugh_01", 4.0, 0, 0, 0, 0, 0);
	return true;
}
YCMD:lookout(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
    OnePlayAnim(playerid, "SHOP", "ROB_Shifty", 4.0, 0, 0, 0, 0, 0);
	return true;
}
YCMD:aim(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
    LoopingAnim(playerid, "SHOP", "ROB_Loop_Threat", 4.0, 1, 0, 0, 0, 0);
	return true;
}
YCMD:crossarms(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
    LoopingAnim(playerid, "COP_AMBIENT", "Coplook_loop", 4.0, 0, 1, 1, 1, -1);
	return true;
}
YCMD:lay(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
 	LoopingAnim(playerid,"BEACH", "bather", 4.0, 1, 0, 0, 0, 0);
	return true;
}
YCMD:hide(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
 	LoopingAnim(playerid, "ped", "cower", 3.0, 1, 0, 0, 0, 0);
	return true;
}
YCMD:vomit(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
 	OnePlayAnim(playerid, "FOOD", "EAT_Vomit_P", 3.0, 0, 0, 0, 0, 0);
	return true;
}
YCMD:wave(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
    LoopingAnim(playerid, "ON_LOOKERS", "wave_loop", 4.0, 1, 0, 0, 0, 0);
	return true;
}
YCMD:shouting(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
    LoopingAnim(playerid,"RIOT","RIOT_shout",4.0,1,0,0,0,0);
	return true;
}
YCMD:chant(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
    LoopingAnim(playerid,"RIOT","RIOT_CHANT",4.0,1,1,1,1,0);
	return true;
}
YCMD:frisked(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
    LoopingAnim(playerid,"POLICE","crm_drgbst_01",4.0,0,1,1,1,0);
	return true;
}
YCMD:exhausted(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
    LoopingAnim(playerid,"PED","IDLE_tired",3.0,1,0,0,0,0);
	return true;
}
YCMD:injured(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
    LoopingAnim(playerid, "SWEET", "Sweet_injuredloop", 4.0, 1, 0, 0, 0, 0);
	return true;
}
YCMD:slapass(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
    OnePlayAnim(playerid, "SWEET", "sweet_ass_slap", 4.0, 0, 0, 0, 0, 0);
	return true;
}
std::IsBlocked(playerid, id) return Iter_Contains(player_in_blocks[playerid], id);

cmd:block(playerid, params[]) {
	if(!PlayerInfo[playerid][pPremiumAccount] && PlayerInfo[playerid][pVip])
		return true;

	new id;
	if(sscanf(params, "u",id)) 
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/block <playerid/name>");

	if(IsBlocked(playerid, id)) 
		return SCM(playerid, COLOR_GREY, "Acest player este deja blocat!");
	
	if(id == playerid) 
		return SCM(playerid, COLOR_LGREEN, "Nu poti folosi aceasta comanda asupra ta!");

	Iter_Add(player_in_blocks[playerid], id);
	SCMf(playerid, 0xFFBABAFF, "L-ai blocat pe %s (%d)! Acesta nu o sa te mai poate contacta pana la urmatoarea deconectare.", GetName(id), id);
	return true;
}
cmd:blocklist(playerid, params[]) {
	if(!PlayerInfo[playerid][pPremiumAccount] && PlayerInfo[playerid][pVip])
		return true;

	if(!Iter_Count(player_in_blocks[playerid])) 
		return SCM(playerid, -1, "Nu au fost gasiti playeri blocati!");

	SCM(playerid, -1, "-- Playeri blocati --");
	foreach(new i : player_in_blocks[playerid]) SCMf(playerid, -1, "%s (%d)", GetName(i), i);
	SCMf(playerid, COLOR_WHITE, "Au fost gasiti %d playeri.", Iter_Count(player_in_blocks[playerid]));
	return true;
}
	
cmd:unblock(playerid, params[]) {
	if(!PlayerInfo[playerid][pPremiumAccount] && PlayerInfo[playerid][pVip])
		return true;

	new id;
	if(sscanf(params, "u",id)) 
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/unblock <playerid/name>");

	if(!IsBlocked(playerid, id)) 
		return SCM(playerid, COLOR_GREY, "Acest player nu este blocat!");

	if(id == playerid) 
		return SCM(playerid, COLOR_LGREEN, "Nu poti folosi aceasta comanda asupra ta!");

	Iter_Remove(player_in_blocks[playerid], id);
	SCMf(playerid, 0xFFBABAFF, "L-ai deblocat pe %s (%d)! Acesta te poate contacta acum.", GetName(id), id);
	return true;
}

YCMD:paint(playerid, params[]) {
	new i = PlayerVar[playerid][IsPickup], x = PickupInfo[i][pkID];
	if(PickupInfo[i][pkType] != 2 || (!PlayerToPoint(playerid, 3.0, BizzInfo[x][bEnterPos][0], BizzInfo[x][bEnterPos][1], BizzInfo[x][bEnterPos][2]) || BizzInfo[x][bType] != 14))
		return true;

	if(GetPlayerCash(playerid) < 10000)
		return SCM(playerid, COLOR_LGREEN, "Nu ai suma de $10.000 pentru a intra in paintball.");

	if(PlayerInfo[playerid][pPlaying] < 5 * 3600)
		return SCM(playerid, COLOR_LGREEN, "Trebuie sa ai minim 5 ore jucate pentru a intra in paintball.");

	if(InWar[PlayerInfo[playerid][pMember]] != -1)
		return SCM(playerid, COLOR_GREY, "Nu poti intra in painball in timpul unui war.");

	if(PlayerInfo[playerid][pWeaponLicense] <= gettime())
		return SCM(playerid, COLOR_LGREEN, "Nu ai licenta de arme.");

	if(PlayerInfo[playerid][pWanted] != 0)
		return SCM(playerid, COLOR_LGREEN, "Nu poti intra in paintball pentru ca ai wanted!");

	if(PlayerVar[playerid][Duty])
		return SCM(playerid, COLOR_LGREEN, "Nu poti intra in paintball daca esti duty.");

	listitemm[playerid] = x;

	new szString[500];
	gString[0] = EOS;
	if(PB_Status[0] != 0) format(gString, 100, "Mode\tPlayers\tMap\tStatus\nClassic\t%d/20\t%s\t{22C165}%02d:%02d (%s)\n", Iter_Count(PlayerPaint[0]), MapName(0), PB_Time[0]/60, PB_Time[0] % 60, PB_Status[0] == 1 ? ("loading") : ("started"));
	else format(gString, 100, "Mode\tPlayers\tMap\tStatus\nClassic\t%d/20\t%s\t{FFFF00}waiting..\n", Iter_Count(PlayerPaint[0]), MapName(0));
	strcat(szString, gString);
	if(PB_Status[1] != 0) format(gString, 100, "Deagle Only\t%d/20\t%s\t{22C165}%02d:%02d (%s)", Iter_Count(PlayerPaint[1]), MapName(1), PB_Time[1]/60, PB_Time[1] % 60, PB_Status[1] == 1 ? ("loading") : ("started"));
	else format(gString, 100, "Deagle Only\t%d/20\t%s\t{FFFF00}waiting..", Iter_Count(PlayerPaint[1]), MapName(1));
	strcat(szString, gString);
	ShowPlayerDialog(playerid, DIALOG_PAINT, DIALOG_STYLE_TABLIST_HEADERS, "PaintBall:", szString, "Ok", "Exit");
	return true;
}

YCMD:cw(playerid, params[], help) {
    if(!IsPlayerInAnyVehicle(playerid)) 
    	return true;

	if(sscanf(params, "s[250]", params)) 
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/cw [text]");

	if(CheckMute(playerid)) 
		return ShowMute(playerid);
	
	if checkReclame(playerid, params) *then return true;
	format(gString, sizeof gString, "(Car Whisper) %s: %s", GetName(playerid), params);
	foreach(new i : PlayerInVehicle[GetPlayerVehicleID(playerid)]) SCM(i, COLOR_YELLOW, gString);
    return true;
}

YCMD:w(playerid, params[], help) {
	if(PlayerInfo[playerid][pLevel] < 2)
		return SCM(playerid, COLOR_GREY, "Ai nevoie de level 2.");

	new id;
	if(sscanf(params, "us[128]", id, params)) 
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/whisper [playerid/name] [text]");
	
	if(CheckMute(playerid)) 
		return ShowMute(playerid);

	if(PlayerInfo[playerid][pLevel] < 3) 
		return SCM(playerid, COLOR_LGREEN, "Nu poti folosi aceasta comanda deoarece nu ai minim level 3!");

	if(!PlayerOfRangeToPlayer(playerid, 5, id)) 
		return SCM(playerid, COLOR_GREY, "Nu esti langa acel player!");

	if(playerid == id) 
		return SCM(playerid, COLOR_LGREEN, "Nu poti folosi aceasta comanda pe tine!");

	gString[0] = EOS;
	format(gString, sizeof gString, "(Whisper) from %s (%d): %s", GetName(playerid), playerid, params);
	SCM(id, COLOR_YELLOW, gString);
	format(gString, sizeof gString, "(Whisper) sent to %s (%d): %s", GetName(id), id, params);
	SCM(playerid, COLOR_YELLOW, gString);
	PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	PlayerPlaySound(id, 1139, 0.0, 0.0, 0.0);
	return true;
}

YCMD:votemap(playerid, params[], help) {
	if(!PaintType[playerid])
		return true;

	if(Voted[playerid]) 
		return SCM(playerid, COLOR_LGREEN, "Nu poti vota de mai multe ori.");

	if(PB_Status[PaintType[playerid] - 1] != 1) return SCM(playerid, -1, "Nu se poate vota acum.");
	ShowPlayerDialog(playerid, DIALOG_VOTE, DIALOG_STYLE_LIST, "Voteaza mapa", "rc_arena\nfarm\nisland\ndesert\nbeach\nforest", "Ok", "Exit");
	return true;
}

YCMD:leavepaint(playerid, params[], help) {
	if(!PaintType[playerid]) 
		return SCM(playerid, COLOR_GREY, "Nu esti la paintball.");

	gString[0] = EOS;
	format(gString, 100, "%s has left the paintball arena.", GetName(playerid));
	SendPaintMessage(PaintType[playerid], COLOR_LIGHTGOLD, gString);
	SCM(playerid, COLOR_LGREEN, "Leaving the paintball arena...");
	PKills[playerid] = 0, PDeath[playerid] = 0;
	if(Iter_Contains(PlayerPaint[PaintType[playerid] - 1], playerid)) Iter_Remove(PlayerPaint[PaintType[playerid] - 1], playerid);
	PaintType[playerid] = 69;
	SetPlayerHealth(playerid, 0.0);
	for(new m = 0; m < 5; m++) SendDeathMessageToPlayer(playerid, 1001, 1001, 200);
	SetPlayerWorldBounds(playerid, 20000.0000, -20000.0000, 20000.0000, -20000.0000);
	return true;
}
YCMD:deal(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");   
    OnePlayAnim(playerid, "DEALER", "DEALER_DEAL", 4.0, 0, 0, 0, 0, 0);
	return true;
}
YCMD:dealstance(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");

    LoopingAnim(playerid,"DEALER","DEALER_IDLE",4.0,1,0,0,0,0);
	return true;
}
YCMD:crack(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
    
    LoopingAnim(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
	return true;
}
YCMD:wank(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
    //LoopingAnim(playerid,"PAULNMAC", "wank_loop", 1.800001, 1, 0, 0, 1, 600);
    ApplyAnimation(playerid, "PAULNMAC", "wank_out",4.1, 0, 1, 1, 0, 0, 1); 
	return true;
}
YCMD:salute(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
    if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
    
    ApplyAnimation(playerid, "ON_LOOKERS", "Pointup_loop", 4.0, 1, 0, 0, 0, 0, 1);
    return true;
}
YCMD:gro(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
    LoopingAnim(playerid,"BEACH", "ParkSit_M_loop", 4.0, 1, 0, 0, 0, 0);
	return true;
}
YCMD:sup(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
    new test;
    if(sscanf(params, "d",test)) return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/sup <1-3>");
	switch (test) {
    	case 1: OnePlayAnim(playerid,"GANGS","hndshkba",4.0,0,0,0,0,0);
     	case 2: OnePlayAnim(playerid,"GANGS","hndshkda",4.0,0,0,0,0,0);
     	case 3: OnePlayAnim(playerid,"GANGS","hndshkfa_swt",4.0,0,0,0,0,0);
    	default: SCM(playerid,COLOR_GREY, "Syntax: {FFFFFF}/sup <1-3>");
	}
    return true;
}
YCMD:rap(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
	new test;
    if(sscanf(params, "d",test)) return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/rap <1-4>");
	switch (test)
	{
	    case 1: LoopingAnim(playerid,"RAPPING","RAP_A_Loop",4.0,1,0,0,0,0);
    	case 2: LoopingAnim(playerid,"RAPPING","RAP_C_Loop",4.0,1,0,0,0,0);
    	case 3: LoopingAnim(playerid,"GANGS","prtial_gngtlkD",4.0,1,0,0,0,0);
     	case 4: LoopingAnim(playerid,"GANGS","prtial_gngtlkH",4.0,1,0,0,1,1);
    	default: SCM(playerid,COLOR_GREY, "Syntax: {FFFFFF}/rap <1-4>");
	}
    return true;
}
YCMD:push(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
 	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
 	OnePlayAnim(playerid,"GANGS","shake_cara",4.0,0,0,0,0,0);
	return true;
}
YCMD:akick(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
	OnePlayAnim(playerid,"POLICE","Door_Kick",4.0,0,0,0,0,0);
	return true;
}
YCMD:lowbodypush(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
	OnePlayAnim(playerid,"GANGS","shake_carSH",4.0,0,0,0,0,0);
	return true;
}
YCMD:headbutt(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
	OnePlayAnim(playerid,"WAYFARER","WF_Fwd",4.0,0,0,0,0,0);
	return true;
}
YCMD:pee(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_PISSING);
	return true;
}
YCMD:koface(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
	LoopingAnim(playerid,"PED","KO_shot_face",4.0,0,1,1,1,0);
	return true;
}
YCMD:kostomach(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
	LoopingAnim(playerid,"PED","KO_shot_stom",4.0,0,1,1,1,0);
	return true;
}
YCMD:kiss(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
	LoopingAnim(playerid,"KISSING", "Grlfrd_Kiss_02", 1.800001, 1, 0, 0, 1, 600);
	return true;
}
YCMD:rollfall(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
	LoopingAnim(playerid,"PED","BIKE_fallR",4.0,0,1,1,1,0);
	return true;
}
YCMD:lay2(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
	LoopingAnim(playerid,"SUNBATHE","Lay_Bac_in",3.0,0,1,1,1,0);
	return true;
}
YCMD:hitch(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
	LoopingAnim(playerid,"MISC","Hiker_Pose", 4.0, 1, 0, 0, 0, 0);
	return true;
}
YCMD:beach(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
	LoopingAnim(playerid,"BEACH","SitnWait_loop_W",4.1,0,1,1,1,1);
	return true;
}
YCMD:medic(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
	LoopingAnim(playerid,"MEDIC","CPR",4.1,0,1,1,1,1);
	return true;
}


YCMD:scratch(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
	LoopingAnim(playerid,"MISC","Scratchballs_01", 4.0, 1, 0, 0, 0, 0);
	return true;
}
YCMD:sit(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
	LoopingAnim(playerid,"PED","SEAT_idle", 4.0, 1, 0, 0, 0, 0);
	return true;
}
YCMD:drunk(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
	LoopingAnim(playerid,"PED","WALK_DRUNK",4.0,1,1,1,1,0);
	return true;
}
YCMD:bomb(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
   	ClearAnimations(playerid);
   	OnePlayAnim(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0);
	return true;
}
YCMD:getarrested(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
    LoopingAnim(playerid,"ped", "ARRESTgun", 4.0, 0, 1, 1, 1, -1);
	return true;
}
YCMD:chat(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
    OnePlayAnim(playerid,"PED","IDLE_CHAT",4.0,0,0,0,0,0);
	return true;
}
YCMD:fucku(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
    OnePlayAnim(playerid,"PED","fucku",4.0,0,0,0,0,0);
	return true;
}
YCMD:taichi(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
    LoopingAnim(playerid,"PARK","Tai_Chi_Loop",4.0,1,0,0,0,0);
	return true;
}
YCMD:knife(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
	new test;
    if(sscanf(params, "d",test)) return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/knife <1-4>");
	switch (test)
	{
	    case 1: LoopingAnim(playerid,"KNIFE","KILL_Knife_Ped_Damage",4.0,0,1,1,1,0);
     	case 2: LoopingAnim(playerid,"KNIFE","KILL_Knife_Ped_Die",4.0,0,1,1,1,0);
      	case 3: OnePlayAnim(playerid,"KNIFE","KILL_Knife_Player",4.0,0,0,0,0,0);
     	case 4: LoopingAnim(playerid,"KNIFE","KILL_Partial",4.0,0,1,1,1,1);
    	default: SCM(playerid,COLOR_GREY, "Syntax: {FFFFFF}/knife <1-4>");
	}
	return true;
}
YCMD:basket(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatii in timp ce esti intr-un vehicul.");
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
	new test;
    if(sscanf(params, "d",test)) return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/basket <1-6>");
	switch (test)
 	{
    	case 1: LoopingAnim(playerid,"BSKTBALL","BBALL_idleloop",4.0,1,0,0,0,0);
    	case 2: OnePlayAnim(playerid,"BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0);
     	case 3: OnePlayAnim(playerid,"BSKTBALL","BBALL_pickup",4.0,0,0,0,0,0);
     	case 4: LoopingAnim(playerid,"BSKTBALL","BBALL_run",4.1,1,1,1,1,1);
    	case 5: LoopingAnim(playerid,"BSKTBALL","BBALL_def_loop",4.0,1,0,0,0,0);
       	case 6: LoopingAnim(playerid,"BSKTBALL","BBALL_Dnk",4.0,1,0,0,0,0);
    	default: SCM(playerid,COLOR_GREY, "Syntax: {FFFFFF}/basket <1-6>");
	}
	return true;
}
YCMD:dance(playerid, params[], help) {
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatia aceasta atata timp cat esti intr-un vehicul.");new test;
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
	if(sscanf(params, "d",test)) return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/dance <1-4>");
	if(test < 1 || test > 4) return SCM(playerid,COLOR_GREY, "Syntax: {FFFFFF}/dance <1-4>");
	switch(test) {
		case 1: SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE1);
		case 2: SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE2);
		case 3: SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE3);
		case 4: SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE4);
	}
	return true;
}

cmd:sellgun(playerid, params[]) {
	if PlayerInfo[playerid][pJob] != 7 *then 
		return SCM(playerid,-1,"Nu ai jobul 'Distribuitor de arme'");

	extract params -> new player:id, string:gunname[32], price; else {
		SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/sellgun <playerid/name> <Gun Name> <price>");
		SCM(playerid, COLOR_WHITE, "Weapons:{FFFFFF} SDPistol(100) Deagle(150)");
		SCM(playerid, COLOR_WHITE, "Weapons:{FFFFFF} MP5(200) Shotgun(300)");
		SCM(playerid, COLOR_WHITE, "Weapons:{FFFFFF} AK47(350) M4(400) Rifle(600)");
		return true;
	}
	if !IsPlayerConnected(id) *then 
		return SCM(playerid, COLOR_GREY, "Acel player nu este conectat.");

	if !IsPlayerLogged(id) *then
		return SCM(playerid, COLOR_GREY, "Acel player nu este logat!");

	if playerid == id *then 
		return SCM(playerid,COLOR_WHITE,"You can not sell yourself weapons.");

	if PlayerInfo[playerid][pJail] != 0 *then 
		return SCM(playerid, COLOR_GREY, "Nu poti vinde lucruri atata timp cat esti in jail!");

	if IsPlayerInAnyVehicle(id) *then 
		return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta comanda atata timp cat acel player este intr-un vehicul.");

	if IsPlayerInRangeOfPoint(playerid, 300, -1423.5153,935.8321,1036.4756) *then 
		return SCM(playerid, -1, "Nu poti folosi aceasta comanda in arena de evente.");
	
	if PlayerInfo[id][pWeaponLicense] < gettime() *then 
		return SCM(playerid,COLOR_WHITE,"This player does not have arms license.");

	switch YHash(gunname) do {
		case _H<sdpistol>: {
			if PlayerInfo[playerid][pMats] < 100 *then 
				return SCM(playerid,COLOR_GREY, "Nu ai destule materiale pentru aceasta arma.");

			sellGunID[playerid] = 0;
		}
		case _H<deagle>: {
			if PlayerInfo[playerid][pMats] < 150 *then 
				return SCM(playerid,COLOR_GREY, "Nu ai destule materiale pentru aceasta arma.");

			sellGunID[playerid] = 1;
		}
		case _H<mp5>: {
			if PlayerInfo[playerid][pMats] < 200 *then 
				return SCM(playerid,COLOR_GREY, "Nu ai destule materiale pentru aceasta arma.");
			
			sellGunID[playerid] = 2;
		}
		case _H<shotgun>: {
			if PlayerInfo[playerid][pMats] < 300 *then 
				return SCM(playerid,COLOR_GREY, "Nu ai destule materiale pentru aceasta arma.");

			sellGunID[playerid] = 3;
		}
		case _H<ak47>: {
			if PlayerInfo[playerid][pMats] < 350 *then 
				return SCM(playerid,COLOR_GREY, "Nu ai destule materiale pentru aceasta arma.");
			
			sellGunID[playerid] = 4;
		}
		case _H<m4>: {
			if PlayerInfo[playerid][pMats] < 400 *then 
				return SCM(playerid,COLOR_GREY, "Nu ai destule materiale pentru aceasta arma.");
			
			sellGunID[playerid] = 5;
		}
		case _H<rifle>: {
			if PlayerInfo[playerid][pMats] < 600 *then 
				return SCM(playerid,COLOR_GREY, "Nu ai destule materiale pentru aceasta arma.");

			sellGunID[playerid] = 6;
		}
		default: return SCM(playerid,COLOR_WHITE,"Numele armei este invalid.");
	}
	if price < 1 || price > 100000 *then 
		return SCM(playerid,COLOR_WHITE,"Pretul trebuie sa fie intre $1 si $100.000.");

	if !PlayerOfRangeToPlayer(playerid, 5.0, id) *then 
		return SCM(playerid, -1, "Acel player nu este langa tine.");

	gunOferID[playerid] = id;
	gunOferID[id] = playerid;
	sellGunPrice[playerid] = price;
	SCMf(playerid, COLOR_MONEY, "* I-ai oferit lui %s %s pentru %s$.",GetName(id),gunname,FormatNumber(price));
	SCMf(id, COLOR_MONEY, "* %s ti-a oferit %s pentru %s$, (scrie /accept gun %d) pentru a accepta.",GetName(playerid),gunname,FormatNumber(price),playerid);
	return true;
}

YCMD:jumpwater(playerid, params[], help) {
	if(GetPlayerAnimationIndex(playerid) == 1130) return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "Nu poti folosi animatia aceasta atata timp cat esti intr-un vehicul.");
    if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");
    OnePlayAnim(playerid,"DAM_JUMP","DAM_LAUNCH",2,0,1,1,0,0);
	return true;
}
YCMD:stopanim(playerid, params[], help) {
	if(IsPlayerInAnyVehicle(playerid)) 
		return true;

	if(PlayerVar[playerid][FishTimer] != 0)
		return true;

	if(IsPlayerFalling(playerid)) 
		return SCM(playerid, -1, "Nu poti folosi aceasta comanda in timp ce cazi!");
	
	if(RobStatus[playerid] != 0 && RobStatus[playerid] < 4) return SCM(playerid, COLOR_LGREEN, "Nu poti folosi comanda aceasta in timp ce dai rob.");

	if(inAnim[playerid] > gettime()) return true;

	ClearAnimations(playerid);
    return true;
}

stock TotalPlayerCrates(playerid) return PlayerInfo[playerid][pCrate][0] + PlayerInfo[playerid][pCrate][1] + PlayerInfo[playerid][pCrate][2] + PlayerInfo[playerid][pCrate][3] + PlayerInfo[playerid][pCrate][4] + PlayerInfo[playerid][pCrate][5];

YCMD:buycrate(playerid, params[]) {
	if(!PlayerVar[playerid][IsPickup])
		return true;

	new x=-1;
	while(++x<3) if(PlayerToPoint(playerid, 2.0, CrateInfo[x][C_POS][0], CrateInfo[x][C_POS][1], CrateInfo[x][C_POS][2])) break;
	if(x==-1) return SCM(playerid, COLOR_GREY, "Nu esti langa un crate.");

	switch(x) {
		case 0: ShowPlayerDialog(playerid, DIALOG_BUYCRATE, DIALOG_STYLE_LIST, "Buy Crate", "{E065EE}300 Red points", "Buy", "Close");
		case 1: ShowPlayerDialog(playerid, DIALOG_BUYCRATE, DIALOG_STYLE_LIST, "Buy Crate", "{E065EE}2500 Red points\n{FFFF00}100 premium points", "Buy", "Close");
		case 2: ShowPlayerDialog(playerid, DIALOG_BUYCRATE, DIALOG_STYLE_LIST, "Buy Crate", "{FFFF00}350 puncte premium", "Buy", "Close");
	}
	return true;
}

new CodQR[MAX_PLAYERS][83] = {_:INVALID_TEXT_DRAW, ...};
stock generateQR(const user, x=-1) {
	CodQR[user][0] = CreateQR_TXD(user, 234.7, 155.0, 162.0, 169.0, -1);
	while(++x<3) {
		CodQR[user][(x*3)+1] = CreateQR_TXD(user, 250.9 + ((x%2) * 93.50), 172.04 + ((x/2) * 97.00), 35.1, 36.86, 255);
		CodQR[user][(x*3)+2] = CreateQR_TXD(user, 254.13 + ((x%2) * 93.80), 175.26 + ((x/2) * 97.1), 28.0, 30.0, -1);
		CodQR[user][(x*3)+3] = CreateQR_TXD(user, 258.60 + ((x%2) * 93.78), 180.0 + ((x/2) * 97.07), 19.0, 20.0, 255);
	} x=-1;
	while(++x<12) CodQR[user][10+x] = random(50) < 25 ? CreateQR_TXD(user, 297.54 + ((x%3) * 11.70), 172.22 + ((x/3) * 12.225), 11.8, 12.15, 255) : _:INVALID_TEXT_DRAW; x=-1; // 1
	while(++x<33) CodQR[user][22+x] = random(50) < 25 ? CreateQR_TXD(user, 250.42 + ((x%11) * 11.70), 221.1 + ((x/11) * 12.225), 11.8, 12.15, 255) : _:INVALID_TEXT_DRAW; x=-1; 	// 2
	while(++x<28) CodQR[user][55+x] = random(50) < 25 ? CreateQR_TXD(user, 297.175 + ((x%7) * 11.70), 257.014 + ((x/7) * 12.210), 11.8, 12.15, 255) : _:INVALID_TEXT_DRAW; // 3
	return true;
} 

stock destroyQR(const user, x=-1) {
	if(CodQR[user][0] == _:INVALID_TEXT_DRAW) return true;
	while(++x<83) {
		if(CodQR[user][x]==_:INVALID_TEXT_DRAW) continue;
		PlayerTextDrawDestroy(user, PlayerText:CodQR[user][x]); CodQR[user][x]=-1;
	}
	return true;
}
stock CreateQR_TXD(user, Float:x, Float:y, Float:size_x, Float:size_y, color, PlayerText:QR_TXD=PlayerText:INVALID_TEXT_DRAW) {
	QR_TXD = CreatePlayerTextDraw(user, x, y, "LD_SPAC:white");
	PlayerTextDrawTextSize(user, QR_TXD, size_x, size_y);
	PlayerTextDrawColor(user, QR_TXD, color);
	PlayerTextDrawLetterSize(user, QR_TXD, 0.0, 0.0);
	PlayerTextDrawAlignment(user, QR_TXD, 1);
	PlayerTextDrawSetShadow(user, QR_TXD, 0);
	PlayerTextDrawSetOutline(user, QR_TXD, 0);
	PlayerTextDrawBackgroundColor(user, QR_TXD, 255);
	PlayerTextDrawFont(user, QR_TXD, 4);
	PlayerTextDrawSetProportional(user, QR_TXD, 0);
	PlayerTextDrawSetShadow(user, QR_TXD, 0);
	PlayerTextDrawShow(user, QR_TXD);
	return _:QR_TXD;
}
cmd:qr(playerid) {
	destroyQR(playerid);
	generateQR(playerid);
	return true;
}
cmd:destroyqr(playerid) return destroyQR(playerid);

YCMD:crates(playerid, params[], help) {
	if(!TotalPlayerCrates(playerid))
		return SCM(playerid, COLOR_GREY, "You not have a crate.");

	if(player_selected[playerid] != 0)
		return true;

	format(gString, sizeof gString, "Model\tAmount\n{ABA952}Basic Crate\t%d\n{877F98}Red Crate\t%d\n{6020E7}Vehicle Crate\t%d", PlayerInfo[playerid][pCrate][0], PlayerInfo[playerid][pCrate][1], PlayerInfo[playerid][pCrate][2]);
	ShowPlayerDialog(playerid, DIALOG_CRATE, DIALOG_STYLE_TABLIST_HEADERS, "SERVER: Crate", gString, "Select", "Close");
	return true;
}
stock GetSkinColor(skin) {
	switch(skin) {
		case 290, 264, 246: return 0xFF0097FF;
		case 45, 91, 124, 195, 291: return 0x2AFF00FF;
		case 271, 233, 251, 144, 0: return 0xFF0000FF;
	}
	return 858993663;
}

stock GetSkinType(skin) {
	new string[20];
	switch(skin) {
		case 290, 264, 246: string = "Rare";
		case 45, 91, 124, 195, 291: string = "Very Rare";
		case 271, 233, 251, 144, 0: string = "Special";
		default: string = "None";
	}
	return string;
}

stock GetSkinTypeEx(skin) {
	new string[20];
	switch(skin) {
		case 290, 264, 246: string = "~b~~h~Rare";
		case 45, 91, 124, 195, 291: string = "~g~Very Rare";
		case 271, 233, 251, 144, 0: string = "~r~Special";
		default: string = "None";
	}
	return string;
}



stock GetSkinRare(skin) {
	switch(skin) {
		case 290, 264, 246,45, 91, 124, 195, 291,271, 233, 251, 144, 0: return true;
	}
	return false;
}

stock GetSkinMoney(skin) {
	switch(skin) {
		case 290, 264, 246: return 10;
		case 45, 91, 124, 195, 291: return 35;
		case 271, 233, 251, 144, 0: return 50;
	}
	return 0;
}

stock GetSkinExp(playerid) {
	switch(PlayerInfo[playerid][pModel]) {
		case 290, 264, 246: return RandomEx(5, 10);
		case 45, 91, 124, 195, 291: return RandomEx(20, 35);
		case 271, 233, 251, 144, 0: return RandomEx(50, 100); 
	}
	return 0;
}

std::GetPlayerVouchers(playerid) return PlayerInfo[playerid][pVoucher][0]+PlayerInfo[playerid][pVoucher][1]+PlayerInfo[playerid][pVoucher][2];

cmd:vouchers(playerid) {
	if(!GetPlayerVouchers(playerid))
		return SCM(playerid, COLOR_LGREEN, "Eroare: Nu ai vouchere!");

	if(PlayerVar[playerid][IsTrade] != -1)
		return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta functie in timp ce faci trade.");

	format(gQuery, sizeof gQuery, "Model\tTotal\nRare Voucher\t%d\nNatrox Voucher\t%d\nSpecial Voucher\t%d", PlayerInfo[playerid][pVoucher][0],PlayerInfo[playerid][pVoucher][1],PlayerInfo[playerid][pVoucher][2]);
	ShowPlayerDialog(playerid, DIALOG_VOUCHER, DIALOG_STYLE_TABLIST_HEADERS, "My Vouchers", gQuery, "Select", "Cancel");
	return true;
}

YCMD:gps(playerid, params[], help) {
	if(HaveCheckpoint(playerid)) return ShowCancelCP(playerid);
	ShowPlayerDialog(playerid, DIALOG_LOCATIONS, DIALOG_STYLE_LIST, "Locations", "Business\nDMV\nGiftbox & Crates", "Select", "Close");	
	return true;
}

YCMD:deposit(playerid, params[], help) {
	if(!PlayerToPoint(playerid, 30, 2311.1482,-8.7921,26.7422))
		return SCM(playerid, COLOR_GREY, "Don't be in the bank.");

	if(GetCoolDowns(playerid, 14)) 
		return CoolDowns(playerid, 14);

	if(PlayerVar[playerid][IsTrade] != -1)
		return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta functie in timp ce faci trade.");

	new deposit;
	if(sscanf(params, "i", deposit))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/deposit [amount]");

	if(deposit < 1 || deposit > 1000000000) 
		return SCM(playerid, COLOR_GREY, "Invalid Amount ($1 - $1.000.000.000).");

	if(GetPlayerCash(playerid) < deposit)
		return SCM(playerid, COLOR_GREY, "You do not have the amount of money you want to deposit.");

	GivePlayerBank(playerid, deposit);
	GivePlayerCash(playerid, -deposit);
	SavePlayerBank(playerid);
	SetCoolDowns(playerid, 14, 5);

	gString[0] = EOS;
	format(gString, sizeof(gString), "You have deposited %s, Balance: %s.", FormatNumber(deposit), formatBytes(bank[playerid]));
	SCM(playerid, COLOR_ADMCMD, gString);
	return true;
}

YCMD:withdraw(playerid, params[], help) {
	if(!GetPlayerBizzType(playerid, BIZ_BANK))
		return SCM(playerid, COLOR_GREY, "Don't be in the bank.");
	
	if(GetCoolDowns(playerid, 15)) 
		return CoolDowns(playerid, 15);

	new withdraw;
	if(sscanf(params, "i", withdraw))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/withdraw [amount]");

	if(withdraw < 1 || withdraw > 1000000000) 
		return SCM(playerid, COLOR_GREY, "Invalid amount ($1 - $1.000.000.000).");

	if(GetPlayerBank(playerid) < withdraw)
		return SCM(playerid, COLOR_LGREEN, "Insufficient funds.");

	GivePlayerCash(playerid, withdraw);
	GivePlayerBank(playerid, -withdraw);
	SavePlayerBank(playerid);
	SetCoolDowns(playerid, 15, 5);

	gString[0] = EOS;
	format(gString, sizeof(gString), "You withdrew %s, balance: %s", FormatNumber(withdraw), formatBytes(bank[playerid]));
	SCM(playerid, COLOR_ADMCMD, gString);
	return true;
}

YCMD:balance(playerid, params[], help) {
	if(!GetPlayerBizzType(playerid, BIZ_BANK))
		return SCM(playerid, COLOR_GREY, "Nu esti la banca.");
	gString[0] = EOS;
	format(gString, sizeof(gString), "Balance: $%s.", formatBytes(bank[playerid]));
	SCM(playerid, COLOR_ADMCMD, gString);
	return true;
}

YCMD:transfer(playerid, params[], help) {
	if(!GetPlayerBizzType(playerid, BIZ_BANK))
		return SCM(playerid, COLOR_GREY, "Don't be in the bank.");

	if(PlayerInfo[playerid][pLevel] < 5)
		return SCM(playerid, COLOR_GREY, "Poti transfera de la level 5.");

	if(GetCoolDowns(playerid, 16)) 
		return CoolDowns(playerid, 16);

	new id, amount;
	if(sscanf(params, "ui", id, amount))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/transfer [playerid/name] [amount]");

	if(playerid == id) return true;

	if(!IsPlayerConnected(id))
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(amount <= 0 || amount > 10000000)
		return SCM(playerid, COLOR_GREY, "Invalid transfer ($1 - $10,000,000).");

	if(GetPlayerBank(playerid) < amount)
		return SCM(playerid, COLOR_GREY, "Insufficient funds.");

	listitemm[playerid] = id;
	PlayerVar[playerid][Transfer] = amount;

	gString[0] = EOS;
	format(gString, sizeof(gString), "Esti sigur ca vrei sa ii transferi lui %s [id: %d] suma de $%s\nTax: $%s.", GetName(id), id, FormatNumber(amount-(amount/10)), FormatNumber(amount/10));
	ShowPlayerDialog(playerid, DIALOG_TRANSFER, DIALOG_STYLE_MSGBOX, "Transfer:", gString, "Select", "Close");
	return true;
}

YCMD:cheat(playerid, params[], help) {
	if(IsAdmin(playerid, 1))
		return SCM(playerid, COLOR_LGREEN, "You have admin.");

	if(GetCoolDowns(playerid, 2)) 
		return CoolDowns(playerid, 2);

	new id, reason[64];
	if(sscanf(params, "us[64]", id, reason))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/cheat [playerid/name] [reason]");

	if(playerid == id)
		return SCM(playerid, COLOR_GREY, "You can't report it yourself.");

	if(!IsPlayerConnected(id) || !IsPlayerLogged(id))
		return SCM(playerid,COLOR_GREY, "Player not conncted.");

	if(Iter_Contains(Reports[1], id))
		return SCM(playerid, COLOR_GREY, "Player alerdy raported.");

	if(PlayerInfo[id][pAdmin])
		return SCM(playerid, COLOR_GREY, "Nu poti raporta un admin!");

	SetCoolDowns(playerid, 2, 300);

	gString[0] = EOS;
	format(gString, 150, "L-ai raportat pe %s pentru cheaturi. Motiv: %s", GetName(id), reason);
	SCM(playerid, COLOR_YELLOW, gString);
	format(gString, 150, "Cheats %s(%d) raported by %s(%d). Motiv: %s", GetName(id), id, GetName(playerid), playerid, reason);
	SendAdminMessage(COLOR_RED, gString, 1);
	format(gString, 50, "%s(%d) suspect de cheaturi.", GetName(id), id);
	PlayerVar[id][RaportType][1] = playerid;
	Iter_Add(Reports[1], id);
	return true;
}

YCMD:ad(playerid, params[], help) {
	if(PlayerInfo[playerid][pLevel] < 5)
		return SCM(playerid, COLOR_GREY, "Nu ai level 5.");

	if(!PlayerInfo[playerid][pPhone])
		return SCM(playerid, COLOR_GREY, "Nu ai telefon.");

	if(PlayerVar[playerid][AdTime] > gettime())
		return SCM(playerid, COLOR_GREY, "Ai pus deja un ad, [/myad].");

	new i = PlayerVar[playerid][IsPickup], x = PickupInfo[i][pkID];
	if(PickupInfo[i][pkType] != 2)
		return SCM(playerid, COLOR_GREY, "Nu esti la CNN.");

	if(!PlayerToPoint(playerid, 3.0, BizzInfo[x][bEnterPos][0], BizzInfo[x][bEnterPos][1], BizzInfo[x][bEnterPos][2]) || BizzInfo[x][bType] != 9)
		return SCM(playerid, COLOR_GREY, "Nu esti la CNN.");

	if(BizzInfo[x][bStatus])
		return SCM(playerid, COLOR_GREY, "Acest bizz este inchis.");

	if(sscanf(params, "s[80]", params))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/ad [text]");

	if(strlen(params) < 10)
		return SCM(playerid, COLOR_GREY, "Invalid text (10 - 80 characters).");

	GivePlayerCash(playerid, -BizzInfo[x][bFee]);
	BizzInfo[x][bBalance] += BizzInfo[x][bFee];

	format(PlayerVar[playerid][AdText], 80, params);

	TotalAds++;
	new time = TotalAds*60;
	PlayerVar[playerid][AdTime] = gettime() + time;

	gString[0] = EOS;
	format(gString, sizeof(gString), "(Preview ad) %s ({FFFFFF}%d{007E00}): %s", GetName(playerid), playerid, PlayerVar[playerid][AdText]);
	SendAdminMessage(0x007E00AA, gString, 1);
	format(gString, sizeof(gString), "%s (phone: {FFFFFF}%d{00D900}): %s", GetName(playerid), PlayerInfo[playerid][pPhone], PlayerVar[playerid][AdText]);
	SCM(playerid, 0x00D900FF, gString);
	format(gString, sizeof(gString), "Ad-ul tau va fi plasat in %d secunde, pentru a vedea ad-ul tau [/myad].", time);
	SCM(playerid, COLOR_WHITE, gString);
	CheckPlayerMission(playerid, 8, 1);
	return true;
}

YCMD:licenses(playerid, params[]) return ShowPlayerLicense(playerid, playerid);
YCMD:showlicenses(playerid, params[]) {
	if(sscanf(params, "u", params[0]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/showlicense [playerid/name]");

	if(!IsPlayerConnected(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(!IsPlayerLogged(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not logged.");

	if(!PlayerOfRangeToPlayer(playerid, 5, params[0]))
		return SCM(playerid, COLOR_GREY, "Nu esti langa acel player.");

	gString[0] = EOS;
	format(gString, 100, "I-ai aratat licentele tale lui %s.", GetName(params[0]));
	SCM(playerid, COLOR_LIGHTBLUE, gString);
	format(gString, 100, "%s ti-a arata licentele lui.", GetName(playerid));
	SCM(params[0], COLOR_LIGHTBLUE, gString);
	ShowPlayerLicense(params[0], playerid);
	return true;
}

function ShowPlayerLicense(playerid, targetid) {
	gString[0] = EOS;
	new time, timeex, getimes = gettime();
	format(gString, 75, "----- %s's licenses -----", GetName(targetid));
	SCM(playerid, COLOR_GM, gString);
	time = PlayerInfo[targetid][pDriveLicense] - getimes, timeex = PlayerInfo[targetid][pDrvingSuspend] - getimes;
	if(time > 0) format(gString, 150, "Drive license: Passed ({D7FFB3}%d days. %d hours. %d minutes and %d seconds left{FFFFFF}).", time/86400, (time/3600) % 24, ((time/60) % 60), time % 60);
	else format(gString, 150, "Drive license: Suspended ({C24444}%d hours. %d minute %d seconds left{FFFFFF}).", timeex/3600, (timeex/60) % 60, timeex % 60); 
	SCM(playerid, COLOR_WHITE, (time > 0 || timeex > 0) ? gString : ("Drive license: Not passed.")); 
	time = PlayerInfo[targetid][pBoatLicense] - getimes, timeex = PlayerInfo[targetid][pBoatSuspend] - getimes;
	if(time > 0) format(gString, 150, "Boat license: Passed ({D7FFB3}%d days. %d hours. %d minutes and %d seconds left{FFFFFF}).", time/86400, (time/3600) % 24, ((time/60) % 60), time % 60);
	else format(gString, 150, "Boat license: Suspended ({D7FFB3}%d hours. %d minute %d seconds left{FFFFFF}).", timeex/3600, (timeex/60) % 60, timeex % 60);
	SCM(playerid, COLOR_WHITE, (time > 0 || timeex > 0) ? gString : ("Boat license: Not passed.")); 
	time = PlayerInfo[targetid][pFlyLicense] - getimes, timeex = PlayerInfo[targetid][pFlySuspend] - getimes;
	if(time > 0) format(gString, 150, "Fly license: Passed ({D7FFB3}%d days. %d hours. %d minutes and %d seconds left{FFFFFF}).", time/86400, (time/3600) % 24, ((time/60) % 60), time % 60);
	else format(gString, 150, "Fly license: Suspended ({D7FFB3}%d hours. %d minute %d seconds left{FFFFFF}).", timeex/3600, (timeex/60) % 60, timeex % 60);
	SCM(playerid, COLOR_WHITE, (time > 0 || timeex > 0) ? gString : ("Fly license: Not passed."));
	time = PlayerInfo[targetid][pWeaponLicense] - getimes, timeex = PlayerInfo[targetid][pWeaponSuspend] - getimes;
	if(time > 0) format(gString, 150, "Weapon license: Passed ({D7FFB3}%d days. %d hours. %d minutes and %d seconds left{FFFFFF}).", time/86400, (time/3600) % 24, ((time/60) % 60), time % 60);
	else format(gString, 150, "Weapon license: Suspended ({D7FFB3}%d hours. %d minute %d seconds left{FFFFFF}).", timeex/3600, (timeex/60) % 60, timeex % 60);
	SCM(playerid, COLOR_WHITE, (time > 0 || timeex > 0) ? gString : ("Weapon license: Not passed."));
	SCM(playerid, COLOR_GM, "------------------------------------------");
	return true;
}

YCMD:myad(playerid, params[], help) {
	if(PlayerVar[playerid][AdTime] < gettime()) 
		return SCM(playerid, COLOR_WHITE, "Nu ai pus nici-un ad.");

	format(gString, sizeof(gString), "(Preview ad) %s (phone: {FFFFFF}%d{00D900}): %s", GetName(playerid), PlayerInfo[playerid][pPhone], PlayerVar[playerid][AdText]);
	SCM(playerid, 0x00D900FF, gString);	
	return true;
}

YCMD:lights(playerid, params[], help) {
	new engine,lights,alarm,doors,bonnet,boot,objective;
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
		new veh;
		Lights[(veh=GetPlayerVehicleID(playerid))] = !Lights[veh];
		PlayerTextDrawColor(playerid, SpeedometerPTD[playerid][3], !Lights[veh] ? -1 : -459199745);
		PlayerTextDrawShow(playerid, SpeedometerPTD[playerid][3]);
		GetVehicleParamsEx(veh,engine,lights,alarm,doors,bonnet,boot,objective);
		SetVehicleParamsExx(veh,engine,Lights[veh],alarm,doors,bonnet,boot,objective);
	}
	return true;
}
YCMD:setfreq(playerid, params[], help) {
	if(!PlayerInfo[playerid][pWTalkie])
		return SCM(playerid, COLOR_GREY, "Nu ai o freqventa.");

	if(sscanf(params, "i", params[0]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/setfrq [1 - 100]");

	if(params[0] < 1 || params[0] > 100)
		return SCM(playerid, COLOR_GREY, "Invalid freq (1 - 100)");

	if(params[0] == PlayerInfo[playerid][pFreq])
		return SCM(playerid, COLOR_GREY, "Esti deja in aceasta freqventa.");

	if(PlayerInfo[playerid][pFreq] != 0) Iter_Remove(Freqs[PlayerInfo[playerid][pFreq] - 1], playerid);
	Iter_Add(Freqs[params[0] - 1], playerid);

	PlayerInfo[playerid][pFreq] = params[0];
	UpdateVar(playerid, "Freq", params[0]);

	if(params[0] == 0) return SCM(playerid, COLOR_WHITE, "Nu mai esti intr-o freqventa.");
	gString[0] = EOS;
	format(gString, 50, "Noua ta freqventa este %d.", params[0]);
	SCM(playerid, COLOR_WHITE, gString);
	return true;
}

YCMD:showfreq(playerid, params[], help) {
	if(!IsAdmin(playerid, 1)) 
		return SCM(playerid,COLOR_WHITE,AdminOnly);

    if(sscanf(params, "u", params[0])) 
    	return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/showfreq [playerid/name]");
   
    if(!PlayerInfo[params[0]][pWTalkie]) 
    	return SCM(playerid, -1, "Acel player nu are Walkie Talkie.");

    gString[0] = EOS;
   	format(gString, 50, "Frecventa %d.", PlayerInfo[params[0]][pFreq]);
    SCM(playerid, COLOR_WHITE, gString);
    return true;
}

YCMD:freqmembers(playerid, params[], help) {
	if(!PlayerInfo[playerid][pWTalkie])
		return SCM(playerid, COLOR_GREY, "Nu ai o freqventa.");


	if(!PlayerInfo[playerid][pFreq])
		return SCM(playerid,COLOR_GREY, "Nu esti pe o frecventa!");

	gString[0] = EOS;
	format(gString, 50, "-- Playeri pe frecventa %d --", PlayerInfo[playerid][pFreq]);
	SCM(playerid, COLOR_GREY, gString);
	foreach(new i : Freqs[PlayerInfo[playerid][pFreq] - 1]) {
		format(gString, 50, "%s (%d)", GetName(i), i);
		SCM(playerid, -1, gString);
	}
	format(gString, 100, "* Au fost gasiti %d jucatori pe aceasta frecventa!", Iter_Count(Freqs[PlayerInfo[playerid][pFreq] - 1]));
	SCM(playerid, COLOR_LGREEN, Iter_Count(Freqs[PlayerInfo[playerid][pFreq] - 1]) ? gString : "Nu au fost gasiti jucatori pe aceasta frecventa!");	
	return true;
}

YCMD:wt(playerid, params[], help) {
	if(!PlayerInfo[playerid][pWTalkie]) 
		return SCM(playerid, -1, "Nu ai o frecventa radio.");

	if(CheckMute(playerid)) return ShowMute(playerid);

	if(sscanf(params, "s[128]", params)) 
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/wt [text]");

	if(!PlayerInfo[playerid][pFreq]) 
		return SCM(playerid,COLOR_GREY, "Nu esti pe o frecventa!");

	gString[0] = EOS;
	foreach(new i : Freqs[PlayerInfo[playerid][pFreq] - 1]) {
		format(gString, 160, "[FREQ %d] %s: %s", PlayerInfo[playerid][pFreq], GetName(playerid), params);
		SCM(i, 0xC8E0DFFF, gString);
	}
	return true;
}

YCMD:enter(playerid, params[], help) return EnterFunction(playerid);

YCMD:id(playerid, params[], help) {
	new names[24], i, faction[64], name[45];

	if(sscanf(params, "s[24]", names)) 
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/id [playerid/name]");

	if(strlen(names) > 24) 
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	gString[0] = EOS;
	if(IsNumeric(names)) {
		if(strval(names) < 0 || strval(names) > 999) 
			return SCM(playerid, COLOR_GREY, "Player not connected."); 
		
		i = strval(names);
		if(!IsPlayerConnected(i))
			return SCM(playerid, COLOR_GREY, "Player not connected.");

		if(!IsPlayerLogged(i)) 
			return SCM(playerid, COLOR_GREY, "Player not connected.");
	
		if(PlayerInfo[i][pMember] != 0 && !PlayerVar[i][Acover]) format(faction, 65, "{%s}%s {FFFFFF}(Rank %d)", FactionInfo_[PlayerInfo[i][pMember]-1][fColor], FactionInfo_[PlayerInfo[i][pMember]-1][fName], PlayerInfo[i][pRank]);
		else faction = "none";

		if(GetClan[PlayerInfo[i][pClan]] != -1) {
			new c = GetClan[PlayerInfo[i][pClan]];
			switch(PlayerInfo[i][pClanTag]){
				case 0: format(name, 45, "{%s}%s{FFFFFF}%s", ClanInfo[c][clColor], ClanInfo[c][clTag], PlayerInfo[i][pName]);
				case 1: format(name, 45, "%s{%s}%s{FFFFFF}", PlayerInfo[i][pName], ClanInfo[c][clColor], ClanInfo[c][clTag]);
				default: format(name, 24, PlayerInfo[i][pName]);
			}
		} else format(name, 24, PlayerInfo[i][pName]);

		new afk[50];
		if(PlayerVar[i][AFKSeconds] > 10) format(afk, 50, " - {FFADAD}[AFK: %d]", PlayerVar[i][AFKSeconds]);
		format(gString, sizeof(gString), "(ID %d) Nume: {FFFFCC}%s{FFFFFF} | Level: %d | Factiune: %s | FPS: %d%s%s", i, name, !PlayerVar[playerid][Acover] ? PlayerInfo[i][pLevel] : PlayerVar[i][AcoverLevel], faction, GetPlayerFPS(i), PlayerInfo[i][pVip] ? (" {7DE41B}[VIP]") : (""), IsAdmin(playerid, 1) ? afk : (""));
		SCMEx(playerid, COLOR_WHITE, gString);	
		SetCoolDowns(playerid, 8, 5);	
		return true;
	}
	mysql_format(SQL, gQuery, sizeof gQuery, "SELECT * FROM `users` WHERE `name_and_tag` LIKE '%s%s%s' AND `Status` != '-1' ORDER BY `users`.`id` DESC LIMIT 10", "%", names, "%");
	mysql_pquery(SQL, gQuery, #check_fun_id, #ii, playerid, -1);
	return true;
}

redist::check_fun_id(playerid, x) {
	if(!cache_num_rows()) return SCM(playerid, COLOR_GREY, "Nu a fost gasit nici un jucator cu acest nume!");
	new faction[64],name[24],i=-1;
	while(++x<cache_num_rows()) {
		cache_get_value_name_int(x, "Status", i);
		if(PlayerInfo[i][pMember] != 0) 
			format(faction, 65, "{%s}%s {FFFFFF}(Rank %d)", FactionInfo_[PlayerInfo[i][pMember]-1][fColor], FactionInfo_[PlayerInfo[i][pMember]-1][fName], PlayerInfo[i][pRank]);
		else faction = "none";

		if(GetClan[PlayerInfo[i][pClan]] != -1) {
			new c = GetClan[PlayerInfo[i][pClan]];
			switch(PlayerInfo[i][pClanTag]){
				case 0: format(name, 45, "{%s}%s{FFFFFF}%s", ClanInfo[c][clColor], ClanInfo[c][clTag], PlayerInfo[i][pName]);
				case 1: format(name, 45, "%s{%s}%s{FFFFFF}", PlayerInfo[i][pName], ClanInfo[c][clColor], ClanInfo[c][clTag]);
				default: format(name, 24, PlayerInfo[i][pName]);
			}
		} else format(name, 24, PlayerInfo[i][pName]);

		if(PlayerVar[i][AFKSeconds] > 10 && IsAdmin(playerid, 1)) format(gString, sizeof(gString), "(ID %d) Nume: %s | Level: %d | Factiune: %s | FPS: %d%s - {FFADAD}[AFK: %d]", i, name, PlayerInfo[i][pLevel], faction, GetPlayerFPS(i), PlayerInfo[i][pVip] ? (" {7DE41B}[VIP]") : (""), PlayerVar[i][AFKSeconds]);
		else format(gString, sizeof(gString), "(ID %d) Nume: {FFFFCC}%s{FFFFFF} | Level: %d | Factiune: %s | FPS: %d%s", i, name, PlayerInfo[i][pLevel], faction, GetPlayerFPS(i), PlayerInfo[i][pVip] ? (" {7DE41B}[VIP]") : (""));
		SCMEx(playerid, COLOR_WHITE, gString);		
	}
	if(x == 10) SCM(playerid, COLOR_WHITE, "Au fost afisate doar primele 10 rezultate.");
	return true;
}

YCMD:s(playerid, params[], help) {
	if(CheckMute(playerid)) return ShowMute(playerid);
	if(sscanf(params, "s[250]", params)) return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/s(hout) [text]");
	gString[0] = EOS;
	format(gString, sizeof(gString), "%s striga: %s", GetName(playerid), params);
	ProxDetector(30.0, playerid, gString, COLOR_WHITE);
	SetPlayerChatBubble(playerid, gString, COLOR_WHITE, 30.0, 10000);
	return true;
}

YCMD:shop(playerid, params[], help) return ShowShop(playerid);

function ShowShop(playerid) {
	new szDialog[1000];

	strcat(szDialog, "#. Item\tPrice\n");
	strcat(szDialog, "1. {FFFFFF}Premium Account\t{C380C6}150 {FFFFFF}Premium Points\n");
	strcat(szDialog, "2. {FFFFFF}IPhone\t{C380C6}100 {FFFFFF}Premium Points\n");
	strcat(szDialog, "3. {FFFFFF}VIP Account\t{C380C6}350 {FFFFFF}Premium Points\n");
	strcat(szDialog, "4. {FFFFFF}Clan\t{C380C6}500 {FFFFFF}Premium Points\n");
	strcat(szDialog, "5. {FFFFFF}Hidden Color\t{C380C6}80 {FFFFFF}Premium Points\n");
	strcat(szDialog, "6. {FFFFFF}Vehicle Slot\t{C380C6}50 {FFFFFF}Premium Points\n");
	strcat(szDialog, "7. {FFFFFF}Clear 1 Warn\t{C380C6}60 {FFFFFF}Premium Points\n");
	strcat(szDialog, "8. {FFFFFF}Change nickname\t{C380C6}150 {FFFFFF}Premium Points\n");
	strcat(szDialog, "9. {FFFFFF}Clear 30 FP\t{C380C6}75 {FFFFFF}Premium Points\n");
	strcat(szDialog, "10. {FFFFFF}Rare Voucher\t{C380C6}55 {FFFFFF}Premium Points\n");
	strcat(szDialog, "11. {FFFFFF}Natrox Voucher\t{C380C6}110 {FFFFFF}Premium Points\n");
	strcat(szDialog, "12. {FFFFFF}Special Voucher\t{C380C6}515 {FFFFFF}Premium Points\n");
	strcat(szDialog, "13. {FFFFFF}MP3\t{C380C6}50 {FFFFFF}Premium Points\n");

	new title[65];
	format(title, 65, "{FFFFFF}Premium Points: {C380C6}%d", PlayerInfo[playerid][pPremiumPoints]);
	ShowPlayerDialog(playerid, DIALOG_SHOP, DIALOG_STYLE_TABLIST_HEADERS, title, szDialog, "Select", "Close");
	return true;
}
cmd:mp3(playerid, params[]) {
	if(!PlayerInfo[playerid][pMP3]) 
		return SCM(playerid, COLOR_LGREEN, "Eroare: Nu ai un MP3 Player!");

	gString="Nume\tAscultatori\n{FF3838}Turn OFF Radio\n";
	new x=-1;
	while(++x<sizeof RadioNames) format(gString, sizeof gString, "%s%s\t%d\n", gString, RadioNames[x], ListenThisRadio(x));

	ShowPlayerDialog(playerid, DIALOG_MP3, DIALOG_STYLE_TABLIST_HEADERS, "MP3 Player", gString, "Ok", "Close");
	return true;
}	

YCMD:carradio(playerid, params[], help) {
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) 
		return true;
	
	new szDialog2[1024];
	gString[0] = EOS;
	strcat(szDialog2, "Nume\tAscultatori\n");
	for(new i = 0; i < sizeof(RadioNames); i++) {
		if(i == 0) format(gString, sizeof(gString), "%s\n", RadioNames[i]);
		else format(gString, sizeof(gString), "%s\t%d\n", RadioNames[i], ListenThisRadio(i));
		strcat(szDialog2, gString);
	}
	ShowPlayerDialog(playerid, DIALOG_CARRADIO, DIALOG_STYLE_TABLIST_HEADERS, "Car Radio:", szDialog2, "Select", "Close");
	return true;
}

YCMD:pcolor(playerid, params[], help) {
	if(!PlayerInfo[playerid][pPremiumAccount]) 
		return SCM(playerid, COLOR_GREY, "Nu ai cont premium.");

	ShowPlayerDialog(playerid, DIALOG_PCOLOR, DIALOG_STYLE_LIST, "Nickname color", 
		"{CECECE}White\n{0087FE}Blue\n{4700C2}Dark purple\n{EBFF00}Yellow\n{EF00FF}Purple\n{40FF00}Green\n{9CFF29}Lime green\n{0E7F03}Dark green\n{FF9A00}Orange\n{6E6E6E}Black\n{FF4C9D}Pink\n{F4FA58}Yellow 2\n{00BFFF}Blue 2\n{819FF7}Blue 3\n{FE9A2E}Orange 2\n{FA8258}Orange 3\n{00FF40}Green 2\n{D358F7}Purple 2\n{4169E1}Royan Blue\n{9ACD32}YellowGreen\n{F0E68C}Khaki\n{BDB76B}Dark\n{FF1493}Pink\n{9966CC}Amethyst\n{F0B2B2}Pink-Orange\n{DB7093}Violet-Red", "Choose", "Cancel");
	return true;
}

YCMD:pc(playerid, params[], help) {
	if(GetCoolDowns(playerid, 9)) return CoolDowns(playerid, 9);

	if(!PlayerInfo[playerid][pPremiumAccount])
		return SCM(playerid, COLOR_GREY, "Nu ai premium account.");

	if(!PlayerInfo[playerid][pTog][0])
		return SCM(playerid, COLOR_GREY, "Ai premium chat-ul dezactivat (/tog).");

	if(CheckMute(playerid)) return ShowMute(playerid);

	new text[64];
	if(sscanf(params, "s[64]", text))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/pc [text]");
	
	if checkReclame(playerid, text) *then return true;
    SetCoolDowns(playerid, 9, 5);
	gString[0] = EOS;
	foreach(new i : PlayerPremium) {
		if(!PlayerInfo[i][pTog][0]) continue;
		
		format(gString, sizeof(gString), "{9741E7}[PREMIUM] {AC58FA}%s: %s", PlayerInfo[playerid][pName], text);
		SCM(i, 0xAC58FAFF, gString);
	}
	return true;
}

YCMD:vc(playerid, params[], help) {
	if(GetCoolDowns(playerid, 10)) return CoolDowns(playerid, 10);

	if(!PlayerInfo[playerid][pVip])
		return SCM(playerid, COLOR_GREY, "Nu ai VIP Account.");

	if(!PlayerInfo[playerid][pTog][1])
		return SCM(playerid, COLOR_GREY, "Ai vip chat-ul dezactivat (/tog).");

	if(CheckMute(playerid)) return ShowMute(playerid);

	new text[64];
	if(sscanf(params, "s[64]", text))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/vc [text]");
	
	if checkReclame(playerid, text) *then return true;
	SetCoolDowns(playerid, 10, 10);
	gString[0] = EOS;
	foreach(new i : PlayerVIP) {
		if(!PlayerInfo[i][pTog][1]) continue;
		
		format(gString, sizeof(gString), "VIP %s: %s", PlayerInfo[playerid][pName], text);
		SCM(i, 0x3D80E6FF, gString);
	}
	return true;
}

YCMD:contract(playerid, params[], help) {
	if(GetCoolDowns(playerid, 11)) return CoolDowns(playerid, 11);

	if(PlayerInfo[playerid][pMember] == 9)
		return true;

	if(sscanf(params, "ui", params[0], params[1]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/contract [playerid/name] [price]");

	if(!IsPlayerConnected(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not connected.");

	if(!IsPlayerLogged(params[0]))
		return SCM(playerid, COLOR_GREY, "Player not logged.");

	if(params[1] < 1000 || params[1] > 50000)
		return SCM(playerid, COLOR_GREY, "Invalid money ($1.000 - $50.000)");

	if(GetPlayerCash(playerid) < params[1])
		return SCM(playerid, COLOR_GREY, "Nu ai aceasta suma de bani.");

	if(playerid == params[0])
		return SCM(playerid, COLOR_GREY, "Nu poti pune un contract pe tine.");

	if(PlayerInfo[params[0]][pMember] == 9)
		return SCM(playerid, COLOR_GREY, "Nu poti pune un contract pe un memberu din hitman.");

	if(IsAdmin(params[0], 1))
		return SCM(playerid, COLOR_GREY, "Nu poti pune un contract pe un admin.");

	CheckPlayerMission(playerid, 7, 1);
	checkBP(playerid, 20, 150);

	GivePlayerCash(playerid, -params[1]);
	SetCoolDowns(playerid, 11, 30);
	PlayerVar[params[0]][BodyMoney] = PlayerVar[params[0]][BodyMoney] != 0 ? PlayerVar[params[0]][BodyMoney] + params[1] : params[1];
	Iter_Add(Calls[8], params[0]);

	gString[0] = EOS;
	format(gString, 100, "Ai pus un contract pe %s pentru suma de $%s.", GetName(params[0]), FormatNumber(params[1]));
	SCM(playerid, COLOR_WHITE, gString);
	format(gString, 100, "# Un nou contract este disponibil pentru suma de $%s.", FormatNumber(params[1]));
	SendFactionMessage(9, COLOR_LIGHTBLUE, gString);
	return true;
}

YCMD:ph(playerid, params[], help) {
	if(!IsPlayerInAnyVehicle(playerid)) 
		return true;

	if(GetCoolDowns(playerid, 27))
		return CoolDowns(playerid, 27);

	if(!IsABike2(GetPlayerVehicleID(playerid))) 
		return SCM(playerid, COLOR_GREY, "Nu iti poti pune casca in acest vehicul!");

	SetCoolDowns(playerid, 27, 5);

	if(Helmet[playerid]) RemovePlayerAttachedObject(playerid, 3);
	else SetPlayerAttachedObject(playerid, 3, 18645, 2, 0.101, -0.0, 0.0, 5.50, 84.60, 83.7, 1, 1, 1);
	gString[0] = EOS;
	format(gString, 125, "* %s %s", GetName(playerid), Helmet[playerid] ? ("si-a scos casca de pe cap.") : ("si-a pus casca pe cap."));
	ProxDetector(30.0, playerid, gString, COLOR_PURPLE);
	Helmet[playerid] = !Helmet[playerid];
	return true;
}

YCMD:exam(playerid, params[], help) {
	if(PlayerInfo[playerid][pDriveLicense] > gettime())
		return SCM(playerid, COLOR_GREY, "Ai deja licenta de condus.");

	if(PlayerInfo[playerid][pDrvingSuspend] > gettime() && PlayerInfo[playerid][pDrvingSuspend] != -1) {
		gString[0] = EOS;
		format(gString, 60, "Ai licenta suspendata pentru %d ore.", ((PlayerInfo[playerid][pDrvingSuspend] - gettime())/3600) + 1);
		SCM(playerid, COLOR_GREY, gString);
		return true;
	}

	if(!PlayerToPoint(playerid, 2, 2303.5789,-68.6851,26.4844))
		return SCM(playerid,COLOR_GREY, "Nu te afli la dmv [/gps > DMV]");

	if(IsPlayerInAnyVehicle(playerid))
		return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta comanda dintr-o masina.");

	if(PlayerVar[playerid][IsExam])
		return SCM(playerid, COLOR_GREY, "Esti deja in exam.");

	PlayerVar[playerid][IsExam] = true;
	CPEx[playerid] = 0;
	PlayerVar[playerid][ExamCar] = CreateVehicleEx(589, 2296.1770,-90.7103,25.9940,358.6888, 62, 62, -1, 0);
	examobj[playerid] = CreateDynamicObject(19309,0,0,0,0,0,0);
	SetDynamicObjectMaterialText(examobj[playerid], 0, "DMV", 50, "Arial", 27, 1, COLOR_WHITE, 0xFF000000, 1);
	AttachDynamicObjectToVehicle(examobj[playerid], PlayerVar[playerid][ExamCar], -0.004999, -0.829999, 1.164999, 0.000000, 0.000000, 0.000000);
	SetVehicleVirtualWorld(PlayerVar[playerid][ExamCar], GetPlayerVirtualWorld(playerid));
	SetVehicleNumberPlate(PlayerVar[playerid][ExamCar], "{FF0000}DMV");
	PutPlayerInVehicle(playerid, PlayerVar[playerid][ExamCar], 0);
	new engine, lights, alarm, doors, bonnet, boot, objective;
	GetVehicleParamsEx(PlayerVar[playerid][ExamCar], engine, lights, alarm, doors, bonnet, boot, objective);
	SetVehicleParamsExx(PlayerVar[playerid][ExamCar], engine, lights, alarm, true, bonnet, boot, objective);
	Fuel[PlayerVar[playerid][ExamCar]] = 100;
	SCM(playerid, COLOR_WHITE, "You started the dmv test. To start the engine use [/engine] or press the 2 key.");
	SetExamCheckpoint(playerid);
	return true;
}


YCMD:pay(playerid, params[], help) {
	if(PlayerInfo[playerid][pLevel] < 3)
		return SCM(playerid, COLOR_GREY, "Ai nevoie de level 3.");

	if(GetCoolDowns(playerid, 1)) 
		return CoolDowns(playerid, 1);

	new id, money;
	if(sscanf(params, "ui", id, money))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/pay [playerid/name] [amount]");

	if(money < 20 || money > (PlayerInfo[playerid][pVip]?20000:10000))
		return SCM(playerid, COLOR_GREY, PlayerInfo[playerid][pVip]?"Invalid Amount ($20 - $20,000)":"Invalid Amount ($20 - $10,000)");

	if(playerid == id)
		return SCM(playerid, COLOR_GREY, "You can't report it yourself.");

	if(!IsPlayerConnected(id))
		return SCM(playerid, COLOR_GREY, "Not player connected.");

	if(!PlayerOfRangeToPlayer(playerid, 5, id))
		return SCM(playerid, COLOR_GREY, "Nu esti langa acel player.");

	if(GetPlayerCash(playerid) < money)
		return SCM(playerid, COLOR_GREY, "Nu ai aceasta suma de bani.");


	SetCoolDowns(playerid, 1, 29);
	checkBP(playerid, 21, 150);

	PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	PlayerPlaySound(id, 1052, 0.0, 0.0, 0.0);

	GivePlayerCash(playerid, -money);
	GivePlayerCash(id, money);

	gString[0] = EOS;
	format(gString, sizeof(gString), "* %s removes some money from his pocket and hands it to %s.", GetName(playerid), GetName(id));
	ProxDetector(30.0, playerid, gString, COLOR_PURPLE);
	format(gString, sizeof(gString), "You sent %s the sum of $%s.", GetName(id), FormatNumber(money));
	SCM(playerid, COLOR_WHITE, gString);
	format(gString, sizeof(gString), "You received $%s from %s,", FormatNumber(money), GetName(playerid));
	SCM(id, COLOR_WHITE, gString);
	return true;
}

cmd:repair(playerid) {
	if(!PlayerInfo[playerid][pVip])
		return SCM(playerid, COLOR_LGREEN, "Eroare: Nu ai VIP Account!");

	new vehicleid=GetPlayerVehicleID(playerid);
	if(!vehicleid) 
		return SCM(playerid, COLOR_LGREEN, "Eroare: Nu esti intr-un vehicul!");

	if(GetCoolDowns(playerid, 30)) 
		return CoolDowns(playerid, 30);

	new Float:health;
	GetVehicleHealth(vehicleid, health);
	if(health > 900)
		return SCM(playerid, COLOR_LGREEN, "Eroare: Vehiculul tau este deja in stare buna!");

	SetVehicleHealth(vehicleid, 999.0);
	RepairVehicle(vehicleid);
	SCM(playerid, COLOR_LGREEN, "* (/repair) Ti-ai reparat masina cu success!");
	SetCoolDowns(playerid, 30, 30 * 60);
	return true;
}

cmd:skemahpq(playerid, params[]) {
	if(sscanf(params, "u", params[0])) return SCM(playerid, COLOR_GREY, "sytnax: sdkeagh [para/nam,e]");
	new Float:x,Float:y,Float:z;
	GetPlayerPos(params[0],x,y,z);
	new Float:pos[3];
	GetPlayerVelocity(params[0], pos[0], pos[1], pos[2]);
	SCMf(playerid, -1, "%f %f %f %f %f %f", x,y,z, pos[0], pos[1], pos[2]);
	printf("%s: %f %f %f %f %f %f", GetName(params[0]), x,y,z, pos[0], pos[1], pos[2]);
	return true;
}

YCMD:nos(playerid, params[], help) {
	if(PlayerInfo[playerid][pAdmin] < 2 && !PlayerInfo[playerid][pVip])
		return true;

	if(!GetPlayerVehicleID(playerid)) return SCM(playerid, COLOR_LGREEN, "Eroare: Nu esti intr-o masina!");

	if(GetCoolDowns(playerid, 31) && PlayerInfo[playerid][pAdmin] < 1)
		return CoolDowns(playerid, 31);

    AddVehicleComponent(GetPlayerVehicleID(playerid), 1010);
    SCM(playerid, COLOR_WHITE, "* (/nos) Ti-ai adaugat cu success nos pe masina!");
    SetCoolDowns(playerid, 31, 10 * 60);
	return true;
}

YCMD:sett(playerid, params[], help) {
	if(!PlayerInfo[playerid][pVip])
		return SCM(playerid, COLOR_GREY, "You not a VIP user.");

	new time;
	if(sscanf(params, "i", time))
		return true;

	SetPlayerTime(playerid, time, 0);
	return true;
}

YCMD:setw(playerid, params[], help) {
	if(!PlayerInfo[playerid][pVip])
		return SCM(playerid, COLOR_GREY, "You not a VIP user.");

	new weather;
	if(sscanf(params, "i", weather))
		return true;

	SetPlayerWeather(playerid, weather);
	return true;
}

YCMD:n(playerid, params[], help) {
	if(IsAdmin(playerid, 1) || IsHelper(playerid, 1))
		return SCM(playerid, COLOR_GREY, "You have admin/helper.");

	if(GetCoolDowns(playerid, 4)) 
		return CoolDowns(playerid, 4);

	new text[128];
	if(sscanf(params, "s[128]", text))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/newbie [text]");

	SCM(playerid, COLOR_YELLOW, "Intrebarea a fost trimisa cu succes!");
	format(gString, 165, "* Newbie %s: %s", GetName(playerid), text);
	SCM(playerid, COLOR_LGREEN, gString);
	format(PlayerVar[playerid][NewbieText], 128, text);
	Iter_Add(Newbie, playerid);

	SetCoolDowns(playerid, 4, 119);
	return true;
}

new TogName[][] = {
	{"Premim Chat"},
	{"Vip Chat"},
	{"Faction Chat"},
	{"Admin Chat"},
	{"Helper Chat"},
	{"Clan Chat"},
	{"Rainbow"},
	{"OOC"},
	{"Kill List"}
};

YCMD:help(playerid, params[], help) return ShowPlayerDialog(playerid, DIALOG_HELP, DIALOG_STYLE_LIST, "Help", "Account\nGeneral\nChat\nBank\nVehicles\nHouses\nBusiness\nFaction\nPhone\nJobs\nClan", "Select", "Close");

YCMD:tog(playerid, params[], help) {
 	new x[50];
 	gString[0] = EOS;
 	strcat(gString, "Name\tStatus\n");
	for(new i = 0; i < sizeof(TogName); i++) {
		format(x, sizeof(x), "%s\t%s\n", TogName[i], PlayerInfo[playerid][pTog][i] ? ("{00FF00}Enabled") : ("Disable"));
		strcat(gString, x);
	}
	ShowPlayerDialog(playerid, DIALOG_TOG, DIALOG_STYLE_TABLIST_HEADERS, "Tog:", gString, "Select", "Close");
	return true;
}

YCMD:exit(playerid, params[], help) return ExitFunction(playerid);

YCMD:buydildo(playerid, params[], help) {
	if(!GetPlayerBizzType(playerid, BIZ_SEXSHOP)) 
		return SCM(playerid,-1, "You're not in the place where you can get dildo.");

	ShowPlayerDialog(playerid, DIALOG_BUYDILDO, DIALOG_STYLE_TABLIST_HEADERS, "Buy dildo:", "Type\tPrice\nDouble-ended Dildo\t$500\nDildo\t$500\nVibrator\t$500\nSilver Vibrator\t$500\nFlowers\t$1,000", "Select", "Close");
	return true;
}

new HudName[][] = {
	{"FPS"},
	{"job goal"},
	{"DMG Informer"}
};

YCMD:hud(playerid, params[], help) {
 	new x[50];
 	gString[0] = EOS;
 	strcat(gString, "Name\tStatus\n");
	for(new i = 0; i < sizeof(HudName); i++) {
		format(x, sizeof(x), "%s\t%s\n", HudName[i], PlayerInfo[playerid][pHud][i] ? ("{00FF00}Enabled") : ("Disable"));
		strcat(gString, x);
	}
	ShowPlayerDialog(playerid, DIALOG_SHOW, DIALOG_STYLE_TABLIST_HEADERS, "HUD Show:", gString, "Select", "Close");
	return true;
}

YCMD:refill(playerid, params[], help) {
	if(!IsPlayerInAnyVehicle(playerid)) return true;
	if(IsABike(GetPlayerVehicleID(playerid))) return true;
	foreach(new x : BizzType[9]) {
		if(PlayerToPoint(playerid, 15, BizzInfo[x][bEnterPos][0], BizzInfo[x][bEnterPos][1], BizzInfo[x][bEnterPos][2])) {
			if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
				new vehicleid = GetPlayerVehicleID(playerid);
				if(Engine[vehicleid]) return SCM(playerid, COLOR_GREY, "Opreste motorul.");
				if(Fuel[vehicleid] > 79) return SCM(playerid, COLOR_GREY, "Rezervorul este deja plin!");
				if(PlayerVar[playerid][Refill]) return SCM(playerid, COLOR_GREY, "Faci deja refill.");
				GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~Refill the vehicle~n~~w~~h~Waiting...", 2000, 3);
				PlayerVar[playerid][Refill] = true;
				SetTimerEx("RefillVehicle", 2000, false, "ii", playerid, x);
				return true;
			} 
		}
	}
	SCM(playerid, COLOR_GREY, "Nu te afli la o benzinerie.");
	return true;
}

function RefillVehicle(playerid, x) {
	if(!IsPlayerInAnyVehicle(playerid)) return true;
	PlayerVar[playerid][Refill] = false;
	new money, vehicleid = GetPlayerVehicleID(playerid);
	money = 100-Fuel[vehicleid];
	Fuel[vehicleid] = 100;
	GivePlayerCash(playerid, -money*36);
	BizzInfo[x][bBalance] += money*36;
	format(gString, 128, "Fuel %d", Fuel[vehicleid]);
	PlayerTextDrawSetString(playerid, SpeedometerPTD[playerid][0], gString);
	PlayerTextDrawTextSize(playerid, SpeedometerPTD[playerid][6], percentage(Fuel[vehicleid], 100.0) * 0.57, 3.0000);
	PlayerTextDrawShow(playerid, SpeedometerPTD[playerid][6]);
	gString[0] = EOS;
	format(gString, sizeof(gString), "Ai facut refill si ai platit $%s pentru %d litri.", FormatNumber(money*36), money);
	SCM(playerid, COLOR_MONEY, gString);
	return true;
}

YCMD:window(playerid, params[], help) {
	if(!IsPlayerInAnyVehicle(playerid))
		return SCM(playerid, COLOR_GREY, "You is not any vehicle.");

	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
		return SCM(playerid, COLOR_GREY, "You not drive a vehicle.");

	if(sscanf(params, "ii", params[0], params[1]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/window [window 1 - 4] [0 - open | 1 - locked]");

	if(params[0] < 1 || params[0] > 4)
		return SCM(playerid, COLOR_GREY, "Windows invalid.");

	if(params[1] < 0 || params[1] > 1)
		return SCM(playerid, COLOR_GREY, "Invalid Value.");

	new driver, passenger, backleft, backright;
	GetVehicleParamsCarWindows(GetPlayerVehicleID(playerid), driver, passenger, backleft, backright);
	SetVehicleParamsCarWindows(GetPlayerVehicleID(playerid), params[0] == 1 ? params[1] : driver, params[0] == 2 ? params[1] : passenger, params[0] == 3 ? params[1] : backleft, params[0] == 4 ? params[1] : backright);
	return true;
}

YCMD:dice(playerid, params[], help) {
	if(!PlayerToPoint(playerid, 50, 1976.4832,1017.9061,994.4688)) return true;

	new id, amount;
	if(sscanf(params, "ui", id, amount))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/dice [playerd/name] [amount]");

	if(playerid == id) 
		return true;

	if(!IsPlayerConnected(id))
		return true;

	if(!PlayerOfRangeToPlayer(playerid, 5, id))
		return SCM(playerid, COLOR_GREY, "Acel player nu este langa tine.");

	if(PlayerVar[playerid][InviteDice] == id)
		return SCM(playerid, COLOR_GREY, "I-ai mai trimis o invitatie la acel player.");

	if(amount < 100 || amount > 1000000)
		return SCM(playerid, COLOR_GREY, "Invalid amount ($100 - $1,000,000)");

	if(GetPlayerCash(playerid) < amount)
		return SCM(playerid, COLOR_GREY, "Nu ai aceasta suma de bani.");

	if(GetPlayerCash(id) < amount)
		return SCM(playerid, COLOR_GREY, "Acel player nu are acesti bani.");

	PlayerVar[playerid][InviteDice] = id;
	PlayerVar[playerid][DiceMoney] = amount;

	gString[0] = EOS;
	format(gString, sizeof(gString), "I-ai trimis o invitatie lui %s.", GetName(id));
	SCM(playerid, COLOR_WHITE, gString);
	format(gString, sizeof(gString), "(Dice Invitation) %s te-a invitat [/accept dice %d]. Parize: $%s", GetName(playerid), playerid, FormatNumber(amount));
	SCM(id, COLOR_PINK, gString);
	return true;
}


YCMD:accept(playerid, params[], help) {
	new type[20], id;
	if(sscanf(params, "s[20]u", type, id)) {
		SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/accept [type] [playerid/name]");
		SCM(playerid, COLOR_GREY, "Type: {FFFFFF}dice, free, key, ticket, invite, lesson, license, cinvite");
		return true;
	}
	if(!IsPlayerConnected(id)) return true;

	gString[0] = EOS;
	switch YHash(type)
	do {
		case _H<dice>: {
			if(PlayerVar[id][InviteDice] != playerid) 
				return SCM(playerid, COLOR_GREY, "Acel player nu te-a invitat.");

			if(!PlayerOfRangeToPlayer(playerid, 5, id)) 
				return SCM(playerid, COLOR_GREY, "Nu te afli langa acel player.");

			if(GetPlayerCash(playerid) < PlayerVar[id][DiceMoney])
				return SCM(playerid, COLOR_GREY, "Nu ai aceasta suma de bani");

			if(GetPlayerCash(id) < PlayerVar[id][DiceMoney])
				return SCM(playerid, COLOR_GREY, "Acel player nu are aceasta suma de bani.");

			new dice1 = RandomEx(1, 12), dice2 = RandomEx(1, 12);
			gString[0] = EOS;
			if(dice1 > dice2) {
				format(gString, sizeof(gString), "%s rolls %d. %s rolls %d. %s won $%s.", GetName(id), dice1, GetName(playerid), dice2, GetName(id), FormatNumber(PlayerVar[id][DiceMoney]));
				ProxDetector(30.0, playerid, gString, COLOR_PURPLE);
				format(gString, sizeof(gString),"(+) Ai castigat $%s.", FormatNumber(PlayerVar[id][DiceMoney]));
				SCM(id, COLOR_MONEY, gString);
				format(gString, sizeof(gString),"(-) Ai pierdut $%s.", FormatNumber(PlayerVar[id][DiceMoney]));
				SCM(playerid, COLOR_MONEY, gString);

				GivePlayerCash(playerid, -PlayerVar[id][DiceMoney]);
				GivePlayerCash(id, PlayerVar[id][DiceMoney]);

				checkBP(id, 1, 100); 
				PlayerVar[id][InviteDice] = -1;
				return true;
			}
			if(dice1 < dice2) {
				format(gString, sizeof(gString), "%s rolls %d. %s rolls %d. %s won $%s.", GetName(playerid), dice2, GetName(id), dice1, GetName(playerid), FormatNumber(PlayerVar[id][DiceMoney]));
				ProxDetector(30.0, playerid, gString, COLOR_PURPLE);
				format(gString, sizeof(gString),"(+) Ai castigat $%s.", FormatNumber(PlayerVar[id][DiceMoney]));
				SCM(playerid, COLOR_MONEY, gString);
				format(gString, sizeof(gString),"(-) Ai pierdut $%s.", FormatNumber(PlayerVar[id][DiceMoney]));
				SCM(id, COLOR_MONEY, gString);

				GivePlayerCash(playerid, PlayerVar[id][DiceMoney]);
				GivePlayerCash(id, -PlayerVar[id][DiceMoney]);
				checkBP(playerid, 1, 100);
				PlayerVar[id][InviteDice] = -1;
				return true;
			}
			if(dice1 == dice2) {
				SCM(playerid, COLOR_MONEY, "Egal.");
				SCM(id, COLOR_MONEY, "Egal.");
				PlayerVar[id][InviteDice] = -1;
				return true;
			}
		}
		case _H<gun>: {
			if(gunOferID[playerid] != id) 
				return SCM(playerid,-1, "Acel player nu ti-a oferit o arma.");

			if(GetPlayerCash(playerid) < sellGunPrice[playerid]) 
				return SCM(playerid,COLOR_GREY, "Nu ai banii necesari.");

			switch(sellGunID[id]) {
				case 0: {
					if(PlayerInfo[id][pMats] < 100)
						return SCM(playerid, COLOR_WHITE, "Nu ai destule materiale!");

					GivePlayerWeapon(playerid, 23, 100);
					PlayerInfo[id][pMats] -= 100;
				}
				case 1: {
					if(PlayerInfo[id][pMats] < 150)
						return SCM(playerid, COLOR_WHITE, "Nu ai destule materiale!");

					GivePlayerWeapon(playerid, 24, 100);
					PlayerInfo[id][pMats] -= 150;
				}
				case 2: {
					if(PlayerInfo[id][pMats] < 200)
						return SCM(playerid, COLOR_WHITE, "Nu ai destule materiale!");

					GivePlayerWeapon(playerid, 29, 150);
					PlayerInfo[id][pMats] -= 200;
				}
				case 3: {
					if(PlayerInfo[id][pMats] < 300)
						return SCM(playerid, COLOR_WHITE, "Nu ai destule materiale!");

					GivePlayerWeapon(playerid, 25, 50);
					PlayerInfo[id][pMats] -= 300;
				}
				case 4: {
					if(PlayerInfo[id][pMats] < 350)
						return SCM(playerid, COLOR_WHITE, "Nu ai destule materiale!");

					GivePlayerWeapon(playerid, 30, 150);
					PlayerInfo[id][pMats] -= 350;
				}
				case 5: {
					if(PlayerInfo[id][pMats] < 400)
						return SCM(playerid, COLOR_WHITE, "Nu ai destule materiale!");

					GivePlayerWeapon(playerid, 31, 150);
					PlayerInfo[id][pMats] -= 400;
				}
				case 6: {
					if(PlayerInfo[id][pMats] < 600)
						return SCM(playerid, COLOR_WHITE, "Nu ai destule materiale!");

					GivePlayerWeapon(playerid, 33, 25);
					PlayerInfo[id][pMats] -= 600;
				}
			}
			GivePlayerCash(playerid, -sellGunPrice[id]);
			GivePlayerCash(id, sellGunPrice[id]);
			UpdateVar(id, "Mats", PlayerInfo[id][pMats]);
			new gunname[40];
			GetWeaponName(GetPlayerWeapon(playerid), gunname, sizeof gunname);
			SCMf(id, -1, "I-ai dat lui %s, un %s.", GetName(playerid),gunname);
			SCMf(playerid, -1, "Ai primit un %s pentru %s.", gunname, GetName(id));
			format(gString, 128, "* %s a creat o arma si i-a dat-o lui %s.", GetName(id), GetName(playerid));
			ProxDetector(30.0, playerid, gString, COLOR_PURPLE);
			gunOferID[playerid] = -1;
			gunOferID[id] = -1;
		}
		case _H<drugs>: {
			if(DrugOffer[playerid] == -1) return true;
			if(PlayerInfo[playerid][pPlaying] < 5 * 3600) return SCM(playerid, -1, "Ai nevoie de minim 5 ore pentru a putea cumpara droguri.");
			if(DrugOffer[playerid] != id) return SCM(playerid, -1, "This player has not offered you drugs.");
			if(GetPlayerCash(playerid) < DrugPrice[playerid]) return SCM(playerid, -1, "Nu ai bani.");
			if(!IsPlayerConnected(id)) return SCM(playerid, -1, "Acel player nu este conectat.");
			if(PlayerInfo[playerid][pDrugs] > 100) return SCM(playerid, -1, "You are fully loaded with drugs, use them first.");
			gString[0] = (EOS);
			format(gString, 128, "You bought %d gram for $%d from Drug Dealer %s.", DrugGram[playerid], DrugPrice[playerid], GetName(id));
			SCM(playerid, COLOR_YELLOW, gString);
			format(gString, 128, "%s has bought your %d gram, the $%d was added to your PayCheck.", GetName(playerid), DrugGram[playerid], DrugPrice[playerid]);
			SCM(id, COLOR_YELLOW, gString);
			GivePlayerCash(id, DrugPrice[playerid]); GivePlayerCash(playerid, -DrugPrice[playerid]);
			PlayerInfo[playerid][pDrugs] += DrugGram[playerid]; PlayerInfo[id][pDrugs] -= DrugGram[playerid];
			UpdateVar(id, "Drugs", PlayerInfo[id][pDrugs]); UpdateVar(playerid, "Drugs", PlayerInfo[playerid][pDrugs]); 
		    DrugOffer[playerid] = -1; DrugPrice[playerid] = 0; DrugGram[playerid] = 0;
		}
		case _H<mats>: {
			if(MatsOffer[playerid]!=id) return true;
			PlayerInfo[playerid][pMats] += MatsAmmo[id];
			PlayerInfo[id][pMats] -= MatsAmmo[id];
			GivePlayerCash(playerid, -MatsPrice[playerid]);
			GivePlayerCash(id, MatsPrice[id]);
			MatsOffer[playerid] = -1;
			SCMf(playerid, -1, "You have recveid %d materials from player %s.", MatsAmmo[id], GetName(id));
			SCM(playerid, -1, "Ai vandut materialele cu success.");
			UpdateVar(playerid, "Materials", PlayerInfo[playerid][pMats]); UpdateVar(id, "Materials", PlayerInfo[id][pMats]);
		}
		case _H<live>: {
			if(LiveOffer[id] != playerid) 
				return SCM(playerid,COLOR_WHITE, "This player has not offered you live.");
			
			if(!PlayerOfRangeToPlayer(playerid, 5.0, id)) 
				return SCM(playerid, -1, "Acel player nu este langa tine.");

			if(!IsPlayerInAnyVehicle(id) && ServerVehicle[GetPlayerVehicleID(id)][vFaction] != 11)
				return SCM(playerid, COLOR_GREY, "Player-ul care te-a inivtat la live nu este in masina factiuni.");

			if(!IsPlayerInAnyVehicle(playerid) && ServerVehicle[GetPlayerVehicleID(playerid)][vFaction] != 11)
				return SCM(playerid, COLOR_GREY, "Trebuie sa fi in vehiculul factiuni.");

			format(gString, 75, "* %s ti-a acceptat cererea de live.", GetName(playerid));
			SCM(id, COLOR_LIGHTBLUE, gString);
			SCM(playerid, COLOR_YELLOW, "Live-ul a inceput.");

			SCM(playerid, COLOR_WHITE, "* Ai primit freeze pana la terminarea live-ului!");
			SCM(LiveOffer[playerid], COLOR_WHITE, "* Ai primit freeze pana la terminarea live-ului! Pentru a opri live-ul, foloseste comanda (/live) iar.");
			TogglePlayerControllable(playerid, false);
			TogglePlayerControllable(LiveOffer[playerid], false);
			NewLive[playerid] = id;
			NewLive[id] = playerid;
			LiveOffer[id] = -1;
		}
		case _H<ticket>: {
			if(PlayerVar[playerid][TicketOffer] == -1) 
				return SCM(playerid, COLOR_GREY, "Nu ai primit o oferta!");
			
			if(PlayerVar[playerid][TicketOffer] != id) 
				return SCM(playerid,-1, "Acel player nu ti-a oferit ticket.");

			if(!PlayerOfRangeToPlayer(playerid, 8, id)) 
				return SCM(playerid, -1, "Acel player nu este langa tine.");

			if(GetPlayerCash(playerid) < PlayerVar[playerid][TicketMoney]) 
				return SCM(playerid, COLOR_LIGHTBLUE, "* Nu ai enough money.");

			gString[0] = EOS;
			format(gString, 100, "* Ai platit amenda de $%d lui %s.", PlayerVar[playerid][TicketMoney], GetName(PlayerVar[playerid][TicketOffer]));
			SCM(playerid, COLOR_MONEY, gString);
			format(gString, 100, "* %s a platit amenda in valoare de $%d.", GetName(playerid), PlayerVar[playerid][TicketMoney]);
			SCM(PlayerVar[playerid][TicketOffer], COLOR_MONEY, gString);
			AddFactionRaport(id, 1, 1);
			GivePlayerCash(playerid, -PlayerVar[playerid][TicketMoney]);
			GivePlayerCash(id, PlayerVar[playerid][TicketMoney]);
			PlayerVar[playerid][TicketOffer] = -1;
			PlayerVar[playerid][TicketMoney] = -1;
		}
		case _H<trade>: {
			if(PlayerVar[playerid][TradeInvite] != id) 
				return SCM(playerid, -1, "Acel player nu ti-a facut o oferta.");
			
			if(GetPlayerInterior(playerid) != 0 || IsPlayerInAnyVehicle(playerid) || PlayerVar[playerid][IsBizz] != 0) 
				return SCM(playerid, COLOR_LGREEN, "Nu poti face o afacere dintr-un interior sau vehicul!");
			
			if(GetPlayerInterior(id) != 0 || IsPlayerInAnyVehicle(id)) 
				return SCM(playerid, COLOR_LGREEN, "Nu poti face o afacere cu cineva ce se afla intr-un interior sau vehicul!");
			
			if(PlayerVar[playerid][IsTrade] != -1) 
				return SCM(playerid, COLOR_WHITE, "Esti deja intr-o afacere!");

			if(PlayerVar[id][IsTrade] != -1) 
				return SCM(playerid, COLOR_WHITE, "Acel player este deja intr-o afacere!");		

			if(player_selected[id] != 0)
				return SCM(playerid, COLOR_GREY, "Acel player este intr-o actiune.");

			if(player_selected[playerid] != 0)
				return true;

			PlayerVar[playerid][TradeInvite] = -1;
			
			ClearString();

			player_selected[playerid] = 4;
			player_selected[id] = 4;
			
			PlayerVar[playerid][TradeItems] = 0;
			PlayerVar[id][TradeItems] = 0;
			PlayerVar[playerid][TradeReady] = false;
			PlayerVar[id][TradeReady] = false;
			PlayerVar[playerid][IsTrade] = id;
			PlayerVar[id][IsTrade] = playerid;

			PlayerVar[id][TradeType] = false;
			PlayerVar[playerid][TradeType] = true;

			format(gString, 70, "%s (%d) a acceptat invitatia ta!", GetName(playerid), playerid);
			SCM(id, COLOR_LIGHTBLUE, gString);	
			format(gString, 70, "Ai acceptat invitatia lui %s (%d)!", GetName(id), id);
			SCM(playerid, COLOR_LIGHTBLUE, gString);
		
			ShowTradeTDs(id);
			ShowTradeTDs(playerid);
		
			format(gString, 50, "Bunurile lui %s", GetName(id));
			PlayerTextDrawSetString(playerid, TradePTD[playerid][0], gString);
			PlayerTextDrawSetString(id, TradePTD[id][0], "Bunurile tale");
			PlayerTextDrawSetString(playerid, TradePTD[playerid][1], "Bunurile tale");
			format(gString, 50, "Bunurile lui %s", GetName(playerid));
			PlayerTextDrawSetString(id, TradePTD[id][1], gString);

			TextDrawHideForPlayer(id, TradeTD[9]);
			TextDrawHideForPlayer(id, TradeTD[10]);
			PlayerTextDrawHide(playerid, TradePTD[playerid][2]);
			PlayerTextDrawHide(playerid, TradePTD[playerid][3]);
		}
		case _H<license>: {
			if(PlayerVar[id][OferLicense] != playerid)
				return SCM(playerid, COLOR_GREY, "Acel player nu ti-a oferit o licenta.");

			gString[0] = EOS;
			switch(PlayerVar[playerid][TypeLicense]) {
				case 1: {
					if(PlayerInfo[playerid][pFlyLicense] > gettime())
						return SCM(playerid, COLOR_LGREEN, "Ai deja aceasta licenta.");

					PlayerInfo[playerid][pFlyLicense] = gettime() + (86400*30);
					UpdateVar(playerid, "FlyLicense", PlayerInfo[playerid][pFlyLicense]);
					SCM(playerid, COLOR_LIGHTBLUE, "Ai primit licenta de fly pentru 30 de zile.");
					format(gString, 150, "**(( SI Dispatch: %s (%d) i-a oferit licenta de zbor lui %s (%d). ))**", GetName(id), id, GetName(playerid), playerid);
					SendFactionMessage(PlayerInfo[id][pMember], COLOR_LIGHTBLUE, gString);
				}
				case 2: {
					if(PlayerInfo[playerid][pWeaponLicense] > gettime())
						return SCM(playerid, COLOR_LGREEN, "Ai deja aceasta licenta.");

					PlayerInfo[playerid][pWeaponLicense] = gettime() + (86400*30);
					UpdateVar(playerid, "WeaponLicense", PlayerInfo[playerid][pWeaponLicense]);
					SCM(playerid, COLOR_LIGHTBLUE, "Ai primit licenta de arme pentru 30 de zile.");
					format(gString, 150, "**(( SI Dispatch: %s (%d) i-a oferit licenta de arma lui %s (%d). ))**", GetName(id), id, GetName(playerid), playerid);
					SendFactionMessage(PlayerInfo[id][pMember], COLOR_LIGHTBLUE, gString);
				}                     
				case 3: {
					if(PlayerInfo[playerid][pBoatLicense] > gettime())
						return SCM(playerid, COLOR_LGREEN, "Ai deja aceasta licenta.");

					PlayerInfo[playerid][pBoatLicense] = gettime() + (86400*30);
					UpdateVar(playerid, "BoatLicense", PlayerInfo[playerid][pBoatLicense]);
					SCM(playerid, COLOR_LIGHTBLUE, "Ai primit licenta de barca pentru 30 de zile.");
					format(gString, 150, "**(( SI Dispatch: %s (%d) i-a oferit licenta de barca lui %s (%d). ))**", GetName(id), id, GetName(playerid), playerid);
					SendFactionMessage(PlayerInfo[id][pMember], COLOR_LIGHTBLUE, gString);
				}
			}
			PlayerVar[id][OferLicense] = -1;
			AddFactionRaport(id, 0, 1);
			format(gString, 100, "%s ti-a acceptat oferta si ai primit $300.000.", GetName(playerid));
			SCM(id, COLOR_MONEY, gString);
		}
		case _H<lesson>: {
			if(!IsPlayerLogged(id) || !IsPlayerConnected(id))
				return SCM(playerid, COLOR_GREY, "Player no connected.");

			if(PlayerVar[id][OferLession] != playerid)
				return SCM(playerid, COLOR_GREY, "Acel player nu ti-a termis o invitatie la o lectie.");

			PlayerVar[playerid][IsLession] = id;
			PlayerVar[id][IsLession] = playerid;

		 	gString[0] = EOS;
		 	format(gString, 75, "I-ai acceptat lectia lui %s.", GetName(id));
			SCM(playerid, COLOR_LIGHTBLUE, gString);
		 	format(gString, 75, "%s ti-a acceptat inceperea lectiei cu tine.", GetName(playerid));
			SCM(id, COLOR_LIGHTBLUE, gString);
		}
		case _H<free>: {
			if(PlayerVar[id][FreeOfer] != playerid)
				return SCM(playerid, COLOR_GREY, "Acel player nu ti-a dat free.");


			GivePlayerCash(playerid, -PlayerVar[id][FreeOfer]);
			GivePlayerCash(id, PlayerVar[id][FreeOfer]);

			ClearString();
			format(gString, 70, "You accepted his free request for $%s.", FormatNumber(PlayerVar[id][FreePrice]));
			SCM(playerid, 0x2EE2EBFF, gString);
			format(gString, 70, "%s has accepted your free order for $%s.", GetName(playerid), FormatNumber(PlayerVar[id][FreePrice]));
			SCM(id, 0x2EE2EBFF, gString);

			PlayerInfo[playerid][pJail] = 0;
			UpdateVar(playerid, "Jail", 0);
			PlayerTextDrawHide(playerid, WantedPTD);

			SetPlayerPos(playerid, 268.2463,76.9353,1001.0391);
			SetPlayerFacingAngle(playerid, 347.3376);

			PlayerVar[id][FreeOfer] = 0;
		}
		case _H<cinvite>: {
			if(InviteClan[id] != playerid)
				return SCM(playerid, COLOR_GREY, "Acel player nu ti-a dat invite in clan.");

			new x = GetClan[PlayerInfo[id][pClan]];

			Iter_Add(Clans[x], playerid);
			PlayerInfo[playerid][pClan] = PlayerInfo[id][pClan];
			PlayerInfo[playerid][pClanRank] = 1;
			PlayerInfo[playerid][pClanTag] = 0;

			SCMf(playerid, COLOR_LIGHTBLUE, "Ai acceptat invitatia lui %s.", GetName(id));
			format(gString, 150, "{%s}[INVITE] %s a intrat in clan. Invitat de %s", ClanInfo[x][clColor], GetName(playerid), GetName(id));
			SendClanMessage(playerid, COLOR_WHITE, gString);


			_query(256, "UPDATE `users` SET `Clan`='%d', `ClanRank`='%d', `name_and_tag` = '%s%s', `ClanTag` = '2', `ClanDays` = '%i' WHERE `Name`='%s'", PlayerInfo[playerid][pClan], PlayerInfo[playerid][pClanRank], PlayerInfo[playerid][pName], ClanInfo[x][clTag], gettime(), PlayerInfo[playerid][pName]);

			InviteClan[id] = -1;
		}
		case _H<invite>: {
			if(PlayerVar[id][InvitePlayer] != playerid) 
				return SCM(playerid, COLOR_GREY, "Acel player nu ti-a dat o invitatie.");

			PlayerVar[id][InvitePlayer] = INVALID_PLAYER_ID;
			PlayerInfo[playerid][pMember] = PlayerInfo[id][pMember];
			PlayerInfo[playerid][pRank] = 1;
			
			PlayerInfo[playerid][pSpawnChange] = 2;
			UpdateVar(playerid, "Spawnchange", 2);


			UpdateVar(playerid, "Rank", 1);
			UpdateVar(playerid, "Member", PlayerInfo[playerid][pMember]);

			Iter_Add(Factions<PlayerInfo[playerid][pMember]>, playerid);

			SetPlayerColor(playerid, TeamColors[PlayerInfo[playerid][pMember]]);
			foreach(new y : StreamedPlayer[playerid]) SetPlayerMarkerForPlayer(y, playerid, (GetPlayerColor(playerid) & 0xFFFFFF00));
			StartRaportLession(playerid);
			PlayerInfo[playerid][pTog][2] = true;
			save_tog(playerid);
		
			PlayerInfo[playerid][pFDays] = gettime();
			UpdateVar(playerid, "Days", gettime());

			format(gString, sizeof gString, "has joined the faction %s (invited by %s).", GetName(playerid), FactionInfo_[PlayerInfo[playerid][pMember]-1][fName], GetName(id));
			new year, mounth, day, hour, minute, second; getdate(year, mounth, day), gettime(hour, minute, second);
			mysql_format(SQL, gQuery, sizeof gQuery, "INSERT INTO `faction_logs` (`text`, `Userid`, `ByUserid`, `time`) VALUES ('%e', '%i', '%i', '%d-%d-%d %d:%d')", gString, PlayerInfo[id][pSQLID], PlayerInfo[playerid][pSQLID], year, mounth, day, hour, minute);
			mysql_tquery(SQL, gQuery);

			FactionInfo_[PlayerInfo[playerid][pMember] - 1][fMembers] ++;
			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `factions` SET `Members`= `Members` + '1' WHERE `ID`='%d'", FactionInfo_[PlayerInfo[playerid][pMember] - 1][fID]);
			mysql_tquery(SQL, gQuery, "", "");

			gString[0] = EOS;
			format(gString, sizeof(gString), "%s ti-a acceptat cerera ta de invitatie.", GetName(playerid));
			SCM(id, COLOR_PINK, gString);
			format(gString, sizeof(gString), "[Invite] %s este noul member a factiunii %s.", GetName(playerid), FactionInfo_[PlayerInfo[playerid][pMember] - 1][fName]);
			SendFactionMessage(PlayerInfo[playerid][pMember], 0x0080FFFF, gString);
		}
		default: {
			SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/accept [type] [playerid/name]");
			SCM(playerid, COLOR_GREY, "Type: {FFFFFF}dice, free, key, ticket, invite, lession, license, cinvite, gun");
		}
	}
	return true;
}
YCMD:referral(playerid, params[], help) {
	if(GetCoolDowns(playerid, 12)) return CoolDowns(playerid, 12);
	SetCoolDowns(playerid, 12, 20);
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof gQuery, "SELECT * FROM `users` WHERE `Referral`='%d'", PlayerInfo[playerid][pSQLID]);
	mysql_tquery(SQL, gQuery, "SQL_MyRefferals", "d", playerid);
	return true;
}

YCMD:quests(playerid, params[]) {
	SCM(playerid, COLOR_WHITE, " ---- Daily Misions ---- ");
	for(new m = 0; m < 3; m++) GetPlayerMission(playerid, m);
	SCM(playerid, COLOR_WHITE, " -------------------------- ");
	return true;
}

function SQL_MyRefferals(playerid) {
	SCM(playerid, COLOR_LGREEN, "-----");
	gString[0] = EOS;
	format(gString, 100, "Referralu tau este #%d-lea.", PlayerInfo[playerid][pSQLID]);
	SCM(playerid, COLOR_WHITE, gString);
	format(gString, 65, "Ai %d jucatori inregistati cu referralu tau.", cache_num_rows());
	SCM(playerid, COLOR_WHITE, gString);
	SCM(playerid, COLOR_LGREEN, "-----");
	return true;
}

YCMD:eject(playerid, params[], help) {
    if(!IsPlayerInAnyVehicle(playerid)) 
    	return SCM(playerid, -1, "Trebuie sa fii intr-un vehicul pentru a folosi aceasta comanda.");

    if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) 
    	return SCM(playerid,-1, "You can only eject people as the driver.");

	new id;
	if(sscanf(params, "u", id)) 
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/eject [playerid/name]");

	if(id == playerid) 
		return SCM(playerid, COLOR_GREY, "Nu iti poti da eject singur.");

	if(!IsPlayerConnected(id)) 
		return SCM(playerid, COLOR_GREY, "Acel player nu este conectat.");

	new vehicle = GetPlayerVehicleID(playerid);

	gString[0] = EOS;
	if(!IsPlayerInVehicle(id, vehicle) && GetPlayerSurfingVehicleID(id) != vehicle)
		return true;

	SetPlayerPose(id, 0, 0, 5);
	format(gString, sizeof(gString), "* %s has thrown %s out of their vehicle.",GetName(playerid),GetName(id));		           
	ProxDetector(15.0, playerid, gString, COLOR_PURPLE);
	format(gString, sizeof(gString), "* L-ai dat pe %s afara din vehicul!", GetName(id));
	SCM(playerid, COLOR_LIGHTBLUE, gString);
	format(gString, sizeof(gString), "* Ai fost dat afara din vehicul de %s !", GetName(playerid));
	SCM(id, COLOR_LIGHTBLUE, gString);
	
	RemovePlayerFromVehicle(id);
	return true;
}

YCMD:trade(playerid, params[], help) {
	new id;	
	if(sscanf(params, "u", id)) 
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/trade [playerid/name]");
	
	if(GetPlayerInterior(playerid) != 0 || IsPlayerInAnyVehicle(playerid) || PlayerVar[playerid][IsBizz] != 0) 
		return SCM(playerid, COLOR_LGREEN, "Nu poti face o afacere dintr-un interior sau vehicul!");
	
	if(!PlayerOfRangeToPlayer(playerid, 5, id)) 
		return SCM(playerid, COLOR_GREY, "Nu esti langa acel player");

	if(id == INVALID_PLAYER_ID) 
		return SCM(playerid, COLOR_GREY, "Acel player nu este conectat.");

	if(PlayerInfo[id][pLevel] < 3 || PlayerInfo[playerid][pLevel] < 3) 
		return SCM(playerid, COLOR_GREY, "Tu sau acel jucator nu aveti nivel peste 3!");
	
	if(PlayerVar[id][TradeInvite] == playerid) 
		return SCM(playerid, -1, "I-ai mai facut o oferta acestui jucator!");

	if(PlayerVar[playerid][IsTrade] != -1) 
		return SCM(playerid, COLOR_WHITE, "Esti deja intr-o afacere!");

	if(player_selected[playerid] != 0)
		return true;

	if(playerid == id) 
		return SCM(playerid, COLOR_GREY, "Nu poti executa aceasta comanda asupra ta!");

	if(player_selected[id] != 0)
		return SCM(playerid, COLOR_GREY, "Acel player este ocupat cu o alta actiune.");

	PlayerVar[id][TradeInvite] = playerid;

	ClearString();
	format(gString, 125, "* L-ai invitat pe %s (%d) pentru a face afaceri.", GetName(id), id);
	SCM(playerid, COLOR_LIGHTBLUE, gString);
	format(gString, 125, "* %s (%d) te-a invitat sa faceti afaceri. Foloseste (/accept trade %d) pentru a accepta invitatia.", GetName(playerid), playerid, playerid);	
	SCM(id, COLOR_LIGHTBLUE, gString);
	return true;
}

YCMD:addpin(playerid, params[], help) {
	if(PlayerInfo[playerid][pPin] != 0)
		return SCM(playerid, COLOR_GREY, "Ai deja un PIN setat.");

	if(sscanf(params, "i", params[0]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/addpin [PIN]");

	if(params[0] < 1000 || params[0] > 9999)
		return SCM(playerid, COLOR_GREY, "Invalid PIN.");

	PlayerInfo[playerid][pPin] = params[0];	
	UpdateVar(playerid, "PIN", params[0]);

	PlayerVar[playerid][PinLogged] = true;

	ClearString();
	format(gString, 120, "Felicitari! Contul tau are o securitate mai buna (PIN: %d) apasa pe F8 pentru a face o poza in caz de uiti PIN-ul.", params[0]);
	SCM(playerid, COLOR_YELLOW, gString);
	return true;
}

YCMD:changepin(playerid, params[], help) {
	if(PlayerInfo[playerid][pPin] == 0)
		return SCM(playerid, COLOR_GREY, "Nu ai deja un PIN setat. (/addpin)");

	if(sscanf(params, "ii", params[0], params[1]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/changepin [Old Pin] [New Pin]");

	if(PlayerInfo[playerid][pPin] != params[0])
		return SCM(playerid, COLOR_GREY, "Pinul actual introdus este gresit.");

	if(params[1] < 1000 || params[1] > 9999)
		return SCM(playerid, COLOR_GREY, "Invalid PIN.");

	PlayerInfo[playerid][pPin] = params[1];
	UpdateVar(playerid, "PIN", params[1]);

	ClearString();
	format(gString, 50, "Noul pin setat pe cont este: %d.", params[1]);
	SCM(playerid, COLOR_YELLOW, gString);
	return true;
}

YCMD:panel(playerid, params[], help) return SCM(playerid, COLOR_LGREEN, "panel."SERVER_NAME".ro");
YCMD:forum(playerid, params[], help) return SCM(playerid, COLOR_LGREEN, "forum."SERVER_NAME".ro");
YCMD:discord(playerid, params[], help) return SCM(playerid, COLOR_LGREEN, "https://discord.gg/tw2KdTV7CF");