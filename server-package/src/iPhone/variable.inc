

new Text:iPhoneTD[30], Text:iPhoneMain, Text:MainPhone[17], status_phone[MAX_PLAYERS], bool:p_locked, Text:iPhone_Call[35], call_p[MAX_PLAYERS][30], 
	var_p[MAX_PLAYERS], PlayerText:iPhone_Call_P[MAX_PLAYERS], PlayerText:Send_Call_PTD[MAX_PLAYERS][2], Text:Send_Call_TD[17], countPhone[MAX_PLAYERS],
	Text:ResponseTD[6]
;

enum {
	PHONE_MAIN = 150,
	PHONE_CALL,
	PHONE_SMS,
	PHONE_SETTINGS,
	PHONE_APPSTORE
}