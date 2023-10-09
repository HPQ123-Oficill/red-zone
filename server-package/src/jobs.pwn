function SQL_LoadJobs() {
	printf("[MySQL] Jobs: %d", cache_num_rows());
	Sqljobs = cache_num_rows();
	if(cache_num_rows() == 0)
		return true;

	new bool: x = false, placework[50], pay[40], vehicles[40], position[30], vehpos[50];
	ClearString();
	new i=-1;
	while(++i<Sqljobs) {
		cache_get_value_name_int(i, "ID", JobInfo[i][jID]);
		cache_get_value_name_int(i, "Level", JobInfo[i][jLevel]);
		cache_get_value_name_int(i, "WorkStatus", x);

		cache_get_value_name(i, "Pay", pay);
		cache_get_value_name(i, "Vehicles", vehicles);
		cache_get_value_name(i, "Position", position);
		cache_get_value_name(i, "WorkPlace", placework);
		cache_get_value_name(i, "VehiclePos", vehpos);
		cache_get_value_name(i, "Name", JobInfo[i][jName]);

		sscanf(pay, "p<|>ii", JobInfo[i][jPay][0], JobInfo[i][jPay][1]);
		sscanf(vehpos, "p<|>ffff", JobInfo[i][jvPos][0], JobInfo[i][jvPos][1], JobInfo[i][jvPos][2], JobInfo[i][jvPos][3]);
		sscanf(placework, "p<|>fff", JobInfo[i][jWorkPos][0], JobInfo[i][jWorkPos][1], JobInfo[i][jWorkPos][2]);
		sscanf(position, "p<|>fff", JobInfo[i][jPos][0], JobInfo[i][jPos][1], JobInfo[i][jPos][2]);
		sscanf(vehicles, "p<|>iiiiii", JobInfo[i][jVehicles][0], JobInfo[i][jVehicles][1], JobInfo[i][jVehicles][2], JobInfo[i][jVehicles][3], JobInfo[i][jVehicles][4], JobInfo[i][jVehicles][5]);
	
		UpdateJobLabel(i);
		if(x) {
			CreatePickup(19130, 23, JobInfo[i][jWorkPos][0], JobInfo[i][jWorkPos][1], JobInfo[i][jWorkPos][2]);
			format(gString, 100, "Work Place\n{FFFFFF}Job '%s'\n(use {DB1515}/work{FFFFFF})", JobInfo[i][jName]);
	   	 	Create3DTextLabel(gString, 0xDB1515FF, JobInfo[i][jWorkPos][0], JobInfo[i][jWorkPos][1], JobInfo[i][jWorkPos][2], 40.0);
	   	 	AreaType[CreateDynamicSphere(JobInfo[i][jWorkPos][0], JobInfo[i][jWorkPos][1], JobInfo[i][jWorkPos][2], 40.0)]=AREA_COLISION;
		}
	}
	return true;
}

function UpdateJobLabel(jobid) {
	gString[0] = EOS;
	format(gString, sizeof(gString), "ID: {1DE450}%d\n{FFFFFF}Name: {1DE450}%s\n{FFFFFF}Level: {1DE450}%d\n{FFFFFF}Press {1DE450}Y{FFFFFF} to get job\nPress {1DE450}N{FFFFFF} to quit job",
		JobInfo[jobid][jID], JobInfo[jobid][jName],JobInfo[jobid][jLevel]);
	JobInfo[jobid][jLabel] = Create3DTextLabel(gString, 0xFFFFFFFF, JobInfo[jobid][jPos][0], JobInfo[jobid][jPos][1], JobInfo[jobid][jPos][2], 25.0);
	JobInfo[jobid][jPickup] = CreatePickup(1275, 23, JobInfo[jobid][jPos][0], JobInfo[jobid][jPos][1], JobInfo[jobid][jPos][2], -1);
	PickupInfo[JobInfo[jobid][jPickup]][pkType] = 4;
	PickupInfo[JobInfo[jobid][jPickup]][pkID] = jobid;
	return true;
}

YCMD:jobs(playerid, params[], help) {
	new szDialog[500];
	gString[0] = EOS;
	strcat(szDialog, "#\tName\tDistance\n");
	for(new i = 0; i < Sqljobs; i++) {
		format(gString, 100, "%d\t%s\t%.0fm\n", i+1, JobInfo[i][jName], GetPlayerDistanceFromPoint(playerid, JobInfo[i][jPos][0], JobInfo[i][jPos][1], JobInfo[i][jPos][2]));
		strcat(szDialog, gString);
	}
	format(gString, 30, "Jobs (%d)", Sqljobs);
	ShowPlayerDialog(playerid, DIALOG_JOBS, DIALOG_STYLE_TABLIST_HEADERS, gString, szDialog, "Select", "Close");
	return true;
}

