package ggsc.com.util.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ams.adm.com.util.DeptConfUtil;
import ggsc.com.util.service.ComCodeService;
import ggsc.com.util.service.ComCodeVO;


@Controller

public class ComAjaxController {

	@Resource(name = "comCodeService")
	private ComCodeService comCodeService;

	/**
	 * 코드 정보 검색
	 *
	 * @param request
	 * @param vo
	 * @param model
	 * @return @
	 */
	/*
	 * @RequestMapping(value = "/com/code_list.do", method = { RequestMethod.POST ,
	 * RequestMethod.GET })
	 */
	public String com_code_list(HttpServletRequest request, ComCodeVO vo, ModelMap model) {

		model.addAttribute("list", comCodeService.selectComCodeList(vo));

		return "jsonView";
	}

	/**
	 * 코드 그룹
	 *
	 * @param request
	 * @param vo
	 * @param model
	 * @return @
	 */
	/*
	 * @RequestMapping(value = "/com/code_com_grp.do", method = { RequestMethod.POST
	 * , RequestMethod.GET })
	 */
	public String code_com_grp(HttpServletRequest request, ComCodeVO vo, ModelMap model) {

		model.addAttribute("list", comCodeService.selectComGrpList());

		return "jsonView";
	}

	/**
	 * 상위부서 코드 검색
	 *
	 * @param request
	 * @param vo
	 * @param model
	 * @return @
	 */
	/*
	 * @RequestMapping(value = "/com/dept_up_code_list.do", method = {
	 * RequestMethod.POST , RequestMethod.GET })
	 */
	public String dept_up_code_list(HttpServletRequest request, ComCodeVO vo, ModelMap model) {

		model.addAttribute("list", comCodeService.selectDeptUpList(vo));

		return "jsonView";
	}

	/**
	 * 부서 코드 검색
	 *
	 * @param request
	 * @param vo
	 * @param model
	 * @return @
	 */
	/*
	 * @RequestMapping(value = "/com/dept_code_list.do", method = {
	 * RequestMethod.POST , RequestMethod.GET })
	 */
	public String dept_code_list(HttpServletRequest request, ComCodeVO vo, ModelMap model) {

		model.addAttribute("list", comCodeService.selectDeptList(vo));

		return "jsonView";
	}

	/**
	 * 사용자 검색
	 *
	 * @param request
	 * @param vo
	 * @param model
	 * @return @
	 */
	/*
	 * @RequestMapping(value = "/com/user_list.do", method = { RequestMethod.POST ,
	 * RequestMethod.GET })
	 */
	public String user_list(HttpServletRequest request, ComCodeVO vo, ModelMap model) {

		model.addAttribute("list", comCodeService.selectUserList(vo));

		return "jsonView";
	}

	/**
	 * 업체 정보 검색
	 *
	 * @param request
	 * @param vo
	 * @param model
	 * @return @
	 */
	/*
	 * @RequestMapping(value = "/com/cust_list.do", method = { RequestMethod.POST ,
	 * RequestMethod.GET })
	 */
	public String cust_list(HttpServletRequest request, ComCodeVO vo, ModelMap model) {

		model.addAttribute("list", comCodeService.selectCustList(vo));

		return "jsonView";
	}

	/**
	 * 부서 정보 검색
	 *
	 * @param request
	 * @param vo
	 * @param model
	 * @return @
	 */
	/*
	 * @RequestMapping(value = "/com/dept_list.do", method = { RequestMethod.POST ,
	 * RequestMethod.GET })
	 */
	public String dept_list(HttpServletRequest request, ComCodeVO vo, ModelMap model) {

		// model.addAttribute("list", comCodeService.selectDeptList(vo));

		model.addAttribute("list", DeptConfUtil.getInstance().getCodeList(vo.getDeptId(), "LVL3"));

		return "jsonView";
	}

	/**
	 * 상위 부서 정보 검색
	 *
	 * @param request
	 * @param vo
	 * @param model
	 * @return @
	 */
	/*
	 * @RequestMapping(value = "/com/dept_up_list.do", method = { RequestMethod.POST
	 * , RequestMethod.GET })
	 */
	public String up_dept_list(HttpServletRequest request, ComCodeVO vo, ModelMap model) {

		// model.addAttribute("list", comCodeService.selectDeptUpList(vo));

		model.addAttribute("list", DeptConfUtil.getInstance().getCodeList("", "LVL2"));
		// DeptConfUtil.getCodeList("", "LVL2");

		return "jsonView";
	}

	/**
	 * 직급 정보 검색
	 *
	 * @param request
	 * @param vo
	 * @param model
	 * @return @
	 */
	/*
	 * @RequestMapping(value = "/com/posi_list.do", method = { RequestMethod.POST ,
	 * RequestMethod.GET })
	 */
	public String posi_list(HttpServletRequest request, ComCodeVO vo, ModelMap model) {

		model.addAttribute("list", comCodeService.selectPosiList(vo));

		return "jsonView";
	}

	/**
	 * 권한 검색
	 *
	 * @param request
	 * @param vo
	 * @param model
	 * @return @
	 */
	/*
	 * @RequestMapping(value = "/com/auth_list.do" , method = { RequestMethod.POST ,
	 * RequestMethod.GET })
	 */
	public String code_list(HttpServletRequest request, ComCodeVO vo, ModelMap model) {

		model.addAttribute("list", comCodeService.selectAuthList(vo));

		return "jsonView";
	}

	/**
	 * 직위 정보 검색
	 *
	 * @param request
	 * @param vo
	 * @param model
	 * @return @
	 */
	/*
	 * @RequestMapping(value = "/com/jicwi_list.do" , method = { RequestMethod.POST
	 * , RequestMethod.GET })
	 */
	public String jicwi_list(HttpServletRequest request, ModelMap model) {

		model.addAttribute("list", comCodeService.selectJicwiList());

		return "jsonView";
	}

	/**
	 * 부서선택 팝업 부서리스트 조회
	 *
	 * @param request
	 * @param vo
	 * @param model
	 * @return @
	 */
	/*
	 * @RequestMapping(value = "/com/pop_dept_list.do" , method = {
	 * RequestMethod.POST , RequestMethod.GET })
	 */
	public String pop_dept_list(HttpServletRequest request, ModelMap model) {

		model.addAttribute("list", comCodeService.selectPopupDeptList());

		return "jsonView";
	}

}
