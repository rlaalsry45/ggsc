package ggsc.adstv.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.adstv.service.AdministrativeService;
import ggsc.adstv.service.InspectionVO;

@Service("AdministrativeService")
public class AdministrativeServiceImpl extends EgovAbstractServiceImpl implements AdministrativeService {
	
	@Resource(name="AdministrativeDAO")
    private AdministrativeDAO AdministrativeDAO;
	
	// 검사지관리 목록
	public List<EgovMap> getInspectionList(InspectionVO param) {
		return AdministrativeDAO.getInspectionList(param);
	}
	
	// 검사지관리 목록 갯수
	public int getInspectionTotalCnt(InspectionVO param) {
		return AdministrativeDAO.getInspectionTotalCnt(param);
	}
}