package ggsc.com.util.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.com.util.service.ComCodeVO;

@Repository("comCodeDAO")
public class ComCodeDAO extends EgovAbstractDAO {

	public List<?> selectComCodeList(ComCodeVO vo) {
		return (List<?>) list("comCodeDAO.selectComCodeList", vo);
	}

	public EgovMap getComCode(ComCodeVO vo) {
		return (EgovMap) select("comCodeDAO.getComCode", vo);
	}

	public String selectCurrentDay(ComCodeVO vo) {
		return (String) select("comCodeDAO.selectCurrentDay", vo);
	}

	public String selectCurrentDate(ComCodeVO vo) {
		return (String) select("comCodeDAO.selectCurrentDate", vo);
	}

	public List<?> selectAuthList(ComCodeVO vo) {
		return (List<?>) list("comCodeDAO.selectAuthList", vo);
	}

	public List<?> selectCustList(ComCodeVO vo) {
		return (List<?>) list("comCodeDAO.selectCustList", vo);
	}

	public List<?> selectPosiList(ComCodeVO vo) {
		return (List<?>) list("comCodeDAO.selectPosiList", vo);
	}

	public List<?> selectUserList(ComCodeVO vo) {
		return (List<?>) list("comCodeDAO.selectUserList", vo);
	}

	public List<?> selectDeptList(ComCodeVO vo) {
		return (List<?>) list("comCodeDAO.selectDeptList", vo);
	}

	public List<?> selectDeptUpList(ComCodeVO vo) {
		return (List<?>) list("comCodeDAO.selectDeptUpList", vo);
	}

	public List<?> selectJicwiList() {
		return (List<?>) list("comCodeDAO.selectJicwiList");
	}

	public Object selectPopupDeptList() {
		return (List<?>) list("comCodeDAO.selectPopupDeptList");
	}

	public List<?> selectComGrpList() {
		return (List<?>) list("comCodeDAO.selectComGrpList");
	}

	public EgovMap getWeekCntInfo(EgovMap paramMap) {
		return (EgovMap) select("comCodeDAO.getWeekCntInfo", paramMap);
	}

	// 지역구분 정보 가져오는 함수
	public List<?> selectAreaList() {
		return (List<?>) list("comCodeDAO.selectAreaList");
	}

	// 센터구분 정보 가져오는 함수
	public List<?> selectCenterGbList() {
		return (List<?>) list("comCodeDAO.selectCenterGbList");
	}

	// 권역구분 정보 가져오는 함수
	public List<?> selectZoneGbList() {
		return (List<?>) list("comCodeDAO.selectZoneGbList");
	}

	// 상담구분 정보 가져오는 함수
	public List<?> selectCnsGbList() {
		return (List<?>) list("comCodeDAO.selectCnsGbList");
	}

}
