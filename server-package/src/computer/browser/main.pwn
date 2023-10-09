#include "./src/computer/browser/data.pwn"

std::showBrowser(const client, x=-1) {
	while(++x<sizeof BrowserTD) TextDrawShowForPlayer(client, BrowserTD[x]); x=-1;
	ClientBrowserURL[client] = CreatePlayerTextDraw(client, 129.133438, 17.546590, "google.com");
	PlayerTextDrawLetterSize(client, ClientBrowserURL[client], 0.175613, 0.861863);
	PlayerTextDrawAlignment(client, ClientBrowserURL[client], 1);
	PlayerTextDrawColor(client, ClientBrowserURL[client], -1);
	PlayerTextDrawSetShadow(client, ClientBrowserURL[client], 0);
	PlayerTextDrawSetOutline(client, ClientBrowserURL[client], 0);
	PlayerTextDrawBackgroundColor(client, ClientBrowserURL[client], 255);
	PlayerTextDrawFont(client, ClientBrowserURL[client], 1);
	PlayerTextDrawSetProportional(client, ClientBrowserURL[client], 1);
	PlayerTextDrawSetShadow(client, ClientBrowserURL[client], 0);
	PlayerTextDrawShow(client, ClientBrowserURL[client]);

	SelectTextDraw(client, 0x23252FFF);

	// var
	browserClient[client][bActive] = 0;
	browserClient[client][bPage] = 0;
	browserClient[client][bSearch] = false;

	createPageForBrowser(client);
	return true;
}

std::hideBrowser(const client, x=-1) {
	switch(browserClient[client][bPage]) {
		case PAGE_TYPE_GOOGLE: {while(++x<sizeof GoogleTD) TextDrawHideForPlayer(client, GoogleTD[x]); x=-1;}
		case PAGE_TYPE_TOTALBET: if(!hideTotalBet(client)) return true;
		case PAGE_TYPE_REDSKINS: hideRedSkins(client);
		case PAGE_TYPE_YOUTUBE, PAGE_TYPE_DRPCIV: {while(++x<sizeof errorBrowser) TextDrawHideForPlayer(client, errorBrowser[x]); x=-1; }
	}
	while(++x<sizeof BrowserTD) TextDrawHideForPlayer(client, BrowserTD[x]); x=-1;
	PlayerTextDrawDestroy(client, ClientBrowserURL[client]);
	if(browserClient[client][bSearch])
		while(++x<sizeof pageTypes)
			PlayerTextDrawDestroy(client, BrowserURL[client][x*3]),
			PlayerTextDrawDestroy(client, BrowserURL[client][(x*3)+1]),
			PlayerTextDrawDestroy(client, BrowserURL[client][(x*3)+2]); 

	PlayerTextDrawDestroy(client, BrowserPage[client][0]),
	PlayerTextDrawDestroy(client, BrowserPage[client][1]),
	PlayerTextDrawDestroy(client, BrowserPage[client][2]),
	PlayerTextDrawDestroy(client, BrowserPage[client][3]);

	browserClient[client][bLoading] = 32;
	PlayerTextDrawHide(client, BrowserLoading[client]);
	return true;
}

