redist::CheckAccount(playerid) {
	if(cache_affected_rows()) return SCM(playerid, COLOR_GREY, "Eroare la incarcarea de date.");
	switch(cache_num_rows()) {
		case false: {
			if(PlayerVar[playerid][Incercari] == 0) return KickEx(playerid);
			gString[0] = EOS;
			ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD,"SERVER: Login","Welcome to the "SERVER_NAME" Server.\n\nPlease enter your password below!","Login","Cancel");
			format(gString, sizeof(gString), "Incorrect password. You have %d remaining login attemps left.", PlayerVar[playerid][Incercari]-1);
			SCM(playerid, COLOR_RED, gString);
			PlayerVar[playerid][Incercari] --;	
			return true;		
		}
		case true: {
			new hdwid;
			Iter_Remove(LoginQueue[1], playerid);
			Iter_Remove(LoginQueue[0], playerid);

			cache_get_value_name(0, "Email", PlayerInfo[playerid][pEmail]);
			cache_get_value_name(0, "password", PlayerInfo[playerid][pPassword]);

			cache_get_value_name_int(0, "id", PlayerInfo[playerid][pSQLID]); 
			cache_get_value_name_int(0, "Level", PlayerInfo[playerid][pLevel]);
			cache_get_value_name_int(0, "Admin", PlayerInfo[playerid][pAdmin]);  
			cache_get_value_name_int(0, "Helper", PlayerInfo[playerid][pHelper]);  
			cache_get_value_name_int(0, "Jail", PlayerInfo[playerid][pJail]);
			cache_get_value_name_int(0, "Model", PlayerInfo[playerid][pModel]); 
			cache_get_value_name_int(0, "JobOwner", PlayerInfo[playerid][pJobOwner]); 
			cache_get_value_name_int(0, "Tutorial", PlayerInfo[playerid][pTut]);
			new DailyQuest;
			cache_get_value_name_int(0, "AdminWarn", PlayerInfo[playerid][pAW]);
			cache_get_value_name_int(0, "LeaderWarn", PlayerInfo[playerid][pLW]);
			cache_get_value_name_int(0, "HelperWarn", PlayerInfo[playerid][pHW]);
			cache_get_value_name_int(0, "JobGoal", PlayerInfo[playerid][pJobGoal]);
			cache_get_value_name_int(0, "DriveLicense", PlayerInfo[playerid][pDriveLicense]); 
			cache_get_value_name_int(0, "BoatLicense", PlayerInfo[playerid][pBoatLicense]); 
			cache_get_value_name_int(0, "FlyLicense", PlayerInfo[playerid][pFlyLicense]); 
			cache_get_value_name_int(0, "WeaponLicense", PlayerInfo[playerid][pWeaponLicense]); 
			cache_get_value_name_int(0, "Playing", PlayerInfo[playerid][pPlaying]);
			cache_get_value_name_int(0, "Connected", PlayerInfo[playerid][pConnected]); 
			cache_get_value_name_int(0, "PremiumPoints", PlayerInfo[playerid][pPremiumPoints]);
			cache_get_value_name_int(0, "Slot", PlayerInfo[playerid][pSlot]);
			cache_get_value_name_int(0, "Warn", PlayerInfo[playerid][pWarn]);
			cache_get_value_name_bool(0, "HavePet", PlayerInfo[playerid][pHavePet]);
			cache_get_value_name_int(0, "Color", PlayerInfo[playerid][pColor]);
			cache_get_value_name_int(0, "Premium", PlayerInfo[playerid][pPremiumAccount]);
			cache_get_value_name_int(0, "Member", PlayerInfo[playerid][pMember]);
			cache_get_value_name_int(0, "Rank", PlayerInfo[playerid][pRank]);
			cache_get_value_name_int(0, "VIP", PlayerInfo[playerid][pVip]);
			cache_get_value_name_int(0, "TodayReports", PlayerInfo[playerid][pSTR]);
			cache_get_value_name_int(0, "TotalReports", PlayerInfo[playerid][pTR]);
			cache_get_value_name_int(0, "WTalkie", PlayerInfo[playerid][pWTalkie]);
			cache_get_value_name_int(0, "Freq", PlayerInfo[playerid][pFreq]);
			cache_get_value_name_int(0, "FP", PlayerInfo[playerid][pFP]);
			cache_get_value_name_int(0, "Drugs", PlayerInfo[playerid][pDrugs]);
			cache_get_value_name_int(0, "Hidden", PlayerInfo[playerid][pHidden]);
			cache_get_value_name_int(0, "Mats", PlayerInfo[playerid][pMats]);
			cache_get_value_name_int(0, "House", PlayerInfo[playerid][pHouse]);
			cache_get_value_name_int(0, "Bussines", PlayerInfo[playerid][pBussines]);
			cache_get_value_name_int(0, "Mute", PlayerInfo[playerid][pMute]);
			cache_get_value_name_int(0, "Referral", PlayerInfo[playerid][pReferral]);
			cache_get_value_name_int(0, "PIN", PlayerInfo[playerid][pPin]);
			cache_get_value_name_int(0, "GiftPoints", PlayerInfo[playerid][pGiftPoints]);
			cache_get_value_name_int(0, "Wanted", PlayerInfo[playerid][pWanted]);
			cache_get_value_name_int(0, "Rentroom", PlayerInfo[playerid][pRentroom]);
			cache_get_value_name_int(0, "Spawnchange", PlayerInfo[playerid][pSpawnChange]);
			cache_get_value_name_int(0, "DrivingSuspend", PlayerInfo[playerid][pDrvingSuspend]);
			cache_get_value_name_int(0, "FlySuspend", PlayerInfo[playerid][pFlySuspend]);
			cache_get_value_name_int(0, "BoatSuspend", PlayerInfo[playerid][pBoatSuspend]);
			cache_get_value_name_int(0, "WeaponSuspend", PlayerInfo[playerid][pWeaponSuspend]);
			cache_get_value_name_int(0, "Phone", PlayerInfo[playerid][pPhone]);
			cache_get_value_name_int(0, "DailyQuest", DailyQuest);
			cache_get_value_name_int(0, "Credit", PlayerInfo[playerid][pCredit]);
			cache_get_value_name_int(0, "Punish", PlayerInfo[playerid][pFP]);
			cache_get_value_name_int(0, "Gender", PlayerInfo[playerid][pGender]);
			cache_get_value_name_int(0, "FWarn", PlayerInfo[playerid][pFWarn]);
			cache_get_value_name_int(0, "RobExp", PlayerInfo[playerid][pRobExp]);
			cache_get_value_name_int(0, "Experience", PlayerInfo[playerid][pExperience]);
			cache_get_value_name_int(0, "PhoneBook", PlayerInfo[playerid][pPhoneBook]);
			cache_get_value_name_int(0, "Job", PlayerInfo[playerid][pJob]);
			cache_get_value_name_int(0, "BPExp", PlayerInfo[playerid][pBpExp]);
			cache_get_value_name_int(0, "PetLevel", PlayerInfo[playerid][pPetLevel]);
			cache_get_value_name_int(0, "PetExp", PlayerInfo[playerid][pPetExp]);
			cache_get_value_name_int(0, "PetStatus", PlayerInfo[playerid][pPetStatus]);
			cache_get_value_name_int(0, "Pet", PlayerInfo[playerid][pPet]);
			cache_get_value_name_int(0, "Days", PlayerInfo[playerid][pFDays]);
			cache_get_value_name_int(0, "Rainbow", PlayerInfo[playerid][pVehRainbow]);
			cache_get_value_name_int(0, "PhoneStatus", PlayerInfo[playerid][pPhoneStatus]);
			cache_get_value_name_int(0, "RaportExpire", PlayerInfo[playerid][pRaportTime]);
			cache_get_value_name_int(0, "Clan", PlayerInfo[playerid][pClan]);
			cache_get_value_name_int(0, "JailType", PlayerInfo[playerid][pJailType]);
			cache_get_value_name_int(0, "ClanRank", PlayerInfo[playerid][pClanRank]);
			cache_get_value_name_int(0, "ClanTag", PlayerInfo[playerid][pClanTag]);
			cache_get_value_name_int(0, "ClanWarns", PlayerInfo[playerid][pClanWarn]);
			cache_get_value_name_int(0, "YouTube", PlayerInfo[playerid][pYoutube]);
			cache_get_value_name_int(0, "GoldPass", PlayerInfo[playerid][pGoldPass]);
			cache_get_value_name_int(0, "Tier", PlayerInfo[playerid][pTier]);
			cache_get_value_name_int(0, "JobBoost", PlayerInfo[playerid][pJobBoost]);
			cache_get_value_name_int(0, "JobProcent", PlayerInfo[playerid][pJobProcent]);
			cache_get_value_name_bool(0, "MP3", PlayerInfo[playerid][pMP3]);
			cache_get_value_name_int(0, "hdwid", hdwid);

			cache_get_value_name_int(0, "ServerPoints", PlayerInfo[playerid][pServerPoints]);

			cache_get_value_name(0, "IP", PlayerInfo[playerid][pIP]);
			cache_get_value_name(0, "Crime", PlayerInfo[playerid][pCrime]);
			cache_get_value_name(0, "CrimeReport", PlayerInfo[playerid][pCrimeReport]);

			new result[128];

			cache_get_value_name_sscanf(0, guns, a<i>[5], gunset[playerid]);
			cache_get_value_name_sscanf(0, Skins, a<i>[20], PlayerInfo[playerid][pSkin]);

			cache_get_value_name(0, "vouchers", result);
			sscanf(result, "a<i>[3]", PlayerInfo[playerid][pVoucher]);

			cache_get_value_name(0, "missions_bp", result);
			sscanf(result, "a<i>[40]", playerBPTask[playerid]);

			cache_get_value_name(0, "bp_claimed", result);
			sscanf(result, "a<i>[40]", PlayerInfo[playerid][bpClaimed]);

			cache_get_value_name(0, "Attached", result);
			sscanf(result, "p<|>iiii", PlayerInfo[playerid][pAttached][0], PlayerInfo[playerid][pAttached][1], PlayerInfo[playerid][pAttached][2], PlayerInfo[playerid][pAttached][3]);

			cache_get_value_name(0, "JobSkillPoints", result);
			sscanf(result, "p<|>iiiiiiii", PlayerInfo[playerid][pJobSkill][0], PlayerInfo[playerid][pJobSkill][1], PlayerInfo[playerid][pJobSkill][2], PlayerInfo[playerid][pJobSkill][3], PlayerInfo[playerid][pJobSkill][4], PlayerInfo[playerid][pJobSkill][5], PlayerInfo[playerid][pJobSkill][6], PlayerInfo[playerid][pJobSkill][7]);

			cache_get_value_name(0, "Crates", result);
			sscanf(result, "p<|>iiiiii", PlayerInfo[playerid][pCrate][0], PlayerInfo[playerid][pCrate][1], PlayerInfo[playerid][pCrate][2], PlayerInfo[playerid][pCrate][3], PlayerInfo[playerid][pCrate][4], PlayerInfo[playerid][pCrate][5]);

			cache_get_value_name(0, "Neon", result);
			sscanf(result, "p<|>iiiiii", PlayerInfo[playerid][pNeon][0], PlayerInfo[playerid][pNeon][1], PlayerInfo[playerid][pNeon][2], PlayerInfo[playerid][pNeon][3], PlayerInfo[playerid][pNeon][4], PlayerInfo[playerid][pNeon][5]);

			cache_get_value_name(0, "JobSkill", result);
			sscanf(result, "p<|>iiiiiiii", PlayerInfo[playerid][pSkill][0], PlayerInfo[playerid][pSkill][1], PlayerInfo[playerid][pSkill][2], PlayerInfo[playerid][pSkill][3], PlayerInfo[playerid][pSkill][4], PlayerInfo[playerid][pSkill][5], PlayerInfo[playerid][pSkill][6], PlayerInfo[playerid][pSkill][7]);

			cache_get_value_name(0, "Hud", result);
			sscanf(result, "p<|>iiii", PlayerInfo[playerid][pHud][0], PlayerInfo[playerid][pHud][1], PlayerInfo[playerid][pHud][2], PlayerInfo[playerid][pHud][3]);

			cache_get_value_name(0, "Tog", result);
			sscanf(result, "a<i>[9]", PlayerInfo[playerid][pTog]);

			cache_get_value_name(0, "Raport", result);
			sscanf(result, "p<|>iii", PlayerInfo[playerid][pFPoints][0], PlayerInfo[playerid][pFPoints][1], PlayerInfo[playerid][pFPoints][2]);

			cache_get_value_name(0, "Missions", result);
			sscanf(result, "p<|>iiiiiiiii", PlayerMission[playerid][0][0], PlayerMission[playerid][0][1], PlayerMission[playerid][0][2], PlayerMission[playerid][1][0], PlayerMission[playerid][1][1], PlayerMission[playerid][1][2], PlayerMission[playerid][2][0], PlayerMission[playerid][2][1], PlayerMission[playerid][2][2]);

			cache_get_value_name(0, "Items", result);
			sscanf(result, "p<|>iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii", 		
				PlayerInfo[playerid][pItems][0], PlayerInfo[playerid][pItems][1], PlayerInfo[playerid][pItems][2], PlayerInfo[playerid][pItems][3], PlayerInfo[playerid][pItems][4], PlayerInfo[playerid][pItems][5], PlayerInfo[playerid][pItems][6], PlayerInfo[playerid][pItems][7], PlayerInfo[playerid][pItems][8], PlayerInfo[playerid][pItems][9],
				PlayerInfo[playerid][pItems][10], PlayerInfo[playerid][pItems][11], PlayerInfo[playerid][pItems][12], PlayerInfo[playerid][pItems][13], PlayerInfo[playerid][pItems][14], PlayerInfo[playerid][pItems][15], PlayerInfo[playerid][pItems][16], PlayerInfo[playerid][pItems][17], PlayerInfo[playerid][pItems][18], PlayerInfo[playerid][pItems][19],
				PlayerInfo[playerid][pItems][20], PlayerInfo[playerid][pItems][21], PlayerInfo[playerid][pItems][22], PlayerInfo[playerid][pItems][23], PlayerInfo[playerid][pItems][24], PlayerInfo[playerid][pItems][25], PlayerInfo[playerid][pItems][26], PlayerInfo[playerid][pItems][27], PlayerInfo[playerid][pItems][28], PlayerInfo[playerid][pItems][29],
				PlayerInfo[playerid][pItems][30], PlayerInfo[playerid][pItems][31], PlayerInfo[playerid][pItems][32], PlayerInfo[playerid][pItems][33], PlayerInfo[playerid][pItems][34], PlayerInfo[playerid][pItems][35], PlayerInfo[playerid][pItems][36], PlayerInfo[playerid][pItems][37], PlayerInfo[playerid][pItems][38], PlayerInfo[playerid][pItems][39],
				PlayerInfo[playerid][pItems][40], PlayerInfo[playerid][pItems][41], PlayerInfo[playerid][pItems][42], PlayerInfo[playerid][pItems][43], PlayerInfo[playerid][pItems][44], PlayerInfo[playerid][pItems][45], PlayerInfo[playerid][pItems][46], PlayerInfo[playerid][pItems][47], PlayerInfo[playerid][pItems][48], PlayerInfo[playerid][pItems][49],
				PlayerInfo[playerid][pItems][50], PlayerInfo[playerid][pItems][51], PlayerInfo[playerid][pItems][52], PlayerInfo[playerid][pItems][53], PlayerInfo[playerid][pItems][54], PlayerInfo[playerid][pItems][55], PlayerInfo[playerid][pItems][56], PlayerInfo[playerid][pItems][57], PlayerInfo[playerid][pItems][58], PlayerInfo[playerid][pItems][59],
				PlayerInfo[playerid][pItems][60], PlayerInfo[playerid][pItems][61], PlayerInfo[playerid][pItems][62], PlayerInfo[playerid][pItems][63], PlayerInfo[playerid][pItems][64], PlayerInfo[playerid][pItems][65], PlayerInfo[playerid][pItems][66], PlayerInfo[playerid][pItems][67], PlayerInfo[playerid][pItems][68], PlayerInfo[playerid][pItems][69],
				PlayerInfo[playerid][pItems][70], PlayerInfo[playerid][pItems][71]);

			cache_get_value_name(0, "ItemsType", result);
			sscanf(result, "p<|>iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii", 		
				PlayerInfo[playerid][pItemType][0], PlayerInfo[playerid][pItemType][1], PlayerInfo[playerid][pItemType][2], PlayerInfo[playerid][pItemType][3], PlayerInfo[playerid][pItemType][4], PlayerInfo[playerid][pItemType][5], PlayerInfo[playerid][pItemType][6], PlayerInfo[playerid][pItemType][7], PlayerInfo[playerid][pItemType][8], PlayerInfo[playerid][pItemType][9],
				PlayerInfo[playerid][pItemType][10], PlayerInfo[playerid][pItemType][11], PlayerInfo[playerid][pItemType][12], PlayerInfo[playerid][pItemType][13], PlayerInfo[playerid][pItemType][14], PlayerInfo[playerid][pItemType][15], PlayerInfo[playerid][pItemType][16], PlayerInfo[playerid][pItemType][17], PlayerInfo[playerid][pItemType][18], PlayerInfo[playerid][pItemType][19],
				PlayerInfo[playerid][pItemType][20], PlayerInfo[playerid][pItemType][21], PlayerInfo[playerid][pItemType][22], PlayerInfo[playerid][pItemType][23], PlayerInfo[playerid][pItemType][24], PlayerInfo[playerid][pItemType][25], PlayerInfo[playerid][pItemType][26], PlayerInfo[playerid][pItemType][27], PlayerInfo[playerid][pItemType][28], PlayerInfo[playerid][pItemType][29],
				PlayerInfo[playerid][pItemType][30], PlayerInfo[playerid][pItemType][31], PlayerInfo[playerid][pItemType][32], PlayerInfo[playerid][pItemType][33], PlayerInfo[playerid][pItemType][34], PlayerInfo[playerid][pItemType][35], PlayerInfo[playerid][pItemType][36], PlayerInfo[playerid][pItemType][37], PlayerInfo[playerid][pItemType][38], PlayerInfo[playerid][pItemType][39],
				PlayerInfo[playerid][pItemType][40], PlayerInfo[playerid][pItemType][41], PlayerInfo[playerid][pItemType][42], PlayerInfo[playerid][pItemType][43], PlayerInfo[playerid][pItemType][44], PlayerInfo[playerid][pItemType][45], PlayerInfo[playerid][pItemType][46], PlayerInfo[playerid][pItemType][47], PlayerInfo[playerid][pItemType][48], PlayerInfo[playerid][pItemType][49],
				PlayerInfo[playerid][pItemType][50], PlayerInfo[playerid][pItemType][51], PlayerInfo[playerid][pItemType][52], PlayerInfo[playerid][pItemType][53], PlayerInfo[playerid][pItemType][54], PlayerInfo[playerid][pItemType][55], PlayerInfo[playerid][pItemType][56], PlayerInfo[playerid][pItemType][57], PlayerInfo[playerid][pItemType][58], PlayerInfo[playerid][pItemType][59],
				PlayerInfo[playerid][pItemType][60], PlayerInfo[playerid][pItemType][61], PlayerInfo[playerid][pItemType][62], PlayerInfo[playerid][pItemType][63], PlayerInfo[playerid][pItemType][64], PlayerInfo[playerid][pItemType][65], PlayerInfo[playerid][pItemType][66], PlayerInfo[playerid][pItemType][67], PlayerInfo[playerid][pItemType][68], PlayerInfo[playerid][pItemType][69],
			PlayerInfo[playerid][pItemType][70], PlayerInfo[playerid][pItemType][71]);

			cache_get_value_name(0, "ItemSlotType", result);
			sscanf(result, "p<|>iiiiiiiiiiiiiiiiii", PlayerInfo[playerid][pItemSlotType][1], PlayerInfo[playerid][pItemSlotType][2], PlayerInfo[playerid][pItemSlotType][3], PlayerInfo[playerid][pItemSlotType][4], PlayerInfo[playerid][pItemSlotType][5], PlayerInfo[playerid][pItemSlotType][6], PlayerInfo[playerid][pItemSlotType][7], PlayerInfo[playerid][pItemSlotType][8], PlayerInfo[playerid][pItemSlotType][9], PlayerInfo[playerid][pItemSlotType][10],
				PlayerInfo[playerid][pItemSlotType][11], PlayerInfo[playerid][pItemSlotType][12], PlayerInfo[playerid][pItemSlotType][13], PlayerInfo[playerid][pItemSlotType][14], PlayerInfo[playerid][pItemSlotType][15], PlayerInfo[playerid][pItemSlotType][16], PlayerInfo[playerid][pItemSlotType][17],PlayerInfo[playerid][pItemSlotType][18]);
			
			cache_get_value_name(0, "PetName", PlayerInfo[playerid][pPetName]);
			cache_get_value_name(0, "quests", result);
			unformat(result, "p<|>iiiiiiiiiiiiiiiiiiiiiiiii",
				PlayerInfo[playerid][pQuestStatus][0], PlayerInfo[playerid][pQuestStatus][1], PlayerInfo[playerid][pQuestStatus][2], PlayerInfo[playerid][pQuestStatus][3],
				PlayerInfo[playerid][pQuestStatus][4], PlayerInfo[playerid][pQuestStatus][5], PlayerInfo[playerid][pQuestStatus][6], PlayerInfo[playerid][pQuestStatus][7],
				PlayerInfo[playerid][pQuestStatus][8], PlayerInfo[playerid][pQuestStatus][9], PlayerInfo[playerid][pQuestStatus][10], PlayerInfo[playerid][pQuestStatus][11],
				PlayerInfo[playerid][pQuestStatus][12], PlayerInfo[playerid][pQuestStatus][13], PlayerInfo[playerid][pQuestStatus][14], PlayerInfo[playerid][pQuestStatus][15],
				PlayerInfo[playerid][pQuestStatus][16], PlayerInfo[playerid][pQuestStatus][17], PlayerInfo[playerid][pQuestStatus][18], PlayerInfo[playerid][pQuestStatus][19],
				PlayerInfo[playerid][pQuestStatus][20], PlayerInfo[playerid][pQuestStatus][21], PlayerInfo[playerid][pQuestStatus][22], PlayerInfo[playerid][pQuestStatus][23],
			PlayerInfo[playerid][pQuestStatus][24]);

			if(!DailyQuest) UpdateVar(playerid, "DailyQuest", 1), GivePlayerMission(playerid);
			if(IsHouse(playerid) != 0) CheckHouse(playerid, IsHouse(playerid));
			if(PlayerInfo[playerid][pBussines] != -1) CheckBussines(playerid, PlayerInfo[playerid][pBussines]);

			if(IsAdmin(playerid, 1))
				Iter_Add(_Player<ADMIN>, playerid);
			else if(PlayerInfo[playerid][pHelper]) 
				Iter_Add(_Player<HELPER>, playerid);
			else if(PlayerInfo[playerid][pRank] >= 7 && PlayerInfo[playerid][pMember] != 0) Iter_Add(_Player<LEADER>, playerid);

			if(PlayerInfo[playerid][pFreq] != 0) Iter_Add(Freqs[PlayerInfo[playerid][pFreq] - 1], playerid);
			if(PlayerInfo[playerid][pVip]) Iter_Add(PlayerVIP, playerid);
			if(PlayerInfo[playerid][pPremiumAccount]) Iter_Add(PlayerPremium, playerid);
			Iter_Add(StreamedPlayer[playerid], playerid);
			PhoneFinder[PlayerInfo[playerid][pPhone]] = playerid;

			LoadPlayerCar(playerid);
			cache_get_value_name_bigint(money[playerid], 0, "Money");
			cache_get_value_name_bigint(bank[playerid], 0, "Bank");
			TogglePlayerSpectating(playerid, false);
			SetSpawnInfo(playerid, PlayerInfo[playerid][pMember], PlayerInfo[playerid][pModel], 2408.7747,94.1072,26.4727,8.9390, -1, -1, -1, -1, -1, -1);
			PlayerVar[playerid][IsLogged] = true;
			SpawnPlayer(playerid);
			ResetAllAnimation(playerid);

			inventory.Init(playerid, PlayerInfo[playerid][pSQLID], PlayerInfo[playerid][pModel]);

			if(PlayerInfo[playerid][pAdmin] || PlayerInfo[playerid][pHelper]) {
				//check_discord_security(0, "Discord_Token", playerid);
				new _hdwid[65];
				gpci(playerid, _hdwid, sizeof _hdwid);
				if(hdwid != YHash(_hdwid)) {
					SCM(playerid, COLOR_GM, "HDWID >> {FFFFFF}Ti-a fost scos admin-ul pentru ca te-ai conectat dintr-o alta locatie.");
					UpdateVar(playerid, "Admin", 0);
					PlayerInfo[playerid][pAdmin] = 0;
					UpdateVar(playerid, "Helper", 0);
					PlayerInfo[playerid][pHelper] = 0;
					KickEx(playerid);
					return true;
				}
			} else init_account_others(playerid);
		}
	}
	return true;
}

