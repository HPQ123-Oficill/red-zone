
#include <discord-connector>
#include <YSI_Coding\y_hooks>


#define MAX_DISCORD_CODE  24
static discordToken[MAX_PLAYERS][DCC_ID_SIZE], Text:DiscordHelpTD[31], DiscordCode[MAX_PLAYERS][MAX_DISCORD_CODE], Text:StepDiscordTD[28], Text:DiscordSecurity[13];

static DCC_User:userAccount;


new DCC_Message:StatMessage = DCC_Message:0, StatTarget;

redist::CreatedChannel(playerid){
    new string[64];
    format(string, 64, "You accound ID: %d", playerid);
    DCC_SendChannelMessage(DCC_GetCreatedPrivateChannel(), string);
}

stock registerAccoutnDiscord(playerid, x=-1) {
    TogglePlayerControllable(playerid, false);
    while(++x<31) TextDrawShowForPlayer(playerid, DiscordHelpTD[x]);
    Dialog_Show(playerid, #register_discord_code, DIALOG_STYLE_INPUT, "Discord Security", "Introdu numele de ultilizator din casuta de mai jos pentru a inregistra contul.", "Continue", "");
    return true;
}

Dialog:register_discord_code(playerid, response, listitem, inputtext[]) {
    if(!response) return Dialog_Show(playerid, #register_discord_code, DIALOG_STYLE_INPUT, "Discord Security", "Introdu numele de ultilizator din casuta de mai jos pentru a inregistra contul.", "Continue", "");
    new div = strfind(inputtext, "#", false);
    if(div == -1) return Dialog_Show(playerid, #register_discord_code, DIALOG_STYLE_INPUT, "Discord Security", "Introdu numele de ultilizator din casuta de mai jos pentru a inregistra contul.", "Continue", "");
    PlayerInfo[playerid][pDiscordSecurity] = false;
    new name[40], tag[5];
    strmid(name, inputtext, 0, div);
    strmid(tag, inputtext, div+1, div + 5);
    DCC_GetUserId(DCC_FindUserByName(name, tag), discordToken[playerid]);
    Dialog_ShowEx(playerid, #confirm_discord_account, DIALOG_STYLE_MSGBOX, "Discord Security", "Esti sigur ca contul %s cu tag-ul %s este a-l tau?\n\n{CD8308}(!) Atentie pentru a evita abuzurile vei putea folosi aceasta optiune odata la 2 ore.", "Confirm", "No", name, tag);
    return true;
}
Dialog:confirm_discord_account(playerid, response, listitem, inputtext[]) {
    if(!response) return Dialog_Show(playerid, #register_discord_code, DIALOG_STYLE_INPUT, "Discord Security", "Introdu numele de ultilizator din casuta de mai jos pentru a inregistra contul.", "Continue", "");
    userAccount = DCC_FindUserById(discordToken[playerid]);
    DCC_CreatePrivateChannel(userAccount, "CreatePrivateChannel", "i", playerid);
    return true;
}
redist::CreatePrivateChannel(target) {
    new DCC_Embed:embed = DCC_CreateEmbed();

    DCC_SetEmbedColor(embed, 0xE87F1C);

    format(gString, _, "Salut %s!", GetName(target));
    DCC_SetEmbedTitle(embed, gString);

    format(gString, _, "https://earthpanel.og-times.ro/assets/images/big-skins/%d.png", PlayerInfo[target][pModel]);
    DCC_SetEmbedThumbnail(embed, gString);

    format(gString, _, "%d", PlayerInfo[target][pLevel]);
    DCC_AddEmbedField(embed, "Level", gString, true);

    format(gString, _, "%02d ore si %02d minute", PlayerInfo[target][pPlaying] / 3600, (PlayerInfo[target][pPlaying] / 60) % 60);
    DCC_AddEmbedField(embed, "Playing", gString, true);

    if(PlayerInfo[target][pAdmin]) format(gString, _, "Admin %d", PlayerInfo[target][pAdmin]);
    else if(PlayerInfo[target][pHelper]) format(gString, _, "Helper %d", PlayerInfo[target][pHelper]);
    DCC_AddEmbedField(embed, "Functions", gString, true);

    strmid(DiscordCode[target], randomString(MAX_DISCORD_CODE,5,'-'), 0, MAX_DISCORD_CODE);
    format(gString, _, "Copiaza acest cod si pune-l pe server.\n```%s```\nValabil 5 minute", DiscordCode[target]);
    DCC_AddEmbedField(embed, "Informatii:", gString, true);
    
    DCC_SetEmbedFooter(embed, "All rights reserved (c) red-zone.ro 2022");
    DCC_SendChannelEmbedMessage(DCC_GetCreatedPrivateChannel(), embed, "", "sendDiscordMessage", "i", target);
    return true;
}
redist::sendDiscordMessage(playerid) {
    new DCC_Message:message = DCC_GetCreatedMessage();
     
    if(StatMessage != DCC_Message:0) DCC_DeleteInternalMessage(StatMessage);
    StatMessage = message;
    StatTarget = playerid;   
    
    new x=-1;
    while(++x<28) TextDrawShowForPlayer(playerid, StepDiscordTD[x]); x=-1;
    while(++x<31) TextDrawHideForPlayer(playerid, DiscordHelpTD[x]);
    Dialog_Show(playerid, #check_discord_code, DIALOG_STYLE_INPUT, "Discord Security", "Introdu cod-ul pe care l-ai primit pe discord.", "Done", "");

    DCC_SetMessagePersistent(message, true);
    return true;
}

Dialog:check_discord_code(playerid, response, listitem, inputtext[]) {
    if(!response) return Dialog_Show(playerid, #check_discord_code, DIALOG_STYLE_INPUT, "Discord Security", "Introdu cod-ul pe care l-ai primit pe discord.", "Done", "");
    if(strmatch(inputtext, DiscordCode[playerid])) {
        new x=-1;
        while(++x<28) TextDrawHideForPlayer(playerid, StepDiscordTD[x]);
        _query(256, "UPDATE `users` SET `Discord_Token` = '%e' WHERE `id` = '%i'", discordToken[StatTarget], PlayerInfo[StatTarget][pSQLID]);
        SCM(StatTarget, COLOR_GM, "Discord Security >> {FFFFFF}Ai activat securitatea prin discord!");
        format(gString, _, "Ai activat securitatea prin Discord pe contul %s (%d)!\nAcum de fiecare data cand te loghezi va trebuii sa confirmi ca tu te-ai logat pe cont.", GetName(StatTarget), PlayerInfo[StatTarget][pSQLID]);
        editDiscordMessage(StatMessage, "SUCCESS!", gString, 0x1DEC52);
        PlayerInfo[playerid][pDiscordSecurity] = true;
        TogglePlayerControllable(playerid, true);
        init_account_others(playerid);
        return true;
    } else Dialog_Show(playerid, #check_discord_code, DIALOG_STYLE_INPUT, "Discord Security", "Introdu cod-ul pe care l-ai primit pe discord.\n{FF0000}Codul pe care l-ai introdus este invalid!", "Done", "");
    return true;
}

stock editDiscordMessage(DCC_Message:message, const title[], const string[], color = 0xFF0000) {
    new DCC_Embed:embed = DCC_CreateEmbed(title);
    DCC_SetEmbedColor(embed, color);
    DCC_SetEmbedDescription(embed, string);
    DCC_DeleteMessageReaction(message);
    DCC_EditMessage(message, "", embed);
    DCC_DeleteInternalMessage(message);
    StatMessage = DCC_Message:0;
    return true;
}

stock confirmDiscordAccount(playerid, x=-1) {
    while(++x<13) TextDrawShowForPlayer(playerid, DiscordSecurity[x]);
    TogglePlayerControllable(playerid, false);
    PlayerInfo[playerid][pDiscordSecurity] = false;
    userAccount = DCC_FindUserById(discordToken[playerid]);
    DCC_CreatePrivateChannel(userAccount, "DCC_SendVerify", "i", playerid);
    return true;
}

redist::DCC_SendVerify(target) {
    new DCC_Embed:embed = DCC_CreateEmbed();

    DCC_SetEmbedColor(embed, 0xE87F1C);

    DCC_SetEmbedTitle(embed, "Admin Security");

    format(gString, _, "https://earthpanel.og-times.ro/assets/images/big-skins/%d.png", PlayerInfo[target][pModel]);
    DCC_SetEmbedThumbnail(embed, gString);

    format(gString, _, "%d", PlayerInfo[target][pLevel]);
    DCC_AddEmbedField(embed, "Level", gString, true);

    format(gString, _, "%02d ore si %02d minute", PlayerInfo[target][pPlaying] / 3600, (PlayerInfo[target][pPlaying] / 60) % 60);
    DCC_AddEmbedField(embed, "Playing", gString, true);

    if(PlayerInfo[target][pAdmin]) format(gString, _, "Admin %d", PlayerInfo[target][pAdmin]);
    else if(PlayerInfo[target][pHelper]) format(gString, _, "Helper %d", PlayerInfo[target][pHelper]);
    DCC_AddEmbedField(embed, "Functions", gString, true);

    strmid(DiscordCode[target], randomString(MAX_DISCORD_CODE,5,'-'), 0, MAX_DISCORD_CODE);
    DCC_AddEmbedField(embed, "Informatii:", "```Cineva s-a logat pe contul tau, daca tu esti acea persoana apasa pe ✅ daca nu esti tu apasa pe ❌```", true);
    
    DCC_SetEmbedFooter(embed, "All rights reserved (c) red-zone.ro 2022");
    DCC_SendChannelEmbedMessage(DCC_GetCreatedPrivateChannel(), embed, "", "DCC_ConfirmDiscordAccount", "i", target);
    return true;
}

redist::DCC_ConfirmDiscordAccount(playerid) {
    new 
        DCC_Message:message = DCC_GetCreatedMessage();
    
    if(StatMessage != DCC_Message:0)
        DCC_DeleteInternalMessage(StatMessage);

    StatMessage = message;
    StatTarget = playerid;
    
    DCC_CreateReaction(message, DCC_CreateEmoji("✅"));
    DCC_CreateReaction(message, DCC_CreateEmoji("❌"));   
    
    DCC_SetMessagePersistent(message, true);
    return true;
}

public DCC_OnMessageReaction(DCC_Message:message, DCC_User:reaction_user, DCC_Emoji:emoji, DCC_MessageReactionType:reaction_type)
{
    new DCC_Channel:channel, bool:bot;
    DCC_GetMessageChannel(message, channel);

    if(reaction_type == REACTION_ADD)
    {
        if(!DCC_IsUserBot(reaction_user, bot))
            return 1;

        if(bot)
            return 1;
        
        if(StatMessage == message && _:StatMessage != 0)
        {
            new emoji_name[DCC_EMOJI_NAME_SIZE];
            DCC_GetEmojiName(emoji, emoji_name);

            if(!strcmp("✅", emoji_name)) {
                format(gString, _, "Ai confirmat logarea pe contul %s (%d)", GetName(StatTarget), PlayerInfo[StatTarget][pSQLID]);
                editDiscordMessage(message, "Admin Security", gString, 0x00FF00);
                new x=-1;
                while(++x<13) TextDrawHideForPlayer(StatTarget, DiscordSecurity[x]);
                TogglePlayerControllable(StatTarget, true);
                PlayerInfo[StatTarget][pDiscordSecurity] = true;
                init_account_others(StatTarget);
            }
            else if(!strcmp("❌", emoji_name)) {
                Kick(StatTarget);
                editDiscordMessage(message, "Admin Security", "Persoana care s-a logat pe contul tau a primit kick\n```Daca nu ai fost tu schimba parola de pe panel.red-zone.ro```", 0xFF0000);
            }
        }
    }
    return 1;
}

stock check_discord_security(row, const table_name[], playerid) {
    clearChat.playerid(20);
    cache_get_value_name(row, table_name, discordToken[playerid]);

    if(discordToken[playerid][0] == '-' && discordToken[playerid][1] == '1') return registerAccoutnDiscord(playerid);
    confirmDiscordAccount(playerid);
    return true;
}

hook OnGameModeInit() {
    DCC_SetBotPresenceStatus(IDLE);
    DCC_SetBotActivity("[BETA] script red-zone");

    DiscordHelpTD[0] = TextDrawCreate(240.976348, 141.773345, "ld_beat:chit");
    TextDrawLetterSize(DiscordHelpTD[0], 0.000000, 0.000000);
    TextDrawTextSize(DiscordHelpTD[0], 22.000000, 23.000000);
    TextDrawAlignment(DiscordHelpTD[0], 1);
    TextDrawColor(DiscordHelpTD[0], 539108863);
    TextDrawSetShadow(DiscordHelpTD[0], 0);
    TextDrawSetOutline(DiscordHelpTD[0], 0);
    TextDrawBackgroundColor(DiscordHelpTD[0], 255);
    TextDrawFont(DiscordHelpTD[0], 4);
    TextDrawSetProportional(DiscordHelpTD[0], 0);
    TextDrawSetShadow(DiscordHelpTD[0], 0);

    DiscordHelpTD[1] = TextDrawCreate(241.014511, 44.313323, "ld_beat:chit");
    TextDrawLetterSize(DiscordHelpTD[1], 0.000000, 0.000000);
    TextDrawTextSize(DiscordHelpTD[1], 22.000000, 23.000000);
    TextDrawAlignment(DiscordHelpTD[1], 1);
    TextDrawColor(DiscordHelpTD[1], 539108863);
    TextDrawSetShadow(DiscordHelpTD[1], 0);
    TextDrawSetOutline(DiscordHelpTD[1], 0);
    TextDrawBackgroundColor(DiscordHelpTD[1], 255);
    TextDrawFont(DiscordHelpTD[1], 4);
    TextDrawSetProportional(DiscordHelpTD[1], 0);
    TextDrawSetShadow(DiscordHelpTD[1], 0);

    DiscordHelpTD[2] = TextDrawCreate(379.643127, 141.886474, "ld_beat:chit");
    TextDrawLetterSize(DiscordHelpTD[2], 0.000000, 0.000000);
    TextDrawTextSize(DiscordHelpTD[2], 22.000000, 23.000000);
    TextDrawAlignment(DiscordHelpTD[2], 1);
    TextDrawColor(DiscordHelpTD[2], 909721599);
    TextDrawSetShadow(DiscordHelpTD[2], 0);
    TextDrawSetOutline(DiscordHelpTD[2], 0);
    TextDrawBackgroundColor(DiscordHelpTD[2], 255);
    TextDrawFont(DiscordHelpTD[2], 4);
    TextDrawSetProportional(DiscordHelpTD[2], 0);
    TextDrawSetShadow(DiscordHelpTD[2], 0);

    DiscordHelpTD[3] = TextDrawCreate(379.566711, 44.346679, "ld_beat:chit");
    TextDrawLetterSize(DiscordHelpTD[3], 0.000000, 0.000000);
    TextDrawTextSize(DiscordHelpTD[3], 22.000000, 23.000000);
    TextDrawAlignment(DiscordHelpTD[3], 1);
    TextDrawColor(DiscordHelpTD[3], 909721599);
    TextDrawSetShadow(DiscordHelpTD[3], 0);
    TextDrawSetOutline(DiscordHelpTD[3], 0);
    TextDrawBackgroundColor(DiscordHelpTD[3], 255);
    TextDrawFont(DiscordHelpTD[3], 4);
    TextDrawSetProportional(DiscordHelpTD[3], 0);
    TextDrawSetShadow(DiscordHelpTD[3], 0);

    DiscordHelpTD[4] = TextDrawCreate(244.752288, 55.233322, "LD_SPAC:white");
    TextDrawLetterSize(DiscordHelpTD[4], 0.000000, 0.000000);
    TextDrawTextSize(DiscordHelpTD[4], 14.429986, 99.000000);
    TextDrawAlignment(DiscordHelpTD[4], 1);
    TextDrawColor(DiscordHelpTD[4], 539108863);
    TextDrawSetShadow(DiscordHelpTD[4], 0);
    TextDrawSetOutline(DiscordHelpTD[4], 0);
    TextDrawBackgroundColor(DiscordHelpTD[4], 255);
    TextDrawFont(DiscordHelpTD[4], 4);
    TextDrawSetProportional(DiscordHelpTD[4], 0);
    TextDrawSetShadow(DiscordHelpTD[4], 0);

    DiscordHelpTD[5] = TextDrawCreate(251.209457, 47.999973, "LD_SPAC:white");
    TextDrawLetterSize(DiscordHelpTD[5], 0.000000, 0.000000);
    TextDrawTextSize(DiscordHelpTD[5], 19.000000, 113.000000);
    TextDrawAlignment(DiscordHelpTD[5], 1);
    TextDrawColor(DiscordHelpTD[5], 539108863);
    TextDrawSetShadow(DiscordHelpTD[5], 0);
    TextDrawSetOutline(DiscordHelpTD[5], 0);
    TextDrawBackgroundColor(DiscordHelpTD[5], 255);
    TextDrawFont(DiscordHelpTD[5], 4);
    TextDrawSetProportional(DiscordHelpTD[5], 0);
    TextDrawSetShadow(DiscordHelpTD[5], 0);

    DiscordHelpTD[6] = TextDrawCreate(270.142639, 124.999893, "LD_SPAC:white");
    TextDrawLetterSize(DiscordHelpTD[6], 0.000000, 0.000000);
    TextDrawTextSize(DiscordHelpTD[6], 106.000000, 36.000000);
    TextDrawAlignment(DiscordHelpTD[6], 1);
    TextDrawColor(DiscordHelpTD[6], 690696191);
    TextDrawSetShadow(DiscordHelpTD[6], 0);
    TextDrawSetOutline(DiscordHelpTD[6], 0);
    TextDrawBackgroundColor(DiscordHelpTD[6], 255);
    TextDrawFont(DiscordHelpTD[6], 4);
    TextDrawSetProportional(DiscordHelpTD[6], 0);
    TextDrawSetShadow(DiscordHelpTD[6], 0);

    DiscordHelpTD[7] = TextDrawCreate(270.461822, 142.619903, "LD_SPAC:white");
    TextDrawLetterSize(DiscordHelpTD[7], 0.000000, 0.000000);
    TextDrawTextSize(DiscordHelpTD[7], 105.799957, 1.000000);
    TextDrawAlignment(DiscordHelpTD[7], 1);
    TextDrawColor(DiscordHelpTD[7], 909589503);
    TextDrawSetShadow(DiscordHelpTD[7], 0);
    TextDrawSetOutline(DiscordHelpTD[7], 0);
    TextDrawBackgroundColor(DiscordHelpTD[7], 255);
    TextDrawFont(DiscordHelpTD[7], 4);
    TextDrawSetProportional(DiscordHelpTD[7], 0);
    TextDrawSetShadow(DiscordHelpTD[7], 0);

    DiscordHelpTD[8] = TextDrawCreate(270.414245, 142.660263, "ld_beat:chit");
    TextDrawLetterSize(DiscordHelpTD[8], 0.000000, 0.000000);
    TextDrawTextSize(DiscordHelpTD[8], 17.969999, 19.000000);
    TextDrawAlignment(DiscordHelpTD[8], 1);
    TextDrawColor(DiscordHelpTD[8], -89777409);
    TextDrawSetShadow(DiscordHelpTD[8], 0);
    TextDrawSetOutline(DiscordHelpTD[8], 0);
    TextDrawBackgroundColor(DiscordHelpTD[8], 255);
    TextDrawFont(DiscordHelpTD[8], 4);
    TextDrawSetProportional(DiscordHelpTD[8], 0);
    TextDrawSetShadow(DiscordHelpTD[8], 0);

    DiscordHelpTD[9] = TextDrawCreate(273.223693, 152.067001, "ld_beat:chit");
    TextDrawLetterSize(DiscordHelpTD[9], 0.000000, 0.000000);
    TextDrawTextSize(DiscordHelpTD[9], 12.000000, 6.000000);
    TextDrawAlignment(DiscordHelpTD[9], 1);
    TextDrawColor(DiscordHelpTD[9], -1);
    TextDrawSetShadow(DiscordHelpTD[9], 0);
    TextDrawSetOutline(DiscordHelpTD[9], 0);
    TextDrawBackgroundColor(DiscordHelpTD[9], 255);
    TextDrawFont(DiscordHelpTD[9], 4);
    TextDrawSetProportional(DiscordHelpTD[9], 0);
    TextDrawSetShadow(DiscordHelpTD[9], 0);

    DiscordHelpTD[10] = TextDrawCreate(276.571319, 146.973648, "ld_beat:chit");
    TextDrawLetterSize(DiscordHelpTD[10], 0.000000, 0.000000);
    TextDrawTextSize(DiscordHelpTD[10], 5.000000, 6.000000);
    TextDrawAlignment(DiscordHelpTD[10], 1);
    TextDrawColor(DiscordHelpTD[10], -1);
    TextDrawSetShadow(DiscordHelpTD[10], 0);
    TextDrawSetOutline(DiscordHelpTD[10], 0);
    TextDrawBackgroundColor(DiscordHelpTD[10], 255);
    TextDrawFont(DiscordHelpTD[10], 4);
    TextDrawSetProportional(DiscordHelpTD[10], 0);
    TextDrawSetShadow(DiscordHelpTD[10], 0);

    DiscordHelpTD[11] = TextDrawCreate(279.299835, 151.240310, "ld_beat:chit");
    TextDrawLetterSize(DiscordHelpTD[11], 0.000000, 0.000000);
    TextDrawTextSize(DiscordHelpTD[11], 8.000000, 9.000000);
    TextDrawAlignment(DiscordHelpTD[11], 1);
    TextDrawColor(DiscordHelpTD[11], 690696191);
    TextDrawSetShadow(DiscordHelpTD[11], 0);
    TextDrawSetOutline(DiscordHelpTD[11], 0);
    TextDrawBackgroundColor(DiscordHelpTD[11], 255);
    TextDrawFont(DiscordHelpTD[11], 4);
    TextDrawSetProportional(DiscordHelpTD[11], 0);
    TextDrawSetShadow(DiscordHelpTD[11], 0);

    DiscordHelpTD[12] = TextDrawCreate(281.023651, 152.893676, "ld_beat:chit");
    TextDrawLetterSize(DiscordHelpTD[12], 0.000000, 0.000000);
    TextDrawTextSize(DiscordHelpTD[12], 5.000000, 6.000000);
    TextDrawAlignment(DiscordHelpTD[12], 1);
    TextDrawColor(DiscordHelpTD[12], -314423809);
    TextDrawSetShadow(DiscordHelpTD[12], 0);
    TextDrawSetOutline(DiscordHelpTD[12], 0);
    TextDrawBackgroundColor(DiscordHelpTD[12], 255);
    TextDrawFont(DiscordHelpTD[12], 4);
    TextDrawSetProportional(DiscordHelpTD[12], 0);
    TextDrawSetShadow(DiscordHelpTD[12], 0);

    DiscordHelpTD[13] = TextDrawCreate(287.852478, 145.793457, "Your Name");
    TextDrawLetterSize(DiscordHelpTD[13], 0.165047, 0.832131);
    TextDrawAlignment(DiscordHelpTD[13], 1);
    TextDrawColor(DiscordHelpTD[13], -1);
    TextDrawSetShadow(DiscordHelpTD[13], 0);
    TextDrawSetOutline(DiscordHelpTD[13], 0);
    TextDrawBackgroundColor(DiscordHelpTD[13], 255);
    TextDrawFont(DiscordHelpTD[13], 1);
    TextDrawSetProportional(DiscordHelpTD[13], 1);
    TextDrawSetShadow(DiscordHelpTD[13], 0);

    DiscordHelpTD[14] = TextDrawCreate(287.271514, 152.420120, "#YOUR TAG");
    TextDrawLetterSize(DiscordHelpTD[14], 0.147045, 0.699863);
    TextDrawAlignment(DiscordHelpTD[14], 1);
    TextDrawColor(DiscordHelpTD[14], -2139062017);
    TextDrawSetShadow(DiscordHelpTD[14], 0);
    TextDrawSetOutline(DiscordHelpTD[14], 0);
    TextDrawBackgroundColor(DiscordHelpTD[14], 255);
    TextDrawFont(DiscordHelpTD[14], 1);
    TextDrawSetProportional(DiscordHelpTD[14], 1);
    TextDrawSetShadow(DiscordHelpTD[14], 0);

    DiscordHelpTD[15] = TextDrawCreate(282.323730, 155.346740, "LD_SPAC:white");
    TextDrawLetterSize(DiscordHelpTD[15], 0.000000, 0.000000);
    TextDrawTextSize(DiscordHelpTD[15], 2.339998, 1.000000);
    TextDrawAlignment(DiscordHelpTD[15], 1);
    TextDrawColor(DiscordHelpTD[15], 690696191);
    TextDrawSetShadow(DiscordHelpTD[15], 0);
    TextDrawSetOutline(DiscordHelpTD[15], 0);
    TextDrawBackgroundColor(DiscordHelpTD[15], 255);
    TextDrawFont(DiscordHelpTD[15], 4);
    TextDrawSetProportional(DiscordHelpTD[15], 0);
    TextDrawSetShadow(DiscordHelpTD[15], 0);

    DiscordHelpTD[16] = TextDrawCreate(270.423675, 47.819881, "LD_SPAC:white");
    TextDrawLetterSize(DiscordHelpTD[16], 0.000000, 0.000000);
    TextDrawTextSize(DiscordHelpTD[16], 105.869972, 77.000000);
    TextDrawAlignment(DiscordHelpTD[16], 1);
    TextDrawColor(DiscordHelpTD[16], 791754495);
    TextDrawSetShadow(DiscordHelpTD[16], 0);
    TextDrawSetOutline(DiscordHelpTD[16], 0);
    TextDrawBackgroundColor(DiscordHelpTD[16], 255);
    TextDrawFont(DiscordHelpTD[16], 4);
    TextDrawSetProportional(DiscordHelpTD[16], 0);
    TextDrawSetShadow(DiscordHelpTD[16], 0);

    DiscordHelpTD[17] = TextDrawCreate(376.185699, 47.893207, "LD_SPAC:white");
    TextDrawLetterSize(DiscordHelpTD[17], 0.000000, 0.000000);
    TextDrawTextSize(DiscordHelpTD[17], 15.000000, 113.000000);
    TextDrawAlignment(DiscordHelpTD[17], 1);
    TextDrawColor(DiscordHelpTD[17], 909721599);
    TextDrawSetShadow(DiscordHelpTD[17], 0);
    TextDrawSetOutline(DiscordHelpTD[17], 0);
    TextDrawBackgroundColor(DiscordHelpTD[17], 255);
    TextDrawFont(DiscordHelpTD[17], 4);
    TextDrawSetProportional(DiscordHelpTD[17], 0);
    TextDrawSetShadow(DiscordHelpTD[17], 0);

    DiscordHelpTD[18] = TextDrawCreate(382.728637, 54.033149, "LD_SPAC:white");
    TextDrawLetterSize(DiscordHelpTD[18], 0.000000, 0.000000);
    TextDrawTextSize(DiscordHelpTD[18], 15.000000, 98.000000);
    TextDrawAlignment(DiscordHelpTD[18], 1);
    TextDrawColor(DiscordHelpTD[18], 909721599);
    TextDrawSetShadow(DiscordHelpTD[18], 0);
    TextDrawSetOutline(DiscordHelpTD[18], 0);
    TextDrawBackgroundColor(DiscordHelpTD[18], 255);
    TextDrawFont(DiscordHelpTD[18], 4);
    TextDrawSetProportional(DiscordHelpTD[18], 0);
    TextDrawSetShadow(DiscordHelpTD[18], 0);

    DiscordHelpTD[19] = TextDrawCreate(384.385986, 139.320129, "LD_SPAC:white");
    TextDrawLetterSize(DiscordHelpTD[19], 0.000000, 0.000000);
    TextDrawTextSize(DiscordHelpTD[19], 13.000000, 12.520009);
    TextDrawAlignment(DiscordHelpTD[19], 1);
    TextDrawColor(DiscordHelpTD[19], 1078217727);
    TextDrawSetShadow(DiscordHelpTD[19], 0);
    TextDrawSetOutline(DiscordHelpTD[19], 0);
    TextDrawBackgroundColor(DiscordHelpTD[19], 255);
    TextDrawFont(DiscordHelpTD[19], 4);
    TextDrawSetProportional(DiscordHelpTD[19], 0);
    TextDrawSetShadow(DiscordHelpTD[19], 0);

    DiscordHelpTD[20] = TextDrawCreate(383.264129, 136.423416, "ld_beat:chit");
    TextDrawLetterSize(DiscordHelpTD[20], 0.000000, 0.000000);
    TextDrawTextSize(DiscordHelpTD[20], 7.000000, 8.000000);
    TextDrawAlignment(DiscordHelpTD[20], 1);
    TextDrawColor(DiscordHelpTD[20], 1078217727);
    TextDrawSetShadow(DiscordHelpTD[20], 0);
    TextDrawSetOutline(DiscordHelpTD[20], 0);
    TextDrawBackgroundColor(DiscordHelpTD[20], 255);
    TextDrawFont(DiscordHelpTD[20], 4);
    TextDrawSetProportional(DiscordHelpTD[20], 0);
    TextDrawSetShadow(DiscordHelpTD[20], 0);

    DiscordHelpTD[21] = TextDrawCreate(383.445129, 147.140075, "ld_beat:chit");
    TextDrawLetterSize(DiscordHelpTD[21], 0.000000, 0.000000);
    TextDrawTextSize(DiscordHelpTD[21], 7.000000, 8.000000);
    TextDrawAlignment(DiscordHelpTD[21], 1);
    TextDrawColor(DiscordHelpTD[21], 1078217727);
    TextDrawSetShadow(DiscordHelpTD[21], 0);
    TextDrawSetOutline(DiscordHelpTD[21], 0);
    TextDrawBackgroundColor(DiscordHelpTD[21], 255);
    TextDrawFont(DiscordHelpTD[21], 4);
    TextDrawSetProportional(DiscordHelpTD[21], 0);
    TextDrawSetShadow(DiscordHelpTD[21], 0);

    DiscordHelpTD[22] = TextDrawCreate(387.202606, 137.686828, "LD_SPAC:white");
    TextDrawLetterSize(DiscordHelpTD[22], 0.000000, 0.000000);
    TextDrawTextSize(DiscordHelpTD[22], 10.720014, 16.020000);
    TextDrawAlignment(DiscordHelpTD[22], 1);
    TextDrawColor(DiscordHelpTD[22], 1078217727);
    TextDrawSetShadow(DiscordHelpTD[22], 0);
    TextDrawSetOutline(DiscordHelpTD[22], 0);
    TextDrawBackgroundColor(DiscordHelpTD[22], 255);
    TextDrawFont(DiscordHelpTD[22], 4);
    TextDrawSetProportional(DiscordHelpTD[22], 0);
    TextDrawSetShadow(DiscordHelpTD[22], 0);

    DiscordHelpTD[23] = TextDrawCreate(266.737609, 125.496498, "ld_beat:chit");
    TextDrawLetterSize(DiscordHelpTD[23], 0.000000, 0.000000);
    TextDrawTextSize(DiscordHelpTD[23], 7.000000, 8.000000);
    TextDrawAlignment(DiscordHelpTD[23], 1);
    TextDrawColor(DiscordHelpTD[23], 404299007);
    TextDrawSetShadow(DiscordHelpTD[23], 0);
    TextDrawSetOutline(DiscordHelpTD[23], 0);
    TextDrawBackgroundColor(DiscordHelpTD[23], 255);
    TextDrawFont(DiscordHelpTD[23], 4);
    TextDrawSetProportional(DiscordHelpTD[23], 0);
    TextDrawSetShadow(DiscordHelpTD[23], 0);

    DiscordHelpTD[24] = TextDrawCreate(266.861755, 137.866531, "ld_beat:chit");
    TextDrawLetterSize(DiscordHelpTD[24], 0.000000, 0.000000);
    TextDrawTextSize(DiscordHelpTD[24], 7.000000, 8.000000);
    TextDrawAlignment(DiscordHelpTD[24], 1);
    TextDrawColor(DiscordHelpTD[24], 404299007);
    TextDrawSetShadow(DiscordHelpTD[24], 0);
    TextDrawSetOutline(DiscordHelpTD[24], 0);
    TextDrawBackgroundColor(DiscordHelpTD[24], 255);
    TextDrawFont(DiscordHelpTD[24], 4);
    TextDrawSetProportional(DiscordHelpTD[24], 0);
    TextDrawSetShadow(DiscordHelpTD[24], 0);

    DiscordHelpTD[25] = TextDrawCreate(345.980743, 137.869812, "ld_beat:chit");
    TextDrawLetterSize(DiscordHelpTD[25], 0.000000, 0.000000);
    TextDrawTextSize(DiscordHelpTD[25], 7.000000, 8.000000);
    TextDrawAlignment(DiscordHelpTD[25], 1);
    TextDrawColor(DiscordHelpTD[25], 404299007);
    TextDrawSetShadow(DiscordHelpTD[25], 0);
    TextDrawSetOutline(DiscordHelpTD[25], 0);
    TextDrawBackgroundColor(DiscordHelpTD[25], 255);
    TextDrawFont(DiscordHelpTD[25], 4);
    TextDrawSetProportional(DiscordHelpTD[25], 0);
    TextDrawSetShadow(DiscordHelpTD[25], 0);

    DiscordHelpTD[26] = TextDrawCreate(346.120239, 125.680091, "ld_beat:chit");
    TextDrawLetterSize(DiscordHelpTD[26], 0.000000, 0.000000);
    TextDrawTextSize(DiscordHelpTD[26], 7.000000, 8.000000);
    TextDrawAlignment(DiscordHelpTD[26], 1);
    TextDrawColor(DiscordHelpTD[26], 404299007);
    TextDrawSetShadow(DiscordHelpTD[26], 0);
    TextDrawSetOutline(DiscordHelpTD[26], 0);
    TextDrawBackgroundColor(DiscordHelpTD[26], 255);
    TextDrawFont(DiscordHelpTD[26], 4);
    TextDrawSetProportional(DiscordHelpTD[26], 0);
    TextDrawSetShadow(DiscordHelpTD[26], 0);

    DiscordHelpTD[27] = TextDrawCreate(268.178619, 128.573333, "LD_SPAC:white");
    TextDrawLetterSize(DiscordHelpTD[27], 0.000000, 0.000000);
    TextDrawTextSize(DiscordHelpTD[27], 83.470100, 14.000000);
    TextDrawAlignment(DiscordHelpTD[27], 1);
    TextDrawColor(DiscordHelpTD[27], 404299007);
    TextDrawSetShadow(DiscordHelpTD[27], 0);
    TextDrawSetOutline(DiscordHelpTD[27], 0);
    TextDrawBackgroundColor(DiscordHelpTD[27], 255);
    TextDrawFont(DiscordHelpTD[27], 4);
    TextDrawSetProportional(DiscordHelpTD[27], 0);
    TextDrawSetShadow(DiscordHelpTD[27], 0);

    DiscordHelpTD[28] = TextDrawCreate(271.026275, 126.743301, "LD_SPAC:white");
    TextDrawLetterSize(DiscordHelpTD[28], 0.000000, 0.000000);
    TextDrawTextSize(DiscordHelpTD[28], 77.690147, 17.779994);
    TextDrawAlignment(DiscordHelpTD[28], 1);
    TextDrawColor(DiscordHelpTD[28], 404299007);
    TextDrawSetShadow(DiscordHelpTD[28], 0);
    TextDrawSetOutline(DiscordHelpTD[28], 0);
    TextDrawBackgroundColor(DiscordHelpTD[28], 255);
    TextDrawFont(DiscordHelpTD[28], 4);
    TextDrawSetProportional(DiscordHelpTD[28], 0);
    TextDrawSetShadow(DiscordHelpTD[28], 0);

    DiscordHelpTD[29] = TextDrawCreate(304.908721, 138.870132, "V");
    TextDrawLetterSize(DiscordHelpTD[29], 0.347428, 1.062399);
    TextDrawAlignment(DiscordHelpTD[29], 1);
    TextDrawColor(DiscordHelpTD[29], 404299007);
    TextDrawSetShadow(DiscordHelpTD[29], 0);
    TextDrawSetOutline(DiscordHelpTD[29], 0);
    TextDrawBackgroundColor(DiscordHelpTD[29], 255);
    TextDrawFont(DiscordHelpTD[29], 1);
    TextDrawSetProportional(DiscordHelpTD[29], 1);
    TextDrawSetShadow(DiscordHelpTD[29], 0);

    DiscordHelpTD[30] = TextDrawCreate(271.826416, 129.039962, "Da clic pentru a copia~n~numele de utilizator");
    TextDrawLetterSize(DiscordHelpTD[30], 0.158476, 0.669866);
    TextDrawAlignment(DiscordHelpTD[30], 1);
    TextDrawColor(DiscordHelpTD[30], -1061109505);
    TextDrawSetShadow(DiscordHelpTD[30], 0);
    TextDrawSetOutline(DiscordHelpTD[30], 0);
    TextDrawBackgroundColor(DiscordHelpTD[30], 255);
    TextDrawFont(DiscordHelpTD[30], 1);
    TextDrawSetProportional(DiscordHelpTD[30], 1);
    TextDrawSetShadow(DiscordHelpTD[30], 0);
    
    StepDiscordTD[0] = TextDrawCreate(240.976348, 141.773345, "ld_beat:chit");
    TextDrawLetterSize(StepDiscordTD[0], 0.000000, 0.000000);
    TextDrawTextSize(StepDiscordTD[0], 22.000000, 23.000000);
    TextDrawAlignment(StepDiscordTD[0], 1);
    TextDrawColor(StepDiscordTD[0], 791754495);
    TextDrawSetShadow(StepDiscordTD[0], 0);
    TextDrawSetOutline(StepDiscordTD[0], 0);
    TextDrawBackgroundColor(StepDiscordTD[0], 255);
    TextDrawFont(StepDiscordTD[0], 4);
    TextDrawSetProportional(StepDiscordTD[0], 0);
    TextDrawSetShadow(StepDiscordTD[0], 0);

    StepDiscordTD[1] = TextDrawCreate(241.014511, 44.313323, "ld_beat:chit");
    TextDrawLetterSize(StepDiscordTD[1], 0.000000, 0.000000);
    TextDrawTextSize(StepDiscordTD[1], 22.000000, 23.000000);
    TextDrawAlignment(StepDiscordTD[1], 1);
    TextDrawColor(StepDiscordTD[1], 791754495);
    TextDrawSetShadow(StepDiscordTD[1], 0);
    TextDrawSetOutline(StepDiscordTD[1], 0);
    TextDrawBackgroundColor(StepDiscordTD[1], 255);
    TextDrawFont(StepDiscordTD[1], 4);
    TextDrawSetProportional(StepDiscordTD[1], 0);
    TextDrawSetShadow(StepDiscordTD[1], 0);

    StepDiscordTD[2] = TextDrawCreate(379.643127, 141.886474, "ld_beat:chit");
    TextDrawLetterSize(StepDiscordTD[2], 0.000000, 0.000000);
    TextDrawTextSize(StepDiscordTD[2], 22.000000, 23.000000);
    TextDrawAlignment(StepDiscordTD[2], 1);
    TextDrawColor(StepDiscordTD[2], 909721599);
    TextDrawSetShadow(StepDiscordTD[2], 0);
    TextDrawSetOutline(StepDiscordTD[2], 0);
    TextDrawBackgroundColor(StepDiscordTD[2], 255);
    TextDrawFont(StepDiscordTD[2], 4);
    TextDrawSetProportional(StepDiscordTD[2], 0);
    TextDrawSetShadow(StepDiscordTD[2], 0);

    StepDiscordTD[3] = TextDrawCreate(379.566711, 44.146682, "ld_beat:chit");
    TextDrawLetterSize(StepDiscordTD[3], 0.000000, 0.000000);
    TextDrawTextSize(StepDiscordTD[3], 22.000000, 23.000000);
    TextDrawAlignment(StepDiscordTD[3], 1);
    TextDrawColor(StepDiscordTD[3], 909721599);
    TextDrawSetShadow(StepDiscordTD[3], 0);
    TextDrawSetOutline(StepDiscordTD[3], 0);
    TextDrawBackgroundColor(StepDiscordTD[3], 255);
    TextDrawFont(StepDiscordTD[3], 4);
    TextDrawSetProportional(StepDiscordTD[3], 0);
    TextDrawSetShadow(StepDiscordTD[3], 0);

    StepDiscordTD[4] = TextDrawCreate(244.752288, 55.233322, "LD_SPAC:white");
    TextDrawLetterSize(StepDiscordTD[4], 0.000000, 0.000000);
    TextDrawTextSize(StepDiscordTD[4], 14.429986, 99.000000);
    TextDrawAlignment(StepDiscordTD[4], 1);
    TextDrawColor(StepDiscordTD[4], 791754495);
    TextDrawSetShadow(StepDiscordTD[4], 0);
    TextDrawSetOutline(StepDiscordTD[4], 0);
    TextDrawBackgroundColor(StepDiscordTD[4], 255);
    TextDrawFont(StepDiscordTD[4], 4);
    TextDrawSetProportional(StepDiscordTD[4], 0);
    TextDrawSetShadow(StepDiscordTD[4], 0);

    StepDiscordTD[5] = TextDrawCreate(251.852188, 47.860008, "LD_SPAC:white");
    TextDrawLetterSize(StepDiscordTD[5], 0.000000, 0.000000);
    TextDrawTextSize(StepDiscordTD[5], 140.000000, 113.000000);
    TextDrawAlignment(StepDiscordTD[5], 1);
    TextDrawColor(StepDiscordTD[5], 909721599);
    TextDrawSetShadow(StepDiscordTD[5], 0);
    TextDrawSetOutline(StepDiscordTD[5], 0);
    TextDrawBackgroundColor(StepDiscordTD[5], 255);
    TextDrawFont(StepDiscordTD[5], 4);
    TextDrawSetProportional(StepDiscordTD[5], 0);
    TextDrawSetShadow(StepDiscordTD[5], 0);

    StepDiscordTD[6] = TextDrawCreate(384.942779, 55.546737, "LD_SPAC:white");
    TextDrawLetterSize(StepDiscordTD[6], 0.000000, 0.000000);
    TextDrawTextSize(StepDiscordTD[6], 13.000000, 97.000000);
    TextDrawAlignment(StepDiscordTD[6], 1);
    TextDrawColor(StepDiscordTD[6], 909721599);
    TextDrawSetShadow(StepDiscordTD[6], 0);
    TextDrawSetOutline(StepDiscordTD[6], 0);
    TextDrawBackgroundColor(StepDiscordTD[6], 255);
    TextDrawFont(StepDiscordTD[6], 4);
    TextDrawSetProportional(StepDiscordTD[6], 0);
    TextDrawSetShadow(StepDiscordTD[6], 0);

    StepDiscordTD[7] = TextDrawCreate(273.299987, 66.893333, "ld_beat:chit");
    TextDrawLetterSize(StepDiscordTD[7], 0.000000, 0.000000);
    TextDrawTextSize(StepDiscordTD[7], 7.000000, 7.000000);
    TextDrawAlignment(StepDiscordTD[7], 1);
    TextDrawColor(StepDiscordTD[7], -394322689);
    TextDrawSetShadow(StepDiscordTD[7], 0);
    TextDrawSetOutline(StepDiscordTD[7], 0);
    TextDrawBackgroundColor(StepDiscordTD[7], 255);
    TextDrawFont(StepDiscordTD[7], 4);
    TextDrawSetProportional(StepDiscordTD[7], 0);
    TextDrawSetShadow(StepDiscordTD[7], 0);

    StepDiscordTD[8] = TextDrawCreate(273.238128, 147.826889, "ld_beat:chit");
    TextDrawLetterSize(StepDiscordTD[8], 0.000000, 0.000000);
    TextDrawTextSize(StepDiscordTD[8], 7.000000, 7.000000);
    TextDrawAlignment(StepDiscordTD[8], 1);
    TextDrawColor(StepDiscordTD[8], -394322689);
    TextDrawSetShadow(StepDiscordTD[8], 0);
    TextDrawSetOutline(StepDiscordTD[8], 0);
    TextDrawBackgroundColor(StepDiscordTD[8], 255);
    TextDrawFont(StepDiscordTD[8], 4);
    TextDrawSetProportional(StepDiscordTD[8], 0);
    TextDrawSetShadow(StepDiscordTD[8], 0);

    StepDiscordTD[9] = TextDrawCreate(274.523803, 69.246604, "LD_SPAC:white");
    TextDrawLetterSize(StepDiscordTD[9], 0.000000, 0.000000);
    TextDrawTextSize(StepDiscordTD[9], 4.599990, 81.000000);
    TextDrawAlignment(StepDiscordTD[9], 1);
    TextDrawColor(StepDiscordTD[9], -394322689);
    TextDrawSetShadow(StepDiscordTD[9], 0);
    TextDrawSetOutline(StepDiscordTD[9], 0);
    TextDrawBackgroundColor(StepDiscordTD[9], 255);
    TextDrawFont(StepDiscordTD[9], 4);
    TextDrawSetProportional(StepDiscordTD[9], 0);
    TextDrawSetShadow(StepDiscordTD[9], 0);

    StepDiscordTD[10] = TextDrawCreate(276.590454, 68.013259, "LD_SPAC:white");
    TextDrawLetterSize(StepDiscordTD[10], 0.000000, 0.000000);
    TextDrawTextSize(StepDiscordTD[10], 106.530113, 86.409873);
    TextDrawAlignment(StepDiscordTD[10], 1);
    TextDrawColor(StepDiscordTD[10], 791754495);
    TextDrawSetShadow(StepDiscordTD[10], 0);
    TextDrawSetOutline(StepDiscordTD[10], 0);
    TextDrawBackgroundColor(StepDiscordTD[10], 255);
    TextDrawFont(StepDiscordTD[10], 4);
    TextDrawSetProportional(StepDiscordTD[10], 0);
    TextDrawSetShadow(StepDiscordTD[10], 0);

    StepDiscordTD[11] = TextDrawCreate(283.695434, 73.453277, "Salut XXXXXXX!");
    TextDrawLetterSize(StepDiscordTD[11], 0.185523, 0.989866);
    TextDrawAlignment(StepDiscordTD[11], 1);
    TextDrawColor(StepDiscordTD[11], -1);
    TextDrawSetShadow(StepDiscordTD[11], 0);
    TextDrawSetOutline(StepDiscordTD[11], 0);
    TextDrawBackgroundColor(StepDiscordTD[11], 255);
    TextDrawFont(StepDiscordTD[11], 1);
    TextDrawSetProportional(StepDiscordTD[11], 1);
    TextDrawSetShadow(StepDiscordTD[11], 0);

    StepDiscordTD[12] = TextDrawCreate(284.161956, 85.459991, "Level  Playing  Functions");
    TextDrawLetterSize(StepDiscordTD[12], 0.156952, 0.870399);
    TextDrawAlignment(StepDiscordTD[12], 1);
    TextDrawColor(StepDiscordTD[12], -1);
    TextDrawSetShadow(StepDiscordTD[12], 0);
    TextDrawSetOutline(StepDiscordTD[12], 0);
    TextDrawBackgroundColor(StepDiscordTD[12], 255);
    TextDrawFont(StepDiscordTD[12], 1);
    TextDrawSetProportional(StepDiscordTD[12], 1);
    TextDrawSetShadow(StepDiscordTD[12], 0);

    StepDiscordTD[13] = TextDrawCreate(283.866638, 91.439994, "xxx    xxx       xxx");
    TextDrawLetterSize(StepDiscordTD[13], 0.142476, 1.019733);
    TextDrawAlignment(StepDiscordTD[13], 1);
    TextDrawColor(StepDiscordTD[13], -1061109505);
    TextDrawSetShadow(StepDiscordTD[13], 0);
    TextDrawSetOutline(StepDiscordTD[13], 0);
    TextDrawBackgroundColor(StepDiscordTD[13], 255);
    TextDrawFont(StepDiscordTD[13], 1);
    TextDrawSetProportional(StepDiscordTD[13], 1);
    TextDrawSetShadow(StepDiscordTD[13], 0);

    StepDiscordTD[14] = TextDrawCreate(283.795440, 105.346572, "Informatii:");
    TextDrawLetterSize(StepDiscordTD[14], 0.185523, 0.989866);
    TextDrawAlignment(StepDiscordTD[14], 1);
    TextDrawColor(StepDiscordTD[14], -1);
    TextDrawSetShadow(StepDiscordTD[14], 0);
    TextDrawSetOutline(StepDiscordTD[14], 0);
    TextDrawBackgroundColor(StepDiscordTD[14], 255);
    TextDrawFont(StepDiscordTD[14], 1);
    TextDrawSetProportional(StepDiscordTD[14], 1);
    TextDrawSetShadow(StepDiscordTD[14], 0);

    StepDiscordTD[15] = TextDrawCreate(284.071289, 114.406669, "Copiaza acest cod si pune-l pe server.");
    TextDrawLetterSize(StepDiscordTD[15], 0.129142, 0.823467);
    TextDrawAlignment(StepDiscordTD[15], 1);
    TextDrawColor(StepDiscordTD[15], -1061109505);
    TextDrawSetShadow(StepDiscordTD[15], 0);
    TextDrawSetOutline(StepDiscordTD[15], 0);
    TextDrawBackgroundColor(StepDiscordTD[15], 255);
    TextDrawFont(StepDiscordTD[15], 1);
    TextDrawSetProportional(StepDiscordTD[15], 1);
    TextDrawSetShadow(StepDiscordTD[15], 0);

    StepDiscordTD[16] = TextDrawCreate(284.190460, 124.279983, "LD_SPAC:white");
    TextDrawLetterSize(StepDiscordTD[16], 0.000000, 0.000000);
    TextDrawTextSize(StepDiscordTD[16], 80.249839, 13.000000);
    TextDrawAlignment(StepDiscordTD[16], 1);
    TextDrawColor(StepDiscordTD[16], 539108863);
    TextDrawSetShadow(StepDiscordTD[16], 0);
    TextDrawSetOutline(StepDiscordTD[16], 0);
    TextDrawBackgroundColor(StepDiscordTD[16], 255);
    TextDrawFont(StepDiscordTD[16], 4);
    TextDrawSetProportional(StepDiscordTD[16], 0);
    TextDrawSetShadow(StepDiscordTD[16], 0);

    StepDiscordTD[17] = TextDrawCreate(284.071258, 142.640014, "All rights reserved (c) red-zone.ro 2022");
    TextDrawLetterSize(StepDiscordTD[17], 0.119238, 0.733866);
    TextDrawAlignment(StepDiscordTD[17], 1);
    TextDrawColor(StepDiscordTD[17], -1);
    TextDrawSetShadow(StepDiscordTD[17], 0);
    TextDrawSetOutline(StepDiscordTD[17], 0);
    TextDrawBackgroundColor(StepDiscordTD[17], 255);
    TextDrawFont(StepDiscordTD[17], 1);
    TextDrawSetProportional(StepDiscordTD[17], 1);
    TextDrawSetShadow(StepDiscordTD[17], 0);

    StepDiscordTD[18] = TextDrawCreate(286.966857, 125.693305, "XXXXXXXXXXXXXXXXXXXX");
    TextDrawLetterSize(StepDiscordTD[18], 0.114285, 0.955733);
    TextDrawAlignment(StepDiscordTD[18], 1);
    TextDrawColor(StepDiscordTD[18], -1061109505);
    TextDrawSetShadow(StepDiscordTD[18], 0);
    TextDrawSetOutline(StepDiscordTD[18], 0);
    TextDrawBackgroundColor(StepDiscordTD[18], 255);
    TextDrawFont(StepDiscordTD[18], 2);
    TextDrawSetProportional(StepDiscordTD[18], 1);
    TextDrawSetShadow(StepDiscordTD[18], 0);

    StepDiscordTD[19] = TextDrawCreate(353.023773, 71.800003, "LD_SPAC:white");
    TextDrawLetterSize(StepDiscordTD[19], 0.000000, 0.000000);
    TextDrawTextSize(StepDiscordTD[19], 25.030000, 25.000000);
    TextDrawAlignment(StepDiscordTD[19], 1);
    TextDrawColor(StepDiscordTD[19], -1378294017);
    TextDrawSetShadow(StepDiscordTD[19], 0);
    TextDrawSetOutline(StepDiscordTD[19], 0);
    TextDrawBackgroundColor(StepDiscordTD[19], 255);
    TextDrawFont(StepDiscordTD[19], 4);
    TextDrawSetProportional(StepDiscordTD[19], 0);
    TextDrawSetShadow(StepDiscordTD[19], 0);

    StepDiscordTD[20] = TextDrawCreate(354.138214, 85.680015, "ld_beat:chit");
    TextDrawLetterSize(StepDiscordTD[20], 0.000000, 0.000000);
    TextDrawTextSize(StepDiscordTD[20], 23.000000, 12.000000);
    TextDrawAlignment(StepDiscordTD[20], 1);
    TextDrawColor(StepDiscordTD[20], 255);
    TextDrawSetShadow(StepDiscordTD[20], 0);
    TextDrawSetOutline(StepDiscordTD[20], 0);
    TextDrawBackgroundColor(StepDiscordTD[20], 255);
    TextDrawFont(StepDiscordTD[20], 4);
    TextDrawSetProportional(StepDiscordTD[20], 0);
    TextDrawSetShadow(StepDiscordTD[20], 0);

    StepDiscordTD[21] = TextDrawCreate(359.166870, 76.493354, "ld_beat:chit");
    TextDrawLetterSize(StepDiscordTD[21], 0.000000, 0.000000);
    TextDrawTextSize(StepDiscordTD[21], 13.000000, 12.000000);
    TextDrawAlignment(StepDiscordTD[21], 1);
    TextDrawColor(StepDiscordTD[21], 255);
    TextDrawSetShadow(StepDiscordTD[21], 0);
    TextDrawSetOutline(StepDiscordTD[21], 0);
    TextDrawBackgroundColor(StepDiscordTD[21], 255);
    TextDrawFont(StepDiscordTD[21], 4);
    TextDrawSetProportional(StepDiscordTD[21], 0);
    TextDrawSetShadow(StepDiscordTD[21], 0);

    StepDiscordTD[22] = TextDrawCreate(251.300140, 54.113494, "ld_beat:chit");
    TextDrawLetterSize(StepDiscordTD[22], 0.000000, 0.000000);
    TextDrawTextSize(StepDiscordTD[22], 24.000000, 27.000000);
    TextDrawAlignment(StepDiscordTD[22], 1);
    TextDrawColor(StepDiscordTD[22], -1);
    TextDrawSetShadow(StepDiscordTD[22], 0);
    TextDrawSetOutline(StepDiscordTD[22], 0);
    TextDrawBackgroundColor(StepDiscordTD[22], 255);
    TextDrawFont(StepDiscordTD[22], 4);
    TextDrawSetProportional(StepDiscordTD[22], 0);
    TextDrawSetShadow(StepDiscordTD[22], 0);

    StepDiscordTD[23] = TextDrawCreate(274.228424, 57.060028, "Red-Zone");
    TextDrawLetterSize(StepDiscordTD[23], 0.207999, 1.011200);
    TextDrawAlignment(StepDiscordTD[23], 1);
    TextDrawColor(StepDiscordTD[23], -1);
    TextDrawSetShadow(StepDiscordTD[23], 0);
    TextDrawSetOutline(StepDiscordTD[23], 0);
    TextDrawBackgroundColor(StepDiscordTD[23], 255);
    TextDrawFont(StepDiscordTD[23], 1);
    TextDrawSetProportional(StepDiscordTD[23], 1);
    TextDrawSetShadow(StepDiscordTD[23], 0);

    StepDiscordTD[24] = TextDrawCreate(253.790527, 56.946807, "ld_beat:chit");
    TextDrawLetterSize(StepDiscordTD[24], 0.000000, 0.000000);
    TextDrawTextSize(StepDiscordTD[24], 19.000000, 21.000000);
    TextDrawAlignment(StepDiscordTD[24], 1);
    TextDrawColor(StepDiscordTD[24], 10475007);
    TextDrawSetShadow(StepDiscordTD[24], 0);
    TextDrawSetOutline(StepDiscordTD[24], 0);
    TextDrawBackgroundColor(StepDiscordTD[24], 255);
    TextDrawFont(StepDiscordTD[24], 4);
    TextDrawSetProportional(StepDiscordTD[24], 0);
    TextDrawSetShadow(StepDiscordTD[24], 0);

    StepDiscordTD[25] = TextDrawCreate(260.190490, 66.573326, "LD_SPAC:white");
    TextDrawLetterSize(StepDiscordTD[25], 0.000000, 0.000000);
    TextDrawTextSize(StepDiscordTD[25], 6.180004, 4.000000);
    TextDrawAlignment(StepDiscordTD[25], 1);
    TextDrawColor(StepDiscordTD[25], -1);
    TextDrawSetShadow(StepDiscordTD[25], 0);
    TextDrawSetOutline(StepDiscordTD[25], 0);
    TextDrawBackgroundColor(StepDiscordTD[25], 255);
    TextDrawFont(StepDiscordTD[25], 4);
    TextDrawSetProportional(StepDiscordTD[25], 0);
    TextDrawSetShadow(StepDiscordTD[25], 0);

    StepDiscordTD[26] = TextDrawCreate(259.947570, 71.586662, "U");
    TextDrawLetterSize(StepDiscordTD[26], 0.298666, -1.126399);
    TextDrawAlignment(StepDiscordTD[26], 1);
    TextDrawColor(StepDiscordTD[26], -1);
    TextDrawSetShadow(StepDiscordTD[26], 0);
    TextDrawSetOutline(StepDiscordTD[26], 0);
    TextDrawBackgroundColor(StepDiscordTD[26], 255);
    TextDrawFont(StepDiscordTD[26], 1);
    TextDrawSetProportional(StepDiscordTD[26], 1);
    TextDrawSetShadow(StepDiscordTD[26], 0);

    StepDiscordTD[27] = TextDrawCreate(262.609588, 61.873329, ".");
    TextDrawLetterSize(StepDiscordTD[27], 0.104761, 1.032533);
    TextDrawAlignment(StepDiscordTD[27], 1);
    TextDrawColor(StepDiscordTD[27], 10475007);
    TextDrawSetShadow(StepDiscordTD[27], 0);
    TextDrawSetOutline(StepDiscordTD[27], 0);
    TextDrawBackgroundColor(StepDiscordTD[27], 255);
    TextDrawFont(StepDiscordTD[27], 1);
    TextDrawSetProportional(StepDiscordTD[27], 1);
    TextDrawSetShadow(StepDiscordTD[27], 0);

    DiscordSecurity[0] = TextDrawCreate(-51.190475, -44.253337, "LD_SPAC:white");
    TextDrawLetterSize(DiscordSecurity[0], 0.000000, 0.000000);
    TextDrawTextSize(DiscordSecurity[0], 812.000000, 498.000000);
    TextDrawAlignment(DiscordSecurity[0], 1);
    TextDrawColor(DiscordSecurity[0], 1449326335);
    TextDrawSetShadow(DiscordSecurity[0], 0);
    TextDrawSetOutline(DiscordSecurity[0], 0);
    TextDrawBackgroundColor(DiscordSecurity[0], 255);
    TextDrawFont(DiscordSecurity[0], 4);
    TextDrawSetProportional(DiscordSecurity[0], 0);
    TextDrawSetShadow(DiscordSecurity[0], 0);

    DiscordSecurity[1] = TextDrawCreate(253.195663, 76.493331, "ld_beat:chit");
    TextDrawLetterSize(DiscordSecurity[1], 0.000000, 0.000000);
    TextDrawTextSize(DiscordSecurity[1], 49.000000, 85.000000);
    TextDrawAlignment(DiscordSecurity[1], 1);
    TextDrawColor(DiscordSecurity[1], -1);
    TextDrawSetShadow(DiscordSecurity[1], 0);
    TextDrawSetOutline(DiscordSecurity[1], 0);
    TextDrawBackgroundColor(DiscordSecurity[1], 255);
    TextDrawFont(DiscordSecurity[1], 4);
    TextDrawSetProportional(DiscordSecurity[1], 0);
    TextDrawSetShadow(DiscordSecurity[1], 0);

    DiscordSecurity[2] = TextDrawCreate(260.747650, 80.726631, "ld_beat:chit");
    TextDrawLetterSize(DiscordSecurity[2], 0.000000, 0.000000);
    TextDrawTextSize(DiscordSecurity[2], 56.000000, 32.000000);
    TextDrawAlignment(DiscordSecurity[2], 1);
    TextDrawColor(DiscordSecurity[2], -1);
    TextDrawSetShadow(DiscordSecurity[2], 0);
    TextDrawSetOutline(DiscordSecurity[2], 0);
    TextDrawBackgroundColor(DiscordSecurity[2], 255);
    TextDrawFont(DiscordSecurity[2], 4);
    TextDrawSetProportional(DiscordSecurity[2], 0);
    TextDrawSetShadow(DiscordSecurity[2], 0);

    DiscordSecurity[3] = TextDrawCreate(250.761932, 58.159984, "Discord Security");
    TextDrawLetterSize(DiscordSecurity[3], 0.470095, 2.265599);
    TextDrawAlignment(DiscordSecurity[3], 1);
    TextDrawColor(DiscordSecurity[3], -1);
    TextDrawSetShadow(DiscordSecurity[3], 0);
    TextDrawSetOutline(DiscordSecurity[3], 0);
    TextDrawBackgroundColor(DiscordSecurity[3], 255);
    TextDrawFont(DiscordSecurity[3], 1);
    TextDrawSetProportional(DiscordSecurity[3], 1);
    TextDrawSetShadow(DiscordSecurity[3], 0);

    DiscordSecurity[4] = TextDrawCreate(311.070953, 75.120025, "ld_beat:chit");
    TextDrawLetterSize(DiscordSecurity[4], 0.000000, 0.000000);
    TextDrawTextSize(DiscordSecurity[4], 49.000000, 85.000000);
    TextDrawAlignment(DiscordSecurity[4], 1);
    TextDrawColor(DiscordSecurity[4], -1);
    TextDrawSetShadow(DiscordSecurity[4], 0);
    TextDrawSetOutline(DiscordSecurity[4], 0);
    TextDrawBackgroundColor(DiscordSecurity[4], 255);
    TextDrawFont(DiscordSecurity[4], 4);
    TextDrawSetProportional(DiscordSecurity[4], 0);
    TextDrawSetShadow(DiscordSecurity[4], 0);

    DiscordSecurity[5] = TextDrawCreate(301.089904, 81.500038, "ld_beat:chit");
    TextDrawLetterSize(DiscordSecurity[5], 0.000000, 0.000000);
    TextDrawTextSize(DiscordSecurity[5], 52.000000, 30.000000);
    TextDrawAlignment(DiscordSecurity[5], 1);
    TextDrawColor(DiscordSecurity[5], -1);
    TextDrawSetShadow(DiscordSecurity[5], 0);
    TextDrawSetOutline(DiscordSecurity[5], 0);
    TextDrawBackgroundColor(DiscordSecurity[5], 255);
    TextDrawFont(DiscordSecurity[5], 4);
    TextDrawSetProportional(DiscordSecurity[5], 0);
    TextDrawSetShadow(DiscordSecurity[5], 0);

    DiscordSecurity[6] = TextDrawCreate(162.000076, 278.746643, "Verifica mesaj-ul in privat pentru a debloca contul tau.");
    TextDrawLetterSize(DiscordSecurity[6], 0.331047, 1.280000);
    TextDrawAlignment(DiscordSecurity[6], 1);
    TextDrawColor(DiscordSecurity[6], -1);
    TextDrawSetShadow(DiscordSecurity[6], 0);
    TextDrawSetOutline(DiscordSecurity[6], 0);
    TextDrawBackgroundColor(DiscordSecurity[6], 255);
    TextDrawFont(DiscordSecurity[6], 1);
    TextDrawSetProportional(DiscordSecurity[6], 1);
    TextDrawSetShadow(DiscordSecurity[6], 0);

    DiscordSecurity[7] = TextDrawCreate(251.809570, 70.860054, "ld_beat:chit");
    TextDrawLetterSize(DiscordSecurity[7], 0.000000, 0.000000);
    TextDrawTextSize(DiscordSecurity[7], 106.000000, 87.000000);
    TextDrawAlignment(DiscordSecurity[7], 1);
    TextDrawColor(DiscordSecurity[7], 1449326335);
    TextDrawSetShadow(DiscordSecurity[7], 0);
    TextDrawSetOutline(DiscordSecurity[7], 0);
    TextDrawBackgroundColor(DiscordSecurity[7], 255);
    TextDrawFont(DiscordSecurity[7], 4);
    TextDrawSetProportional(DiscordSecurity[7], 0);
    TextDrawSetShadow(DiscordSecurity[7], 0);

    DiscordSecurity[8] = TextDrawCreate(242.466705, 76.813308, "ld_beat:chit");
    TextDrawLetterSize(DiscordSecurity[8], 0.000000, 0.000000);
    TextDrawTextSize(DiscordSecurity[8], 124.000000, 76.000000);
    TextDrawAlignment(DiscordSecurity[8], 1);
    TextDrawColor(DiscordSecurity[8], -1);
    TextDrawSetShadow(DiscordSecurity[8], 0);
    TextDrawSetOutline(DiscordSecurity[8], 0);
    TextDrawBackgroundColor(DiscordSecurity[8], 255);
    TextDrawFont(DiscordSecurity[8], 4);
    TextDrawSetProportional(DiscordSecurity[8], 0);
    TextDrawSetShadow(DiscordSecurity[8], 0);

    DiscordSecurity[9] = TextDrawCreate(279.619049, 104.566703, "ld_beat:chit");
    TextDrawLetterSize(DiscordSecurity[9], 0.000000, 0.000000);
    TextDrawTextSize(DiscordSecurity[9], 25.000000, 29.000000);
    TextDrawAlignment(DiscordSecurity[9], 1);
    TextDrawColor(DiscordSecurity[9], 1449326335);
    TextDrawSetShadow(DiscordSecurity[9], 0);
    TextDrawSetOutline(DiscordSecurity[9], 0);
    TextDrawBackgroundColor(DiscordSecurity[9], 255);
    TextDrawFont(DiscordSecurity[9], 4);
    TextDrawSetProportional(DiscordSecurity[9], 0);
    TextDrawSetShadow(DiscordSecurity[9], 0);

    DiscordSecurity[10] = TextDrawCreate(303.080780, 104.340034, "ld_beat:chit");
    TextDrawLetterSize(DiscordSecurity[10], 0.000000, 0.000000);
    TextDrawTextSize(DiscordSecurity[10], 25.000000, 29.000000);
    TextDrawAlignment(DiscordSecurity[10], 1);
    TextDrawColor(DiscordSecurity[10], 1449326335);
    TextDrawSetShadow(DiscordSecurity[10], 0);
    TextDrawSetOutline(DiscordSecurity[10], 0);
    TextDrawBackgroundColor(DiscordSecurity[10], 255);
    TextDrawFont(DiscordSecurity[10], 4);
    TextDrawSetProportional(DiscordSecurity[10], 0);
    TextDrawSetShadow(DiscordSecurity[10], 0);

    DiscordSecurity[11] = TextDrawCreate(330.042205, 75.526710, "ld_beat:chit");
    TextDrawLetterSize(DiscordSecurity[11], 0.000000, 0.000000);
    TextDrawTextSize(DiscordSecurity[11], 31.000000, 31.000000);
    TextDrawAlignment(DiscordSecurity[11], 1);
    TextDrawColor(DiscordSecurity[11], -279422721);
    TextDrawSetShadow(DiscordSecurity[11], 0);
    TextDrawSetOutline(DiscordSecurity[11], 0);
    TextDrawBackgroundColor(DiscordSecurity[11], 255);
    TextDrawFont(DiscordSecurity[11], 4);
    TextDrawSetProportional(DiscordSecurity[11], 0);
    TextDrawSetShadow(DiscordSecurity[11], 0);

    DiscordSecurity[12] = TextDrawCreate(342.009460, 82.306655, "1");
    TextDrawLetterSize(DiscordSecurity[12], 0.400000, 1.600000);
    TextDrawAlignment(DiscordSecurity[12], 1);
    TextDrawColor(DiscordSecurity[12], -1);
    TextDrawSetShadow(DiscordSecurity[12], 0);
    TextDrawSetOutline(DiscordSecurity[12], 0);
    TextDrawBackgroundColor(DiscordSecurity[12], 255);
    TextDrawFont(DiscordSecurity[12], 3);
    TextDrawSetProportional(DiscordSecurity[12], 1);
    TextDrawSetShadow(DiscordSecurity[12], 0);
    return true;
}