#define MAX_BP_DAYS (20)

enum bp_ENUM_INFO {
	bpDays[5],
	bpFree[50],
	bpPro[50],
    bpNeed
}
static const bpInfo[MAX_BP_DAYS][bp_ENUM_INFO] = {
	{"1", "~n~15x~n~experience~n~~n~",    "~n~300~n~experience~n~~n~", 150},
	{"2", "~n~$25.000~n~in bank~n~~n~",   "~n~$60.000~n~in bank~n~~n~", 150},
    {"3", "~n~20~n~rob points~n~~n~",     "~n~40~n~rob points~n~~n~", 200},
    {"4", "~n~+5 days~n~all licenses~n~","~n~+7 days~n~all licenses~n~", 250},
	{"5", "~n~200x gift~n~points~n~~n~",     "~n~400x gift~n~points~n~~n~", 100},
	{"6", "~n~10 hours (25%)~n~job boost",    "~n~10 hours (50%)~n~job boost", 150},
	{"7", "~n~100x~n~red points~n~~n~", "~n~500x~n~red points~n~~n~", 250},
	{"8", "~n~1 hidden~n~colors~n~~n~",    "~n~1 slot~n~vehicle~n~~n~", 150},
	{"9", "~n~1x neon~n~white~n~~n~",   "~n~1x neon~n~yellow~n~~n~", 200},
	{"10", "~n~300x~n~experience~n~~n~",    "~n~600~n~experience~n~~n~", 250},
	{"11", "~n~$50.000~n~money~n~~n~",  "~n~$100.000~n~money~n~~n~", 300},
	{"12", "~n~25x rob~n~points~n~~n~",    "~n~50x rob~n~points~n~~n~", 200},
	{"13", "~n~250x gift~n~points~n~~n~",  "~n~500x gift~n~points~n~~n~", 250},
	{"14", "~n~15 premium~n~points~n~~n~",  "~n~30x~n~premium~n~points", 350},
	{"15", "~n~200x~n~red points~n~~n~",  "~n~400x~n~red points~n~~n~", 3250},
	{"16", "~n~1 slot~n~vehicle~n~~n~",  "~n~1 slot~n~vehicle~n~~n~", 300},
	{"17", "~n~skin~n~60~n~~n~",  "~n~skin~n~246~n~~n~", 150},
	{"18", "~n~30x~n~premium points",   "~n~Rare~n~Voucher~n~~n~", 300},
	{"19", "~n~red~n~Crate~n~~n~",  "~n~red~n~Crate~n~~n~", 350},
	{"20", "~n~~n~Savanna~n~~n~",    "~n~~n~Sultan~n~~n~", 450}
};
static const bp_color[] = {-2139062102, -2139062146, -5963626, -5963676, 1155017471, 680924415, 0x33333370, 0x22222270, 0x73634070, 0x564A3170};

