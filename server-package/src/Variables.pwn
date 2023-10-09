// ============================== Server Setting ============================== //

#define SERVER_NAME					"red-zone"					// Numele server-ului.
#define SERVER_PASS					"3rufberu2fefs" 		// Daca MySQL nu este connectat la baza de date se pune parola
#define NAME_DEVELOPER				(1)
#define NAME_FOUNDER				(2)
#define NAME_FOUNDER2				(6546456)
#define NAME_WEBDEVELOPER 			(6544654)
#define HASH_KEY					("32ing2fsfsgseh56f") 	// hashurarea parolei chieie
#define MAX_LOGIN 					(15)  					// Maximul de personane care se pot loga
#define MAX_LOGIN_WAITING			(200)  					// Daca trece de MAX_LOGIN_WAITING v-a primi kick "Server supra incarcat".
#define SERVER_TICKRATE 			(200)

#define MAX_PLAYER_VEHICLE 			(25)
#define MAX_DS_VEHICLE     			(110)
#define MAX_HOUSES					(250)
#define MAX_BUSSINES 				(50)
#define MAX_JOBS_SKILLS 			(6)
#define MAX_JOBS 					(8)
#define MAX_SKILLPOINTS_JOB			(30)
#define MAX_SKILL_JOB 				(6)
#define MAX_PLAYER_EXPERIENCE		(100)
#define MAX_SYSTEMS					(14)
#define MAX_FACTIONS				(15)
#define MAX_PLAYER_SKIN 			(20)
#define MAX_SAFEZONE 				(50)
#define MAX_CLANS 					(100)
#define MAX_CLANVEHICLES			(10)
#define MAX_NUMBERS	 				(100000)
#define MAX_RECLAME					(50)
#define MAX_TURFS					(70)
#define MAX_CLAN_VEHICLES			(5)
#define MAX_BIZZ_TYPE				(15)
#define PET_EXPERIENCE 				(1400)
#define MAX_TRADE_ACTIONS			(8)
#define DESPAWN_TIME				(300)
#define MAX_ITEMS 					(72)
#define MAX_AREA 					(300)
#define MAX_ATM 					(25)
#define MAX_BLOACK_IP				(50)
#define MAX_32_BIT					(2147483647)

// ================= SQL Connect ======================== //

/*
#define MySQL_IPLocal 				("127.0.0.1")
#define MySQL_UserLocal 			("root")
#define MySQL_DataLocal 			("0")
#define MySQL_PassLocal 			("")*/


#define MySQL_IPLocal 			("")
#define MySQL_UserLocal 		("")
#define MySQL_DataLocal 		("")
#define MySQL_PassLocal 		("")


#define MySQL_IPHost 			("127.0.0.1")
#define MySQL_UserHost 			("root")
#define MySQL_DataHost 			("red-zone")
#define MySQL_PassHost 			("")

// ============================== Colors defines =============================== //

#define COLOR_WHITE 				0xFFFFFFFF
#define COLOR_DARKPINK      		0xE7AAA5A5
#define COLOR_SERVER 				0xA9C4E4FF
#define COLOR_YELLOW 				0xFFFF00FF
#define COLOR_LIGHTBLUE 			0x00C3FFFF
#define COLOR_NICEGREEN 			0x68FC8AFF
#define COLOR_RED					0xE61818FF
#define COLOR_NEWS 					0xFFA500AA
#define COLOR_LGREEN 				0xD7FFB3FF
#define COLOR_GREY 					0xC3C3C3FF
#define COLOR_ADMCHAT 				0xFFC266AA
#define COLOR_MONEY 				0x4DAD2BFF
#define COLOR_LOGS 					0xE6833CFF
#define COLOR_GREEN3				0x6DB067AA
#define COLOR_ADMCMD   				0xFFC000FF
#define COLOR_DARKNICERED 			0x9D000096
#define COLOR_PINK 					0xFFADADFF
#define COLOR_PURPLE 				0xC2A2DAAA
#define COLOR_LIGHTRED 				0xFF6347FF
#define COLOR_LIGHTGOLD 			0xFCD482FF
#define COLOR_HELPERCHAT			0xCC6600FF
#define COLOR_DEPART2 				0xff3535FF
#define COLOR_LIGHTGREEN 			0x9ACD32AA
#define COLOR_GM					0x8CF04CFF
#define COLOR_GMx					"{8CF04C}"

#define redist::%0(%1) \
	forward %0(%1); public %0(%1)

#define std::%0(%1)	\
	stock %0(%1)

#define IsPlayerConnectedOnPC(%0) \
	GetPVarInt(%0, "YourDevice")

new sql_result[144];
#define cache_get_value_name_sscanf(%0,%1,%2,%3) cache_get_value_name(%0,#%1,sql_result)&&sscanf(sql_result,#%2,%3)

std::compare(const string:string1[], const string:string2[])
	return !strcmp(string1,string2,true)?true:false;

#define PlayerToPoint \
	IsPlayerInRangeOfPoint

new srsString[144];
#define SCMf(%0,%1,%2,%3) \
	format(srsString, sizeof(srsString),%2,%3) && SCM(%0, %1, srsString)

#define percentage(%0,%1) \
	((%0/%1)*100.0)

#define loop.%0(%1..%2)\
	for(new %0=%1-1;++%0<%2;)

#define clearChat.%0(%1) \
	loop.CHAT(0..20) SendClientMessage(%0,-1," ")

#define update.%1(%1,%2,%3,%4,%5)\
	mysql_format(SQL, gQuery, sizeof gQuery, "update `%s` set `%s`='%i' where `%s`='%i'",%1,%2,%3,%4,%5)&&mysql_pquery(SQL,gQuery)

#define strmatch(%0,%1) !strcmp(%0,%1,true)

#define array_set:<%1>%2=>[%3,%4] for new %1:set@var[%4]={%3,...},arr=-1;++arr<1;do %2=set@var

#define strcatf(%0,%1,%2) format(gString,_,%1,%2)&&strcat(%0,gString)

new Float:_Vx,Float:_Vy,Float:_Vz;
stock GetVehicleSpeed(vehicleid) {
    GetVehicleVelocity(vehicleid, _Vx,_Vy,_Vz) ;
    return floatround((floatsqroot((_Vx * _Vx)+(_Vy*_Vy)+(_Vz*_Vz))*170.0));
}


#define GivePlayerCash(%0,%1) addBytes32(money[%0], %1)
#define GetPlayerCash(%0) bytes32(money[%0])
#define GetPlayerBank(%0) bytes32(bank[%0])
#define GivePlayerBank(%0,%1) addBytes32(bank[%0], %1)

// ============ end ================= //
new skins[] = {157 , 158  , 161 , 170, 45 , 41 , 40 , 34 , 29 , 31};

enum {
	LEADER,
	ADMIN,
	HELPER
}

