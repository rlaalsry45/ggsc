package egovframework.homepage.busiIntro.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.rte.psl.dataaccess.util.EgovMap;


@Controller
public class HomepageBusiIntroController {
	
	// 상담지원사업 페이지
	@RequestMapping(value = "/cnsSupport.do")
	public String cnsSupport(HttpServletRequest request, ModelMap model) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		return "homepage/businIntro/cnsSupport";
	}
	
	// 교육사업 페이지
	@RequestMapping(value = "/eduBusin.do")
	public String eduBusin(HttpServletRequest request, ModelMap model) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		return "homepage/businIntro/eduBusin";
	}
	
	// 홍보사업 페이지
	@RequestMapping(value = "/linkBusin.do")
	public String linkBusin(HttpServletRequest request, ModelMap model) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		return "homepage/businIntro/linkBusin";
	}
	
	// 연계협력사업 페이지
	@RequestMapping(value = "/publicBusin.do")
	public String publicBusin(HttpServletRequest request, ModelMap model) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		return "homepage/businIntro/publicBusin";
	}
	
	// 센터사업소개
	@RequestMapping(value = "/busiIntroList.do")
	public String busiIntroList(HttpServletRequest request, ModelMap model) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		String gubun = request.getParameter("gubun");
		
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		model.addAttribute("gubun", gubun);
		return "/businIntro/busiIntroList.page";
	}
	
}