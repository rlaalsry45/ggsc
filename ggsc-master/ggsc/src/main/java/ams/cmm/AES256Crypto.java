package ams.cmm;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Arrays;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

import utility.func;

public class AES256Crypto {
	private static volatile AES256Crypto INSTANCE;

	static String secretKey   = null;
	static String IV                = ""; //16bit

	public static AES256Crypto getInstance(){
		if(INSTANCE==null){
			synchronized(AES256Crypto.class){
				if(INSTANCE==null)
					INSTANCE=new AES256Crypto();
			}
	     }
	     return INSTANCE;
	 }

	 private AES256Crypto(){
		 
		if (secretKey == null) {

			int i = 0;
			File file = new File(func.secureKeyPath);
			FileReader fr;
			try {
				fr = new FileReader(file);
				while ((i = fr.read()) != -1) {
					secretKey += ((char) i);
				}
				fr.close();
				IV = secretKey.substring(0, 16);
			} catch (FileNotFoundException err) {
				func.Logging(this.getClass().getName(), "SECURE KEY FILE NOT FOUND");
			} catch (IOException e) {
				func.Logging(this.getClass().getName(), "SECURE KEY FILE READ ERROR");
			} catch (NullPointerException e) {
				func.Logging(this.getClass().getName(), "SECURE KEY IS NULL");
			}
		} else {
			IV = secretKey.substring(0, 16);
		}
	 }

	 //암호화 
	 public String AESEncode(String str) throws java.io.UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException{
	     byte[] keyData = secretKey.getBytes(StandardCharsets.UTF_8);
		 SecretKey secureKey = new SecretKeySpec(keyData, "AES");
		 
		 SecureRandom secureRandom = new SecureRandom();
		 byte[] result = new byte[16];
		 secureRandom.nextBytes(result);
		 

		 Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
		 c.init(Cipher.ENCRYPT_MODE, secureKey, new IvParameterSpec(result));
		 
		 byte[] encrypted = c.doFinal(str.getBytes("UTF-8"));
		 
		 byte[] ivcipherByte = new byte[16 + encrypted.length];
		 System.arraycopy(result, 0, ivcipherByte, 0, 16);
		 System.arraycopy(encrypted, 0, ivcipherByte, 16, encrypted.length);
		 
		 String enStr = new String(Base64.encodeBase64(ivcipherByte));
		 return enStr;
	 }

	 //복호화
	 public String AESDecode(String str) throws java.io.UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException{
		 try {
		 byte[] keyData = secretKey.getBytes();
		 
		 byte[] encStr = Base64.decodeBase64(str);
		 
		 byte[] originalIvByte = Arrays.copyOfRange(encStr, 0, 16);
		 byte[] originalCipherByte = Arrays.copyOfRange(encStr, 16, encStr.length);
		 
		 
		 SecretKey secureKey = new SecretKeySpec(keyData, "AES");
		 Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
		 c.init(Cipher.DECRYPT_MODE, secureKey, new IvParameterSpec(originalIvByte));
		 
		 return new String(c.doFinal(originalCipherByte),"UTF-8");
		 
		 
		 }catch(NullPointerException err) {
			 func.Logging(this.getClass().getName(), "DECODE_ERROR : SECURE KEY IS NULL");
			 return str;
		 }
	 }
}
