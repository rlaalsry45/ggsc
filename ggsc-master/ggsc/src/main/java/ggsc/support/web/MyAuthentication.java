package ggsc.support.web;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

import egovframework.com.cmm.service.EgovProperties;

public class MyAuthentication extends Authenticator {
	 
    PasswordAuthentication pa;
   

    public MyAuthentication(){
    	
    	String id = EgovProperties.getProperty("Mail.ID"); // 구글 ID
    	String pw = EgovProperties.getProperty("Mail.PW");			// 구글 비밀번호

        // ID와 비밀번호를 입력한다.
    	pa = new PasswordAuthentication(id, pw);
     
    }

    // 시스템에서 사용하는 인증정보
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
}
