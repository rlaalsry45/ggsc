package egovframework.homepage.join.service;

public interface HomepageJoinService {
	
	// 회원가입 등록
	void insertJoinReg(JoinVO vo);
	
	// 아이디 중복확인
	int getIdCheck(String userId);
	
}