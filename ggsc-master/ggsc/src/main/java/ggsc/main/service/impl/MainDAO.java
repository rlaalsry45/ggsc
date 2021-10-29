package ggsc.main.service.impl;

import java.util.List;

import org.apache.commons.lang3.BooleanUtils;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.main.service.CalendarVO;
import ggsc.support.service.NoticeVO;

@Repository("MainDAO")
public class MainDAO extends EgovAbstractDAO {
	@SuppressWarnings("unchecked")
	public List<EgovMap> getReservationList() {
		return (List<EgovMap>)list("MainDAO.getReservationList");
	}
	
	
	@SuppressWarnings("unchecked")
	public List<EgovMap> selectCalendar(CalendarVO vo) {
		return (List<EgovMap>)list("MainDAO.selectCalendar", vo);
	}
	
	
	public boolean checkCalendar(CalendarVO vo) {
		return BooleanUtils.toBoolean((Integer)select("MainDAO.checkCalendar", vo));
	}
	

	public void insertCalendar(CalendarVO vo){
		insert("MainDAO.insertCalendar", vo);
	}
	
	public void updateCalendar(CalendarVO vo){
		update("MainDAO.updateCalendar", vo);
	}
	
	public void deleteCalendar(CalendarVO vo){
		delete("MainDAO.deleteCalendar", vo);
	}
}
