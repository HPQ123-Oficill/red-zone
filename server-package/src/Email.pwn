alias:emails("email");
YCMD:emails(playerid, params[], help) {
	if(GetCoolDowns(playerid, 5)) 
		return CoolDowns(playerid, 5);

	SetCoolDowns(playerid, 5, 10);
	ShowPlayerEmails(playerid);
	return true;
}

function SQL_Emails(playerid) {
	if(cache_num_rows() == 0) 
		return SCM(playerid, COLOR_GREY, "Not have a emails.");

	new i=-1, text[80], szString[800], bool: read; 
	while(++i<cache_num_rows()) {
		cache_get_value_name_int(i, "ID", PlayerVar[playerid][EmailsID][i]);
		cache_get_value_name_int(i, "Activ", read);
		cache_get_value_name(i, "Text", text);
		text[60] = EOS;
		format(szString, sizeof(szString), "%s%s%s%s\n", szString, read ? ("[UNREAD] ") : (""), text, strlen(text) == 60 ? ("...") : (""));
	}
	ShowPlayerDialog(playerid, DIALOG_EMAILS, DIALOG_STYLE_LIST, "My Emails:", szString, "Select", "Close");
	return true;
}

function ShowPlayerEmails(playerid) {
	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "SELECT * FROM `emails` WHERE `Name`='%s' ORDER BY `emails`.`Activ` DESC LIMIT 10", PlayerInfo[playerid][pName]);
	mysql_tquery(SQL, gQuery, "SQL_Emails", "i", playerid);
	return true;
}

YCMD:sendemail(playerid, params[], help) {
	if(!IsAdmin(playerid, 5))
		return SCM(playerid, COLOR_LGREEN, AdminOnly);

	new name[MAX_PLAYER_NAME], text[128];
	if(sscanf(params, "s[24]s[128]", name, text))
		return SCM(playerid, COLOR_GREY, "Syntax: {FFFFFF}/sendemail [sql name] [text]");

	new id = AccountMYSQL(name);
	if(id == -2)
		return SCM(playerid, COLOR_GREY, "Name not exists in database.");

	SendPlayerEmail(name, text, id);

	gString[0] = EOS;
	format(gString, sizeof(gString), "/sendemail: %s i-a trimis un email lui %s.", GetName(playerid), name);
	SendAdminMessage(COLOR_ADMCMD, gString, 5);
	return true;
}

std::SendPlayerEmail(const name[], const text[], playerid=-1) {
	new year, mounth, days, hours, minute, second, date[30];

	gettime(hours, minute, second);
	getdate(year, mounth, days);

	format(date, sizeof(date), "%02d.%02d.%d %02d:%02d:%02d", days, mounth, year, hours, minute, second);

	gQuery[0] = EOS;
	mysql_format(SQL, gQuery, sizeof(gQuery), "INSERT INTO `emails` (`Text`, `Name`, `Date`) VALUES ('%s', '%s', '%s')", text, name, date);
	mysql_tquery(SQL, gQuery);

	if(playerid != -1) {
		mysql_format(SQL, gQuery, sizeof gQuery, "INSERT INTO `server_actions` (`Action`, `Userid`, `playerid`) VALUES ('1', '%i', '%i')", PlayerInfo[playerid][pSQLID], playerid);
		mysql_tquery(SQL, gQuery);
	}
	return true;
}