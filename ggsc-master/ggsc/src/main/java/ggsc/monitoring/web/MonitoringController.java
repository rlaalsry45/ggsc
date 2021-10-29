package ggsc.monitoring.web;

import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ibm.icu.util.Calendar;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.cnsr.service.AdminManageService;
import ggsc.cnsr.service.CenterVO;
import ggsc.monitoring.service.MonitoringService;
import ggsc.monitoring.service.MonitoringVO;
import ggsc.monitoring.service.impl.MonitoringDAO;
import ggsc.cnsr.service.GroupVO;


@Controller

public class MonitoringController {
	
	@Resource(name = "MonitoringService")
	private MonitoringService monitoringService;
	
	@Resource(name = "AdminManageService")
	private AdminManageService adminManageService;
	

	@RequestMapping(value = "/overrollStatus.do", method = RequestMethod.GET)
	public String overrollStatus(MonitoringVO vo,HttpServletRequest request, ModelMap model){	
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		
		model.addAttribute("mnuCd",mnuCd);
		
		
		return "monitoring/overoll.main";
	}
	
	@RequestMapping(value = "/zoneStatus.do", method = RequestMethod.GET)
	public String zoneStatus(MonitoringVO vo, HttpServletRequest request, ModelMap model){	
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd",mnuCd);
		
		GroupVO groupVO = new GroupVO();
		groupVO.setHclassCd("G71");
		List<EgovMap> cnsZoneList = adminManageService.getGroupMngDtlMList(groupVO);
		model.addAttribute("cnsZoneList", cnsZoneList);
		model.addAttribute("vo",vo);
		return "monitoring/zone.main";
	}
	
	@RequestMapping(value = "/centerStatus.do", method = RequestMethod.GET)
	public String centerStatus(MonitoringVO vo, HttpServletRequest request, ModelMap model){	
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd",mnuCd);
		
		CenterVO centerVO = new CenterVO();
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		model.addAttribute("cnsCenterList", cnsCenterList);
		model.addAttribute("vo",vo);
		return "monitoring/center.main";
	}
	
	@RequestMapping(value = "/monitoring_ajax.do", method = RequestMethod.POST )
	public String monitoring_ajax(MonitoringVO vo,HttpServletRequest request, ModelMap model){	
		
		if(vo.getschYearGb()==null) {
			vo.setschYearGb(String.format("%s",Calendar.YEAR));
		}
		
		System.out.println("[test] : " + vo.getschYearGb());
		
		
		List<EgovMap> person = monitoringService.getMonitoringPerson(vo);
		model.addAttribute("person",person);
		List<EgovMap> group = monitoringService.getMonitoringGroup(vo);
		model.addAttribute("group",group);
		List<EgovMap> g14 = monitoringService.getMonitoringG14(vo);
		model.addAttribute("g14",g14);
		List<EgovMap> majorGb = monitoringService.getMonitoringMajorGb(vo);
		model.addAttribute("majorGb",majorGb);

		
		return "jsonView";
	}
	
}