package ggsc.report.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.support.service.ExcelVO;

public interface ReportService {
	// 마음나눔봉사단 / 성인식개선사업 엑셀다운
	List<EgovMap> getMindSharingListExcel(ExcelVO vo);
	// 상담사례종결서 엑셀다운
	List<EgovMap> getCnsEndListExcel(ExcelVO vo);
	// 상담대상자 관리대장 엑셀다운
	List<EgovMap> getCnsBookListExcel(ExcelVO vo);
	// 상담종결 관리대장 엑셀다운
	List<EgovMap> getCnsEndBookListExcel(ExcelVO vo);
	// 연계기관방문보고서 엑셀다운
	List<EgovMap> getLinkOrgRptListExcel(ExcelVO vo);
	// 네트워크구축회의보고서 엑셀다운
	List<EgovMap> getNtwkMeetRptListExcel(ExcelVO vo);
	// 교육활동보고서 엑셀다운
	List<EgovMap> getEduAtvyRptListExcel(ExcelVO vo);
	// 홍보활동보고서 엑셀다운
	List<EgovMap> getPrAtvyRptListExcel(ExcelVO vo);
		
	// 마음나눔봉사단 / 성인식개선사업 목록
	List<EgovMap> getMindSharingList(mindSharingVO vo);
	
	// 음나눔봉사단 / 성인식개선사업 갯수
	int getMindSharingCnt(mindSharingVO vo);
		
	// 마음나눔봉사단 / 성인식개선사업 등록
	void insertMindSharing(mindSharingVO vo);
		
	// 마음나눔봉사단 / 성인식개선사업 수정
	void updateMindSharing(mindSharingVO vo);
	
	// 마음나눔봉사단 / 성인식개선사업 삭제
	void deleteMindSharing(mindSharingVO vo);
	
	// 마음나눔봉사단 / 성인식개선사업 상세
	EgovMap getgetMindSharingDtl(mindSharingVO vo);
	
	// 상담사례종결서 목록
	List<EgovMap> getCnsEndList(CnsEndVO vo);
	
	// 상담사례종결서 갯수
	int getCnsEndListTotCnt(CnsEndVO vo);
	
	// 상담사례종결서 상세
	EgovMap getCnsEndDtl(CnsEndVO vo);
	
	// 상담사례종결서 수정
	void updateCnsEnd(CnsEndVO vo);
	
	// 상담대상자관리대장 목록
	List<EgovMap> getCnsBookList(CnsBookVO vo);
	
	// 상담대상자관리대장 갯수
	int getCnsBookListTotCnt(CnsBookVO vo);
	
	// 상담종결관리대장 목록
	List<EgovMap> getCnsEndBookList(CnsEndVO vo);
	
	// 상담종결관리대장 갯수
	int getCnsEndBookListTotCnt(CnsEndVO vo);
	
	// 연계기관방문보고서 목록
	List<EgovMap> getLinkOrgRptList(LinkOrgRptVO vo);
	
	// 연계기관방문보고서 갯수
	int getLinkOrgRptListTotCnt(LinkOrgRptVO vo);
	
	// 연계기관방문보고서 상세
	EgovMap getLinkOrgRptDtl(LinkOrgRptVO vo);
	
	// 연계기관방문보고서 등록
	void insertLinkOrgRpt(LinkOrgRptVO vo);
		
	// 연계기관방문보고서 수정
	void updateLinkOrgRpt(LinkOrgRptVO vo);
	
	// 연계기관방문보고서 삭제
	void deleteLinkOrgRpt(LinkOrgRptVO vo);
	
	// 네트워크구축회의보고서 목록
	List<EgovMap> getNtwkMeetRptList(NtwkMeetRptVO vo);
	
	// 네트워크구축회의보고서 갯수
	int getNtwkMeetRptListTotCnt(NtwkMeetRptVO vo);
	
	// 네트워크구축회의보고서 상세
	EgovMap getNtwkMeetRptDtl(NtwkMeetRptVO vo);
	
	// 네트워크구축회의보고서 등록
	void insertNtwkMeetRpt(NtwkMeetRptVO vo);
	
	// 네트워크구축회의보고서 수정
	void updateNtwkMeetRpt(NtwkMeetRptVO vo);
	
	// 네트워크구축회의보고서 삭제
	void deleteNtwkMeetRpt(NtwkMeetRptVO vo);
	
	// 교육활동보고서 목록
	List<EgovMap> getEduAtvyRptList(EduAtvyRptVO vo);
	
	// 교육활동보고서 갯수
	int getEduAtvyRptListTotCnt(EduAtvyRptVO vo);
	
	// 교육활동보고서 상세
	EgovMap getEduAtvyRptDtl(EduAtvyRptVO vo);
	
	// 교육활동보고서 등록
	void insertEduAtvyRpt(EduAtvyRptVO vo);
	
	// 교육활동보고서 수정
	void updateEduAtvyRpt(EduAtvyRptVO vo);
	
	// 교육활동보고서 삭제
	void deleteEduAtvyRpt(EduAtvyRptVO vo);
	
	// 홍보활동보고서 목록
	List<EgovMap> getPrAtvyRptList(PrAtvyRptVO vo);
	
	// 홍보활동보고서 갯수
	int getPrAtvyRptListTotCnt(PrAtvyRptVO vo);
	
	// 홍보활동보고서 상세
	EgovMap getPrAtvyRptDtl(PrAtvyRptVO vo);
	
	// 홍보활동보고서 등록
	void insertPrAtvyRpt(PrAtvyRptVO vo);
	
	// 홍보활동보고서 수정
	void updatePrAtvyRpt(PrAtvyRptVO vo);
	
	// 홍보활동보고서 삭제
	void deletePrAtvyRpt(PrAtvyRptVO vo);
}
