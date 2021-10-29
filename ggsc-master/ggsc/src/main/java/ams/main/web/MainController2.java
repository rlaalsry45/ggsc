package ams.main.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import ams.adm.menu.service.MenuService;
import ams.cmm.AMSComm;
import ams.cmm.AMSDate;
import ams.main.mnu.service.MenuManageService;
import ams.main.mnu.service.MenuVO;
import ams.main.service.MainService;
import egovframework.com.cmm.ComDefaultVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.cnsr.service.GroupVO;
import ggsc.com.util.service.ComCodeService;

/**
 * 템플릿 메인 페이지 컨트롤러 클래스(Sample 소스)
 *
 * </pre>
 */
@Controller

@SessionAttributes(types = ComDefaultVO.class)
public class MainController2 {

	/** AdmMenuManageService */
	@Resource(name = "meunManageService")
	private MenuManageService admMenuManageService;

	/** mainService */
	@Resource(name = "mainService")
	private MainService mainService;

	@Resource(name = "comCodeService")
	private ComCodeService comCodeService;
	
	@Resource(name = "menuService")
	private MenuService menuService;

	
	/**
	 * DB에서 메뉴를 조회한다.
	 *
	 * @param MenuVO
	 *            MenuVO
	 * @return 출력페이지정보 "main_headG", "main_head"
	 * @exception Exception
	 */
	@RequestMapping(value = "/left.do", method = RequestMethod.GET)
	public String left(HttpServletRequest request, @ModelAttribute("MenuVO") MenuVO menuVO, ModelMap model) {
		
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

		// 권한 관리 끝
		
		String mnuCd = request.getParameter("mnuCd");
		mnuCd = mnuCd == null ? null : mnuCd.substring(0, 3);
		model.addAttribute("mnuList", menuService.selectLeftMenuList(mnuCd));
		model.addAttribute("vo", menuVO);
		model.addAttribute("authCd", userAuth);
		return "main/inc/left"; // 업무화면의 상단메뉴 화면
	}

	/**
	 * 몌뉴 이동
	 */
	@RequestMapping(value = "/goPage.do", method = RequestMethod.GET)
	public String goPage(HttpServletRequest request, @ModelAttribute("MenuVO") MenuVO menuVO, ModelMap model) {
		EgovMap map = null;
		model.addAttribute("vo", menuVO);
		String urlParam = "";
		return "redirect:" + map.get("mnuPath").toString() + "?" + urlParam + "mnuCd=" + map.get("mnuCd").toString(); // 업무화면의 상단메뉴 화면
		
	}

	
	@RequestMapping(value = "/header.do", method = RequestMethod.GET)
	public String header(HttpServletRequest request, @ModelAttribute("MenuVO") MenuVO MenuVO, ModelMap model) {
		EgovMap loginVO = null;
		if (request.getSession().getAttribute("LoginVO") != null) {
			loginVO = (EgovMap) request.getSession().getAttribute("LoginVO");
			model.addAttribute("userVO", loginVO);
			
			int userAuth = Integer.parseInt(loginVO.get("authCd").toString());
			switch (userAuth) {
				case 1: MenuVO.setAuthCd("1"); break; 
				case 2: MenuVO.setAuthCd("2"); break; 
				case 3: MenuVO.setAuthCd("3"); break; 
					default: MenuVO.setAuthCd("4"); break; 
			}
			
		} else {
			model.addAttribute("userVO", null);
		}
		
		List<EgovMap> topMenuList = menuService.selectTopMenuList(MenuVO);
		model.addAttribute("topMenuList", topMenuList);
		return "common/inc/header"; // 업무화면의 상단메뉴 화면
	}


}