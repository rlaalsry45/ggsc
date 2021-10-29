package ggsc.stats.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.stats.service.ResultReportVO;
import ggsc.stats.service.ResultStatsService;
import ggsc.support.service.ExcelVO;

@Service("ResultStatsService")
public class ResultStatsServiceImpl extends EgovAbstractServiceImpl implements ResultStatsService {

	@Resource(name = "ResultStatsDAO")
	private ResultStatsDAO resultStatsDAO;

	// 실적 보고서
	@Override
	public List<EgovMap> getResultReportList(ResultReportVO vo) {
		return resultStatsDAO.getResultReportList(vo);
	}
	
	// main 화면 값
	@Override
	public List<EgovMap> getMianCnsResult(ResultReportVO vo) {
		return resultStatsDAO.getMianCnsResult(vo);
	}

	// 실적 보고서(센터별)
	@Override
	public List<EgovMap> getResultReportCenterList(ResultReportVO vo) {
		return resultStatsDAO.getResultReportCenterList(vo);
	}
	
	// 상담사 실적
	@Override
	public List<EgovMap> getCounselorResultList(ResultReportVO vo) {
		return resultStatsDAO.getCounselorResultList(vo);
	}

	// 교육 실적
	@Override
	public List<EgovMap> getEducationResultList(ResultReportVO vo) {
		return resultStatsDAO.getEducationResultList(vo);
	}

	// 홍보 실적
	@Override
	public List<EgovMap> getPromotionResultList(ResultReportVO vo) {
		return resultStatsDAO.getPromotionResultList(vo);
	}

	// 학력별 상담현황
	@Override
	public List<EgovMap> getAcadmbCnsStateList(ResultReportVO vo) {
		return resultStatsDAO.getAcadmbCnsStateList(vo);
	}

	// 연령별 상담현황
	@Override
	public List<EgovMap> getAgeCnsStateList(ResultReportVO vo) {
		return resultStatsDAO.getAgeCnsStateList(vo);
	}

	@Override
	public List<EgovMap> getAgeCnsStateList2(ResultReportVO vo) {
		return resultStatsDAO.getAgeCnsStateList2(vo);
	}

	// 주호소별현황
	@Override
	public List<EgovMap> getMainApplPbCnsStateList(ResultReportVO vo) {
		return resultStatsDAO.getMainApplPbCnsStateList(vo);
	}

	// 개인 상담현황
	@Override
	public List<EgovMap> getPersonalCnsStateList(ResultReportVO vo) {
		return resultStatsDAO.getPersonalCnsStateList(vo);
	}

	// 집단 상담현황
	@Override
	public List<EgovMap> getGroupCnsStateList(ResultReportVO vo) {
		return resultStatsDAO.getGroupCnsStateList(vo);
	}

	// 일/월/년별 현황
	@Override
	public List<EgovMap> getDmyStateList(ResultReportVO vo) {
		return resultStatsDAO.getDmyStateList(vo);
	}

	// 센터별 현황
	@Override
	public List<EgovMap> getCenterStateList(ResultReportVO vo) {
		return resultStatsDAO.getCenterStateList(vo);
	}

	// 심리검사 현황
	@Override
	public List<EgovMap> getPsyCnsStateList(ResultReportVO vo) {
		return resultStatsDAO.getPsyCnsStateList(vo);
	}

	///////////////////////////////////////// 엑셀 다운로드 시작 ////////////////////////////////////////////////////////////////////////

	// 실적 보고서(총 갯수)
	@Override
	public List<EgovMap> getTotalResultReportListExcel(ExcelVO vo) {
		return resultStatsDAO.getTotalResultReportListExcel(vo);
	}
	
	// 실적 보고서
	@Override
	public List<EgovMap> getResultReportListExcel(ExcelVO vo) {
		return resultStatsDAO.getResultReportListExcel(vo);
	}
	
	// 상담사 실적
	@Override
	public List<EgovMap> getCounselorResultListExcel(ExcelVO vo) {
		return resultStatsDAO.getCounselorResultListExcel(vo);
	}

	// 교육 실적
	@Override
	public List<EgovMap> getEducationResultListExcel(ExcelVO vo) {
		return resultStatsDAO.getEducationResultListExcel(vo);
	}

	// 홍보 실적
	@Override
	public List<EgovMap> getPromotionResultListExcel(ExcelVO vo) {
		return resultStatsDAO.getPromotionResultListExcel(vo);
	}

	// 학력별 상담현황
	@Override
	public List<EgovMap> getAcadmbCnsStateListExcel(ExcelVO vo) {
		return resultStatsDAO.getAcadmbCnsStateListExcel(vo);
	}

	// 연령별 상담현황
	@Override
	public List<EgovMap> getAgeCnsStateListExcel(ExcelVO vo) {
		return resultStatsDAO.getAgeCnsStateListExcel(vo);
	}

	// 주호소별현황
	@Override
	public List<EgovMap> getMainApplPbCnsStateListExcel(ExcelVO vo) {
		return resultStatsDAO.getMainApplPbCnsStateListExcel(vo);
	}

	// 개인 상담현황
	@Override
	public List<EgovMap> getPersonalCnsStateListExcel(ExcelVO vo) {
		return resultStatsDAO.getPersonalCnsStateListExcel(vo);
	}

	// 집단 상담현황
	@Override
	public List<EgovMap> getGroupCnsStateListExcel(ExcelVO vo) {
		return resultStatsDAO.getGroupCnsStateListExcel(vo);
	}

	// 일/월/년별 현황
	@Override
	public List<EgovMap> getDmyStateListExcel(ExcelVO vo) {
		return resultStatsDAO.getDmyStateListExcel(vo);
	}

	// 센터별 현황
	@Override
	public List<EgovMap> getCenterStateListExcel(ExcelVO vo) {
		return resultStatsDAO.getCenterStateListExcel(vo);
	}

	// 심리검사 현황
	@Override
	public List<EgovMap> getPsyCnsStateListExcel(ExcelVO vo) {
		return resultStatsDAO.getPsyCnsStateListExcel(vo);
	}

///////////////////////////////////////// 엑셀 다운로드 끝 ////////////////////////////////////////////////////////////////////////
	// 배치 통계 DB 입력
	@Override
	public void insertTotalResultReportList() {
		resultStatsDAO.insertTotalResultReportList();
	}
}