init_account_others(playerid) {
	LoadPlayerTextDraws(playerid);			

	StopAudioStreamForPlayer(playerid);
	SetPlayerColor(playerid, COLOR_WHITE);
	RemoveObjectPlayer(playerid);
	PlayerVar[playerid][HudProgress][2] = CreatePlayerProgressBar(playerid, 207.00, 34.00, 244.50, 3.20, COLOR_GM, 100.0);
	HidePlayerProgressBar(playerid, PlayerVar[playerid][HudProgress][2]);
	PlayerGunObject(playerid);
	LoadFriends(playerid);

	new hours,minute,seconds; gettime(hours,minute,seconds);

	SetPlayerTime(playerid, hours, 0);

	monsterKM[playerid] = 0.0;

	if(PlayerInfo[playerid][pVip]) {
		VIPLabel[playerid] = Create3DTextLabel("VIP USER", 0x7DE41BFF, 0.0, 0.0, 0.0, 10.0, 0, 0);
		Attach3DTextLabelToPlayer(VIPLabel[playerid], playerid, 0.0, 0.0, 0.4); }
	UpdateVar(playerid, "Status", playerid);
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, 128, "UPDATE `friends` SET `Status` = '%i' WHERE `Userid` = '%i'", playerid, PlayerInfo[playerid][pSQLID]);
	mysql_tquery(SQL, gQuery);
	mysql_format(SQL, gQuery, 128, "UPDATE `friends` SET `ByStatus` = '%i' WHERE `AddBy` = '%i'", playerid, PlayerInfo[playerid][pSQLID]);
	mysql_tquery(SQL, gQuery);
	TextDrawShowForPlayer(playerid, DataT[0]);
	TextDrawShowForPlayer(playerid, DataT[1]);
	TextDrawShowForPlayer(playerid, DataT[2]);
	if(InWar[PlayerInfo[playerid][pMember]] != -1) ShowPlayerWar(playerid, InWar[PlayerInfo[playerid][pMember]]);
	for(new i = 0; i < 20; i++) SCM(playerid, COLOR_WHITE, "");
	if(PlayerInfo[playerid][pMember] != 0) {
		format(gString, 125, "(Faction) {FFFFFF}%s rank %d is connected to the server.", PlayerInfo[playerid][pName], PlayerInfo[playerid][pRank]);
		foreach(new x : Factions<PlayerInfo[playerid][pMember]>) SCM(x, COLOR_SERVER, gString); 
		Iter_Add(Factions<PlayerInfo[playerid][pMember]>, playerid); 
		SCMf(playerid, COLOR_SERVER, "(FMOTD) {FFFFFF}%s", FactionInfo_[PlayerInfo[playerid][pMember] - 1][fMotd]);
	}
	if(GetClan[PlayerInfo[playerid][pClan]] != -1) {
		format(gString, 150, "(Clan){FFFFFF} %s from your clan has logged in.", GetName(playerid));
		foreach(new x : Clans[GetClan[PlayerInfo[playerid][pClan]]]) SCM(x, COLOR_SERVER, gString);
		Iter_Add(Clans[GetClan[PlayerInfo[playerid][pClan]]], playerid); }

	if(PlayerInfo[playerid][pHud][0]) PlayerTextDrawShow(playerid, FPS);
	PlayerTextDrawSetString(playerid, PlayerLogo, GetName(playerid));
	PlayerTextDrawShow(playerid, PlayerLogo);
	for(new i=0;i<6;i++) TextDrawShowForPlayer(playerid, LogoTD[i]);
	if(strcmp(PlayerInfo[playerid][pIP], playerIP[playerid], true) != 0) {
		if(PlayerInfo[playerid][pPin] == 0) {
			SCM(playerid, COLOR_SERVER, "(PIN): {FFFFFF}Nu ai un PIN setat pentru contul tau, daca vrei sa-ti setezi unul pentru securitate mai buna. Foloseste (/addpin).");
			UpdateVarStr(playerid, "IP", playerIP[playerid]);
		}
		else LoadPin(playerid);
	} else if(PlayerInfo[playerid][pPin] != 0) PlayerVar[playerid][PinLogged] = true, UpdateVarStr(playerid, "IP", playerIP[playerid]);
	if(PlayerInfo[playerid][pTut] < 4) {
		if(PlayerInfo[playerid][pTut] > 0) {
			SCM(playerid, -1, ""),SCM(playerid, -1, ""),SCM(playerid, -1, "");
			SCM(playerid, COLOR_GREY, "Nu ai terminat tutorialu.");
		}
		PlayerVar[playerid][RentVehicle] = CreateVehicleEx(462,1702.8350,1446.7480,10.4145,259.0114, -1, -1, -1, 0);
		VehicleAcces[PlayerVar[playerid][RentVehicle]] = playerid;
		SetVehicleDoor(PlayerVar[playerid][RentVehicle], true);
		PutPlayerInVehicle(playerid, PlayerVar[playerid][RentVehicle], 0);
		Fuel[PlayerVar[playerid][RentVehicle]] = 100;
		SetVehicleNumberPlate(PlayerVar[playerid][RentVehicle], "Rent Vehicle");
		Iter_Add(Renters, playerid);
		GiveVehicleKey(playerid, PlayerVar[playerid][RentVehicle]);
		ShowPlayerTutorial(playerid);
		SetVehicleVirtualWorld(PlayerVar[playerid][RentVehicle], playerid + 10);
		SetPlayerVirtualWorld(playerid, playerid + 10);
		return true; }

	format(gString, 34, "Welcome, %s!", GetName(playerid));
	SCM(playerid, COLOR_SERVER, gString);
	#if defined SPECIAL_QUEST 
		load_quests(playerid);
	#endif
	if(PlayerInfo[playerid][pPetStatus]) SetPlayerPet(playerid);
	if(IsAdmin(playerid, 1)) {
		format(gString, 33, "You are logged in as admin %d.", PlayerInfo[playerid][pAdmin]);
		SCM(playerid, COLOR_WHITE, gString); }
	if(PlayerInfo[playerid][pPremiumAccount]) SCM(playerid, COLOR_WHITE, "You own a Premium account.");	
	if(PlayerInfo[playerid][pVip]) SCM(playerid, COLOR_WHITE, "You own a VIP account.");	
	if(PlayerInfo[playerid][pWanted] != 0) PlayerTextDrawShow(playerid, WantedPTD), SetPlayerWantedLevel(playerid, PlayerInfo[playerid][pWanted]), SCM(playerid, COLOR_RED, "Esti urmarit de politie. Nivelul tau de wanted a fost restaurat."), PlayerInfo[playerid][pWantedReason] = 600;
	if(PlayerInfo[playerid][pJail] != 0) PlayerTextDrawShow(playerid, WantedPTD);
	new i=-1;
	if(PlayerInfo[playerid][pHud][1]) {
		while(++i<11) TextDrawShowForPlayer(playerid, GoalTD[i]); i=-1;
		while(++i<4) PlayerTextDrawShow(playerid, GoalPTD[i]);
		updateJobGoal(playerid);
	}
	if(GetClan[PlayerInfo[playerid][pClan]] != -1) {
		SetPlayerClanTag(playerid);
		format(gString, 150, "(Clan Motd): %s", ClanInfo[GetClan[PlayerInfo[playerid][pClan]]][clMotd]);
		SCM(playerid, COLOR_YELLOW, gString); }
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "SELECT * FROM `emails` WHERE `Name`='%s' AND `Activ`='1' ORDER BY `emails`.`ID` DESC LIMIT 10", PlayerInfo[playerid][pName]);
	mysql_tquery(SQL, gQuery, "SQL_CheckEmails", "i", playerid);
	SCM(playerid, COLOR_GM, "* Pentru a vedea misiunile zilei foloseste /quests."); 
	return true;
}

