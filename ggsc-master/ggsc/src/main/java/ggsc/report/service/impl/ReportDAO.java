package ggsc.report.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.report.service.CnsBookVO;
import ggsc.report.service.CnsEndVO;
import ggsc.report.service.EduAtvyRptVO;
import ggsc.report.service.LinkOrgRptVO;
import ggsc.report.service.NtwkMeetRptVO;
import ggsc.report.service.PrAtvyRptVO;
import ggsc.report.service.mindSharingVO;
import ggsc.support.service.ExcelVO;

@Repository("ReportDAO")
public class ReportDAO extends EgovAbstractDAO {
		
	
	// 마음나눔봉사단 / 성인식개선사업 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getMindSharingList(mindSharingVO vo){
		return (List<EgovMap>)list("reportDao.getMindSharingList", vo);
	}
	
	// 마음나눔봉사단 / 성인식개선사업 갯수
	public int getMindSharingCnt(mindSharingVO vo){
		return (Integer)select("reportDao.getMindSharingCnt", vo);
	}
		
	// 마음나눔봉사단 / 성인식개선사업 엑셀다운
	@SuppressWarnings("unchecked")
	public List<EgovMap> getMindSharingListExcel(ExcelVO vo){
		return (List<EgovMap>)list("reportDao.getMindSharingListExcel",vo);
	}
	
	// 마음나눔봉사단 / 성인식개선사업 상세
	public EgovMap getgetMindSharingDtl(mindSharingVO vo){
		return (EgovMap)select("reportDao.getgetMindSharingDtl", vo);
	}
	// 마음나눔봉사단 / 성인식개선사업 등록
	public void insertMindSharing(mindSharingVO vo){
		insert("reportDao.insertMindSharing", vo);
	}
	
	// 마음나눔봉사단 / 성인식개선사업 수정
	public void updateMindSharing(mindSharingVO vo){
		update("reportDao.updateMindSharing", vo);
	}
	
	// 마음나눔봉사단 / 성인식개선사업 삭제
	public void deleteMindSharing(mindSharingVO vo){
		update("reportDao.deleteMindSharing", vo);
	}
	
	// 상담사례종결서 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getCnsEndList(CnsEndVO vo){
		return (List<EgovMap>)list("reportDao.getCnsEndList", vo);
	}
	
	// 상담사례종결서 갯수
	public int getCnsEndListTotCnt(CnsEndVO vo){
		return (Integer)select("reportDao.getCnsEndListTotCnt", vo);
	}
	
	// 상담사례종결서 엑셀다운
	@SuppressWarnings("unchecked")
	public List<EgovMap> getCnsEndListExcel(ExcelVO vo){
		return (List<EgovMap>)list("reportDao.getCnsEndListExcel",vo);
	}
	
	// 상담사례종결서 상세
	public EgovMap getCnsEndDtl(CnsEndVO vo){
		return (EgovMap)select("reportDao.getCnsEndDtl", vo);
	}
	
	// 상담사례종결서 수정
	public void updateCnsEnd(CnsEndVO vo){
		update("reportDao.updateCnsEnd", vo);
	}
	
	// 상담대상자관리대장 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getCnsBookList(CnsBookVO vo){
		return (List<EgovMap>)list("reportDao.getCnsBookList", vo);
	}
	
	// 상담대상자관리대장 갯수
	public int getCnsBookListTotCnt(CnsBookVO vo){
		return (Integer)select("reportDao.getCnsBookListTotCnt", vo);
	}
	
	// 상담대상자 관리대장 엑셀다운
	@SuppressWarnings("unchecked")
	public List<EgovMap> getCnsBookListExcel(ExcelVO vo){
		return (List<EgovMap>)list("reportDao.getCnsBookListExcel", vo);
	}
	
	// 상담종결관리대장 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getCnsEndBookList(CnsEndVO vo){
		return (List<EgovMap>)list("reportDao.getCnsEndBookList", vo);
	}
	
	// 상담종결관리대장 갯수
	public int getCnsEndBookListTotCnt(CnsEndVO vo){
		return (Integer)select("reportDao.getCnsEndBookListTotCnt", vo);
	}
	
	// 상담종결 관리대장 엑셀다운
	@SuppressWarnings("unchecked")
	public List<EgovMap> getCnsEndBookListExcel(ExcelVO vo){
		return (List<EgovMap>)list("reportDao.getCnsEndBookListExcel",vo);
	}
	
	// 연계기관방문보고서 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getLinkOrgRptList(LinkOrgRptVO vo){
		return (List<EgovMap>)list("reportDao.getLinkOrgRptList", vo);
	}
	
	// 연계기관방문보고서 갯수
	public int getLinkOrgRptListTotCnt(LinkOrgRptVO vo){
		return (Integer)select("reportDao.getLinkOrgRptListTotCnt", vo);
	}
	
	// 연계기관방문보고서 엑셀다운
	@SuppressWarnings("unchecked")
	public List<EgovMap> getLinkOrgRptListExcel(ExcelVO vo){
		return (List<EgovMap>)list("reportDao.getLinkOrgRptListExcel",vo);
	}
	
	// 연계기관방문보고서 상세
	public EgovMap getLinkOrgRptDtl(LinkOrgRptVO vo){
		return (EgovMap)select("reportDao.getLinkOrgRptDtl", vo);
	}
	// 연계기관방문보고서 등록
	public void insertLinkOrgRpt(LinkOrgRptVO vo){
		insert("reportDao.insertLinkOrgRpt", vo);
	}
	
	// 연계기관방문보고서 수정
	public void updateLinkOrgRpt(LinkOrgRptVO vo){
		update("reportDao.updateLinkOrgRpt", vo);
	}
	
	// 연계기관방문보고서 삭제
	public void deleteLinkOrgRpt(LinkOrgRptVO vo){
		update("reportDao.deleteLinkOrgRpt", vo);
	}
	
	// 네트워크구축회의보고서 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getNtwkMeetRptList(NtwkMeetRptVO vo){
		return (List<EgovMap>)list("reportDao.getNtwkMeetRptList", vo);
	}
	
	// 네트워크구축회의보고서 갯수
	public int getNtwkMeetRptListTotCnt(NtwkMeetRptVO vo){
		return (Integer)select("reportDao.getNtwkMeetRptListTotCnt", vo);
	}
	
	// 네트워크구축회의보고서 엑셀다운
	@SuppressWarnings("unchecked")
	public List<EgovMap> getNtwkMeetRptListExcel(ExcelVO vo){
		return (List<EgovMap>)list("reportDao.getNtwkMeetRptListExcel",vo);
	}
	
	// 네트워크구축회의보고서 상세
	public EgovMap getNtwkMeetRptDtl(NtwkMeetRptVO vo){
		return (EgovMap)select("reportDao.getNtwkMeetRptDtl", vo);
	}
	
	// 네트워크구축회의보고서 등록
	public void insertNtwkMeetRpt(NtwkMeetRptVO vo){
		insert("reportDao.insertNtwkMeetRpt", vo);
	}
	
	// 네트워크구축회의보고서 수정
	public void updateNtwkMeetRpt(NtwkMeetRptVO vo){
		update("reportDao.updateNtwkMeetRpt", vo);
	}
	
	// 네트워크구축회의보고서 삭제
	public void deleteNtwkMeetRpt(NtwkMeetRptVO vo){
		update("reportDao.deleteNtwkMeetRpt", vo);
	}
	
	// 네트워크구축회의보고서 pdf
	public void insertNtwkMeetRptUpload(NtwkMeetRptVO vo){
		update("reportDao.insertNtwkMeetRptUpload", vo);
	}
	
	// 교육활동보고서 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getEduAtvyRptList(EduAtvyRptVO vo){
		return (List<EgovMap>)list("reportDao.getEduAtvyRptList", vo);
	}
	
	// 교육활동보고서 갯수
	public int getEduAtvyRptListTotCnt(EduAtvyRptVO vo){
		return (Integer)select("reportDao.getEduAtvyRptListTotCnt", vo);
	}
	
	// 교육활동보고서 엑셀다운
	@SuppressWarnings("unchecked")
	public List<EgovMap> getEduAtvyRptListExcel(ExcelVO vo){
		return (List<EgovMap>)list("reportDao.getEduAtvyRptListExcel",vo);
	}
	
	// 교육활동보고서 상세
	public EgovMap getEduAtvyRptDtl(EduAtvyRptVO vo){
		return (EgovMap)select("reportDao.getEduAtvyRptDtl", vo);
	}
	
	// 교육활동보고서 등록
	public void insertEduAtvyRpt(EduAtvyRptVO vo){
		insert("reportDao.insertEduAtvyRpt", vo);
	}
	
	// 교육활동보고서 수정
	public void updateEduAtvyRpt(EduAtvyRptVO vo){
		update("reportDao.updateEduAtvyRpt", vo);
	}
	
	// 교육활동보고서 삭제
	public void deleteEduAtvyRpt(EduAtvyRptVO vo){
		update("reportDao.deleteEduAtvyRpt", vo);
	}
	
	// 홍보활동보고서 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getPrAtvyRptList(PrAtvyRptVO vo){
		return (List<EgovMap>)list("reportDao.getPrAtvyRptList", vo);
	}
	
	// 홍보활동보고서 갯수
	public int getPrAtvyRptListTotCnt(PrAtvyRptVO vo){
		return (Integer)select("reportDao.getPrAtvyRptListTotCnt", vo);
	}
	
	// 홍보활동보고서 엑셀다운
	@SuppressWarnings("unchecked")
	public List<EgovMap> getPrAtvyRptListExcel(ExcelVO vo){
		return (List<EgovMap>)list("reportDao.getPrAtvyRptListExcel",vo);
	}
	
	// 홍보활동보고서 상세
	public EgovMap getPrAtvyRptDtl(PrAtvyRptVO vo){
		return (EgovMap)select("reportDao.getPrAtvyRptDtl", vo);
	}
	
	// 홍보활동보고서 등록
	public void insertPrAtvyRpt(PrAtvyRptVO vo){
		insert("reportDao.insertPrAtvyRpt", vo);
	}
	
	// 홍보활동보고서 수정
	public void updatePrAtvyRpt(PrAtvyRptVO vo){
		update("reportDao.updatePrAtvyRpt", vo);
	}
	
	// 홍보활동보고서 수정
	public void deletePrAtvyRpt(PrAtvyRptVO vo){
		update("reportDao.deletePrAtvyRpt", vo);
	}
}
