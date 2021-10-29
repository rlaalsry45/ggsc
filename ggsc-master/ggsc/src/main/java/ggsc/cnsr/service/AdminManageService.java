package ggsc.cnsr.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.join.service.CnsrVO;
import ggsc.join.service.UsermVO;
import ggsc.support.service.ExcelVO;

public interface AdminManageService {

	// 상담사 등록
	public void insertCnsrMng(AdminVO param);
	// 상담사관리 목록 조회
	public List<EgovMap> getAdminManageList(AdminVO param);
	// 상담사관리 목록 갯수
	public int getAdminMngTotalCnt(AdminVO param);
	// 상담사 상세보기
	public EgovMap getAdminManageDetail(String userId);
	// 상담사 회원탈퇴
	public void updateAdminCnsrWithdrawal(String userId);
	// 상담사 회원탈퇴 취소
	public void updateAdminCnsrReturn(String userId);
	// 상담사 정보 수정(상담사 테이블)
	public void updateCnsrMng(CnsrVO cnsrVO);
	// 상담사 정보 수정(사용자 테이블)
	public void updateUserM(UsermVO usermVO);
	// 상담사 승인,승인취소(상담사 테이블)
	public void updateCnsrApprv(CnsrVO cnsrVO);
	// 상담사 승인,승인취소(사용자 테이블)
	public void updateUserApprv(UsermVO usermVO);
	// 상담사 삭제(상담사 테이블)
	public void deleteCnsrMng(CnsrVO cnsrVO);
	// 상담사 삭제(사용자 테이블)
	public void deleteUserM(UsermVO usermVO);
	// 보안서약서 삭제
	public void deleteSecurity(SecurityVO securityVO);
	// 상담사 CnsrCd 조회
	public String getCnsrMngCnsrCd();
	// 상담사 엑셀다운
	public List<EgovMap> getCnsrListExcel(ExcelVO vo);
	// 센터관리 목록 조회(select 코드용)
	public List<EgovMap> getCenterManageList(CenterVO param);
	// 센터관리 목록 조회(화면 목록)
	public List<EgovMap> getCenterMngList(CenterVO param);
	// 센터관리 센터명 중복확인
	public int centerCheck(String centerNm);
	// 센터관리 목록 갯수
	public int getCenterMngTotalCnt(CenterVO param);
	// 센터관리 상세보기
	public EgovMap getCenterManageDetail(int num);
	// 센터관리 - 권역구분 검색 리스트 getZoneGbList
	public List<EgovMap> getZoneGbList(CenterVO param);
	// 센터정보 등록
	public void insertCenterMng(CenterVO param);
	// 센터정보 수정
	public void updateCenterMng(CenterVO param);
	// 센터관리 엑셀다운
	public List<EgovMap> getCenterListExcel(ExcelVO vo);
	// 분류관리 목록 조회
	public List<EgovMap> getGroupManageList(GroupVO param);
	// 분류관리 목록 갯수
	public int getGroupMngTotalCnt(GroupVO param);
	// 분류관리 등록 무결성 검사
	public int getGroupMngInsertTest(GroupVO param);
	// 분류관리 상세보기(대분류)
	public List<EgovMap> getGroupMngDtlHList(GroupVO param);
	// 분류관리 상세보기(중분류)
	public List<EgovMap> getGroupMngDtlMList(GroupVO param);
	// 분류관리 상세보기(소분류)
	public List<EgovMap> getGroupMngDtlSList(GroupVO param);
	// 분류관리 대분류 등록
	public void insertGroupMngHcd(GroupVO param);
	// 분류관리 중분류 등록
	public void insertGroupMngMcd(GroupVO param);
	// 분류관리 소분류 등록
	public void insertGroupMngScd(GroupVO param);
	// 분류관리 엑셀다운
	public List<EgovMap> getGroupingListExcel(ExcelVO vo);
	// 관리자 정보
	public EgovMap getAdminUserInfo(AdminVO vo);
	// 보안서약서 정보
	public EgovMap getSecurityInfo(SecurityVO vo);
	// 보안서약서 등록
	public void insertSecurity(SecurityVO vo);
	// 보안서약서 수정
	public void updateSecurity(SecurityVO vo);
}
