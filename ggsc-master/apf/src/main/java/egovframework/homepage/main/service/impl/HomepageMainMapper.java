package egovframework.homepage.main.service.impl;

import java.util.List;

import egovframework.homepage.main.service.CenterVO;
import egovframework.homepage.main.service.CommonVO;
import egovframework.homepage.main.service.LoginVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("homepageMainMapper")
public interface HomepageMainMapper {
	
	// 로그인 정보
	EgovMap actionLogin(LoginVO vo) throws Exception;

	// 회원 ID 찾기
	EgovMap findUserId(LoginVO vo) throws Exception;
	
	// 회원 PW 찾기
	int findPw(LoginVO vo) throws Exception;
	
	// PW 재설정
	void userPwReset(LoginVO vo);
	
	// 공통값 목록
	List<EgovMap> getGroupMngDtlMList(CommonVO param);
			
	// 센터 목록
	List<EgovMap> getCenterManageList(CenterVO centerVO);
	
}