new name_day[][] = {"Months", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};
new name_month[][] = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
// ============================= Variables defines ============================= //
new
	// Variables Globale // 
	MySQL:SQL, VehicleOwned[MAX_VEHICLES], VehicleSQL[MAX_VEHICLES], Fuel[MAX_VEHICLES], SqlDealership, SqlHouses, SqlBussines, Sqljobs, bool: Engine[MAX_VEHICLES], Lights[MAX_VEHICLES], lastcommand[MAX_PLAYERS], listitemmm[MAX_PLAYERS], InviteClan[MAX_PLAYERS], player_selected[MAX_PLAYERS], Float: Mark[MAX_PLAYERS][3], MarkVw[MAX_PLAYERS], MarkInt[MAX_PLAYERS],
	TotalAds, Registers, SQL_safe, CarRadio[MAX_VEHICLES], RestartCount = 0, SQL_Reclame, StoreGun[MAX_PLAYERS][9], drugCP[MAX_PLAYERS], posible_Action[MAX_PLAYERS], PlayerCity[MAX_PLAYERS], PlayerStoned[MAX_PLAYERS], bpChapter=0, bpTime,
	
	// Variables Players // 
	gString[2000], gQuery[500], bool: UsedFly[MAX_PLAYERS], Text3D: VIPLabel[MAX_PLAYERS], SQL_Factions, CPEx[MAX_PLAYERS] = {-1, ...}, RentStock[8] = {10,...}, LastCar[MAX_PLAYERS], JobCar[MAX_VEHICLES], WarKills[MAX_PLAYERS], WarDeath[MAX_PLAYERS], PlayerMission[MAX_PLAYERS][3][3], PunctRaport[MAX_PLAYERS],
	listitemm[MAX_PLAYERS], CP[MAX_PLAYERS], Float: CPOS[MAX_PLAYERS][3], VehicleAcces[MAX_VEHICLES] = {-1, ...}, InWar[MAX_FACTIONS + 1] = {-1,...}, MDCOn[MAX_PLAYERS], serverstarted, GetClan[500] = {-1,...}, TradeObject[MAX_PLAYERS][MAX_TRADE_ACTIONS], TradeTime[MAX_PLAYERS], HideJob[MAX_PLAYERS], 
	PlayerRainbow[MAX_PLAYERS], rID[MAX_PLAYERS], VehicleRainbow[MAX_PLAYERS], LastVehicle[MAX_PLAYERS], SQL_clans, SQL_Turfs, bool: CallService[MAX_PLAYERS][3], CallServiceAccept[MAX_PLAYERS][3], bool: gunset[MAX_PLAYERS][5], shotTime[MAX_PLAYERS], shot[MAX_PLAYERS], LiveOffer[MAX_PLAYERS], PNStage[MAX_PLAYERS], MoneyAd[MAX_PLAYERS], bool: MoneyTy[MAX_PLAYERS],
 	PlayerSelected[MAX_PLAYERS][50][50], pNames[MAX_PLAYERS][MAX_PLAYER_NAME], PlayerCalls[MAX_PLAYERS][MAX_PLAYERS], CountGlobalVehicle, repass[MAX_PLAYERS][32], GiftStep[MAX_PLAYERS], JobTime[MAX_PLAYERS], NewLive[MAX_PLAYERS], PlayerAreaID[MAX_PLAYERS], bool:PlayerPizza[MAX_PLAYERS], jobDeelay[MAX_PLAYERS], healDeelay[MAX_PLAYERS],
  	Text3D: Pet[MAX_PLAYERS], LastSpeed[MAX_PLAYERS], examobj[MAX_PLAYERS], RC[MAX_PLAYERS], bool: Helmet[MAX_PLAYERS], bool: Tazer[MAX_PLAYERS], airplane[MAX_PLAYERS], EditPlayer[MAX_PLAYERS][6], LastAction[MAX_PLAYERS], ActionWarning[MAX_PLAYERS], LastClick[MAX_PLAYERS], AreaID[MAX_AREA] = {-1, ...}, CallType[MAX_PLAYERS], PizzaHouse[MAX_PLAYERS][4], PizzaCP[MAX_PLAYERS], PizzaObject[MAX_PLAYERS][4],
 	bool: Questions = false, bool: Question[MAX_PLAYERS], PlayerInLoginQueue = 0, p_VendingUseTimer[MAX_PLAYERS] = {-1,...}, enterDeelay[MAX_PLAYERS], RegisterSkin[MAX_PLAYERS], pnsdoor[MAX_PLAYERS][2], pnsType[MAX_PLAYERS], TimeTut[MAX_PLAYERS], TimeType[MAX_PLAYERS], lastChar[MAX_PLAYERS][3], lenChar[MAX_PLAYERS], svfFaction[MAX_PLAYERS],
 	TotalLoginQueue = 0, EditObjectID[MAX_PLAYERS], EditObjectIDe[MAX_PLAYERS], Float:VehiclePos[MAX_VEHICLES][4], bool:ConfirmPw[MAX_PLAYERS], MatsOffer[MAX_PLAYERS], MatsPrice[MAX_PLAYERS], MatsAmmo[MAX_PLAYERS], tut_clothes, tut_store, hoursBet[MAX_PLAYERS][5], hoursSelect[MAX_PLAYERS], bool:exception[MAX_PLAYERS],
 	DrugOffer[MAX_PLAYERS], DrugPrice[MAX_PLAYERS], DrugGram[MAX_PLAYERS], ac_ouvu_wng[MAX_PLAYERS], ac_ouvu_vid[MAX_PLAYERS], ac_ouvu_tick[MAX_PLAYERS], Iterator:s_Players<MAX_PLAYERS>, QuestText[MAX_PLAYERS][144], p_money[MAX_PLAYERS][12], alreadyBetPlace[MAX_PLAYERS], lastPlayer[MAX_PLAYERS] = {-1, ...}, gunOferID[MAX_PLAYERS], sellGunID[MAX_PLAYERS], sellGunPrice[MAX_PLAYERS],
 	bool:HaveTicket[MAX_PLAYERS], skinSlot[MAX_PLAYERS], inAnim[MAX_PLAYERS], Float:total_demage[MAX_PLAYERS], Float:total_take[MAX_PLAYERS], timeDMG[MAX_PLAYERS], Iterator:player_in_blocks[MAX_PLAYERS]<MAX_PLAYERS>, pnsDeelay[MAX_PLAYERS], Float:monsterKM[MAX_PLAYERS],

 	// Liciatie //
 	Iterator:Licitatie[3]<200>, bool: Licitatie_lession = false, Licitatie_type = -1, Licitatie_player = -1, Licitatie_money, Licitatie_ID = -1, Licitatie_Time, Licitatie_ide = -1, //Licitatie_Level


 	// rob //
 	RobStatus[MAX_PLAYERS], RobTimer[MAX_PLAYERS], RobActor[MAX_PLAYERS], bool: RobBackpack[MAX_PLAYERS], RobVehicle[MAX_PLAYERS], playerIP[MAX_PLAYERS][16],

 	// PaintBall //

 	PB_Maps[2], PB_Time[2], PB_Status[2], PaintType[MAX_PLAYERS], PB_Best[2], Iterator:PlayerPaint[2]<MAX_PLAYERS>, PKills[MAX_PLAYERS], PDeath[MAX_PLAYERS], MapVotes[2][7], bool: Voted[MAX_PLAYERS], LastKillP[MAX_PLAYERS],


	// Iteratori //
 	Iterator:VehicleSpawned<MAX_VEHICLES>, Iterator:MyVehicles<MAX_PLAYERS, MAX_VEHICLES>,
 	Iterator:Rainbows[4]<MAX_PLAYERS>, Iterator:PlayerKeys[MAX_PLAYERS]<MAX_VEHICLES>, Iterator:PlayerCrates<MAX_PLAYERS>, Iterator:_Player<3, MAX_PLAYERS>,
 	Iterator:BizzType[MAX_BIZZ_TYPE]<MAX_BUSSINES>, Iterator:VarVehicle<MAX_VEHICLES>, Iterator:LoginQueue[2]<MAX_PLAYERS>,
 	Iterator:Spectacting[MAX_PLAYERS]<MAX_PLAYERS>, Iterator:Reports[2]<MAX_PLAYERS>, Iterator:PlayerVIP<MAX_PLAYERS>,  Iterator:HelpsDuty<MAX_PLAYERS>,
 	Iterator:Newbie<MAX_PLAYERS>, Iterator:VehicleKeys[MAX_VEHICLES]<MAX_PLAYERS>, Iterator:PlayerPremium<MAX_PLAYERS>,
 	Iterator:Clans[MAX_CLANS]<MAX_PLAYERS>,  
 	Iterator:Factions<MAX_FACTIONS, MAX_PLAYERS>, Iterator:Bigears<MAX_PLAYERS>, Iterator:Renters<MAX_PLAYERS>,
 	Iterator:ClanVehicles[MAX_CLANS]<MAX_VEHICLES>, Iterator:ClanVehs<MAX_VEHICLES>, Iterator:PlayerInVehicle[MAX_VEHICLES]<MAX_PLAYERS>,
 	Iterator:Calls[MAX_FACTIONS]<MAX_PLAYERS>, Iterator:Freqs[100]<MAX_PLAYERS>, Iterator:Wars<MAX_TURFS>, 

 	PhoneFinder[MAX_NUMBERS] = {-1, ...},
 	TextID[MAX_TEXT_DRAWS] = {-1, ...},

	// TextDraws //
	PlayerText: FPS, PlayerText: ShowTD, PlayerText: PlayerLogo, Text: DataT[3], PlayerText: MoneyTD, PlayerText: FindPTD[2], PlayerText: InfoPTD, Text:LogoTD[6], Text: register_TD[10], PlayerText:register_PTD[MAX_PLAYERS][7], PlayerText: select_carTD[MAX_PLAYERS][11], Text:GoalTD[11], PlayerText:SkinPTD[2], Text:SkinShopTD[11],
	PlayerText: ProgressPTD[2], PlayerText: SpectateTD, Text: CrateTD[11], PlayerText: CratePTD[MAX_PLAYERS][10], PlayerText: SafezoneTD, PlayerText: WantedPTD, PlayerText: FarmingPTD, PlayerText: GarbagePTD, PlayerText: ChatPTD, Text:restartTD, PlayerText:GoalPTD[4], 
	Text: GunTD[5], PlayerText: GunPTD, PlayerText: PinPTD[MAX_PLAYERS][28], PlayerText: TradePTD[MAX_PLAYERS][7], Text: TradeTD[21], PlayerText: TradeIcon[MAX_PLAYERS][10], PlayerText: TradeTitle[MAX_PLAYERS][10], PlayerText: TaxiPTD, Text: InfoxTD[2], PlayerText: InfoxPTD[MAX_PLAYERS][3], PlayerText:dmgInfoPTD[4], Text:dmgInfoTD[4],
	PlayerText: WarPTD[12], PlayerText: ExpTD[3], PlayerText: PaintTD, PlayerText: GiftPTD[2], Text: GiftTD[2], Text: InfoBoxTD, Text: InfoTD, PlayerText: JobTD, PlayerText: JobPTD, PlayerText: RoulettaPTD, PlayerText: bpPTD[MAX_PLAYERS][21], Text: bpTD[7], PlayerTextID[MAX_PLAYERS][MAX_PLAYER_TEXT_DRAWS],
	Text:speed_TD[29] = {INVALID_TEXT_DRAW, ...}, Text:speed_TDx[29] = {INVALID_TEXT_DRAW, ...}, PlayerText: SpeedometerPTD[MAX_PLAYERS][8] = {{PlayerText:INVALID_TEXT_DRAW, ...}, ...}, Text:PhoneTD[62], PlayerText:PhonePTD[4], PlayerText:PressTD[3]