YCMD:find(playerid, params[], help) {
	if(PlayerInfo[playerid][pJob] != 1 && !IsCop(playerid) && PlayerInfo[playerid][pMember] != 9)
		return SCM(playerid, COLOR_GREY, "Nu esti detectiv.");

	if(HaveCheckpoint(playerid))
		return ShowCancelCP(playerid);

	new id, Float: Pos[3];
	if(sscanf(params, "u", id))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/find [playerid/name]");

	if(playerid == id) 
		return true;

	if(!IsPlayerConnected(id))
		return SCM(playerid, COLOR_GREY, "Not player connected.");

	CheckPlayerMission(playerid, 5, 1);

	PlayerVar[playerid][Find] = id;
	GetPlayerPos(id, Pos[0], Pos[1], Pos[2]);

	PlayerTextDrawSetPreviewModel(playerid, FindPTD[0], GetPlayerSkin(id));
	PlayerTextDrawShow(playerid, FindPTD[0]);
	PlayerTextDrawShow(playerid, FindPTD[1]);

	UpdatePlayerFind(playerid);

	gString[0] = EOS;
	format(gString, sizeof(gString), "Ti-am pus find pe %s [ID: %d]. Distanta: %.0fm.", GetName(id), id, GetPlayerDistanceFromPoint(playerid, Pos[0], Pos[1], Pos[2]));
	SCM(playerid, COLOR_WHITE, gString);
	return true;
}

YCMD:getweed(playerid, params[], help) {
	if(PlayerInfo[playerid][pJob] != 8)
		return SCM(playerid, COLOR_GREY, "Nu ai jobul de drugs dealer.");

	if(IsPlayerInAnyVehicle(playerid))
		return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta comanda din masina.");

	if(drugCP[playerid] != 0)
		return SCM(playerid, COLOR_GREY, "Colectezi deja drogurile.");

	if(GetPlayerCash(playerid) < 1500)
		return SCM(playerid, COLOR_WHITE, "Ai nevoie de $1.500.");

	SCM(playerid, -1, "{C380C6}(Job) {FFFFFF}Urmareste checkpoint-urile pentru a-ti lua drogurile.");

	new x = random(9);
	SetPlayerCheckpointEx(playerid, CP_DRUGS, WeedPos[x][0], WeedPos[x][1], WeedPos[x][2], 2.0);
	return true;
}

YCMD:selldrugs(playerid, params[], help) {
    if(PlayerInfo[playerid][pJob] != 8) 
    	return SCM(playerid, COLOR_WHITE, "You are not a drugs dealer.");

	new playa,needed,money;
	if(sscanf(params, "uii",playa,needed,money)) 
		return SCM(playerid, COLOR_GREY, "Syntax:{FFFFFF} /selldrugs [name/playerid] [drugs] [price]");
	
	if(!IsPlayerConnected(playa)) return SCM(playerid, COLOR_GREY, "Acel player nu este connectat.");
	if(!IsPlayerLogged(playa)) return SCM(playerid,COLOR_GREY, "Acel player nu este logat.");
	if(needed < 1 || needed > 100) return SCM(playerid, COLOR_WHITE, "Drugs ammount can't be lower then 1, or above 100.");
	if(money < 1 || money > 1000000) return SCM(playerid, COLOR_WHITE, "Price can't be lower then 1$, or above 1.000,000$.");
	if(needed > PlayerInfo[playerid][pDrugs]) return SCM(playerid, COLOR_WHITE, "You dont have that ammount of drugs with you.");
 	if(!PlayerOfRangeToPlayer(playerid, 5, playa)) return SCM(playerid, COLOR_WHITE, "This player is not near you.");
   	if(playa == playerid) return SCM(playerid, COLOR_WHITE, "Cant sell to yourself.");
    gString[0] = (EOS);
    format(gString, 128, "You offered %s to buy %d gram of drugs for $%s.", GetName(playa), needed, FormatNumber(money));
    SCM(playerid, COLOR_SERVER, gString);
    format(gString, 128, "Drug dealer %s wants to sell you %d grams of drugs for $%s, type /accept drugs %d to buy them.", GetName(playa), needed, FormatNumber(money),playerid);
	SCM(playa, COLOR_YELLOW, gString);
 	DrugOffer[playa] = playerid;
	DrugPrice[playa] = money;
	DrugGram[playa] = needed;
	return true; 
}

alias:sellmats("sellmaterials");
CMD:sellmats(playerid, params[]) {
	if(PlayerInfo[playerid][pPlaying] < 5 * 3600) return SCM(playerid, -1, "Ai nevoie de minim 5 ore jucate.");
    if(PlayerInfo[playerid][pJob] != 7) return SCM(playerid, COLOR_GREY, "You are not an arms dealer.");
    new id,mats,price;
    if(sscanf(params, "uii",id,mats,price)) return SCM(playerid, COLOR_GREY, "Syntax:{FFFFFF} /sellmaterials [name/playerid] [materials] [price]");
    if(price < 1 || price > 5000000) return SCM(playerid, COLOR_GREY, "Price can't be lower than $1, or above $5,000,000.");
    if(mats < 1 || mats > 500000) return SCM(playerid, COLOR_GREY, "Mats ammount can't be lower than 1, or above 500,000.");
  	if(!IsPlayerConnected(id)) return SCM(playerid, COLOR_GREY, "Player not connected.");
  	if(!IsPlayerLogged(id)) return SCM(playerid, COLOR_GREY, "Player not logged.");
    if(playerid == id) return SCM(playerid, COLOR_GREY, "You can not sell materials to yourself.");
    if(id == INVALID_PLAYER_ID) return SCM(playerid, -1, "Acel player nu este conectat.");
    if(!PlayerOfRangeToPlayer(playerid, 5, id)) return SCM(playerid, COLOR_GREY, "Acel player nu este in apropierea ta.");
    if(mats > PlayerInfo[playerid][pMats]) return SCM(playerid, COLOR_WHITE, "You don't have so many materials to sell.");
    SCMf(playerid, COLOR_SERVER, "You offered %s, %d materials for %s$.",GetName(id),mats,FormatNumber(price));
    SCMf(id, COLOR_YELLOW, "%s offered you %d materials for %s$, type /accept mats %d to accept the offer.",GetName(playerid),mats,FormatNumber(price),playerid);
    MatsOffer[id] = playerid; MatsPrice[id] = price; MatsAmmo[id] = mats;
    return true; } 

