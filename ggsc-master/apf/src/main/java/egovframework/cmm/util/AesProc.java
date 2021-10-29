package egovframework.cmm.util;

import egovframework.cmm.util.AES256Util;

public class AesProc {
	private static String key = "aes256-key-apf";
	static String rtn = "";

	public static String aesProc(String str) throws Exception{
		
		AES256Util aes256 = new AES256Util(key);
		
		String encText = aes256.aesEncode(str);
		String decText = aes256.aesDecode(encText);
		
		System.out.println("str ================= "+str);
		System.out.println("encText ================= "+encText);
		System.out.println("decText ================= "+decText);
		
		return rtn;
		
	}
}

