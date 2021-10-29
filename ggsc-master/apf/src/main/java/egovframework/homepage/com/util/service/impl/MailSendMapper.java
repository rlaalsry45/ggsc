package egovframework.homepage.com.util.service.impl;

import egovframework.homepage.com.util.service.MailSendVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("mailSendMapper")
public interface MailSendMapper {

	void insertMailSend(MailSendVO vo);
	// 회원 임시비밀번호로 변경
	void updateUserPassword(MailSendVO vo);
	
}
