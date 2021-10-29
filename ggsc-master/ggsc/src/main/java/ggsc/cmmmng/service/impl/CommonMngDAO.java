package ggsc.cmmmng.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.cmmmng.service.AuthMngVO;
import ggsc.cmmmng.service.AuthorityMngVO;
import ggsc.cmmmng.service.MemberMngVO;

@Repository("commonMngDao")
public class CommonMngDAO extends EgovAbstractDAO  {

	// 회원관리 목록
	@SuppressWarnings("unckecked")
	public List<EgovMap> getMemberMngList(MemberMngVO vo){
		return (List<EgovMap>)list("commonMngDao.getMemberMngList", vo);
	}
	
	// 회원관리 갯수
	public int getMemberMngListTotCnt(MemberMngVO vo){
		return (Integer)select("commonMngDao.getMemberMngListTotCnt", vo);
	}
	
	// 회원관리 상세
	public EgovMap getMemberMngDtl(String userId){
		return (EgovMap)select("commonMngDao.getMemberMngDtl", userId);
	}
	
	// 회원관리 수정(user table)
	public void updateMemberMng(MemberMngVO vo){
		update("commonMngDao.updateMemberMng", vo);
	}
	
	// 회원관리 수정(cnsr table)
	public void updateMemberMng2(MemberMngVO vo){
		update("commonMngDao.updateMemberMng2", vo);
	}
	
	// 권한관리 목록
	@SuppressWarnings("unckecked")
	public List<EgovMap> getAuthMngList(AuthMngVO vo){
		return (List<EgovMap>)list("commonMngDao.getAuthMngList", vo);
	}
	
	// 권한관리 갯수
	public int getAuthMngListTotCnt(AuthMngVO vo){
		return (Integer)select("commonMngDao.getAuthMngListTotCnt", vo);
	}
	
	// 권한관리 상세
	public EgovMap getAuthMngDtl(int authNo){
		return (EgovMap)select("commonMngDao.getAuthMngDtl", authNo);
	}
	
	// 권한관리 코드중복체크
	public int authMngCodeCheck(String authCd){
		return (Integer)select("commonMngDao.authMngCodeCheck", authCd);
	}
	
	// 권한관리 등록
	public void insertAuthMng(AuthMngVO vo){
		insert("commonMngDao.insertAuthMng", vo);
	}
	
	// 권한관리 수정
	public void updateAuthMng(AuthMngVO vo){
		update("commonMngDao.updateAuthMng", vo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	// 권한관리 목록
	@SuppressWarnings("unckecked")
	public List<EgovMap> getAuthorityMngList(AuthorityMngVO vo) {
		return (List<EgovMap>)list("commonMngDao.getAuthorityMngList", vo);
	}
	// 권한관리 목록 갯수
	public int getAuthorityMngListTotCnt(AuthorityMngVO vo) {
		return (Integer)select("commonMngDao.getAuthorityMngListTotCnt", vo);
	}
	// 권한관리 상세보기
	public EgovMap getAuthorityMngDtl(int num) {
		return (EgovMap)select("commonMngDao.getAuthorityMngDtl", num);
	} 
	// 권한관리 중복확인
	public int authMngCheck(String authNm) {
		return (Integer)select("commonMngDao.authMngCheck", authNm);
	}
	// 권한관리 등록
	public void insertAuthMngReg(AuthorityMngVO vo) {
		insert("commonMngDao.insertAuthMngReg", vo);
	}
	// 권한관리 수정
	public void updateAuthMngReg(AuthorityMngVO vo) {
		insert("commonMngDao.updateAuthMngReg", vo);
	}
	// 회원 비밀번호 초기화
	public void memberPwClear(MemberMngVO vo) {
		update("commonMngDao.memberPwClear", vo);
	}
}
