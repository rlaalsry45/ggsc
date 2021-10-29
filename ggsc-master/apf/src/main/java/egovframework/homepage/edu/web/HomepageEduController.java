package egovframework.homepage.edu.web;

import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.homepage.edu.service.EduVO;
import egovframework.homepage.edu.service.HomepageEduService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller

public class HomepageEduController {
	
	/** homepageComfCnsService */
	@Resource(name = "homepageEduService")
	private HomepageEduService homepageEduService;
	
	
	@RequestMapping(value = "/eduAppWrite.do")
	public String eduAppWrite(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");	
			response.setContentType("text/html; charset=UTF-8");		 
			PrintWriter out = response.getWriter();		 
			out.println("<script>alert('로그인 후에 상담신청을 할 수 있습니다.');</script>");
			out.flush();
			return "/main/login.page";
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		
		model.addAttribute("map",map);
		
		return "/edu/eduAppWrite.page";
	}
	
	
	// 맘편한 상담 신청 등록
	@RequestMapping(value = "/eduAppReg.do")
	public String eduAppReg(EduVO vo, HttpServletRequest request, ModelMap model) throws Exception {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		vo.setUserId((String)map.get("userId"));
		
		// 맘편한 상담 신청 등록
		homepageEduService.insertEduReg(vo);
		
		return "redirect:/gnoincoun/homepageMainList.do";
	}
	
	
}