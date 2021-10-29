package ams.adm.code;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ams.adm.code.CodeServiceImpl;
import ams.adm.code.CodeVO;



@Controller
public class CodeController {
	
	
	@Resource(name = "codeService")
	private CodeServiceImpl codeService;


	
	
	
	@RequestMapping(value = "/codeList.do", method = RequestMethod.GET )
	public String codeList(CodeVO vo, HttpServletRequest request, ModelMap model){	
		model.addAttribute("vo", vo);
		return "adm/code/codeList.main";
	}

	@RequestMapping(value = "/codeDtl.do", method = RequestMethod.GET )
	public String codeDtl(CodeVO vo, HttpServletRequest request, ModelMap model){
		model.addAttribute("vo", vo);
		return "adm/code/codeDtl.main";
	}

	@RequestMapping(value = "/codeListAjax.do", method = RequestMethod.POST )
	public String codeListAjax( CodeVO vo , HttpServletRequest request , ModelMap model ) {
		model.addAttribute("list", codeService.codeList(vo) );
		vo.setRowsCnt( codeService.codeListCnt(vo) ) ;
		model.addAttribute("vo", vo);
		return "jsonView";
	}
	
	@RequestMapping(value = "/codeDtlAjax.do", method = RequestMethod.POST )
	public String codeDtlAjax(CodeVO vo, HttpServletRequest request, ModelMap model){
		model.addAttribute("list", codeService.codeDtl(vo) );
		return "jsonView";
	}

	@RequestMapping(value = "/codeDelAjax.do", method = RequestMethod.POST )
	public String codeDelAjax(HttpServletRequest request, ModelMap model, @ModelAttribute("codeVO") CodeVO vo ){
		codeService.delCode(vo);
		return "jsonView";
	}

	@RequestMapping(value = "/codeInsAjax.do", method = RequestMethod.POST)
	public String codeInsAjax(HttpServletRequest request, ModelMap model, @ModelAttribute("codeVO") CodeVO vo ){
		codeService.insCode(vo);
		return "jsonView";
	}
	
	@RequestMapping(value = "/codeUpdAjax.do", method = RequestMethod.POST )
	public String codeUpdAjax(HttpServletRequest request, ModelMap model, @ModelAttribute("codeVO") CodeVO vo ){
		codeService.updCode(vo);
		return "jsonView";
	}
	
	
	

	
	
	
	



//			EgovMap loginVO = null;
//			if (request.getSession().getAttribute("LoginVO") != null) {
//				loginVO = (EgovMap) request.getSession()
//						.getAttribute("LoginVO");
//				model.addAttribute("codeVO", loginVO);
//			} else {
//				return AMSComm.logoutProcBySvNm(request);
//			}



}
