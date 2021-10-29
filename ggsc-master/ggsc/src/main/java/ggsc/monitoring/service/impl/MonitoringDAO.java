package ggsc.monitoring.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.monitoring.service.MonitoringVO;


@Repository("MonitoringDAO")
public class MonitoringDAO extends EgovAbstractDAO {
	// 월별 모니터링 (개인)
	@SuppressWarnings("unchecked")
	public List<EgovMap> getMonitoringPerson(MonitoringVO vo){
		return (List<EgovMap>)list("MonitoringDAO.getMonitoringPerson", vo);
	}
	
	// 월별 모니터링 (집단)
	@SuppressWarnings("unchecked")
	public List<EgovMap> getMonitoringGroup(MonitoringVO vo){
		return (List<EgovMap>)list("MonitoringDAO.getMonitoringGroup", vo);
	}
	
	// 월별 모니터링 (접수현황)
	@SuppressWarnings("unchecked")
	public List<EgovMap> getMonitoringG14(MonitoringVO vo){
		return (List<EgovMap>)list("MonitoringDAO.getMonitoringG14", vo);
	}
	
	// 월별 모니터링 (주호소별)
	@SuppressWarnings("unchecked")
	public List<EgovMap> getMonitoringMajorGb(MonitoringVO vo){
		return (List<EgovMap>)list("MonitoringDAO.getMonitoringMajorGb", vo);
	}
	
}