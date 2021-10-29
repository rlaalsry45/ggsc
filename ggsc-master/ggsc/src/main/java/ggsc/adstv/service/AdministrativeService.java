package ggsc.adstv.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface AdministrativeService {
	
	// 검사지관리 목록
	public List<EgovMap> getInspectionList(InspectionVO param);	
	// 검사지관리 목록 갯수
	public int getInspectionTotalCnt(InspectionVO param);
}