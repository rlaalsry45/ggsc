package ams.cmm.service.impl;

import org.springframework.stereotype.Repository;

import ams.cmm.PageEditVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("cmmDAO")
public class CmmDAO extends EgovAbstractDAO {

	public long selectSeq(EgovMap map) {
		return (Long) select("commonDAO.selectSeq", map);
	}

	public void updateSeq(EgovMap map) {
		update("commonDAO.updateSeq", map);
	}

	public void insertIdTable(EgovMap map) {
		insert("commonDAO.insertIdTable", map);
	}

	public Object selectPageData(PageEditVO vo) {
		return select("commonDAO.selectPageData", vo);
	}

	public int mergePageData(PageEditVO vo) {
		return update("commonDAO.mergePageData", vo);
	}

	public String getInOutDate(EgovMap map) {
		return (String) select("commonDAO.getInOutDate", map);
	}

	public EgovMap selectMealTimeCut() {
		return (EgovMap) select("commonDAO.selectMealTimeCut");
	}

	// public String getMenuAdminYn(EgovMap authMap) {
	// return (String) select("commonDAO.getMenuAdminYn", authMap);
	// }

	public Object getAuthBtnArray(String userId) {
		return (String) select("commonDAO.getAuthBtnArray", userId);
	}

}
