package ggsc.rorgmng.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.rorgmng.service.RelatedOrganMngService;
import ggsc.rorgmng.service.RorgMngVO;
import ggsc.support.service.ExcelVO;

@Service("RelatedOrganMngService")
public class RelatedOrganMngServiceImpl extends EgovAbstractServiceImpl implements RelatedOrganMngService {
	
	@Resource(name="RelatedOrganMngDAO")
    private RelatedOrganMngDAO RelatedOrganMngDAO;

	// 유관기관관리 목록
	public List<EgovMap> getRelatedOrganMngList(RorgMngVO param) {
		return RelatedOrganMngDAO.getRelatedOrganMngList(param);
	}
	
	// 유관기관관리 엑셀
	public List<EgovMap> getRelatedOrganMngListExcel(ExcelVO vo) {
		return RelatedOrganMngDAO.getRelatedOrganMngListExcel(vo);
	}
	
	// 유관기관관리 목록 갯수
	public int getRelatedOrganMngTotalCnt(RorgMngVO param) {
		return RelatedOrganMngDAO.getRelatedOrganMngTotalCnt(param);
	}
	// 유관기관 등록
	public void insertRelatedOrgan(RorgMngVO param) {
		RelatedOrganMngDAO.insertRelatedOrgan(param);
	}
	// 유관기관명 중복체크
	public int getRelatedOrganCdChk(RorgMngVO param) {
		String orgCd = param.getRelOrgGb();
		orgCd = "gb"+orgCd;
		param.setRelOrgGb("");
		param.setRelOrgGb(orgCd);
		return RelatedOrganMngDAO.getRelatedOrganCdChk(param);
	}
	// 유관기관 상세보기
	public EgovMap getRelatedOrganMngDtl(int num) {
		return RelatedOrganMngDAO.getRelatedOrganMngDtl(num);
	}
	// 유관기관 수정
	public void updateRelatedOrgan(RorgMngVO param) {
		RelatedOrganMngDAO.updateRelatedOrgan(param);
	}
	
}