new bpPage[MAX_PLAYERS];
ShowBattlePass(playerid) {
	if(player_selected[playerid]) return true;
    if(bpTime < gettime()) return true;
	bpPage[playerid] = 0;
	LoadBattlePass(playerid);
	PlayerTextDrawBoxColor(playerid, bpPTD[playerid][15], -2139062172);
	PlayerTextDrawBoxColor(playerid, bpPTD[playerid][16], -2139062072);
	SelectTextDraw(playerid, COLOR_LGREEN);
	player_selected[playerid] = 11;
	return bool:true;
}
ClickBattlePass(playerid, PlayerText:playertextid, x=-1, y=-1) {
    switch((x=PlayerTextID[playerid][playertextid])) {
        case 0..4: {
            y=(bpPage[playerid] * 5) + x;
            if(PlayerInfo[playerid][pTier] < y+1 || PlayerInfo[playerid][bpClaimed][y]) return true;
            switch((bpPage[playerid] * 5) + x) {
                case 0: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit 150 experenta din Free Battle Pass!");
                    GiveExperience(playerid, 150);
                }
                case 1: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit $25.000 money din Free Battle Pass!");
                    GivePlayerCash(playerid, 25000);
                }
                case 2: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit 20 rob points din Free Battle Pass!");
                    PlayerInfo[playerid][pRobExp] += 20;
                    UpdateVar(playerid, "RobExp", PlayerInfo[playerid][pRobExp]);
                }
                case 3: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit +5 zile pentru toate licentele din Free Battle Pass!");
                    if(PlayerInfo[playerid][pDriveLicense] < gettime()) PlayerInfo[playerid][pDriveLicense] = gettime() + (86400 * 5);
                    else PlayerInfo[playerid][pDriveLicense] += 86400 * 5;
                    if(PlayerInfo[playerid][pFlyLicense] < gettime()) PlayerInfo[playerid][pBoatLicense] = gettime() + (86400 * 5);
                    else PlayerInfo[playerid][pFlyLicense] += 86400 * 5;
                    if(PlayerInfo[playerid][pBoatLicense] < gettime()) PlayerInfo[playerid][pBoatLicense] = gettime() + (86400 * 5);
                    else PlayerInfo[playerid][pBoatLicense] += 86400 * 5;
                    if(PlayerInfo[playerid][pWeaponLicense] < gettime()) PlayerInfo[playerid][pWeaponLicense] = gettime() + (86400 * 5);
                    else PlayerInfo[playerid][pWeaponLicense] += 86400 * 5;
                    _query(256, "UPDATE `users` SET `DriveLicense` = '%i', `WeaponLicense` = '%i', `FlyLicense` = '%i', `BoatLicense` = '%i' WHERE `id` = '%i'", PlayerInfo[playerid][pDriveLicense], PlayerInfo[playerid][pWeaponLicense], PlayerInfo[playerid][pFlyLicense], PlayerInfo[playerid][pBoatLicense], PlayerInfo[playerid][pSQLID]);
                }
                case 4: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit 200 gift points din Free Battle Pass!");
                    PlayerInfo[playerid][pGiftPoints] += 200;
                    UpdateVar(playerid, "GiftPoints", PlayerInfo[playerid][pGiftPoints]);
                }
                case 5: {
                    if(PlayerInfo[playerid][pJobBoost]) return SCM(playerid, COLOR_LGREEN, "Eroare: Ai deja activ Job Boost pe cont!");
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit 10 ore de job boost (25%%) din Free Battle Pass!");
                    PlayerInfo[playerid][pJobBoost] = 10;
                    UpdateVar(playerid, "JobBoost", PlayerInfo[playerid][pJobBoost]);
                    PlayerInfo[playerid][pJobProcent] = 25;
                    UpdateVar(playerid, "JobProcent", PlayerInfo[playerid][pJobProcent]);
                }
                case 6: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit 100 red points din Free Battle Pass!");
                    PlayerInfo[playerid][pServerPoints] += 100;
                    UpdateVar(playerid, "ServerPoints", PlayerInfo[playerid][pServerPoints]);
                }
                case 7: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit 1x hidden color din Free Battle Pass!");
                    PlayerInfo[playerid][pHidden] ++;
                    UpdateVar(playerid, "Hidden", PlayerInfo[playerid][pHidden]);
                }
                case 8: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit 1 neon white din Free Battle Pass!");
                    PlayerInfo[playerid][pNeon][0] ++;
                    save_neon(playerid);
                }
                case 9: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit 300 experenta din Free Battle Pass!");
                    GiveExperience(playerid, 300);
                }
                case 10: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit $50.000 money din Free Battle Pass!");
                    GivePlayerCash(playerid, 50000);
                }
                case 11: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit 25 rob points din Free Battle Pass!");
                    PlayerInfo[playerid][pRobExp] += 25;
                    UpdateVar(playerid, "RobExp", PlayerInfo[playerid][pRobExp]);
                }
                case 12: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit 250 gift points din Free Battle Pass!");
                    PlayerInfo[playerid][pGiftPoints] += 250;
                    UpdateVar(playerid, "GiftPoints", PlayerInfo[playerid][pGiftPoints]);
                }
                case 13: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit 15 premium points din Free Battle Pass!");
                    PlayerInfo[playerid][pPremiumPoints] += 15;
                    UpdateVar(playerid, "PremiumPoints", PlayerInfo[playerid][pPremiumPoints]);
                }
                case 14: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit 200 red points din Free Battle Pass!");
                    PlayerInfo[playerid][pServerPoints] += 200;
                    UpdateVar(playerid, "ServerPoints", PlayerInfo[playerid][pServerPoints]);
                }
                case 15: {
                    if(PlayerInfo[playerid][pSlot] >= MAX_PLAYER_VEHICLE) return SCM(playerid, COLOR_LGREEN, "Eroare: Ai numarul maxim de sloturi!");
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit 1x slot vehicle din Free Battle Pass!");
                    PlayerInfo[playerid][pSlot] ++;
                    UpdateVar(playerid, "Slot", PlayerInfo[playerid][pSlot]);
                }
                case 16: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit Skin ID 60 din Free Battle Pass!");
                    GivePlayerSkin(playerid, 60);
                }
                case 17: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit 30 premium points din Free Battle Pass!");
                    PlayerInfo[playerid][pPremiumPoints] += 30;
                    UpdateVar(playerid, "PremiumPoints", PlayerInfo[playerid][pPremiumPoints]);
                }
                case 18: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit un red crate din Free Battle Pass!");
                    PlayerInfo[playerid][pCrate][1] ++;
                    save_crates(playerid);
                }
                case 19: {
                    if(Iter_Count(MyVehicles<playerid>) >= PlayerInfo[playerid][pSlot]) return SCM(playerid, COLOR_LGREEN, "Eroare: Ai maximum de masini!");
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit o savanna din Gold Battle Pass!");
                    GiveVehicle(playerid, 567, true);
                }
            }
            PlayerTextDrawSetString(playerid, playertextid, "~n~~w~(claimed)~n~~n~");
            PlayerTextDrawBoxColor(playerid, playertextid, bp_color[6+(y%2)]);
            PlayerTextDrawShow(playerid, playertextid);

            PlayerInfo[playerid][bpClaimed][y] = true;
            save_claimed_bp(playerid);
        }
        case 5..9: {
            y=(bpPage[playerid] * 5) + x-5;
            if(PlayerInfo[playerid][pTier] < y+1 || PlayerInfo[playerid][bpClaimed][y+20]) return true;
            switch(y) {
                case 0: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit 300 experenta din Gold Battle Pass!");
                    GiveExperience(playerid, 150);
                }
                case 1: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit $60.000 money din Gold Battle Pass!");
                    GivePlayerCash(playerid, 60000);
                }
                case 2: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit 40 rob points din Gold Battle Pass!");
                    PlayerInfo[playerid][pRobExp] += 40;
                    UpdateVar(playerid, "RobExp", PlayerInfo[playerid][pRobExp]);
                }
                case 3: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit +7 zile pentru toate licentele din Gold Battle Pass!");
                    if(PlayerInfo[playerid][pDriveLicense] < gettime()) PlayerInfo[playerid][pDriveLicense] = gettime() + (86400 * 7);
                    else PlayerInfo[playerid][pDriveLicense] += 86400 * 7;
                    if(PlayerInfo[playerid][pFlyLicense] < gettime()) PlayerInfo[playerid][pBoatLicense] = gettime() + (86400 * 7);
                    else PlayerInfo[playerid][pFlyLicense] += 86400 * 7;
                    if(PlayerInfo[playerid][pBoatLicense] < gettime()) PlayerInfo[playerid][pBoatLicense] = gettime() + (86400 * 7);
                    else PlayerInfo[playerid][pBoatLicense] += 86400 * 7;
                    if(PlayerInfo[playerid][pWeaponLicense] < gettime()) PlayerInfo[playerid][pWeaponLicense] = gettime() + (86400 * 7);
                    else PlayerInfo[playerid][pWeaponLicense] += 86400 * 7;
                    _query(256, "UPDATE `users` SET `DriveLicense` = '%i', `WeaponLicense` = '%i', `FlyLicense` = '%i', `BoatLicense` = '%i' WHERE `id` = '%i'", PlayerInfo[playerid][pDriveLicense], PlayerInfo[playerid][pWeaponLicense], PlayerInfo[playerid][pFlyLicense], PlayerInfo[playerid][pBoatLicense], PlayerInfo[playerid][pSQLID]);
                }
                case 4: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit 400 gift points din Gold Battle Pass!");
                    PlayerInfo[playerid][pGiftPoints] += 400;
                    UpdateVar(playerid, "GiftPoints", PlayerInfo[playerid][pGiftPoints]);
                }
                case 5: {
                    if(PlayerInfo[playerid][pJobBoost]) return SCM(playerid, COLOR_LGREEN, "Eroare: Ai deja activ Job Boost pe cont!");
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit 10 ore de job boost (50%%) din Gold Battle Pass!");
                    PlayerInfo[playerid][pJobBoost] = 10;
                    UpdateVar(playerid, "JobBoost", PlayerInfo[playerid][pJobBoost]);
                    PlayerInfo[playerid][pJobProcent] = 50;
                    UpdateVar(playerid, "JobProcent", PlayerInfo[playerid][pJobProcent]);
                }
                case 6: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit 500 red points din Gold Battle Pass!");
                    PlayerInfo[playerid][pServerPoints] += 500;
                    UpdateVar(playerid, "ServerPoints", PlayerInfo[playerid][pServerPoints]);
                }
                case 7: {
                    if(PlayerInfo[playerid][pSlot] >= MAX_PLAYER_VEHICLE) return SCM(playerid, COLOR_LGREEN, "Eroare: Ai numarul maxim de sloturi!");
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit 1x slot vehicle din Gold Battle Pass!");
                    PlayerInfo[playerid][pSlot] ++;
                    UpdateVar(playerid, "Slot", PlayerInfo[playerid][pSlot]);
                }
                case 8: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit 1 neon yellow din Gold Battle Pass!");
                    PlayerInfo[playerid][pNeon][1] ++;
                    save_neon(playerid);
                }
                case 9: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit 600 experenta din Gold Battle Pass!");
                    GiveExperience(playerid, 600);
                }
                case 10: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit $100.000 money din Gold Battle Pass!");
                    GivePlayerCash(playerid, 100000);
                }
                case 11: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit 50 rob points din Gold Battle Pass!");
                    PlayerInfo[playerid][pRobExp] += 50;
                    UpdateVar(playerid, "RobExp", PlayerInfo[playerid][pRobExp]);
                }
                case 12: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit 500 gift points din Gold Battle Pass!");
                    PlayerInfo[playerid][pGiftPoints] += 500;
                    UpdateVar(playerid, "GiftPoints", PlayerInfo[playerid][pGiftPoints]);
                }
                case 13: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit 30 premium points din Gold Battle Pass!");
                    PlayerInfo[playerid][pPremiumPoints] += 30;
                    UpdateVar(playerid, "PremiumPoints", PlayerInfo[playerid][pPremiumPoints]);
                }
                case 14: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit 400 red points din Gold Battle Pass!");
                    PlayerInfo[playerid][pServerPoints] += 400;
                    UpdateVar(playerid, "ServerPoints", PlayerInfo[playerid][pServerPoints]);
                }
                case 15: {
                    if(PlayerInfo[playerid][pSlot] >= MAX_PLAYER_VEHICLE) return SCM(playerid, COLOR_LGREEN, "Eroare: Ai numarul maxim de sloturi!");
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit 1x slot vehicle din Gold Battle Pass!");
                    PlayerInfo[playerid][pSlot] ++;
                    UpdateVar(playerid, "Slot", PlayerInfo[playerid][pSlot]);
                }
                case 16: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit Skin ID 246 din Gold Battle Pass!");
                    GivePlayerSkin(playerid, 246);
                }
                case 17: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit un rare voucher din Gold Battle Pass!");
                    PlayerInfo[playerid][pVoucher][0] ++;
                    save_vouchers(playerid);
                }
                case 18: {
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit un red crate din Gold Battle Pass!");
                    PlayerInfo[playerid][pCrate][1] ++;
                    save_crates(playerid);
                }
                case 19: {
                    if(Iter_Count(MyVehicles<playerid>) >= PlayerInfo[playerid][pSlot]) return SCM(playerid, COLOR_LGREEN, "Eroare: Ai maximum de masini!");
                    SCM(playerid, COLOR_GM, ">> {FFFFFF}Ai primit un sultan din Gold Battle Pass!");
                    GiveVehicle(playerid, 560, true);
                }
            }
            PlayerTextDrawSetString(playerid, playertextid, "~n~~w~(claimed)~n~~n~");
            PlayerTextDrawBoxColor(playerid, playertextid, bp_color[8+(y%2)]);
            PlayerTextDrawShow(playerid, playertextid);
            PlayerInfo[playerid][bpClaimed][y+20] = true;
            save_claimed_bp(playerid);
        }
        case 10: {
            if(!bpPage[playerid]) return true;
            bpPage[playerid] --;
            updateBP(playerid);
            PlayerTextDrawBoxColor(playerid, bpPTD[playerid][16], -2139062072);
            PlayerTextDrawShow(playerid, bpPTD[playerid][16]);
            if(!bpPage[playerid]) PlayerTextDrawBoxColor(playerid, bpPTD[playerid][15], -2139062172),PlayerTextDrawShow(playerid, bpPTD[playerid][15]);
        }
        case 11: {
            if((bpPage[playerid]*5)>=MAX_BP_DAYS-5) return true;
            bpPage[playerid]++;
            updateBP(playerid);
            PlayerTextDrawBoxColor(playerid, bpPTD[playerid][15], -2139062072);
            PlayerTextDrawShow(playerid, bpPTD[playerid][15]);
            if((bpPage[playerid]*5)>=MAX_BP_DAYS-5) PlayerTextDrawBoxColor(playerid, bpPTD[playerid][16], -2139062172), PlayerTextDrawShow(playerid, bpPTD[playerid][16]);
        }
    }
	return true;
}

