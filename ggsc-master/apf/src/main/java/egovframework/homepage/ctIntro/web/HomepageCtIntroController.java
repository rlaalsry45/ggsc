package egovframework.homepage.ctIntro.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class HomepageCtIntroController {
	
	// 인사말
	@RequestMapping(value = "/salutation.do")
	public String salutation(HttpServletRequest request, Model model) {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		return "homepage/centerIntro/salutation";
	}
	
	// 운영법인
	@RequestMapping(value = "/operatCorp.do")
	public String operatCorp(HttpServletRequest request, Model model) {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		return "homepage/centerIntro/operatCorp";
	}
	
	// 미션관 비전
	@RequestMapping(value = "/missionVis.do")
	public String missionVis(HttpServletRequest request, Model model) {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		return "homepage/centerIntro/missionVis";
	}
	
	// 센터의 발자취
	@RequestMapping(value = "/centerFoot.do")
	public String centerFoot(HttpServletRequest request, Model model) {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		return "homepage/centerIntro/centerFoot";
	}
	
	// 함께하는 사람들
	@RequestMapping(value = "/peopleTg.do")
	public String peopleTg(HttpServletRequest request, Model model) {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		return "homepage/centerIntro/peopleTg";
	}
	
	// 오시는길
	@RequestMapping(value = "/directions.do")
	public String directions(HttpServletRequest request, Model model) {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		return "homepage/centerIntro/directions";
	}
	
	// 이렇게 이용하세요
	@RequestMapping(value = "/useManual.do")
	public String useManual(HttpServletRequest request, Model model) {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		return "homepage/centerIntro/useManual";
	}
	
	// 센터안내 목록
	@RequestMapping(value = "/centerIntroList.do")
	public String centerIntroList(HttpServletRequest request, Model model) {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		return "/centerIntro/centerIntroList.page";
	}
	
}