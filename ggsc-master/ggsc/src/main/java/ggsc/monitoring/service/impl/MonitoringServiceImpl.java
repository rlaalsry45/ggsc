package ggsc.monitoring.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.monitoring.service.MonitoringVO;
import ggsc.monitoring.service.MonitoringService;

@Service("MonitoringService")
public class MonitoringServiceImpl extends EgovAbstractServiceImpl implements MonitoringService {

	@Resource(name="MonitoringDAO")
    private MonitoringDAO monitoringDAO;
	
	// 월별 모니터링 (개인)
	@Override
	public List<EgovMap> getMonitoringPerson(MonitoringVO vo) {
		return monitoringDAO.getMonitoringPerson(vo);
	}
	
	// 월별 모니터링 (집단)
	@Override
	public List<EgovMap> getMonitoringGroup(MonitoringVO vo) {
		return monitoringDAO.getMonitoringGroup(vo);
	}
	
	// 월별 모니터링 (접수현황)
	@Override
	public List<EgovMap> getMonitoringG14(MonitoringVO vo) {
		return monitoringDAO.getMonitoringG14(vo);
	}
	
	// 월별 모니터링 (주호소별)
	@Override
	public List<EgovMap> getMonitoringMajorGb(MonitoringVO vo) {
		return monitoringDAO.getMonitoringMajorGb(vo);
	}
}