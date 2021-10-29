package ggsc.adstv.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.adstv.service.InspectionVO;

@Repository("AdministrativeDAO")
public class AdministrativeDAO extends EgovAbstractDAO{
	
	// 검사지관리 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getInspectionList(InspectionVO param) {
		return (List<EgovMap>)list("AdministrativeDAO.getInspectionList", param);
	}
	// 검사지관리 목록 갯수
	public int getInspectionTotalCnt(InspectionVO param) {
		return (Integer) select("AdministrativeDAO.getInspectionTotalCnt", param);
	}
	
}
