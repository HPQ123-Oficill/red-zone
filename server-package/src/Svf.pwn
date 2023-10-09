function SQL_Load_ServerVehicleFaction() {
	new faction = cache_num_rows();
	printf("[MySQL] loading %d server vehicle faction.", faction);
	if(faction == 0)
		return true;

	new x=-1,i=-1,result[128];
	while(++x<faction) {
		cache_get_value_name_int(x, "Faction", i);
		
		cache_get_value_name(x, "Model", result);
		sscanf(result, "p<|>iiiiiiiiii", VehFInfo[i][vfModel][0], VehFInfo[i][vfModel][1], VehFInfo[i][vfModel][2], VehFInfo[i][vfModel][3], VehFInfo[i][vfModel][4],
			VehFInfo[i][vfModel][5], VehFInfo[i][vfModel][6], VehFInfo[i][vfModel][7], VehFInfo[i][vfModel][8], VehFInfo[i][vfModel][9]);

		cache_get_value_name(x, "Color1", result);
		sscanf(result, "p<|>iiiiiiiiii", VehFInfo[i][vfColor1][0], VehFInfo[i][vfColor1][1], VehFInfo[i][vfColor1][2], VehFInfo[i][vfColor1][3], VehFInfo[i][vfColor1][4],
			VehFInfo[i][vfColor1][5], VehFInfo[i][vfColor1][6], VehFInfo[i][vfColor1][7], VehFInfo[i][vfColor1][8], VehFInfo[i][vfColor1][9]);

		cache_get_value_name(x, "Color2", result);
		sscanf(result, "p<|>iiiiiiiiii", VehFInfo[i][vfColor2][0], VehFInfo[i][vfColor2][1], VehFInfo[i][vfColor2][2], VehFInfo[i][vfColor2][3], VehFInfo[i][vfColor2][4],
			VehFInfo[i][vfColor2][5], VehFInfo[i][vfColor2][6], VehFInfo[i][vfColor2][7], VehFInfo[i][vfColor2][8], VehFInfo[i][vfColor2][9]);

		cache_get_value_name(x, "Rank", result);
		sscanf(result, "p<|>iiiiiiiiii", VehFInfo[i][vfRank][0], VehFInfo[i][vfRank][1], VehFInfo[i][vfRank][2], VehFInfo[i][vfRank][3], VehFInfo[i][vfRank][4],
			VehFInfo[i][vfRank][5], VehFInfo[i][vfRank][6], VehFInfo[i][vfRank][7], VehFInfo[i][vfRank][8], VehFInfo[i][vfRank][9]);

		cache_get_value_name(x, "Stock", result);
		sscanf(result, "p<|>iiiiiiiiii", VehFInfo[i][vfStock][0], VehFInfo[i][vfStock][1], VehFInfo[i][vfStock][2], VehFInfo[i][vfStock][3], VehFInfo[i][vfStock][4],
			VehFInfo[i][vfStock][5], VehFInfo[i][vfStock][6], VehFInfo[i][vfStock][7], VehFInfo[i][vfStock][8], VehFInfo[i][vfStock][9]);

		cache_get_value_name_int(x, "ID", VehFInfo[i][vfID]);
		cache_get_value_name_float(x, "X", VehFInfo[i][vfX]);
		cache_get_value_name_float(x, "Y", VehFInfo[i][vfY]);
		cache_get_value_name_float(x, "Z", VehFInfo[i][vfZ]);
		
		cache_get_value_name_float(x, "vX", VehFInfo[i][vPos][0]);
		cache_get_value_name_float(x, "vY", VehFInfo[i][vPos][1]);
		cache_get_value_name_float(x, "vZ", VehFInfo[i][vPos][2]);
		cache_get_value_name_float(x, "vR", VehFInfo[i][vPos][3]);
	
		VehFInfo[i][vfPickup] = CreatePickup(19133, 23, VehFInfo[i][vfX], VehFInfo[i][vfY], VehFInfo[i][vfZ]); 
		format(gString, 150, "{%s}%s's {FFFFFF}SVF\n(use </svf>)", FactionInfo_[i - 1][fColor], FactionInfo_[i - 1][fName]);
		VehFInfo[i][vfLabel] = Create3DTextLabel(gString, -1, VehFInfo[i][vfX], VehFInfo[i][vfY], VehFInfo[i][vfZ], 10.0);
	}	
	return true;
}