YCMD:bp(playerid, params[], help) return ShowBattlePass(playerid);

std::updateBP(playerid, i=-1, id=-1, Float:start=204.0) {
    id=bpPage[playerid] * 5;
    while(++i<5) {
        id=(bpPage[playerid] * 5) + i;
        if(!PlayerInfo[playerid][bpClaimed][id]) {
            PlayerTextDrawSetString(playerid, bpPTD[playerid][i],bpInfo[id][bpFree]);
            PlayerTextDrawBoxColor(playerid, bpPTD[playerid][i], bp_color[i%2]);
        } else {
            PlayerTextDrawSetString(playerid, bpPTD[playerid][i], "~n~~w~(claimed)~n~~n~");
            PlayerTextDrawBoxColor(playerid, bpPTD[playerid][i], bp_color[6+(i%2)]);
        }
        if(!PlayerInfo[playerid][bpClaimed][id+20]) {
            PlayerTextDrawSetString(playerid, bpPTD[playerid][i+5],bpInfo[id][bpPro]);
            PlayerTextDrawBoxColor(playerid, bpPTD[playerid][i+5], bp_color[2+(i%2)]);
        } else {
            PlayerTextDrawSetString(playerid, bpPTD[playerid][i+5], "~n~~w~(claimed)~n~~n~");
            PlayerTextDrawBoxColor(playerid, bpPTD[playerid][i+5], bp_color[8+(i%2)]);
        }
        PlayerTextDrawShow(playerid, bpPTD[playerid][i]);
        PlayerTextDrawShow(playerid, bpPTD[playerid][i+5]);
        PlayerTextDrawSetString(playerid, bpPTD[playerid][i+10],bpInfo[id][bpDays]);
        if(PlayerInfo[playerid][pTier] == id) start += (i*56.66)+(procentage(PlayerInfo[playerid][pBpExp],bpInfo[id][bpNeed])*0.5666);
    }
    if(PlayerInfo[playerid][pTier]/5 > bpPage[playerid]) start = 487.0;
    PlayerTextDrawTextSize(playerid, bpPTD[playerid][19], start, 0.000000);
    PlayerTextDrawTextSize(playerid, bpPTD[playerid][18], PlayerInfo[playerid][pGoldPass]?start:204.0, 0.000000);
    PlayerTextDrawShow(playerid, bpPTD[playerid][18]);
    PlayerTextDrawShow(playerid, bpPTD[playerid][19]);
    return true;
}

