package egovframework.homepage.join.service.impl;

import egovframework.homepage.join.service.JoinVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("homepageJoinMapper")
public interface HomepageJoinMapper {
	
	// 회원가입 등록
	void insertJoinReg(JoinVO vo);
	
	// 아이디 중복확인
	int getIdCheck(String userId);
}
