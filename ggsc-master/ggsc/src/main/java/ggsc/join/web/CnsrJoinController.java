package ggsc.join.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.cnsr.service.AdminManageService;
import ggsc.cnsr.service.CenterVO;
import ggsc.cnsr.service.GroupVO;
import ggsc.join.service.CnsrJoinService;
import ggsc.join.service.CnsrVO;
import ggsc.join.service.UsermVO;


@Controller

public class CnsrJoinController {
	
	@Resource(name = "CnsrJoinService")
	private CnsrJoinService cnsrJoinService;
	
	@Resource(name = "AdminManageService")
	private AdminManageService adminManageService;
	
	@RequestMapping(value = "/cnsr_join_info.do", method = RequestMethod.GET)
	public String cnsr_join_info(HttpServletRequest request, ModelMap model) {
		
		CenterVO centerVO = new CenterVO();
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		GroupVO groupVo = new GroupVO();
		groupVo.setHclassCd("G15");
		List<EgovMap> cnsGbList = adminManageService.getGroupMngDtlMList(groupVo);
		
		groupVo.setHclassCd("G88");
		List<EgovMap> eduGbList = adminManageService.getGroupMngDtlMList(groupVo);
		model.addAttribute("eduGbList", eduGbList);		
		
		groupVo.setHclassCd("G71");
		List<EgovMap> zoneGbList = adminManageService.getGroupMngDtlMList(groupVo);
		model.addAttribute("zoneGbList", zoneGbList);
		
		groupVo.setHclassCd("G72");
		List<EgovMap> localGbList = adminManageService.getGroupMngDtlMList(groupVo);
		model.addAttribute("localGbList", localGbList);
		
		groupVo.setHclassCd("G82");
		List<EgovMap> posiList = adminManageService.getGroupMngDtlMList(groupVo);
		model.addAttribute("posiList", posiList);
		
		groupVo.setHclassCd("G089");
		List<EgovMap> sigunList = adminManageService.getGroupMngDtlMList(groupVo);
		model.addAttribute("sigunList", sigunList);
		
		model.addAttribute("cnsGbList", cnsGbList);
		model.addAttribute("cnsCenterList", cnsCenterList);
		return "join/cnsr_join_info";
	}
	
	@RequestMapping(value = "/cnsr_join_write.do", method = RequestMethod.POST)
	public String cnsr_join_write(HttpServletRequest request, ModelMap model, CnsrVO cnsrVO, UsermVO usermVO) {
		
		cnsrJoinService.insertCnsrMng(cnsrVO);
		cnsrJoinService.insertUserM(usermVO);
		String msg = "가입이 완료 됐습니다.";
		model.addAttribute("msg", msg);
		return "join/cnsr_join_info";
	}
	
	@RequestMapping(value = "/centerGb_ajax.do", method = RequestMethod.POST)
	public String centerGb_ajax(HttpServletRequest request, ModelMap model) {

		String zoneGb = request.getParameter("zoneGb") == null ? "" : request.getParameter("zoneGb");
		
		CenterVO centerVO = new CenterVO();
		centerVO.setSchZoneGb(zoneGb);
		List<EgovMap> cnsCenterList = adminManageService.getCenterManageList(centerVO);
		model.addAttribute("centerList", cnsCenterList);
		return "jsonView";
	}
	
}
