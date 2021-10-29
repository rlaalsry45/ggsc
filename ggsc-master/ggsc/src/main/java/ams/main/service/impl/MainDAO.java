package ams.main.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("mainDao")
public class MainDAO extends EgovAbstractDAO {

	public List<?> getMainExtReport(EgovMap paramMap) {
		return list("mainDao.getMainExtReport", paramMap);
	}

	public EgovMap getMainYcReport(EgovMap paramMap) {
		return (EgovMap) select("mainDao.getMainYcReport", paramMap);
	}

	public List<?> getMainOvWeekReport(EgovMap paramMap) {
		return list("mainDao.getMainOvWeekReport", paramMap);
	}

	public List<?> getMainOvMonthReport(EgovMap paramMap) {
		return list("mainDao.getMainOvMonthReport", paramMap);
	}

}