std::LoadBattlePass(playerid, i=-1, id=-1, x=-1, Float:start=204.0) {
    id = bpPage[playerid] * 5;
    while(++i<5) {
        while(++x<3) {
            switch(x) {
                case 0: {
                    if(!PlayerInfo[playerid][bpClaimed][i]) {
                        bpPTD[playerid][i] = CreatePlayerTextDraw(playerid, 233.70 + (i * 56.90), 197.799987, bpInfo[i+id][bpFree]);
                        PlayerTextDrawBoxColor(playerid, bpPTD[playerid][i], bp_color[i%2]);
                    } else {
                        bpPTD[playerid][i] = CreatePlayerTextDraw(playerid, 233.70 + (i * 56.90), 197.799987, "~n~~w~(claimed)~n~~n~");
                        PlayerTextDrawBoxColor(playerid, bpPTD[playerid][i], bp_color[6+(i%2)]);
                    }
                    PlayerTextDrawSetSelectable(playerid, bpPTD[playerid][i], true);
                    PlayerTextID[playerid][PlayerText:bpPTD[playerid][i]] = i;
                }
                case 1: {
                    if(!PlayerInfo[playerid][bpClaimed][i+20]) {
                        bpPTD[playerid][i+5] = CreatePlayerTextDraw(playerid, 233.70 + (i * 56.90), 242.912445, bpInfo[i+id][bpPro]);
                        PlayerTextDrawBoxColor(playerid, bpPTD[playerid][i+5], bp_color[2+(i%2)]);
                    } else {
                        bpPTD[playerid][i+5] = CreatePlayerTextDraw(playerid, 233.70 + (i * 56.90), 242.912445, "~n~~w~(claimed)~n~~n~");
                        PlayerTextDrawBoxColor(playerid, bpPTD[playerid][i+5], bp_color[8+(i%2)]);
                    }
                    PlayerTextDrawSetSelectable(playerid, bpPTD[playerid][i+5], true);
                    PlayerTextID[playerid][PlayerText:bpPTD[playerid][i+5]] = i+5;
                }
                case 2: {
                    bpPTD[playerid][i+10] = CreatePlayerTextDraw(playerid, 233.70 + (i * 56.90), 183.437500, bpInfo[i+id][bpDays]),
                    PlayerTextDrawBoxColor(playerid, bpPTD[playerid][i+10], bp_color[4+(i%2)]);
                }
            }
            PlayerTextDrawLetterSize(playerid, bpPTD[playerid][i+(x*5)], 0.209995, 1.103124);
            PlayerTextDrawTextSize(playerid, bpPTD[playerid][i+(x*5)], 20.000000, 52.000000);
            PlayerTextDrawAlignment(playerid, bpPTD[playerid][i+(x*5)], 2);
            PlayerTextDrawColor(playerid, bpPTD[playerid][i+(x*5)], -1);
            PlayerTextDrawUseBox(playerid, bpPTD[playerid][i+(x*5)], 1);
            PlayerTextDrawSetShadow(playerid, bpPTD[playerid][i+(x*5)], 0);
            PlayerTextDrawSetOutline(playerid, bpPTD[playerid][i+(x*5)], 1);
            PlayerTextDrawBackgroundColor(playerid, bpPTD[playerid][i+(x*5)], 96);
            PlayerTextDrawFont(playerid, bpPTD[playerid][i+(x*5)], 2);
            PlayerTextDrawSetProportional(playerid, bpPTD[playerid][i+(x*5)], 1);
            PlayerTextDrawSetShadow(playerid, bpPTD[playerid][i+(x*5)], 0);
            PlayerTextDrawShow(playerid, bpPTD[playerid][i+(x*5)]);
        }
        if(PlayerInfo[playerid][pTier] == i+id) start += (i*56.66)+(procentage(PlayerInfo[playerid][pBpExp],bpInfo[i+id][bpNeed])*0.5666);
        x=-1;
    }
    if(PlayerInfo[playerid][pTier]/5 > bpPage[playerid]) start = 487.0;

    bpPTD[playerid][15] = CreatePlayerTextDraw(playerid, 173.871734, 183.276840, "<");
    PlayerTextDrawLetterSize(playerid, bpPTD[playerid][15], 0.263000, 0.938750);
    PlayerTextDrawTextSize(playerid, bpPTD[playerid][15], 10.000000, 16.000000);
    PlayerTextDrawAlignment(playerid, bpPTD[playerid][15], 2);
    PlayerTextDrawColor(playerid, bpPTD[playerid][15], -1);
    PlayerTextDrawUseBox(playerid, bpPTD[playerid][15], 1);
    PlayerTextDrawBoxColor(playerid, bpPTD[playerid][15], -2139062184);
    PlayerTextDrawSetShadow(playerid, bpPTD[playerid][15], 0);
    PlayerTextDrawSetOutline(playerid, bpPTD[playerid][15], 1);
    PlayerTextDrawBackgroundColor(playerid, bpPTD[playerid][15], 84);
    PlayerTextDrawFont(playerid, bpPTD[playerid][15], 2);
    PlayerTextDrawSetProportional(playerid, bpPTD[playerid][15], 1);
    PlayerTextDrawSetShadow(playerid, bpPTD[playerid][15], 0);
    PlayerTextDrawSetSelectable(playerid, bpPTD[playerid][15], true);
    PlayerTextDrawShow(playerid, bpPTD[playerid][15]);
    PlayerTextID[playerid][PlayerText:bpPTD[playerid][15]] = 10;

    bpPTD[playerid][16] = CreatePlayerTextDraw(playerid, 194.704803, 183.369873, ">");
    PlayerTextDrawLetterSize(playerid, bpPTD[playerid][16], 0.263000, 0.948750);
    PlayerTextDrawTextSize(playerid, bpPTD[playerid][16], 10.0, 16.000000);
    PlayerTextDrawAlignment(playerid, bpPTD[playerid][16], 2);
    PlayerTextDrawColor(playerid, bpPTD[playerid][16], -1);
    PlayerTextDrawUseBox(playerid, bpPTD[playerid][16], 1);
    PlayerTextDrawBoxColor(playerid, bpPTD[playerid][16], -2139062072);
    PlayerTextDrawSetShadow(playerid, bpPTD[playerid][16], 0);
    PlayerTextDrawSetOutline(playerid, bpPTD[playerid][16], 1);
    PlayerTextDrawBackgroundColor(playerid, bpPTD[playerid][16], 84);
    PlayerTextDrawFont(playerid, bpPTD[playerid][16], 2);
    PlayerTextDrawSetProportional(playerid, bpPTD[playerid][16], 1);
    PlayerTextDrawSetShadow(playerid, bpPTD[playerid][16], 0);
    PlayerTextDrawSetSelectable(playerid, bpPTD[playerid][16], true);
    PlayerTextDrawShow(playerid, bpPTD[playerid][16]);
    PlayerTextID[playerid][PlayerText:bpPTD[playerid][16]] = 11;

    format(gString, sizeof gString, "season ends in %d days and %d hours..~n~tier %d", (bpTime-gettime())/86400, ((bpTime-gettime())/3600) % 24, PlayerInfo[playerid][pTier]);
    bpPTD[playerid][17] = CreatePlayerTextDraw(playerid, 330.533508, 151.372985, gString);
    PlayerTextDrawLetterSize(playerid, bpPTD[playerid][17], 0.156188, 1.011198);
    PlayerTextDrawAlignment(playerid, bpPTD[playerid][17], 2);
    PlayerTextDrawColor(playerid, bpPTD[playerid][17], -1);
    PlayerTextDrawSetShadow(playerid, bpPTD[playerid][17], 0);
    PlayerTextDrawSetOutline(playerid, bpPTD[playerid][17], 1);
    PlayerTextDrawBackgroundColor(playerid, bpPTD[playerid][17], 0);
    PlayerTextDrawFont(playerid, bpPTD[playerid][17], 2);
    PlayerTextDrawSetProportional(playerid, bpPTD[playerid][17], 1);
    PlayerTextDrawSetShadow(playerid, bpPTD[playerid][17], 0);
    PlayerTextDrawShow(playerid, bpPTD[playerid][17]);

    bpPTD[playerid][18] = CreatePlayerTextDraw(playerid, 491.204315, 242.350143, "box");
    PlayerTextDrawLetterSize(playerid, bpPTD[playerid][18], 0.000000, 4.594678);
    PlayerTextDrawTextSize(playerid, bpPTD[playerid][18], PlayerInfo[playerid][pGoldPass]?start:204.0, 0.000000);
    PlayerTextDrawAlignment(playerid, bpPTD[playerid][18], 1);
    PlayerTextDrawColor(playerid, bpPTD[playerid][18], -1);
    PlayerTextDrawUseBox(playerid, bpPTD[playerid][18], 1);
    PlayerTextDrawBoxColor(playerid, bpPTD[playerid][18], 185);
    PlayerTextDrawSetShadow(playerid, bpPTD[playerid][18], 0);
    PlayerTextDrawSetOutline(playerid, bpPTD[playerid][18], 0);
    PlayerTextDrawBackgroundColor(playerid, bpPTD[playerid][18], 255);
    PlayerTextDrawFont(playerid, bpPTD[playerid][18], 1);
    PlayerTextDrawSetProportional(playerid, bpPTD[playerid][18], 1);
    PlayerTextDrawSetShadow(playerid, bpPTD[playerid][18], 0);
    PlayerTextDrawShow(playerid, bpPTD[playerid][18]);

    bpPTD[playerid][19] = CreatePlayerTextDraw(playerid, 490.442810, 197.270248, "box");
    PlayerTextDrawLetterSize(playerid, bpPTD[playerid][19], 0.000000, 4.509585);
    PlayerTextDrawTextSize(playerid, bpPTD[playerid][19], start, 0.000000);
    PlayerTextDrawAlignment(playerid, bpPTD[playerid][19], 1);
    PlayerTextDrawColor(playerid, bpPTD[playerid][19], -1);
    PlayerTextDrawUseBox(playerid, bpPTD[playerid][19], 1);
    PlayerTextDrawBoxColor(playerid, bpPTD[playerid][19], 185);
    PlayerTextDrawSetShadow(playerid, bpPTD[playerid][19], 0);
    PlayerTextDrawSetOutline(playerid, bpPTD[playerid][19], 0);
    PlayerTextDrawBackgroundColor(playerid, bpPTD[playerid][19], 255);
    PlayerTextDrawFont(playerid, bpPTD[playerid][19], 1);
    PlayerTextDrawSetProportional(playerid, bpPTD[playerid][19], 1);
    PlayerTextDrawSetShadow(playerid, bpPTD[playerid][19], 0);
    PlayerTextDrawShow(playerid, bpPTD[playerid][19]);

    i=-1;
    while(++i<7) TextDrawShowForPlayer(playerid, bpTD[i]);
}

