package ggsc.cmmmng.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.cmmmng.service.AuthMngVO;
import ggsc.cmmmng.service.AuthorityMngVO;
import ggsc.cmmmng.service.CommonMngService;
import ggsc.cmmmng.service.MemberMngVO;

@Service("commonMngService")
public class CommonMngServiceImpl extends EgovAbstractServiceImpl implements CommonMngService {
	
	@Resource(name="commonMngDao")
    private CommonMngDAO commonMngDao;
	
	// 회원관리 목록
	@Override
	public List<EgovMap> getMemberMngList(MemberMngVO vo) {

		return commonMngDao.getMemberMngList(vo);
	}
	
	// 회원관리 갯수
	@Override
	public int getMemberMngListTotCnt(MemberMngVO vo) {

		return commonMngDao.getMemberMngListTotCnt(vo);
	}
	
	// 회원관리 상세
	@Override
	public EgovMap getMemberMngDtl(String userId) {
		return commonMngDao.getMemberMngDtl(userId);
	}
	
	// 회원관리 수정
	@Override
	public void updateMemberMng(MemberMngVO vo) {
		commonMngDao.updateMemberMng(vo); // user table 수정
		commonMngDao.updateMemberMng2(vo); // cnsr table 수정
	}
	
	// 권한관리 목록
	@Override
	public List<EgovMap> getAuthMngList(AuthMngVO vo) {

		return commonMngDao.getAuthMngList(vo);
	}
	
	// 권한관리 갯수
	@Override
	public int getAuthMngListTotCnt(AuthMngVO vo) {

		return commonMngDao.getAuthMngListTotCnt(vo);
	}
	
	// 권한관리 상세
	@Override
	public EgovMap getAuthMngDtl(int authNo) {
		return commonMngDao.getAuthMngDtl(authNo);
	}
	
	// 권한관리 코드중복체크
	@Override
	public int authMngCodeCheck(String authCd) {
		return commonMngDao.authMngCodeCheck(authCd);
	}
	
	// 권한관리 등록
	@Override
	public void insertAuthMng(AuthMngVO vo) {
		commonMngDao.insertAuthMng(vo);
	}
	
	// 권한관리 수정
	@Override
	public void updateAuthMng(AuthMngVO vo) {
		commonMngDao.updateAuthMng(vo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	 
	// 권한관리 목록
	@Override
	public List<EgovMap> getAuthorityMngList(AuthorityMngVO vo) {
		return commonMngDao.getAuthorityMngList(vo);
	}
	// 권한관리 목록 갯수
	@Override
	public int getAuthorityMngListTotCnt(AuthorityMngVO vo) {
		return commonMngDao.getAuthorityMngListTotCnt(vo);
	}
	// 권한관리 상세보기
	public EgovMap getAuthorityMngDtl(int num) {
		return commonMngDao.getAuthorityMngDtl(num);
	}
	// 권한관리 중복확인
	public int authMngCheck(String authNm) {
		return commonMngDao.authMngCheck(authNm);
	}
	
	// 권한관리 등록
	public void insertAuthMngReg(AuthorityMngVO vo) {
		commonMngDao.insertAuthMngReg(vo);
	}
	// 권한관리 수정
	public void updateAuthMngReg(AuthorityMngVO vo) {
		commonMngDao.updateAuthMngReg(vo);
	}
	
	// 회원 비밀번호 초기화
	public void memberPwClear(MemberMngVO vo) {
		commonMngDao.memberPwClear(vo);
	}
}