YCMD:takedrugs(playerid, params[], help) {
	if(PlayerInfo[playerid][pJob] != 8)
		return SCM(playerid, COLOR_GREY, "Nu ai jobul de drugs dealer.");

	if(!PlayerToPoint(playerid, 3.0, -1117.5424,-1617.7139,76.3739) && !PlayerToPoint(playerid, 3.0, -1117.6886,-1623.8833,76.3739))
		return SCM(playerid, COLOR_GREY, "Nu esti la Drugs Point.");

	if(drugCP[playerid] < 5)
		return SCM(playerid, COLOR_LGREEN, "Nu ai luat drugurile.");

	if(GetPlayerCash(playerid) < 1500)
		return SCM(playerid, COLOR_WHITE, "Ai nevoie de $1.500.");

	drugCP[playerid] = 0;
	gString[0] = EOS;
	GivePlayerCash(playerid, -1500);
	new r = RandomEx(20, 30);
	format(gString, 100, "{C380C6}(Job) {FFFFFF}Ai primit %d grame de droguri pentru munca ta.", r);
	SCM(playerid, COLOR_WHITE, gString);

	PlayerInfo[playerid][pDrugs] += r;
	UpdateVar(playerid, "Drugs", PlayerInfo[playerid][pDrugs]);
	return true;
}

YCMD:fish(playerid, params[], help) {
	if(PlayerInfo[playerid][pJob] != 2) 
		return SCM(playerid, COLOR_GREY, "Nu ai jobul de fisher.");

	if(!PlayerInfo[playerid][pVip] && PlayerVar[playerid][Fish][0] != 0)
		return SCM(playerid, COLOR_GREY, "Ai prins deja un peste, du-te la un biz 24/7 pentru a-l vinde [/gps]!");
	else if(PlayerVar[playerid][Fish][1] != 0)
		return SCM(playerid, COLOR_GREY, "Ai prins deja doi pesti, du-te la un biz 24/7 pentru a-i vinde [/gps]!");

	if(!IsPlayerInArea(playerid, 1583.97, 571.51, 1657.97, 602.51))
		return SCM(playerid, COLOR_GREY, "Nu te afli in zona de fish.");

	if(IsPlayerInAnyVehicle(playerid))
		return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta comanda dintr-o masina.");

	if(GetPlayerAnimationIndex(playerid) == 1130) 
		return SCM(playerid, COLOR_GREY, "You cannot use this command when you fall.");

	if(PlayerVar[playerid][FishTimer] != 0)
		return true;

	checkBP(playerid, 0, 150); 

	JobTime[playerid] = gettime();
	PlayerVar[playerid][FishTimer] = 10;
	GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~You are fishing now~n~~w~~h~Waiting...", 2000, 3);
	TogglePlayerControllable(playerid, false);
	OnePlayAnim(playerid,"PED","IDLE_CHAT",4.0,1,0,0,0,0);
	SetPlayerAttachedObject(playerid, 0, 18632,6,0.079376,0.037070,0.007706,181.482910,0.000000,0.000000,1.000000,1.000000,1.000000);
	return true;
}

