package ams.main.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface MainService {

	EgovMap getMainReport(EgovMap paramMap) throws Exception;

	public List<?> getMainOvWeekReport(EgovMap paramMap) throws Exception;

	public List<?> getMainExtMonthReport(EgovMap paramMap) throws Exception;
	
}
