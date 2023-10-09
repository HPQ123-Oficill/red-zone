task OneSeconds[100]() {
	foreach(new playerid : s_Players) {
		switch(player_selected[playerid]) {
			case 12: {
				if !_PC[playerid][_count] *then continue;
				_PC[playerid][_count]--;
				new x=_PC[playerid][_count]%12;

				if _PC[playerid][_show] *then
					TextDrawShowForPlayer(
						playerid, 
						PCTD_INT[x+4]
					);

				else TextDrawHideForPlayer(
						playerid, 
						PCTD_INT[x+4]
					);

				if(!x) _PC[playerid][_show]=!_PC[playerid][_show];
				if !_PC[playerid][_count] *then {
					show_PC_main(playerid);
					Iter_SafeRemove(s_Players, playerid, playerid);
				}
			}
		}
	}
	return RulettStatus!=2?1:OnRoulettaUpdate();
}
task OneTimer[300]() {
	if(RulettStatus == 3) OnRoulettaUpdate();
	foreach(new i : Rainbows[1]) {
		ChangeRainbowColors(i);
	}
	return true;
}

task TwoTimer[600]() {
	if(RulettStatus == 4) OnRoulettaUpdate();
	foreach(new i : Rainbows[2]) ChangeRainbowColors(i);
	foreach(new i : PlayerCrates) {
		PlayerVar[i][CrateTime]--;
		UpdateCrate(i);
		if(!PlayerVar[i][CrateTime]) Iter_SafeRemove(PlayerCrates, i, i);
	}
	return true;
}

GetPlayerFPS(playerid) return PlayerVar[playerid][FPSS];

