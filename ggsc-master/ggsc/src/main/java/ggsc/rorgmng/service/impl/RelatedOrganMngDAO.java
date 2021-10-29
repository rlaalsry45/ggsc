package ggsc.rorgmng.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.rorgmng.service.RorgMngVO;
import ggsc.support.service.ExcelVO;

@Repository("RelatedOrganMngDAO")
public class RelatedOrganMngDAO extends EgovAbstractDAO{

	// 유관기관관리 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getRelatedOrganMngList(RorgMngVO param) {
		return (List<EgovMap>)list("RelatedOrganMngDAO.getRelatedOrganMngList" ,param);
	}
	
	// 유관기관관리 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getRelatedOrganMngListExcel(ExcelVO vo) {
		return (List<EgovMap>)list("RelatedOrganMngDAO.getRelatedOrganMngListExcel" ,vo);
	}
	// 유관기관관리 목록 갯수
	public int getRelatedOrganMngTotalCnt(RorgMngVO param) {
		return (Integer)select("RelatedOrganMngDAO.getRelatedOrganMngTotalCnt" ,param);
	}
	// 유관기관 등록
	public void insertRelatedOrgan(RorgMngVO param) {
		insert("RelatedOrganMngDAO.insertRelatedOrgan" ,param);
	}
	// 유관기관명 중복체크
	public int getRelatedOrganCdChk(RorgMngVO param) {
		return (Integer)select("RelatedOrganMngDAO.getRelatedOrganCdChk" ,param);
	}
	// 유관기관 상세보기
	public EgovMap getRelatedOrganMngDtl(int num) {
		return (EgovMap)select("RelatedOrganMngDAO.getRelatedOrganMngDtl", num);
	}
	// 유관기관 수정
	public void updateRelatedOrgan(RorgMngVO param) {
		update("RelatedOrganMngDAO.updateRelatedOrgan" ,param);
	}
}