enum {
	CLICK_REGISTER_PASSWORD,
	CLICK_REGISTER_CONFIRMPW,
	CLICK_REGISTER_EMAIL,
	CLICK_REGISTER_GENDER,
	CLICK_REGISTER_PIN,
	CLICK_REGISTER_CONFIRM
}

std::LoadRegister(playerid, _x=-1) {
	ConfirmPw[playerid] = false;
	PlayerInfo[playerid][pPassword][0] = EOS;
	PlayerInfo[playerid][pEmail][0] = EOS;
	PlayerInfo[playerid][pAge] = 5;
	listitemmm[playerid] = 0;
	RegisterSkin[playerid] = 0;
	PlayerInfo[playerid][pGender] = 0;

	PlayerVar[playerid][ServerTimer][0] = 2;
	PlayerVar[playerid][ServerTimer][1] = 90;
	player_selected[playerid] = 16;

	while(++_x<10) TextDrawShowForPlayer(playerid, register_TD[_x]);
	register_PTD[playerid][0] = CreatePlayerTextDraw(playerid, 240.931213, 160.683441, GetName(playerid));
	PlayerTextDrawLetterSize(playerid, register_PTD[playerid][0], 0.225709, 1.320000);
	PlayerTextDrawTextSize(playerid, register_PTD[playerid][0], 407.000000, 15.000000);
	PlayerTextDrawAlignment(playerid, register_PTD[playerid][0], 1);
	PlayerTextDrawColor(playerid, register_PTD[playerid][0], -1);
	PlayerTextDrawUseBox(playerid, register_PTD[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, register_PTD[playerid][0], -248);
	PlayerTextDrawSetShadow(playerid, register_PTD[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, register_PTD[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, register_PTD[playerid][0], 255);
	PlayerTextDrawFont(playerid, register_PTD[playerid][0], 2);
	PlayerTextDrawSetProportional(playerid, register_PTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, register_PTD[playerid][0], 0);
	PlayerTextDrawShow(playerid, register_PTD[playerid][0]);

	register_PTD[playerid][1] = CreatePlayerTextDraw(playerid, 240.968200, 189.699966, "password");
	PlayerTextDrawLetterSize(playerid, register_PTD[playerid][1], 0.225709, 1.320000);
	PlayerTextDrawTextSize(playerid, register_PTD[playerid][1], 407.099945, 15.000000);
	PlayerTextDrawAlignment(playerid, register_PTD[playerid][1], 1);
	PlayerTextDrawColor(playerid, register_PTD[playerid][1], -1);
	PlayerTextDrawUseBox(playerid, register_PTD[playerid][1], 1);
	PlayerTextDrawBoxColor(playerid, register_PTD[playerid][1], -248);
	PlayerTextDrawSetShadow(playerid, register_PTD[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, register_PTD[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, register_PTD[playerid][1], 255);
	PlayerTextDrawFont(playerid, register_PTD[playerid][1], 2);
	PlayerTextDrawSetProportional(playerid, register_PTD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, register_PTD[playerid][1], 0);
	PlayerTextDrawSetSelectable(playerid, register_PTD[playerid][1], true);
	PlayerTextDrawShow(playerid, register_PTD[playerid][1]);
	PlayerTextID[playerid][PlayerText:register_PTD[playerid][1]] = CLICK_REGISTER_PASSWORD;

	register_PTD[playerid][2] = CreatePlayerTextDraw(playerid, 240.757232, 218.250518, "confirm password");
	PlayerTextDrawLetterSize(playerid, register_PTD[playerid][2], 0.225709, 1.320000);
	PlayerTextDrawTextSize(playerid, register_PTD[playerid][2], 406.600036, 15.000000);
	PlayerTextDrawAlignment(playerid, register_PTD[playerid][2], 1);
	PlayerTextDrawColor(playerid, register_PTD[playerid][2], -1);
	PlayerTextDrawUseBox(playerid, register_PTD[playerid][2], 1);
	PlayerTextDrawBoxColor(playerid, register_PTD[playerid][2], -248);
	PlayerTextDrawSetShadow(playerid, register_PTD[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, register_PTD[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, register_PTD[playerid][2], 255);
	PlayerTextDrawFont(playerid, register_PTD[playerid][2], 2);
	PlayerTextDrawSetProportional(playerid, register_PTD[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, register_PTD[playerid][2], 0);
	PlayerTextDrawSetSelectable(playerid, register_PTD[playerid][2], true);
	PlayerTextDrawShow(playerid, register_PTD[playerid][2]);
	PlayerTextID[playerid][PlayerText:register_PTD[playerid][2]] = CLICK_REGISTER_CONFIRMPW;

	register_PTD[playerid][3] = CreatePlayerTextDraw(playerid, 240.583251, 250.000411, "email");
	PlayerTextDrawLetterSize(playerid, register_PTD[playerid][3], 0.225709, 1.320000);
	PlayerTextDrawTextSize(playerid, register_PTD[playerid][3], 406.700103, 15.000000);
	PlayerTextDrawAlignment(playerid, register_PTD[playerid][3], 1);
	PlayerTextDrawColor(playerid, register_PTD[playerid][3], -1);
	PlayerTextDrawUseBox(playerid, register_PTD[playerid][3], 1);
	PlayerTextDrawBoxColor(playerid, register_PTD[playerid][3], -248);
	PlayerTextDrawSetShadow(playerid, register_PTD[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, register_PTD[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, register_PTD[playerid][3], 255);
	PlayerTextDrawFont(playerid, register_PTD[playerid][3], 2);
	PlayerTextDrawSetProportional(playerid, register_PTD[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, register_PTD[playerid][3], 0);
	PlayerTextDrawSetSelectable(playerid, register_PTD[playerid][3], true);
	PlayerTextDrawShow(playerid, register_PTD[playerid][3]);
	PlayerTextID[playerid][PlayerText:register_PTD[playerid][3]] = CLICK_REGISTER_EMAIL;

	register_PTD[playerid][4] = CreatePlayerTextDraw(playerid, 240.314743, 280.783905, "gender");
	PlayerTextDrawLetterSize(playerid, register_PTD[playerid][4], 0.225709, 1.320000);
	PlayerTextDrawTextSize(playerid, register_PTD[playerid][4], 406.430236, 15.000000);
	PlayerTextDrawAlignment(playerid, register_PTD[playerid][4], 1);
	PlayerTextDrawColor(playerid, register_PTD[playerid][4], -1);
	PlayerTextDrawUseBox(playerid, register_PTD[playerid][4], 1);
	PlayerTextDrawBoxColor(playerid, register_PTD[playerid][4], -248);
	PlayerTextDrawSetShadow(playerid, register_PTD[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, register_PTD[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, register_PTD[playerid][4], 255);
	PlayerTextDrawFont(playerid, register_PTD[playerid][4], 2);
	PlayerTextDrawSetProportional(playerid, register_PTD[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, register_PTD[playerid][4], 0);
	PlayerTextDrawSetSelectable(playerid, register_PTD[playerid][4], true);
	PlayerTextDrawShow(playerid, register_PTD[playerid][4]);
	PlayerTextID[playerid][PlayerText:register_PTD[playerid][4]] = CLICK_REGISTER_GENDER;

	register_PTD[playerid][5] = CreatePlayerTextDraw(playerid, 240.657226, 311.817535, "set pin");
	PlayerTextDrawLetterSize(playerid, register_PTD[playerid][5], 0.225709, 1.320000);
	PlayerTextDrawTextSize(playerid, register_PTD[playerid][5], 407.000000, 15.000000);
	PlayerTextDrawAlignment(playerid, register_PTD[playerid][5], 1);
	PlayerTextDrawColor(playerid, register_PTD[playerid][5], -1);
	PlayerTextDrawUseBox(playerid, register_PTD[playerid][5], 1);
	PlayerTextDrawBoxColor(playerid, register_PTD[playerid][5], -248);
	PlayerTextDrawSetShadow(playerid, register_PTD[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, register_PTD[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, register_PTD[playerid][5], 255);
	PlayerTextDrawFont(playerid, register_PTD[playerid][5], 2);
	PlayerTextDrawSetProportional(playerid, register_PTD[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, register_PTD[playerid][5], 0);
	PlayerTextDrawSetSelectable(playerid, register_PTD[playerid][5], true);
	PlayerTextDrawShow(playerid, register_PTD[playerid][5]);
	PlayerTextID[playerid][PlayerText:register_PTD[playerid][5]] = CLICK_REGISTER_PIN;

	register_PTD[playerid][6] = CreatePlayerTextDraw(playerid, 323.054077, 341.516448, "register");
	PlayerTextDrawLetterSize(playerid, register_PTD[playerid][6], 0.294114, 1.436666);
	PlayerTextDrawTextSize(playerid, register_PTD[playerid][6], 15.000000, 101.000000);
	PlayerTextDrawAlignment(playerid, register_PTD[playerid][6], 2);
	PlayerTextDrawColor(playerid, register_PTD[playerid][6], 255);
	PlayerTextDrawUseBox(playerid, register_PTD[playerid][6], 1);
	PlayerTextDrawBoxColor(playerid, register_PTD[playerid][6], -1);
	PlayerTextDrawSetShadow(playerid, register_PTD[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, register_PTD[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, register_PTD[playerid][6], 255);
	PlayerTextDrawFont(playerid, register_PTD[playerid][6], 2);
	PlayerTextDrawSetProportional(playerid, register_PTD[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, register_PTD[playerid][6], 0);
	PlayerTextDrawSetSelectable(playerid, register_PTD[playerid][6], true);
	PlayerTextDrawShow(playerid, register_PTD[playerid][6]);	
	PlayerTextID[playerid][PlayerText:register_PTD[playerid][6]] = CLICK_REGISTER_CONFIRM;
	SelectTextDraw(playerid, 0xFF0057FF);
	return true;
}

std::click_register(playerid, id, x=-1) {
	switch id do {
		case CLICK_REGISTER_PASSWORD: Dialog_Show(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "Register (password)", "Input your password in indbox", "Done", "Close");
		case CLICK_REGISTER_CONFIRMPW: Dialog_Show(playerid, DIALOG_CONFIRMPW, DIALOG_STYLE_PASSWORD, "Register (confirm password)", "Confirm the password from the registration", "Done", "Close");
		case CLICK_REGISTER_EMAIL: Dialog_Show(playerid, DIALOG_EMAIL, DIALOG_STYLE_INPUT, "Register (email)", "Input your email adress:", "Done", "Close");
		case CLICK_REGISTER_GENDER: Dialog_Show(playerid, DIALOG_GENDER, DIALOG_STYLE_MSGBOX, "Register (gender)", "Select your gender:", "Male", "Female");
		case CLICK_REGISTER_PIN: Dialog_Show(playerid, DIALOG_SETPIN, DIALOG_STYLE_INPUT, "Register (pin)", "Input your pin (need 4 numbers)", "Done", "Close");
		case CLICK_REGISTER_CONFIRM: {
			if(!strlen(PlayerInfo[playerid][pPassword]) || !strlen(PlayerInfo[playerid][pEmail]) || !ConfirmPw[playerid])
				return ShowPlayerDialog(playerid, DIALOG_ONLINE, DIALOG_STYLE_MSGBOX, "Register - Error", "Nu ai completat toate tabelele", "Close", "");
			
			gQuery[0] = EOS;
			new hour, minute, second, year, month, day, date[60];
			while(++x<10) TextDrawHideForPlayer(playerid, register_TD[x]); x=-1;
			while(++x<7) PlayerTextDrawDestroy(playerid, register_PTD[playerid][x]);
			CancelSelectTextDraw(playerid);
			player_selected[playerid] = 0;
			getdate(year, month, day); gettime(hour, minute, second);
			PlayerInfo[playerid][pModel] = PlayerInfo[playerid][pGender]?23:41;
			SHA256_PassHash(PlayerInfo[playerid][pPassword], HASH_KEY, PlayerInfo[playerid][pPassword], 65);
			format(date, sizeof(date), "%02d.%02d.%02d %02d:%02d", day, month, year, hour, minute);
			GetPlayerIp(playerid, PlayerInfo[playerid][pIP], 16);
			mysql_format(SQL, gQuery, sizeof(gQuery), "INSERT INTO users (`name`, `name_and_tag`, `password`, `RegisterDate`, `Email`, `Age`, `Model`, `Gender`, `PIN`, `IP`, `Money`, `Bank`) VALUES ('%s', '%s', '%s', '%s', '%s', '%i', '%i', '%i', '%i', '%s', '4000', '5000')", GetName(playerid), PlayerInfo[playerid][pName], PlayerInfo[playerid][pPassword], date, PlayerInfo[playerid][pEmail], PlayerInfo[playerid][pAge], PlayerInfo[playerid][pModel], PlayerInfo[playerid][pGender], PlayerInfo[playerid][pPin], PlayerInfo[playerid][pIP]);
			mysql_tquery(SQL, gQuery);
			Registers++;
			PlayerVar[playerid][Incercari] = 2;
			OnPlayerLoginIn(playerid, PlayerInfo[playerid][pPassword]);
		}
	}
	return true;
}

Dialog:DIALOG_REGISTER(playerid, response, listitem, inputtext[]) {
	if !response *then
		return true;

	if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "Register (password)", "Input your password in indbox", "Done", "Close");

	if(strlen(inputtext) > 16 || !checker(inputtext)) { 
		SCM(playerid, COLOR_RED, "Parola ta este nesigura (7 - 16 charactere) si sa aibe o litera mare.");
		ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "Register (password)", "Input your password in indbox", "Done", "Close");
		return true;
	}
	ConfirmPw[playerid] = false;
	mysql_escape_string(inputtext, PlayerInfo[playerid][pPassword]);
	PlayerTextDrawSetString(playerid, register_PTD[playerid][1], HashString(strlen(inputtext)));
	return true;
}

Dialog:DIALOG_CONFIRMPW(playerid, response, listitem, inputtext[]) {
	if !response *then
		return true;

	if(ConfirmPw[playerid]) 
		return true;

	if(!strlen(inputtext)) 
		return ShowPlayerDialog(playerid, DIALOG_CONFIRMPW, DIALOG_STYLE_PASSWORD, "Register (confirm password)", "Confirm the password from the registration", "Done", "Close");

	if(strcmp(PlayerInfo[playerid][pPassword], inputtext, true) != 0)
		return SCM(playerid, COLOR_RED, "Parola introdusa nu este aceasi cu parola introdusa recenta!"), ShowPlayerDialog(playerid, DIALOG_CONFIRMPW, DIALOG_STYLE_PASSWORD, "Register (confirm password)", "Confirm the password from the registration", "Done", "Close");

	PlayerTextDrawSetString(playerid, register_PTD[playerid][2], HashString(strlen(PlayerInfo[playerid][pPassword])));
	ConfirmPw[playerid] = true;
	return true;
}
Dialog:DIALOG_EMAIL(playerid, response, listitem, inputtext[]) {
	if !response *then
		return true;

	if(!IsMail(inputtext)) {
		SCM(playerid, COLOR_GREY, "Invalid email. introdu un email valid.");
		ShowPlayerDialog(playerid, DIALOG_EMAIL, DIALOG_STYLE_INPUT, "Register (email)", "Input your email adress:", "Done", "Close");
		return true;
	}
	format(PlayerInfo[playerid][pEmail], 32, inputtext);
	format(gString, 20, "%s", PlayerInfo[playerid][pEmail]);
	PlayerTextDrawSetString(playerid, register_PTD[playerid][3], gString);
	return true;
}

Dialog:DIALOG_GENDER(playerid, response, listitem, inputtext[]) {
	PlayerInfo[playerid][pGender] = bool:response;
	PlayerTextDrawSetString(playerid, register_PTD[playerid][4], response?("male"):("female"));
	return true;
}
Dialog:DIALOG_SETPIN(playerid, response, listitem, inputtext[]) {
	if !response *then
		return true;

	if(!IsNumeric(inputtext))
		return true;

	if strlen(inputtext) != 4 *then return ShowPlayerDialog(playerid, DIALOG_SETPIN, DIALOG_STYLE_INPUT, "Register (pin)", "Input your pin (need 4 numbers)", "Done", "Close");
	format(gString, 30, "pin: %s", inputtext);
	PlayerTextDrawSetString(playerid, register_PTD[playerid][5], gString);
	PlayerInfo[playerid][pPin] = strval(inputtext);
	return true;
}
stock LoadPin(playerid) {
	PinPTD[playerid][0] = CreatePlayerTextDraw(playerid, 0.476301, 0.133361, "box");
	PlayerTextDrawLetterSize(playerid, PinPTD[playerid][0], 0.000000, 51.633087);
	PlayerTextDrawTextSize(playerid, PinPTD[playerid][0], 714.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, PinPTD[playerid][0], 1);
	PlayerTextDrawColor(playerid, PinPTD[playerid][0], 1212170495);
	PlayerTextDrawUseBox(playerid, PinPTD[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, PinPTD[playerid][0], 1212170438);
	PlayerTextDrawSetShadow(playerid, PinPTD[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, PinPTD[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, PinPTD[playerid][0], 255);
	PlayerTextDrawFont(playerid, PinPTD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, PinPTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, PinPTD[playerid][0], 0);
	PlayerTextDrawShow(playerid, PinPTD[playerid][0]);

	PinPTD[playerid][1] = CreatePlayerTextDraw(playerid, 235.208999, 121.279891, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, PinPTD[playerid][1], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, PinPTD[playerid][1], 153.000000, 218.000000);
	PlayerTextDrawAlignment(playerid, PinPTD[playerid][1], 1);
	PlayerTextDrawColor(playerid, PinPTD[playerid][1], 824978687);
	PlayerTextDrawSetShadow(playerid, PinPTD[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, PinPTD[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, PinPTD[playerid][1], 255);
	PlayerTextDrawFont(playerid, PinPTD[playerid][1], 4);
	PlayerTextDrawSetProportional(playerid, PinPTD[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, PinPTD[playerid][1], 0);
	PlayerTextDrawShow(playerid, PinPTD[playerid][1]);

	PinPTD[playerid][2] = CreatePlayerTextDraw(playerid, 249.475433, 132.773559, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, PinPTD[playerid][2], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, PinPTD[playerid][2], 125.000000, 18.000000);
	PlayerTextDrawAlignment(playerid, PinPTD[playerid][2], 1);
	PlayerTextDrawColor(playerid, PinPTD[playerid][2], 505158911);
	PlayerTextDrawSetShadow(playerid, PinPTD[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, PinPTD[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, PinPTD[playerid][2], 255);
	PlayerTextDrawFont(playerid, PinPTD[playerid][2], 4);
	PlayerTextDrawSetProportional(playerid, PinPTD[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, PinPTD[playerid][2], 0);
	PlayerTextDrawShow(playerid, PinPTD[playerid][2]);

	PinPTD[playerid][3] = CreatePlayerTextDraw(playerid, 312.966949, 131.426605, "----");
	PlayerTextDrawLetterSize(playerid, PinPTD[playerid][3], 0.450666, 2.077868);
	PlayerTextDrawAlignment(playerid, PinPTD[playerid][3], 2);
	PlayerTextDrawColor(playerid, PinPTD[playerid][3], -158);
	PlayerTextDrawSetShadow(playerid, PinPTD[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, PinPTD[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, PinPTD[playerid][3], 255);
	PlayerTextDrawFont(playerid, PinPTD[playerid][3], 2);
	PlayerTextDrawSetProportional(playerid, PinPTD[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, PinPTD[playerid][3], 0);
	PlayerTextDrawShow(playerid, PinPTD[playerid][3]);

	PinPTD[playerid][4] = CreatePlayerTextDraw(playerid, 310.356933, 97.593315, "Account Locked!");
	PlayerTextDrawLetterSize(playerid, PinPTD[playerid][4], 0.554666, 2.500266);
	PlayerTextDrawAlignment(playerid, PinPTD[playerid][4], 2);
	PlayerTextDrawColor(playerid, PinPTD[playerid][4], -126);
	PlayerTextDrawSetShadow(playerid, PinPTD[playerid][4], 1);
	PlayerTextDrawSetOutline(playerid, PinPTD[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, PinPTD[playerid][4], 108);
	PlayerTextDrawFont(playerid, PinPTD[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, PinPTD[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, PinPTD[playerid][4], 1);
	PlayerTextDrawShow(playerid, PinPTD[playerid][4]);

	PinPTD[playerid][5] = CreatePlayerTextDraw(playerid, 249.437347, 150.352981, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, PinPTD[playerid][5], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, PinPTD[playerid][5], 124.840393, 1.189999);
	PlayerTextDrawAlignment(playerid, PinPTD[playerid][5], 1);
	PlayerTextDrawColor(playerid, PinPTD[playerid][5], 303108607);
	PlayerTextDrawSetShadow(playerid, PinPTD[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, PinPTD[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, PinPTD[playerid][5], 255);
	PlayerTextDrawFont(playerid, PinPTD[playerid][5], 4);
	PlayerTextDrawSetProportional(playerid, PinPTD[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, PinPTD[playerid][5], 0);
	PlayerTextDrawShow(playerid, PinPTD[playerid][5]);

	PinPTD[playerid][6] = CreatePlayerTextDraw(playerid, 249.437347, 150.352981, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, PinPTD[playerid][6], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, PinPTD[playerid][6], 124.840393, 1.189999);
	PlayerTextDrawAlignment(playerid, PinPTD[playerid][6], 1);
	PlayerTextDrawColor(playerid, PinPTD[playerid][6], 303108607);
	PlayerTextDrawSetShadow(playerid, PinPTD[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, PinPTD[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, PinPTD[playerid][6], 255);
	PlayerTextDrawFont(playerid, PinPTD[playerid][6], 4);
	PlayerTextDrawSetProportional(playerid, PinPTD[playerid][6], 0);
	PlayerTextDrawSetShadow(playerid, PinPTD[playerid][6], 0);
	PlayerTextDrawShow(playerid, PinPTD[playerid][6]);

	PinPTD[playerid][7] = CreatePlayerTextDraw(playerid, 231.081344, 366.347076, "particle:lamp_shad_64");
	PlayerTextDrawLetterSize(playerid, PinPTD[playerid][7], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, PinPTD[playerid][7], 161.000000, -27.000000);
	PlayerTextDrawAlignment(playerid, PinPTD[playerid][7], 1);
	PlayerTextDrawColor(playerid, PinPTD[playerid][7], 255);
	PlayerTextDrawSetShadow(playerid, PinPTD[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, PinPTD[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, PinPTD[playerid][7], 255);
	PlayerTextDrawFont(playerid, PinPTD[playerid][7], 4);
	PlayerTextDrawSetProportional(playerid, PinPTD[playerid][7], 0);
	PlayerTextDrawSetShadow(playerid, PinPTD[playerid][7], 0);
	PlayerTextDrawShow(playerid, PinPTD[playerid][7]);

	new nums[2];
	loop.xy(0..9) {
		nums[0] = xy+'1';
		PinPTD[playerid][xy+8] = CreatePlayerTextDraw(playerid, 245.214248 + ((xy%3) * 44.233), 157.993225 + ((xy/3) * 44.573), "ld_beat:chit");
		PlayerTextDrawLetterSize(playerid, PinPTD[playerid][xy+8], 0.000000, 0.000000);
		PlayerTextDrawTextSize(playerid, PinPTD[playerid][xy+8], 46.000000, 49.000000);
		PlayerTextDrawAlignment(playerid, PinPTD[playerid][xy+8], 1);
		PlayerTextDrawColor(playerid, PinPTD[playerid][xy+8], 623059967);
		PlayerTextDrawSetShadow(playerid, PinPTD[playerid][xy+8], 0);
		PlayerTextDrawSetOutline(playerid, PinPTD[playerid][xy+8], 0);
		PlayerTextDrawBackgroundColor(playerid, PinPTD[playerid][xy+8], 255);
		PlayerTextDrawFont(playerid, PinPTD[playerid][xy+8], 4);
		PlayerTextDrawSetProportional(playerid, PinPTD[playerid][xy+8], 0);
		PlayerTextDrawSetShadow(playerid, PinPTD[playerid][xy+8], 0);
		PlayerTextDrawSetSelectable(playerid, PinPTD[playerid][xy+8], true);
		PlayerTextDrawShow(playerid, PinPTD[playerid][xy+8]);
		PlayerTextID[playerid][PlayerText:PinPTD[playerid][xy+8]] = xy+1;

		PinPTD[playerid][xy+18] = CreatePlayerTextDraw(playerid, 263.190582 + ((xy%3) * 43.590), 170.253265 + ((xy/3)*45.613), nums);
		PlayerTextDrawLetterSize(playerid, PinPTD[playerid][xy+18], 0.548856, 2.191467);
		PlayerTextDrawAlignment(playerid, PinPTD[playerid][xy+18], 1);
		PlayerTextDrawColor(playerid, PinPTD[playerid][xy+18], -1061109505);
		PlayerTextDrawSetShadow(playerid, PinPTD[playerid][xy+18], 1);
		PlayerTextDrawSetOutline(playerid, PinPTD[playerid][xy+18], 0);
		PlayerTextDrawBackgroundColor(playerid, PinPTD[playerid][xy+18], -2139062186);
		PlayerTextDrawFont(playerid, PinPTD[playerid][xy+18], 3);
		PlayerTextDrawSetProportional(playerid, PinPTD[playerid][xy+18], 1);
		PlayerTextDrawSetShadow(playerid, PinPTD[playerid][xy+18], 1);
		PlayerTextDrawShow(playerid, PinPTD[playerid][xy+18]);
	}

	PinPTD[playerid][17] = CreatePlayerTextDraw(playerid, 290.323638, 286.946502, "ld_beat:chit");
	PlayerTextDrawLetterSize(playerid, PinPTD[playerid][17], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, PinPTD[playerid][17], 46.000000, 49.000000);
	PlayerTextDrawAlignment(playerid, PinPTD[playerid][17], 1);
	PlayerTextDrawColor(playerid, PinPTD[playerid][17], 623059967);
	PlayerTextDrawSetShadow(playerid, PinPTD[playerid][17], 0);
	PlayerTextDrawSetOutline(playerid, PinPTD[playerid][17], 0);
	PlayerTextDrawBackgroundColor(playerid, PinPTD[playerid][17], 255);
	PlayerTextDrawFont(playerid, PinPTD[playerid][17], 4);
	PlayerTextDrawSetProportional(playerid, PinPTD[playerid][17], 0);
	PlayerTextDrawSetShadow(playerid, PinPTD[playerid][17], 0);
	PlayerTextDrawSetSelectable(playerid, PinPTD[playerid][17], true);
	PlayerTextDrawShow(playerid, PinPTD[playerid][17]);
	PlayerTextID[playerid][PlayerText:PinPTD[playerid][17]] = 0;

	PinPTD[playerid][27] = CreatePlayerTextDraw(playerid, 307.728790, 299.593475, "0");
	PlayerTextDrawLetterSize(playerid, PinPTD[playerid][27], 0.548856, 2.191467);
	PlayerTextDrawAlignment(playerid, PinPTD[playerid][27], 1);
	PlayerTextDrawColor(playerid, PinPTD[playerid][27], -1061109505);
	PlayerTextDrawSetShadow(playerid, PinPTD[playerid][27], 1);
	PlayerTextDrawSetOutline(playerid, PinPTD[playerid][27], 0);
	PlayerTextDrawBackgroundColor(playerid, PinPTD[playerid][27], -2139062186);
	PlayerTextDrawFont(playerid, PinPTD[playerid][27], 3);
	PlayerTextDrawSetProportional(playerid, PinPTD[playerid][27], 1);
	PlayerTextDrawSetShadow(playerid, PinPTD[playerid][27], 1);
	PlayerTextDrawShow(playerid, PinPTD[playerid][27]);

	array_set:<_>PlayerVar[playerid][PinConst] => [0, 5];
	player_selected[playerid] = 5;
	SelectTextDraw(playerid, 0x3C3838FF);
	return true;
}

function SQL_CheckEmails(playerid) {
	if(cache_num_rows() == 0)
		return true;
	gString[0] = EOS;
	format(gString, 120, "{E6833C}** {FFFF00}You have %d email(s) unread. Use /email to read it. {E6833C}**", cache_num_rows());
	SCM(playerid, COLOR_WHITE, gString);

	return true;
}

std::CheckBanStatus(playerid) {
	HideInfo(playerid);
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, 256, "SELECT * FROM `bans` WHERE `Name`='%s' OR `IP`='%s' LIMIT 1", PlayerInfo[playerid][pName], GetIPP(playerid));
	mysql_tquery(SQL, gQuery, "SQL_CheckBanStatus", "i", playerid);
	return true;
}


function SQL_CheckBanStatus(playerid) {
	if(!cache_num_rows()) LoadingAccount(playerid);
	else {
		new sqlid, permanent, reason[40], time, by[MAX_PLAYER_NAME], ip[16];
				
		cache_get_value_name_int(0, "Userid", sqlid);
		cache_get_value_name_int(0, "Permanent", permanent);
		cache_get_value_name_int(0, "Time", time);
		cache_get_value_name(0, "Reason", reason);
		cache_get_value_name(0, "IP", ip);
		cache_get_value_name(0, "ByBanned", by);

		gString[0] = EOS;

		if(permanent == 1) {
			if(strcmp(GetIPP(playerid), ip, true) != 0) format(gString, 50, "This account (~y~%s~w~~h~) is banned!", GetName(playerid));
			else format(gString, 50, "This IP (~y~%s~w~~h~) is banned!", ip);
			format(gString, sizeof(gString), "%s Banned by %s. reason: %s~n~This is a permanent ban.~n~Poti posta o cere de unban pe ~b~~h~~h~http://"SERVER_NAME".ro~w~~h~ daca consideri ca ai luat ban degeaba.", gString, by, reason);
			ShowInfo(playerid, "~r~banned", gString, 3);
			KickEx(playerid);
			return true;
		}

		if(gettime() >= time) {
			LoadingAccount(playerid);
			gQuery[0] = EOS;
			mysql_format(SQL, gQuery, sizeof(gQuery), "DELETE FROM `bans` WHERE `Name`='%s' LIMIT 1", PlayerInfo[playerid][pName]);
			mysql_tquery(SQL, gQuery, "", "");
		} else {
			if(strcmp(GetIPP(playerid), ip, true) != 0) format(gString, 50, "This account (~y~%s~w~~h~) is banned!", GetName(playerid));
			else format(gString, 50, "This IP (~y~%s~w~~h~) is banned!", ip);

			time -= gettime();

			format(gString, sizeof(gString), "%s Banned by %s. reason: %s.~n~Ban will expire in %d days, %d hours and %d minutes left.~n~Poti posta o cere de unban pe ~b~~h~~h~http://"SERVER_NAME".ro~w~~h~ daca consideri ca ai luat ban degeaba.", 
			gString, by, reason, time/86400, ((time/3600) % 24), ((time/60) % 60), (time % 60));
			ShowInfo(playerid, "~r~banned", gString, 3);
			KickEx(playerid);
		}
	}
	return true;
}

camera(playerid) {
	PlayAudioStreamForPlayer(playerid, "https://uploadir.com/u/99fa6yej");
	SetPlayerPos(playerid, 2269.6021,-75.7587,26.7724);
	SetPlayerVirtualWorld(playerid, 999);
	InterpolateCameraPos(playerid, 1134.169433, -868.758972, 121.034400, 1368.606323, -857.733459, 107.390235, 20000);
	InterpolateCameraLookAt(playerid, 1138.062988, -866.186340, 119.239440, 1364.499267, -855.333679, 105.849632, 19900);
	SetTimerEx(#next_step_preview, 20000, false, #i, playerid);
	SetPlayerTime(playerid, 12, 0);
	SetPlayerWeather(playerid, 10);
}
redist::next_step_preview(playerid) {
	if(IsPlayerLogged(playerid)) return true;
	InterpolateCameraPos(playerid, 1820.987915, -2012.583129, 28.318222, 1888.502197, -2008.222167, 13.950808, 10000);
	InterpolateCameraLookAt(playerid, 1825.186523, -2012.289428, 25.619016, 1893.402099, -2007.663208, 13.126781, 9900);
	SetPlayerTime(playerid, 0, 0);
	SetPlayerWeather(playerid, 18);
	return true;
}

function LoadingAccount(playerid) {
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "SELECT * FROM `users` WHERE `name`='%s' LIMIT 1", GetName(playerid));
	mysql_tquery(SQL, gQuery, "CheckClassIP", "i", playerid);
	return true;
}

function CheckClassIP(playerid) {
	SetPlayerFacingAngle(playerid, 3.41);
	SetPlayerInterior(playerid, 0);
	TogglePlayerControllable(playerid, 0);
	PlayerVar[playerid][ServerTimer][1] = 90;
	PlayerVar[playerid][ServerTimer][0] = 2;
	camera(playerid);
	for(new i=0;i<20;i++) SCM(playerid, -1, "");
	switch(cache_num_rows()) {
		case 0: LoadRegister(playerid);
		case 1: {
			new status;
			cache_get_value_name_int(0, "Status", status);

			if(status != -1)
				return KickEx(playerid), SCM(playerid, COLOR_SERVER, "Este deja connectata o persoana pe acest cont.");

			PlayerVar[playerid][Incercari] = 2;
			ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD,"Login Account","Welcome back!\nPlease enter the password below.","Login","Cancel");
		}
	}
	return true;
}  
function OnPlayerLoginIn(playerid, password[]) {
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "SELECT * FROM `users` WHERE `name`='%s' AND `password`='%s' LIMIT 1", GetName(playerid), password);
	mysql_tquery(SQL, gQuery, "CheckAccount", "d", playerid);
	return true;
}