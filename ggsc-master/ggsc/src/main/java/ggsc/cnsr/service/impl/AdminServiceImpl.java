package ggsc.cnsr.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.cnsr.service.AdminManageService;
import ggsc.cnsr.service.AdminVO;
import ggsc.cnsr.service.CenterVO;
import ggsc.cnsr.service.GroupVO;
import ggsc.cnsr.service.SecurityVO;
import ggsc.join.service.CnsrVO;
import ggsc.join.service.UsermVO;
import ggsc.support.service.ExcelVO;

@Service("AdminManageService")
public class AdminServiceImpl extends EgovAbstractServiceImpl implements AdminManageService{

	@Resource(name="AdminManageDAO")
    private AdminManageDAO AdminManageDAO;
	
	public void insertCnsrMng(AdminVO param) {
		AdminManageDAO.insertCnsrMng(param);
	}
	public List<EgovMap> getAdminManageList(AdminVO param) {
		return AdminManageDAO.getAdminManageList(param);
	}
	public int getAdminMngTotalCnt(AdminVO param) {
		return AdminManageDAO.getAdminMngTotalCnt(param);
	}
	public EgovMap getAdminManageDetail(String userId) {
		return AdminManageDAO.getAdminManageDetail(userId);
	}
	// 상담사 회원탈퇴
	public void updateAdminCnsrWithdrawal(String userId) {
		// 상담사 table 탈퇴 쿼리
		AdminManageDAO.updateAdminCnsrWithdrawal(userId);
		// 유저 table 탈퇴 쿼리
		AdminManageDAO.updateAdminUserWithdrawal(userId);
	}
	// 상담사 회원탈퇴 취소
	public void updateAdminCnsrReturn(String userId) {
		// 상담사 table 탈퇴취소 쿼리
		AdminManageDAO.updateAdminCnsrReturn(userId);
		// 유저 table 탈퇴취소 쿼리
		AdminManageDAO.updateAdminUserReturn(userId);
	}
	public void updateCnsrMng(CnsrVO param) {
		AdminManageDAO.updateCnsrMng(param);
	}
	public void updateUserM(UsermVO param) {
		AdminManageDAO.updateUserM(param);
	}
	public void updateCnsrApprv(CnsrVO param) {
		AdminManageDAO.updateCnsrApprv(param);
	}
	public void updateUserApprv(UsermVO param) {
		AdminManageDAO.updateUserApprv(param);
	}
	public void deleteCnsrMng(CnsrVO param) {
		AdminManageDAO.deleteCnsrMng(param);
	}
	public void deleteUserM(UsermVO param) {
		AdminManageDAO.deleteUserM(param);
	}
	public void deleteSecurity(SecurityVO param) {
		AdminManageDAO.deleteSecurity(param);
	}
	public String getCnsrMngCnsrCd() {
		return AdminManageDAO.getCnsrMngCnsrCd();
	}
	public List<EgovMap> getCnsrListExcel(ExcelVO vo) {
		return AdminManageDAO.getCnsrListExcel(vo);
	}
 	public List<EgovMap> getCenterManageList(CenterVO param) {
		return AdminManageDAO.getCenterManageList(param);
	}
 	public List<EgovMap> getCenterMngList(CenterVO param) {
 		return AdminManageDAO.getCenterMngList(param);
 	}
	public int centerCheck(String centerNm) {
		return AdminManageDAO.centerCheck(centerNm);
	}
	public int getCenterMngTotalCnt(CenterVO param) {
		return AdminManageDAO.getCenterMngTotalCnt(param);
	}
	public EgovMap getCenterManageDetail(int num) {
		return AdminManageDAO.getCenterManageDetail(num);
	}
	public List<EgovMap> getZoneGbList(CenterVO param) {
		return AdminManageDAO.getZoneGbList(param);
	}
	public void insertCenterMng(CenterVO param) {
		AdminManageDAO.insertCenterMng(param);
	}
	public void updateCenterMng(CenterVO param) {
		AdminManageDAO.updateCenterMng(param);
	}
	public List<EgovMap> getCenterListExcel(ExcelVO vo) {
		return AdminManageDAO.getCenterListExcel(vo);
	}
	public List<EgovMap> getGroupManageList(GroupVO param) {
		return AdminManageDAO.getGroupManageList(param);
	}
	public int getGroupMngTotalCnt(GroupVO param) {
		return AdminManageDAO.getGroupMngTotalCnt(param);
	}
	public int getGroupMngInsertTest(GroupVO param) {
		return AdminManageDAO.getGroupMngInsertTest(param);
	}
	public List<EgovMap> getGroupMngDtlHList(GroupVO param) {
		return AdminManageDAO.getGroupMngDtlHList(param);
	}
	public List<EgovMap> getGroupMngDtlMList(GroupVO param) {
		return AdminManageDAO.getGroupMngDtlMList(param);
	}
	public List<EgovMap> getGroupMngDtlSList(GroupVO param) {
		return AdminManageDAO.getGroupMngDtlSList(param);
	}
	public void insertGroupMngHcd(GroupVO param) {
		AdminManageDAO.insertGroupMngHcd(param);
	}
	public void insertGroupMngMcd(GroupVO param) {
		AdminManageDAO.insertGroupMngMcd(param);
	}
	public void insertGroupMngScd(GroupVO param) {
		AdminManageDAO.insertGroupMngScd(param);
	}
	public List<EgovMap> getGroupingListExcel(ExcelVO vo) {
		return AdminManageDAO.getGroupingListExcel(vo);
	}
	// 관리자 정보
	public EgovMap getAdminUserInfo(AdminVO vo) {
		return AdminManageDAO.getAdminUserInfo(vo);
	}
	// 보안서약서 정보
	public EgovMap getSecurityInfo(SecurityVO vo) {
		return AdminManageDAO.getSecurityInfo(vo);
	}
	// 보안서약서 등록
	public void insertSecurity(SecurityVO vo) {
		int year = Integer.parseInt(vo.getYear());
		vo.setYear2(year+1);
		AdminManageDAO.insertSecurity(vo);
	}
	
	// 보안서약서 수정
	public void updateSecurity(SecurityVO vo) {
		int year = Integer.parseInt(vo.getYear());
		vo.setYear2(year+1);
		AdminManageDAO.updateSecurity(vo);
	}
}

