package egovframework.cmm.util;


import org.jasypt.contrib.org.apache.commons.codec_1_3.binary.Base64;
import org.springframework.stereotype.Component;

import egovframework.rte.fdl.cryptography.EgovPasswordEncoder;
import egovframework.rte.fdl.cryptography.impl.EgovARIACryptoServiceImpl;




public class CommonUtils {
	
	
	//복호화
	public byte[] decrypted(String value, String key) {
		
		EgovPasswordEncoder egovPasswordEncoder = new EgovPasswordEncoder();
		EgovARIACryptoServiceImpl egovARIACryptoServiceImpl = new EgovARIACryptoServiceImpl();
		
		String hasedPassword = egovPasswordEncoder.encryptPassword(key);
		egovPasswordEncoder.setHashedPassword(hasedPassword);
		egovPasswordEncoder.setAlgorithm("SHA-256");
		egovARIACryptoServiceImpl.setPasswordEncoder(egovPasswordEncoder);
		egovARIACryptoServiceImpl.setBlockSize(1025);
		
		byte[] decrypted = egovARIACryptoServiceImpl.decrypt(Base64.decodeBase64(value.getBytes()), key);
		return decrypted;
	}
	
	//암호화
	
	public byte[] encrypted(String value, String key) {
		EgovPasswordEncoder egovPasswordEncoder = new EgovPasswordEncoder();
		EgovARIACryptoServiceImpl egovARIACryptoServiceImpl = new EgovARIACryptoServiceImpl();
		
		String hasedPassword = egovPasswordEncoder.encryptPassword(key);
		egovPasswordEncoder.setHashedPassword(hasedPassword);
		egovPasswordEncoder.setAlgorithm("SHA-256");
		egovARIACryptoServiceImpl.setPasswordEncoder(egovPasswordEncoder);
		egovARIACryptoServiceImpl.setBlockSize(1025);
		
		byte[] encrypted = egovARIACryptoServiceImpl.encrypt(value.getBytes(), key);
		return encrypted;
	}
}