function GiveFish(playerid) {
	if(PlayerInfo[playerid][pJob] != 2) return true;
    RemovePlayerAttachedObject(playerid, false);
    ClearAnimations(playerid);
	TogglePlayerControllable(playerid, true);
    if(!IsPlayerInArea(playerid, 1583.97, 571.51, 1657.97, 602.51)) return SCM(playerid, COLOR_GREY, "Nu ai primit pestele pentru ca nu esti in zona de unde prinzi pestele!");
    new x=RandomEx(200, 400);
   	switch(random(500)) {
		case 476..500: {
			x += 150;
			format(gString, sizeof(gString), "Ai prins un peste foarte rar care valoreaza $%s!", FormatNumber(x));
			SCM(playerid, 0x332FCDFF, gString);	
			SCM(playerid, COLOR_WHITE, "Pentru a vinde pestele, trebuie sa mergi la un bizz de tip 24/7. [/gps]");
			format(gString, sizeof(gString), "* %s a prins un peste foarte rar ce valoreaza $%s.", GetName(playerid), FormatNumber(x));
			ProxDetectorEx(20, playerid, gString, COLOR_YELLOW);				
		}
		case 450..475: {
			x += 100;
			format(gString, sizeof(gString), "Ai prins un peste rar care valoreaza $%s!", FormatNumber(x));
			SCM(playerid, 0x4A46FFFF, gString);	
			SCM(playerid, COLOR_WHITE, "Pentru a vinde pestele, trebuie sa mergi la un bizz de tip 24/7. [/gps]");
			format(gString, sizeof(gString), "* %s a prins un peste rar ce valoreaza $%s.", GetName(playerid), FormatNumber(x));
			ProxDetectorEx(20, playerid, gString, COLOR_YELLOW);			
		}
		default: {
			format(gString, sizeof(gString), "Ai prins un peste normal care valoreaza $%s!", FormatNumber(x));
			SCM(playerid, COLOR_YELLOW, gString);	
			SCM(playerid, COLOR_WHITE, "Pentru a vinde pestele, trebuie sa mergi la un bizz de tip 24/7. [/gps]");
			format(gString, sizeof(gString), "* %s a prins un peste normal ce valoreaza $%s.", GetName(playerid), FormatNumber(x));
			ProxDetectorEx(20, playerid, gString, COLOR_YELLOW);	
		}			
	}
	PlayerVar[playerid][Fish][!PlayerVar[playerid][Fish][0]?0:1] = x;
	return true;
}
GetPlayerPizza(playerid) {
	new x=0,j=0;
	while(x<4) {
		if(PizzaHouse[playerid][x]) j++;
		x++;
	}
	return j;
}
function GiveJobMoney(playerid, money, skill, expmin, maxexp) {
	new string[120];
	new job = PlayerInfo[playerid][pJob]-1, bonus, totalmoney = money;
	addSkillJob(playerid, job, skill);
	PlayerInfo[playerid][pServerPoints] += 3;
	checkBP(playerid, 14, 300, 3);
	GiveExperience(playerid, RandomEx(expmin, maxexp));
	gString = "~n~";
	format(string, 50, "money: ~g~$%s", FormatNumber(money));
	strcat(gString, string);
	if(PlayerInfo[playerid][pSkill][job]>1) {
		bonus = ((money/4) * PlayerInfo[playerid][pSkill][job]);
		format(string, 75, "~n~~p~+$%s for skill %d", FormatNumber(bonus), PlayerInfo[playerid][pSkill][job]);
		strcat(gString, string);
		totalmoney += bonus;
	}
	if(PlayerInfo[playerid][pJobBoost]) {
		bonus = val_procentage(money, GetSkinMoney(PlayerInfo[playerid][pJobProcent])%);
		format(string, 75, "~n~~p~+$%s job boost (%d%%)", FormatNumber(bonus), PlayerInfo[playerid][pJobProcent]);
		strcat(gString, string);
		totalmoney += bonus;
	}
	if(GetSkinRare(PlayerInfo[playerid][pModel])) {
		bonus = val_procentage(money, GetSkinMoney(PlayerInfo[playerid][pModel])%);
		format(string, sizeof string, "~n~~w~~h~skin %s: ~g~$%s ~w~~h~(%d%%)", GetSkinType(PlayerInfo[playerid][pModel]), FormatNumber(bonus), GetSkinMoney(PlayerInfo[playerid][pModel]));
		strcat(gString, string);
		totalmoney += bonus;
	}
	if(PlayerInfo[playerid][pPremiumAccount]) {
		bonus = val_procentage(money, 30%);
		format(string, sizeof string, "~n~~w~~h~Premium Account: ~g~$%s ~w~~h~(30%%)", FormatNumber(bonus));
		strcat(gString, string);
		totalmoney += bonus;		
	}
	if(GetClan[PlayerInfo[playerid][pClan]] != -1) {
		new cl = GetClan[PlayerInfo[playerid][pClan]];
		ClanInfo[cl][clSafebox] += money/3;
		gQuery[0] = EOS;
		mysql_format(SQL, gQuery, 150, "UPDATE `clans` SET `Safebox` = '%d' WHERE `ID` = '%d'", ClanInfo[cl][clSafebox], ClanInfo[cl][clID]);
		mysql_tquery(SQL, gQuery);
		mysql_format(SQL, gQuery, 150, "UPDATE `users` SET `ClanMoney` = `ClanMoney` + '%d' WHERE `id` = '%d'", money/3, PlayerInfo[playerid][pSQLID]);
		mysql_tquery(SQL, gQuery);
		format(string, 50, "Clan Safebox: +$%s", FormatNumber(money/3));
		SCM(playerid, COLOR_YELLOW, string);
	}
	format(string, sizeof string, "~n~~w~~h~Total: ~g~$%s", FormatNumber(totalmoney));
	strcat(gString, string);
	new time = gettime() - JobTime[playerid];
	format(string, sizeof string, "~n~~w~~h~Time: ~y~%02d:%02d~n~", ((time/60) % 60), time % 60);
	strcat(gString, string);
	PlayerTextDrawSetString(playerid, JobPTD, gString);
	PlayerTextDrawShow(playerid, JobPTD);
	PlayerTextDrawShow(playerid, JobTD);
	updateJobGoal(playerid, totalmoney);
	GivePlayerCash(playerid, totalmoney);
	HideJob[playerid] = gettime() + 7;
	return true;
}