std::checkBP(playerid, index, exp, progress=1) {
    if(playerBPTask[playerid][index] >= GetBPValue(index)) return true;
    playerBPTask[playerid][index] += progress;
    if(PlayerInfo[playerid][pTier] >= 20 || index/10 > bpChapter) return true;
    if(playerBPTask[playerid][index] >= GetBPValue(index)) {
        PlayerInfo[playerid][pBpExp]+=exp;
        SCMf(playerid, COLOR_GM, ">> {FFFFFF}Ai primit +%d XP pentru BattlePass!", exp);
        while(PlayerInfo[playerid][pBpExp]>=bpInfo[PlayerInfo[playerid][pTier]][bpNeed]) {
            PlayerInfo[playerid][pBpExp]-=bpInfo[PlayerInfo[playerid][pTier]][bpNeed];
            PlayerInfo[playerid][pTier]++;
            SCMf(playerid, COLOR_GM, ">> {FFFFFF}Ai deblocat tier %d!", PlayerInfo[playerid][pTier]);
        }
        _query(256, "UPDATE `users` SET `BPExp` = '%i', `Tier` = '%i' WHERE `id`='%i'", PlayerInfo[playerid][pBpExp], PlayerInfo[playerid][pTier], PlayerInfo[playerid][pSQLID]);
    }
    return true;
}

