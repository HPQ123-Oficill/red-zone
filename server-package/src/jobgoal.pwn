
std::updateJobGoal(playerid, goal_amount=0) {
	if(ServerInfo_[sJobGoal] >= ServerInfo_[sMaxJobGoal]) return true;

	PlayerInfo[playerid][pJobGoal] += goal_amount/2;
	ServerInfo_[sJobGoal]+=goal_amount;

	if(PlayerInfo[playerid][pHud][1]) {
		format(gString, sizeof gString, "$%s / $%s", FormatNumber(PlayerInfo[playerid][pJobGoal]), FormatNumber(ServerInfo_[sMaxPJobGoal]));
	   	PlayerTextDrawSetString(playerid, GoalPTD[3], gString);

		if(ServerInfo_[sJobGoal] < ServerInfo_[sMaxJobGoal]) {
			format(gString, sizeof gString, "$%s / $%s", FormatNumber(ServerInfo_[sJobGoal]), FormatNumber(ServerInfo_[sMaxJobGoal]));
	   	 	TextDrawSetString(GoalTD[9], gString);
		} else {
			TextDrawSetString(GoalTD[9], "~g~completed..");
			ServerInfo_[sJobGoal] = ServerInfo_[sMaxJobGoal];
			foreach(new p: Player) UpdateVar(p, "JobGoal", PlayerInfo[p][pJobGoal]);
			mysql_tquery(SQL, "SELECT * FROM `users` ORDER BY `JobGoal` DESC LIMIT 3", "SQL_check_top_goal");
		}

		TextDrawTextSize(GoalTD[4], procentage(ServerInfo_[sJobGoal],ServerInfo_[sMaxJobGoal])*1.183, 11.310007);

		TextDrawDestroy(GoalTD[5]);
	    GoalTD[5] = TextDrawCreate(255.080352 + (procentage(ServerInfo_[sJobGoal],ServerInfo_[sMaxJobGoal])*1.176), 428.433288, "ld_beat:chit");
	    TextDrawLetterSize(GoalTD[5], 0.000000, 0.000000);
	    TextDrawTextSize(GoalTD[5], 15.000000, 17.000000);
	    TextDrawAlignment(GoalTD[5], 1);
	    TextDrawColor(GoalTD[5], -1975763457);
	    TextDrawSetShadow(GoalTD[5], 0);
	    TextDrawSetOutline(GoalTD[5], 0);
	    TextDrawBackgroundColor(GoalTD[5], 255);
	    TextDrawFont(GoalTD[5], 4);
	    TextDrawSetProportional(GoalTD[5], 0);
	    TextDrawSetShadow(GoalTD[5], 0);

	    new _max = procentage(PlayerInfo[playerid][pJobGoal],ServerInfo_[sMaxPJobGoal])>100?100:procentage(PlayerInfo[playerid][pJobGoal],ServerInfo_[sMaxPJobGoal]);
	    PlayerTextDrawTextSize(playerid, GoalPTD[1], _max*1.0, 6.879997);
	    PlayerTextDrawShow(playerid, GoalPTD[1]);

	    PlayerTextDrawDestroy(playerid, GoalPTD[2]);
	    GoalPTD[2] = CreatePlayerTextDraw(playerid, 265.857360 + (_max*0.98), 417.680145, "ld_beat:chit");
		PlayerTextDrawLetterSize(playerid, GoalPTD[2], 0.000000, 0.000000);
		PlayerTextDrawTextSize(playerid, GoalPTD[2], 9.709993, 10.309984);
		PlayerTextDrawAlignment(playerid, GoalPTD[2], 1);
		PlayerTextDrawColor(playerid, GoalPTD[2], 783576575);
		PlayerTextDrawSetShadow(playerid, GoalPTD[2], 0);
		PlayerTextDrawSetOutline(playerid, GoalPTD[2], 0);
		PlayerTextDrawBackgroundColor(playerid, GoalPTD[2], 255);
		PlayerTextDrawFont(playerid, GoalPTD[2], 4);
		PlayerTextDrawSetProportional(playerid, GoalPTD[2], 0);
		PlayerTextDrawSetShadow(playerid, GoalPTD[2], 0);
	    PlayerTextDrawShow(playerid, GoalPTD[2]);
	}

	foreach(new p: Player) {
		if(!PlayerInfo[p][pHud][1]) continue;

		TextDrawShowForPlayer(p,GoalTD[4]);
		TextDrawShowForPlayer(p,GoalTD[5]);
	}
	
	return true;
}

