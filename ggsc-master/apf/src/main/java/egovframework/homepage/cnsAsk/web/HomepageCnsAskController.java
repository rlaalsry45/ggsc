package egovframework.homepage.cnsAsk.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.homepage.cnsAsk.service.CnsAskVO;
import egovframework.homepage.cnsAsk.service.HomepageCnsAskService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller

public class HomepageCnsAskController {
	
	/** homepageMainService */
	@Resource(name = "homepageCnsAskService")
	private HomepageCnsAskService homepageCnsAskService;
	
	@RequestMapping(value = "/cnsAskList.do")
	public String cnsAskList(CnsAskVO vo ,HttpServletRequest request, ModelMap model) throws Exception {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		vo.setCnsleId((String)map.get("userId"));
		vo.setWriter((String)map.get("userNm"));
		
		// 상담문의하기
		List<EgovMap> cnsAskList = homepageCnsAskService.getCnsAskList(vo);
		model.addAttribute("cnsAskList",cnsAskList);
		
		return "homepage/cnsAsk/cnsAskList";
	}
	
	@RequestMapping(value = "/cnsAskInsert.do")
	public String cnsAskInsert(CnsAskVO vo ,HttpServletRequest request, ModelMap model) throws Exception {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		vo.setCnsleId((String)map.get("userId"));
		vo.setWriter((String)map.get("userNm"));
		
		return "homepage/cnsAsk/cnsAskInsert";
	}
	
	@RequestMapping(value = "/cnsAskReg.do")
	public String freeBbsReg(CnsAskVO vo, HttpServletRequest request, ModelMap model) throws Exception {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		vo.setCnsleId((String)map.get("userId"));
		vo.setWriter((String)map.get("userNm"));
		
		// 상담문의 등록
		homepageCnsAskService.getCnsAskReg(vo);
		
		return "redirect:/gnoincoun/cnsAskList.do";
	}
	
}