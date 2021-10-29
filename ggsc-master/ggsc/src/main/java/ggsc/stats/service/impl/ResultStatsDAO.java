package ggsc.stats.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.stats.service.ResultReportVO;
import ggsc.support.service.ExcelVO;

@Repository("ResultStatsDAO")
public class ResultStatsDAO extends EgovAbstractDAO {

	// 실적 보고서
	@SuppressWarnings("unchecked")
	public List<EgovMap> getResultReportList(ResultReportVO vo) {
		return (List<EgovMap>) list("resultStatsDAO.getResultReportList", vo);
	}

	// main 화면 값
	@SuppressWarnings("unchecked")
	public List<EgovMap> getMianCnsResult(ResultReportVO vo) {
		return (List<EgovMap>) list("resultStatsDAO.getMianCnsResult", vo);
	}
	
	// 실적 보고서(센터별)
	@SuppressWarnings("unchecked")
	public List<EgovMap> getResultReportCenterList(ResultReportVO vo) {
		return (List<EgovMap>) list("resultStatsDAO.getResultReportCenterList", vo);
	}
	
	// 상담사 실적
	@SuppressWarnings("unchecked")
	public List<EgovMap> getCounselorResultList(ResultReportVO vo) {
		return (List<EgovMap>) list("resultStatsDAO.getCounselorResultList", vo);
	}

	// 교육 실적
	@SuppressWarnings("unchecked")
	public List<EgovMap> getEducationResultList(ResultReportVO vo) {
		return (List<EgovMap>) list("resultStatsDAO.getEducationResultList", vo);
	}

	// 홍보실적
	@SuppressWarnings("unchecked")
	public List<EgovMap> getPromotionResultList(ResultReportVO vo) {
		return (List<EgovMap>) list("resultStatsDAO.getPromotionResultList", vo);
	}

	// 학력별상담현황
	@SuppressWarnings("unchecked")
	public List<EgovMap> getAcadmbCnsStateList(ResultReportVO vo) {
		return (List<EgovMap>) list("resultStatsDAO.getAcadmbCnsStateList", vo);
	}

	// 연령별상담현황
	@SuppressWarnings("unchecked")
	public List<EgovMap> getAgeCnsStateList(ResultReportVO vo) {
		return (List<EgovMap>) list("resultStatsDAO.getAgeCnsStateList", vo);
	}

	// 연령별상담현황2
	@SuppressWarnings("unchecked")
	public List<EgovMap> getAgeCnsStateList2(ResultReportVO vo) {
		return (List<EgovMap>) list("resultStatsDAO.getAgeCnsStateList2", vo);
	}

	// 주호수별현황
	@SuppressWarnings("unchecked")
	public List<EgovMap> getMainApplPbCnsStateList(ResultReportVO vo) {
		return (List<EgovMap>) list("resultStatsDAO.getMainApplPbCnsStateList", vo);
	}

	// 개인상담현황
	@SuppressWarnings("unchecked")
	public List<EgovMap> getPersonalCnsStateList(ResultReportVO vo) {
		return (List<EgovMap>) list("resultStatsDAO.getPersonalCnsStateList", vo);
	}

	// 집단상담현황
	@SuppressWarnings("unchecked")
	public List<EgovMap> getGroupCnsStateList(ResultReportVO vo) {
		return (List<EgovMap>) list("resultStatsDAO.getGroupCnsStateList", vo);
	}

	// 일/월/년별현황
	@SuppressWarnings("unchecked")
	public List<EgovMap> getDmyStateList(ResultReportVO vo) {
		return (List<EgovMap>) list("resultStatsDAO.getDmyStateList", vo);
	}

	// 센터별현황
	@SuppressWarnings("unchecked")
	public List<EgovMap> getCenterStateList(ResultReportVO vo) {
		return (List<EgovMap>) list("resultStatsDAO.getCenterStateList", vo);
	}

	// 심리검사현황
	@SuppressWarnings("unchecked")
	public List<EgovMap> getPsyCnsStateList(ResultReportVO vo) {
		return (List<EgovMap>) list("resultStatsDAO.getPsyCnsStateList", vo);
	}

