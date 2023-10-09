#include <YSI_Coding\y_hooks>

new 
	bool:haveBowlls[MAX_PLAYERS],temp_bowling[MAX_PLAYERS],aim_bowling[MAX_PLAYERS],
	bowling_obj[40], bool:inHelp[MAX_PLAYERS], obj_carnval[46], carnavalEnds=-1, carnaval_act[9], carnaval_veh[4], basket_obj[3],
	deelayCarnaval[MAX_PLAYERS], varBoxing[2][4] = {{0, -1, -1, -5}, ...}, Text:SlotsTD[18], PlayerText:SlotsPTD[MAX_PLAYERS][7]
;

static const Float:load_bowlls[][] = {
	{706.9581,-767.0974,4254.0796},
	{711.5771,-767.1354,4254.0093},
	{715.6048,-767.3370,4254.1069}
};

static const Float:start_bowlls[][] = {
	{704.9075,-764.0792,4253.3760},
	{709.1318,-764.1673,4253.3760},
	{713.4269,-764.2476,4253.3760},
	{717.6887,-764.1781,4253.3760}
};

static const Float:camera_bowling[][] = {
	{706.108215, -755.886901, 4255.476074, 706.108215, -755.886901, 4255.476074},
	{711.225219, -755.525329, 4255.205078, 711.225219, -755.525329, 4255.205078},
	{710.889343, -755.898498, 4255.643554, 710.889343, -755.898498, 4255.643554},
	{716.469543, -755.877807, 4255.731933, 716.469543, -755.877807, 4255.731933}, // camera_pos

	{705.214233, -760.520263, 4253.822753, 705.146301, -751.399353, 4253.492187},
	{709.805725, -760.114685, 4253.818359, 709.659545, -751.280212, 4253.077148},
	{712.581481, -760.231933, 4253.811035, 712.635986, -751.904785, 4253.194335},
	{717.215515, -760.372619, 4253.672851, 717.404113, -751.606628, 4253.306152} // lok at
};
static const Float:max_bowlls_x[] = {704.96600,709.23517,713.54218,717.87207};