ptask p_timers[1000](i) {
	new times=gettime(),day, month, year, hour, minute, second,Float:health;
	gettime(hour, minute, second),getdate(year, month, day);
	GetPlayerHealth(i, health);
	new Float:px,Float:py,Float:pz;
	GetPlayerPos(i, px, py, pz);
	if(!IsPlayerLogged(i)) {
		if(PlayerVar[i][ServerTimer][1] != 0) {
			PlayerVar[i][ServerTimer][1] --;
			if(PlayerVar[i][ServerTimer][1] <= 0) {
				switch(PlayerVar[i][ServerTimer][0]) {
					case 1: CheckBanStatus(i), PlayerVar[i][ServerTimer][0] = 0;
					case 2: SCM(i, COLOR_RED, "You got kicked for not logging in 90 seconds."), KickEx(i), PlayerVar[i][ServerTimer][0] = 0;
					case 3: LoadRegister(i);
				}
			}
			return true;
		} 
		if(Iter_Count(LoginQueue[0]) < MAX_LOGIN && !Iter_Contains(LoginQueue[0], i)) Iter_Add(LoginQueue[0], i), CheckBanStatus(i);
		else PlayerLoginQueue(i);
		return true;
	}
	if IsPlayerInAnyVehicle(i) *then PlayerTextDrawSetString(i, SpeedometerPTD[i][4], _valstr(GetVehicleSpeed(GetPlayerVehicleID(i))));
	HackSystem(i);
	LastSpeed[i] = GetVehicleSpeed(GetPlayerVehicleID(i));

	if(PlayerInfo[i][pMute] != 0) {
		PlayerInfo[i][pMute] --;
		if(PlayerInfo[i][pMute] == 0) SCM(i, COLOR_GREY, "You have now been automatically unmuted."), UpdateVar(i, "Mute", 0);
	}
	if(GetPlayerDrunkLevel(i) < 100) SetPlayerDrunkLevel(i, 2000);
	else if(PlayerVar[i][DRL] != GetPlayerDrunkLevel(i)) PlayerVar[i][FPSS]=PlayerVar[i][DRL]-(PlayerVar[i][DRL]=GetPlayerDrunkLevel(i));

	if(!WeaponFrist(GetPlayerWeapon(i)) && GetPlayerSurfingVehicleID(i) != INVALID_VEHICLE_ID) SetPlayerArmedWeapon(i, 0), SCM(i, COLOR_RED, "Nu poti folosi arme pe masina.");
	if(PlayerInfo[i][pHud][0]) format(gString, 20, "~y~%d", GetPlayerFPS(i)), PlayerTextDrawSetString(i, FPS, gString);
	if(PlayerStoned[i] >= 2 ) {
		new Float: ang; GetPlayerFacingAngle(i, ang );
		if(IsPlayerInAnyVehicle(i) && GetPlayerState(i) == PLAYER_STATE_DRIVER) SetVehicleZAngle(GetPlayerVehicleID(i), random(100)<50?ang-RandomEx(15, 30):ang+RandomEx(15, 30)), SetPlayerDrunkLevel(i, 5000);
		else SetPlayerDrunkLevel(i, 5000);
	}
	if(PlayerInfo[i][pMember] != 0 && PlayerInfo[i][pRank] < 6) CheckFactionRaport(i);

	if(timeDMG[i]) {
		if(!_:--timeDMG[i]) {
			if(total_demage[i]>0.0) {
				TextDrawHideForPlayer(i, dmgInfoTD[2]);
				TextDrawHideForPlayer(i, dmgInfoTD[3]);
				PlayerTextDrawHide(i, dmgInfoPTD[2]);
				PlayerTextDrawHide(i, dmgInfoPTD[3]);
				total_demage[i] = 0;
			}
			if(total_take[i]>0.0) {
				TextDrawHideForPlayer(i, dmgInfoTD[0]);
				TextDrawHideForPlayer(i, dmgInfoTD[1]);
				PlayerTextDrawHide(i, dmgInfoPTD[0]);
				PlayerTextDrawHide(i, dmgInfoPTD[1]);
				total_take[i] = 0;
			}
		}
	}

	if(PlayerVar[i][MoneyShow] <= times) PlayerTextDrawHide(i, MoneyTD), MoneyAd[i]=0,MoneyTy[i]=false;
	if(PlayerVar[i][HideTD] <= times) {
		PlayerTextDrawHide(i, InfoPTD);
		TextDrawHideForPlayer(i, InfoBoxTD);
		TextDrawHideForPlayer(i, InfoTD);
	}
	if(IsPlayerInAnyVehicle(i) && GetVehicleSpeed(GetPlayerVehicleID(i)) < 10 && !PNStage[i] && pnsType[i]!=-1) {
		if(GetPlayerCash(i) > 100) {
			TogglePlayerControllable(i, false);
			switch(pnsType[i]) {
				case 0: {
					MovePlayerObject(i, pnsdoor[i][0], 1380.387329, 197.759963, 20.424699, 1.0, 0.000000, 0.299880, 66.199958); // inchis
					InterpolateCameraPos(i, 1382.140625, 201.840850, 21.269355, 1385.781616, 209.751266, 23.887695, 2000);
					InterpolateCameraLookAt(i, 1380.145874, 197.395324, 20.147626, 1383.780273, 205.418670, 22.396562, 2100);
				}
				case 1: {
					MovePlayerObject(i, pnsdoor[i][1], 2303.675292, 74.816856, 27.374382, 1.0, 0.000000, 0.000000, 0.000000); // inchis
					InterpolateCameraPos(i, 2297.126220, 74.663131, 28.836862, 2289.655029, 74.438613, 31.232313, 2000);
					InterpolateCameraLookAt(i, 2301.913330, 74.806999, 27.400671, 2294.443359, 74.530113, 29.796121, 2100);
				}
			}
			SetTimerEx("PNS", 4000, false, "d",i);
			PNStage[i] = true;
		} else GameTextForPlayer(i, "~b~~h~~h~~h~no more freebies~n~$100 to respray!", 5000, 3);
	}
	if(PlayerVar[i][IsPhone] != -1 && PlayerVar[i][IsCell]) {
		PlayerInfo[i][pCredit] --;
		if(PlayerInfo[i][pCredit] == 0) {
			format(gString, 65, "Apel terminat, %s nu are credit suficient.", GetName(i));
			SCM(PlayerVar[i][IsPhone], COLOR_YELLOW, gString);
			RemovePlayerAttachedObject(PlayerVar[i][IsPhone], 4);
			SetPlayerSpecialAction(PlayerVar[i][IsPhone], SPECIAL_ACTION_STOPUSECELLPHONE);
			RemovePlayerAttachedObject(i, 4);
			SetPlayerSpecialAction(i, SPECIAL_ACTION_STOPUSECELLPHONE);
			PlayerVar[i][IsCell] = false;
			PlayerVar[PlayerVar[i][IsPhone]][IsCell] = false;
			PlayerVar[PlayerVar[i][IsPhone]][IsPhone] = -1;
			PlayerVar[i][IsPhone] = -1;
			SCM(i, COLOR_GREY, "You don't have enough credit.");
		}
	}
	switch PlayerInfo[i][pTut] do {
		case 1: {
			if TimeTut[i] *then {
				if !_:--TimeTut[i] *then {
					switch TimeType[i] do {
						case 0: {
							InterpolateCameraPos(i, 2401.361083, 94.048385, 42.225601, 2395.097900, 90.583190, 124.085746, 5000);
							InterpolateCameraLookAt(i, 2401.742431, 94.259384, 37.244628, 2395.484863, 90.783683, 119.104774, 5000);
							TimeTut[i] = 5;
						}
						case 1: {
							InterpolateCameraPos(i, 2395.097900, 90.583190, 124.085746, 2283.273681, -69.606307, 106.390655, 5000);
							InterpolateCameraLookAt(i, 2395.484863, 90.783683, 119.104774, 2283.709472, -69.605628, 101.409683, 5000);
							TimeTut[i] = 5;
						}
						case 2: {
							SCM(i, -1, ""), SCM(i, -1, ""), SCM(i, -1, "");
							SCM(i, COLOR_GREY, "Aici se afla DMV-ul server-ului. Tasteaza comanda /exam pentru a obtine permisul de conducere auto al vehiculelor.");
							SCM(i, COLOR_GREY, "Nu sti cum sa ajungi aici? Nicio problema, un checkpoint ti-a fost plasat pe minimap.");
							SCM(i, COLOR_GREY, "Licenta auto expira dupa 30 zile si va trebui sa dai examenul din nou pentru a o redobandi.");
							SCM(i, -1, ""), SCM(i, -1, "");
							InterpolateCameraPos(i, 2283.273681, -69.606307, 106.390655, 2286.756103, -78.147125, 29.637048, 5000);
							InterpolateCameraLookAt(i, 2283.709472, -69.605628, 101.409683, 2291.076660, -75.842987, 28.624877, 5000);
							TimeTut[i] = 8;
							TogglePlayerControllable(i, true);
						}
						case 3: {
							SetCameraBehindPlayer(i);
							ShowPlayerTutorial(i);
						}
					}
					++TimeType[i];
				}
			}
		} 
		case 2: {
			if TimeTut[i] *then {
				if !_:--TimeTut[i] *then {
					SetCameraBehindPlayer(i);
					ShowPlayerTutorial(i);
					TogglePlayerControllable(i, true);
				}
			}
			PlayerVar[i][IsPickup] = BizzInfo[tut_store][bPickupid];
		}
		case 3: {
			if TimeTut[i] *then {
				if !_:--TimeTut[i] *then {
					switch TimeType[i] do {
						case 0: {
							InterpolateCameraPos(i, 2319.884277, -87.760520, 103.749603, 2269.768798, 94.345214, 80.721633, 5000);
							InterpolateCameraLookAt(i, 2319.908203, -88.222915, 98.771087, 2269.755615, 93.909637, 75.740661, 5000);							
							TimeTut[i]=5;
						}
						case 1: {
							InterpolateCameraPos(i, 2269.768798, 94.345146, 80.721641, 2282.374511, 99.208457, 36.223052, 5000);
							InterpolateCameraLookAt(i, 2269.768310, 93.909370, 75.740669, 2280.294189, 95.388053, 33.757934, 5100);
							TimeTut[i]=10;
						}
						case 2: {
							SetCameraBehindPlayer(i);
							ShowPlayerTutorial(i);
							TogglePlayerControllable(i, true);
						}
					}
					++TimeType[i];
				}
			}
			PlayerVar[i][IsPickup] = BizzInfo[tut_clothes][bPickupid];
		}
	}
	if(InWar[PlayerInfo[i][pMember]] != -1) PlayerWar(i, day, month, year, hour, minute);
	if(GetPlayerWeapon(i) == 24 && PlayerVar[i][IsBizz] != 0 && !IsCop(i)) {
		new actor = GetPlayerTargetDynamicActor(i);
		if(actor != 0 && !RobStatus[i] && PlayerInfo[i][pRobExp] >= 10 && PlayerInfo[i][pWanted] < 6) {
			ShowChat(i, 10, "Jaful a inceput!");
			ApplyDynamicActorAnimation(actor, "PED", "handsup", 4.1, 0, 0, 0, true, 0);
			LoopingAnim(i, "SHOP", "ROB_Loop_Threat", 4.0, 1, 0, 0, 0, 0);
			RobTimer[i] = 5;
			RobStatus[i] = 2;
			PlayerInfo[i][pRobExp] -= 10;
			UpdateVar(i, "RobExp", PlayerInfo[i][pRobExp]);
			RobActor[i] = actor;
			RobCamera(i);
		}
	}
	if(RobTimer[i] != 0) {
		RobTimer[i] --;
		if(RobTimer[i] == 0) {
			switch(RobStatus[i]) {
				case 2: {
					RobTimer[i] = 3;
					ApplyDynamicActorAnimation(RobActor[i], "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0);
					RobStatus[i] ++;
				}
				case 3: {
					RobTimer[i] = 4;
					ApplyDynamicActorAnimation(RobActor[i], "DEALER", "DEALER_DEAL", 4.0, 0, 0, 0, 0, 0);
					RobStatus[i] ++;
				}
				case 4: {
					RobTimer[i] = 7;
					ClearAnimations(i);
					SetPlayerAttachedObject(i, 0, 1550, 1, 0.024558, -0.279748, -0.060589, 6.105677, 137.291320, 147.132202, 1.019888, 1.000000, 1.000000);
					RobBackpack[i] = true;
					ApplyDynamicActorAnimation(RobActor[i], "ped", "cower", 3.0, 1, 0, 0, 0, 0);
					ShowChat(i, 10, "Acum trebuie sa ascunzi ~g~banii ~w~~h~la locul de pe ~r~minimap~w~~h~.");
					SetCameraBehindPlayer(i);
					new h = 1+random(SqlHouses);
					SetPlayerCheckpointEx(i, CP_ROB, HouseInfo[h][hEnterPos][0], HouseInfo[h][hEnterPos][1], HouseInfo[h][hEnterPos][2], 3.0);
					RobStatus[i] ++;
					checkBP(i, 6, 500);
				}
				case 5: {
					SetPlayerWanted(i, 6);
					RobTimer[i] = 60;
					RobStatus[i] ++;
				}
				case 6: ApplyDynamicActorAnimation(RobActor[i], "DEALER","DEALER_IDLE",4.0,1,0,0,0,0), RobStatus[i]=RobTimer[i]=0;	
			}
		}
	}
	if(PlayerVar[i][FishTimer] != 0) {
		PlayerVar[i][FishTimer] --;
		switch(PlayerVar[i][FishTimer]) {
			case 6: GameTextForPlayer(i, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~You are fishing now~n~~w~~h~Waiting...", 3000, 3);
			case 2: GameTextForPlayer(i, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~You are fishing now~n~~w~~h~Waiting...", 3000, 3);
			case 0: GiveFish(i);
		}
	}
	if(TradeTime[i] > 0) {
		TradeTime[i] --;
		new id = PlayerVar[i][IsTrade];
		format(gString, 20, "00:0%d", TradeTime[i]);
		PlayerTextDrawSetString(i, TradePTD[i][6], gString);
		PlayerTextDrawSetString(id, TradePTD[id][6], gString);			
		if(TradeTime[i] == 0) {
			FinishTrade(i);
			PlayerTextDrawHide(i, TradePTD[i][6]);
			PlayerTextDrawHide(id, TradePTD[id][6]);					
		}
	}
	if(HideJob[i] <= times && HideJob[i] != -1) PlayerTextDrawHide(i, JobPTD), PlayerTextDrawHide(i, JobTD);
	if(PlayerVar[i][TC] > 0 && PlayerVar[i][LTT] < GetTickCount()) PlayerVar[i][TC] = 0;
	if(GiftStep[i] != -1) GiftSystem(i);
	if(PlayerInfo[i][pJail] != 0 && (!PlayerToPoint(i, 7.5, 264.3079,81.8797,1001.0391) && !PlayerToPoint(i, 9.0, 218.9126,108.1308,999.0156))) SpawnPlayer(i);

	if(PlayerInfo[i][pWantedReason] > 0 && PlayerInfo[i][pWanted] != 0) {
		PlayerInfo[i][pWantedReason] --;
		format(gString, 50, "~n~~n~wanted scade in: ~r~%d minute", PlayerInfo[i][pWantedReason]/60);
		PlayerTextDrawSetString(i, WantedPTD, PlayerInfo[i][pWantedReason]/60 > 0 ? gString : ("~n~~n~wanted scade in: ~r~seconds.."));
		if(PlayerInfo[i][pWantedReason] == 0) {
			PlayerInfo[i][pWanted] --;
			format(gString, 50, "Nivelul tau de wanted a scazut la %d.", PlayerInfo[i][pWanted]);
			SCM(i, COLOR_YELLOW, gString);
			PlayerInfo[i][pWantedReason] = 600;
			SetPlayerWantedLevel(i, PlayerInfo[i][pWanted]);
			if(PlayerInfo[i][pWanted] == 0) PlayerTextDrawHide(i, WantedPTD), UpdateVar(i, "Wanted", 0);
		}
	}

	if(PlayerVar[i][ExpTime] <= times) {
		PlayerTextDrawHide(i, ExpTD[0]);
		PlayerTextDrawHide(i, ExpTD[1]);
		PlayerTextDrawHide(i, ExpTD[2]);
		HidePlayerProgressBar(i, PlayerVar[i][HudProgress][2]);
	}

	if(PlayerInfo[i][pJail] != 0) {
		PlayerInfo[i][pJail] --;
		format(gString, 50, "Eliberat in: ~r~%d minute", PlayerInfo[i][pJail]/60);
		PlayerTextDrawSetString(i, WantedPTD, PlayerInfo[i][pJail]/60 > 0 ? gString : ("Eliberat in: ~r~seconds.."));
		if(PlayerInfo[i][pJail] == 0) {
			PlayerTextDrawHide(i, WantedPTD);
			UpdateVar(i, "Jail", 0);
			SetPlayerPos(i, 268.2463,76.9353,1001.0391);
			SetPlayerFacingAngle(i, 347.3376);
			if(PlayerInfo[i][pJailType]==10) SpawnPlayer(i);
			SCM(i, COLOR_YELLOW, "Ai fost eliberat de la inchisoare.");
		}
	}

	if(Iter_Contains(Rainbows[3], i)) ChangeRainbowColors(i);

	if(PlayerVar[i][Find] != -1) UpdatePlayerFind(i);
	if(PlayerVar[i][MySpec] != -1) {
		new x = PlayerVar[i][MySpec], vehicleid = GetPlayerVehicleID(x), Float: HealthEx;
		GetVehicleHealth(vehicleid, HealthEx);
		switch(GetPlayerState(x)) {
			case PLAYER_STATE_ONFOOT: format(gString, sizeof(gString), "%s (%d) (level %d, %d hours and %d minutes, %.2f packet losses)~n~State: ON-FOOT (%.2f healts)~n~Jailed: %s (wanted: %d)", GetName(x), x, PlayerInfo[x][pLevel], PlayerInfo[x][pPlaying] / 3600, (PlayerInfo[x][pPlaying] / 60) % 60, NetStats_PacketLossPercent(x), health, PlayerInfo[x][pJail] != 0 ? ("Yes") : ("No"), PlayerInfo[x][pWanted]);
			case PLAYER_STATE_DRIVER, PLAYER_STATE_PASSENGER: format(gString, sizeof(gString), "%s (%d) (level %d, %.0f hours, %.2f packet losses)~n~State: %s (%.2f healts)~n~Jailed: No (wanted: 0)~n~Vehicle: %d (%.2f healts)", GetName(x), x, PlayerInfo[x][pLevel], PlayerInfo[x][pPlaying] / 3600, (PlayerInfo[x][pPlaying] / 60) % 60, NetStats_PacketLossPercent(x), GetPlayerState(x) != PLAYER_STATE_DRIVER ? ("PASSAGER") : ("DRIVER"), health, GetVehicleModel(vehicleid), HealthEx);
		}
		PlayerTextDrawSetString(i, SpectateTD, gString);
		if(GetPlayerInterior(i) != GetPlayerInterior(x)) {
			SetPlayerInterior(i, GetPlayerInterior(x));
			if(IsPlayerInAnyVehicle(x)) PlayerSpectateVehicle(i, x);
			else PlayerSpectatePlayer(i, x);
		}
		if(GetPlayerVirtualWorld(i) != GetPlayerVirtualWorld(x)) {
			SetPlayerVirtualWorld(i, GetPlayerVirtualWorld(x));
			if(IsPlayerInAnyVehicle(x)) PlayerSpectateVehicle(i, x);
			else PlayerSpectatePlayer(i, x);
		}
	}
	if(PlayerVar[i][JobWork]) {
		switch(PlayerInfo[i][pJob]) {
			case 4: {
				if(!IsPlayerInArea(i, -272.2, -172.6, 119.80227661132812, 180.3)) {
					PlayerVar[i][FarmerWarning] ++;
					if(PlayerVar[i][FarmerWarning] >= 30) SetPlayerWanted(i, PlayerInfo[i][pWanted] + 1);
					PlayerTextDrawSetString(i, FarmingPTD, "~y~! ~w~~h~Nu esti in zona in care poti munci ~n~(vei primi wanted daca nu te intorci)");
				} else {
					PlayerVar[i][FarmerWarning] = 0;
					new spe = GetVehicleSpeed(GetPlayerVehicleID(i));
					if(spe > 30) PlayerVar[i][LeftJob]--, format(gString, 50, "Mai ai ~r~%d~w~~h~ secunde pana vei fi platit.", PlayerVar[i][LeftJob]);
					PlayerTextDrawSetString(i, FarmingPTD, spe > 30 ? gString : "~r~(!) ~w~~h~mergi peste 30 km/h");
					if(PlayerVar[i][LeftJob] <= 0) {
						switch(random(50)) {
							case 0..15: GiveJobMoney(i, RandomEx(20000, 40000), 1, 10, 20), PlayerVar[i][LeftJob] = 60;
							default: {
								PlayerInfo[i][pFaina] = RandomEx(30, 50);
								format(gString, 130, "SMS de la Fermier Sefu ({FFFFFF}122414{FFFF00}): Pentru munca de pus ti-am dat un sac de faina de %d kg.", PlayerInfo[i][pFaina]);
								SCM(i, COLOR_YELLOW, gString);
								SCM(i, COLOR_YELLOW, "* Du-te la cel mai apropiat burger shot pentru a vinde sacul cu faina!");
								CancelJob(i, true);
							}
						}
						checkBP(i, 11, 300);
					}
				}
			}
			case 3: {
				new j;
				if(PizzaCP[i] == -1) {
					for(new h=0;h<4;h++) {
						j=PizzaHouse[i][h];
						if(j!=0&&PlayerToPoint(i, 50.0, HouseInfo[j][hEnterPos][0], HouseInfo[j][hEnterPos][1], HouseInfo[j][hEnterPos][2])) {
							SetPlayerCheckpointEx(i, CP_JOB, HouseInfo[j][hEnterPos][0], HouseInfo[j][hEnterPos][1], HouseInfo[j][hEnterPos][2], 3.0), PizzaCP[i] = h; 
							SCM(i, COLOR_SERVER, "(Job) {FFFFFF}Apasa pe tasta Y pentru a ridica mancarea!");
							break;
						}
					}
				}
				else {
					j=PizzaHouse[i][PizzaCP[i]];
					if(!PlayerToPoint(i, 50.0, HouseInfo[j][hEnterPos][0], HouseInfo[j][hEnterPos][1], HouseInfo[j][hEnterPos][2]))
						DisablePlayerCheckpoint(i), CP[i] = 0, PizzaCP[i] = -1;
				}
			}
		}
	}
	if(PlayerToPoint(i, 100, 699.4828,-551.2990,21.3363) || PlayerToPoint(i, 100, -2495.9927,2372.3340,13.1013) || PlayerToPoint(i, 100, -233.4400,2691.0266,62.6805)) checkBP(i, 15, 100);
	if(HideFriendConnect[i] <= times) for(new x=0;x<3;x++) PlayerTextDrawHide(i, FriendConnectPTD[x]);
	if(PlayerVar[i][ChatHide] <= times && PlayerVar[i][ChatHide] != -1) PlayerTextDrawHide(i, ChatPTD), PlayerVar[i][ChatHide] = -1;
	if(PlayerVar[i][JobWork] && PlayerVar[i][Trailer] != 0 && !IsTrailerAttachedToVehicle(PlayerVar[i][JobVehicle]) && IsPlayerInVehicle(i, PlayerVar[i][JobVehicle])) AttachTrailer(i);
	if(PlayerVar[i][Freeze] != 0) {
		PlayerVar[i][Freeze] --;
		if(PlayerVar[i][Freeze] == 0) TogglePlayerControllable(i, true);
	}
	if(PlayerToPoint(i, 50.0, -2317.8091, -1637.5575, 483.7031)) CheckPlayerMission(i, 3, 1);
	if(PlayerToPoint(i, 50.0, 1351.5524, 2151.5527, 11.0156)) CheckPlayerMission(i, 4, 1);
	if(GetPlayerAnimationIndex(i) == 958) CheckPlayerMission(i, 2, 1);

	if(PlayerVar[i][AdTime] < times && PlayerVar[i][AdTime] != -1) {
		PlayerVar[i][AdTime] = -1;
		TotalAds --;
		format(gString, sizeof(gString), "Ad by %s (phone: {FFFFFF}%d{00D900}): %s", GetName(i), PlayerInfo[i][pPhone], PlayerVar[i][AdText]);
		OOCNews(0x00D900FF, gString);
	}

	if(IsAdmin(i, 1)&&player_selected[i] != 12) {
		gString[0] = EOS;
		format(gString, 150, "~r~R: ~w~%d~n~~r~C: ~w~%d~n~", Iter_Count(Reports[0]), Iter_Count(Reports[1]));
		if(IsAdmin(i, 6) && PlayerInfo[i][pHud][0]) format(gString, sizeof gString, "~r~~h~T: ~w~%d~n~~p~M: ~w~%d~n~%s", GetServerTickRate(), mysql_unprocessed_queries(), gString);
		PlayerTextDrawSetString(i, ShowTD, gString);
		PlayerTextDrawShow(i, ShowTD);
		if ActionWarning[i] *then ActionWarning[i]--;
	}
	if(GetPlayerCash(i) != GetPlayerMoney(i)) ResetPlayerMoney(i), GivePlayerMoney(i, GetPlayerCash(i));
	if(PlayerToPoint(i, 1.1, PlayerVar[i][LastPos][0], PlayerVar[i][LastPos][1], PlayerVar[i][LastPos][2]) && !PlayerVar[i][Sleeping] && !PlayerInfo[i][pAdmin]) {
		PlayerVar[i][AFKSeconds] ++;
		if(PlayerVar[i][JobWork] && PlayerVar[i][AFKSeconds] > 120) CancelJob(i, false);
		if(GetPlayerWantedLevel(i) && PlayerVar[i][AFKSeconds] > 300) {
			format(gString, sizeof(gString), "AdmCmd: %s was kicked by AdmBot, reason: AFK with wanted.", GetName(i));
			SCMTA(COLOR_LIGHTRED, gString);
			KickEx(i);
			return true;
		}
		if(PlayerVar[i][AFKSeconds] >= 3600 && !IsAdmin(i, 6)) {
			format(gString, sizeof(gString), "AdmCmd: %s was kicked by AdmBot, reason: AFK without /sleep more than 60 minutes.", GetName(i));
			SCMTA(COLOR_LIGHTRED, gString);
			KickEx(i);
			return true;
		}
	}
	else PlayerVar[i][AFKSeconds] = 0, ++PlayerInfo[i][pConnected];
	GetPlayerPos(i, PlayerVar[i][LastPos][0], PlayerVar[i][LastPos][1], PlayerVar[i][LastPos][2]);
	return true;
}
task Timers[1000]() {
	if(RulettStatus == 1) OnRoulettaUpdate();
	gString[0] = EOS;
	PlayerInLoginQueue = 0;
	new hour, minute, second, year, month, day;
	gettime(hour, minute, second);
	getdate(year, month, day);
	if !rulta_data && !minute && second < 2 *then PayDay();
	format(gString, 30, "%02d:%02d", hour, minute);
	TextDrawSetString(DataT[0], gString);
	format(gString, 20, ":%02d", second);
	TextDrawSetString(DataT[1], gString);
	format(gString, 30, "%d %s", day, MonthName[month-1]);
	TextDrawSetString(DataT[2], gString);
	format(gString, 30, "%02d:%02d %s~n~%d/%d/%d", hour % 12, minute, (hour>12)?("PM"):("AM"), month, day, year);
	TextDrawSetString(PCTD_MAIN[10], gString);
	for(new p = 0; p < 2; p++) {
		switch(PB_Status[p]) {
			case 1: {
				PB_Time[p] --;
				format(gString, 50, "~w~~h~Paintball starting in~n~~r~%d ~w~~h~seconds", PB_Time[p]);
				if(PB_Time[p]<=0) CalculateVote(p), gString = "~y~Start!";
				foreach(new i : PlayerPaint[p]) GameTextForPlayer(i, gString, 5000, 3); 
			}
			case 2: {
				PB_Time[p] --;
				foreach(new i : PlayerPaint[p]) {
					format(gString, 100, "Paintball time: %02d:%02d~n~Kills: %d Deaths: %d Score: %d~n~Best Player: %s (kills: %d)", PB_Time[p] / 60, PB_Time[p] % 60, PKills[i], PDeath[i], PKills[i] - PDeath[i], PB_Best[p] != -1 ? GetName(PB_Best[p]) : ("Unknown"), PB_Best[p] != -1 ? PKills[PB_Best[p]] : 0);
					PlayerTextDrawSetString(i, PaintTD, gString);
					PlayerTextDrawShow(i, PaintTD);
				}
				if(PB_Time[p] == 0) {
					format(gString, 150, "Round over! Winner: %s with %d Kills. Use [/votemap] to vote for a map.", (PB_Best[p] != -1 ? GetName(PB_Best[p]) : ("Unknown")), PB_Best[p] != -1 ? PKills[PB_Best[p]] : 0);
					SendPaintMessage(p + 1, COLOR_YELLOW, gString);
					foreach(new i : PlayerPaint[p]) {
						PlayerTextDrawHide(i, PaintTD);
						format(gString, 100, "Your score: %d kills and %d deaths (total: %d).", PKills[i], PDeath[i], PKills[i] - PDeath[i]);
						SCM(i, COLOR_YELLOW, gString);
						PKills[i] = 0, PDeath[i] = 0;
						for(new m = 0; m < 5; m++) SendDeathMessageToPlayer(i, 1001, 1001, 200);
						ResetPlayerWeapons(i);
					}
					if(Iter_Count(PlayerPaint[p]) >= 2) PB_Status[p] = 1, PB_Time[p] = 15;
					else PB_Status[p] = 0;
					PB_Best[p] = -1;
				}
			}
		}
	}
	WarSystem();
	return true;
}

task TimerTwooo[15000]() {
	foreach(new i : Factions<5>) {
		if(!PlayerVar[i][TaxiDuty])
			continue;

		if(!IsPlayerInAnyVehicle(i)) {
			PlayerVar[i][TaxiDuty] = false;
			PlayerVar[i][TaxiAmount] = 0;
			GivePlayerCash(i, PlayerVar[i][TaxiTotal]);
			PlayerVar[i][TaxiTotal] = 0;
			foreach(new r : PlayerInVehicle[LastCar[i]]) PlayerTextDrawHide(r, TaxiPTD), PlayerVar[r][IsTaxi] = -1;
		}

		foreach(new x : PlayerInVehicle[GetPlayerVehicleID(i)]) {
			if(PlayerInfo[x][pMember] != 5) {
				if(GetPlayerCash(x) < PlayerVar[i][TaxiAmount]) {
					RemovePlayerFromVehicle(x);
					SCM(x, COLOR_GREY, "Nu ai bani necesari.");
				}
				else {
					PlayerVar[i][TaxiTotal] += PlayerVar[i][TaxiAmount];
					PlayerVar[x][TaxiTotal] += PlayerVar[i][TaxiAmount];
					GivePlayerCash(x, -PlayerVar[i][TaxiAmount]);
				}
			}
			UpdateTaxi(x, i);
		}
	}
	return true;
}

task checkData[30000]() return mysql_tquery(SQL, "SELECT * FROM `server_actions` LIMIT 20", "SQL_Server_actions");

task TimerTen[10000]() {
	foreach(new i : Renters) {
		if(!IsPlayerInAnyVehicle(i))
			continue;

		if(PlayerVar[i][RentVehicle] != GetPlayerVehicleID(i))
			continue;

		if(GetPlayerCash(i) < 20) {
			RemovePlayerFromVehicle(i);
			continue;
		}

		GivePlayerCash(i, -20);
	}

	if(!Iter_Count(Newbie))
		return true;

	gString[0] = EOS;
	foreach(new i : HelpsDuty) {
		if(PlayerVar[i][HaveHelp] != -1) continue;
		
		new x = Iter_Random(Newbie); Iter_Remove(Newbie, x);
		PlayerVar[i][HaveHelp] = x;
		PlayerVar[x][MyHelp] = i;
		SCM(i, COLOR_YELLOW, "Intrebare noua:");
		format(gString, 170, "* %s (%d) intreaba: %s", GetName(x), x, PlayerVar[x][NewbieText]);
		SCM(i, 0x4FB021FF, gString);
	}
	return true;
}


task TimerSixx[60000]() {
	gQuery[0] = EOS;
	foreach(new i : All(MyVehicles<>)) {
		if(CarInfo[i][cSpawned] == INVALID_VEHICLE || IsVehicleOccupied(CarInfo[i][cSpawned]))
			continue;

		if(CheckDespawnTime(i)) DestroyPlayerCar(i);
	}
	new hour, minute, second, year, month, day;
	gettime(hour, minute, second);
	getdate(year, month, day);
	if(minute == 0) {
		if(GetWeekDay() == 6 && hour == 22) {
			for(new f=1;f<=MAX_FACTIONS;++f) {
				foreach(new i : Factions<f>) {
					PlayerInfo[i][pFPoints][0]=PlayerInfo[i][pFPoints][1]=PlayerInfo[i][pFPoints][2]=0;
					SCM(i, COLOR_YELLOW, "* Raport-ul tau a fost resetat!");
				}
			}
			mysql_tquery(SQL, "UPDATE `users` SET `Raport` = '0|0|0'");
		} 
		if(hour == 00) {
			mysql_tquery(SQL, "UPDATE `users` SET `TodayReports` = '0'");
			foreach(new playerid : Player) PlayerInfo[playerid][pSTR]=0;
			gQuery[0] = EOS;
			mysql_tquery(SQL, "UPDATE `cars` SET `days` = `days`+'1'", "", "");
			foreach(new i : All(MyVehicles<>)) {
				CarInfo[i][cDays] ++;
				if(CarInfo[i][cDays] < CarInfo[i][cLeft] || !CarInfo[i][cLeft])
					continue;

				ClearString();
				if(CarInfo[i][cOnline] != -1) {
					RemovePlayerKey(CarInfo[i][cOnline], i);
					format(gString, 60, ">> {FFFFFF}Vehicul tau %s a expirat.", GetVehicleName(CarInfo[i][cModel]));
					SCM(CarInfo[i][cOnline], COLOR_LIGHTRED, gString);
				}
				gQuery[0] = EOS;
				mysql_format(SQL, gQuery, sizeof gQuery, "DELETE FROM `cars` WHERE `ID`='%d' LIMIT 1", CarInfo[i][cID]);
				mysql_tquery(SQL, gQuery);
				if(CarInfo[i][cSpawned] != INVALID_VEHICLE) DestroyPlayerCar(i), CarInfo[i][cID] = 0;
			}
		}
		if(hour == 7) {
			mysql_tquery(SQL, "UPDATE `users` SET `DailyQuest` = '0'");
			mysql_tquery(SQL, "UPDATE `users` SET `quests` = '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' WHERE `quests` = '1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'");
			foreach(new i : Player) {
				if(IsPlayerLogged(i)) {
					GivePlayerMission(i), SCM(i, COLOR_YELLOW, "* Misiunea zilei a fost resetata. Foloseste /quests pentru a vedea noile misiuni!");
					#if defined SPECIAL_QUEST
						if(!Iter_Count(special_quest[i])) Iter_Clear(special_quest[i]);
					#endif
				}
			}
		}
	}

	if(GetWeekDay()==Luni&&!hour&&!minute) mysql_tquery(SQL, "UPDATE `users` SET `WeekPlaying` = '0'");

	foreach(new i : Player) {
		if(!IsPlayerLogged(i))
			continue;

		if(PlayerVar[i][JobTimeLeft] != 0) {
			PlayerVar[i][JobTimeLeft] --; 
			switch(PlayerVar[i][JobTimeLeft]) {
				case 2: SCM(i, COLOR_WHITE, "{37dd37}(Job) {FFFFFF}Ai timp 2 minute sa te intorci la vehiculul tau.");
				case 1: SCM(i, COLOR_WHITE, "{37dd37}(Job) {FFFFFF}Mai ai 1 minut sa te intorci la vehiculul tau.");
				case 0: CancelJob(i, false);
			}
		}
		if(PlayerVar[i][TimerCheckSpawns] != 0) {
			PlayerVar[i][TimerCheckSpawns] --;
			if(PlayerVar[i][TimerCheckSpawns] == 0) {
				FDespawnVehicle(i);
				GameTextForPlayer(i, "~w~~h~Ai pierdut vehiculul factiuni.", 5000, 3);
			}
		}
	}
	return true;
}

function SQL_Server_actions() {
	new fild = cache_num_rows();
	if(!fild)
		return true;

	gString[0] = EOS; gQuery[0] = EOS;
	new i=-1, id, Action, Userid, playerid, Amount, by[25], reason[64], AmountStr[100], ds=false;
	while(++i<fild) {
		cache_get_value_name_int(i, "ID", id);
		cache_get_value_name_int(i, "Action", Action);
		cache_get_value_name_int(i, "Userid", Userid);
		cache_get_value_name_int(i, "Amount", Amount);
		cache_get_value_name_int(i, "playerid", playerid);
		cache_get_value_name(i, "ByPanel", by);
		cache_get_value_name(i, "AmountStr", AmountStr);
		cache_get_value_name(i, "Reason", reason);

		if((playerid == -1 || PlayerInfo[playerid][pSQLID] != Userid) && Action < 30)
			continue;

		switch(Action) {
			case 1: SCM(playerid, COLOR_YELLOW, "{E6833C}** {FFFF00}You have a new unread email(s). Use /email to read it. {E6833C}**");
			case 2: {
				format(gString, 100, "Panel: %s i-a oferit lui %s %s puncte premium.", by, GetName(playerid), FormatNumber(Amount));
				SendAdminMessage(COLOR_LIGHTRED, gString, 5);

				PlayerInfo[playerid][pPremiumPoints] += Amount;
				format(gString, 100, "Ai primit +%s puncte premium de la admin %s.", FormatNumber(Amount), by);
				SCM(playerid, COLOR_YELLOW, gString);				
			}
			case 3: {
				format(gString, 100, "Panel: %s i-a oferit lui %s $%s.", by, GetName(playerid), FormatNumber(Amount));
				SendAdminMessage(COLOR_LIGHTRED, gString, 5);

				GivePlayerCash(playerid, Amount);
				format(gString, 100, "Ai primit $%s de la admin %s.", FormatNumber(Amount), by);
				SCM(playerid, COLOR_YELLOW, gString);				
			}
			case 4: {
				format(gString, 100, "Panel: %s i-a dat kick lui %s. Motiv: %s", by, GetName(playerid), reason);
				SendAdminMessage(COLOR_LIGHTRED, gString, 5);

				format(gString, 100, "Admin %s ti-a dat kick. Motiv: %s", by, reason);
				SCM(playerid, COLOR_YELLOW, gString);
				KickEx(playerid);				
			}
			case 5: {
				format(gString, 100, "Panel: %s i-a schimbat numele lui %s in %s.", by, GetName(playerid), AmountStr);
				SendAdminMessage(COLOR_LIGHTRED, gString, 5);

				format(gString, 100, "Admin %s ti-a schimbat numele in %s", by, AmountStr);
				SCM(playerid, COLOR_YELLOW, gString);
				strmid(PlayerInfo[playerid][pName], AmountStr, 0, MAX_PLAYER_NAME);
				if(strcmp(AmountStr, GetName(playerid), true) != 0) SetPlayerName(playerid, PlayerInfo[playerid][pName]);
			}
			case 6: {
				format(gString, 100, "Panel: %s i-a schimbat emailul lui %s in %s.", by, GetName(playerid), AmountStr);
				SendAdminMessage(COLOR_LIGHTRED, gString, 5);

				format(gString, 100, "Admin %s ti-a schimbat emailul in %s.", by, AmountStr);
				SCM(playerid, COLOR_YELLOW, gString);
				strmid(PlayerInfo[playerid][pEmail], AmountStr, 0, 32);
			}
			case 7: {
				format(gString, 100, "Panel: %s i-a schimbat levelul lui %s in %d.", by, GetName(playerid), Amount);
				SendAdminMessage(COLOR_LIGHTRED, gString, 5);

				format(gString, 100, "Admin %s ti-a schimbat levelul in %d.", by, Amount);
				SCM(playerid, COLOR_YELLOW, gString);
				PlayerInfo[playerid][pLevel] = Amount;
			}
			case 8: {
				format(gString, 100, "Panel: %s i-a setat adminul lui %s in %d.", by, GetName(playerid), Amount);
				SendAdminMessage(COLOR_LIGHTRED, gString, 5);

				format(gString, 100, "Admin %s ti-a schimbat admin level in %d.", by, Amount);
				SCM(playerid, COLOR_YELLOW, gString);
				PlayerInfo[playerid][pAdmin] = Amount;
			}
			case 9: {
				format(gString, 100, "Panel: %s i-a scos -$%s lui %s. Motiv %s", by, FormatNumber(Amount), GetName(playerid), reason);
				SendAdminMessage(COLOR_LIGHTRED, gString, 5);

				format(gString, 100, "Admin %s ti-a scos -$%s de pe cont. Motiv %s", by, FormatNumber(Amount), reason);
				SCM(playerid, COLOR_YELLOW, gString);
				GivePlayerCash(playerid, -Amount);
			}
			case 10: {
				format(gString, 100, "Panel: %s i-a setat bani lui %s in %d. Motiv %s", by, GetName(playerid), Amount, reason);
				SendAdminMessage(COLOR_LIGHTRED, gString, 5);

				format(gString, 100, "Admin %s ti-a setat bani in %d. motiv: %s", by, Amount, reason);
				SCM(playerid, COLOR_YELLOW, gString);
				GivePlayerCash(playerid, Amount);
			}
			case 11: {
				format(gString, 100, "Panel: %s i-a scos %d premium points lui %s. Motiv", by, Amount, GetName(playerid), reason);
				SendAdminMessage(COLOR_LIGHTRED, gString, 5);

				format(gString, 100, "Admin %s ti-a scos %d premium points de pe cont. Motiv: %s", by, Amount, reason);
				SCM(playerid, COLOR_YELLOW, gString);
				PlayerInfo[playerid][pPremiumPoints] -= Amount;		
			}
			case 12: {
				format(gString, 100, "Panel: %s i-a setat %d premium points lui %s. Motiv: %s", by, Amount, GetName(playerid), reason);
				SendAdminMessage(COLOR_LIGHTRED, gString, 5);

				format(gString, 100, "Admin %s ti-a setat %d premium points. Motiv: %s", by, Amount, reason);
				SCM(playerid, COLOR_YELLOW, gString);
				PlayerInfo[playerid][pPremiumPoints] = Amount;		
			}
			case 13: {
				if(!Amount) format(gString, sizeof gString, "AdmBot: %s has been permanent banned by %s, reason: %s.", GetName(playerid), by, reason);	
				else format(gString, sizeof gString, "AdmBot: %s was banned by %s for %d days, reason: %s", GetName(playerid), by, Amount, reason);
				SCMTA(COLOR_LIGHTRED, gString);

				SCM(playerid, COLOR_YELLOW, "Daca consideri ca ai luat ban degeaba poti face un ticket pe panel."SERVER_NAME".ro/unbans");
				KickEx(playerid);				
			}
			case 14: {
				format(gString, sizeof gString, "AdmBot: %s a primit mute pentru %d minute de la admin %s. motiv: %s.", GetName(playerid), Amount, by, reason);
				SCMTA(COLOR_LIGHTRED, gString);

				format(gString, 128, "Ai primit mute pentru %d minute de la admin %s. Motiv %s", Amount, by, reason);
				SCM(playerid, COLOR_YELLOW, gString);
				PlayerInfo[playerid][pMute] = Amount*60;				
			}
			case 15: {
				format(gString, sizeof gString, "AdmBot: %s a primit warn de la admin %s. motiv: %s.", GetName(playerid), by, reason);
				SCMTA(COLOR_LIGHTRED, gString);

				format(gString, 128, "Ai primit warn la admin %s. Motiv %s", by, reason);
				SCM(playerid, COLOR_YELLOW, gString);
				KickEx(playerid);				
			}
			case 16: {
				format(gString, sizeof gString, "AdmBot: %s a fost bagat la jail pentru %d minute de catre admin %s. Motiv: %s", GetName(playerid), Amount, by, reason);
				SCMTA(COLOR_LIGHTRED, gString);

				format(gString, 128, "Ai fost bagat la jail de catre admin %s. Motiv: %s", by, reason);
				SCM(playerid, COLOR_YELLOW, gString);
				PlayerInfo[playerid][pJailType] = 10;
				PlayerInfo[playerid][pJail] = Amount*60;
				SetPlayerWanted(playerid, 0);
				PlayerTextDrawShow(playerid, WantedPTD);
				SpawnPlayer(playerid);			
			}
			case 30: {
				format(gString, sizeof gString, "AdmBot: %s a editat stock-ul vehicului %s in %d.", by, GetVehicleName(DealerInfo[playerid][dModel]), Amount);
				SendAdminMessage(COLOR_LIGHTRED, gString, 5);
				ds=true;
			}
			case 31: {
				format(gString, sizeof gString, "AdmBot: %s a editat pret-ul vehicului %s in $%s.", by, GetVehicleName(DealerInfo[playerid][dModel]), FormatNumber(Amount));
				SendAdminMessage(COLOR_LIGHTRED, gString, 5);

				ds=true;
			}
			case 32: {
				format(gString, sizeof gString, "AdmBot: %s a editat pret-ul vehicului %s in %d PP.", by, GetVehicleName(DealerInfo[playerid][dModel]), Amount);
				SendAdminMessage(COLOR_LIGHTRED, gString, 5);

				DealerInfo[playerid][dPremiumPoints] = Amount;
				ds=true;
			}
		}
	}
	if(ds) {
		mysql_format(SQL, gQuery, sizeof(gQuery), "SELECT * FROM `dsvehicle` WHERE `Price` > '0' AND `PremiumPoints` = '0' ORDER BY `dsvehicle`.`Price` ASC LIMIT %d", MAX_DS_VEHICLE);
 		mysql_tquery(SQL, gQuery, "SQL_LoadDealerShip", "");
	}
	mysql_tquery(SQL, "DELETE FROM `server_actions` LIMIT 20");
	return true;
}

task CheckFuels[20000]() {
	new engine, lights, alarm, doors, bonnet, boot, objective, vehicle;
    foreach(new i : Player)  {
    	if(!IsPlayerLogged(i)) continue;
        if(GetPlayerState(i) != PLAYER_STATE_DRIVER)
        	continue;

        vehicle = GetPlayerVehicleID(i);

        if(Fuel[vehicle] > 0 && Engine[vehicle]) {
            if(IsAPlane(vehicle) || IsABoat(vehicle) || IsABike(vehicle) || PlayerVar[i][JobVehicle] == vehicle)
            	continue;	

            if(!IsPlayerAFK(i)) {
            	Fuel[vehicle]--;
            	format(gString, 128, "Fuel %d", Fuel[vehicle]);
				PlayerTextDrawSetString(i, SpeedometerPTD[i][0], gString);
				PlayerTextDrawTextSize(i, SpeedometerPTD[i][6], percentage(Fuel[vehicle], 100.0) * 0.57, 3.0000);
				PlayerTextDrawShow(i, SpeedometerPTD[i][6]);
            }

            if(GetVehicleModel(vehicle) == 444) monsterKM[i] += (GetVehicleSpeed(vehicle) * 0.30) / 100, checkBP(i, 34, 200, floatround(monsterKM[i]));

            new carid = FindSpawnID(vehicle, false);
            if(carid == -1)
            	continue;

            if(GetVehicleSpeed(vehicle) > 10 && !IsPlayerAFK(i)) {
            	CarInfo[carid][cOdometer] += (GetVehicleSpeed(vehicle) * 0.30) / 100;
            	format(gString, 60, "%06.2f km", CarInfo[carid][cOdometer]);
            	PlayerTextDrawSetString(i, SpeedometerPTD[i][7], gString);
            }
            continue;
        }

        if(Fuel[vehicle] <= 0) {
	        GameTextForPlayer(i, "Fara benzina", 1500, 3);
	        Engine[vehicle] = false;

	        GetVehicleParamsEx(vehicle, engine, lights, alarm, doors, bonnet, boot, objective);
	        SetVehicleParamsExx(vehicle, VEHICLE_PARAMS_OFF, lights, alarm, doors, bonnet, boot, objective);
	    }
    }
	return true;
}