std::createPageForBrowser(client, pageType = PAGE_TYPE_GOOGLE, x=0) {
	browserClient[client][bPage] = -1;

	// show
	BrowserPage[client][x*4] = CreatePlayerTextDraw(client, 0.747448 + (x * 80.809574), 1.140019, "box");
	PlayerTextDrawLetterSize(client, BrowserPage[client][x*4], 0.000000, 1.278795);
	PlayerTextDrawTextSize(client, BrowserPage[client][x*4], 77.800003, 0.000000);
	PlayerTextDrawAlignment(client, BrowserPage[client][x*4], 1);
	PlayerTextDrawColor(client, BrowserPage[client][x*4], -1);
	PlayerTextDrawUseBox(client, BrowserPage[client][x*4], 1);
	PlayerTextDrawBoxColor(client, BrowserPage[client][x*4], 808731647);
	PlayerTextDrawSetShadow(client, BrowserPage[client][x*4], 0);
	PlayerTextDrawSetOutline(client, BrowserPage[client][x*4], 0);
	PlayerTextDrawBackgroundColor(client, BrowserPage[client][x*4], 255);
	PlayerTextDrawFont(client, BrowserPage[client][x*4], 1);
	PlayerTextDrawSetProportional(client, BrowserPage[client][x*4], 1);
	PlayerTextDrawSetShadow(client, BrowserPage[client][x*4], 0);
	PlayerTextDrawShow(client, BrowserPage[client][x*4]);

	BrowserPage[client][(x*4)+1] = CreatePlayerTextDraw(client, 3.323791 + (x * 79.809586), 0.253327, pageLogo[pageType]);
	PlayerTextDrawLetterSize(client, BrowserPage[client][(x*4)+1], 0.377142, 1.531733);
	PlayerTextDrawAlignment(client, BrowserPage[client][(x*4)+1], 1);
	PlayerTextDrawColor(client, BrowserPage[client][(x*4)+1], pageColor[pageType]);
	PlayerTextDrawSetShadow(client, BrowserPage[client][(x*4)+1], 0);
	PlayerTextDrawSetOutline(client, BrowserPage[client][(x*4)+1], 0);
	PlayerTextDrawBackgroundColor(client, BrowserPage[client][(x*4)+1], 255);
	PlayerTextDrawFont(client, BrowserPage[client][(x*4)+1], 1);
	PlayerTextDrawSetProportional(client, BrowserPage[client][(x*4)+1], 1);
	PlayerTextDrawSetShadow(client, BrowserPage[client][(x*4)+1], 0);
	PlayerTextDrawShow(client, BrowserPage[client][(x*4)+1]);

	BrowserPage[client][(x*4)+2] = CreatePlayerTextDraw(client, 15.652380 + (x * 77.871538), 4.646677, pageTitle[pageType]);
	PlayerTextDrawLetterSize(client, BrowserPage[client][(x*4)+2], 0.156948, 0.755199);
	PlayerTextDrawAlignment(client, BrowserPage[client][(x*4)+2], 1);
	PlayerTextDrawColor(client, BrowserPage[client][(x*4)+2], -1);
	PlayerTextDrawSetShadow(client, BrowserPage[client][(x*4)+2], 0);
	PlayerTextDrawSetOutline(client, BrowserPage[client][(x*4)+2], 0);
	PlayerTextDrawBackgroundColor(client, BrowserPage[client][(x*4)+2], 255);
	PlayerTextDrawFont(client, BrowserPage[client][(x*4)+2], 1);
	PlayerTextDrawSetProportional(client, BrowserPage[client][(x*4)+2], 1);
	PlayerTextDrawSetShadow(client, BrowserPage[client][(x*4)+2], 0);
	PlayerTextDrawShow(client, BrowserPage[client][(x*4)+2]);

	BrowserPage[client][(x*4)+3] = CreatePlayerTextDraw(client, 72.695213 + (x * 80.423729), 2.073340, "X");
	PlayerTextDrawLetterSize(client, BrowserPage[client][(x*4)+3], 0.193140, 0.827732);
	PlayerTextDrawTextSize(client, BrowserPage[client][(x*4)+3], 7.000000, 7.000000);
	PlayerTextDrawAlignment(client, BrowserPage[client][(x*4)+3], 2);
	PlayerTextDrawColor(client, BrowserPage[client][(x*4)+3], -1);
	PlayerTextDrawUseBox(client, BrowserPage[client][(x*4)+3], 1);
	PlayerTextDrawBoxColor(client, BrowserPage[client][(x*4)+3], 0);
	PlayerTextDrawSetShadow(client, BrowserPage[client][(x*4)+3], 0);
	PlayerTextDrawSetOutline(client, BrowserPage[client][(x*4)+3], 0);
	PlayerTextDrawBackgroundColor(client, BrowserPage[client][(x*4)+3], 255);
	PlayerTextDrawFont(client, BrowserPage[client][(x*4)+3], 2);
	PlayerTextDrawSetProportional(client, BrowserPage[client][(x*4)+3], 0);
	PlayerTextDrawSetShadow(client, BrowserPage[client][(x*4)+3], 0);
	PlayerTextDrawSetSelectable(client, BrowserPage[client][(x*4)+3], true);
	PlayerTextDrawShow(client, BrowserPage[client][(x*4)+3]);

	redirectWebsite(client, PAGE_TYPE_GOOGLE);
	return ++x;
}