static const Float:pos_start_basket[][] = {
	{1371.1611, -39.9348, 1000.0630},
	{1371.1451, -24.8929, 1000.0630},
	{1371.1031, -9.8191, 1000.0630}
};

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {
	if(newkeys & KEY_SECONDARY_ATTACK) {
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 387.0921,-1817.9130,7.8410)) {
			SetPlayerPos(playerid, 720.0911,-774.7170,4253.3760);
			SetPlayerInterior(playerid, 69);
			SetPlayerVirtualWorld(playerid, 69); // enter
			SetTimerEx(#unfreeze_player, 2000, false, #i, playerid);
			TogglePlayerControllable(playerid, false);
			return true;
		}
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 720.0911,-774.7170,4253.3760)) return SetPlayerPos(playerid, 387.0921,-1817.9130,7.8410), SetPlayerInterior(playerid, 0), SetPlayerVirtualWorld(playerid, 0); // exit
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 387.6462,-1870.7006,7.8359)) {
			SetPlayerPos(playerid, 1405.1260,-48.5617,1000.9230);
			SetPlayerInterior(playerid, 69);
			SetPlayerVirtualWorld(playerid, 69);
			SetTimerEx(#unfreeze_player, 2000, false, #i, playerid);
			TogglePlayerControllable(playerid, false);
			return true;
		}
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 1405.1260,-48.5617,1000.9230)) return SetPlayerPos(playerid, 387.6462,-1870.7006,7.8359), SetPlayerInterior(playerid, 0), SetPlayerVirtualWorld(playerid, 0); // exit
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 382.7444,-2041.0813,7.8359)) {
			if(varBoxing[0][1] == playerid) return true;
			++varBoxing[0][0];
			varBoxing[0][varBoxing[0][0]] = playerid;
			SetPlayerPos(playerid, 386.2277,-2044.1738,8.6287);
			varBoxing[0][3]=60;
			if(varBoxing[1][0] == 1) SetTimerEx(#check_boxing_match, 1000, false, "if", 0, 0.0);
			if(varBoxing[0][0] == 2) {
				SetPlayerSkin(varBoxing[0][1], 81);
				SetPlayerPos(varBoxing[0][1],388.7609,-2042.4501,8.6287);
				SetPlayerFacingAngle(varBoxing[0][1], 138.9530);
				TogglePlayerControllable(varBoxing[0][1], false);
				SetPlayerHealth(varBoxing[0][1], 200.0);

				SetPlayerSkin(varBoxing[0][2], 80);
				SetPlayerPos(varBoxing[0][2],384.0763,-2046.6104,8.6287);
				SetPlayerFacingAngle(varBoxing[0][2], 336.8131);
				TogglePlayerControllable(varBoxing[0][2], false);
				SetPlayerHealth(varBoxing[0][2], 200.0);

				varBoxing[0][3]=-4;
			}
			return true;
		}
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 388.9983,-2034.8740,7.8359)) {
			++varBoxing[1][0];
			varBoxing[1][varBoxing[1][0]] = playerid;
			SetPlayerPos(playerid, 392.4829,-2038.3978,8.6287);
			varBoxing[1][3]=60;
			if(varBoxing[1][0] == 1) SetTimerEx(#check_boxing_match, 1000, false, "if", 1, 0.0);
			if(varBoxing[1][0] == 2) {
				SetPlayerSkin(varBoxing[1][1], 81);
				SetPlayerPos(varBoxing[1][1],394.7780,-2036.3284,8.6287);
				SetPlayerFacingAngle(varBoxing[1][1], 135.2163);
				TogglePlayerControllable(varBoxing[1][1], false);
				SetPlayerHealth(varBoxing[1][1], 200.0);

				SetPlayerSkin(varBoxing[1][2], 80);
				SetPlayerPos(varBoxing[1][2], 390.3783,-2040.6666,8.6287);
				SetPlayerFacingAngle(varBoxing[1][2], 316.9476);
				TogglePlayerControllable(varBoxing[1][2], false);
				SetPlayerHealth(varBoxing[1][2], 200.0);

				varBoxing[1][3]=-4;
			}
			return true;
		}
		return true;
	}
	if(newkeys & KEY_FIRE) {
		if(IsPlayerInRangeOfPoint(playerid, 1.5, 719.8739,-772.2777,4253.3760) && !inHelp[playerid]) {
			inHelp[playerid]=true;
			SetPlayerCameraPos(playerid, 717.626770, -770.625183, 4254.603027);
			SetPlayerCameraLookAt(playerid, 721.811340, -772.510070, 4252.619140);
			SCM(playerid, -1, "");
			SCMf(playerid, -1, "{6BBFB4}Bodyguard: {FFFFFF}Salut %s! Pentru a te putea juca", GetName(playerid));
			SetTimerEx(#next_help_camera, 2000, false, #i, playerid);
			ApplyAnimation(playerid,"PED","IDLE_CHAT",4.0,0,0,0,0,0);
			return true;
		}
		new x=-1;
		// no have bowling
		if(!haveBowlls[playerid]) {
			while(++x<sizeof load_bowlls) if(IsPlayerInRangeOfPoint(playerid, 1.5, load_bowlls[x][0], load_bowlls[x][1], load_bowlls[x][2])) {
				SetPlayerAttachedObject(playerid, 6, 3065, 6, 0.1099, 0.0660, 0.0229, 0.0000, 0.0000, -76.2000, 1.0000, 1.0000, 1.0000);
				ApplyAnimation(playerid,"BSKTBALL","BBALL_pickup",4.0,0,0,0,0,0);
				haveBowlls[playerid] = true;
				return true;
			} x=-1;
			while(++x<sizeof pos_start_basket) if(IsPlayerInRangeOfPoint(playerid, 1.3, pos_start_basket[x][0], pos_start_basket[x][1], pos_start_basket[x][2])) {
				if(deelayCarnaval[playerid] > gettime()) return SCMf(playerid, -1, "* Asteapta %d secunde pana poti da iar la cos! *", deelayCarnaval[playerid]-gettime());
				SetPlayerAttachedObject(playerid, 6, 2114, 5, 0.0669, 0.1309, -0.0450, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, 1.0000);
				ApplyAnimation(playerid, "BSKTBALL","BBALL_pickup",4.0,0,0,0,0,0);
				SetPlayerFacingAngle(playerid, 100.4125);
				if(basket_obj[x]!=0) DestroyDynamicObject(basket_obj[x]), basket_obj[x]=0;
				SetTimerEx(#next_anim_player, 1000, false, #ii, playerid, x);
				haveBowlls[playerid] = true;
				return true;
			}
		// have bowling
		} else {
			while(++x<sizeof start_bowlls) if(IsPlayerInRangeOfPoint(playerid, 1.5, start_bowlls[x][0], start_bowlls[x][1], start_bowlls[x][2])) {
				ApplyAnimation(playerid,"GRENADE","WEAPON_throwu",2.2,0,0,0,0,0,1);
				RemovePlayerAttachedObject(playerid, 6);
				haveBowlls[playerid] = false;
				new Float:_x,Float:y,Float:z; GetPlayerPos(playerid,_x,y,z);
				temp_bowling[playerid] = CreateDynamicObject(3065, _x+0.2, y, 4252.45, 0.0,0.0,0.0, 69, 69);
				aim_bowling[playerid] = random(100)<50?random(8):-random(8); _x=float(aim_bowling[playerid])/10.0;
				MoveDynamicObject(temp_bowling[playerid], max_bowlls_x[x]+_x, -748.0, 4252.45, 5.0, -180.0, 0.0, 0.0);

				// camera
				InterpolateCameraPos(playerid, camera_bowling[x][0], camera_bowling[x][1], camera_bowling[x][2], camera_bowling[x][3], camera_bowling[x][4], camera_bowling[x][5], 3000);
				InterpolateCameraLookAt(playerid, camera_bowling[x+4][0], camera_bowling[x+4][1], camera_bowling[x+4][2], camera_bowling[x+4][3], camera_bowling[x+4][4], camera_bowling[x+4][5], 3100);
				SetTimerEx(#reset_round_bowling, 5000, false, #iii, playerid, x, -1);
				return true;
			}
		}
	}
	return true;
}
cmd:pacanele(playerid) return init_slots(playerid);
std::init_slots(playerid, x=-1) {
	SlotsPTD[playerid][0] = CreatePlayerTextDraw(playerid, 396.124298, 202.179626, "ld_poke:cd1s");
	PlayerTextDrawLetterSize(playerid, SlotsPTD[playerid][0], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, SlotsPTD[playerid][0], 19.000000, 24.000000);
	PlayerTextDrawAlignment(playerid, SlotsPTD[playerid][0], 1);
	PlayerTextDrawColor(playerid, SlotsPTD[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, SlotsPTD[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, SlotsPTD[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, SlotsPTD[playerid][0], 255);
	PlayerTextDrawFont(playerid, SlotsPTD[playerid][0], 4);
	PlayerTextDrawSetProportional(playerid, SlotsPTD[playerid][0], 0);
	PlayerTextDrawSetShadow(playerid, SlotsPTD[playerid][0], 0);

	SlotsPTD[playerid][1] = CreatePlayerTextDraw(playerid, 374.348205, 202.179626, "ld_poke:cd1s");
	PlayerTextDrawLetterSize(playerid, SlotsPTD[playerid][1], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, SlotsPTD[playerid][1], 19.000000, 24.000000);
	PlayerTextDrawAlignment(playerid, SlotsPTD[playerid][1], 1);
	PlayerTextDrawColor(playerid, SlotsPTD[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, SlotsPTD[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, SlotsPTD[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, SlotsPTD[playerid][1], 255);
	PlayerTextDrawFont(playerid, SlotsPTD[playerid][1], 4);
	PlayerTextDrawSetProportional(playerid, SlotsPTD[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, SlotsPTD[playerid][1], 0);

	SlotsPTD[playerid][2] = CreatePlayerTextDraw(playerid, 352.552978, 202.152984, "ld_poke:cd1s");
	PlayerTextDrawLetterSize(playerid, SlotsPTD[playerid][2], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, SlotsPTD[playerid][2], 19.000000, 24.000000);
	PlayerTextDrawAlignment(playerid, SlotsPTD[playerid][2], 1);
	PlayerTextDrawColor(playerid, SlotsPTD[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, SlotsPTD[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, SlotsPTD[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, SlotsPTD[playerid][2], 255);
	PlayerTextDrawFont(playerid, SlotsPTD[playerid][2], 4);
	PlayerTextDrawSetProportional(playerid, SlotsPTD[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, SlotsPTD[playerid][2], 0);

	SlotsPTD[playerid][3] = CreatePlayerTextDraw(playerid, 330.414978, 202.226348, "ld_poke:cd1s");
	PlayerTextDrawLetterSize(playerid, SlotsPTD[playerid][3], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, SlotsPTD[playerid][3], 19.000000, 24.000000);
	PlayerTextDrawAlignment(playerid, SlotsPTD[playerid][3], 1);
	PlayerTextDrawColor(playerid, SlotsPTD[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, SlotsPTD[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, SlotsPTD[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, SlotsPTD[playerid][3], 255);
	PlayerTextDrawFont(playerid, SlotsPTD[playerid][3], 4);
	PlayerTextDrawSetProportional(playerid, SlotsPTD[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, SlotsPTD[playerid][3], 0);

	SlotsPTD[playerid][4] = CreatePlayerTextDraw(playerid, 308.019805, 202.146423, "ld_poke:cd1s");
	PlayerTextDrawLetterSize(playerid, SlotsPTD[playerid][4], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, SlotsPTD[playerid][4], 19.000000, 24.000000);
	PlayerTextDrawAlignment(playerid, SlotsPTD[playerid][4], 1);
	PlayerTextDrawColor(playerid, SlotsPTD[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, SlotsPTD[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, SlotsPTD[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, SlotsPTD[playerid][4], 255);
	PlayerTextDrawFont(playerid, SlotsPTD[playerid][4], 4);
	PlayerTextDrawSetProportional(playerid, SlotsPTD[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, SlotsPTD[playerid][4], 0);

	SlotsPTD[playerid][5] = CreatePlayerTextDraw(playerid, 318.223297, 321.853454, "Bet 10 tickets");
	PlayerTextDrawLetterSize(playerid, SlotsPTD[playerid][5], 0.187047, 1.164799);
	PlayerTextDrawTextSize(playerid, SlotsPTD[playerid][5], 0.000000, 68.000000);
	PlayerTextDrawAlignment(playerid, SlotsPTD[playerid][5], 2);
	PlayerTextDrawColor(playerid, SlotsPTD[playerid][5], -1);
	PlayerTextDrawUseBox(playerid, SlotsPTD[playerid][5], 1);
	PlayerTextDrawBoxColor(playerid, SlotsPTD[playerid][5], 255);
	PlayerTextDrawSetShadow(playerid, SlotsPTD[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, SlotsPTD[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, SlotsPTD[playerid][5], 255);
	PlayerTextDrawFont(playerid, SlotsPTD[playerid][5], 2);
	PlayerTextDrawSetProportional(playerid, SlotsPTD[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, SlotsPTD[playerid][5], 0);
	PlayerTextDrawShow(playerid, SlotsPTD[playerid][5]);

	SlotsPTD[playerid][6] = CreatePlayerTextDraw(playerid, 322.662384, 161.639984, "WIN 15 tickets");
	PlayerTextDrawLetterSize(playerid, SlotsPTD[playerid][6], 0.549714, 2.722133);
	PlayerTextDrawAlignment(playerid, SlotsPTD[playerid][6], 2);
	PlayerTextDrawColor(playerid, SlotsPTD[playerid][6], 16711935);
	PlayerTextDrawSetShadow(playerid, SlotsPTD[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, SlotsPTD[playerid][6], 1);
	PlayerTextDrawBackgroundColor(playerid, SlotsPTD[playerid][6], 255);
	PlayerTextDrawFont(playerid, SlotsPTD[playerid][6], 2);
	PlayerTextDrawSetProportional(playerid, SlotsPTD[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, SlotsPTD[playerid][6], 0);

	while(++x<4) TextDrawShowForPlayer(playerid, SlotsTD[x]); x=-1;
	while(++x<3) TextDrawShowForPlayer(playerid, SlotsTD[4+(x*3)+random(3)]);
	return true;
}

redist::check_boxing_match(mathch_id, Float:health) {
	switch(++varBoxing[mathch_id][3]) {
		case -4: return true;
		case -3: GameTextForPlayer(varBoxing[mathch_id][1], "~r~3", 1000, 4),	GameTextForPlayer(varBoxing[mathch_id][2], "~r~3", 1000, 4);
		case -2: GameTextForPlayer(varBoxing[mathch_id][1], "~y~2", 1000, 4),	GameTextForPlayer(varBoxing[mathch_id][2], "~y~2", 1000, 4);
		case -1: GameTextForPlayer(varBoxing[mathch_id][1], "~g~1", 1000, 4),	GameTextForPlayer(varBoxing[mathch_id][2], "~g~1", 1000, 4);
		case 0: {
			GameTextForPlayer(varBoxing[mathch_id][1], "~w~start!", 1000, 4),	GameTextForPlayer(varBoxing[mathch_id][2], "~w~start!", 1000, 4);
			TogglePlayerControllable(varBoxing[mathch_id][1], true), 			TogglePlayerControllable(varBoxing[mathch_id][2], true);
		}
		case 60: winBoxing(0,mathch_id);
		case 61..90: {
			switch(mathch_id) {
				case 0: if(!IsPlayerInArea(varBoxing[mathch_id][1],384.0,-2047.2,389.0,-2042.1)) return winBoxing(0, mathch_id);
				case 1: if(!IsPlayerInArea(varBoxing[mathch_id][1],390.2,-2040.9,395.2,-2036.0)) return winBoxing(0, mathch_id);
			}
		}
		case 91: winBoxing(0,mathch_id);
		default: {
			format(gString, sizeof gString, "~w~00:%02d", 60 - varBoxing[mathch_id][3]), 
			GameTextForPlayer(varBoxing[mathch_id][1], gString, 1100, 4),	GameTextForPlayer(varBoxing[mathch_id][2], gString, 1100, 4);

			switch(mathch_id) {
				case 0: {
					if(!IsPlayerInArea(varBoxing[mathch_id][1],384.0,-2047.2,389.0,-2042.1)) return winBoxing(2, mathch_id);
					if(!IsPlayerInArea(varBoxing[mathch_id][2],384.0,-2047.2,389.0,-2042.1)) return winBoxing(1, mathch_id);
				}
				case 1: {
					if(!IsPlayerInArea(varBoxing[mathch_id][1],390.2,-2040.9,395.2,-2036.0)) return winBoxing(2, mathch_id);
					if(!IsPlayerInArea(varBoxing[mathch_id][2],390.2,-2040.9,395.2,-2036.0)) return winBoxing(1, mathch_id);
				}
			}

			// check health player 1
			GetPlayerHealth(varBoxing[mathch_id][1], health);
			if(health < 100) return winBoxing(2, mathch_id);

			// check health player 1
			GetPlayerHealth(varBoxing[mathch_id][2], health);
			if(health < 100) return winBoxing(1, mathch_id);
		}
	}
	SetTimerEx(#check_boxing_match, 1000, false, "if", mathch_id, 0.0);
	return true;
}

std::winBoxing(win_id, mathch_id) {
	if(win_id != 0) {
		GameTextForPlayer(varBoxing[mathch_id][win_id], "~g~You win!~n~Ai primit un ticket!", 3000, 4);
		GameTextForPlayer(varBoxing[mathch_id][win_id==1?2:1], "~r~You Lose!", 3000, 4);
	}
	SetPlayerSkin(varBoxing[mathch_id][1], PlayerInfo[varBoxing[mathch_id][1]][pModel]);
	SetPlayerHealth(varBoxing[mathch_id][1], 100.0);
	SetPlayerPos(varBoxing[mathch_id][1],380.6807,-2034.1620,7.8359);
	if(varBoxing[mathch_id][2]!=-1) {
		SetPlayerSkin(varBoxing[mathch_id][2], PlayerInfo[varBoxing[mathch_id][2]][pModel]);
		SetPlayerHealth(varBoxing[mathch_id][2], 100.0);
		SetPlayerPos(varBoxing[mathch_id][2], 380.6807,-2034.1620,7.8359);
	}
	varBoxing[mathch_id][3]=-5;
	varBoxing[mathch_id][2] = varBoxing[mathch_id][1] = -1;
	varBoxing[mathch_id][0] = 0;
	return true;
}

redist::next_anim_player(playerid, pos) {
	ApplyAnimation(playerid, "BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0);
	SetTimerEx(#drop_basket_balls, 700, false, #ifffi, playerid, 0.0, 0.0, 0.0, pos);
	return true;
}
redist::drop_basket_balls(playerid, Float:x,Float:y,Float:z, pos) {
 	GetPlayerPos(playerid,x,y,z);
 	RemovePlayerAttachedObject(playerid, 6);
	temp_bowling[playerid] = CreateDynamicObject(2114, x-0.3, y, z+1.3, 0.0,0.0,0.0, 69, 69);
	MoveDynamicObject(temp_bowling[playerid], 1363.5494, pos_start_basket[pos][1], 1003.7628, 8.0, -180.0, 0.0, 0.0);
	Streamer_Update(playerid);
	SetTimerEx(#down_drop_balls, 700, false, #ii, playerid, pos);
	return true;
}
redist::down_drop_balls(playerid, pos) {
	new bool:win=false,Float:y;
	if(random(100)>50) win=true;
	else y=random(100)<50?0.5863:-0.5863;
	MoveDynamicObject(temp_bowling[playerid], 1359.9407, pos_start_basket[pos][1]+y, 1002.8464, 7.0, -360.0, 0.0, 0.0);
	SetTimerEx(#reset_basket, 1000, false, #iib, playerid, pos, win);
	return true;
}
redist::reset_basket(playerid, pos, bool:win) {
	if(win) {
		GameTextForPlayer(playerid, "~y~Ai primit un ticket", 5000, 4);
	} else GameTextForPlayer(playerid, "~r~Nu ai nimerit cosul!", 5000, 4);
	DestroyDynamicObject(temp_bowling[playerid]);
	if(basket_obj[pos] == 0) basket_obj[pos] = CreateDynamicObject(2114, pos_start_basket[pos][0],pos_start_basket[pos][1],pos_start_basket[pos][2], 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	Streamer_Update(playerid);
	haveBowlls[playerid] = false;
	deelayCarnaval[playerid] = gettime()+5;
	return true;
}

redist::next_help_camera(playerid) {
	SCM(playerid, -1, "{6BBFB4}Bodyguard: {FFFFFF}Apasa click de aici pentru a lua mingea de bowling.");
	InterpolateCameraPos(playerid, 717.626770, -770.625183, 4254.603027, 713.432617, -768.441162, 4254.532714, 2000);
	InterpolateCameraLookAt(playerid, 721.811340, -772.510070, 4252.619140, 716.685791, -766.112243, 4251.533691, 2100);
	SetTimerEx(#next_help_camera_1, 6000, false, #i, playerid);
	return true;
}

redist::next_help_camera_1(playerid) {
	InterpolateCameraPos(playerid, 713.432617, -768.441162, 4254.532714, 711.222961, -767.870178, 4255.336914, 2000);
	InterpolateCameraLookAt(playerid, 716.685791, -766.112243, 4251.533691, 713.055603, -764.846740, 4251.801269, 2100);
	SetTimerEx(#show_help_camera_2, 2000, false, #i, playerid);
	return true;
}

redist::show_help_camera_2(playerid) {
	GameTextForPlayer(playerid, "~l~x", 4000, 4);
	SCM(playerid, -1, "{6BBFB4}Bodyguard: {FFFFFF}Dupa vino aici si apasa click pentru a darma mingile de bowling!");
	SetTimerEx(#finish_help, 4000, false, #i, playerid);
	return true;
}

redist::finish_help(playerid) {
	SCM(playerid, -1, "{6BBFB4}Bodyguard: {FFFFFF}Dupa ce ai aruncat mingiea si daca darmi 3 mingi primesti un ticket daca darami");
	SCM(playerid, -1, "... 6 mingi primesti 2 tickete daca nu darami nimic nu primesti nimic :D");
	InterpolateCameraPos(playerid, 711.222961, -767.870178, 4255.336914, 712.171508, -751.804138, 4253.866210, 2000);
	InterpolateCameraLookAt(playerid, 713.055603, -764.846740, 4251.801269, 714.008300, -747.586486, 4251.907226, 2100);
	SetTimerEx(#finish_tut_ex, 5000, false, #i, playerid);
	return true;
}

redist::finish_tut_ex(playerid) {
	SetCameraBehindPlayer(playerid);
	inHelp[playerid]=false;
	return true;
}

redist::unfreeze_player(playerid) return TogglePlayerControllable(playerid, true);

redist::reset_round_bowling(playerid, stand, x) {
	SetCameraBehindPlayer(playerid);
	DestroyDynamicObject(temp_bowling[playerid]);

	new bowling = random(6)+1;
	switch(bowling) {
		case 0..2: format(gString, sizeof gString, "~w~ai darmat %d popice~n~nu ai primit nimic!", bowling);
		case 3..5: {
			format(gString, sizeof gString, "~w~ai darmat %d popice~n~ai primit 1 ticket!", bowling);
		}
		case 6: {
			format(gString, sizeof gString, "~w~ai darmat %d popice~n~ai primit 2 tickete!", bowling);
		}
	}
	GameTextForPlayer(playerid, gString, 5000, 4);
	return true;
}

std::createTriangleBowling(Float:x, plus=0, Float:y=-748.72, Float:z=4252.50, pos=-1) {
	new const _div[10] = {0,1,2,3,0,1,2,0,1,0}; x=x-0.23,y=y+0.28;
	while(++pos<10) {
		if(!_div[pos]) x=x+0.23,y=y-0.28;
	 	bowling_obj[pos+plus] = CreateDynamicObject(1238, x+(_div[pos]*0.47), y, z, 0.0, 0.0, 0.0, 69, 69);
	}
	return true;
}
hook OnGameModeInit() {
	SlotsTD[0] = TextDrawCreate(212.766784, 333.233459, "LD_SPAC:white");
	TextDrawLetterSize(SlotsTD[0], 0.000000, 0.000000);
	TextDrawTextSize(SlotsTD[0], 211.569686, 66.420089);
	TextDrawAlignment(SlotsTD[0], 1);
	TextDrawColor(SlotsTD[0], 255);
	TextDrawSetShadow(SlotsTD[0], 0);
	TextDrawSetOutline(SlotsTD[0], 0);
	TextDrawBackgroundColor(SlotsTD[0], 255);
	TextDrawFont(SlotsTD[0], 4);
	TextDrawSetProportional(SlotsTD[0], 0);
	TextDrawSetShadow(SlotsTD[0], 0);

	SlotsTD[1] = TextDrawCreate(215.062332, 335.759887, "LD_SPAC:white");
	TextDrawLetterSize(SlotsTD[1], 0.000000, 0.000000);
	TextDrawTextSize(SlotsTD[1], 67.000000, 61.000000);
	TextDrawAlignment(SlotsTD[1], 1);
	TextDrawColor(SlotsTD[1], -1);
	TextDrawSetShadow(SlotsTD[1], 0);
	TextDrawSetOutline(SlotsTD[1], 0);
	TextDrawBackgroundColor(SlotsTD[1], 255);
	TextDrawFont(SlotsTD[1], 4);
	TextDrawSetProportional(SlotsTD[1], 0);
	TextDrawSetShadow(SlotsTD[1], 0);

	SlotsTD[2] = TextDrawCreate(285.224060, 335.386505, "LD_SPAC:white");
	TextDrawLetterSize(SlotsTD[2], 0.000000, 0.000000);
	TextDrawTextSize(SlotsTD[2], 67.000000, 61.000000);
	TextDrawAlignment(SlotsTD[2], 1);
	TextDrawColor(SlotsTD[2], -1);
	TextDrawSetShadow(SlotsTD[2], 0);
	TextDrawSetOutline(SlotsTD[2], 0);
	TextDrawBackgroundColor(SlotsTD[2], 255);
	TextDrawFont(SlotsTD[2], 4);
	TextDrawSetProportional(SlotsTD[2], 0);
	TextDrawSetShadow(SlotsTD[2], 0);

	SlotsTD[3] = TextDrawCreate(355.057434, 335.513153, "LD_SPAC:white");
	TextDrawLetterSize(SlotsTD[3], 0.000000, 0.000000);
	TextDrawTextSize(SlotsTD[3], 67.000000, 61.000000);
	TextDrawAlignment(SlotsTD[3], 1);
	TextDrawColor(SlotsTD[3], -1);
	TextDrawSetShadow(SlotsTD[3], 0);
	TextDrawSetOutline(SlotsTD[3], 0);
	TextDrawBackgroundColor(SlotsTD[3], 255);
	TextDrawFont(SlotsTD[3], 4);
	TextDrawSetProportional(SlotsTD[3], 0);
	TextDrawSetShadow(SlotsTD[3], 0);

	SlotsTD[4] = TextDrawCreate(212.790542, 333.320007, "ld_slot:grapes");
	TextDrawLetterSize(SlotsTD[4], 0.000000, 0.000000);
	TextDrawTextSize(SlotsTD[4], 71.010002, 90.019790);
	TextDrawAlignment(SlotsTD[4], 1);
	TextDrawColor(SlotsTD[4], -1);
	TextDrawSetShadow(SlotsTD[4], 0);
	TextDrawSetOutline(SlotsTD[4], 0);
	TextDrawBackgroundColor(SlotsTD[4], 255);
	TextDrawFont(SlotsTD[4], 4);
	TextDrawSetProportional(SlotsTD[4], 0);
	TextDrawSetShadow(SlotsTD[4], 0);

	SlotsTD[5] = TextDrawCreate(283.647674, 333.346649, "ld_slot:grapes");
	TextDrawLetterSize(SlotsTD[5], 0.000000, 0.000000);
	TextDrawTextSize(SlotsTD[5], 71.010002, 90.019790);
	TextDrawAlignment(SlotsTD[5], 1);
	TextDrawColor(SlotsTD[5], -1);
	TextDrawSetShadow(SlotsTD[5], 0);
	TextDrawSetOutline(SlotsTD[5], 0);
	TextDrawBackgroundColor(SlotsTD[5], 255);
	TextDrawFont(SlotsTD[5], 4);
	TextDrawSetProportional(SlotsTD[5], 0);
	TextDrawSetShadow(SlotsTD[5], 0);

	SlotsTD[6] = TextDrawCreate(353.204650, 333.406494, "ld_slot:grapes");
	TextDrawLetterSize(SlotsTD[6], 0.000000, 0.000000);
	TextDrawTextSize(SlotsTD[6], 71.010002, 90.019790);
	TextDrawAlignment(SlotsTD[6], 1);
	TextDrawColor(SlotsTD[6], -1);
	TextDrawSetShadow(SlotsTD[6], 0);
	TextDrawSetOutline(SlotsTD[6], 0);
	TextDrawBackgroundColor(SlotsTD[6], 255);
	TextDrawFont(SlotsTD[6], 4);
	TextDrawSetProportional(SlotsTD[6], 0);
	TextDrawSetShadow(SlotsTD[6], 0);

	SlotsTD[7] = TextDrawCreate(231.485412, 325.079925, "7");
	TextDrawLetterSize(SlotsTD[7], 1.228188, 8.546133);
	TextDrawAlignment(SlotsTD[7], 1);
	TextDrawColor(SlotsTD[7], -1523963137);
	TextDrawSetShadow(SlotsTD[7], 0);
	TextDrawSetOutline(SlotsTD[7], 1);
	TextDrawBackgroundColor(SlotsTD[7], 255);
	TextDrawFont(SlotsTD[7], 2);
	TextDrawSetProportional(SlotsTD[7], 1);
	TextDrawSetShadow(SlotsTD[7], 0);

	SlotsTD[8] = TextDrawCreate(302.980712, 324.653259, "7");
	TextDrawLetterSize(SlotsTD[8], 1.228188, 8.546133);
	TextDrawAlignment(SlotsTD[8], 1);
	TextDrawColor(SlotsTD[8], -1523963137);
	TextDrawSetShadow(SlotsTD[8], 0);
	TextDrawSetOutline(SlotsTD[8], 1);
	TextDrawBackgroundColor(SlotsTD[8], 255);
	TextDrawFont(SlotsTD[8], 2);
	TextDrawSetProportional(SlotsTD[8], 1);
	TextDrawSetShadow(SlotsTD[8], 0);

	SlotsTD[9] = TextDrawCreate(373.166595, 324.553253, "7");
	TextDrawLetterSize(SlotsTD[9], 1.228188, 8.546133);
	TextDrawAlignment(SlotsTD[9], 1);
	TextDrawColor(SlotsTD[9], -1523963137);
	TextDrawSetShadow(SlotsTD[9], 0);
	TextDrawSetOutline(SlotsTD[9], 1);
	TextDrawBackgroundColor(SlotsTD[9], 255);
	TextDrawFont(SlotsTD[9], 2);
	TextDrawSetProportional(SlotsTD[9], 1);
	TextDrawSetShadow(SlotsTD[9], 0);

	SlotsTD[10] = TextDrawCreate(178.447418, 316.206542, "");
	TextDrawLetterSize(SlotsTD[10], 0.000000, 0.000000);
	TextDrawTextSize(SlotsTD[10], 133.000000, 102.000000);
	TextDrawAlignment(SlotsTD[10], 1);
	TextDrawColor(SlotsTD[10], -1);
	TextDrawSetShadow(SlotsTD[10], 0);
	TextDrawSetOutline(SlotsTD[10], 0);
	TextDrawBackgroundColor(SlotsTD[10], 0);
	TextDrawFont(SlotsTD[10], 5);
	TextDrawSetProportional(SlotsTD[10], 0);
	TextDrawSetShadow(SlotsTD[10], 0);
	TextDrawSetPreviewModel(SlotsTD[10], 19574);
	TextDrawSetPreviewRot(SlotsTD[10], -50.000000, 0.000000, 0.000000, 1.000000);

	SlotsTD[11] = TextDrawCreate(250.828369, 315.353210, "");
	TextDrawLetterSize(SlotsTD[11], 0.000000, 0.000000);
	TextDrawTextSize(SlotsTD[11], 133.000000, 102.000000);
	TextDrawAlignment(SlotsTD[11], 1);
	TextDrawColor(SlotsTD[11], -1);
	TextDrawSetShadow(SlotsTD[11], 0);
	TextDrawSetOutline(SlotsTD[11], 0);
	TextDrawBackgroundColor(SlotsTD[11], 0);
	TextDrawFont(SlotsTD[11], 5);
	TextDrawSetProportional(SlotsTD[11], 0);
	TextDrawSetShadow(SlotsTD[11], 0);
	TextDrawSetPreviewModel(SlotsTD[11], 19574);
	TextDrawSetPreviewRot(SlotsTD[11], -50.000000, 0.000000, 0.000000, 1.000000);

	SlotsTD[12] = TextDrawCreate(321.685485, 315.353210, "");
	TextDrawLetterSize(SlotsTD[12], 0.000000, 0.000000);
	TextDrawTextSize(SlotsTD[12], 133.000000, 102.000000);
	TextDrawAlignment(SlotsTD[12], 1);
	TextDrawColor(SlotsTD[12], -1);
	TextDrawSetShadow(SlotsTD[12], 0);
	TextDrawSetOutline(SlotsTD[12], 0);
	TextDrawBackgroundColor(SlotsTD[12], 0);
	TextDrawFont(SlotsTD[12], 5);
	TextDrawSetProportional(SlotsTD[12], 0);
	TextDrawSetShadow(SlotsTD[12], 0);
	TextDrawSetPreviewModel(SlotsTD[12], 19574);
	TextDrawSetPreviewRot(SlotsTD[12], -50.000000, 0.000000, 0.000000, 1.000000);

	SlotsTD[13] = TextDrawCreate(213.271499, 197.786788, "LD_SPAC:white");
	TextDrawLetterSize(SlotsTD[13], 0.000000, 0.000000);
	TextDrawTextSize(SlotsTD[13], 210.179901, 112.000000);
	TextDrawAlignment(SlotsTD[13], 1);
	TextDrawColor(SlotsTD[13], 1511528447);
	TextDrawSetShadow(SlotsTD[13], 0);
	TextDrawSetOutline(SlotsTD[13], 0);
	TextDrawBackgroundColor(SlotsTD[13], 255);
	TextDrawFont(SlotsTD[13], 4);
	TextDrawSetProportional(SlotsTD[13], 0);
	TextDrawSetShadow(SlotsTD[13], 0);

	SlotsTD[14] = TextDrawCreate(297.838775, 245.313079, "ld_poke:cd1h");
	TextDrawLetterSize(SlotsTD[14], 0.000000, 0.000000);
	TextDrawTextSize(SlotsTD[14], 43.000000, 51.000000);
	TextDrawAlignment(SlotsTD[14], 1);
	TextDrawColor(SlotsTD[14], -1);
	TextDrawSetShadow(SlotsTD[14], 0);
	TextDrawSetOutline(SlotsTD[14], 0);
	TextDrawBackgroundColor(SlotsTD[14], 255);
	TextDrawFont(SlotsTD[14], 4);
	TextDrawSetProportional(SlotsTD[14], 0);
	TextDrawSetShadow(SlotsTD[14], 0);

	SlotsTD[15] = TextDrawCreate(388.433746, 265.347015, "black");
	TextDrawLetterSize(SlotsTD[15], 0.279999, 1.536000);
	TextDrawTextSize(SlotsTD[15], 0.000000, 56.000000);
	TextDrawAlignment(SlotsTD[15], 2);
	TextDrawColor(SlotsTD[15], -1);
	TextDrawUseBox(SlotsTD[15], 1);
	TextDrawBoxColor(SlotsTD[15], 255);
	TextDrawSetShadow(SlotsTD[15], 0);
	TextDrawSetOutline(SlotsTD[15], 0);
	TextDrawBackgroundColor(SlotsTD[15], 255);
	TextDrawFont(SlotsTD[15], 2);
	TextDrawSetProportional(SlotsTD[15], 1);
	TextDrawSetShadow(SlotsTD[15], 0);
	TextDrawSetSelectable(SlotsTD[15], true);

	SlotsTD[16] = TextDrawCreate(249.700103, 266.147064, "red");
	TextDrawLetterSize(SlotsTD[16], 0.279999, 1.536000);
	TextDrawTextSize(SlotsTD[16], 0.000000, 56.000000);
	TextDrawAlignment(SlotsTD[16], 2);
	TextDrawColor(SlotsTD[16], -1);
	TextDrawUseBox(SlotsTD[16], 1);
	TextDrawBoxColor(SlotsTD[16], -16776961);
	TextDrawSetShadow(SlotsTD[16], 0);
	TextDrawSetOutline(SlotsTD[16], 0);
	TextDrawBackgroundColor(SlotsTD[16], 255);
	TextDrawFont(SlotsTD[16], 2);
	TextDrawSetProportional(SlotsTD[16], 1);
	TextDrawSetShadow(SlotsTD[16], 0);
	TextDrawSetSelectable(SlotsTD[16], true);

	SlotsTD[17] = TextDrawCreate(362.357055, 226.966674, "Previous cards");
	TextDrawLetterSize(SlotsTD[17], 0.226285, 1.177599);
	TextDrawAlignment(SlotsTD[17], 1);
	TextDrawColor(SlotsTD[17], -1);
	TextDrawSetShadow(SlotsTD[17], 0);
	TextDrawSetOutline(SlotsTD[17], 0);
	TextDrawBackgroundColor(SlotsTD[17], 255);
	TextDrawFont(SlotsTD[17], 1);
	TextDrawSetProportional(SlotsTD[17], 1);
	TextDrawSetShadow(SlotsTD[17], 0);

	new act = CreateActor(40,714.2523,-776.7820,4253.3779,3.2756);
	SetActorVirtualWorld(act, 69);
	ApplyActorAnimation(act, "COP_AMBIENT", "Coplook_loop", 4.0, 0, 1, 1, 1, -1);

	act = CreateActor(178,711.0220,-775.0984,4254.4932,179.3374);
	SetActorVirtualWorld(act, 69);
	ApplyActorAnimation(act, "WOP", "Dance_B13", 4.0, 1, 1, 1, 1, -1);

	act = CreateActor(185, 720.5667,-772.1685,4253.3760,86.5916);
	SetActorVirtualWorld(act, 69);
	ApplyActorAnimation(act, "COP_AMBIENT", "Coplook_loop", 4.0, 0, 1, 1, 1, -1);
	CreateDynamic3DTextLabel("Ai nevoie de ajutor?\nApasa click langa mine!", -1, 720.5667,-772.1685,4253.3760+1.1, 5.0);


	CreatePickup(19132, 23, 387.0921,-1817.9130,7.8410);
	CreateDynamic3DTextLabel("{A0F572}~CARNVAL BOWLING~\n{FFFFFF}Press \"ENTER\"", -1, 387.0921,-1817.9130,7.8410, 10.0);

	CreatePickup(19132, 23, 387.6462,-1870.7006,7.8359);
	CreateDynamic3DTextLabel("{A0F572}~CARNVAL BASKET~\n{FFFFFF}Press \"ENTER\"", -1, 387.6462,-1870.7006,7.8359, 10.0);

	CreatePickup(18952, 23, 382.7444,-2041.0813,7.8359);
	CreateDynamic3DTextLabel("{A0F572}~CARNVAL BOXING #1~\n{FFFFFF}Press \"ENTER\"", -1, 382.7444,-2041.0813,7.8359, 10.0);

	CreatePickup(18952, 23, 388.9983,-2034.8740,7.8359);
	CreateDynamic3DTextLabel("{A0F572}~CARNVAL BOXING #2~\n{FFFFFF}Press \"ENTER\"", -1, 388.9983,-2034.8740,7.8359, 10.0);

	new tmpobjid = CreateDynamicObject(18952, 738.986938, -762.860107, 4251.886230, 89.799995, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18642, "taser1", "lightning2-3", 0x00000000);

	createTriangleBowling(704.2847);
	createTriangleBowling(708.5104, 10);
	createTriangleBowling(712.7849, 20);
	createTriangleBowling(717.1154, 30);

	CreateDynamicObject(3065, 706.999023, -767.505981, 4253.028808, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(3065, 706.999023, -767.231018, 4253.028808, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(3065, 706.999023, -766.955017, 4253.028808, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(3065, 707.020019, -766.674987, 4253.028808, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(3065, 711.249023, -767.554992, 4253.028808, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(3065, 711.255981, -767.255004, 4253.028808, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(3065, 711.263000, -766.953979, 4253.028808, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(3065, 711.270996, -766.629028, 4253.028808, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(3065, 715.549011, -767.565979, 4253.028808, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(3065, 715.541015, -767.242004, 4253.028808, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(3065, 715.531005, -766.940979, 4253.028808, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(3065, 715.521972, -766.614990, 4253.028808, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19379, 706.645996, -773.403015, 4252.290039, 0.000000, 90.000000, 89.999969, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19379, 716.270996, -773.403015, 4252.290039, 0.000000, 90.000000, 89.999938, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19379, 716.267028, -762.901977, 4252.290039, 0.000000, 90.000000, 89.999938, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19379, 706.637023, -762.914978, 4252.290039, 0.000000, 90.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19379, 716.263977, -752.401000, 4252.290039, 0.000000, 90.000000, 89.999969, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19379, 706.629028, -752.414978, 4252.290039, 0.000000, 90.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19459, 701.906982, -773.841003, 4254.125976, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19459, 701.906982, -764.215026, 4254.125976, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19459, 701.906982, -754.588989, 4254.125976, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19459, 721.007019, -773.835021, 4254.125976, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19459, 721.006835, -764.222656, 4254.125976, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19459, 721.007019, -754.598999, 4254.125976, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19367, 721.007019, -748.193969, 4254.125976, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19367, 701.906250, -748.174804, 4254.125976, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19459, 706.793029, -778.590026, 4254.125976, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19459, 716.427001, -778.590026, 4254.125976, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19459, 706.690002, -747.127014, 4254.125976, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19459, 716.317016, -747.127990, 4254.125976, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(11247, 711.414978, -737.356018, 4252.799804, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(11247, 715.690002, -737.343017, 4252.799804, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(11247, 707.116027, -737.479003, 4252.799804, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(11247, 702.864990, -737.518981, 4252.799804, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(11247, 719.963989, -737.306030, 4252.799804, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19461, 706.599975, -748.210998, 4255.000000, 0.000000, 180.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19461, 716.218994, -748.210998, 4255.000000, 0.000000, 179.994506, 270.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(4731, 711.821289, -747.594726, 4255.230957, 0.000000, 179.994506, 329.743652, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1536, 720.898010, -776.219970, 4252.375976, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1536, 720.857971, -773.197021, 4252.375976, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19442, 701.942993, -776.247009, 4254.125976, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19442, 701.919006, -772.992980, 4254.125976, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19442, 701.926025, -769.593017, 4254.125976, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19442, 701.927001, -766.336975, 4254.125976, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19442, 701.909973, -762.908996, 4254.125976, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19442, 701.929992, -759.406982, 4254.125976, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19442, 701.937988, -755.806030, 4254.125976, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19442, 701.921020, -752.205017, 4254.125976, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19442, 701.952026, -748.780029, 4254.125976, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19442, 720.960021, -748.807006, 4254.125976, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19442, 720.958007, -752.107971, 4254.125976, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19442, 720.961975, -755.583984, 4254.125976, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19442, 720.992004, -759.284973, 4254.125976, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19442, 720.956970, -762.961975, 4254.125976, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19442, 720.924987, -766.637023, 4254.125976, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19442, 720.994995, -770.137023, 4254.125976, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19442, 720.965026, -773.562011, 4254.125976, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19442, 720.986022, -777.013000, 4254.125976, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19442, 718.851989, -778.541015, 4254.125976, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19442, 715.250976, -778.575988, 4254.125976, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19442, 711.398986, -778.567016, 4254.125976, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19442, 707.671997, -778.575988, 4254.125976, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19442, 704.046020, -778.588012, 4254.125976, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19121, 702.726989, -764.133972, 4252.500000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19121, 706.989990, -764.112976, 4252.500000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19121, 711.294006, -764.093994, 4252.500000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19121, 715.583007, -764.078125, 4252.500000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19121, 719.862976, -764.067993, 4252.500000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19122, 703.577026, -748.671997, 4252.500000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19122, 706.176025, -748.695007, 4252.500000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19123, 707.835998, -748.698974, 4252.500000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19123, 710.486022, -748.672973, 4252.500000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19125, 719.023010, -748.706970, 4252.500000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19125, 716.395996, -748.692016, 4252.500000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19124, 712.130981, -748.676025, 4252.500000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19124, 714.757995, -748.682006, 4252.500000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(3047, 707.304992, -767.065002, 4253.000000, 0.000000, 60.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(3047, 711.606018, -767.057983, 4253.000000, 0.000000, 59.996337, 179.994506, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(3047, 715.856018, -767.026000, 4253.000000, 0.000000, 59.996337, 179.994506, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1250, 711.528991, -767.588989, 4251.850097, 0.000000, 180.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1250, 711.518981, -766.864013, 4251.850097, 0.000000, 179.994506, 90.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1250, 715.778015, -767.575988, 4251.850097, 0.000000, 179.994506, 90.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1250, 715.802001, -766.874023, 4251.850097, 0.000000, 179.994506, 90.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1250, 707.202026, -766.916015, 4251.850097, 0.000000, 179.994506, 90.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1250, 707.219970, -767.590026, 4251.850097, 0.000000, 179.994506, 90.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2762, 704.747985, -770.950988, 4252.780761, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2762, 709.252990, -769.559020, 4252.780761, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2762, 713.549987, -770.773010, 4252.780761, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2762, 717.482971, -769.705017, 4252.780761, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1811, 705.862976, -770.926025, 4253.002929, 0.000000, 0.000000, 318.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1811, 704.896972, -772.629028, 4253.002929, 0.000000, 0.000000, 273.999267, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1811, 703.616027, -770.783996, 4253.002929, 0.000000, 0.000000, 187.999023, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1811, 710.031982, -771.145996, 4253.002929, 0.000000, 0.000000, 303.999023, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1811, 708.455993, -771.161987, 4253.002929, 0.000000, 0.000000, 233.997192, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1811, 710.515991, -769.491027, 4253.002929, 0.000000, 0.000000, 329.997192, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1811, 708.049987, -769.674987, 4253.002929, 0.000000, 0.000000, 229.996337, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1811, 712.682006, -771.044982, 4253.002929, 0.000000, 0.000000, 183.997192, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1811, 713.507019, -772.294982, 4253.002929, 0.000000, 0.000000, 267.993530, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1811, 714.666015, -770.875000, 4253.002929, 0.000000, 0.000000, 327.989501, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1811, 717.320983, -768.223999, 4253.002929, 0.000000, 0.000000, 117.985839, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1811, 716.666992, -769.635986, 4253.002929, 0.000000, 0.000000, 175.982177, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1811, 718.393981, -769.663024, 4253.002929, 0.000000, 0.000000, 305.979003, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1811, 717.505004, -771.273010, 4253.002929, 0.000000, 0.000000, 265.974731, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2774, 706.992980, -755.906982, 4264.000000, 0.000000, 0.000000, 359.750000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2774, 715.517028, -755.820983, 4264.000000, 0.000000, 0.000000, 359.747314, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2229, 707.291015, -756.468017, 4254.200195, 10.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2229, 715.817016, -756.328002, 4254.200195, 9.997557, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(14537, 711.091979, -780.427001, 4254.323242, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2125, 716.328002, -777.539978, 4252.686035, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2125, 716.286987, -776.012023, 4252.686035, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2125, 714.895996, -775.140991, 4252.686035, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2125, 713.317016, -775.172973, 4252.686035, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2125, 708.888977, -775.229003, 4252.686035, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2125, 706.736022, -775.320007, 4252.686035, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2125, 705.781982, -777.294982, 4252.686035, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2232, 702.172973, -778.390991, 4255.064941, 15.000000, 0.000000, 140.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2232, 720.799987, -778.270019, 4255.064941, 14.996336, 0.000000, 229.998779, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1455, 715.224975, -775.888977, 4253.564941, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1455, 706.531005, -777.544982, 4253.564941, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1486, 713.182006, -775.864990, 4253.638183, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1510, 714.098022, -776.056030, 4253.500000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1510, 707.810974, -775.947998, 4253.500000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1665, 706.564025, -777.249023, 4253.503906, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1520, 707.018005, -776.033020, 4253.493164, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1511, 708.330017, -778.414001, 4254.610839, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1511, 707.979003, -778.414001, 4254.610839, 0.000000, 0.000000, 179.994506, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1488, 713.408020, -778.189025, 4255.067871, 0.000000, 0.000000, 140.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1541, 714.177001, -778.453979, 4254.678222, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(1545, 711.440979, -777.893981, 4253.830078, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(948, 720.455017, -772.966979, 4252.375976, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(948, 720.455993, -776.515991, 4252.375976, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2251, 715.403991, -778.197021, 4254.335937, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2011, 702.848022, -765.713989, 4252.299804, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2011, 719.887023, -765.578979, 4252.299804, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19121, 715.409973, -775.909973, 4252.500000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19121, 706.890014, -776.065002, 4252.500000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2259, 702.486022, -767.901000, 4254.000000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2256, 720.895996, -768.383972, 4254.299804, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2693, 706.979003, -748.145996, 4254.600097, 10.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2692, 715.575012, -748.247009, 4254.600097, 9.997557, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2655, 711.301025, -748.320983, 4254.600097, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19453, 706.684570, -763.236328, 4257.000000, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19453, 716.309997, -763.236999, 4257.000000, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2312, 704.650024, -763.481018, 4255.500000, 15.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2312, 705.025024, -763.484985, 4255.500000, 14.996336, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2312, 709.325012, -763.484008, 4255.500000, 14.996336, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2312, 708.898986, -763.482971, 4255.500000, 14.996336, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2312, 713.674987, -763.482971, 4255.500000, 14.996336, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2312, 713.273986, -763.481994, 4255.500000, 14.996336, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2312, 718.125976, -763.474975, 4255.500000, 14.996336, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2312, 717.825012, -763.476989, 4255.500000, 14.996336, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19377, 707.161010, -773.856994, 4255.899902, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19377, 707.153991, -764.223999, 4255.899902, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19377, 717.645996, -773.695007, 4255.899902, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19377, 717.645019, -764.068969, 4255.899902, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19377, 707.146972, -754.588989, 4255.899902, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19377, 717.627014, -754.448974, 4255.899902, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19377, 717.642028, -744.814025, 4255.899902, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19377, 707.140991, -744.956970, 4255.899902, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 

	tmpobjid = CreateDynamicObject(14795, 1388.880004, -20.882799, 1005.089904, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19083, "laserpointer5", "laserbeam-5-64x64", 0x00000000);
	tmpobjid = CreateDynamicObject(19550, 1375.572998, 2.225044, 999.925476, 89.499916, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18657, "lightbeams", "blue-512x512", 0x00000000);
	tmpobjid = CreateDynamicObject(19550, 1375.572998, 3.105051, 999.922973, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "weewall256", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1359.898193, -35.005622, 1000.323059, 0.000000, 0.000000, -90.200103, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1363.361328, -35.017635, 1000.323059, 0.000000, 0.000000, -90.200103, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1366.810791, -35.029705, 1000.323059, 0.000000, 0.000000, -90.200103, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1370.261108, -35.041744, 1000.323059, 0.000000, 0.000000, -90.200103, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1373.720092, -35.053821, 1000.323059, 0.000000, 0.000000, -90.200103, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1377.171508, -35.065826, 1000.323059, 0.000000, 0.000000, -90.200103, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1380.632446, -35.077930, 1000.323059, 0.000000, 0.000000, -90.200103, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1359.898193, -29.975587, 1000.323059, -0.000007, 0.000000, -90.200080, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1363.361328, -29.987600, 1000.323059, -0.000007, 0.000000, -90.200080, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1366.810791, -29.999670, 1000.323059, -0.000007, 0.000000, -90.200080, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1370.261108, -30.011709, 1000.323059, -0.000007, 0.000000, -90.200080, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1373.720092, -30.023786, 1000.323059, -0.000007, 0.000000, -90.200080, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1377.171508, -30.035791, 1000.323059, -0.000007, 0.000000, -90.200080, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1380.632446, -30.047895, 1000.323059, -0.000007, 0.000000, -90.200080, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1359.898193, -19.995550, 1000.323059, -0.000014, 0.000000, -90.200057, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1363.361328, -20.007562, 1000.323059, -0.000014, 0.000000, -90.200057, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1366.810791, -20.019632, 1000.323059, -0.000014, 0.000000, -90.200057, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1370.261108, -20.031671, 1000.323059, -0.000014, 0.000000, -90.200057, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1373.720092, -20.043748, 1000.323059, -0.000014, 0.000000, -90.200057, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1377.171508, -20.055753, 1000.323059, -0.000014, 0.000000, -90.200057, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1380.632446, -20.067857, 1000.323059, -0.000014, 0.000000, -90.200057, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1359.898193, -14.955570, 1000.323059, -0.000022, 0.000000, -90.200035, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1363.361328, -14.967581, 1000.323059, -0.000022, 0.000000, -90.200035, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1366.810791, -14.979652, 1000.323059, -0.000022, 0.000000, -90.200035, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1370.261108, -14.991690, 1000.323059, -0.000022, 0.000000, -90.200035, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1373.720092, -15.003767, 1000.323059, -0.000022, 0.000000, -90.200035, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1377.171508, -15.015772, 1000.323059, -0.000022, 0.000000, -90.200035, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1380.632446, -15.027876, 1000.323059, -0.000022, 0.000000, -90.200035, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1359.898193, -4.995562, 1000.323059, -0.000029, 0.000000, -90.200012, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1363.361328, -5.007575, 1000.323059, -0.000029, 0.000000, -90.200012, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1366.810791, -5.019643, 1000.323059, -0.000029, 0.000000, -90.200012, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1370.261108, -5.031682, 1000.323059, -0.000029, 0.000000, -90.200012, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1373.720092, -5.043760, 1000.323059, -0.000029, 0.000000, -90.200012, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1377.171508, -5.055766, 1000.323059, -0.000029, 0.000000, -90.200012, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1380.632446, -5.067870, 1000.323059, -0.000029, 0.000000, -90.200012, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1359.898193, 0.044436, 1000.323059, -0.000037, 0.000000, -90.199989, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1363.361328, 0.032425, 1000.323059, -0.000037, 0.000000, -90.199989, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1366.810791, 0.020354, 1000.323059, -0.000037, 0.000000, -90.199989, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1370.261108, 0.008315, 1000.323059, -0.000037, 0.000000, -90.199989, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1373.720092, -0.003759, 1000.323059, -0.000037, 0.000000, -90.199989, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1377.171508, -0.015765, 1000.323059, -0.000037, 0.000000, -90.199989, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(3850, 1380.632446, -0.027868, 1000.323059, -0.000037, 0.000000, -90.199989, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_office_gls_text", 0x00000000);
	tmpobjid = CreateDynamicObject(19128, 1360.199096, -32.588306, 999.922973, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "AH_flroortile5", 0x00000000);
	tmpobjid = CreateDynamicObject(19128, 1364.199340, -32.588306, 999.922973, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "AH_flroortile5", 0x00000000);
	tmpobjid = CreateDynamicObject(19128, 1368.198608, -32.588306, 999.922973, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "AH_flroortile5", 0x00000000);
	tmpobjid = CreateDynamicObject(19128, 1372.249511, -32.588306, 999.922973, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "AH_flroortile5", 0x00000000);
	tmpobjid = CreateDynamicObject(19128, 1376.251342, -32.588306, 999.922973, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "AH_flroortile5", 0x00000000);
	tmpobjid = CreateDynamicObject(19128, 1380.221557, -32.588306, 999.922973, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "AH_flroortile5", 0x00000000);
	tmpobjid = CreateDynamicObject(19128, 1360.199096, -17.588268, 999.922973, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "AH_flroortile5", 0x00000000);
	tmpobjid = CreateDynamicObject(19128, 1364.199340, -17.588268, 999.922973, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "AH_flroortile5", 0x00000000);
	tmpobjid = CreateDynamicObject(19128, 1368.198608, -17.588268, 999.922973, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "AH_flroortile5", 0x00000000);
	tmpobjid = CreateDynamicObject(19128, 1372.249511, -17.588268, 999.922973, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "AH_flroortile5", 0x00000000);
	tmpobjid = CreateDynamicObject(19128, 1376.251342, -17.588268, 999.922973, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "AH_flroortile5", 0x00000000);
	tmpobjid = CreateDynamicObject(19128, 1380.221557, -17.588268, 999.922973, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "AH_flroortile5", 0x00000000);
	tmpobjid = CreateDynamicObject(19128, 1360.199096, -2.528260, 999.922973, 0.000000, 0.000014, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "AH_flroortile5", 0x00000000);
	tmpobjid = CreateDynamicObject(19128, 1364.199340, -2.528260, 999.922973, 0.000000, 0.000014, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "AH_flroortile5", 0x00000000);
	tmpobjid = CreateDynamicObject(19128, 1368.198608, -2.528260, 999.922973, 0.000000, 0.000014, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "AH_flroortile5", 0x00000000);
	tmpobjid = CreateDynamicObject(19128, 1372.249511, -2.528260, 999.922973, 0.000000, 0.000014, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "AH_flroortile5", 0x00000000);
	tmpobjid = CreateDynamicObject(19128, 1376.251342, -2.528260, 999.922973, 0.000000, 0.000014, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "AH_flroortile5", 0x00000000);
	tmpobjid = CreateDynamicObject(19128, 1380.221557, -2.528260, 999.922973, 0.000000, 0.000014, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "AH_flroortile5", 0x00000000);
	tmpobjid = CreateDynamicObject(14795, 1388.880004, -20.882799, 1005.089904, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4833, "airprtrunway_las", "tuntest1las", 0x00000000);
	tmpobjid = CreateDynamicObject(14795, 1388.880004, -20.882799, 1005.089904, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4833, "airprtrunway_las", "tuntest1las", 0x00000000);
	tmpobjid = CreateDynamicObject(14795, 1388.880004, -20.882799, 1005.089904, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4833, "airprtrunway_las", "tuntest1las", 0x00000000);
	tmpobjid = CreateDynamicObject(14795, 1388.880004, -20.882799, 1005.089904, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4833, "airprtrunway_las", "tuntest1las", 0x00000000);
	tmpobjid = CreateDynamicObject(14795, 1388.880004, -20.882799, 1005.089904, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "ws_bridgepavement2", 0x00000000);
	tmpobjid = CreateDynamicObject(3819, 1410.843505, -7.481256, 1000.845458, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3881, "apsecurity_sfxrf", "ws_rooftarmac2", 0x00000000);
	tmpobjid = CreateDynamicObject(3819, 1410.833862, -23.541275, 1000.845458, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3881, "apsecurity_sfxrf", "ws_rooftarmac2", 0x00000000);
	tmpobjid = CreateDynamicObject(19550, 1379.278442, -5.257433, 1010.022827, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 8486, "ballys02", "walltiles_128", 0x00000000);
	tmpobjid = CreateDynamicObject(11737, 1371.887939, -9.772938, 999.932983, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19058, "xmasboxes", "silk6-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(19550, 1413.186645, -12.440213, 1000.052490, 89.499916, -90.099624, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18657, "lightbeams", "blue-512x512", 0x00000000);
	tmpobjid = CreateDynamicObject(3819, 1410.783813, -43.141262, 1000.845458, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 3881, "apsecurity_sfxrf", "ws_rooftarmac2", 0x00000000);
	tmpobjid = CreateDynamicObject(11737, 1371.887939, -24.772958, 999.932983, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19058, "xmasboxes", "silk6-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(11737, 1371.887939, -39.822982, 999.932983, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19058, "xmasboxes", "silk6-128x128", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateDynamicObject(947, 1359.499755, -24.786178, 1002.084106, 0.000000, 0.000000, -89.899948, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(947, 1359.474365, -9.746214, 1002.084106, 0.000000, 0.000000, -89.899948, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(947, 1359.524536, -39.816101, 1002.084106, 0.000000, 0.000000, -89.899948, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2114, 1359.335815, -25.384681, 1000.062988, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2114, 1358.835327, -24.174686, 1000.062988, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2114, 1358.835327, -38.834659, 1000.062988, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2114, 1359.405883, -40.594665, 1000.062988, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2114, 1359.405883, -10.604681, 1000.062988, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2114, 1358.595092, -9.154681, 1000.062988, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(14467, 1360.152221, -32.191604, 1002.684082, 0.000000, 0.000000, 89.400054, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(14467, 1360.307861, -17.402404, 1002.684082, 0.000000, 0.000000, 89.400054, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(14467, 1360.468017, -2.233233, 1002.684082, 0.000000, 0.000000, 89.400054, -1, -1, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(10281, 1369.742309, 6.709342, 1003.484008, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(11714, 1405.25781, -49.21975, 1001.14093,   0.00000, 0.00000, -89.94001); // dors

	basket_obj[0] = CreateDynamicObject(2114, 1371.1611, -39.8334, 1000.0630, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	basket_obj[1] = CreateDynamicObject(2114, 1371.1451, -24.7589, 1000.0630, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	basket_obj[2] = CreateDynamicObject(2114, 1371.1031, -9.7567, 1000.0630, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	return true;
}

hook OnPlayerConnect(playerid) {
	RemoveBuildingForPlayer(playerid, 14795, 1388.880, -20.882, 1005.200, 0.250);
	deelayCarnaval[playerid] = -1;
	return true;
}

std::startCarnval(ends) {
	if(carnavalEnds>gettime()) return true;
	carnavalEnds=gettime()+ends;
	// carnval
    obj_carnval[0] = CreateDynamicObject(4735, 371.712036, -1797.077758, 26.805643, 0.000000, 0.000000, -89.999961, -1, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterialText(obj_carnval[0], 0, "{00FFFF} CARNAVAL", 40, "Ariel", 20, 1, 0x00000000, 0x00000000, 1);

    obj_carnval[1] = CreateDynamicObject(7893, 369.871551, -1805.139404, 7.090463, 1.992671, -0.170901, -0.497020, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[2] = CreateDynamicObject(7893, 369.870330, -1805.152221, 7.460226, 1.992671, -0.170901, -0.497020, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[3] = CreateDynamicObject(7893, 369.868927, -1805.167236, 7.889964, 1.992671, -0.170901, -0.497020, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[4] = CreateDynamicObject(3666, 363.084625, -1803.422973, 7.356195, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[5] = CreateDynamicObject(3666, 361.524353, -1803.422973, 7.356195, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[6] = CreateDynamicObject(3666, 375.785308, -1803.422973, 7.316187, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[7] = CreateDynamicObject(3666, 377.415161, -1802.742309, 7.316187, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[8] = CreateDynamicObject(3666, 379.505401, -1802.321899, 7.316187, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[9] = CreateDynamicObject(970, 387.107727, -1805.540771, 7.349871, 0.000000, 0.000000, -23.800027, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[10] = CreateDynamicObject(970, 381.883544, -1803.237182, 7.349871, 0.000000, 0.000000, -23.800027, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[11] = CreateDynamicObject(970, 387.107727, -1805.540771, 8.409876, 0.000000, 0.000000, -23.800027, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[12] = CreateDynamicObject(970, 381.883544, -1803.237182, 8.419881, 0.000000, 0.000000, -23.800027, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[13] = CreateDynamicObject(970, 387.107727, -1805.540771, 8.409876, 0.000000, 0.000000, -23.800027, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[14] = CreateDynamicObject(3666, 397.173828, -1788.621826, 5.232188, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[15] = CreateDynamicObject(3666, 400.054260, -1789.432617, 5.232188, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[16] = CreateDynamicObject(3666, 405.944152, -1791.938110, 5.252190, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[17] = CreateDynamicObject(11395, 390.859558, -2026.263305, 14.845904, 0.000000, 0.000000, 89.799964, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[18] = CreateDynamicObject(19128, 384.774322, -2028.635620, 6.835937, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[19] = CreateDynamicObject(19128, 384.774322, -2024.676025, 6.835937, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[20] = CreateDynamicObject(19128, 384.774322, -2020.706420, 6.835937, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[21] = CreateDynamicObject(19128, 388.733612, -2020.706420, 6.835937, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[22] = CreateDynamicObject(19128, 392.733276, -2020.706420, 6.835937, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[23] = CreateDynamicObject(19128, 392.733276, -2024.655761, 6.835937, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[24] = CreateDynamicObject(19128, 392.733276, -2028.725219, 6.835937, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[25] = CreateDynamicObject(19128, 392.733276, -2031.656250, 6.845936, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[26] = CreateDynamicObject(19128, 388.733581, -2031.656250, 6.845936, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[27] = CreateDynamicObject(19128, 384.743621, -2031.656250, 6.845936, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[28] = CreateDynamicObject(14781, 392.204223, -2038.906127, 7.800065, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[29] = CreateDynamicObject(14781, 386.054260, -2045.046386, 7.800065, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[30] = CreateDynamicObject(3434, 369.876159, -1938.995727, 17.351846, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[31] = CreateDynamicObject(3434, 369.876159, -1981.563354, 17.351846, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[32] = CreateDynamicObject(3434, 369.876159, -1884.612060, 17.351846, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[33] = CreateDynamicObject(3434, 369.876159, -1838.893920, 17.351846, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[34] = CreateDynamicObject(3434, 369.876159, -2046.211669, 17.351846, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[35] = CreateDynamicObject(3801, 388.122375, -1905.316040, 8.725945, 0.000000, 0.000000, 179.399871, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[36] = CreateDynamicObject(3801, 388.185424, -1899.244995, 8.725945, 0.000000, 0.000000, 179.399871, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[37] = CreateDynamicObject(3801, 388.250122, -1893.056152, 8.725945, 0.000000, 0.000000, 179.399871, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[38] = CreateDynamicObject(7073, 363.604919, -2058.884521, 32.788330, -2.100000, -0.200000, 89.700103, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[39] = CreateDynamicObject(3801, 387.804016, -1867.827392, 9.895959, 0.000000, 0.000000, 179.399871, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[40] = CreateDynamicObject(3801, 387.753967, -1872.648315, 9.895959, 0.000000, 0.000000, 179.399871, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[41] = CreateDynamicObject(3801, 387.853057, -1863.188232, 9.895959, 0.000000, 0.000000, 179.399871, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[42] = CreateDynamicObject(3801, 387.910980, -1857.586669, 9.895959, 0.000000, 0.000000, 179.399871, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[43] = CreateDynamicObject(3801, 387.806304, -1852.305297, 9.895959, 0.000000, 0.000000, 179.399871, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[44] = CreateDynamicObject(3801, 387.390960, -1847.069458, 9.765956, 0.000000, 0.000000, 179.399871, -1, -1, -1, 300.00, 300.00); 
    obj_carnval[45] = CreateDynamicObject(7073, 395.630950, -2061.302001, 32.303977, -2.100000, -0.200000, 89.700103, -1, -1, -1, 300.00, 300.00); 

    carnaval_veh[0] = CreateVehicle(596,366.6236,-1802.4144,7.5095,226.2205,1,1,-1); // police car
    carnaval_veh[1] = CreateVehicle(596,372.0357,-1803.1892,7.4010,314.1782,1,1,-1); // police car
    carnaval_veh[2] = CreateVehicle(407,364.7974,-1849.3953,7.9872,179.4166,1,1,-1); // pompieri
    carnaval_veh[3] = CreateVehicle(416,364.8892,-1867.6871,7.8938,179.8617,3,1,-1); // ambulanta

    carnaval_act[0] = CreateActor(285,368.2494,-1801.7795,7.7092,229.2690);
	ApplyActorAnimation(carnaval_act[0], "PED","IDLE_CHAT",4.0,1,0,0,0,0);

	carnaval_act[1] = CreateActor(285,369.3221,-1802.9224,7.6732,22.0088);
	ApplyActorAnimation(carnaval_act[1], "PED","IDLE_CHAT",4.0,1,0,0,0,0);

	carnaval_act[2] = CreateActor(266,365.4492,-1799.8927,7.8603,346.7701);
	ApplyActorAnimation(carnaval_act[2], "COP_AMBIENT", "Coplook_loop", 4.0, 0, 1, 1, 1, -1);

	carnaval_act[3] = CreateActor(281,374.0552,-1801.0619,7.7667,342.2149);
	ApplyActorAnimation(carnaval_act[3], "COP_AMBIENT", "Coplook_loop", 4.0, 0, 1, 1, 1, -1);

	carnaval_act[4] = CreateActor(282,383.6252,-1803.4597,7.8296,337.2014);
	ApplyActorAnimation(carnaval_act[4], "COP_AMBIENT", "Coplook_loop", 4.0, 0, 1, 1, 1, -1);

	carnaval_act[5] = CreateActor(277,367.1126,-1852.5212,7.6719,358.4589);
	ApplyActorAnimation(carnaval_act[5], "PED","IDLE_CHAT",4.0,1,0,0,0,0);

	carnaval_act[6] = CreateActor(279,366.9814,-1850.4739,7.6719,178.4589);
	ApplyActorAnimation(carnaval_act[6], "PED","IDLE_CHAT",4.0,1,0,0,0,0);

	carnaval_act[7] = CreateActor(276,364.9732,-1863.5070,7.8359,0.3317);
	ApplyActorAnimation(carnaval_act[7], "COP_AMBIENT", "Coplook_loop", 4.0, 0, 1, 1, 1, -1);

	carnaval_act[8] = CreateActor(275,376.3015,-1864.9843,7.8359,82.1124);
	ApplyActorAnimation(carnaval_act[8], "COP_AMBIENT", "Coplook_loop", 4.0, 0, 1, 1, 1, -1);
	return true;
}

std::stopCarnaval(i=-1) {
	while(++i<sizeof obj_carnval) DestroyDynamicObject(obj_carnval[i]); i=-1;
	while(++i<sizeof carnaval_act) DestroyActor(carnaval_act[i]); i=-1
	while(++i<sizeof carnaval_veh) DestroyVehicle(carnaval_veh[i]); i=-1;
	return true;
}