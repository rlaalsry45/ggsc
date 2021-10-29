package ggsc.cnsr.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.cnsr.service.AdminVO;
import ggsc.cnsr.service.CenterVO;
import ggsc.cnsr.service.GroupVO;
import ggsc.cnsr.service.SecurityVO;
import ggsc.join.service.CnsrVO;
import ggsc.join.service.UsermVO;
import ggsc.support.service.ExcelVO;

@Repository("AdminManageDAO")
public class AdminManageDAO extends EgovAbstractDAO{
	
	public void insertCnsrMng(AdminVO param) {
		insert("AdminManageDAO.insertCnsrMng", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<EgovMap> getAdminManageList(AdminVO param) {
		return (List<EgovMap>)list("AdminManageDAO.getAdminManageList", param);
	}
	public int getAdminMngTotalCnt(AdminVO param) {
		return (Integer)select("AdminManageDAO.getAdminMngTotalCnt", param);
	}
	public EgovMap getAdminManageDetail(String userId) {
		return (EgovMap)select("AdminManageDAO.getAdminManageDetail", userId);
	}
	// 상담사 table 회원탈퇴
	public void updateAdminCnsrWithdrawal(String userId) {
		update("AdminManageDAO.updateAdminCnsrWithdrawal", userId);
	}
	// 상담사 table 회원탈퇴
	public void updateAdminUserWithdrawal(String userId) {
		update("AdminManageDAO.updateAdminUserWithdrawal", userId);
	}
	// 상담사 회원탈퇴 취소
	public void updateAdminCnsrReturn(String userId) {
		update("AdminManageDAO.updateAdminCnsrReturn", userId);
	}
	// 상담사 회원탈퇴 취소
	public void updateAdminUserReturn(String userId) {
		update("AdminManageDAO.updateAdminUserReturn", userId);
	}
	public void updateCnsrMng(CnsrVO param) {
		update("AdminManageDAO.updateCnsrMng", param);
	}
	public void updateUserM(UsermVO param) {
		update("AdminManageDAO.updateUserM", param);
	}
	public void updateCnsrApprv(CnsrVO param) {
		update("AdminManageDAO.updateCnsrApprv", param);
	}
	public void updateUserApprv(UsermVO param) {
		update("AdminManageDAO.updateUserApprv", param);
	}
	public void deleteCnsrMng(CnsrVO param) {
		update("AdminManageDAO.deleteCnsrMng", param);
	}
	public void deleteUserM(UsermVO param) {
		update("AdminManageDAO.deleteUserM", param);
	}
	public void deleteSecurity(SecurityVO param) {
		update("AdminManageDAO.deleteSecurity", param);
	}

	public String getCnsrMngCnsrCd() {
		return (String)select("AdminManageDAO.getCnsrMngCnsrCd");
	}
	@SuppressWarnings("unchecked")
	public List<EgovMap> getCnsrListExcel(ExcelVO vo) {
		return (List<EgovMap>)list("AdminManageDAO.getCnsrListExcel", vo);
	}
	@SuppressWarnings("unchecked")
	public List<EgovMap> getCenterManageList(CenterVO param) {
		return (List<EgovMap>)list("AdminManageDAO.getCenterManageList", param);
	}
	@SuppressWarnings("unchecked")
	public List<EgovMap> getCenterMngList(CenterVO param) {
		return (List<EgovMap>)list("AdminManageDAO.getCenterMngList", param);
	}
	public int centerCheck(String centerNm) {
		return (Integer)select("AdminManageDAO.centerCheck", centerNm);
	}
	public int getCenterMngTotalCnt(CenterVO param) {
		return (Integer)select("AdminManageDAO.getCenterMngTotalCnt", param);
	}
	public EgovMap getCenterManageDetail(int num) {
		return (EgovMap)select("AdminManageDAO.getCenterManageDetail", num);
	}
	@SuppressWarnings("unchecked")
	public List<EgovMap> getZoneGbList(CenterVO param) {
		return (List<EgovMap>)list("AdminManageDAO.getZoneGbList", param);
	}
	public void insertCenterMng(CenterVO param) {
		insert("AdminManageDAO.insertCenterMng", param);
	}
	public void updateCenterMng(CenterVO param) {
		update("AdminManageDAO.updateCenterMng", param);
	}
	@SuppressWarnings("unchecked")
	public List<EgovMap> getCenterListExcel(ExcelVO vo) {
		return (List<EgovMap>)list("AdminManageDAO.getCenterListExcel", vo);
	}
	@SuppressWarnings("unchecked")
	public List<EgovMap> getGroupManageList(GroupVO param) {
		return (List<EgovMap>)list("AdminManageDAO.getGroupManageList", param);
	}
	public int getGroupMngTotalCnt(GroupVO param) {
		return (Integer)select("AdminManageDAO.getGroupMngTotalCnt", param);
	}
	
	public int getGroupMngInsertTest(GroupVO param) {
		return (Integer)select("AdminManageDAO.getGroupMngInsertTest", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<EgovMap> getGroupMngDtlHList(GroupVO param) {
		return (List<EgovMap>)list("AdminManageDAO.getGroupMngDtlHList", param);
	}
	@SuppressWarnings("unchecked")
	public List<EgovMap> getGroupMngDtlMList(GroupVO param) {
		return (List<EgovMap>)list("AdminManageDAO.getGroupMngDtlMList", param);
	}
	@SuppressWarnings("unchecked")
	public List<EgovMap> getGroupMngDtlSList(GroupVO param) {
		return (List<EgovMap>)list("AdminManageDAO.getGroupMngDtlSList", param);
	}
	public void insertGroupMngHcd(GroupVO param) {
		insert("AdminManageDAO.insertGroupMngHcd", param);
	}
	public void insertGroupMngMcd(GroupVO param) {
		insert("AdminManageDAO.insertGroupMngMcd", param);
	}
	public void insertGroupMngScd(GroupVO param) {
		insert("AdminManageDAO.insertGroupMngScd", param);
	}
	@SuppressWarnings("unchecked")
	public List<EgovMap> getGroupingListExcel(ExcelVO vo) {
		return (List<EgovMap>)list("AdminManageDAO.getGroupingListExcel", vo);
	}
	// 관리자 정보
	public EgovMap getAdminUserInfo(AdminVO vo) {
		return (EgovMap)select("AdminManageDAO.getAdminUserInfo", vo);
	}
	// 보안서약서 정보
	public EgovMap getSecurityInfo(SecurityVO vo) {
		return (EgovMap)select("AdminManageDAO.getSecurityInfo", vo);
	}
	// 보안서약서 등록
	public void insertSecurity(SecurityVO vo) {
		insert("AdminManageDAO.insertSecurity", vo);
	}
	// 보안서약서 수정
	public void updateSecurity(SecurityVO vo) {
		insert("AdminManageDAO.updateSecurity", vo);
	}
}
