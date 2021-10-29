package egovframework.homepage.main.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomepageMainService {

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