cmd:debug(playerid, params[]) {
    new xp, tier;
    if(sscanf(params, "ii", xp, tier)) return true;
    PlayerInfo[playerid][pBpExp] = xp;
    PlayerInfo[playerid][pTier] = tier;
    updateBP(playerid);
    return true;
}

save_bp(playerid) {
    mysql_format(SQL, gString, sizeof gString, "UPDATE `users` SET `missions_bp` = '%i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i' WHERE `id`= '%i'",
        playerBPTask[playerid][0], playerBPTask[playerid][1], playerBPTask[playerid][2], playerBPTask[playerid][3], playerBPTask[playerid][4], playerBPTask[playerid][5], playerBPTask[playerid][6], playerBPTask[playerid][7], playerBPTask[playerid][8], playerBPTask[playerid][9],
        playerBPTask[playerid][10], playerBPTask[playerid][11], playerBPTask[playerid][12], playerBPTask[playerid][13], playerBPTask[playerid][14], playerBPTask[playerid][15], playerBPTask[playerid][16], playerBPTask[playerid][17], playerBPTask[playerid][18], playerBPTask[playerid][19],
        playerBPTask[playerid][20], playerBPTask[playerid][21], playerBPTask[playerid][22], playerBPTask[playerid][23], playerBPTask[playerid][24], playerBPTask[playerid][25], playerBPTask[playerid][26], playerBPTask[playerid][27], playerBPTask[playerid][28], playerBPTask[playerid][29],
        playerBPTask[playerid][30], playerBPTask[playerid][31], playerBPTask[playerid][32], playerBPTask[playerid][33], playerBPTask[playerid][34], playerBPTask[playerid][35], playerBPTask[playerid][36], playerBPTask[playerid][37], playerBPTask[playerid][38], playerBPTask[playerid][39],
        PlayerInfo[playerid][pSQLID]);
    mysql_tquery(SQL, gString);
}

