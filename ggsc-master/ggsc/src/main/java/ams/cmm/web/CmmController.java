package ams.cmm.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ams.cmm.PageEditVO;
import ams.cmm.service.CmmService;

@Controller

public class CmmController {

	@Resource(name = "cmmService")
	private CmmService cmmService;

	/**
	 * 페이지 상세설명 가져오기
	 *
	 * @param request
	 * @param vo
	 * @param model
	 * @return @
	 */
	@RequestMapping(value = "/cmm/pageData.do", method = RequestMethod.GET)
	public String pageData(HttpServletRequest request, PageEditVO vo, ModelMap model) {

		model.addAttribute("pageData", cmmService.selectPageData(vo));

		return "jsonView";
	}

	/**
	 * 페이지 상세설명 수정
	 *
	 * @param request
	 * @param vo
	 * @param model
	 * @return @
	 */
	@RequestMapping(value = "/cmm/mergePageData.do", method = RequestMethod.GET)
	public String mergePageData(HttpServletRequest request, PageEditVO vo, ModelMap model) {

		model.addAttribute("result", cmmService.mergePageData(vo));

		return "jsonView";
	}

}
