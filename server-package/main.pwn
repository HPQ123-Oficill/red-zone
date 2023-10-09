// Main
#pragma compat 1
#pragma dynamic (64*1024)
#define YSI_NO_MODE_CACHE
#define YSI_YES_HEAP_MALLOC
#define DYNAMIC_MEMORY (65536)
#define YSI_NO_OPTIMISATION_MESSAGE
#define YSI_NO_VERSION_CHECK

#include <a_samp>
#include <gvar>
#include <a_mysql>	
#include <Pawn.CMD>
#include <fly>  
#include <gangzone>
#include <streamer>
#include <sscanf2>
#include <progress>
#include <YSI_Coding\y_malloc>
#include <YSI_Data\y_iterate>
#include <YSI_Coding\y_timers>
#include <YSI_Coding\y_inline>
#include <YSI_Visual\y_dialog>
#include <YSI_Extra\y_inline_mysql>
#include <YSI_Coding\y_stringhash>
#include <BigInt>
#include <easyDialog>
#include <dialog_gtav>
#include <nex-ac>

#include <YSI_Coding\y_hooks>

enum {
	SLOT_INVALID,
	SLOT_GASCAN,
	SLOT_MAGIC_CRATE,
	SLOT_PP,
	SLOT_SKIN,
	SLOT_MAX_SKIN = SLOT_SKIN + 299
}

#include "./src/Variables.pwn"
#include <inventory>


cmd:addinv(playerid, params[]) {
	switch(strval(params)) {
		case 0: inventory.Add(playerid, SLOT_GASCAN);
		case 1: inventory.Add(playerid, SLOT_MAGIC_CRATE);
		case 2: inventory.Add(playerid, SLOT_PP);
	}
	return true;
}

cmd:shopinv(playerid) {
	shop.Init(playerid);

	shop.Add(playerid, 0, SLOT_GASCAN);
	shop.Add(playerid, 1, SLOT_MAGIC_CRATE);

	shop.Show(playerid);
	return true;
}

public Shop:OnPlayerClick(playerid, slot, itemtype) {

	return true;
}

hook OnGameModeInit() {
	
	shop.CreateItem(SLOT_GASCAN, 1650, "Gas Can", 1000000);
	shop.CreateItem(SLOT_MAGIC_CRATE, 19918, "Magic Crate", 100);
	shop.CreateItem(SLOT_PP, 1247, "Premium Points", 50);

	inventory.CreateItem(SLOT_INVALID, 18685, "None");
	inventory.CreateItem(SLOT_GASCAN, 1650, "Gas Can");
	inventory.CreateItem(SLOT_MAGIC_CRATE, 19918, "Magic Crate", ._color = 0xFF00FFFF);
	inventory.CreateItem(SLOT_PP, 1247, "Premium Points", ._color=0xFFFF00FF);

	new i=-1;
	while(++i<SLOT_MAX_SKIN) inventory.CreateItem(SLOT_SKIN + i, i, "Skin", .zoom = 0.89);
	return true;
}

public OnPlayerInvetarClick(playerid, slot, itemid)<using> {
	switch(itemid) {
		case SLOT_SKIN..SLOT_MAX_SKIN: {
			if(inventory.AlreadySkin(playerid)) return true;
			inventory.SetSkin(playerid, inventory.Value(playerid, slot));
			inventory.ClearSlot(playerid, slot);
		}
	}
	return true;
}
public OnPlayerInvetarClick(playerid, slot, itemid)<info> {
	SCMf(playerid, -1, "(info) %d %d", slot, itemid);
	return true;
}
public OnPlayerInvetarClick(playerid, attachid, attach_type)<attach> {
	switch(attachid) {
		case 0: {
			inventory.Add(playerid, inventory.GetAttach(playerid, 0));
			inventory.RemoveAttach(playerid, attachid);
		}
	}
	return true;
}
public OnPlayerInvetarClick(playerid, bool:put)<skin> {
	if(put) {
		inventory.Add(playerid, SLOT_SKIN + inventory.GetSkin(playerid), inventory.GetSkin(playerid), "ID:%d", -1);
		inventory.SetSkin(playerid, inventory.DefaultSkin());
	}
	return true;
}

public Inventory:Data_Cache(playerid, slot, type, value) {
	if(type-1 > SLOT_SKIN && type < SLOT_MAX_SKIN) inventory.SlotInfo(playerid, slot, "ID:%d");
	return true;
}

hook OnPlayerDisconnect(playerid) {
	inventory.UpdateData(playerid, PlayerInfo[playerid][pSQLID]);
	return true;
}

enum {
	HOST_LOCAL,
	HOST_GLOBAL
}
#pragma unused UpdateDialogVStyle

new bool:h_status = bool:HOST_GLOBAL;

// modules
#include "./src/encrypt"
#include "./src/protection.pwn"
#include "./src/antiCheat/main.pwn"
#include "./src/Admins.pwn"
#include "./src/atm.pwn"
//#include "./src/Inventar.pwn"	
#include "./src/computer/main.pwn"
#include "./src/friends.pwn"
#include "./src/rouletta.pwn"						
#include "./src/Bussines.pwn"						
#include "./src/OthersFuntion.pwn"							
#include "./src/systems.pwn"							
#include "./src/House.pwn"															
#include "./src/Login.pwn"
#include "./src/BattlePass.pwn"							
#include "./src/PersonalCar.pwn"							
#include "./src/jobs.pwn"												
#include "./src/Factions.pwn"							
#include "./src/PlayerCommands.pwn"							
#include "./src/iPhone/main"
#include "./src/Publics.pwn"			
//#include "./src/special_quest.pwn"				
#include "./src/Timers.pwn"							
#include "./src/VehiculeGlobale.pwn"							
#include "./src/Email.pwn"	
#include "./src/safezone.pwn"						
#include "./src/clans.pwn"	
#include "./src/svf.pwn"	
#include "./src/Reclame.pwn"
#include "./src/turfs.pwn"
#include "./src/Licitatie.pwn"
#include "./src/jobgoal.pwn"
#include "./src/stage"

//#include "./src/carnaval.pwn"