std::addSkillJob(playerid, job, skill=1) {
	if(PlayerInfo[playerid][pSkill][job] < MAX_JOBS_SKILLS) {
		PlayerInfo[playerid][pJobSkill][job] += skill;
		format(gString, sizeof(gString), "For skill %d you need %d skill points (%d/%d).", 
			PlayerInfo[playerid][pSkill][job]+1, MAX_SKILLPOINTS_JOB*PlayerInfo[playerid][pSkill][job], PlayerInfo[playerid][pJobSkill][job], 
		MAX_SKILLPOINTS_JOB*PlayerInfo[playerid][pSkill][job]);
		SCM(playerid, COLOR_YELLOW, gString);

		if(PlayerInfo[playerid][pJobSkill][job] >= MAX_SKILLPOINTS_JOB*PlayerInfo[playerid][pSkill][job]) {
			PlayerInfo[playerid][pJobSkill][job] -= MAX_SKILLPOINTS_JOB*PlayerInfo[playerid][pSkill][job];
			PlayerInfo[playerid][pSkill][job] ++;
			ShowPlayerInfo(playerid, 1);
			save_jobskill(playerid);
			if(PlayerInfo[playerid][pSkill][job] < MAX_JOBS_SKILLS) {
				format(gString, sizeof(gString), "Congratulations! Now you have skill %d at the %s job. Next skill %d (%d/%d points).", 
					PlayerInfo[playerid][pSkill][job], JobInfo[job][jName], PlayerInfo[playerid][pSkill][job]+1, PlayerInfo[playerid][pJobSkill][job],
				MAX_SKILLPOINTS_JOB*PlayerInfo[playerid][pSkill][job]);
				SCM(playerid, COLOR_YELLOW, gString);
			}
			else {
				format(gString, sizeof(gString), "Congratulations! Now you have max skill at the %s job.", JobInfo[job][jName]);
				SCM(playerid, COLOR_YELLOW, gString);
				checkBP(playerid, 30, 1000);
			}
		}
	}
	return true;
}

save_jobskill(playerid) {
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `JobSkill`='%d|%d|%d|%d|%d|%d|%d|%d' WHERE `id`='%d'", PlayerInfo[playerid][pSkill][0], PlayerInfo[playerid][pSkill][1], PlayerInfo[playerid][pSkill][2], PlayerInfo[playerid][pSkill][3], PlayerInfo[playerid][pSkill][4], PlayerInfo[playerid][pSkill][5], PlayerInfo[playerid][pSkill][6], PlayerInfo[playerid][pSkill][7], PlayerInfo[playerid][pSQLID]);
	mysql_tquery(SQL, gQuery, "", "");
}

save_jobskillpoints(playerid) {
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "UPDATE `users` SET `JobSkillPoints`='%d|%d|%d|%d|%d|%d|%d|%d' WHERE `id`='%d'", PlayerInfo[playerid][pJobSkill][0], PlayerInfo[playerid][pJobSkill][1], PlayerInfo[playerid][pJobSkill][2], PlayerInfo[playerid][pJobSkill][3], PlayerInfo[playerid][pJobSkill][4], PlayerInfo[playerid][pJobSkill][5], PlayerInfo[playerid][pJobSkill][6], PlayerInfo[playerid][pJobSkill][7], PlayerInfo[playerid][pSQLID]);
	mysql_tquery(SQL, gQuery, "", "");
}

YCMD:movejob(playerid, parmas[]) {
	if(!IsAdmin(playerid, 7))
		return true;

	new jobid;
	if(sscanf(parmas, "i", jobid))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/movejob [jobid]");

	if(jobid < 1 && jobid > Sqljobs)
		return SCM(playerid, COLOR_GREY, "Invalid job ID.");

	jobid --;
	GetPlayerPos(playerid, JobInfo[jobid][jPos][0], JobInfo[jobid][jPos][1], JobInfo[jobid][jPos][2]);
	DestroyPickup(JobInfo[jobid][jPickup]);
	Delete3DTextLabel(JobInfo[jobid][jLabel]);
	UpdateJobLabel(jobid);

	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, 100, "UPDATE `jobs` SET `Position` = '%f|%f|%f' WHERE `ID` = '%d'", JobInfo[jobid][jPos][0], JobInfo[jobid][jPos][1], JobInfo[jobid][jPos][2], JobInfo[jobid][jID]);
	mysql_tquery(SQL, gQuery);

	gString[0] = EOS;
	format(gString, 100, "Ai mutat jobul #%d cu success.", jobid + 1);
	SCM(playerid, -1, gString);
	return true;
}