save_claimed_bp(playerid) {
    mysql_format(SQL, gString, sizeof gString, "UPDATE `users` SET `bp_claimed` = '%i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i' WHERE `id`= '%i'",
        PlayerInfo[playerid][bpClaimed][0], PlayerInfo[playerid][bpClaimed][1], PlayerInfo[playerid][bpClaimed][2], PlayerInfo[playerid][bpClaimed][3], PlayerInfo[playerid][bpClaimed][4], PlayerInfo[playerid][bpClaimed][5], PlayerInfo[playerid][bpClaimed][6], PlayerInfo[playerid][bpClaimed][7], PlayerInfo[playerid][bpClaimed][8], PlayerInfo[playerid][bpClaimed][9],
        PlayerInfo[playerid][bpClaimed][10], PlayerInfo[playerid][bpClaimed][11], PlayerInfo[playerid][bpClaimed][12], PlayerInfo[playerid][bpClaimed][13], PlayerInfo[playerid][bpClaimed][14], PlayerInfo[playerid][bpClaimed][15], PlayerInfo[playerid][bpClaimed][16], PlayerInfo[playerid][bpClaimed][17], PlayerInfo[playerid][bpClaimed][18], PlayerInfo[playerid][bpClaimed][19],
        PlayerInfo[playerid][bpClaimed][20], PlayerInfo[playerid][bpClaimed][21], PlayerInfo[playerid][bpClaimed][22], PlayerInfo[playerid][bpClaimed][23], PlayerInfo[playerid][bpClaimed][24], PlayerInfo[playerid][bpClaimed][25], PlayerInfo[playerid][bpClaimed][26], PlayerInfo[playerid][bpClaimed][27], PlayerInfo[playerid][bpClaimed][28], PlayerInfo[playerid][bpClaimed][29],
        PlayerInfo[playerid][bpClaimed][30], PlayerInfo[playerid][bpClaimed][31], PlayerInfo[playerid][bpClaimed][32], PlayerInfo[playerid][bpClaimed][33], PlayerInfo[playerid][bpClaimed][34], PlayerInfo[playerid][bpClaimed][35], PlayerInfo[playerid][bpClaimed][36], PlayerInfo[playerid][bpClaimed][37], PlayerInfo[playerid][bpClaimed][38], PlayerInfo[playerid][bpClaimed][39],
        PlayerInfo[playerid][pSQLID]);
    mysql_tquery(SQL, gString);
}

