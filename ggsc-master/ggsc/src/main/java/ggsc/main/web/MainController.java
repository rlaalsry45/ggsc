package ggsc.main.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.main.service.CalendarVO;
import ggsc.main.service.MainService;


@Controller
/*@RequestMapping(value = "/gnoincoundb" )*/
public class MainController {
	@Resource(name = "MainService")
	private MainService mainService;
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET )
	public String main(HttpServletRequest request, ModelMap model){
		EgovMap loginVO = null;
		
		// 권한 관리 시작
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");

		int userAuth, userCenterGb;
		try {
			userAuth = Integer.parseInt(loginVo.get("authCd").toString());
			userCenterGb = Integer.parseInt(loginVo.get("centerGb").toString());
			if (userAuth == 0)
				userAuth = 10;
		} catch (NumberFormatException err) {
			userAuth = 10;
			userCenterGb = 0;
		} catch (NullPointerException err) {
			userAuth = 10;
			userCenterGb = 0;
		}
		
		model.addAttribute("authCd", userAuth);
		
		if (request.getSession().getAttribute("LoginVO") != null) {
			loginVO = (EgovMap) request.getSession()
					.getAttribute("LoginVO");
			model.addAttribute("userVO", loginVO);
		} else {
			return "redirect:/gnoincoundb/login/login.do";
		}
		return "main/main.main";
	}
	
	
		
	@RequestMapping(value = "/get_calendar_list_ajax.do", method = RequestMethod.POST)
	public String get_calendar_list_ajax(HttpServletRequest request, ModelMap model, CalendarVO vo) {
		model.addAttribute("vo",vo);
		List<EgovMap> list = mainService.selectCalendar(vo);
		model.addAttribute("list",list);
		
		return "jsonView";
	}
	
	

	
	@RequestMapping(value = "/set_calendar_ajax.do", method = RequestMethod.POST)
	public String set_calendar_ajax(HttpServletRequest request, ModelMap model, CalendarVO vo) {
		
		int num = vo.getNum();
		EgovMap loginSession = (EgovMap)request.getSession().getAttribute("LoginVO");
		vo.setUser_id(loginSession.get("userId").toString());
		
		if(mainService.checkCalendar(vo)) {
			model.addAttribute("result", false);
			model.addAttribute("resultMessage", "이미 해당 시간, 해당 호실에 예약이 존재합니다.");
		}else {
		
			try {
				if(num==0) {
					mainService.insertCalendar(vo);
				}else {
					mainService.updateCalendar(vo);
				}
				model.addAttribute("result", true);
			}catch(Exception err) {
				model.addAttribute("result", false);
				model.addAttribute("resultMessage", "서버 오류로 등록(수정)할 수 없습니다. 관리자에게 문의하세요.");
			}
		}
		
		model.addAttribute("vo",vo);
		return "jsonView";
	}
	
	@RequestMapping(value = "/del_calendar_ajax.do", method = RequestMethod.POST)
	public String del_calendar_ajax(HttpServletRequest request, ModelMap model, CalendarVO vo) {
		int num = vo.getNum();
		EgovMap loginSession = (EgovMap)request.getSession().getAttribute("LoginVO");
		vo.setUser_id(loginSession.get("userId").toString());
		
		try {
			if(num>0) {
				mainService.deleteCalendar(vo);
				model.addAttribute("result", true);
			}else {
				model.addAttribute("result", false);
			}
			
		}catch(Exception err) {
			model.addAttribute("result", false);
		}
		
		model.addAttribute("vo",vo);
		return "jsonView";
	}
	
	
	@RequestMapping(value = "/calendar/index.do", method = RequestMethod.GET)
	public String main_calendar(HttpServletRequest request, ModelMap model) {
			
		return "calendar/index.main";
	}
	
	
	@RequestMapping(value = "/main_reservation_ajax.do", method = RequestMethod.POST)
	public String main_reservation_ajax(HttpServletRequest request, ModelMap model) {
			
		List<EgovMap> list = mainService.getReservationList();
		
		model.addAttribute("reservation", list);
		
		return "jsonView";
	}
	
}