// Main
#pragma compat 1
#pragma dynamic (64*1024)

#define YSI_NO_HEAP_MALLOC
#define YSI_NO_MODE_CACHE
#define YSI_NO_CACHE_MESSAGE
#define CGEN_MEMORY 60000

#define YSI_NO_OPTIMISATION_MESSAGE
#define YSI_NO_VERSION_CHECK


#include <a_samp>
#include <Pawn.CMD>
#include <gvar>
#include <a_mysql>	
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
//#include <nex-ac>

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

enum {
	HOST_LOCAL,
	HOST_GLOBAL
}
#pragma unused UpdateDialogVStyle

new bool:h_status = bool:HOST_GLOBAL;

// modules
#include "./src/encrypt"
//#include "./src/protection.pwn"
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