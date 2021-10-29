package ggsc.main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.main.service.CalendarVO;
import ggsc.main.service.MainService;

@Service("MainService")
public class MainServiceImpl extends EgovAbstractServiceImpl implements MainService {
	
	@Resource(name="MainDAO")
    private MainDAO mainDAO;
	
	public List<EgovMap> getReservationList() {
		return mainDAO.getReservationList();
	}
	
	public List<EgovMap> selectCalendar(CalendarVO vo) {
		return mainDAO.selectCalendar(vo);
	}
	
	public void insertCalendar(CalendarVO vo) {
		mainDAO.insertCalendar(vo);
	}
	
	
	public boolean checkCalendar(CalendarVO vo) {	
		return mainDAO.checkCalendar(vo);
	}
	
	public void updateCalendar(CalendarVO vo) {
		mainDAO.updateCalendar(vo);
	}
	
	public void deleteCalendar(CalendarVO vo) {
		mainDAO.deleteCalendar(vo);
	}
	
}