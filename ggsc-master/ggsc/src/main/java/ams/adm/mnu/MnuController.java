package ams.adm.mnu;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ams.adm.mnu.MnuServiceImpl;
import ams.adm.mnu.MnuVO;



@Controller

public class MnuController {
	
	
	@Resource(name = "mnuService")
	private MnuServiceImpl mnuService;


	
	
	
	@RequestMapping(value = "/mnuList.do", method = RequestMethod.GET)
	public String mnuList(MnuVO vo, HttpServletRequest request, ModelMap model){	
		model.addAttribute("vo", vo);
		return "adm/mnu/mnuList.main";
	}

	@RequestMapping(value = "/mnuDtl.do", method = RequestMethod.GET)
	public String mnuDtl(MnuVO vo, HttpServletRequest request, ModelMap model){	
		model.addAttribute("vo", vo);
		return "adm/mnu/mnuDtl.main";
	}

	@RequestMapping(value = "/mnuListAjax.do", method = RequestMethod.POST)
	public String mnuListAjax( MnuVO vo , HttpServletRequest request , ModelMap model ) {
		model.addAttribute("list", mnuService.mnuList(vo) );
		vo.setRowsCnt( mnuService.mnuListCnt(vo) ) ;
		model.addAttribute("vo", vo);
		return "jsonView";
	}
	
	@RequestMapping(value = "/mnuDtlAjax.do", method = RequestMethod.POST)
	public String mnuDtlAjax(MnuVO vo, HttpServletRequest request, ModelMap model){
		model.addAttribute("list", mnuService.mnuDtl(vo) );
		return "jsonView";
	}

	@RequestMapping(value = "/mnuDelAjax.do", method = RequestMethod.POST)
	public String mnuDelAjax(HttpServletRequest request, ModelMap model, @ModelAttribute("mnuVO") MnuVO vo ){
		mnuService.delMnu(vo);
		return "jsonView";
	}

	@RequestMapping(value = "/mnuInsAjax.do", method = RequestMethod.POST)
	public String mnuInsAjax(HttpServletRequest request, ModelMap model, @ModelAttribute("mnuVO") MnuVO vo ){
		mnuService.insMnu(vo);
		return "jsonView";
	}
	
	@RequestMapping(value = "/mnuUpdAjax.do", method = RequestMethod.POST)
	public String mnuUpdAjax(HttpServletRequest request, ModelMap model, @ModelAttribute("mnuVO") MnuVO vo ){
		mnuService.updMnu(vo);
		return "jsonView";
	}
	
	@RequestMapping(value = "/hMnuListAjax.do", method = RequestMethod.POST)
	public String hMnuListAjax( MnuVO vo , HttpServletRequest request , ModelMap model ) {
		model.addAttribute("hMnuList", mnuService.hMnuList(vo) );
		model.addAttribute("vo", vo);
		return "jsonView";
	}
	
	
	

	
	
	
	



//			EgovMap loginVO = null;
//			if (request.getSession().getAttribute("LoginVO") != null) {
//				loginVO = (EgovMap) request.getSession()
//						.getAttribute("LoginVO");
//				model.addAttribute("mnuVO", loginVO);
//			} else {
//				return AMSComm.logoutProcBySvNm(request);
//			}



}
