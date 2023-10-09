std::checkReclame(playerid, const string[]) {
	if strfind(string, "b-hood", true) != -1 ||
	strfind(string, "bugged", true) != -1 ||
	strfind(string, "nephrite", true) != -1 ||
	strfind(string, "crowland", true) != -1 ||
	strfind(string, "redtimes", true) != -1 ||
	strfind(string, "og-times", true) != -1 ||
	strfind(string, "rpg.crowland.ro", true) != -1 ||
	strfind(string, "Lordstrike", true) != -1 ||
	strfind(string, "b-zone", true) != -1 ||
	strfind(string, "rpg.b-hood.ro", true) != -1 ||
	strfind(string, "blue.bugeed.ro", true) != -1 ||
	strfind(string, "ruby", true) != -1 ||
	strfind(string, "rpg.gamestar.ro", true) != -1 ||
	strfind(string, "bzone", true) != -1 ||
	strfind(string, "blaze", true) != -1 ||
	strfind(string, "rpg bhood", true) != -1 ||
	strfind(string, "bhood", true) != -1 ||
	strfind(string, "charged", true) != -1 ||
	strfind(string, "megatimes", true) != -1 ||
	strfind(string, "redtimes.ro", true) != -1 ||
	strfind(string, "new-times", true) != -1 ||
	strfind(string, "red-earth", true) != -1 ||
	strfind(string, "og-life", true) != -1 ||
	strfind(string, "grown", true) != -1 ||
	strfind(string, "phoenix", true) != -1 ||
	strfind(string, "gta youtubers", true) != -1 ||
	strfind(string, "sharpen", true) != -1 ||
	strfind(string, "bigzone", true) != -1 ||
	strfind(string, "blackgun", true) != -1 ||
	strfind(string, "forteam", true) != -1 ||
	strfind(string, "hellzone", true) != -1 ||
	strfind(string, "snook", true) != -1 ||
	strfind(string, "bplay", true) != -1 ||
	strfind(string, "h2p", true) != -1 ||
	strfind(string, "fun4play", true) != -1 ||
	strfind(string, "pcsmania", true) != -1 ||
	strfind(string, "revised", true) != -1 ||
	strfind(string, "chars", true) != -1 *then {
		format(gString, 128, "Warning: jucator %s (ID: %d, level: %d) posibil sa faca reclama ('%s')", GetName(playerid), playerid, PlayerInfo[playerid][pLevel], string);	
		SendAdminMessage(COLOR_RED, gString, 1);
		return true;
	}
	return false;
}