;

new BigInt:money[MAX_PLAYERS];
new BigInt:bank[MAX_PLAYERS];

#define save_vouchers(%0) \
	_query(256, "UPDATE `users` SET `vouchers` = '%i %i %i' WHERE `id` = '%i'", PlayerInfo[%0][pVoucher][0], PlayerInfo[%0][pVoucher][1], PlayerInfo[%0][pVoucher][2], PlayerInfo[%0][pSQLID])


#define procentage(%0,%1) ((%0*100)/%1)

#define val_procentage(%0,%1%) \
    ((%0/100)*%1)

enum {
	PC_TYPE_HOURSBET,
	PC_TYPE_BALLS
}
new Iterator:computer_players<2, MAX_PLAYERS>;
new temp_model[4] = {506, 495, 402, 567}, exp_model[4] = {5, 7, 12, 20};

Float:GetDistanceBetweenPoints(Float:x,Float:y,Float:z, Float:_x, Float:_y, Float:_z) return VectorSize(x-_x, y-_y, z-_z);

enum {
	BUTON_INVLAID,
	BUTON_LEFT,
	BUTON_RIGHT,
	BUTON_UP,
	BUTON_DOWN,
	BUTON_ENTER,
	BUTON_SPACE
}

#define MAX_INVENTAR_TYPE			(30 + 1) // INVENTAR SYSTEM //

// ============================== Function Defines ============================ // 
#define SCM 						SendClientMessage
#define AdminOnly 					"* You do not have access to this command."
#define needAdmin<%0,%1> \
	if !IsAdmin(%0,%1) *then return SCM(%0,COLOR_LGREEN,AdminOnly);

#define _query(%0,%1,%2) \
	mysql_format(SQL, gQuery, %0, %1, %2)&&mysql_tquery(SQL, gQuery)

#define function%0(%1) 				forward %0(%1); public %0(%1)
function Kick_Ban ( playerid, bool: kickban ) return ( !kickban ) ? Kick ( playerid ) : Ban ( playerid );
#define KickEx(%1) 					SetTimerEx ( "Kick_Ban", 20, false, "ii", %1, false ), SetPlayerPose(%1, 0, 0, 5)
#define Ban(%1) 					SetTimerEx ( "Kick_Ban", 20, false, "ii", %1, true )
#define INVALID_VEHICLE  			(0)
#define RGBToHex(%0,%1,%2,%3) %0 << 24 | %1 << 16 | %2 << 8 | %3
#define SCMTA 						SendClientMessageToAll
#define INFINITY (Float:0x7F800000)
stock RandomEx(min, max) 		return random(max-min)+min;

