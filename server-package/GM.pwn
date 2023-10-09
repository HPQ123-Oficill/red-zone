#include <a_samp>
#include <qr>

main() {
	new out[QR_ARRAY_SIZE];
    new ret = QR_GetMatrix("https://southcla.ws/", out);
    printf("ret: %d", ret);
    printf("res: '%s'", out);
}
/*

1
10
100
1000
10000
100000
1000000
10000000
100000000
1000000000
*/

/*
#define addBytes64Ex(%1,%2) extractBytes2(BT:<%1>,#%2)																												                                                                                                                       		
static const power[] = {100000000,10000000,1000000,100000,10000,1000,100,10,1};
stock extractBytes2(&eBit:a,&eBit:b,const value[],l=sizeof value, p=-1,d=-1,v=-1) { 
	if(value[0]!='-') {
		d=l%11,v=l%10;  
		while(++p<v) a+=eBit:((value[p]-'0')*power[8-(d-p)]); --p, --l;
		while(++p<l) b+=eBit:((value[p]-'0')*power[p-v]);
		if(b>=eBit:Bytes1024) ++a,b-=eBit:Bytes1024;
	}
	else {
		d=l%12,v=l%11;  
		while(++p<v) a-=eBit:((value[p+1]-'0')*power[8-(d-p)]); --p, l-=2;
		while(++p<l) b+=eBit:((value[p+1]-'0')*power[p-v]);
		if(b>=eBit:Bytes1024) --a,b-=eBit:Bytes1024;
	}
	return 1;																													
}	

#define addBytes64Ex(%1,%2) extractBytes2(BT:<%1>,#%2)																												                                                                                                                       
stock extractBytes2(&eBit:a,&eBit:b,const value[],l=sizeof value,val=0) {                                                                                                                       
	if(value[0] != '-') {     
	    if((l=strmid(bStr, value, 0, 20)) > 9) {                                                                                                                       
			b = b + eBit:strval(bStr[(l = l - 9)]), bStr[l] = '\0';														
			a = a + eBit:strval(bStr);	
			return 1;																			
		}																													
		b = b + eBit:strval(bStr);		                                                                                                                 
	} else {                                                                                                                       
		if((l=strmid(bStr, value, 1, 21)) > 10) {                                                                                                                       
			val = strval(bStr[(l = l - 9)]), bStr[l] = '\0';
			a = a + eBit:strval(bStr);                                                                                                                                                                                                                                                    
			whereBytes(a, b, _:a>-1?-val:val);   
			return 1;                                                                                     
		}                                                                                                                        
		whereBytes(a, b, _:a>-1?strval(bStr):-val);  																		
	}	
	return 1;																													
}	
*/