package ggsc.main.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface MainService {
	// main.do 예약현황
	public List<EgovMap> getReservationList();
	
	
	public List<EgovMap> selectCalendar(CalendarVO vo);
	public boolean checkCalendar(CalendarVO vo);
	public void insertCalendar(CalendarVO vo);
	public void updateCalendar(CalendarVO vo);
	public void deleteCalendar(CalendarVO vo);
}