std::GetBPValue(index) {
    switch(index/10) {
        case 0: {
            switch(index) {
                case 0: return 5;
                case 1: return 10;
                case 2: return 3;
                case 3: return 30;
                case 4: return 3;
                case 5: return 3;
                case 6: return 3;
                case 7: return 40;
                case 8: return 1;
                case 9: return 54000;
            }
        }
        case 1: {
            switch(index%10) {
                case 0: return 25;
                case 1: return 50;
                case 2: return 1;
                case 3: return 10;
                case 4: return 1000;
                case 5: return 1;
            }
        }
        case 2: {
            switch(index%10) {
                case 0: return 10;
                case 1: return 5;
                case 2: return 10;
                case 3: return 1;
                case 4: return 1;
            }
        }
        case 3: {
            switch(index%10) {
                case 0: return 1;
                case 1: return 5;
                case 2: return 4;
                case 3: return 25;
                case 4: return 50;
            }
        }
    }
    return 0;
}

cmd:setchapter(playerid, params[]) {
    if(!IsAdmin(playerid, 7))
        return SCM(playerid, COLOR_LGREEN, AdminOnly);

    if(sscanf(params, "i", params[0]))
        return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/setchapter [chapter]");

    if(params[0] < 1 || params[0] > 4) return true;

    bpChapter = params[0];
    SCMf(playerid, COLOR_WHITE, "Chapter %d loaded..", params[0]);
    _query(128, "UPDATE `server` SET `chapter`='%i'", params[0]);
    return true;
}

cmd:startbp(playerid, params[]) {
    if(!IsAdmin(playerid, 7))
        return SCM(playerid, COLOR_LGREEN, AdminOnly);

    if(sscanf(params, "i", params[0]))
        return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/startbp [end in x days]");

    bpTime = gettime() + (params[0] * 86400);
    SCMf(playerid, COLOR_WHITE, "BattlePass end in %d days.", params[0]);
    _query(128, "UPDATE `server` SET `bpTime`='%i'", bpTime);
    return true;
}

cmd:endbp(playerid, params[]) {
    if(!IsAdmin(playerid, 7))
        return SCM(playerid, COLOR_LGREEN, AdminOnly);

    bpTime=gettime();
    SCM(playerid, COLOR_WHITE, "BattlePass end");
    _query(128, "UPDATE `server` SET `bpTime`='%i'", bpTime);
    return true;
}