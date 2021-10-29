package ggsc.monitoring.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.monitoring.service.MonitoringVO;

public interface MonitoringService {
	// 월별 모니터링 (개인)
	List<EgovMap> getMonitoringPerson(MonitoringVO vo);
	
	// 월별 모니터링 (집단)
	List<EgovMap> getMonitoringGroup(MonitoringVO vo);
	
	// 월별 모니터링 (접수현황)
	List<EgovMap> getMonitoringG14(MonitoringVO vo);
	
	// 월별 모니터링 (주호소별)
	List<EgovMap> getMonitoringMajorGb(MonitoringVO vo);

}