new AreaType[MAX_AREA];
#define RELEASED(%0) \
	(((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))

function SetVehicleParamsExx(v, e, l, a, d, b, bo, o) {
	SetVehicleParamsEx(v, e, l, a, d, b, bo, o);
	foreach(new i : VehicleKeys[v]) SetVehicleParamsForPlayer(v, i, 0, 0);
	return true;
}

#if defined _ALS_SetVehicleParamsEx
    #undef SetVehicleParamsEx
#else
    #define _ALS_SetVehicleParamsEx
#endif
#define SetVehicleParamsEx SetVehicleParamsExx

function SetVehiclePosEx(vehicleid, Float:x, Float:y, Float:z) {
	VehiclePos[vehicleid][0] = x;
	VehiclePos[vehicleid][1] = y;
	VehiclePos[vehicleid][2] = z;
	SetVehiclePos(vehicleid, x, y, z);
	return true;
}


#if defined _ALS_SetVehiclePos
    #undef SetVehiclePos
#else
    #define _ALS_SetVehiclePos
#endif
#define SetVehiclePos SetVehiclePosEx

function SetVehicleZAngleEx(vehicleid, Float:z_angle) {
	VehiclePos[vehicleid][3] = z_angle;
	SetVehicleZAngle(vehicleid, z_angle);
	return true;
}

#if defined _ALS_SetVehicleZAngle
    #undef SetVehicleZAngle
#else
    #define _ALS_SetVehicleZAngle
#endif
#define SetVehicleZAngle SetVehicleZAngleEx
enum {
	INVALID_EDIT,
	EDIT_VIPTEXT,
	EDIT_ATM,
	EDIT_COMPUTER,
	EDIT_COMPUTER_AL
}

enum {
	AREA_INVALID,
	AREA_SAFEZONE,
	AREA_COLISION,
	AREA_VENDINGMACHINE,
	AREA_ATM,
	AREA_ZONE,
	AREA_PC,
	AREA_ROULETTE,
	AREA_EXCEPTED,
	AREA_PNS,
	AREA_CHANGE_SKIN,
	AREA_STAGE,
	AREA_STAGE_MAX = AREA_STAGE+4
}

enum {
	 INVALID_ACTION,
	 VENDING_MACHINE,
	 ATM,
	 COMPUTER,
	 ROULETTE,
	 EXCPETED,
	 CHANGE_SKIN,
	 STAGE,
	 STAGE_MAX = STAGE + 4
}

// -------- Crate variable -------- ///

enum E_CRATE_INFO {
	C_SERVER,
	C_PRICE,
	C_NAME[20],
	C_COLOR[10],
	C_MAX_OBJ,
	Float:C_POS[3]
}

new CrateInfo[3][E_CRATE_INFO] = {
	{0, 200, "Basic", "ABA952", 4, {2441.3525,109.7816,26.4790}},
	{2500, 100, "Red-zone", "877F98", 6, {2436.1589,109.8003,26.4786}},
	{300, 0, "Vehicle", "6020E7", 7, {2430.9028,109.8305,26.4783}}

};
new SColors[29][7] = {
{"CECECE"}, {"0087FE"}, {"4700C2"}, {"EBFF00"}, {"EF00FF"}, {"40FF00"}, {"9CFF29"},
{"0E7F03"}, {"FF9A00"}, {"6E6E6E"}, {"FF4C9D"}, {"F4FA58"}, {"00BFFF"}, {"819FF7"},
{"FE9A2E"}, {"FA8258"}, {"00FF40"}, {"D358F7"}, {"4169E1"}, {"9ACD32"}, {"F0E68C"},
{"BDB76B"}, {"FF1493"}, {"9966CC"}, {"F0B2B2"}, {"DB7093"}, {"E70031"}, {"AB0000"},
{"FF6347"}};

new RentModel[1][8] = {
	{560, 400, 405, 458, 462, 463, 461, 471}
};
enum _SvInfo_ {
	sName[40],
	sPassword[24],
	sSystem[MAX_SYSTEMS],
	sJobGoal,
	sMaxJobGoal,
	sMaxPJobGoal,
	bool:sCompleted
}
new ServerInfo_[_SvInfo_];

enum PickupInfo_ {
	pkType,
	pkID,
	pkValue,
	pkWar
}
new PickupInfo[MAX_PICKUPS][PickupInfo_];

enum _Variable {
	Float: VehicleHealth, Stock, Transfer, AdTime, InviteDice, DiceMoney, bool: Refill, AdText[80], IsDealer, AFKSeconds, SkinType,
	bool: IsLogged, Incercari, HouseID,	BussinesID, IsBizz, IsHouses, MoneyShow, IsPhone, Find, DealerID, PlayerBar: HudProgress[3],
	Float: LastPos[3], CoolDown[32], Fish[2], FishTimer, JobVehicle, JobTimeLeft, bool: JobWork, HideTD, bool: IsExam, ExamCar, BanName[35], BanNames[MAX_PLAYER_NAME],
	bool: Selected[3], IsFaction, IsPickup, InvitePlayer, Duty, FactionVehicle, FactionObject[2], bool: Death, PlayerWanted, bool: Sleeping,
	RaportTime, bool: Speeding, ADuty, TimerCheckSpawns, Radio, ServerTimer[2], WARNING, MySpec, RaportText[64], DRL, FPSS,
	RaportType[2], UnSpec[2], NewbieText[128], HaveHelp, CrateSelect, CrateTime, bool: IsSkins, NextPage, EmailsID[10], MyHelp,
	bool: IsSafezone, Freeze, ClanName[25], Names[25], MoneyReacvheid, FakeWarning, fSpec, LastCall, bool: IsCell, Reply, bool: Acover, AcoverLevel, TC, LTT,
	FreeOfer, FreePrice, bool: PinLogged, LeftJob, ChatHide, Trash, HaveTrash, Trailer, bool: preparespawn, Float: LastSpec[4], bool: TogTurf,
	RentVehicle, Mats[2], IsStoreGun, LastStoreGun, PinConst[5], TradeInvite, IsTrade, TradeItems, TradeReady, TradeType, FarmerWarning, TaxiAmount, TaxiTotal,
	IsTaxi, HaveCalls, HaveContract, bool: Undercover, BodyMoney, Cuff, TicketOffer, TicketMoney, OferLicense, TypeLicense, IsLession, OferLession, bool: TaxiDuty, ExpTime
}		
new PlayerVar[MAX_PLAYERS][_Variable];

new PaintKillers[9][25] = {{"double"}, {"triple"}, {"quadruple"}, {"Quintuple"}, {"sextulpe"}, {"septulpe"}, {"octulpe"}, {"nightulpe"}, {"legendary"}};


enum tInfo {
	tID,
	Float: tPos[4],
	tTeam
}
new TurfInfo[MAX_TURFS][tInfo];

enum wInfo {
	wFaction, wAttacker, wAP[MAX_FACTIONS + 1], wTime, wKills, wDeath[MAX_FACTIONS + 1], Float: wScore[MAX_FACTIONS + 1], wBest, wWorst, wFail[MAX_FACTIONS + 1]
}
new WarInfo[MAX_TURFS][wInfo];

enum E_ATM_INFO {
	at_ID,
	at_Obj,
	Text3D: at_Lab,
	Float:at_X,
	Float:at_Y,
	Float:at_Z,
	Float:at_RX,
	Float:at_RY,
	Float:at_RZ
}
new AtmInfo[MAX_ATM][E_ATM_INFO] = {{0, 0, Text3D:-1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}, ...}, SQL_ATM;

// Dialoguri.
enum {
	DIALOG_INVALID,
	DIALOG_REGISTER, DIALOG_CONFIRMPW, DIALOG_GENDER, DIALOG_EMAIL, // Register //
	DIALOG_LOGIN, DIALOG_SETPIN, // Login // 
	DIALOG_V, DIALOG_VV, DIALOG_VINFO, DIALOG_CARPLATE, DIALOG_DEBUGCAR, DIALOG_BUYPOINTS, DIALOG_PAYINSURANCE, // Personal Vehicle //
	DIALOG_VUPGRADES, DIALOG_PLACEHIDD, DIALOG_CHANGEHIDD, DIALOG_RAINBOW, DIALOG_VIP, DIALOG_EDITVIP, DIALOG_VIPCOLOR, // Personal Vehicle //
	DIALOG_VIPNAME, DIALOG_NEON, DIALOG_FNEON, DIALOG_TOWCAR, DIALOG_FINDCAR, // Personal Vehicle //
	DIALOG_CANCELCHECKPOINT, // Cancel CheckPoint // 
	DIALOG_DEALERSHIP, DIALOG_DEALERSHIPP, DIALOG_DSINFO, DIALOG_SELLCAR, DIALOG_CONFIRMCAR, DIALOG_EDITDS, DIALOG_EDITDS1, // DealerShip //
	DIALOG_HMENU, DIALOG_HINFO, DIALOG_HDESCRIPTION, DIALOG_SETRENT, DIALOG_HWITHDRAW, DIALOG_HDEPOSIT, DIALOG_SELLHOUSE, DIALOG_SPAWNCHANGE, DIALOG_MOVEHOUSE, DIALOG_HRADIO, DIALOG_HSTATESELL, // Houses //
	DIALOG_LOCATIONS, DIALOG_BLOCATIONS, DIALOG_BLOCATIONS1, // Locations //
	DIALOG_CHANGEPASS, DIALOG_NEWPASS, // Change password //
	DIALOG_TRANSFER, DIALOG_BUYDILDO, DIALOG_BMENU, DIALOG_BINFO, DIALOG_BDESCRIPTION, DIALOG_BFEE, DIALOG_BWITHDRAW, DIALOG_BDEPOSIT, DIALOG_RENT, DIALOG_SELLBIZTOSTATE, // Bussines //
	DIALOG_BSELL, DIALOG_TRUCKER, // Bussines //
	DIALOG_LOGIN_PC, DIALOG_LOGIN_PC_, // PC //
	DIALOG_JOBS, DIALOG_SELECTROUTE, DIALOG_FINISHTRUCK, DIALOG_MATS, DIALOG_FMATS, // Jobs //
	DIALOG_GOTOJOB, DIALOG_SYSTEMS, DIALOG_STAFF, DIALOG_SERVER, DIALOG_CHANGESVPASS, DIALOG_CHANGSVNAME, DIALOG_GMX, // Admins //
	DIALOG_ONLINE, DIALOG_SHOP, DIALOG_SHOP1, DIALOG_SVF, DIALOG_CARRADIO, DIALOG_SHOW, DIALOG_PCOLOR, DIALOG_TOG, DIALOG_CRATE, DIALOG_VOTE,// Players //
	DIALOG_EMAILS, DIALOG_EMAILREAD, DIALOG_BUYCLAN, DIALOG_BUYCLAN1, DIALOG_PET, DIALOG_REFERRAL, DIALOG_REFERRAL1, DIALOG_TRADE, // Player //
	DIALOG_REPASSWORD, DIALOG_AGE, DIALOG_SERVICE, DIALOG_CALLS, DIALOG_LICITATIE, DIALOG_MOVEBIZ, DIALOG_HELP, DIALOG_HELP1, DIALOG_PAINT, DIALOG_BUYCRATE,// Players //
	DIALOG_BUYIPHONE, DIALOG_SKIN,DIALOG_BLACK, DIALOG_RED, DIALOG_GREEN, // Players //
	DIALOG_CLAN, DIALOG_CLANMEMBERS, DIALOG_CLANTAG, DIALOG_CLANVEH, DIALOG_BUYCLANVEH, DIALOG_CLAMMV, DIALOG_CLAN_SETTING, DIALOG_CLAN_COLORCHAT, DIALOG_CLANCOLOR, // Clans //
	DIALOG_CLAN_SETTINGRC, DIALOG_CLAN_SETTINGNAME, DIALOG_CLAN_RCOLOR, DIALOG_CLAN_RNAME, DIALOG_CLAN_MOTD, DIALOG_QUITCLAN, DIALOG_EDITCLAN, DIALOG_CLANEDIT, // Clans //
	DIALOG_TRADEMONEY, DIALOG_TRADEVEHICLE, DIALOG_TRADESKIN, DIALOG_TRADEBIZ, DIALOG_TRADEHOUSE, // trade system //
	DIALOG_REPORT, DIALOG_RAPORTDM, DIALOG_RAPORTOTHER, // Report system //
	DIALOG_FACTIONS, DIALOG_FINFO, DIALOG_SUSPECT, DIALOG_MEMBERS, DIALOG_MEMBERSEDIT, DIALOG_MEMBERS1, DIALOG_WANTED, DIALOG_TICKET, DIALOG_EDITRAPORT, DIALOG_MOVEFACTION, // factions //
	DIALOG_RAPORTRANK, DIALOG_RAPORTVALUE, DIALOG_SETGUN, DIALOG_EDITRANK, DIALOG_EDITRANK1, DIALOG_EDITFACTION, DIALOG_QUITGROUP,// Factions //
	DIALOG_PETOBJ, DIALOG_PETNAME, // pet // 
	DIALOG_FRIENDS, DIALOG_ADDFRIENDS, DIALOG_FRIEND, DIALOG_SMSFRIEND,
	DIALOG_MARKET_TITLE, DIALOG_MARKET_OBIECT, DIALOG_MARKET_PRICE, DIALOG_MARKET_DESCRIPTION, DIALOG_MARKET_OBIECT1, DIALOG_MARKET, // Market //
	DIALOG_ATM, DIALOG_ATMWITHDRAW, DIALOG_24, // atm //
	DIALOG_IVBUY,DIALOG_FACTIONAME, DIALOG_MOVESVF, DIALOG_CONFIRMALEA, DIALOG_BUYVEHICLE, // Inventar & Shop //
	DIALOG_HUPGRADE, DIALOG_BUYTICKET,
	DIALOG_PLACEBETS, DIALOG_FDEPOSIT, DIALOG_FDEPOSIT1, DIALOG_WHEELS, DIALOG_VOUCHER, DIALOG_TRADEVOUCHERR, DIALOG_TRADEVOUCHERR1, DIALOG_TRADEVOUCHERR2,
	DIALOG_CHANGENAME, DIALOG_FNAME, DIALOG_BP, DIALOG_BUYBP, DIALOG_MP3, 
} 
enum _pInfo {
	pSQLID, pName[MAX_PLAYER_NAME], pPassword[65], pAdmin, pHouse, pBussines, pRentroom, pLevel, pEmail[32], pModel, pExperience, pConnected,
	pPlaying, pPhone, pCredit, bool: pPhoneBook, pSlot, pPremiumPoints,  pHidden, pSpawnChange, bool: pPhoneStatus, pJob, pJobSkill[MAX_JOBS], pSkill[MAX_JOBS], pDriveLicense,
	pWarn, bool: pPremiumAccount, pMode, pTut, pMember, pRank, pFP, bool: pHud[4], pColor, pVip, pDrvingSuspend, bool: pTog[9], pHelper, pCrate[6], pSkin[MAX_PLAYER_SKIN],
	pClan, pClanRank, pClanTag, pClanMoney, pClanWarn, pCarKey[MAX_PLAYER_VEHICLE], pPet, bool: pPetStatus, pPetLevel, pPetName[30], pPetExp, pMute, pWanted, pWantedReason, pJail, 
	pPin, pFWarn, pReferral, pFaina, pMats, pNeon[6], bool: pWTalkie, pFreq, pCrime[35], pCrimeReport[MAX_PLAYER_NAME], pIP[16], pFPoints[3], pFDays, pRaportTime, 
	pWeaponLicense, pBoatLicense, pFlyLicense, pFlySuspend, pWeaponSuspend, pBoatSuspend, pVehRainbow, pGiftPoints, pRobExp, pJobOwner, pDrugs, pJobGoal,  pJobBoost, pJobProcent,
	pGender, pItems[MAX_ITEMS], pJailType, pTR, pSTR, pItemSlotType[MAX_INVENTAR_TYPE], pServerPoints, pTier, pBpExp, bool:pGoldPass, bool:pMP3, bool:pDiscordSecurity,
	pItemType[MAX_ITEMS], pLW, pHW, pAW, pAge, bool:pYoutube, bool:pQuestStatus[25], pAttached[4], bool:pHavePet, pVoucher[3], bpClaimed[40],
}
new PlayerInfo[MAX_PLAYERS][_pInfo], playerBPTask[MAX_PLAYERS][40];
// Checkpoints..
enum {
	DISABLE_CHECKPOINT, CP_NORMAL, CP_JOB, CP_FIND_PLAYER, CP_TRASHCP, CP_FINISHTRASH, CP_TRUCKSTART, CP_MATS, CP_ROB, CP_DRUGS, CP_MOS, CP_WOOD,
	CP_PIZZA1, CP_PIZZA2, CP_PIZZA3, CP_STORE, CP_DMV, CP_CLOTHES
}

new ReclameName[MAX_RECLAME][35];

new wantedList[16][2] = {
	{1, 0},
	{1, 0},
	{2, 0},
	{2, 0},
	{2, 0},
	{3, 0},
	{3, 0},
	{3, 1},
	{3, 0},
	{4, 0},
	{4, 0},
	{4, 0},
	{5, 0},
	{5, 1},
	{6, 1},
	{6, 1}
};

enum clInfo {
	clID,
	clName[25],
	clMembers,
	clSafebox,
	clPremiumPoints,
	clTime,
	clTag[10],
	clRankName1[25],
	clRankName2[25],
	clRankName3[25],
	clRankName4[25],
	clRankName5[25],
	clRankName6[25],
	clRankName7[25],
	clRankColor1[7],
	clRankColor2[7],
	clRankColor3[7],
	clRankColor4[7],
	clRankColor5[7],
	clRankColor6[7],
	clRankColor7[7],
	clColor[7],
	clChatColor[7],
	clMotd[84]
}
new ClanInfo[MAX_CLANS][clInfo];

enum sInfo {
	sID,
	sMoney,
	sDrugs,
	sMaterials,
	sFaction,
	Float: sX,
	Float: sY,
	Float: sZ
}
new SeifInfo[MAX_FACTIONS][sInfo];

enum cvInfo {
	cvID,
	cvModel,
	cvTime,
	cvSpawned,
	Float: cvPos[4],
	cvColor[2],
	cvClanID,
	cvText
}
new ClanVeh[MAX_VEHICLES][cvInfo];

enum vfInfo {
	vfID,
	vfModel[10],
	Float: vfX,
	Float: vfY,
	Float: vfZ,
	Float: vPos[4],
	vfRank[10],
	vfStock[10],
	vfColor1[10],
	vfColor2[10],
	vfPickup,
	Text3D: vfLabel
}
new VehFInfo[MAX_FACTIONS + 1][vfInfo]={{0, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 0.0, 0.0, 0.0, {0.0, 0.0, 0.0, 0.0}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, -1, Text3D:-1}, ...};

enum _fInfo {
	fID,
	fName[50],
	fMembers,
	fLeader[MAX_PLAYER_NAME],
	Float: fEnterPos[3],
	Float: fExitPos[3],
	fColor[11],
	fMaxMembers,
	fLevel,
	fBalance,
	fVirtualWorld, 
	fInterior,
	bool: fStatus,
	fSkin[7],
	Text3D: fLabel,
	fPickup,
	fMats,
	fDrugs,
	fBlockRank,
	fMotd[128]
}
new FactionInfo_[MAX_FACTIONS][_fInfo] = {{0, EOS, 0, EOS, {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}, EOS, 0, 0, 0, 0, 0, false, {0, 0, 0, 0, 0, 0, 0}, Text3D:-1,-1, 0,0, 0, EOS}, ...}, 
fRankNames[MAX_FACTIONS][7][25], FactionRaport[MAX_FACTIONS + 1][8][3];

enum _vInfo {
	vID,
	vModel,
	vColor[2],
	vFaction,
	Float: vPos[4],
	vVehID
}
new ServerVehicle[MAX_VEHICLES][_vInfo];


enum vInfo {
	vColor[2]
}
new VehicleInfo[MAX_VEHICLES][vInfo];
enum _hInfo {
	hID,
	hOwner[MAX_PLAYER_NAME],
	hUserid,
	bool: hOwned,
	hRented,
	hDescription[32],
	hValue,
	hOldValue,
	Float: hEnterPos[3],
	Float: hExitPos[3],
	hInterior,
	hVirtualWorld,
	hLevel,
	hBalance,
	bool: hStatus,
	hSize,
	hRadio,
	hPickupid,
	Text3D: hLabel,
	bool: hAlea,
	Float: hAleaX,
	Float: hAleaY,
	Float: hAleaZ,
	Float: hAleaZAngle,
	bool:hComputer,
	Float:hPCx,
	Float:hPCy,
	Float:hPCz,
	Float:hPCr,
	hObjPC,
	bool:hHeal,
	hIntID
}
new HouseInfo[MAX_HOUSES][_hInfo] = {{0, EOS, 0, false, 0, EOS, 0, 0, {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}, 0, 0, 0, 0, false, 0, 0, -1, Text3D:-1, false, 0.0, 0.0, 0.0, 0.0}, ...};

enum _evInfo {
	bool: evStatus,
	evVirtualWorld,
	evInterior,
	Float: evPos[3],
	Text3D: evLabel,
	evPickup
}
new EventInfo[_evInfo];

enum _szInfo {
	szID,
	szArea,
	szRaza,
	Float: szPos[3]
}
new SafeInfo[MAX_SAFEZONE][_szInfo];

enum _jInfo {
	jID,
	jName[32],
	jLevel,
	jPay[2],
	jVehicles[6],
	Float: jPos[3],
	jPlayers,
	Text3D: jLabel,
	Float: jWorkPos[3],
	Float: jvPos[4],
	jPickup
}
new JobInfo[MAX_JOBS][_jInfo] = {{0, "", 0, {0, 0}, {0, 0, 0, 0, 0, 0}, {0.0, 0.0, 0.0}, 0, Text3D:-1, {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0, 0.0}, -1}, ...};

enum _bInfo {
	bID,
	bOwner[MAX_PLAYER_NAME],
	bUserid,
	bool: bOwned,
	bool: bStatic,
	bFee,
	bDescription[32],
	bValue,
	bOldValue,
	Float: bEnterPos[3],
	Float: bExitPos[3],
	bInterior,
	bVirtualWorld,
	bLevel,
	bBalance,
	bool: bStatus,
	bType,
	bPickupid,
	Text3D: bLabel,
	bMapIcon
}
new BizzInfo[MAX_HOUSES][_bInfo] = {{0, "None", -1, false, false, 0, EOS, 0, 0, {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}, 0, 0, 0, 0, false, 0, -1, Text3D:-1, 0}, ...};

enum _cInfo {
	cID, cOwner[MAX_PLAYER_NAME], cModel, cUserid, cPrice, cInsurance, cFuel, Float: cOdometer, Float: cPos[4], cColor[2], cLicense[MAX_PLAYER_NAME],
	cMod[14], bool: cStatus, cVirtual, Float: cHealth, cComponents[4], cPoints, cDays, cSpawned, cTime, Float: cLastPos[4], bool: cRainbow, cText[30], Float: cVipPos[6], 
	cVipColor[6], bool: cVipStatus, cObjectText, cOnline, cPaintjob, cLeft, cNeon, cNObj[2], bool:cNeonStatus, cStage
}
new CarInfo[MAX_VEHICLES][_cInfo];


enum _dInfo {
	dID, dModel, dPrice, dStock, dPremiumPoints
}
new DealerInfo[MAX_DS_VEHICLE][_dInfo], DsStart[4], DsEnd[4], DsPage[4];

new MonthName[12][] = {
	{"January"},
	{"February"},
	{"March"},
	{"April"},
	{"May"},
	{"June"},
	{"July"},
	{"August"},
	{"September"},
	{"October"},
	{"November"},
	{"December"}
};

new PetName[6][20] = {
	{"Parrot"},
	{"Turtle"},
	{"Cow"},
	{"Pony"},
	{"Shark"},
	{"Special"}
};

new MonthNameEx[12][] = {
	{"Jan"},
	{"Feb"},
	{"Mar"},
	{"Apr"},
	{"May"},
	{"Jun"},
	{"Jul"},
	{"Aug"},
	{"Sep"},
	{"Oct"},
	{"Nov"},
	{"Dec"}
};

new MaxSeats[212] = {
	4,2,2,2,4,4,1,2,2,4,2,2,2,4,2,2,4,2,4,2,4,4,2,2,2,1,4,4,4,2,1,9,1,2,2,1,2,9,4,2,
	4,1,2,2,2,4,1,2,1,6,1,2,1,1,1,2,2,2,4,4,2,2,2,2,2,2,4,4,2,2,4,2,1,1,2,2,1,2,2,4,
	2,1,4,3,1,1,1,4,2,2,4,2,4,1,2,2,2,4,4,2,2,2,2,2,2,2,2,4,2,1,1,2,1,1,2,2,4,2,2,1,
	1,2,2,2,2,2,2,2,2,4,1,1,1,2,2,2,2,0,0,1,4,2,2,2,2,2,4,4,2,2,4,4,2,1,2,2,2,2,2,2,
	4,4,2,2,1,2,4,4,1,0,0,1,1,2,1,2,2,2,2,4,4,2,4,1,1,4,2,2,2,2,6,1,2,2,2,1,4,4,4,2,
	2,2,2,2,4,2,1,1,1,4,1,1
};

new aVehicleNames[212][17] = {
    "Landstalker", "Bravura", "Buffalo", "Linerunner", "Perrenial", "Sentinel",
	"Dumper", "Firetruck", "Trashmaster", "Stretch", "Manana", "Infernus",
	"Voodoo", "Pony", "Mule", "Cheetah", "Ambulance", "Leviathan", "Moonbeam",
    "Esperanto", "Taxi", "Washington", "Bobcat", "Whoopee", "BF Injection",
	"Hunter", "Premier", "Enforcer", "Securicar", "Banshee", "Predator", "Bus",
	"Rhino", "Barracks", "Hotknife", "Trailer", "Previon", "Coach", "Cabbie",
	"Stallion", "Rumpo", "RC Bandit", "Romero", "Packer", "Monster", "Admiral",
	"Squalo", "Seasparrow", "Pizzaboy", "Tram", "Trailer", "Turismo", "Speeder",
	"Reefer", "Tropic", "Flatbed", "Yankee", "Caddy", "Solair", "Berkley's RC Van",
	"Skimmer", "PCJ-600", "Faggio", "Freeway", "RC Baron", "RC Raider", "Glendale",
	"Oceanic","Sanchez", "Sparrow", "Patriot", "Quad", "Coastguard", "Dinghy",
	"Hermes", "Sabre", "Rustler", "ZR-350", "Walton", "Regina", "Comet", "BMX",
	"Burrito", "Camper", "Marquis", "Baggage", "Dozer", "Maverick", "News Chopper",
	"Rancher", "FBI Rancher", "Virgo", "Greenwood", "Jetmax", "Hotring Racer A", "Sandking",
	"Blista Compact", "Police Maverick", "Boxville", "Benson", "Mesa", "RC Goblin",
	"Hotring Racer B", "Hotring Racer C", "Bloodring Banger", "Rancher", "Super GT",
	"Elegant", "Journey", "Bike", "Mountain Bike", "Beagle", "Cropduster", "Stunt",
 	"Tanker", "Roadtrain", "Nebula", "Majestic", "Buccaneer", "Shamal", "Hydra",
 	"FCR-900", "NRG-500", "HPV1000", "Cement Truck", "Tow Truck", "Fortune",
 	"Cadrona", "FBI Truck", "Willard", "Forklift", "Tractor", "Combine", "Feltzer",
 	"Remington", "Slamvan", "Blade", "Freight", "Streak", "Vortex", "Vincent",
    "Bullet", "Clover", "Sadler", "Firetruck", "Hustler", "Intruder", "Primo",
	"Cargobob", "Tampa", "Sunrise", "Merit", "Utility", "Nevada", "Yosemite",
	"Windsor", "Monster", "Monster", "Uranus", "Jester", "Sultan", "Stratum",
	"Elegy", "Raindance", "RC Tiger", "Flash", "Tahoma", "Savanna", "Bandito",
    "Freight Flat", "Streak Carriage", "Kart", "Mower", "Dune", "Sweeper",
	"Broadway", "Tornado", "AT-400", "DFT-30", "Huntley", "Stafford", "BF-400",
	"News Van", "Tug", "Trailer", "Emperor", "Wayfarer", "Euros", "Hotdog", "Club",
	"Freight Box", "Trailer", "Andromada", "Dodo", "RC Cam", "Launch", "Police Car",
 	"Police Car", "Police Car", "Police Ranger", "Picador", "S.W.A.T", "Alpha",
 	"Phoenix", "Glendale", "Sadler", "Luggage", "Luggage", "Stairs", "Boxville",
 	"Tiller", "Utility Trailer"
};

#define GetVehicleName(%0) \
	aVehicleNames[%0-400]

new VehicleSpeed[212] = {
	149,139,176,104,125,155,104,140,94,149,122,209,159,104,100,181,145,127,109,141,137,145,132,93,128,
	191,164,156,148,190,100,123,89,104,158,-1,141,149,135,159,128,71,131,119,104,155,140,126,106,169,-1,
	182,141,58,115,119,100,90,138,128,128,151,105,136,33,33,139,132,136,122,148,104,110,94,141,163,200,
	176,111,132,174,68,148,116,52,94,60,168,143,132,148,141,132,
	168,203,166,153,168,115,116,132,33,203,203,163,132,169,156,102,74,95,111,120,138,
	113,126,148,148,155,155,258,150,166,142,123,151,149,141,166,141,57,66,104,157,159,
	149,163,-1,-1,94,141,191,155,142,140,139,141,135,138,145,137,148,114,173,136,149,
	104,104,147,168,159,145,168,120,83,155,151,163,138,-1,-1,88,58,104,57,149,140,220,
	123,149,144,101,115,66,-1,144,132,155,102,153,-1,-1,248,130,57,104,166,166,166,149,
	142,104,160,162,139,142,-1,-1,-1,102,-1,-1
};

#define GetVehicleMaxSpeed(%0) VehicleSpeed[%0 - 400]

new Float: DealerPos[][4] = {
{1405.0984,415.4435,19.4849,246.9957},
{1403.6899,412.1470,19.4849,246.7677},
{1402.2129,408.8553,19.4849,247.1078},
{1400.7917,405.5101,19.4849,246.0850},
{1399.2909,402.1404,19.4849,247.1739},
{1397.8290,398.7474,19.4849,247.4229},
{1396.5308,395.5943,19.4849,248.5409},
{1395.0183,392.0527,19.4849,247.9657},
{1393.6790,388.7544,19.4849,247.5433},
{1392.2509,385.4380,19.4849,247.7128},
{1390.8247,382.1699,19.4849,246.5295},
{1389.3717,378.8576,19.4849,247.4290},
{1387.8962,375.5693,19.4849,246.5243},
{1386.6401,372.0967,19.4849,246.1813},
{1406.4952,418.8509,19.4941,248.1805}};

new RainBowColor[] = {
121,80,78,181,182,183,158,222,216,231,61,228,6,219,6,194,197,145,154,241,226,229,86,234,187,
189,44,4,75,53,101,95,20,207,255,247,87,108,106,209,210,146,176,178,232,167,144,176,171,179,242,
249,248,132,43,45,17,18,21,117,132,212,3};

new Float: DebugVehiclePos[25][4] = {
	{2351.3159,1426.6182,42.4145,90.1961}, {2351.4988,1458.5642,42.4115,90.9255}, {2351.5740,1476.5250,42.4142,89.3575}, {2350.6602,1490.8728,42.4139,88.0856},
	{2351.2893,1501.6780,42.4159,89.5225}, {2304.0913,1480.2258,42.4137,268.5501}, {2303.4453,1469.0807,42.4163,269.7914}, {2302.8379,1454.9117,42.4161,270.1384},
	{2303.4622,1444.0762,42.4165,268.6113}, {2303.5352,1433.6550,42.4162,267.8173}, {2302.9299,1423.0050,42.4158,269.7962}, {2302.4128,1408.6564,42.4162,270.6510},
	{2305.8713,1518.4023,42.4163,178.1372}, {2292.3945,1517.0354,42.4161,180.7206}, {2282.2200,1517.7186,42.4159,180.2413}, {2263.7576,1494.1567,41.8289,267.9474},
	{2263.7375,1486.8702,41.3634,267.1010}, {2263.0002,1476.1489,40.6822,271.7399}, {2263.0007,1465.7554,40.0218,270.8918}, {2263.1274,1451.1766,39.0838,270.6634},
	{2263.3809,1440.8661,38.4225,270.5549}, {2263.6807,1429.8658,37.7197,275.7422}, {2263.0798,1419.0807,37.0272,271.0423}, {2263.1655,1408.2490,36.3347,270.4751},
	{2262.8242,1398.8114,36.0118,315.0721}
};
new Float:InteriorPos[36][3] = {
	{223.0797, 1287.7438, 1082.1406},{2282.7927, -1139.3999, 1050.8984},{328.0025, 1478.5465, 1084.4375},{-42.5438, 1406.3199, 1084.4297},{300.8615, 309.8871, 1003.3047},
	{2308.8101, -1212.2432, 1049.0234},{2233.6196, -1114.5808, 1050.8828},{2259.8242, -1135.7554, 1050.6328},{2217.8169, -1076.1425, 1050.4844},{267.1584, 305.2281, 999.1484}, // small
	{244.1047, 304.9235, 999.1484}, {235.4070, 1187.3690, 1080.2578}, {490.8654, 1399.1970, 1080.2578},{24.0680, 1340.5543, 1084.3750},{-283.9743, 1471.1327, 1084.3750},
	{-261.2778, 1456.7443, 1084.3672},{83.0025, 1322.8451, 1083.8662},{2317.9451, -1026.1736, 1050.2178},{2496.0198, -1692.6827, 1014.7422},{2196.0349, -1204.3772, 1049.0234},
	{376.2806, 1417.5321, 1081.3281},{2269.6677, -1210.3624, 1047.5625},{447.3249, 1397.5758, 1084.3047},{386.5427, 1471.8826, 1080.1875},{22.8908, 1403.7777, 1084.4297},
	{2365.3372, -1134.8403, 1050.8750},{2237.6023, -1080.8840, 1049.0234},{295.0533, 1473.0192, 1080.2578},{221.9701, 1140.8445, 1082.6094},{-68.7771, 1351.9674, 1080.2109},
	{260.8823, 1237.9570, 1084.2578},{2468.4509, -1698.2510, 1013.5078},{140.1820, 1366.4713, 1083.8594}, // medium
	{225.6624, 1022.0758, 1084.0159},{234.2033, 1064.1516, 1084.2117},{226.7048, 1114.2527, 1080.9950} // big
};
new GetHouseInterior[36] = {1, 11, 15, 8, 4, 6, 5, 10, 1, 2, 1, 3, 2, 10, 15, 4, 9, 9, 3, 6, 15, 10, 2, 15, 5, 8, 2, 15, 4, 6,   9, 2, 5, 7, 6, 5};

new Float:bInteriorPos[MAX_BIZZ_TYPE][3] = {
	{2305.0696,-15.9066,26.7422}, {285.6762,-86.3199,1001.5229}, {493.3968,-24.8437,1000.6797}, {-100.3542,-25.0326,1000.7188},
	{-25.9517,-187.7610,1003.5469}, {204.3436,-168.8603,1000.5234}, {363.0403,-75.3009,1001.5078}, {2019.07, 1017.8, 996.936}, {0.0, 0.0, 0.0},
	{0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}, {377.0789,-193.0619,1000.6401}, {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}, {502.0427,-68.4343,998.7578}
};


new bInteriors[MAX_BIZZ_TYPE] = {0, 4, 17, 3, 17, 14, 10, 10, 0, 0, 0, 17, 0, 0, 11};

new bMapIcons[MAX_BIZZ_TYPE] = {52, 18, 48, 38, 17, 45, 10, 25, 16, 27, 63, 29, 51, 23, 21};

new Float: DMV[15][3] = {
	{2296.4993,-75.9268,26.0630},
	{2296.1919,-34.8736,26.0630},
	{2296.1553,23.8091,26.0630},
	{2268.2104,44.0222,26.0630},
	{2229.3088,44.1736,26.0632},
	{2226.1101,59.7193,26.0642},
	{2226.2090,105.5077,26.0656},
	{2246.8420,139.6437,26.0630},
	{2283.5759,139.1176,26.0630},
	{2291.6794,115.8753,26.0663},
	{2291.7854,73.3461,26.0645},
	{2291.9998,22.9953,26.0644},
	{2291.6865,-24.5199,26.0629},
	{2291.3203,-69.9259,26.0630},
	{0.0, 0.0, 0.0}
};
new RadioNames[][180] = {
	{"{FF0000}Opreste radio-ul"},
	{"Pro FM Romania"},
	{"Radio Bandit Romania"},	
	{"Radio Taraf Romania"},	
	{"Radio Hot Romania"},	
	{"Dubstep.fm"},
	{"Radio Hit Romania"},
	{"Radio ClubMix Romania"},
	{"Radio Popular"},	
	{"Trap.FM"},
	{"Rock FM"},
	{"PirateFM Rap"},
	{"Radio Vocea Strazii"},
	{"Radio Traditional HIP HOP"},
	{"Hot 108 Jamz"},
	{"Radio Coxet"}
};

new RadioLink[][180] = {
	{""},
	{"http://edge126.rdsnet.ro:84/profm/profm.mp3"},
	{"http://live.radiobandit.ro:8000"},	
	{"http://radiotaraf.com/live.m3u"},	
	{"http://live.radiohot.ro:8000/"},	
	{"http://dubstep.fm/128.pls"},
	{"http://www.radio-hit.ro/asculta.m3u"},
	{"http://live.radioclubmix.ro:9999"},
	{"http://livemp3.radiopopular.ro:7777"},	
	{"http://radio.trap.fm/listen128.pls"},	
	{"http://80.86.106.143:9128/rockfm.aacp"},
	{"http://live.piratefm.ro:1200"},
	{"http://radio.voceastrazii.net:8012"},
	{"http://traditionalhiphop.zapto.org:7500/listen.pls"},
	{"http://sc.hot108.com:4020/listen.pls"},
	{"http://37.59.207.68:8000/"}
};


new Float: TrasherPos[10][3] = {
	{2863.3230,945.8920,12.0000},
	{2210.3486,680.0610,11.4609},
	{2178.3223,1418.6080,9.8694},
	{2190.1489,2792.4800,10.1897},
	{2809.7712,2581.1309,10.3508},
	{1636.1024,892.0575,10.3508},
	{1464.2960,1081.3604,10.3508},
	{1004.6572,1068.3293,9.9519},
	{2579.5122,2081.1807,10.5111},
	{1975.3907,713.1276,10.4792}
};
 
new Float:trucker_pos[][] = {
{2059.9033,2217.2249,10.8203},
{2617.1277,1824.4362,10.8203},
{1359.2782,252.5085,19.5669},
{1826.3510,-1681.6780,13.382},
{2420.2671,-1230.6228,24.667},
{449.2548,-1494.6381,30.9365},
{776.1931,-1348.3062,13.5307},
{1285.1868,177.0179,20.3234},
{1609.3556,2193.4722,10.8203},
{2571.4592,2054.4880,10.8203},
{2121.7175,941.2410,10.8203},
{2368.7375,-1519.6351,23.828}};

new Float:TruckerNext[][] = {
{2040.4932,2264.3284,10.8203},
{2577.1011,1846.1294,10.8203},
{1344.7921,303.8000,19.4063},
{1806.9121,-1639.7052,13.533},
{2401.3840,-1254.0442,23.823},
{401.0994,-1475.6062,31.0782},
{781.9129,-1408.7883,13.3741},
{1247.7827,161.3378,19.4933},
{1565.2225,2190.4114,10.6719},
{2512.7288,2055.7083,10.7680},
{2130.1133,974.9407,10.6719},
{2339.9763,-1542.8308,23.834}};


new Float: JailPos[24][3] = {
	// jail
	{265.2342,78.4286,1001.0391},
	{265.3771,76.5080,1001.0391},
	{263.0977,76.3467,1001.0391},
	{263.1393,78.5119,1001.0391},
	{265.1805,83.4474,1001.0391},
	{265.4785,80.9231,1001.0391},
	{263.3160,80.7913,1001.0391},
	{263.1938,82.9882,1001.0391},
	{265.5486,87.7908,1001.0391},
	{265.6978,85.6035,1001.0391},
	{263.5632,85.2024,1001.0391},
	{263.2186,87.7868,1001.0391},

	// dm
	{214.8246,111.6730,999.0156},
	{216.0119,109.0412,999.0156},
	{213.9750,108.0798,999.0156},
	{216.4942,110.8989,999.0156},
	{218.9126,108.1308,999.0156},
	{220.2675,108.5397,999.0156},
	{222.1945,111.6974,999.0156},
	{224.0020,110.7267,999.0156},
	{224.1538,108.2810,999.0156},
	{227.4011,109.8425,999.0156},
	{226.1564,109.1801,999.0156},
	{228.4095,111.0158,999.0156}
};

new 
	Neon[6][13] = {{"White"}, {"Yellow"}, {"Green"}, {"Blue"}, {"Pink"}, {"Red"}},
	NeonColor[6][10] = {{"{FFFFFF}"}, {"{FFFF00}"}, {"{00FF00}"}, {"{0000FF}"}, {"{E400FF}"}, {"{FF0000}"}},
	NeonObj[1][6] = {{18652, 18650, 18649, 18648, 18651, 18647}}
;

new Float: GunPosOld[9][6] = {
	{292.71173, -82.68597, 1001.22534, 78.95998, 0.60000, 101.46000},
	{292.67740, -83.44988, 1001.24731, -642.59790, -671.09875, -318.59985},
	{292.68317, -84.16372, 1001.26935, -634.61823, -670.67883, -324.29971},
	{302.78961, -86.68270, 1004.10211, 0.00000, 0.00000, 185.82004},
	{301.49176, -86.71217, 1004.09442, 0.00000, 0.00000, 184.19981},
	{299.91629, -86.69798, 1004.18915, 0.00000, 0.00000, -175.20009},
	{302.91077, -86.68332, 1003.39264, 0.00000, 0.00000, -173.40002},
	{301.65106, -86.69447, 1003.53815, 0.00000, 0.00000, 184.44003},
	{300.08124, -86.78426, 1003.44232, -52.02003, -61.01999, 20.88000}
};

new Float: GunPosNew[9][6] = {
	{292.75815, -82.61155, 1001.70483, 9.89995, -13.92001, 101.46000},
	{292.76367, -83.33363, 1001.76208, 9.90000, -13.92000, 101.46000},
	{292.68320, -84.16370, 1001.76208, 9.90000, -13.92000, 101.46000},
	{302.76849, -85.92348, 1004.16302, 0.00000, 0.00000, 185.82004},
	{301.52216, -85.91167, 1004.16193, 0.00000, 0.00000, 184.19981},
	{299.88614, -85.91948, 1004.25793, 0.00000, 0.00000, -175.20009},
	{302.87677, -85.95914, 1003.50171, 0.00000, 0.00000, -173.40002},
	{301.64154, -85.86485, 1003.69489, 0.00000, 0.00000, 184.44003},
	{300.10892, -85.90157, 1003.55267, -52.02003, -61.01999, 20.88000}
};

new GunModel[1][9] = {
	{346, 347, 348, 349, 355, 356, 353, 352, 336}
};

new GunsType[3][9] = {
	{22, 23, 24, 25, 30, 31, 29, 28, 5}, 
	{50, 85, 100, 200, 75, 500, 10, 50, 50},
	{30, 30, 25, 20, 70, 70, 50, 50, 1}
};

new StoreGunsName[9][10] = {
	{"9MM"}, {"Silenced"}, {"Deagle"},
	{"Shotgun"}, {"AK-47"}, {"M4"},
	{"MP5"}, {"Uzi"}, {"Baseball"}
};

new Float: coleziuni[11][4] = {
	{-2424.9158,1025.5540,50.3977, 30.0},
	{-2424.8479,1023.9045,50.3977, 60.0},
	{-1904.8621,282.1388,40.7740, 60.0},
	{1974.3529,2162.3164,10.7988, 60.0},
	{-2665.4451,267.9613,4.3359, 30.0},
	{-96.0639,70.0149,3.1172, 150.0},
	{2518.2632,2791.8411,10.8203, 30.0},
	{-1021.6261,-627.3395,32.0078, 75.0},
	{1025.6401,-1029.5603,32.1016, 30.0},
	{488.3247,-1735.5133,11.1388, 30.0},
	{1376.7445,189.0976,19.5742, 30.0}
};

new GunSetModel[5][5] = {
	{24, 31, 32, 27, 33},
	{30, 200, 150, 30, 20},
	{150, 200, 130, 200, 500},
	{1000, 700, 340, 1000, 3000},
	{1, 1, 1, 2, 3}
};

new TeamColors[MAX_FACTIONS + 1] = {0xFFFFFFFF, 0x2E2EFEFF, 0x0101DFFF, 0x656565FF, 0x2ECCFAFF, 0xFFFF00FF, 0xFA5858FF, 0x82FA58FF, 0xDA65FFFF, 0xB82525FF, 0xFFABFCFF, 0x1E388BFF, 0x33C847FF};

// rc_arena
new Float:PaintballSpawns[7][3] = {
	{-973.6214,1025.1903,1345.0475},{-973.1999,1095.4812,1344.9856},{-1032.6256,1078.1367,1343.2416},{-1054.3453,1025.1804,1343.1748},
	{-1088.7957,1038.0369,1343.3666},{-1131.7955,1023.3311,1345.7217},{-1132.3667,1093.1659,1345.7927}
};
// farm
new Float:PaintballSpawns2[7][3] = {
	{-136.8825, -70.0581, 3.2065},{-98.5009, -31.0434, 3.2065},{-82.4544, 24.8792, 3.2957},
	{43.7600, 35.2099, 2.5184},{-6.8738, 91.7253, 3.1657},{-57.5785, 117.1301, 3.2078},
	{-217.7475, -25.7134, 3.3158}
};

// island
new Float:PaintballSpawns3[7][3] = {
	{1394.5992, 2784.1523, 11.1936},{1317.0734, 2852.8516, 10.8923},{1280.4998, 2738.1919, 10.9092},{1147.8285, 2788.3435, 11.0812},
	{1143.5356, 2751.1782, 11.2707},{1259.3728, 2786.4995, 10.9397},{1354.5094, 2738.2000, 10.8767}
};
// desert
new Float:PaintballSpawns4[7][3] = {
	{-745.0526, 1580.3075, 27.0509},{-774.2742, 1530.0056, 27.1533},{-805.3869, 1436.9856, 13.9201},{-725.0034, 1542.5139, 39.4333},
	{-766.1290, 1625.1650, 27.2306},{-885.7818, 1476.7595, 24.8592},{-797.1280, 1557.1274, 27.2289}
};
// beach
new Float:PaintballSpawns5[7][3] = {
	{507.8840, -1887.1956, 3.3077},{571.3418, -1871.5217, 4.4363},{609.7338, -1837.2462, 5.9157},{681.5817, -1863.5522, 5.3781},
	{611.6556, -1881.2391, 4.0900},{470.7314, -1821.2793, 5.6802},{585.5042, -1800.3372, 6.2130}
};

new Float:PaintballSpawns6[7][3] = {
	{-527.5182,-98.1491,63.2969},{-442.8741,-59.8322,59.1411},{-465.7904,-178.1876,78.0874},{-534.7496,-177.6923,78.4047},
	{-593.2002,-110.6649,67.4507},{-485.6090,-87.7349,60.8669},{-573.0599,-89.7404,64.4440}
};

new Float: WeedPos[9][3] = {
	{-1056.0109,-1624.0878,76.3672}, {-1050.8303,-1626.6648,76.3672}, {-1049.5865,-1632.8793,76.3672}, 
	{-1054.1381,-1636.2601,76.3672}, {-1054.8422,-1632.0072,76.3672}, {-1057.6619,-1628.2346,76.3672}, 
	{-1054.1534,-1630.4905,76.3672}, {-1054.0771,-1625.3021,76.3672}, {-1051.3802,-1623.7037,76.3739}
};