std::redirectWebsite(client, const server) {
	if(browserClient[client][bPage] == server) 
		return true; 

	BrowserLoading[client] = CreatePlayerTextDraw(client, -0.438073, 30.0, "LD_SPAC:white");
	PlayerTextDrawLetterSize(client, BrowserLoading[client], 0.000000, 0.000000);
	PlayerTextDrawTextSize(client, BrowserLoading[client], 0.000000, 2.000000);
	PlayerTextDrawAlignment(client, BrowserLoading[client], 1);

	PlayerTextDrawColor(client, BrowserLoading[client], pageBarColor[server]);
	PlayerTextDrawSetString(client, BrowserPage[client][1], pageLogo[server]);
	PlayerTextDrawColor(client, BrowserPage[client][1], pageColor[server]);
	PlayerTextDrawShow(client, BrowserPage[client][1]);
	PlayerTextDrawSetString(client, BrowserPage[client][2], pageTitle[server]);
	PlayerTextDrawSetString(client, ClientBrowserURL[client], pageTypes[server]);

	PlayerTextDrawSetShadow(client, BrowserLoading[client], 0);
	PlayerTextDrawSetOutline(client, BrowserLoading[client], 0);
	PlayerTextDrawBackgroundColor(client, BrowserLoading[client], 255);
	PlayerTextDrawFont(client, BrowserLoading[client], 4);
	PlayerTextDrawSetProportional(client, BrowserLoading[client], 0);
	PlayerTextDrawSetShadow(client, BrowserLoading[client], 0);
	PlayerTextDrawShow(client, BrowserLoading[client]);

	if(browserClient[client][bSearch]) {
		browserClient[client][bSearch] = false;

		new i=-1;
		while(++i<sizeof pageTypes) 
			PlayerTextDrawDestroy(client, BrowserURL[client][i*3]),
			PlayerTextDrawDestroy(client, BrowserURL[client][(i*3)+1]),
			PlayerTextDrawDestroy(client, BrowserURL[client][(i*3)+2]);
	}

	browserClient[client][bLoading] = 0;
	SetTimerEx(#Timer_Loading_Website, 100, false, "dd", client, server);
	return true;
}

std::toggleSearchWebsite(const client, i=-1) {
	if(browserClient[client][bLoading] < 31) 
		return true;

	if((browserClient[client][bSearch]=!browserClient[client][bSearch])) {
		PlayerTextDrawSetString(client, ClientBrowserURL[client], "");
		while(++i<sizeof pageTypes) {
			BrowserURL[client][i*3] = CreatePlayerTextDraw(client, 115.147598, 27.453311 + (i * 11.0), "LD_SPAC:white");
			PlayerTextDrawLetterSize(client, BrowserURL[client][i*3], 0.000000, 0.000000);
			PlayerTextDrawTextSize(client, BrowserURL[client][i*3], 421.899902, 11.000000);
			PlayerTextDrawAlignment(client, BrowserURL[client][i*3], 1);
			PlayerTextDrawColor(client, BrowserURL[client][i*3], 404365823);
			PlayerTextDrawSetShadow(client, BrowserURL[client][i*3], 0);
			PlayerTextDrawSetOutline(client, BrowserURL[client][i*3], 0);
			PlayerTextDrawBackgroundColor(client, BrowserURL[client][i*3], 255);
			PlayerTextDrawFont(client, BrowserURL[client][i*3], 4);
			PlayerTextDrawSetProportional(client, BrowserURL[client][i*3], 0);
			PlayerTextDrawSetShadow(client, BrowserURL[client][i*3], 0);
			PlayerTextDrawSetSelectable(client, BrowserURL[client][i*3], true);
			PlayerTextDrawShow(client, BrowserURL[client][i*3]);
			PlayerTextID[client][PlayerText:BrowserURL[client][i*3]] = PC_CLICK_GOOGLE+i;

			BrowserURL[client][(i*3)+1] = CreatePlayerTextDraw(client, 128.780838, 28.660001 + (i * 10.0), pageTypes[i]);
			PlayerTextDrawLetterSize(client, BrowserURL[client][(i*3)+1], 0.167618, 0.904533);
			PlayerTextDrawAlignment(client, BrowserURL[client][(i*3)+1], 1);
			PlayerTextDrawColor(client, BrowserURL[client][(i*3)+1], -1);
			PlayerTextDrawSetShadow(client, BrowserURL[client][(i*3)+1], 0);
			PlayerTextDrawSetOutline(client, BrowserURL[client][(i*3)+1], 0);
			PlayerTextDrawBackgroundColor(client, BrowserURL[client][(i*3)+1], 255);
			PlayerTextDrawFont(client, BrowserURL[client][(i*3)+1], 2);
			PlayerTextDrawSetProportional(client, BrowserURL[client][(i*3)+1], 1);
			PlayerTextDrawSetShadow(client, BrowserURL[client][(i*3)+1], 0);
			PlayerTextDrawShow(client, BrowserURL[client][(i*3)+1]);

			BrowserURL[client][(i*3)+2] = CreatePlayerTextDraw(client, 118.633392, 27.186655 + (i * 10.1), pageLogo[i]);
			PlayerTextDrawLetterSize(client, BrowserURL[client][(i*3)+2], 0.321141, 1.284265);
			PlayerTextDrawAlignment(client, BrowserURL[client][(i*3)+2], 1);
			PlayerTextDrawColor(client, BrowserURL[client][(i*3)+2], pageColor[i]);
			PlayerTextDrawSetShadow(client, BrowserURL[client][(i*3)+2], 0);
			PlayerTextDrawSetOutline(client, BrowserURL[client][(i*3)+2], 0);
			PlayerTextDrawBackgroundColor(client, BrowserURL[client][(i*3)+2], 255);
			PlayerTextDrawFont(client, BrowserURL[client][(i*3)+2], 1);
			PlayerTextDrawSetProportional(client, BrowserURL[client][(i*3)+2], 1);
			PlayerTextDrawSetShadow(client, BrowserURL[client][(i*3)+2], 0);
			PlayerTextDrawShow(client, BrowserURL[client][(i*3)+2]);
		}
		return true;
	}

	PlayerTextDrawSetString(client, ClientBrowserURL[client], pageTypes[browserClient[client][bPage]]);
	while(++i<sizeof pageTypes) 
		PlayerTextDrawDestroy(client, BrowserURL[client][i*3]),
		PlayerTextDrawDestroy(client, BrowserURL[client][(i*3)+1]),
		PlayerTextDrawDestroy(client, BrowserURL[client][(i*3)+2]);

	return true;
}

redist::Timer_Loading_Website(const client, const server) {
	new x=-1;
	switch(++browserClient[client][bLoading]) {
		case 32: {
			switch(browserClient[client][bPage]) {
				case PAGE_TYPE_GOOGLE: while(++x<sizeof GoogleTD) TextDrawHideForPlayer(client, GoogleTD[x]);
				case PAGE_TYPE_TOTALBET: while(++x<sizeof TotalBet) TextDrawHideForPlayer(client, TotalBet[x]);
				case PAGE_TYPE_REDSKINS: hideRedSkins(client);
				case PAGE_TYPE_YOUTUBE, PAGE_TYPE_DRPCIV: while(++x<sizeof errorBrowser) TextDrawHideForPlayer(client, errorBrowser[x]);
			}

			browserClient[client][bPage] = server;
			PlayerTextDrawHide(client, BrowserLoading[client]);

			x=-1;
			switch(server) {
				case PAGE_TYPE_GOOGLE: while(++x<sizeof GoogleTD) TextDrawShowForPlayer(client, GoogleTD[x]);
				case PAGE_TYPE_TOTALBET: redirectTotalBet(client);
				case PAGE_TYPE_REDSKINS: redirectRedSkins(client);
				case PAGE_TYPE_YOUTUBE, PAGE_TYPE_DRPCIV: while(++x<sizeof errorBrowser) TextDrawShowForPlayer(client, errorBrowser[x]);
			}
		}
		case 33: return true;
		default: {
			PlayerTextDrawTextSize(client, BrowserLoading[client], browserClient[client][bLoading] * (642.0/30.0), 2.000000);
			PlayerTextDrawShow(client, BrowserLoading[client]);
			SetTimerEx("Timer_Loading_Website", 100, false, "dd", client, server);
		}
	}
	return true;
}

#include "./src/computer/browser/drpciv.pwn"
#include "./src/computer/browser/totalbet.pwn"
#include "./src/computer/browser/redskins.pwn"