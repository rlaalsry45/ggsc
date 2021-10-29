package ggsc.stats.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.support.service.ExcelVO;

public interface ResultStatsService {

	// 실적 보고서
	List<EgovMap> getResultReportList(ResultReportVO vo);
	
	// main 화면 값
	List<EgovMap> getMianCnsResult(ResultReportVO vo);
	
	// 실적 보고서(센터별)
	List<EgovMap> getResultReportCenterList(ResultReportVO vo);

	// 상담사 실적
	List<EgovMap> getCounselorResultList(ResultReportVO vo);

	// 교육 실적
	List<EgovMap> getEducationResultList(ResultReportVO vo);

	// 홍보실적
	List<EgovMap> getPromotionResultList(ResultReportVO vo);

	// 학력별상담현황
	List<EgovMap> getAcadmbCnsStateList(ResultReportVO vo);

	// 연령별상담현황
	List<EgovMap> getAgeCnsStateList(ResultReportVO vo);

	// 연령별상담현황2
	List<EgovMap> getAgeCnsStateList2(ResultReportVO vo);

	// 주호수별현황
	List<EgovMap> getMainApplPbCnsStateList(ResultReportVO vo);

	// 개인상담현황
	List<EgovMap> getPersonalCnsStateList(ResultReportVO vo);

	// 집단상담현황
	List<EgovMap> getGroupCnsStateList(ResultReportVO vo);

	// 일/월/년별현황
	List<EgovMap> getDmyStateList(ResultReportVO vo);

	// 센터별현황
	List<EgovMap> getCenterStateList(ResultReportVO vo);

	// 심리검사현황
	List<EgovMap> getPsyCnsStateList(ResultReportVO vo);

	///////////////////////////////////////////////////////////// 엑셀 다운로드 시작
	///////////////////////////////////////////////////////////// //////////////////////////////////////////////////////////
	// 실적 보고서(총 갯수)
	List<EgovMap> getTotalResultReportListExcel(ExcelVO vo);
	
	// 실적 보고서
	List<EgovMap> getResultReportListExcel(ExcelVO vo);

	// 상담사 실적
	List<EgovMap> getCounselorResultListExcel(ExcelVO vo);

	// 교육 실적
	List<EgovMap> getEducationResultListExcel(ExcelVO vo);

	// 홍보실적
	List<EgovMap> getPromotionResultListExcel(ExcelVO vo);

	// 학력별상담현황
	List<EgovMap> getAcadmbCnsStateListExcel(ExcelVO vo);

	// 연령별상담현황
	List<EgovMap> getAgeCnsStateListExcel(ExcelVO vo);

	// 연령별상담현황2
	//List<EgovMap> getAgeCnsStateList2Excel(ExcelVO vo);

	// 주호수별현황
	List<EgovMap> getMainApplPbCnsStateListExcel(ExcelVO vo);

	// 개인상담현황
	List<EgovMap> getPersonalCnsStateListExcel(ExcelVO vo);

	// 집단상담현황
	List<EgovMap> getGroupCnsStateListExcel(ExcelVO vo);

	// 일/월/년별현황
	List<EgovMap> getDmyStateListExcel(ExcelVO vo);

	// 센터별현황
	List<EgovMap> getCenterStateListExcel(ExcelVO vo);

	// 심리검사현황
	List<EgovMap> getPsyCnsStateListExcel(ExcelVO vo);
///////////////////////////////////////////////////////////// 엑셀 다운로드 끝 //////////////////////////////////////////////////////////
	
	// 배치 통계 DB 입력
	void insertTotalResultReportList();

}