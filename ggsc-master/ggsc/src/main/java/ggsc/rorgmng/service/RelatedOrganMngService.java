package ggsc.rorgmng.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.support.service.ExcelVO;

public interface RelatedOrganMngService {
	
	// 유관기관관리 목록 
	public List<EgovMap> getRelatedOrganMngList(RorgMngVO param);
	
	// 유관기관관리 목록(엑셀) 
	public List<EgovMap> getRelatedOrganMngListExcel(ExcelVO vo);
		
	// 유관기관관리 목록 갯수
	public int getRelatedOrganMngTotalCnt(RorgMngVO param);
	// 유관기관 등록
	public void insertRelatedOrgan(RorgMngVO param);
	// 유관기관명 중복체크
	public int getRelatedOrganCdChk(RorgMngVO param);
	// 유관기관 상세보기
	public EgovMap getRelatedOrganMngDtl(int num);
	// 유관기관 수정
	public void updateRelatedOrgan(RorgMngVO param);
}