YCMD:usedrugs(playerid, parmas[], help) {
	if(GetCoolDowns(playerid, 28)) return SCM(playerid, COLOR_GREY, "Ai folosit recent aceasta comanda.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, -1, "Nu poti folosi aceasta comanda cand te afli intr-un vehicul.");
	if(PlayerInfo[playerid][pDrugs] < 1) return SCM(playerid, -1, "You don't have drugs.");
	if(PlayerStoned[playerid] >= 10) return SCM(playerid, -1, "Esti prea drogat!");
	TogglePlayerControllable(playerid, 0);
	PlayerStoned[playerid] += 2;
	SetCoolDowns(playerid, 28, 30);
	gString[0] = EOS;
   	format(gString, 128, "* %s took some drugs out of his pocket.", GetName(playerid));
	ProxDetector(20.0, playerid, gString, COLOR_PURPLE);
	SCM(playerid, COLOR_WHITE, "Stai nemiscat 30 de secunde pentru ca drogurile sa-si faca efectul.");
	LoopingAnim(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
    SetTimerEx("DrugEffectGone", 30000, false, "d", playerid);
	return true; }

function DrugEffectGone(playerid) {
	PlayerStoned[playerid] -= 2;
	PlayerInfo[playerid][pDrugs] --;
	ClearAnimations( playerid );
	SetPlayerDrunkLevel(playerid, 0);
	SetPlayerHealth(playerid, 100);
	gString[0] = EOS;
	UpdateVar(playerid, "Drugs", PlayerInfo[playerid][pDrugs]);
	SCM(playerid, COLOR_PURPLE, "Drugs effect has been done.");
	format(gString, 88, "* %s took some drugs.", GetName(playerid));
	ProxDetector(20.0, playerid, gString, COLOR_PURPLE);
	TogglePlayerControllable(playerid, true);
	return true; 
}

YCMD:getjob(playerid, params[], help) {
	if(PlayerInfo[playerid][pJob] != 0)
		return SCM(playerid, COLOR_GREY, "Ai deja un job.");

	if(PaintType[playerid])
		return true;

	for(new i = 0; i < Sqljobs; i++) {
		if(PlayerToPoint(playerid, 2, JobInfo[i][jPos][0], JobInfo[i][jPos][1], JobInfo[i][jPos][2])) {
			if(IsPlayerInAnyVehicle(playerid))
				return true;

			PlayerInfo[playerid][pJob] = JobInfo[i][jID];
			UpdateVar(playerid, "Job", PlayerInfo[playerid][pJob]);

			gString[0] = EOS;
			format(gString, sizeof(gString), "Congratulations! you took your job %s, for more details [/help > jobs]", JobInfo[i][jName]);
			SCM(playerid, COLOR_WHITE, gString);
			if(PlayerInfo[playerid][pTut] == 3) {
				PlayerInfo[playerid][pTut]++;
				UpdateVar(playerid, "Tutorial", PlayerInfo[playerid][pTut]);
				ShowPlayerTutorial(playerid);
			}
		}
	}
	return true;
}

YCMD:quitjob(playerid, params[], help) {
	if(PlayerInfo[playerid][pJob] == 0)
		return true;

	if(PlayerVar[playerid][FishTimer] != 0)
		return SCM(playerid, COLOR_GREY, "Nu poti sa quit job timp ce pescuesti.");

	switch(CP[playerid]) {
		case CP_FIND_PLAYER: {
			DisablePlayerCheckpoint(playerid);
			CP[playerid] = 0;
			PlayerVar[playerid][Find] = -1;
			PlayerTextDrawHide(playerid, FindPTD[0]);
			PlayerTextDrawHide(playerid, FindPTD[1]);
		}
		default: CancelJob(playerid, true);
	}
	PlayerInfo[playerid][pJob] = 0, SCM(playerid, COLOR_GREY, "You resigned from the job");
	if(PlayerInfo[playerid][pHud][2]) {
		PlayerInfo[playerid][pHud][2] = false;
		save_hud(playerid);

		HidePlayerProgressBar(playerid, PlayerVar[playerid][HudProgress][1]);
		PlayerTextDrawHide(playerid, ProgressPTD[1]);
	}
	return true;
}

YCMD:unloadtrash(playerid, params[]) {
	if(PlayerInfo[playerid][pJob] != 5)
		return SCM(playerid, COLOR_GREY, "Nu ai jobul de garbageman.");

	if(!PlayerVar[playerid][JobWork])
		return SCM(playerid, COLOR_GREY, "Nu muncesti.");

	if(PlayerVar[playerid][Trash] <= 0)
		return SCM(playerid, COLOR_GREY, "Nu ai destul gunoi.");

	SetPlayerRaceCheckpointEx(playerid, CP_FINISHTRASH, 1, 2570.4333,2785.0354,10.8203, 0.0, 0.0, 0.0, 5.0);
	SCM(playerid, COLOR_YELLOW, "Du-te la checkpoint-ul de pe mapa pentru a primii banii pentru munca depusa!");
	return true;
}

YCMD:work(playerid, params[], help) {
	if(PlayerInfo[playerid][pJob] == 0)
		return SCM(playerid, COLOR_GREY, "Nu ai un job.");

	if(GetCoolDowns(playerid, 13)) 
		return CoolDowns(playerid, 13);

	if(IsPlayerInAnyVehicle(playerid))
		return true;

	if(PlayerVar[playerid][JobWork])
		return SCM(playerid, COLOR_GREY, "You already work.");

	if(PlayerVar[playerid][Duty])
		return SCM(playerid, COLOR_GREY, "Nu poti face job cand esti duty.");

	switch(PlayerInfo[playerid][pJob]) {
		case 1: return SCM(playerid, COLOR_GREY, "Foloseste comanda /find.");
		case 2: return SCM(playerid, COLOR_GREY, "Foloseste comanda /fish");
		case 8: return SCM(playerid, COLOR_GREY, "Foloseste comanda /getweed");
	}

	if(GetPlayerVirtualWorld(playerid) != 0)
		return SCM(playerid, COLOR_LGREEN, "Nu poti munci din virtual world.");

	new x = PlayerInfo[playerid][pJob]-1;

	PlayerVar[playerid][LeftJob] = -1;

	if(!PlayerToPoint(playerid, 5, JobInfo[x][jWorkPos][0], JobInfo[x][jWorkPos][1], JobInfo[x][jWorkPos][2])) {
		SetPlayerCheckpointEx(playerid, CP_NORMAL, JobInfo[x][jWorkPos][0], JobInfo[x][jWorkPos][1], JobInfo[x][jWorkPos][2], 5.0);
		SCM(playerid, COLOR_WHITE, "{C380C6}(Job) {FFFFFF}Nu te afli in locul potrivit. Ti-am pus un checkpoint pe minimap.");
		return true;
	}	
	switch(PlayerInfo[playerid][pJob]) {
		case 3: {
			SetPlayerSkin(playerid, 155);
			SetPlayerCheckpointEx(playerid, CP_PIZZA1, 2105.4749,-1806.3682,13.5547, 3.0);
			SCM(playerid, COLOR_WHITE, "Get into pizza business");
			PlayerVar[playerid][CoolDown][29] = gettime();
		}
		case 4: {
			if(PlayerInfo[playerid][pFaina] != 0)
				return SCM(playerid, COLOR_GREY, "Ai deja un sac de faina.");
		
			PlayerVar[playerid][FarmerWarning] = 0;

			SetPlayerSkin(playerid, 158);
			PlayerTextDrawShow(playerid, FarmingPTD);
			PlayerVar[playerid][LeftJob] = 45;
		}
		case 5: {
			SetPlayerSkin(playerid, 16);
			PlayerTextDrawShow(playerid, GarbagePTD);
			SetPlayerTrasherPoint(playerid);
		}
		case 6: SetPlayerRaceCheckpointEx(playerid, CP_TRUCKSTART, 1, -121.7432,-397.7403,1.6634, 0.0, 0.0, 0.0, 5.0);
		case 7: return ShowPlayerDialog(playerid, DIALOG_MATS, DIALOG_STYLE_LIST, "Materials Locations", "Las Paysadas\nLas Colinas\nBlue Berry\nFort Carson", "Select", "Close");
	}
	JobTime[playerid] = gettime();
	SetCoolDowns(playerid, 13, 60);
	CreateJobVehicle(playerid);
	return true;
}

function CreateJobVehicle(playerid) {
	new 
		x = PlayerInfo[playerid][pJob]-1,
		skill = (PlayerInfo[playerid][pSkill][x] > 6 ? 6 : PlayerInfo[playerid][pSkill][x] < 1 ? 1 : PlayerInfo[playerid][pSkill][x]-1),
		vehicle = JobInfo[x][jVehicles][skill]
	;
	PlayerVar[playerid][JobVehicle] = CreateVehicleEx(vehicle, JobInfo[x][jvPos][0], JobInfo[x][jvPos][1], JobInfo[x][jvPos][2], JobInfo[x][jvPos][3], x != 2 ? -1 : 6, x != 2 ? -1 : 6, -1, 0);
	GiveVehicleKey(playerid, PlayerVar[playerid][JobVehicle]);
	Fuel[PlayerVar[playerid][JobVehicle]] = 100;
	VehicleAcces[PlayerVar[playerid][JobVehicle]] = playerid;
	PutPlayerInVehicle(playerid, PlayerVar[playerid][JobVehicle], 0);
	SetVehicleDoor(PlayerVar[playerid][JobVehicle], true);
	SCM(playerid, COLOR_WHITE, "{C380C6}(Job) {FFFFFF}You started work. Go to the checkpoints placed on the minimap.");
	PlayerVar[playerid][JobWork] = true;
	JobCar[PlayerVar[playerid][JobVehicle]] = PlayerInfo[playerid][pJob];
	return true;
}
std::ShowPlayerTrucker(playerid, _x=-1,time=-1) {
	new srsStr[1250]={"#\tLocation & Type\tDistance & Time\tEarnings\n"};
	while(++_x<12) {
		time=floatround(GetPlayerDistanceFromPoint(playerid, trucker_pos[_x][0], trucker_pos[_x][1], trucker_pos[_x][2])/15.0);
		format(gQuery, 128, "%d.\t%s (%s{FFFFFF})\t%.2f (ETA: %02d:%02d)\t{17B51E}$%s\n", _x+1, 
			GetPlayer3DZone2(trucker_pos[_x][0], trucker_pos[_x][1], trucker_pos[_x][2]), 
			_x<6?("{DFE498}Legal"):("{DC4141}Ilegal"), 
			GetPlayerDistanceFromPoint(playerid, trucker_pos[_x][0], trucker_pos[_x][1], trucker_pos[_x][2]),
			time/60, time % 60, FormatNumber((p_money[playerid][_x]=(time*14)+random(100)))), 
		strcat(srsStr, gQuery);
	}
	ShowPlayerDialog(playerid, DIALOG_TRUCKER, DIALOG_STYLE_TABLIST_HEADERS, "Select Route", srsStr, "Select", "Close");
	return true;
}

stock SetPlayerTrasherPoint(playerid) {
	new i = PlayerVar[playerid][LeftJob] = random(sizeof(TrasherPos));
	while(PlayerToPoint(playerid, 70, TrasherPos[i][0], TrasherPos[i][1], TrasherPos[i][2])) i = PlayerVar[playerid][LeftJob] = random(sizeof(TrasherPos));
	SetPlayerRaceCheckpointEx(playerid, CP_TRASHCP, 1, TrasherPos[i][0], TrasherPos[i][1], TrasherPos[i][2], 0.0, 0.0, 0.0, 3.0);
	return true;
}

YCMD:pickup(playerid, params[], help) {
	if(PlayerInfo[playerid][pJob] != 5)
		return SCM(playerid, COLOR_LGREEN, "Eroare: Nu esti gunoier!");

	if(!PlayerVar[playerid][JobWork])
		return SCM(playerid, COLOR_LGREEN, "Eroare: Nu muncesti!");

	if(IsPlayerInAnyVehicle(playerid))
		return SCM(playerid, COLOR_GREY, "Nu poti folosi aceasta comanda din masina.");
	
	new i = PlayerVar[playerid][LeftJob];
	if(!PlayerToPoint(playerid, 5, TrasherPos[i][0], TrasherPos[i][1], TrasherPos[i][2]))
		return SCM(playerid, COLOR_LGREEN, "Nu esti langa gunoi.");

	if(jobDeelay[playerid]-gettime()>0) return SCMf(playerid, COLOR_LGREEN, "Eroare: Asteapta %d secunde pentru a lua sacul cu gunoi!", jobDeelay[playerid]-gettime());
	jobDeelay[playerid]=gettime()+30;
	SetPlayerAttachedObject(playerid, 2, 1264, 6, 0.2229, 0.0270, 0.0409, 0.0000, -78.0000, 0.0000, 0.4959, 0.5529, 0.4140);
	PlayerVar[playerid][HaveTrash] = RandomEx(3, 5);
	format(gString, 176, "ai primit ~r~%d~w~~h~ kilograme de gunoi (~y~%d/25~w~~h~)~n~du-te in spatele masinii de gunoi si apasa tasta y pentru a pune sacu", PlayerVar[playerid][HaveTrash], PlayerVar[playerid][Trash]);
	ShowChat(playerid, 5, gString);
	return true;
}

YCMD:stopwork(playerid, params[], help) {
	if(PlayerInfo[playerid][pJob] == 0)
		return SCM(playerid, COLOR_GREY, "Nu ai un job");

	if(!PlayerVar[playerid][JobWork])
		return SCM(playerid, COLOR_GREY, "Nu muncesti.");

	CancelJob(playerid, false);
	return true;
}

function CancelJob(playerid, bool: seen) {
	if(!seen) SCM(playerid, COLOR_WHITE, "{C380C6}(Job) {FFFFFF}Job esuat.");
	if(PlayerVar[playerid][JobVehicle] != INVALID_VEHICLE_ID) {
		DestroyVehicleEx(PlayerVar[playerid][JobVehicle]);
		VehicleAcces[PlayerVar[playerid][JobVehicle]] = -1;
		PlayerVar[playerid][JobVehicle] = INVALID_VEHICLE_ID;
	}
	if(PlayerVar[playerid][Trailer] != 0) DestroyVehicleEx(PlayerVar[playerid][Trailer]), PlayerVar[playerid][Trailer] = 0;
	PlayerVar[playerid][JobWork] = false;
	PlayerVar[playerid][JobTimeLeft] = false;
	PlayerVar[playerid][LeftJob] = 0;
	if(PlayerVar[playerid][HaveTrash]) RemovePlayerAttachedObject(playerid, 2), PlayerVar[playerid][HaveTrash] = false;
	PlayerVar[playerid][Trash] = 0;
	PlayerVar[playerid][HaveTrash] = 0;
	PlayerVar[playerid][Fish][0] = 0; 
	PlayerVar[playerid][Fish][1] = 0;
	if(PlayerInfo[playerid][pJob]==3) {
		for(new h=0;h<4;h++) {
			PizzaHouse[playerid][h] = 0;
			if(PizzaObject[playerid][h]!=-1) DestroyDynamicObject(PizzaObject[playerid][h]), PizzaObject[playerid][h] = -1;
			RemovePlayerMapIcon(playerid, h+60);
		}
		if(PlayerPizza[playerid]) {
			RemovePlayerAttachedObject(playerid, 2);
			RemovePlayerAttachedObject(playerid, 3);
			SetPlayerSpecialAction(playerid, 0);
			PlayerPizza[playerid] = false;
		}
		PlayerPizza[playerid] = false;
		PizzaCP[playerid] = -1;
	}
	CP[playerid] = DISABLE_CHECKPOINT;
	PlayerTextDrawHide(playerid, FarmingPTD);
	PlayerTextDrawSetString(playerid, GarbagePTD, "~p~garbage man job~n~~w~~h~0/25 kg of garbage");
	PlayerTextDrawHide(playerid, GarbagePTD);
	SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
	DisablePlayerCheckpoint(playerid);
	DisablePlayerRaceCheckpoint(playerid);
	return true;
}

YCMD:skills(playerid, params[], help) {
	gString[0] = EOS;
	format(gString, sizeof(gString), " --------- %s's skills --------- ", GetName(playerid));
	SCM(playerid, COLOR_GREY, gString);
	for(new i = 1; i < Sqljobs-1; i++) {
		if(PlayerInfo[playerid][pSkill][i] < MAX_JOBS_SKILLS) format(gString, sizeof(gString), "%s - Skill %d (%d/%d points)", JobInfo[i][jName], PlayerInfo[playerid][pSkill][i], PlayerInfo[playerid][pJobSkill][i],MAX_SKILLPOINTS_JOB*PlayerInfo[playerid][pSkill][i]);
		else format(gString, sizeof(gString), "%s - Max skill", JobInfo[i][jName]);
		SCM(playerid, COLOR_WHITE, gString);
	}
	return true;
}