	//////////////////////////////////////////////////// 엑셀 다운로드 시작
	//////////////////////////////////////////////////// /////////////////////////////////////////////////////////////
	
	// 실적 보고서(총 갯수)
	@SuppressWarnings("unchecked")
	public List<EgovMap> getTotalResultReportListExcel(ExcelVO vo) {
		return (List<EgovMap>) list("resultStatsDAO.getTotalResultReportListExcel", vo);
	}
	
	// 실적 보고서
	@SuppressWarnings("unchecked")
	public List<EgovMap> getResultReportListExcel(ExcelVO vo) {
		return (List<EgovMap>) list("resultStatsDAO.getResultReportListExcel", vo);
	}
	
	// 상담사 실적
	@SuppressWarnings("unchecked")
	public List<EgovMap> getCounselorResultListExcel(ExcelVO vo) {
		return (List<EgovMap>) list("resultStatsDAO.getCounselorResultListExcel", vo);
	}

	// 교육 실적
	@SuppressWarnings("unchecked")
	public List<EgovMap> getEducationResultListExcel(ExcelVO vo) {
		return (List<EgovMap>) list("resultStatsDAO.getEducationResultListExcel", vo);
	}

	// 홍보실적
	@SuppressWarnings("unchecked")
	public List<EgovMap> getPromotionResultListExcel(ExcelVO vo) {
		return (List<EgovMap>) list("resultStatsDAO.getPromotionResultListExcel", vo);
	}

	// 학력별상담현황
	@SuppressWarnings("unchecked")
	public List<EgovMap> getAcadmbCnsStateListExcel(ExcelVO vo) {
		return (List<EgovMap>) list("resultStatsDAO.getAcadmbCnsStateListExcel", vo);
	}

	// 연령별상담현황
	@SuppressWarnings("unchecked")
	public List<EgovMap> getAgeCnsStateListExcel(ExcelVO vo) {
		return (List<EgovMap>) list("resultStatsDAO.getAgeCnsStateListExcel", vo);
	}

	// 주호수별현황
	@SuppressWarnings("unchecked")
	public List<EgovMap> getMainApplPbCnsStateListExcel(ExcelVO vo) {
		return (List<EgovMap>) list("resultStatsDAO.getMainApplPbCnsStateListExcel", vo);
	}

	// 개인상담현황
	@SuppressWarnings("unchecked")
	public List<EgovMap> getPersonalCnsStateListExcel(ExcelVO vo) {
		return (List<EgovMap>) list("resultStatsDAO.getPersonalCnsStateListExcel", vo);
	}

	// 집단상담현황
	@SuppressWarnings("unchecked")
	public List<EgovMap> getGroupCnsStateListExcel(ExcelVO vo) {
		return (List<EgovMap>) list("resultStatsDAO.getGroupCnsStateListExcel", vo);
	}

	// 일/월/년별현황
	@SuppressWarnings("unchecked")
	public List<EgovMap> getDmyStateListExcel(ExcelVO vo) {
		return (List<EgovMap>) list("resultStatsDAO.getDmyStateListExcel", vo);
	}

	// 센터별현황
	@SuppressWarnings("unchecked")
	public List<EgovMap> getCenterStateListExcel(ExcelVO vo) {
		return (List<EgovMap>) list("resultStatsDAO.getCenterStateListExcel", vo);
	}

	// 심리검사현황
	@SuppressWarnings("unchecked")
	public List<EgovMap> getPsyCnsStateListExcel(ExcelVO vo) {
		return (List<EgovMap>) list("resultStatsDAO.getPsyCnsStateListExcel", vo);
	}
	////////////////////////////////////////// 엑셀 다운로드 끝
	////////////////////////////////////////// //////////////////////////////////////////////////////////////////
	// 배치 통계 DB 입력
	public void insertTotalResultReportList() {
		System.out.println("Dao call");
		insert("resultStatsDAO.insertTotalResultReportList");
		
	}
	
}