redist::SQL_check_top_goal() {
	if(!cache_num_rows()) return true;

	new top[3],top_id[3] = {-1, ...},i=-1,amount;

	while(++i<cache_num_rows()) {
		cache_get_value_name_int(i, "ID", top_id[i]);
		cache_get_value_name_int(i, "Status", top[i]);
		switch(i) {
			case 0: {
				mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `users` SET `Money` = `Money` + '130000', `PremiumPoints` = `PremiumPoints` + '%i', `Experience` = `Experience` + '20', `ServerPoints` = `ServerPoints` + '100' WHERE `id` = '%i'", (amount=RandomEx(3, 5)), top_id[i]);
				mysql_tquery(SQL, gQuery);
				if(top[i]!=-1) {
					GivePlayerCash(top[i], 100000);
					PlayerInfo[top[i]][pPremiumPoints] += (amount=RandomEx(2,5));
					GiveExperience(top[i], 20);
					SCMf(top[i], COLOR_YELLOW, "* Felicitari! Ai terminat Job Goal pe locul #1 si ai primit: $100.000, %d puncte premium si 170 experienta.", amount);
				}
			}
			case 1: {
				mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `users` SET `Money` = `Money` + '105000', `PremiumPoints` = `PremiumPoints` + '%i', `Experience` = `Experience` + '15', `ServerPoints` = `ServerPoints` + '100' WHERE `id` = '%i'", (amount=RandomEx(2, 4)), top_id[i]);
				mysql_tquery(SQL, gQuery);
				if(top[i]!=-1) {
					GivePlayerCash(top[i], 75000);
					PlayerInfo[top[i]][pPremiumPoints] += (amount=RandomEx(1,3));
					GiveExperience(top[i], 15);
					SCMf(top[i], COLOR_YELLOW, "* Felicitari! Ai terminat Job Goal pe locul #2 si ai primit: $75.000, %d puncte premium si 165 experienta.", amount);
				}
			}
			case 2: {
				mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `users` SET `Money` = `Money` + '65000', `Experience` = `Experience` + '160', `ServerPoints` = `ServerPoints` + '100' WHERE `id` = '%i'", top_id[i]);
				mysql_tquery(SQL, gQuery);
				if(top[i]!=-1) {
					GivePlayerCash(top[i], 35000);
					GiveExperience(top[i], 10);
					SCM(top[i], COLOR_YELLOW, "* Felicitari! Ai terminat Job Goal pe locul #3 si ai primit: $35.000 si 10 experienta.");
				}
			}
		}
	}
	foreach(new p: Player) {
		if(PlayerInfo[p][pJobGoal] < ServerInfo_[sMaxPJobGoal]) continue;

		GivePlayerCash(p, 30000);
		PlayerInfo[p][pServerPoints] += 100;
		checkBP(p, 32, 300);
		GiveExperience(p, 150);
		if(top[0] == p || top[1] == p || top[2] == p) {
			SCM(p, COLOR_YELLOW, "... +$30.000, 100 aky points, 150 experienta.");
		} else {
			SCM(p, COLOR_LGREEN, "(Job Goal) {FFFFFF}S-a terminat si ai primit $30.000, 100 aky points si 150 experienta pentru ca ai contribuit.");
		}
	}
	return true;
}

cmd:setgoal(playerid, params[]) {
	if(!IsAdmin(playerid, 5))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	if(sscanf(params, "i", params[0]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/setgoal [max goal]");

	ServerInfo_[sMaxJobGoal]=params[0];
	if(ServerInfo_[sJobGoal] < ServerInfo_[sMaxJobGoal]) ServerInfo_[sCompleted] = false;
	foreach(new p: Player) updateJobGoal(p);
	_query(128, "UPDATE `server` SET `MaxJobGoal`='%i'", params[0]);
	return true;
}
cmd:setplayergoal(playerid, params[]) {
	if(!IsAdmin(playerid, 5))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);
	
	if(sscanf(params, "i", params[0]))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/setplayergoal [max goal]");

	ServerInfo_[sMaxPJobGoal]=params[0];
	foreach(new p: Player) updateJobGoal(p);
	_query(128, "UPDATE `server` SET `MaxPJobGoal`='%i'", params[0]);
	return true;
}
cmd:resetgoal(playerid) {
	if(ServerInfo_[sJobGoal] < ServerInfo_[sMaxJobGoal]) return SCM(playerid, COLOR_LGREEN, "Eroare: Inca nu este terminat job goal.");

	ServerInfo_[sJobGoal] = 0;
	_query(128, "UPDATE `server` SET `JobGoal` = '0'",0);
	_query(128, "UPDATE `users` SET `JobGoal` = '0'",0);

	format(gString, sizeof gString, "* Admin %s a resetat job goal!", GetName(playerid));
	SendClientMessageToAll(COLOR_LGREEN, gString);
	foreach(new p: Player) PlayerInfo[p][pJobGoal] = 0, updateJobGoal(p);
	return true;
}

cmd:jobgoal(playerid) {
	mysql_tquery(SQL, "SELECT * FROM `users` ORDER BY `JobGoal` DESC LIMIT 3", "SQL_check_top", #i, playerid);
	return true;
}

redist::SQL_check_top(playerid) {
	new i = -1, name_[3][24], id_[3], val_[3];
	while(++i<3) {
		cache_get_value_name(i, "name", name_[i]);
		cache_get_value_name_int(i, "id", id_[i]);
		cache_get_value_name_int(i, "JobGoal", val_[i]);
	}
	format(gString, sizeof gString, "Top jucatori job goal:\n- %s cu $%s (ID: %d)\n- %s cu $%s (ID: %d)\n- %s cu $%s (ID: %d)", name_[0], FormatNumber(val_[0]), id_, name_[1], FormatNumber(val_[1]), id_[1], name_[2], FormatNumber(val_[2]), id_[2]);
	ShowPlayerDialog(playerid, DIALOG_ONLINE, DIALOG_STYLE_MSGBOX, "Top Job Goal", gString, "Close", "");
	return true;
}