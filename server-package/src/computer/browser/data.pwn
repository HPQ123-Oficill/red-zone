
#define MAX_BROWSER_PAGES		(7)

new const pageTypes[][] = {"google.com", "drpciv.ro", "totalbet.ro", "redskins.ro", "YouTube.com"};
new const pageTitle[][] = {"Google", "DRPCIV examen auto", "TotalBet", "Red Skins - For You", "YouTube"};
new const pageLogo[][] = {"G", "D", "T", "S", ">"};
new const pageColor[] = {0xAACF3EFF, 0x31A5D8FF, 0xFF0000FF, 0xB077DCFF, 0xDE1E1EFF};
new pageBarColor[] = {0xFF0000FF, 0x00FFAAFF, 0xFFE800FF, 0xEAC48DFF, 0xDE1E1EFF};

new  
	PlayerText:ClientBrowserURL[MAX_PLAYERS],
	PlayerText:BrowserPage[MAX_PLAYERS][4 * MAX_BROWSER_PAGES],
	PlayerText:BrowserURL[MAX_PLAYERS][sizeof pageTypes * 3],
	PlayerText:BrowserLoading[MAX_PLAYERS]
;

enum E_BROWSER {
	bPage,
	bActive,
	bLoading,
	bool:bSearch
}

new browserClient[MAX_PLAYERS][E_BROWSER];
