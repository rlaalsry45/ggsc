package ggsc.cmmmng.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface CommonMngService {
	
	// 회원관리 목록
	List<EgovMap> getMemberMngList(MemberMngVO vo);
	
	// 회원관리 갯수
	int getMemberMngListTotCnt(MemberMngVO vo);
	
	// 회원관리 상세
	EgovMap getMemberMngDtl(String userId);
	
	// 회원관리 수정
	void updateMemberMng(MemberMngVO vo);
	
	// 권한관리 목록
	List<EgovMap> getAuthMngList(AuthMngVO vo);
	
	// 권한관리 갯수
	int getAuthMngListTotCnt(AuthMngVO vo);
	
	// 권한관리 상세
	EgovMap getAuthMngDtl(int authNo);
	
	// 권한관리 코드 중복체크
	int authMngCodeCheck(String authCd);
	
	// 권한관리 등록
	void insertAuthMng(AuthMngVO vo);
	
	// 권한관리 수정
	void updateAuthMng(AuthMngVO vo);
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 권한관리 목록
	List<EgovMap> getAuthorityMngList(AuthorityMngVO vo);
	// 권한관리 목록 갯수
	int getAuthorityMngListTotCnt(AuthorityMngVO vo);
	// 권한관리 상세보기
	EgovMap getAuthorityMngDtl(int num);
	// 권한관리 중복확인
	int authMngCheck(String authNm);
	// 권한관리 등록
	void insertAuthMngReg(AuthorityMngVO vo);
	// 권한관리 수정
	void updateAuthMngReg(AuthorityMngVO vo);
	// 회원 비밀번호 초기화
	void memberPwClear(MemberMngVO vo);
}
