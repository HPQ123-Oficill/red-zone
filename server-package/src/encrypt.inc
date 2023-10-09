new static const hash_key[] = {13,9,3,13,23,3,7,23,12,8,5,23,11,15};
new string:hash_ret[144];

stock encrypt(const string:hash[], p=-1) {
	while((hash_ret[++p]=hash[p])) {
		if(hash[p] == 32) continue;

		hash_ret[p]+=hash_key[p%sizeof(hash_key)];
		if(hash_ret[p] > 122) hash_ret[p] -= 90;
		if(hash_ret[p] == '%') hash_ret[p] = '~';
	}
	hash_ret[p] = 0;
	return hash_ret;
}

stock out_encrypt(const string:hash[], p=-1) {
	while((hash_ret[++p]=hash[p])) {
		if(hash[p] == 32) continue;

		if(hash_ret[p] == '~') hash_ret[p] = '%';
		hash_ret[p]-=hash_key[p%sizeof(hash_key)];
		if(hash_ret[p] < 33) hash_ret[p] += 90;
	}
	hash_ret[p] = 0;
	return hash_ret;
}